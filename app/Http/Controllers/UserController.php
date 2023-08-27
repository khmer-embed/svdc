<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use Validator;
use DB;
use Illuminate\Support\Facades\Hash;

use App\Models\User;
use App\Models\UserPermission;
use App\Models\Location;

use Setvalue;

class UserController extends Controller
{
    //
    private $obj_info = ['name' => 'user', 'routing' => 'admin.controller', 'title' => 'User', 'icon' => '<i class="fas fa-user"></i>'];
    public $args;

    private $model;
    private $submodel;
    private $tablename;
    private $columns = [];
    private $fprimarykey = 'id';
    private $protectme = null;

    private $setvalue;

    public $dflang;
    private $rcdperpage = 15; #record per page, set zero to get all record# set -1 to use default
    private $users;

    private $setdata;
    /**
     * Create a new controller instance.
     *
     * @return void
     */
    public function __construct(array $args = [])
    {
        //$this->middleware('auth');
        // dd($args['userinfo']);
        $this->obj_info['title'] = 'User'; //__('label.lb09');

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
        //dd($args);
        $this->model = new User;
        $this->tablename = $this->model->gettable();
        $this->dflang = df_lang();

        $this->setvalue = new Setvalue();
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

        /*permission*/
        $permission = UserPermission::select('id', 'title')->where('trash', '<>', 'yes')
            ->get()
            ->pluck('title', 'id')
            ->toArray();

        /*location*/
        $location = Location::getlocation($this->dflang[0])->get();
        $provinces = $location->pluck('title', 'id')->toArray();
           
       

        return [
            'permission' => $permission,
            'provinces' => $provinces,
            'districts' => [],
            'communes' => [],
            
        ];
    } /*../function..*/

    public function listingModel()
    {
        #DEFIND MODEL#
        return $this->model
            ->leftJoin('users_permission', 'users_permission.id', 'users.permission_id')
            ->select(
                \DB::raw("users.id AS id, name, email, fullname ,userstatus, users.permission_id, users_permission.title as permission"),

            );
    } /*../function..*/
    //JSON_UNQUOTE(JSON_EXTRACT(title, '$.".$this->dflang[0]."'))

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
       

        if ($request->has('txt') && !empty($request->input('txt'))) {
            $qry = $request->input('txt');
            $results = $results->where(function ($query) use ($qry) {
                $query
                    ->whereRaw("name like ?", ["%$qry%"])
                    ->orwhereRaw("fullname like ?", ["%$qry%"])
                    ->orwhereRaw("email like ?", ["%$qry%"])
                ;
            });


            array_push($querystr, 'txt=' . $qry);
            $appends = array_merge($appends, ['txt' => $qry]);
        }

        if ($request->input('permission_id')) 
        {
            
            $qry=$request->input('permission_id');
           
            $results = $results->WhereIn($this->tablename.".permission_id",$qry);

            $acctype_id_url = http_build_query(array('permission_id' => $qry));
            array_push($querystr, $acctype_id_url);
            $appends = array_merge ($appends,['permission_id'=>$qry]);
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
        $results = $results->where($this->tablename . '.trash', '!=', 'yes');
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
        $counttrash = $this->model->where('trash', 'yes')->count();
        return view('app.' . $this->obj_info['name'] . '.index', compact(['counttrash','default']))
            ->with([

                'obj_info'  => $this->obj_info,
                'route' => [
                    'create'  => $create_route,
                    'trash' => $trash_route
                ],
                'fprimarykey'     => $this->fprimarykey,
                'caption' => 'Active',
            ])
            ->with(['act' => 'index'])
            ->with($sfp)
            ->with($setting);
    }

    public function trash(Request $request, $condition = [], $setting = [])
    {
        $default = $this->default();

        $results = $this->listingmodel();
        $results = $results->where($this->tablename . '.trash', '=', 'yes');
        $sfp = $this->sfp($request, $results);

        //return \Redirect::to('/test/index');
        $create_route = url_builder(
            $this->obj_info['routing'],
            [
                $this->obj_info['name'], 'create', ''
            ],
        );

        $index_route = url_builder(
            $this->obj_info['routing'],
            [
                $this->obj_info['name'], 'index', ''
            ],
        );

        $import_route = url_builder(
            $this->obj_info['routing'],
            [
                $this->obj_info['name'], 'import', ''
            ],
        );

        return view('app.' . $this->obj_info['name'] . '.index', compact(['default']))
            ->with([
                'obj_info'  => $this->obj_info,
                'route' => [
                    'create'  => $create_route,
                    'active' => $index_route,
                    'import'    => $import_route,
                ],
                'fprimarykey'     => $this->fprimarykey,
                'caption' => __('dev.trash'),
                'istrash' => true,
            ])
            ->with(['act' => 'trash'])
            ->with($sfp)
            ->with($setting);
    }



    public function validator($request, $isupdate = false)
    {
        $newid = ($isupdate) ? $request->input($this->fprimarykey)  : $this->model->max($this->fprimarykey) + 1;
        $update_rules = [$this->fprimarykey => 'required'];

        $rules['name']      = ['required', 'string'];
        $rules['email']      = ['required', 'string', 'email', 'max:255'];
        $rules['permission_id']      = ['required', 'gt:0'];
       


        $validatorMessages = [
            /*'required' => 'The :attribute field can not be blank.'*/
            'required' => __('dev.fieldreqire'),
            'gt' => __('dev.fieldreqire'),
            'distinct' => __('dev.fielddistinct')
        ];


        if ($isupdate) {
            $rules['name']      = ['required', 'string', 'unique:users,name,' . $newid];
            $rules['email']      = ['required', 'string', 'email', 'max:255', 'unique:users,email,' . $newid];
            $rules = array_merge($rules, $update_rules);
        } else {
            // $rules['password']      = ['required', 'string', 'min:6', 'confirmed'];
            $rules['password'] = [
                'required',
                'string',
                'min:6',
                'confirmed',
                'regex:/[a-z]/',
                'regex:/[A-Z]/',
                'regex:/[0-9]/',
                'regex:/[@$!%*#?&]/',
            ];
        }
        return Validator::make($request->input(), $rules, $validatorMessages);
    }

