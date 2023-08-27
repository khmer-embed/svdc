<?php

namespace App\Http\Controllers;

use App\Models\Telegramalert;
use Illuminate\Http\Request;
use Validator;
use DB;

use App\Models\User;
use App\Models\Question;
use App\Models\Location;
use App\Models\Request_history;
use App\Models\Request_score;
use Carbon\Carbon;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\DB as FacadesDB;
use Illuminate\Support\Facades\Schema;
use App\Notifications\SendNotification;

class TelegramalertController extends Controller
{
    //
    private $obj_info = ['name' => 'telegramalert', 'routing' => 'admin.controller', 'title' => 'endpoint', 'icon' => '<i class="fas fa-list"></i>'];
    public $args;

    private $model;
    private $submodel;
    private $tablename;
    private $columns = [];
    private $fprimarykey = 'id';
    private $protectme = null;
    public $dflang;
    private $rcdperpage = -1; #record per page, set zero to get all record# set -1 to use default
    private $users;
    private $koboform_id;

    /**
     * Create a new controller instance.
     *
     * @return void
     */
    public function __construct(array $args = [])
    {
        //$this->middleware('auth');
        $this->obj_info['title'] = 'Telegram Alert'; //__('label.lb09');
        // $this->koboform_id = config('me.kobo.form4');

        $default_protectme = config('me.app.protectme');
        $this->protectme = [
            'display' => 'yes',
            'group' => [],
            'object' => [$this->obj_info['name']],
            'method'  => [
                // 'index' => $default_protectme['index'],
                // // 'edit' => $default_protectme['edit'],
                // 'edit' => $default_protectme['edit'],
                // 'print' => ['cover' => ['print'], 'title' => 'Print'],
                // // '_edit' => ['cover' => ['_edit'], 'title' => 'Score'],
                // 'request' => ['cover' => ['request'], 'title' => 'Request Score'],
                // 'downloadxls' => ['cover' => ['downloadxls'], 'title' => 'downloadxls'],
            ]
        ];

        $this->args = $args;
        $this->model = new Telegramalert;
        $this->tablename = $this->model->gettable();
        $this->dflang = df_lang();

        /*column*/
        $tbl_columns = getTableColumns($this->tablename);
        //dd($tbl_columns);
        foreach ($tbl_columns as $column) {
            //tbl
            if (strpos($column, 'tbl') !== false) {
                array_push($this->columns, $column);
            }
        }
        natsort($this->columns);
        // dd($this->columns);
        // request()->session()->forget('ref_check');
    }

    public function getters($property)
    {
        if (property_exists($this, $property)) {
            return $this->$property;
        }
        return null;
    }

    public function setters($property, $value)
    {
        if (property_exists($this, $property)) {
            $this->$property = $value;
        }
    }

    public function default()
    {
        $question_result = Question::join('team_xlsform', 'questions.team_xlsform_id', '=', 'team_xlsform.id')
            ->join('xlsforms', 'team_xlsform.xlsform_id', '=', 'xlsforms.id')
            ->select(DB::raw('LOWER(name) as name'), DB::raw("JSON_UNQUOTE(JSON_EXTRACT(label,'$." . $this->dflang[0] . "')) AS label"), "hint", "required", "validation")
            ->where("kobo_id", $this->koboform_id)->get();
        $question = [];
        if (!$question_result->isEmpty()) {
            $question = $question_result->keyBy('name')->toArray();
        }
        /*location*/
        $location = Location::getlocation($this->dflang[0])->get();
        $provinces = $location->pluck('title', 'id')->toArray();
        // dd($question);

        return [
            'question' => $question,
            'provinces' => $provinces,
        ];
    } /*../function..*/

    public function filterCondition($value, $filterValue)
    {
        $userinfo = $this->args['userinfo'];

        $permission_id = $userinfo['permission_id'];
        $condition = $filterValue . " <> '0'";
        if ($permission_id > 1 && !empty($userinfo[$value])) {

            $condition = $filterValue . ' in (' . $userinfo[$value] . ')';
        }
        return $condition;
    }

    // end function 

    public function listingModel()
    {


        #DEFIND MODEL#
        return $this->model

            ->select(

                $this->tablename . ".*"

            )
            // ->whereRaw($formuse)
            // ->whereRaw($formtype)
        ;
    } /*../function..*/
    //JSON_UNQUOTE(JSON_EXTRACT(title, '$.".$this->dflang[0]."'))

