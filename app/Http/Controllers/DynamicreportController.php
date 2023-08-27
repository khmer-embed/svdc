<?php

namespace App\Http\Controllers;

use DB;
use Validator;
use Schema;
use Illuminate\Http\Request;

use App\Models\Xlsform;
use Setvalue;

class DynamicreportController extends Controller
{
    private $obj_info = ['name' => 'dynamicreport', 'routing' => 'admin.controller', 'title' => 'Dashboard', 'icon' => '<i class="fas fa-chart-line"></i>'];
    private $args;
    private $request;

    private $model;
    private $submodel;
    private $tablename;
    private $fprimarykey = '_id';
    private $protectme = null;

    private $dflang;
    private $rcdperpage = -1; #record per page, set negetive to get all record#
    private $users;

    private $koboformid;
    private $tablecolumns;
    private $questions;
    private $choices;

    private $setvalue;

    /**
     * Create a new controller instance.
     *
     * @return void
     */
    public function __construct(array $args = [])
    {
        if (request()->has('koboformid')) {
            $koboformid = request()->input('koboformid');
            session(['koboformid' => $koboformid]);
        }
        elseif (null == session('koboformid') || empty(session('koboformid'))) {
            session(['koboformid' => 0]);
        }
        $this->koboformid = session('koboformid');
        // dd($this->koboformid);
        if($this->koboformid>0){
            $get_formqry = Xlsform::where('id', $this->koboformid)->get();
            if(!$get_formqry->isEmpty()){
                $title = $get_formqry[0]->title;
                $title_nospace = str_replace(' ', '_', $title);
                $title_nospace = str_replace('+', '', $title_nospace);
                $this->tablename  = 'kobo'.$this->koboformid.'_'.$title_nospace; 
                $this->tablecolumns = getTableColumns($this->tablename);
                
                $tbl_question = 'kobo'.$this->koboformid.'_questions';
                $tbl_choice = 'kobo'.$this->koboformid.'_choices';
                if (Schema::hasTable($tbl_question)) {
                    $this->questions = DB::table($tbl_question)->get()->keyby('name');
                }
                if (Schema::hasTable($tbl_choice)) {
                    $this->choices = DB::table($tbl_choice)->select('*', DB::raw("concat(list_name,'_',name) as role"))->get()->keyby('role');
                }

            }
            else{
                $this->koboformid = 0;
            }
        }
        else{
            $this->koboformid = 0;
        }

        $this->obj_info['title'] = $title??'Dynamic Report'; //__('label.lb09');
        $default_protectme = config('dev.app.protectme');
        // $this->protectme = [
        //     'display' => 'yes',
        //     'object' => [$this->obj_info['name']],
        //     'method'  => [
        //         'index' => $default_protectme['index'],
        //         'show' => $default_protectme['show'],
        //         'create' => $default_protectme['create'],
        //         'edit' => $default_protectme['edit'],
        //         'delete' => $default_protectme['delete'],
        //         'destroy' => $default_protectme['destroy'],
        //         'restore' => $default_protectme['restore'],
        //     ]
        // ];
        $this->args = $args;
        $this->dflang = df_lang();

        $this->setvalue = new Setvalue();
        // $xx = DB::table($this->tablename)
        //         ->select(
        //             'group_location/province'
        //             )
                
        //             ;
        // dd($xx->get());

    }

    public function gohome(){
        $routing = url_builder('admin.controller', ['home']);
            return response()
            ->json(
                [
                    "type" => "url",
                    'status' => false,
                    'route' => ['url' => $routing],
                    "message" => __('dev.rqnvalid'),
                ],
                422
            );
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

        return [];
    } /*../function..*/

