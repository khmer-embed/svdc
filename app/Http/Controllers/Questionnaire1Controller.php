<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use Validator;
use DB;

use App\Models\Form4;
use App\Models\Question;
use App\Models\Location;
use App\Models\Questionnaire1;
use App\Models\Request_history;
use App\Models\Request_score;
use Carbon\Carbon;

class Questionnaire1Controller extends Controller
{
    //
    private $obj_info = ['name' => 'questionnaire1', 'routing' => 'admin.controller', 'title' => '', 'icon' => '<i class="fas fa-list"></i>'];
    public $args;

    private $model;
    private $submodel;
    private $tablename;
    private $columns = [];
    private $fprimarykey = 'questionnaire1_id';
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
        $this->obj_info['title'] = __('dev.menu4') . ' (' . __('dev.table4') . ')'; //__('label.lb09');
        $this->koboform_id = config('dev.kobo.questionnaire1');

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
        $this->model = new Questionnaire1;
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

        // dd($question);

        return [
            'question' => $question,

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
        // $x = filterCondition1('ncdd_form4', ["formtype", "formuse", "userlevel", "province", "district", "commune"], $this->args['userinfo']);



        #DEFIND MODEL#
        return $this->model
            ->join('team_xlsform', 'questionnaire1._xform_id_string', '=', 'team_xlsform.kobo_id')
            ->join('xlsforms', 'team_xlsform.xlsform_id', '=', 'xlsforms.id')

            ->select(

                "questionnaire1.*",
                "xlsforms.title as title",


            );
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

        if ($request->has('round') && !empty($request->input('round'))) {
            $qry = (int)$request->input('round');
            $results = $results->where("round", $qry);

            array_push($querystr, 'round=' . $qry);
            $appends = array_merge($appends, ['round' => $qry]);
        }

        if ($request->has('phase') && !empty($request->input('phase'))) {
            $qry = (int)$request->input('phase');
            $results = $results->where("phase", $qry);

            array_push($querystr, 'phase=' . $qry);
            $appends = array_merge($appends, ['phase' => $qry]);
        }

        if ($request->has('province') && !empty($request->input('province'))) {
            $qry = (int)$request->input('province');
            $results = $results->where("province", $qry);

            array_push($querystr, 'province=' . $qry);
            $appends = array_merge($appends, ['province' => $qry]);

            $where = [['trash', '<>', 'yes'], ['parent_id', '=', $qry ?? -1]];
            $location = Location::getlocation($this->dflang[0], $where)->get();
            $districts = $location->pluck('title', 'id')->toArray();
        }

        if ($request->has('district') && !empty($request->input('district'))) {
            $qry = (int)$request->input('district');
            $results = $results->where("district", $qry);

            array_push($querystr, 'district=' . $qry);
            $appends = array_merge($appends, ['district' => $qry]);

            $where = [['trash', '<>', 'yes'], ['parent_id', '=', $qry ?? -1]];
            $location = Location::getlocation($this->dflang[0], $where)->get();
            $communes = $location->pluck('title', 'id')->toArray();
        }

        if ($request->has('commune') && !empty($request->input('commune'))) {
            $qry = (int)$request->input('commune');
            $results = $results->where("commune", $qry);

            array_push($querystr, 'commune=' . $qry);
            $appends = array_merge($appends, ['commune' => $qry]);
        }
        if ($request->has('userlevel') && !empty($request->input('userlevel'))) {
            $qry = $request->input('userlevel');
            $results = $results->where("ncdd_form4.userlevel", $qry);
            array_push($querystr, 'userlevel=' . $qry);
            $appends = array_merge($appends, ['userlevel' => $qry]);
        }
        if ($request->has('formtype') && !empty($request->input('formtype'))) {
            $qry = $request->input('formtype');
            $results = $results->where("ncdd_form4.formtype", $qry);
            array_push($querystr, 'formtype=' . $qry);
            $appends = array_merge($appends, ['formtype' => $qry]);
        }
        if ($request->has('formuse') && !empty($request->input('formuse'))) {
            $qry = $request->input('formuse');
            $results = $results->where("ncdd_form4.formuse", $qry);
            array_push($querystr, 'formuse=' . $qry);
            $appends = array_merge($appends, ['formuse' => $qry]);
        }
        if ($request->has('year') && !empty($request->input('year'))) {
            $qry = $request->input('year');
            $results = $results->where("ncdd_form4.year", $qry);
            array_push($querystr, 'year=' . $qry);
            $appends = array_merge($appends, ['year' => $qry]);
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


        $results = $this->listingmodel();
        $sfp = $this->sfp($request, $results);
        dd($sfp);

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

        return view('app.' . $this->obj_info['name'] . '.index', compact(['provinces']))
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

        $default = $this->default();
        $question = $default['question'];
        // dd($question);

        $rules['date']      = 'required';
        $rules['inter_name']      = 'required';
        $rules['round']      = 'required';
        $rules['phase']      = 'required';
        $rules['resp_name']      = 'required';
        $rules['province']      = 'required';
        $rules['district']      = 'required';
        $rules['commune']      = 'required';
        // foreach($this->columns as $column){
        //     $rules[$column]      = 'required';
        // }


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
        $date = !empty($request->input('date')) ? date("Y-m-d", strtotime($request->input('date'))) : date("Y-m-d");

        $tableData = [

            $this->fprimarykey => $newid,
            'date'     => $date,
            'inter_name'    => !empty($request->input('inter_name')) ? $request->input('inter_name') : '',
            'round' =>  !empty($request->input('round')) ? $request->input('round') : '1st Round',
            'phase' =>  !empty($request->input('phase')) ? $request->input('phase') : '1',
            'resp_name'  => !empty($request->input('resp_name')) ? $request->input('resp_name') : '',
            'province'       => !empty($request->input('province')) ? $request->input('province') : 0,
            'district'  => !empty($request->input('district')) ? $request->input('district') : 0,
            'commune'  => !empty($request->input('commune')) ? $request->input('commune') : 0,
            'userlevel'  => !empty($request->input('userlevel')) ? $request->input('userlevel') : '',
            'formtype'  => !empty($request->input('formtype')) ? $request->input('formtype') : '',
            'formuse'  => !empty($request->input('formuse')) ? $request->input('formuse') : '',
            'year'  => !empty($request->input('year')) ? $request->input('year') : '',
        ];

        /*update score/percentage*/
        /*get all score for totalScore and Percentage*/
        $question_scores = [];
        foreach ($this->columns as $column) {
            $score = !empty($request->input($column)) ? $request->input($column) : 0;
            $tableData[$column] = $score;
            array_push($question_scores, $score);
        }



        $tableData['score'] = $cal_score['score'];
        $tableData['percentage'] = $cal_score['percentage'];

        return ['tableData' => $tableData, 'id' => $newid];
    }

    public function create()
    {
    } /*../function..*/

    public function store(Request $request)
    {
    }
    /* end function*/
    function proceed_store($request, $data, $obj_info)
    {
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






    public function api_store(Request $request, $id = 0)
    {
        //$json_content = '{"_id":651,"gIndic\/tbl4010":"5","username":"demo_dcx","gIndic\/tbl4012":"5","gIndic\/tbl4011":"5","meta\/audit":"audit.csv","_uuid":"78bd2d2b-cfe6-40a4-9957-7e6d834e9927","gGeo\/Commune":"31307","_notes":[],"Tend":"2022-03-21T15:26:07.568+07:00","_submitted_by":"demo_dcx","gGeo\/Province":"3","gGeo\/Inter_name":"Dane","Tstart":"2022-03-21T15:25:20.111+07:00","_xform_id_string":"aHKrr893ymKnt3sRBcNpGQ","Ttoday":"2022-03-21","meta\/instanceID":"uuid:78bd2d2b-cfe6-40a4-9957-7e6d834e9927","_status":"submitted_via_web","formhub\/uuid":"12207474889c44fcb425639dc0cd61eb","gIndic\/tbl406":"5","gIndic\/tbl407":"3","gIndic\/tbl404":"5","gIndic\/tbl405":"4","gIndic\/tbl402":"5","gIndic\/tbl403":"5","gIndic\/tbl401":"5","gGeo\/Date":"2022-03-21","_submission_time":"2022-03-21T08:26:13","gGeo\/Round":"1st Round","gIndic\/tbl408":"5","gIndic\/tbl409":"5","_attachments":[{"mimetype":"text\/comma-separated-values","download_small_url":"https:\/\/kc.datasciencedcx.org\/media\/small?media_file=demo_dcx%2Fattachments%2F12207474889c44fcb425639dc0cd61eb%2F78bd2d2b-cfe6-40a4-9957-7e6d834e9927%2Faudit.csv","download_large_url":"https:\/\/kc.datasciencedcx.org\/media\/large?media_file=demo_dcx%2Fattachments%2F12207474889c44fcb425639dc0cd61eb%2F78bd2d2b-cfe6-40a4-9957-7e6d834e9927%2Faudit.csv","download_url":"https:\/\/kc.datasciencedcx.org\/media\/original?media_file=demo_dcx%2Fattachments%2F12207474889c44fcb425639dc0cd61eb%2F78bd2d2b-cfe6-40a4-9957-7e6d834e9927%2Faudit.csv","filename":"demo_dcx\/attachments\/12207474889c44fcb425639dc0cd61eb\/78bd2d2b-cfe6-40a4-9957-7e6d834e9927\/audit.csv","instance":651,"download_medium_url":"https:\/\/kc.datasciencedcx.org\/media\/medium?media_file=demo_dcx%2Fattachments%2F12207474889c44fcb425639dc0cd61eb%2F78bd2d2b-cfe6-40a4-9957-7e6d834e9927%2Faudit.csv","id":538,"xform":81}],"gGeo\/Resp_name":"Phea","_geolocation":[null,null],"deviceid":"collect:IgNJUkOdpdAWZBM0","_validation_status":[],"gGeo\/District":"313","__version__":"vLjyC5FBWfhY7HaxxpmABB","_tags":[]}';
        // dd('aaa');
        $json_content = $request->getContent();
        $apidata = json_decode($json_content, true);
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
        $newid = $this->model->max($this->fprimarykey) + 1;
        $dataTable = [$this->fprimarykey => $newid, "contents" => $json_content, "trash" => "no"];
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
        $tbl_columns = getTableColumns($this->tablename);
        foreach ($labels as $key => $value) {
            if (!in_array(strtolower($value), $tbl_columns, true)) {
                addColumn($this->tablename, strtolower($value));
            }
        }

        /*Inser Data into Table*/
        $save_status = $this->model->insert($dataTable);
        if ($save_status) {
            return "New record created successfully";
        } else {
            return response()
                ->json(
                    [
                        'status' => false,
                        "message" => 'fale',
                    ],
                    422
                );
        }
    }
}