    public function sfp($request, $results)
    {
        #Sort Filter Pagination#

        // CACHE SORTING INPUTS
        $allowed = array('title', $this->fprimarykey);
        $sort = in_array($request->input('sort'), $allowed) ? $request->input('sort') : $this->fprimarykey;
        $order = $request->input('order') === 'desc' ? 'asc' : 'desc';
        $results = $results->orderby($sort, $order);

        // FILTERS
        $appends = [];
        $querystr = [];
        $districts = [];
        $communes = [];

        if ($request->has('txt') && !empty($request->input('txt'))) {
            $qry = $request->input('txt');
            $results = $results->where(function ($query) use ($qry) {
                $query->whereRaw("resp_name like '%" . $qry . "%'")
                    ->orwhereRaw("inter_name like '%" . $qry . "%'");
            });
            array_push($querystr, 'txt=' . $qry);
            $appends = array_merge($appends, ['txt' => $qry]);
        }



        // PAGINATION and PERPAGE
        $perpage = null;
        $perpage_query = [];
        if ($request->has('perpage')) {
            $perpage = $request->input('perpage');
            $perpage_query = ['perpage=' . $perpage];
            $appends = array_merge($appends, ['perpage' => $perpage]);
        } elseif (null !== $this->rcdperpage && $this->rcdperpage != 0) {
            $perpage = $this->rcdperpage < 0 ? config('me.app.rpp') ?? 20 : $this->rcdperpage;
        }
        if (null !== $perpage) {
            $results = $results->paginate($perpage);
        }

        $appends = array_merge(
            $appends,
            [
                'sort'      => $request->input('sort'),
                'order'     => $request->input('order')
            ]
        );

        $pagination = $results->appends(
            $appends
        );

        // dd($pagination);
        $recordinfo = recordInfo($pagination->currentPage(), $pagination->perPage(), $pagination->total());

        return [
            'results'           => $results,
            'paginationlinks'    => $pagination->links("pagination::bootstrap-4"),
            'recordinfo'    => $recordinfo,
            'sort'          => $sort,
            'order'         => $order,
            'querystr'      => $querystr,
            'perpage_query' => $perpage_query,
            'districts'     => $districts,
            'communes'      => $communes,
        ];
    } /*../function..*/

    /**
     * Show the application dashboard.
     *
     * @return \Illuminate\Contracts\Support\Renderable
     */
    public function index(Request $request, $condition = [], $setting = [])
    {
        // dd($this->dflang);
        $default = $this->default();
        // dd($default);
        // $provinces = $default['provinces'];

        $results = $this->listingmodel();
        $sfp = $this->sfp($request, $results);
        // dd($sfp);

        //return \Redirect::to('/test/index');
        $create_route = url_builder(
            $this->obj_info['routing'],
            [
                $this->obj_info['name'], 'create', ''
            ],
        );

        $trash_route = url_builder(
            $this->obj_info['routing'],
            [
                $this->obj_info['name'], 'trash', ''
            ],
        );

        return view('app.' . $this->obj_info['name'] . '.index')
            ->with([
                'obj_info'  => $this->obj_info,
                'route' => [
                    'create'  => $create_route,
                    'trash' => $trash_route
                ],
                'userinfo' => $this->args['userinfo'],
                'fprimarykey'     => $this->fprimarykey,
                'caption' => 'Active',
            ])
            ->with(['act' => 'index'])
            ->with($sfp)
            ->with($setting);
    }

    public function trash(Request $request, $condition = [], $setting = [])
    {
    }

    public function validator($request, $isupdate = false)
    {
        $update_rules = [$this->fprimarykey => 'required'];

        $rules['table_name'] = ['required', 'unique:' . $this->tablename . ',table_name',];
        $validatorMessages = [
            /*'required' => 'The :attribute field can not be blank.'*/
            'required' => __('ccms.fieldreqire'),
            'in' => __('ccms.check_score'),
        ];

        if ($isupdate) {
            $rules = array_merge($rules, $update_rules);
        }
        return Validator::make($request->input(), $rules, $validatorMessages);
    }

