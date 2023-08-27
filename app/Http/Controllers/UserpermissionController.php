<?php

namespace App\Http\Controllers;
use Illuminate\Http\Request;
use Validator;
use DB;

use App\Models\Userpermission;
use App\Models\Xlsform;
use Setvalue;

class UserpermissionController extends Controller
{
    //
    private $obj_info=['name'=>'userpermission','routing'=>'admin.controller','title'=>'User Permission','icon'=>'<i class="fas fa-user-shield"></i>'];
    public $args;

    private $model;
    private $submodel;
    private $tablename;
    private $fprimarykey='id';
    private $protectme = null;

    private  $setvalue;
    public $dflang;
    private $rcdperpage= -1; #record per page, set zero to get all record# set -1 to use default
    private $users;

    private $definelevel;
    /**
     * Create a new controller instance.
     *
     * @return void
     */
    public function __construct(array $args=[])
    {
        //$this->middleware('auth');
        $this->obj_info['title'] = 'User Permission';//__('label.lb09');
        $default_protectme = config('dev.app.protectme');

        $this->protectme = [ 
            'display' => 'yes',
            'group' => [],
            'object' => [$this->obj_info['name']],
            'method'  => [
                'index' => $default_protectme['index'],
                'show' => $default_protectme['show'],
                'create' => $default_protectme['create'],
                'edit' => $default_protectme['edit'],
                'delete' => $default_protectme['delete'],
                'destroy' => $default_protectme['destroy'],
                'restore' => $default_protectme['restore'],
            ]
        ];

        $this->args = $args;
        $this->model = new Userpermission;
        $this->tablename = $this->model->gettable();
        $this->dflang = df_lang();

        $controllers = [];
        
        foreach (glob(app_path() . '/Http/Controllers/*Controller.php') as $controller) {
            $classname = basename($controller, '.php');
            //echo $classname.'<br>';
            $classPath = 'App\Http\Controllers\\' .$classname;

            if($classname!='UserpermissionController')
            {
                $reflection = new \ReflectionClass($classPath);
             
                $props   = $reflection->getProperties();
                foreach ($props as $prop) {
                    
                        if($prop->getName()=='protectme')
                        {
                              //echo $classname.'<br>';
                            $getclass = new $classPath($args);
                            $class_info = $getclass->getters('obj_info');
                            $classname = $class_info['name'];
                            $getter_protectme = $getclass->getters('protectme');
                            $display = $getter_protectme['display']??'no';
                            
                            if($display=='yes'){
                                $class_info ['protectme'] = $getter_protectme;
                                if(!empty($classname))
                                $this->definelevel[$classname] = $class_info;
                            }
                            
                            
                        }
                }
                
                
            }
          
        }

        /*also add this Controller to Manage*/
        $classname = $this->obj_info['name'];
        $obj_info = $this->obj_info;
        $obj_info['protectme'] =$this->protectme;
        $this->definelevel [$classname]= $obj_info;
       
        $this->setvalue = new Setvalue();
    }

    public function getters($property) {
        if (property_exists($this, $property)) {
            return $this->$property;
        }
        return null;
    }

    public function setters($property, $value) {
        if (property_exists($this, $property)) {
            $this->$property = $value;
        }
    }

    public function default()
    {
        // $xlsform_qry = Xlsform::orderby('id', 'asc')->get();
        return [];
    } /*../function..*/

    public function listingModel()
    {
        #DEFIND MODEL#
        return $this->model
        ->select(\DB::raw($this->fprimarykey." AS id, title, levelsetting, level_status"));
    } /*../function..*/

