<?php

namespace App\Http\Controllers;

use App\Models\Realtimeinsert;
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

class RealtimeinsertController extends Controller
{
    //
    private $obj_info = ['name' => 'realtimeinsert', 'routing' => 'admin.controller', 'title' => 'endpoint', 'icon' => '<i class="fas fa-list"></i>'];
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
        $this->obj_info['title'] = 'Real Time Insert'; //__('label.lb09');
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
        $this->model = new Realtimeinsert;
        $this->tablename = $this->model->gettable();
        $this->dflang = df_lang();

        /*column*/
        $tbl_columns = getTableColumns($this->tablename);
        foreach ($tbl_columns as $column) {
            //tbl
            if (strpos($column, 'tbl') !== false) {
                array_push($this->columns, $column);
            }
        }
        natsort($this->columns);
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

                $this->tablename . ".*",
                DB::Raw("SUBSTRING_INDEX(table_name,'_',-2) as nameorder")

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
        $allowed = array('nameorder', $this->fprimarykey);
        $sort = in_array($request->input('sort'), $allowed) ? $request->input('sort') : "nameorder";
        $order = $request->input('order') === 'desc' ? 'desc' : 'asc';
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

        $default = $this->default();
        $results = $this->listingmodel();
        $sfp = $this->sfp($request, $results);

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



    public function senttelegram(Request $request, $info = [])
    {
        $user = new User();
        $user->notify(new SendNotification($info));
    }