    public function setinfo($request, $isupdate = false)
    {
        $newid = ($isupdate) ? $request->input($this->fprimarykey)  : $this->model->max($this->fprimarykey) + 1;
        $tableData = [];
        $tableData = [
            $this->fprimarykey => $newid,
            'table_name' => !empty($request->input('table_name')) ? trim($request->input('table_name')) : '',
            'json' => '',
            'trash' => 'no',
        ];
        return ['tableData' => $tableData, 'id' => $newid];
    }

    public function create()
    {
        // dd(Auth()->user()->api_token);
        $sumit_route = url_builder(
            $this->obj_info['routing'],
            [$this->obj_info['name'], 'store', ''],
            [],
        );


        $cancel_route = redirect()->back()->getTargetUrl();
        return view('app.' . $this->obj_info['name'] . '.create')
            ->with([
                'obj_info'  => $this->obj_info,
                'route' => ['submit'  => $sumit_route, 'cancel' => $cancel_route],
                'form' => ['save_type' => 'save'],
                'fprimarykey'     => $this->fprimarykey,
                'caption' => 'New',
                'isupdate' => false,
                'token' => '1|4ddXojpcjWOY1a5jsCqyaP18vB7ABovg4mlo8UOQ',

            ]);
    } /*../function..*/

    public function store(Request $request)
    {
        $data = [];
        $obj_info = $this->obj_info;
        $routing = url_builder($obj_info['routing'], [$obj_info['name'], 'create']);
        if ($request->isMethod('post')) {
            $validate = $this->validator($request, false);
            if ($validate->fails()) {
                return response()
                    ->json(
                        [
                            "type" => "validator",
                            'status' => false,
                            "message" => __('dev.forminvalid'),
                            "data" => $validate->errors()
                        ],
                        422
                    );
            }
            $data = $this->setinfo($request);
            // dd($data);
            return $this->proceed_store($request, $data, $obj_info);
        }
    }
    /* end function*/
    function proceed_store($request, $data, $obj_info)
    {
        $save_status = $this->model->insert($data['tableData']);
        if ($save_status) {
            $savetype = strtolower($request->input('savetype'));
            $success_ms = __('dev.suc_save');
            return response()
                ->json(
                    [
                        "type" => "success",
                        "status" => $save_status,
                        "message" => 'Success',
                        "data" => []
                    ],
                    200
                );
        }
        return response()
            ->json(
                [
                    "type" => "error",
                    'status' => false,
                    "message" => 'Save is false',
                    "data" => []
                ],
                422
            );
    }
    /* end function*/

    public function edit(Request $request, $id = 0)
    {

        #prepare for back to url after SAVE#
        if (!$request->session()->has('backurl')) {
            $request->session()->put('backurl', redirect()->back()->getTargetUrl());
        }

        $obj_info = $this->obj_info;

        $default = $this->default();
        $question = $default['question'];
        $provinces = $default['provinces'];
        $columns = $this->columns;
        $input = null;

        #Retrieve Data#
        if (empty($id)) {
            $editid = $this->args['routeinfo']['id'];
        } else {
            $editid = $id;
        }

        if ($request->has($this->fprimarykey)) {
            $editid = $request->input($this->fprimarykey);
        }

        $input = $this->model->where($this->fprimarykey, (int)$editid)->where('trash', '<>', 'yes')->get();
        if ($input->isEmpty()) {
            $routing = url_builder($obj_info['routing'], [$obj_info['name'], 'index']);
            return response()
                ->json(
                    [
                        "type" => "url",
                        'route' => ['url' => $routing],
                        'status' => false,
                        "message" => __('ccms.fail_update'),
                        "data" => []
                    ],
                    422
                );
        }

        $input = $input->toArray()[0];
        $x = [];
        foreach ($input as $key => $value) {
            $x[$key] = $value;
        }
        $input = $x;
        // dd($input);

        $sumit_route = url_builder(
            $this->obj_info['routing'],
            [$this->obj_info['name'], 'update', ''],
            [],
        );
        $cancel_route = redirect()->back()->getTargetUrl();

        $print_route = url_builder(
            $this->obj_info['routing'],
            [$this->obj_info['name'], 'print', $editid],
            [],
        );
        // $userinfo = $this->args['userinfo'];
        // dd($userinfo);
        $edit = false;
        if ($this->args['userinfo']['permission_id'] > 1) {
            $edit = checkpermission('form4-_edit', $this->args['userinfo']);
        }
        // dd($edit);

        $districts = [];
        $where = [['trash', '<>', 'yes'], ['parent_id', '=', $input['province'] ?? -1]];
        $location = Location::getlocation($this->dflang[0], $where)->get();
        $districts = $location->pluck('title', 'id')->toArray();
        $communes = [];
        $where = [['trash', '<>', 'yes'], ['parent_id', '=', $input['district'] ?? -1]];
        $location = Location::getlocation($this->dflang[0], $where)->get();
        $communes = $location->pluck('title', 'id')->toArray();

        return view('app.' . $this->obj_info['name'] . '.create', compact(['question', 'provinces', 'districts', 'communes', 'columns']))
            ->with([
                'obj_info'  => $this->obj_info,
                'route' => ['submit'  => $sumit_route, 'print' => $print_route, 'cancel' => $cancel_route],
                'form' => ['save_type' => 'save'],
                'fprimarykey'     => $this->fprimarykey,
                'caption' => 'Edit',
                'istrush' => false,
                'input' => $input,
                'edit_permission' => $edit,
            ]);
    } /*../end fun..*/