    public function sfp($request, $results)
    {
        #Sort Filter Pagination#

        // CACHE SORTING INPUTS
        $allowed = array('title', $this->fprimarykey);
        $sort = in_array($request->input('sort'), $allowed) ? $request->input('sort') : $this->fprimarykey;
        $order = $request->input('order') === 'asc' ? 'asc' : 'desc';
        $results = $results->orderby($sort, $order);

        // FILTERS
        $appends = [];
        $querystr = [];

        if ($request->has('txt')) 
        {
            $qry=$request->input('txt');
            $results = $results->where(function ($query) use ($qry) {
                $query
                    ->where("title", "like", "%" . $qry . "%")
                ;
            });
            
            array_push($querystr, 'title='.$qry);
            $appends = array_merge ($appends,['title'=>$qry]);
        }
        

        // PAGINATION and PERPAGE
        $perpage=null;
        $perpage_query=[];
        if ($request->has('perpage')) 
        {
            $perpage = $request->input('perpage');
            $perpage_query = ['perpage='.$perpage];
            $appends = array_merge ($appends,['perpage'=>$perpage]);
        }
        elseif(null!==$this->rcdperpage && $this->rcdperpage!=0){
            $perpage = $this->rcdperpage<0 ? config('dev.app.rpp')??15 : $this->rcdperpage;
        }
        if(null!==$perpage){
            $results = $results->paginate($perpage);
        }
        
        $appends = array_merge ($appends,
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
                        'perpage_query' => $perpage_query
                    ];
    } /*../function..*/

    /**
     * Show the application dashboard.
     *
     * @return \Illuminate\Contracts\Support\Renderable
     */
    public function index(Request $request, $condition=[], $setting=[])
    {
        $results = $this->listingmodel();
        $sfp = $this->sfp($request, $results);
        $definelevel = $this->definelevel;
        //dd($definelevel);
        //return \Redirect::to('/test/index');
        $create_route=url_builder(
            $this->obj_info['routing'],
            [
                $this->obj_info['name'], 'create',''
            ],
        );

        $trash_route=url_builder(
            $this->obj_info['routing'],
            [
                $this->obj_info['name'], 'trash',''
            ],
        );
       
        return view('app.'.$this->obj_info['name'].'.index')
        ->with([

            'obj_info'  => $this->obj_info,
            'definelevel' => $this->definelevel,
            'route'=>['create'  => $create_route, 'trash' =>$trash_route],
            'fprimarykey'     => $this->fprimarykey,
            'caption' => 'Active',
        ])
        ->with(['act' => 'index'])
        ->with($sfp)
        ->with($setting);
    }

    public function trash(Request $request, $condition=[], $setting=[])
    {

        $results = $this->listingmodel();
        $sfp = $this->sfp($request, $results);
        $definelevel = $this->definelevel;
        //dd($definelevel);
        $create_route=url_builder(
            $this->obj_info['routing'],
            [
                $this->obj_info['name'], 'create',''
            ],
        );

        $active_route=url_builder(
            $this->obj_info['routing'],
            [
                $this->obj_info['name'], '',''
            ],
        );
       
        return view('app.'.$this->obj_info['name'].'.index')
        ->with([

            'obj_info'  => $this->obj_info,
            'definelevel' => $this->definelevel,
            'route'=>['create'  => $create_route, 'active' =>$active_route],
            'fprimarykey'     => $this->fprimarykey,
            'caption' => 'Trash',
            'istrash' => true,
        ])
        ->with(['act' => 'index'])
        ->with($sfp)
        ->with($setting);

    }

   

    public function validator($request, $isupdate=false){
        $newid = ($isupdate) ? $request->input($this->fprimarykey)  : $this->model->max($this->fprimarykey) + 1;
        $update_rules = [$this->fprimarykey => 'required'];

       
        if($isupdate)
        {
            $rules['title']      = ['required', 'string', 'unique:'.$this->tablename.',title,' . $newid];
        }
        else
        {
            $rules['title']      = 'required|distinct|unique:'.$this->tablename.',title';
        }
                
        $validatorMessages = [
            /*'required' => 'The :attribute field can not be blank.'*/
            'required' => __('dev.fieldreqire'),
        ];

        if($isupdate){
            $rules=array_merge($rules, $update_rules);
        }
        return Validator::make($request->input(), $rules, $validatorMessages);
        
    }