    public function setinfo($request, $isupdate = false)
    {
        $newid = ($isupdate) ? $request->input($this->fprimarykey)  : $this->model->max($this->fprimarykey) + 1;
        $permission_id = !empty($request->input('permission_id')) ? $request->input('permission_id') : 0;
        $tableData=[];
        $record = [

            'id' => $newid,
            'name' => $this->setvalue->set($request->name)->toString()->get(),
            'email'    => $this->setvalue->set($request->email)->toString()->get(),
            'phonenumber'    => $this->setvalue->set($request->phonenumber)->toString()->get(),
            'fullname'   => $this->setvalue->set($request->fullname)->toString()->get(),
            'password' =>  Hash::make($request->input('password')),
            'permission_id' => $permission_id,
            'group_id'  => 0,
            'branch_id'     => $this->setvalue->set($request->branch_id ?? 0)->toInteger()->get(),
            'warehouse_id'   => $this->setvalue->set($request->warehouse_id ?? 0)->toInteger()->get(),
            'province_id'  => $this->setvalue->set($request->province_id ?? 0)->toInteger()->get(),
            'district_id'     => $this->setvalue->set($request->district_id ?? 0)->toInteger()->get(),
            'commune_id'   => $this->setvalue->set($request->commune_id ?? 0)->toInteger()->get(),

            'locations'  => '',
            'userstatus' => $this->setvalue->set($request->userstatus)->toString()->get(),
            'extra'   => '',
            'extra_fix'   => '',
            'created_at'    => $this->setvalue->set()->toTimestamp()->get(),
            'updated_at'    => $this->setvalue->set()->toTimestamp()->get(),
            'trash'     => 'no',
            'blongto' => $this->args['userinfo']['id'],

        ];
        if ($isupdate) {
            $record = array_except($record, [
                'password',
                'created_at',
                'trash',
                'blongto'
            ]);

            if(is_topadmin($this->args['userinfo']['id'], $permission_id)){
                $record = array_except($record, [
                    'permission_id',
                    'userstatus',
                ]);
            }
        }

        array_push($tableData, $record);
        return ['tableData' => $tableData, 'id' => $newid];
    }

    public function create()
    {
        $default = $this->default();
        $sumit_route = url_builder(
            $this->obj_info['routing'],
            [$this->obj_info['name'], 'store', ''],
            [],
        );

        $cancel_route = redirect()->back()->getTargetUrl();
        return view('app.' . $this->obj_info['name'] . '.create',  compact(['default']))
            ->with([
                'obj_info'  => $this->obj_info,
                'route' => ['submit'  => $sumit_route, 'cancel' => $cancel_route],
                'form' => ['save_type' => 'save'],
                'fprimarykey'     => $this->fprimarykey,
                'caption' => 'New',
                'isupdate' => false,

            ]);
    } /*../function..*/

    public function validation(Request $request)
    {
        $obj_info = $this->obj_info;
        $routing = url_builder($obj_info['routing'], [$obj_info['name'], 'create']);
        $isupdate = false;
        if (null !== $request->input('isupdate')) {
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

        $input = $this->model
            ->where($this->fprimarykey, (int)$editid)
            ->whereRaw(where_not_trush())
            // ->whereRaw(where_not_topadmin())
            ;
        // dd($this->args['userinfo']);
        if(!is_topadmin($this->args['userinfo']['blongto'], $this->args['userinfo']['permission_id'])){
            $input = $input->whereRaw(where_not_topadmin());
        }
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
                'input' => $input,
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

    public function userlist($condition = [], $setting = [])
    {
        $results = $this->listingmodel();
        $results = $results->where($this->tablename . '.trash', '!=', 'yes');
        return $results->pluck('fullname', 'id');
    }

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
        $trash = $this->model
            ->where('trash', 'no')
            ->where($this->fprimarykey, $editid)
            ->where($this->fprimarykey, '<>', 1)
            ->where('branch_id', $this->args['userinfo']['branch_id'])
            ->update(["trash" => "yes"]);

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

    public function restore(Request $request, $id = 0)
    {
        $obj_info = $this->obj_info;
        #Retrieve Data#
        if (empty($id)) {
            $editid = $this->args['routeinfo']['id'];
        } else {
            $editid = $id;
        }

        $routing = redirect()->back()->getTargetUrl();
        $restore = $this->model->where($this->fprimarykey, $editid)->update(["trash" => "no"]);
        if ($restore) {
            return response()
                ->json(
                    [
                        "type" => "url",
                        'status' => true,
                        'route' => ['url' => $routing],
                        "message" => __('dev.suc_restore'),
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

}

/*


ALTER TABLE `users` ADD `province_id` INT NOT NULL AFTER `warehouse_id`, ADD `district_id` INT NOT NULL AFTER `province_id`, ADD `commune_id` INT NOT NULL AFTER `district_id`;

*/