    public function update(Request $request)
    {
        $obj_info = $this->obj_info;
        $routing = url_builder($obj_info['routing'], [$obj_info['name'], 'create']);
        if ($request->isMethod('post')) {
            $validator = $this->validator($request, true);
            // dd($validator);

            if ($validator->fails()) {

                $routing = url_builder($obj_info['routing'], [$obj_info['name'], 'create']);
                return response()
                    ->json(
                        [
                            "type" => "validator",
                            'status' => false,
                            'route' => ['url' => $routing],
                            "message" => __('ccms.fail_save'),
                            "data" => $validator->errors()
                        ],
                        422
                    );
            }

            $data = $this->setinfo($request, true);
            return $this->proceed_update($request, $data, $obj_info);
        } /*end if is post*/

        return response()
            ->json(
                [
                    "type" => "error",
                    "message" => __('ccms.fail_save'),
                    "data" => []
                ],
                422
            );
    }/*../end fun..*/

    function proceed_update($request, $data, $obj_info)
    {

        $update_status = $this->model
            ->where($this->fprimarykey, $data['id'])
            ->update($data['tableData']);

        if ($update_status) {
            $savetype = strtolower($request->input('savetype'));
            $id = $data['id'];
            $rout_to = save_type_route($savetype, $obj_info, $id);
            $success_ms = __('ccms.suc_save');
            $callback = '';
            if (is_axios()) {
                $callback = $request->input('jscallback');
            }
            return response()
                ->json(
                    [
                        "type" => "success",
                        "status" => $update_status,
                        "message" => $success_ms,
                        "route" => $rout_to,
                        "callback" => $callback,
                        "data" => [
                            $this->fprimarykey => $data['id'],
                            'id' => $data['id']
                        ]
                    ],
                    200
                );
        }
        return response()
            ->json(
                [
                    "type" => "error",
                    'status' => false,
                    "message" => __('ccms.fail_update'),
                    "data" => []
                ],
                422
            );
    }
    /* end function*/

    public function totrash(Request $request, $id = 0)
    {
    }

    public function senttelegram(Request $request, $info=[])
    {
        $user = new User();
        $user->notify(new SendNotification($info));
    }