    public function setinfo($request, $isupdate=false){
        $newid=($isupdate)? $request->input($this->fprimarykey)  : $this->model->max($this->fprimarykey)+1;
        if($newid==1)$newid=2;
        $tableData=[];
        $levelsetting = !empty($request->input('levelsetting'))?$request->input('levelsetting'):[];
        $record = [
            
                $this->fprimarykey => $newid,
                'title'     => !empty($request->input('title'))?$request->input('title'):'',
                'levelsetting'    => json_encode($levelsetting),
                'level_status' =>  'yes',
                'level_type'  => '',
                'tag'       => '',
                'add_date'  => date("Y-m-d"),
                'trash'     => 'no',
                'blongto'   => $this->args['userinfo']['id']
            
            ];
        if($isupdate)
        {
            $record = array_except($record, [$this->fprimarykey,'add_date', 'blongto','trash']);
        }
        array_push($tableData, $record);

        // dd($tableData);
        return ['tableData' => $tableData, 'id'=>$newid];

    }

    public function create()
    {
        $sumit_route=url_builder(
            $this->obj_info['routing'],
            [$this->obj_info['name'], 'store',''],
            [],
        );

        $cancel_route = redirect()->back()->getTargetUrl();
        return view('app.'.$this->obj_info['name'].'.create')
        ->with([
            'obj_info'  => $this->obj_info,
            'route'=>['submit'  => $sumit_route, 'cancel' => $cancel_route],
            'form' =>['save_type'=>'save'],
            'fprimarykey'     => $this->fprimarykey,
            'caption' => 'New',
            'definelevel' => $this->definelevel,
            'istrush' => false,
        ]);
    } /*../function..*/