    public function listingModel()
    {
        #DEFIND MODEL#
        $province_id = $this->args['userinfo']['province_id']??0;
        $pronvince_cond = "=";
        if(empty($province_id)){
            $pronvince_cond = "<>";
        }
        $tbl_columns = getTableColumns($this->tablename);
        
        $province = array_where($tbl_columns, function ($key, $value) {
            return str_contains(strtolower($key), 'province');
        });
        if(empty($province)){
            $pronvince_cond = "<>";
            $province_id = 0;
            $province_fld = $this->fprimarykey;
        }
        else{
            $province_fld = array_values($province)[0]??"province";
        }

        return DB::table($this->tablename)
                ->select(
                    'province as province',
                    'district as district',
                    'commune as commune',
                    DB::raw("count(`commune`) as count_cm")
                    )
                ->where($province_fld , $pronvince_cond, (int)$province_id)
                ->groupby("province", "district", "commune")
                    ;

        /*
        
        SELECT `group_location/province` as province, `group_location/district` as district, `group_location/commune` as commune, count(`group_location/commune`) as count_cm
FROM `kobo4_Citizen_Budget_Monitoring_2023`
where 1
GROUP BY province, district, commune
        */
        
    } /*../function..*/
    //JSON_UNQUOTE(JSON_EXTRACT(title, '$.".$this->dflang[0]."'))