    public function alert(Request $request, $id = 0)
    {
        
        $location = Location::getlocation($this->dflang[0], [['trash','<>','yes']])->get();
        $location = $location->pluck('title', 'id')->toArray();
        $json_content = $request->getContent();
        // $json_content = '{"_id":651,"gIndic\/tbl4010":"5","username":"demo_dcx","gIndic\/tbl4012":"5","gIndic\/tbl4011":"5","meta\/audit":"audit.csv","_uuid":"78bd2d2b-cfe6-40a4-9957-7e6d834e9927","gGeo\/Commune":"31307","_notes":[],"Tend":"2022-03-21T15:26:07.568+07:00","_submitted_by":"demo_dcx","gGeo\/Province":"3","gGeo\/Inter_name":"Dane","Tstart":"2022-03-21T15:25:20.111+07:00","_xform_id_string":"aHKrr893ymKnt3sRBcNpGQ","Ttoday":"2022-03-21","meta\/instanceID":"uuid:78bd2d2b-cfe6-40a4-9957-7e6d834e9927","_status":"submitted_via_web","formhub\/uuid":"12207474889c44fcb425639dc0cd61eb","gIndic\/tbl406":"5","gIndic\/tbl407":"3","gIndic\/tbl404":"5","gIndic\/tbl405":"4","gIndic\/tbl402":"5","gIndic\/tbl403":"5","gIndic\/tbl401":"5","gGeo\/Date":"2022-03-21","_submission_time":"2022-03-21T08:26:13","gGeo\/Round":"1st Round","gIndic\/tbl408":"5","gIndic\/tbl409":"5","_attachments":[{"mimetype":"text\/comma-separated-values","download_small_url":"https:\/\/kc.datasciencedcx.org\/media\/small?media_file=demo_dcx%2Fattachments%2F12207474889c44fcb425639dc0cd61eb%2F78bd2d2b-cfe6-40a4-9957-7e6d834e9927%2Faudit.csv","download_large_url":"https:\/\/kc.datasciencedcx.org\/media\/large?media_file=demo_dcx%2Fattachments%2F12207474889c44fcb425639dc0cd61eb%2F78bd2d2b-cfe6-40a4-9957-7e6d834e9927%2Faudit.csv","download_url":"https:\/\/kc.datasciencedcx.org\/media\/original?media_file=demo_dcx%2Fattachments%2F12207474889c44fcb425639dc0cd61eb%2F78bd2d2b-cfe6-40a4-9957-7e6d834e9927%2Faudit.csv","filename":"demo_dcx\/attachments\/12207474889c44fcb425639dc0cd61eb\/78bd2d2b-cfe6-40a4-9957-7e6d834e9927\/audit.csv","instance":651,"download_medium_url":"https:\/\/kc.datasciencedcx.org\/media\/medium?media_file=demo_dcx%2Fattachments%2F12207474889c44fcb425639dc0cd61eb%2F78bd2d2b-cfe6-40a4-9957-7e6d834e9927%2Faudit.csv","id":538,"xform":81}],"gGeo\/Resp_name":"Phea","_geolocation":[null,null],"deviceid":"collect:IgNJUkOdpdAWZBM0","_validation_status":[],"gGeo\/District":"313","__version__":"vLjyC5FBWfhY7HaxxpmABB","_tags":[]}';
        $apidata = json_decode($json_content, true);
        // dd($apidata);
        if (empty($apidata)) {
            return response()
                ->json(
                    [
                        'status' => false,
                        "message" => 'Data is empty',
                    ],
                    422
                );
        }
       
        $labels = [];
        $question_scores = [];
        foreach ($apidata as $key => $value) {
            if (strpos($key, '/') !== 0) {
                $gs = explode('/', $key);
                //$key = $gs[1] ?? $gs[0]; // old
                $key = last($gs);
                $label = isset($translations[$key]) && !empty($translations[$key]) ? $translations[$key] : $key;
            } else {
                $label = isset($translations[$key]) && !empty($translations[$key]) ? $translations[$key] : $key;
            }
            if (is_array($value)) {
                $value = json_encode($value, JSON_THROW_ON_ERROR);
            } else {
                $value = isset($translations[$value]) && !empty($translations[$value]) ? $translations[$value] : $value;
            }

            $labels[] = $label;

            if (is_array($value)) {
                $value = json_encode($value, JSON_THROW_ON_ERROR);
            } else {
                $value = isset($translations[$value]) && !empty($translations[$value]) ? $translations[$value] : $value;
            }

           

            $dataTable[strtolower($label)] = $value;
        }
        
        $telegraminfo = [];
        foreach ($labels as $key => $value) {
            /* get data for send to telegram*/
            if (str_contains($value, 'name_interview')) {
                $telegraminfo['name_interview'] = $dataTable[$value];
            }
            else{
                $telegraminfo['name_interview'] = $dataTable['username'];
                
            }

            if (str_contains($value, 'province')) {
                $telegraminfo['province'] = $location[$dataTable[$value]]??'';
            }

            if (str_contains($value, 'district')) {
                $telegraminfo['district'] = $location[$dataTable[$value]]??'';
            }

            if (str_contains($value, 'commune')) {
                $telegraminfo['commune'] = $location[$dataTable[$value]]??'';
            }

            if (str_contains($value, 'village')) {
                $telegraminfo['village'] = $location[$dataTable[$value]]??'';
            }
            

        }
        $this->senttelegram($request, $telegraminfo);
        // return "New record created successfully";

    }

    /*---for mobile api */
}