    public function api_store(Request $request, $id = 0)
    {

        $location = Location::getlocation('kh', [['trash', '<>', 'yes']])->get();
        $location = $location->pluck('title', 'id')->toArray();
        $kobo_table = $request->kobo ?? '';
        $tabl_first = array_first(explode('_', $kobo_table));
        $koboform_id = (int)str_replace('kobo', '', $tabl_first);


        // Schema::dropIfExists($kobo_table);
        // $table_name = $this->model->where('table_name', $kobo_table)->exists();
        if (!empty($kobo_table) && !Schema::hasTable($kobo_table)) {
            Schema::create($kobo_table, function ($table) {
                $table->engine = 'InnoDB';
                $table->increments('id');
                $table->text('contents');
                $table->string('_xform_id_string');
                $table->string('trash');
            });
        }

        // $json_content = '{
        //     "_id": 445470431,
        //     "Tstart": "2023-06-27T18:44:03.737+07:00",
        //     "Tend": "2023-06-28T08:52:44.237+07:00",
        //     "Ttoday": "2023-06-27",
        //     "username": "ifredi_enu",
        //     "phonenumber": "phonenumber not found",
        //     "deviceid": "collect:uSVDpAUX9oxTGVd2",
        //     "idate": "2023-06-27T18:44:00.000+07:00",
        //     "glocation/intame": "ថ",
        //     "glocation/province": "6",
        //     "glocation/district": "602",
        //     "glocation/commune": "60209",
        //     "glocation/village": "6020920",
        //     "GPS": "12.0076001 105.4674859 5.400000095367432 3.808",
        //     "qid": "0000001",
        //     "ghhid/name_hhhead": "សាយ",
        //     "ghhid/sex_headed": "2",
        //     "ghhid/hh_size": "5",
        //     "ghhid/name_respondent": "សាយ",
        //     "ghhid/rhh": "1",
        //     "s02q01": "1",
        //     "hhmembers_count": "5",
        //     "hhmembers": [
        //         {
        //             "hhmembers/idate_m": "2023-06-27T18:44:00.000+07:00",
        //             "hhmembers/intame_m": "ថ",
        //             "hhmembers/province_m": "6",
        //             "hhmembers/district_m": "602",
        //             "hhmembers/commune_m": "60209",
        //             "hhmembers/village_m": "6020920",
        //             "hhmembers/qid_m": "0000001",
        //             "hhmembers/name_hhmember": "5",
        //             "hhmembers/hh_relationship": "1",
        //             "hhmembers/sex": "2",
        //             "hhmembers/age": "32",
        //             "hhmembers/occupation1": "1",
        //             "hhmembers/occupation2": "1",
        //             "hhmembers/occupation3": "1",
        //             "hhmembers/present_interview": "1",
        //             "hhmembers/fishing": "1"
        //         },
        //         {
        //             "hhmembers/idate_m": "2023-06-27T18:44:00.000+07:00",
        //             "hhmembers/intame_m": "ថ",
        //             "hhmembers/province_m": "6",
        //             "hhmembers/district_m": "602",
        //             "hhmembers/commune_m": "60209",
        //             "hhmembers/village_m": "6020920",
        //             "hhmembers/qid_m": "0000001",
        //             "hhmembers/name_hhmember": "3",
        //             "hhmembers/hh_relationship": "2",
        //             "hhmembers/sex": "1",
        //             "hhmembers/age": "30",
        //             "hhmembers/occupation1": "1",
        //             "hhmembers/occupation2": "1",
        //             "hhmembers/occupation3": "1",
        //             "hhmembers/present_interview": "1",
        //             "hhmembers/fishing": "1"
        //         },
        //         {
        //             "hhmembers/idate_m": "2023-06-27T18:44:00.000+07:00",
        //             "hhmembers/intame_m": "ថ",
        //             "hhmembers/province_m": "6",
        //             "hhmembers/district_m": "602",
        //             "hhmembers/commune_m": "60209",
        //             "hhmembers/village_m": "6020920",
        //             "hhmembers/qid_m": "0000001",
        //             "hhmembers/name_hhmember": "3",
        //             "hhmembers/hh_relationship": "3",
        //             "hhmembers/sex": "1",
        //             "hhmembers/age": "18",
        //             "hhmembers/occupation1": "12",
        //             "hhmembers/occupation2": "12",
        //             "hhmembers/occupation3": "12",
        //             "hhmembers/present_interview": "1",
        //             "hhmembers/fishing": "1"
        //         },
        //         {
        //             "hhmembers/idate_m": "2023-06-27T18:44:00.000+07:00",
        //             "hhmembers/intame_m": "ថ",
        //             "hhmembers/province_m": "6",
        //             "hhmembers/district_m": "602",
        //             "hhmembers/commune_m": "60209",
        //             "hhmembers/village_m": "6020920",
        //             "hhmembers/qid_m": "0000001",
        //             "hhmembers/name_hhmember": "3",
        //             "hhmembers/hh_relationship": "3",
        //             "hhmembers/sex": "1",
        //             "hhmembers/age": "18",
        //             "hhmembers/occupation1": "12",
        //             "hhmembers/occupation2": "12",
        //             "hhmembers/occupation3": "12",
        //             "hhmembers/present_interview": "1",
        //             "hhmembers/fishing": "1"
        //         },
        //         {
        //             "hhmembers/idate_m": "2023-06-27T18:44:00.000+07:00",
        //             "hhmembers/intame_m": "ថ",
        //             "hhmembers/province_m": "6",
        //             "hhmembers/district_m": "602",
        //             "hhmembers/commune_m": "60209",
        //             "hhmembers/village_m": "6020920",
        //             "hhmembers/qid_m": "0000001",
        //             "hhmembers/name_hhmember": "3",
        //             "hhmembers/hh_relationship": "3",
        //             "hhmembers/sex": "2",
        //             "hhmembers/age": "19",
        //             "hhmembers/occupation1": "12",
        //             "hhmembers/occupation2": "12",
        //             "hhmembers/occupation3": "12",
        //             "hhmembers/present_interview": "1",
        //             "hhmembers/fishing": "1"
        //         }
        //     ],
        //     "gnotFish/gf02q03/f02q03_01": "1 2 3 4",
        //     "gnotFish/gf02q03/f02q03_02Jan": "5",
        //     "gnotFish/gf02q03/f02q03_02Feb": "5",
        //     "gnotFish/gf02q03/f02q03_02Mar": "5",
        //     "gnotFish/gf02q03/f02q03_02Apr": "5",
        //     "gnotFish/f02q03_nmfishing": "4",
        //     "gnotFish/f02q03_03m12": "1.7",
        //     "gnotFish/gf02q03_03/f02q03_03_cal12moth": "1.7",
        //     "gnotFish/gf02q03_03/f02q03_05": "2.0",
        //     "gnotFish/f02q04": "2",
        //     "gnotFish/f02q06": "0",
        //     "gnotFish/f02q07": "1",
        //     "gnotFish/f02q07_02": "1",
        //     "gnotFish/f02q08": "1",
        //     "gnotFish/f02q08_02": "1",
        //     "gnotFish/f02q11_03": "70",
        //     "gnotFish/f02q11_05": "2",
        //     "s04q01": "0",
        //     "s04q02": "1",
        //     "comments": "0884565385",
        //     "iFinish": "1",
        //     "tstart_continue_interview": "2023-06-27T18:44:44.290+07:00",
        //     "TimeStart": "2023-06-27 18:44:44.290",
        //     "meta/audit": "audit.csv",
        //     "meta/instanceID": "uuid:88a7c3f9-a29c-4701-b1f3-09ed5e4a3e12",
        //     "meta/rootUuid": "02c2ab83-df90-489b-aee2-97de53fde6cc",
        //     "meta/deprecatedID": "uuid:02c2ab83-df90-489b-aee2-97de53fde6cc",
        //     "formhub/uuid": "d98f99b1177c4e0e8f66db84031c4391",
        //     "__version__": "vPw5NzqZhqVKanDVeJYJai",
        //     "_xform_id_string": "a4K83qfTRqcea3sRkA8q2a",
        //     "_uuid": "88a7c3f9-a29c-4701-b1f3-09ed5e4a3e12",
        //     "_attachments": [
        //         {
        //             "download_url": "https://kobo.humanitarianresponse.info/api/v2/assets/a4K83qfTRqcea3sRkA8q2a/data/445470431/attachments/186281411/",
        //             "download_large_url": "https://kobo.humanitarianresponse.info/api/v2/assets/a4K83qfTRqcea3sRkA8q2a/data/445470431/attachments/186281411/",
        //             "download_medium_url": "https://kobo.humanitarianresponse.info/api/v2/assets/a4K83qfTRqcea3sRkA8q2a/data/445470431/attachments/186281411/",
        //             "download_small_url": "https://kobo.humanitarianresponse.info/api/v2/assets/a4K83qfTRqcea3sRkA8q2a/data/445470431/attachments/186281411/",
        //             "mimetype": "text/comma-separated-values",
        //             "filename": "cfmisgovkh/attachments/d98f99b1177c4e0e8f66db84031c4391/02c2ab83-df90-489b-aee2-97de53fde6cc/audit.csv",
        //             "instance": 445470431,
        //             "xform": 1422081,
        //             "id": 186281411
        //         }
        //     ],
        //     "_status": "submitted_via_web",
        //     "_geolocation": [
        //         12.0076001,
        //         105.4674859
        //     ],
        //     "_submission_time": "2023-06-27T12:02:02",
        //     "_tags": [],
        //     "_notes": [],
        //     "_validation_status": {},
        //     "_submitted_by": "ifredi_enu"
        // }';
        // $json_content = '{"_id": 417787404, "formhub/uuid": "64e1b288cc89466aa9aa09283a963f3d", "Tstart": "2023-04-16T06:09:16.397+07:00", "Tend": "2023-04-16T06:13:22.482+07:00", "Ttoday": "2023-04-16", "username": "eiseinetworkapp_kobo", "deviceid": "collect:OY4Q8ZWAzWA8j106", "g_intro/date_interview": "2023-04-16", "g_intro/name_interview": "\u178a\u17b6\u178e\u17c1", "g_intro/sex_interview": "1", "g_intro/name_respon": "\u1798\u17b7\u1793", "g_intro/province": "K2", "g_intro/district": "1103", "g_intro/commune": "110302", "g_intro/village": "11030203", "g_envirog_natural/q0201": "\u1798\u17b7\u1793\u1799\u179b\u17cb", "g_envirog_natural/q0202": "\u1793\u17c5\u1791\u17c1", "g_envirog_natural/q0203": "\u1798\u17b7\u1793", "g_envirog_natural/q0204": "\u1793\u17c5", "g_violation/q0301": "\u1798\u17b7\u1793", "g_violation/q0302": "\u1798\u17b7\u1793", "g_violation/q0303": "\u1798\u17b7\u1793", "g_violation/q0304": "\u1798\u17b7\u1793", "g_q0401/q0401": "\u1798\u17b7\u1793", "g_q0401/q0402": "\u1798\u17b7\u1793", "g_q0501/q0501": "\u1798\u17b7\u1793", "g_q0501/q0502": "\u1798\u17b7\u1793", "g_q0501/q0503": "\u1798\u17b7\u1793", "comments": "\u1798\u17b7\u1793", "iFinish": "1", "__version__": "vAnFNXXvoVVPH9oLMQMNDp", "meta/audit": "audit.csv", "meta/instanceID": "uuid:d599dba7-4141-49d7-be17-e654ffe22ec3", "_xform_id_string": "aP25nUip6ExqJGKfahmqAR", "_uuid": "d599dba7-4141-49d7-be17-e654ffe22ec3", "_attachments": [{"download_url": "https://kc.humanitarianresponse.info/media/original?media_file=koboadmin_eiseinetworkapp%2Fattachments%2F64e1b288cc89466aa9aa09283a963f3d%2Fd599dba7-4141-49d7-be17-e654ffe22ec3%2Faudit.csv", "download_large_url": "https://kc.humanitarianresponse.info/media/large?media_file=koboadmin_eiseinetworkapp%2Fattachments%2F64e1b288cc89466aa9aa09283a963f3d%2Fd599dba7-4141-49d7-be17-e654ffe22ec3%2Faudit.csv", "download_medium_url": "https://kc.humanitarianresponse.info/media/medium?media_file=koboadmin_eiseinetworkapp%2Fattachments%2F64e1b288cc89466aa9aa09283a963f3d%2Fd599dba7-4141-49d7-be17-e654ffe22ec3%2Faudit.csv", "download_small_url": "https://kc.humanitarianresponse.info/media/small?media_file=koboadmin_eiseinetworkapp%2Fattachments%2F64e1b288cc89466aa9aa09283a963f3d%2Fd599dba7-4141-49d7-be17-e654ffe22ec3%2Faudit.csv", "mimetype": "text/csv", "filename": "koboadmin_eiseinetworkapp/attachments/64e1b288cc89466aa9aa09283a963f3d/d599dba7-4141-49d7-be17-e654ffe22ec3/audit.csv", "instance": 417787404, "xform": 1363857, "id": 173503219}], "_status": "submitted_via_web", "_geolocation": [null, null], "_submission_time": "2023-04-18T01:50:21", "_tags": [], "_notes": [], "_validation_status": {}, "_submitted_by": "koboadmin_eiseinetworkapp"}';
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
        // $newid = $this->model->max($this->fprimarykey) + 1;
        $dataTable = [];
        $labels = [];
        $subtable_datas = [];
        foreach ($apidata as $key => $value) {
            $value_ori = $value;
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
            //sub-table
            $xform_id_string = $apidata['_xform_id_string'];
            $subtable_name = 'kobo' . $koboform_id . '_' . $label . "_" . $xform_id_string;
            $all_subtable = [];
            if (Schema::hasTable($subtable_name)) {
                array_push($all_subtable, $subtable_name);
                $main_table_fields = [
                    '_parent_index' => $dataTable['_id'] ?? '',
                    '_submission__id' => $dataTable['_uuid'] ?? '',
                    '_parent_table_name' => $kobo_table,
                    'kobo_id' => $kobo_id ?? '',
                ];
                $subtable_field = getTableColumns($subtable_name);

                if (!is_array($value_ori)) {
                    $value_ori = json_decode($value_ori, true);
                }
                foreach ($value_ori as $subtablerecord) {
                    $subtablerecord_newfield = [];
                    foreach ($subtablerecord as $col => $data) {
                        $col = array_last(explode('/', $col));
                        $subtablerecord_newfield[$col] = $data;
                    }


                    $subtablerecord_newfield = array_merge($main_table_fields, $subtablerecord_newfield);
                    $subtablerecord_newfield = array_only($subtablerecord_newfield, $subtable_field);
                    array_push($subtable_datas, ['table' => $subtable_name, "data" => $subtablerecord_newfield]);
                }
            }
        }

        // dd($all_subtable);
        $dataTable['original'] =  $json_content;
        $tbl_columns = getTableColumns($kobo_table);
        $dataTable = array_only($dataTable, $tbl_columns);
        // dd($kobo_table);
        /*Inser Data into Table*/
        $save_status = DB::table($kobo_table)->insert($dataTable);
        if ($save_status) {
            //Save Sub-Table
        
            foreach ($subtable_datas as $record) {
                $subtable_name = $record['table'];
                $subtable_record = $record['data'];
                DB::table($subtable_name)->insert(
                    $subtable_record
                );
            }
            //end save sub


            $telegraminfo = [];
            foreach ($labels as $key => $value) {
                if (!empty($tbl_columns)) {
                    if (!in_array(strtolower($value), $tbl_columns, true)) {
                        addColumn($kobo_table, strtolower($value));
                    }
                }

                /* get data for send to telegram*/
                if (str_contains($value, '_id')) {
                    $url = url_builder(
                        $this->obj_info['routing'],
                        [
                            'dynamicform', 'edit', $dataTable['_id'] ?? 0
                        ],
                        ['koboformid' => $koboform_id]
                    );
                    $telegraminfo['url'] = ['URL', $url];
                }

                $telegraminfo['form'] = ['ទម្រង់', $kobo_table];
                
                $time = strtotime($dataTable['_submission_time'] ?? '');
                $myFormatForView = date("d/m/Y g:i A", $time);
                $telegraminfo['_submission_time'] = ['ថ្ងៃសំភាសន៍', $myFormatForView];

                if (str_contains($value, 'name_interview') || str_contains($value, 'intame')) {

                    $telegraminfo['name_interview'] = ['អ្នកសំភាសន៍', $dataTable[$value] ?? ""];
                }

                if (str_contains($value, 'name_respon') || str_contains($value, 'name_respondent')) {

                    $telegraminfo['name_respon'] = ['អ្នកតបសំភាសន៍', $dataTable[$value] ?? ''];
                }


                if (str_contains($value, 'province')) {
                    $telegraminfo['province'] = ['ខេត្ត', $location[$dataTable[$value] ?? ''] ?? ''];
                }

                if (str_contains($value, 'district')) {
                    $telegraminfo['district'] = ['ស្រុក', $location[$dataTable[$value] ?? ''] ?? ''];
                }

                if (str_contains($value, 'commune')) {
                    $telegraminfo['commune'] = ['ឃុំ', $location[$dataTable[$value] ?? ''] ?? ''];
                }

                if (str_contains($value, 'village')) {
                    $telegraminfo['village'] = ['ភូមិ', $location[$dataTable[$value] ?? ''] ?? ''];
                }
            }

            $this->senttelegram($request, $telegraminfo);
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


    public function addlang()
    {
        /*
         ALTER TABLE `tbl_location` ADD `title_en` MEDIUMTEXT CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL AFTER `title`, ADD `title_kh` MEDIUMTEXT CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL AFTER `title_en`;
         */
        $results = Location::select('location_id', 'title')->get();
        foreach ($results as $record) {
            $title_json = json_decode($record->title);
            $update = Location::where('location_id', $record->location_id)->update([
                'title_en' =>  $title_json->en,
                'title_kh' =>  $title_json->kh,
            ]);
        }
    }

    /*---for mobile api */
}