    public function validation(Request $request)
    {
        $obj_info = $this->obj_info;
        $routing = url_builder($obj_info['routing'], [$obj_info['name'], 'create']);
        $isupdate = false;
        if(null!==$request->input('isupdate')){
            $isupdate = $this->setvalue->set($request->isupdate)->toBoolean()->get();
        }
        if ($request->isMethod('post')) {
            $validate = $this->validator($request, $isupdate);
            if ($validate->fails()) {
                return response()
                    ->json(
                        [
                            "type" => 'validator',
                            'status' => false,
                            'route' => ['url' => $routing],
                            "message" => __('dev.forminvalid'),
                            "data" => $validate->errors()
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
        } /*end if is post*/

        return response()
            ->json(
                [
                    "type" => "error",
                    "message" => __('dev.forminvalid'),
                    "data" => []
                ],
                422
            );
    }

    public function store(Request $request)
    {   
        
        $data = [];
        $obj_info = $this->obj_info;
        $validation = $this->validation($request);
        $validation_decode = json_decode($validation->getContent());
        if ($validation_decode->status) {
            $data = $this->setinfo($request);
            return $this->proceed_store($request, $data, $obj_info);
        } else {
            return $validation;
        }

    }
    /* end function*/
    function proceed_store($request, $data, $obj_info)
    {
        try {
            $proceed_qry = DB::transaction(function () use ($data) {
                $this->model->insert($data['tableData']);
            });
            $save_status = is_null($proceed_qry) ? true : false;
            ///
            $savetype = strtolower($request->input('savetype'));
            $id = $data['id'];
            $all_id = getid($this->fprimarykey, $data['tableData']);
            $rout_to = save_type_route($savetype, $obj_info, $id, [], ['ids' => join('-', $all_id)]);
            $success_ms = __('dev.suc_save');
            $return_type = "url";
            $route = ['url' => $rout_to];
            $callback = 'formreset';
            if (is_axios()) {
                $return_type = "success";
                $route = $rout_to;
                if (!empty($request->jscallback)) {
                    $callback = $request->input('jscallback');
                }
            }

            return response()
                ->json(
                    [
                        "type" => $return_type,
                        "status" => $save_status,
                        "message" => $success_ms,
                        'route' => $route,
                        "callback" => $callback,
                        "data" => [
                            $this->fprimarykey => $data['id'],
                            'id' => $data['id']
                        ]
                    ],
                    200
                );
        } catch (\Throwable $e) {
            // dd($e);
            $return_type = "url";
            $routing = url_builder($obj_info['routing'], [$obj_info['name'], 'create']);
            if (is_axios()) {
                $return_type = "error";
            }
            return response()->json(
                [
                    "type" => $return_type,
                    'status' => false,
                    'route' => ['url' => $routing],
                    "message" => 'Save is false',
                    "data" => []
                ],
                422
            );
        }
         
    }
    /* end function*/

    public function edit(Request $request, $id=0)
    {

        #prepare for back to url after SAVE#
        if (!$request->session()->has('backurl')) {
            $request->session()->put('backurl', redirect()->back()->getTargetUrl());
        }

        $obj_info=$this->obj_info;

        $default=$this->default();
        $definelevel = $this->definelevel;
        $input = null;
        
        #Retrieve Data#
        if (empty($id))
        {
            $editid = $this->args['routeinfo']['id'];
        }
        else
        {
            $editid = $id;
        }

        if($request->has('level_id')){
            $editid = $request->input('level_id');
        }

        $input = $this->model->where($this->fprimarykey, (int)$editid)->where('trash','<>','yes')->get(); 
        if($input->isEmpty())
        {
            $routing=url_builder($obj_info['routing'],[$obj_info['name'],'index']);
            return response()
                    ->json(
                        [
                        "type"=>"url", 
                        'status' => true,
                        'route'=>[ 'url' => redirect()->back()->getTargetUrl()],
                        "message"=> __('ccms.suc_delete'), 
                        "data" => ['id' => $editid]
                        ], 422);
        }

        $input = $input->toArray()[0];
        $x = [];
        foreach ($input as $key => $value) {
            $x[$key]= $value;
        }
        $x['levelsetting'] = json_decode($x['levelsetting'],true);
        $input=$x;
        
        $sumit_route=url_builder(
            $this->obj_info['routing'],
            [$this->obj_info['name'], 'update',''],
            [],
        );
        $cancel_route = redirect()->back()->getTargetUrl();

        
        $active_permission = [];
        foreach($input['levelsetting'] as $key => $val){
            list($controller, $method) = explode('-', $val);
            $active_permission[$controller][] = $method;
        }
        
        return view('app.'.$this->obj_info['name'].'.create')
        ->with([
            'obj_info'  => $this->obj_info,
            'route'=>['submit'  => $sumit_route, 'cancel' => $cancel_route],
            'form' =>['save_type'=>'save'],
            'fprimarykey'     => $this->fprimarykey,
            'caption' => 'Edit',
            'definelevel' => $this->definelevel,
            'isupdate' => true,
            'input' => $input,
            'active_permission' => $active_permission
        ]);
    } /*../end fun..*/

    public function update(Request $request)
    {   
        $obj_info = $this->obj_info;
        $validation = $this->validation($request, true);
        $validation_decode = json_decode($validation->getContent());
        if($validation_decode->status){
            $data = $this->setinfo($request, true);
            return $this->proceed_update($request, $data, $obj_info);
        }
        else{
            return $validation;
        }

    }/*../end fun..*/

    function proceed_update($request, $data, $obj_info)
    {

        $datarecord = $data['tableData'][0];
        $update_status = $this->model
                ->where($this->fprimarykey, $data['id'])
                ->update($datarecord);

        $return_type = "url";
        if ($update_status) {
            $savetype = strtolower($request->input('savetype'));
            $id = $data['id'];
            $all_id = getid($this->fprimarykey, []);
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

    public function totrash(Request $request, $id=0){
        $obj_info = $this->obj_info;
        #Retrieve Data#
        if (empty($id))
        {
            $editid = $this->args['routeinfo']['id'];
        }
        else
        {
            $editid = $id;
        }

        $routing=url_builder($obj_info['routing'],[$obj_info['name'],'index']);

        return response()
                ->json(
                    [
                    "type"=>"url", 
                    'status' => true,
                    'route'=>[ 'url' => redirect()->back()->getTargetUrl()],
                    "message"=> __('ccms.suc_delete'), 
                    "data" => ['id' => $editid]
                    ], 422);

        

        // return \Redirect::to($routing)
        // ->with(
        //     [
        //         "type"=>"url", 
        //         'status' => false,
        //         'route'=>[ 'url' => redirect()->back()->getTargetUrl()],
        //         "message"=> __('ccms.suc_delete'), 
        //     ]
        // );
    }
   

}
