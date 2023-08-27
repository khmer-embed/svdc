<?php

namespace App\Http\Controllers;

use DB;
use Validator;
use Schema;
use Illuminate\Http\Request;

use App\Models\Xlsform;
use Setvalue;

class DynamicformController extends Controller
{
    private $obj_info = ['name' => 'dynamicform', 'routing' => 'admin.controller', 'title' => 'Dashboard', 'icon' => '<i class="fas fa-th-list"></i>'];
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

        $this->obj_info['title'] = $title??'Dynamic Form'; //__('label.lb09');
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
        // ->where($province_fld , $pronvince_cond, (int)$province_id)
        ->select('*')
        ;
    } /*../function..*/
    //JSON_UNQUOTE(JSON_EXTRACT(title, '$.".$this->dflang[0]."'))

    public function sfp($request, $results, $isPaginate=true)
    {
        #Sort Filter Pagination#

        // CACHE SORTING INPUTS
        $allowed = array('_id', $this->fprimarykey);
        $sort = in_array($request->input('sort'), $allowed) ? $request->input('sort') : $this->fprimarykey;
        $order = $request->input('order') === 'asc' ? 'asc' : 'desc';
        $results = $results->orderby($sort, $order);
        // FILTERS
        $appends = [];
        $querystr = [];

        if ($request->has('txt') && !empty($request->input('txt'))) {
            $qry = $request->input('txt');
            $results = $results->where(function ($query) use ($qry) {
                $query
                    ->whereraw("tstart like ?", "'%".$qry."%'")
                    //->whereRaw("title like ?", ['%'.$qry.'%'])
                    //->orwhereRaw("inter_name like '%" . $qry . "%'")
                ;
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
            $perpage = $this->rcdperpage < 0 ? config('dev.app.rpp') ?? 15 : $this->rcdperpage;
        }

        if(!$isPaginate){
            //$perpage = $results->count();
            return [
                'results'           => $results->get(),
                'sort'          => $sort,
                'order'         => $order,
                'querystr'      => $querystr,
                'perpage_query' => $perpage_query,
            ];
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
        // dd($this->tablecolumns, $this->questions, $this->choices);
        return view('app.' . $this->obj_info['name'] . '.index', compact([]))
            ->with([
                'obj_info'  => $this->obj_info,
                'route' => [
                    'create'  => $create_route,
                    'sync'  => $sync_route,
                ],
                'fprimarykey'     => $this->fprimarykey,
                'caption' => __('dev.active'),
                'koboformid' => $this->koboformid,
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
        $is_admin = false;
        $userinfo = $this->args['userinfo'];
        if(is_admin($userinfo->blongto??$userinfo['blongto'], $userinfo->permission_id??$userinfo['permission_id'])){
            $is_admin = true;
        }
        if ($input->isEmpty() || !$is_admin) {
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

    public function totrash(Request $request, $id = 0)
    {
        $obj_info = $this->obj_info;
        #Retrieve Data#
        if (empty($id)) {
            $editid = $this->args['routeinfo']['id'];
        } else {
            $editid = $id;
        }

        $routing = redirect()->back()->getTargetUrl();
        $trash = DB::table($this->tablename)->where($this->fprimarykey, $editid)->update(["trash" => "yes"]);
        if ($trash) {
            return response()
                ->json(
                    [
                        "type" => "url",
                        'status' => true,
                        'route' => ['url' => $routing],
                        "message" => __('dev.suc_delete'),
                        "data" => ['id' => $editid]
                    ],
                    200
                );
        }

        return response()
            ->json(
                [
                    "type" => "url",
                    'status' => false,
                    'route' => ['url' => $routing],
                    "message" => __('dev.rqnvalid'),
                    "data" => ['id' => $editid]
                ],
                422
            );
    }

    /* end function*/

    public function delete(Request $request, $id = 0)
    {
        $obj_info = $this->obj_info;
        #Retrieve Data#
        if (empty($id)) {
            $editid = $this->args['routeinfo']['id'];
        } else {
            $editid = $id;
        }

        $routing = redirect()->back()->getTargetUrl();
        $deleted = false;
        $userinfo = $this->args['userinfo'];
        if(is_admin($userinfo->blongto??$userinfo['blongto'], $userinfo->permission_id??$userinfo['permission_id'])){
            $deleted =  DB::table($this->tablename)->where($this->fprimarykey, $editid)->delete();
        }

        if ($deleted) {
            return response()
                ->json(
                    [
                        "type" => "url",
                        'status' => true,
                        'route' => ['url' => $routing],
                        "message" => __('dev.suc_destroy'),
                        "data" => ['id' => $editid]
                    ],
                    200
                );
        }

        return response()
            ->json(
                [
                    "type" => "url",
                    'status' => false,
                    'route' => ['url' => $routing],
                    "message" => __('dev.rqnvalid'),
                    "data" => ['id' => $editid]
                ],
                422
            );
    }
    /* end function*/

    public function export(Request $request){
        $obj_info = $this->obj_info;
        // return view($blade, compact([]));
        $default = $this->default();

        $results = $this->listingmodel();
        $sfp = $this->sfp($request, $results, false);

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
        // dd($this->tablecolumns, $this->questions, $this->choices);

        $blade = get_view_by_db_name($obj_info['name'], 'export');
        return view($blade, compact([]))
            ->with([
                'obj_info'  => $this->obj_info,
                'route' => [
                    'create'  => $create_route,
                    'sync'  => $sync_route,
                ],
                'fprimarykey'     => $this->fprimarykey,
                'caption' => __('dev.active'),
                'koboformid' => $this->koboformid,
                'tablecolumns' =>$this->tablecolumns,
                'questions' => $this->questions,
                'choices' => $this->choices,
            ])
            ->with(['act' => 'index'])
            ->with($sfp)
            ;
    }

    
}