    public function sfp($request, $results)
    {
        #Sort Filter Pagination#

        // CACHE SORTING INPUTS
        $allowed = array('province', 'district','commune', $this->fprimarykey);
        $sort = in_array($request->input('sort'), $allowed) ? $request->input('sort') : 'province';
        $order = $request->input('order') === 'desc' ? 'desc' : 'asc';
        $results = $results->orderby($sort, $order);
    
        // FILTERS
        $appends = [];
        $querystr = [];

        if ($request->has('province') && !empty($request->input('province'))) {
            $qry = $request->input('province');
            $results = $results->where("group_location/province",$qry);
            array_push($querystr, 'province=' . $qry);
            $appends = array_merge($appends, ['province' => $qry]);
        }

        if ($request->has('district') && !empty($request->input('district'))) {
            $qry = $request->input('district');
            $results = $results->where("group_location/district",$qry);
            array_push($querystr, 'district=' . $qry);
            $appends = array_merge($appends, ['district' => $qry]);
        }



        // PAGINATION and PERPAGE
        $perpage = null;
        $perpage_query = [];
        if ($request->has('perpage')) {
            $perpage = $request->input('perpage');
            $perpage_query = ['perpage=' . $perpage];
            $appends = array_merge($appends, ['perpage' => $perpage]);
        } elseif (null !== $this->rcdperpage && $this->rcdperpage != 0) {
            $perpage = $this->rcdperpage < 0 ? config('dev.app.rpp') ?? 15 : $this->rcdperpage;
        }

        if (null !== $perpage) {
            try {
                $results = $results->paginate($perpage);
           }
           catch (\Throwable $e) {
            // dd($e);
                $results = DB::table($this->tablename)
                ->select('*')
                ->whereraw('1=2')
                    ;
                $results = $results->paginate($perpage);
            }
            
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

        $sync_route = url_builder(
            $this->obj_info['routing'],
            [
                $this->obj_info['name'], 'sync', ''
            ],
        );

        $provinces = getchoice('cProvince',  $this->choices);
        $districts = getchoice('cDistrict',  $this->choices);
        $communes = getchoice('cCommune',  $this->choices);
        
        // dd($this->tablecolumns, $this->questions, $this->choices);
        
        return view('app.' . $this->obj_info['name'] . '.index', compact(['provinces', 'districts', 'communes']))
            ->with([
                'obj_info'  => $this->obj_info,
                'route' => [
                    'create'  => $create_route,
                    'sync'  => $sync_route,
                ],
                'fprimarykey'     => $this->fprimarykey,
                'caption' => __('dev.active'),
                'tablecolumns' =>$this->tablecolumns,
                'questions' => $this->questions,
                'choices' => $this->choices,
            ])
            ->with(['act' => 'index'])
            ->with($sfp)
            ->with($setting);
    }
    /* end func*/

    public function edit(Request $request, $id = 0)
    {

        #prepare for back to url after SAVE#
        if (!$request->session()->has('backurl')) {
            $request->session()->put('backurl', redirect()->back()->getTargetUrl());
        }

        $obj_info = $this->obj_info;

        $default = $this->default();
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

        $input = DB::table($this->tablename)
            ->where($this->fprimarykey, (int)$editid)
            ;
     
        $input  = $input->get(); 
        // dd($input->toSql());
        if ($input->isEmpty()) {
            $routing = url_builder($obj_info['routing'], [$obj_info['name'], 'index']);
            return response()
                ->json(
                    [
                        "type" => "url",
                        'status' => false,
                        'route' => ['url' => redirect()->back()->getTargetUrl()],
                        "message" => 'Your edit is not affected',
                        "data" => ['id' => $editid]
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
        $sumit_route = url_builder(
            $this->obj_info['routing'],
            [$this->obj_info['name'], 'update', ''],
            [],
        );
        $cancel_route = redirect()->back()->getTargetUrl();

        // dd($input);
        return view('app.' . $this->obj_info['name'] . '.create', compact(['default']))
            ->with([
                'obj_info'  => $this->obj_info,
                'route' => ['submit'  => $sumit_route, 'cancel' => $cancel_route],
                'form' => ['save_type' => 'save'],
                'fprimarykey'     => $this->fprimarykey,
                'caption' => 'Edit',
                'isupdate' => true,
                'tablecolumns' =>$this->tablecolumns,
                'questions' => $this->questions,
                'choices' => $this->choices,
                'input' => $input,
                
            ]);
    } /*../end fun..*/

    public function validator($request, $isupdate = false)
    {
        $update_rules = [$this->fprimarykey => 'required'];
        $rules = [];
        foreach ($this->tablecolumns as $column){
            $field_at_q = array_last(explode('/', $column));
            
            if('uuid'!=$field_at_q && '_' !=substr($column, 0, 1) && isset($this->questions[$field_at_q]))
            {
                if($this->questions[$field_at_q]->required??false){
                    $rules[$column]      = ['required'];
                }
                
            }
        }
        if ($isupdate) {
            $rules = array_merge($rules, $update_rules);
        }
        $validatorMessages = [
            /*'required' => 'The :attribute field can not be blank.'*/
            'required' => __('dev.fieldreqire'),
        ];

        return Validator::make($request->input(), $rules, $validatorMessages);
    }

    public function validation(Request $request, $isupdate = null)
    {
        $obj_info = $this->obj_info;
        $routing = url_builder($obj_info['routing'], [$obj_info['name'], 'create']);
        $isupdate = is_null($isupdate) ? false : $isupdate;
        if (null !== $request->input('isupdate')) {
            $isupdate = $this->setvalue->set($request->isupdate)->toBoolean()->get();
        }
        if ($request->isMethod('post')) {
            $validate = $this->validator($request, $isupdate);
            if ($validate->fails()) {
                $validate_errors = $validate->errors()->messages();
                $validate_errors_new = [];
                foreach($validate_errors as $key => $val){
                    $field_at_q = array_last(explode('/', $key));
                    $validate_errors_new[$field_at_q] =  $val;
                }
                
                return response()
                    ->json(
                        [
                            "type" => 'validator',
                            'status' => false,
                            'route' => ['url' => $routing],
                            "message" => __('dev.forminvalid'),
                            "data" => $validate_errors_new
                        ],
                        422
                    );
            }

            return response()
                ->json(
                    [
                        "type" => 'submit',
                        'status' => true,
                        'form' => $request->formname,
                    ],
                    200
                );
        } /*end if is post*/ else {
            $return_type = "url";
            if (is_axios()) {
                $return_type = "error";
            }
            return response()
                ->json(
                    [
                        "type" => $return_type,
                        'status' => false,
                        'route' => ['url' => $routing],
                        "message" => __('dev.forminvalid'),
                        "data" => []
                    ],
                    422
                );
        }
    }

    public function setinfo($request, $isupdate = false)
    {
        $newid = ($isupdate) ? $request->input($this->fprimarykey)  : DB::table($this->tablename)->max($this->fprimarykey) + 1;
        $tableData = [];
        
        $record[$this->fprimarykey] = $newid;
        foreach ($this->tablecolumns as $column){
            $field_at_q = array_last(explode('/', $column));
            if('uuid'!=$field_at_q && '_' !=substr($column, 0, 1) && isset($this->questions[$field_at_q]))
            {
                if($this->questions[$field_at_q]->required??false){
                    $record[$column]      = $this->setvalue->set($request->$column??'')->toString()->get();
                }
                
            }
        }

        array_push($tableData, $record);
        return [
            'tableData' => $tableData,
            'id' => $newid
        ];
    }

    public function update(Request $request)
    {
        $obj_info = $this->obj_info;
        $validation = $this->validation($request, true);
        $validation_decode = json_decode($validation->getContent());
        if ($validation_decode->status) {
            $data = $this->setinfo($request, true);
            return $this->proceed_update($request, $data, $obj_info);
        } else {
            return $validation;
        }
    }/*../end fun..*/

    function proceed_update($request, $data, $obj_info)
    {
        // $update_status = $this->model
        //     ->where($this->fprimarykey, $data['id'])
        //     ->update($data['tableData']);
        $update_status = [];
        foreach ($data['tableData'] as $ind => $datarecord) {
            $update_status[] = DB::table($this->tablename)->updateOrInsert(
                    [$this->fprimarykey => $datarecord[$this->fprimarykey]],
                    $datarecord
                );
        }
        $return_type = "url";
        if (count($update_status) > 0) {
            $savetype = strtolower($request->input('savetype'));
            $id = $data['id'];
            $all_id = getid($this->fprimarykey, $data['tableData']);
            $rout_to = save_type_route($savetype, $obj_info, $id, [], ['ids' => join('-', $all_id)]);
            $success_ms = __('dev.suc_save');
            $route = ['url' => $rout_to];
            $callback = '';
            if (is_axios()) {
                $callback = $request->input('jscallback') ?? '';
                $return_type = "success";
                $route = $rout_to;
            }
            return response()
                ->json(
                    [
                        "type" => $return_type,
                        "status" => $update_status,
                        "message" => $success_ms,
                        "route" => $route,
                        "callback" => $callback,
                        "data" => [
                            $this->fprimarykey => $data['id'],
                            'id' => $data['id']
                        ]
                    ],
                    200
                );
        }


        $index_route = url_builder(
            $this->obj_info['routing'],
            [$this->obj_info['name'], 'index', ''],
            [],
        );
        $route = ['url' => $index_route];
        if (is_axios()) {
            $return_type = "error";
            $route = $index_route;
        }
        return response()
            ->json(
                [
                    "type" => $return_type,
                    'status' => false,
                    "message" => __('dev.fail_edit'),
                    "route" => $route,
                    "data" => []
                ],
                422
            );
    }
    /* end function*/

    public function byparent(Request $request)
    {
        
        $parent_id = (int)$request->input("parent_id") ?? -1;
        $parent_id = $parent_id == 0 ? -1 : $parent_id;
        $lookingfor =  $request->input("lookingfor")??"cDistrict";
    
        $result = [];
        // $districts = getchoice('cDistrict',  $this->choices);
        $tbl_choice = 'kobo'.$this->koboformid.'_choices';
        // $where = [['trash', '<>', 'yes'], ['parent_id', '=', $pob_province_id ?? -1]];

        if (Schema::hasTable($tbl_choice)) {
            $length_condi = 3;
            if($lookingfor=='cDistrict'){
                if(strlen($parent_id.'')>1){
                    $length_condi = 4;
                }
            }
            
            $choices_qry = DB::table($tbl_choice)->select('name as id', 'label_0 as title')
            ->where('list_name', $lookingfor)
            ->where('name', 'like', $parent_id.'%')
            ->whereraw('LENGTH(name)=?', $length_condi)
            ;
            $result = $choices_qry->get()->toarray();
        }

        return response()
            ->json(
                [
                    "callback" => $request->input("jscallback") ?? "",
                    'combo' => 'district',
                    "data" => $result
                ],
                200
            );

        // return [];
    }

    
}
