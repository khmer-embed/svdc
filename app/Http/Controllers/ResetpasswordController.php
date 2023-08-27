<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use Validator;
use DB;
use Illuminate\Support\Facades\Hash;

use App\Models\User;
use App\Models\UserPermission;
use App\Models\Branch;
use App\Models\Warehouse;

use Setvalue;

class ResetpasswordController extends Controller
{
    //
    private $obj_info = ['name' => 'resetpassword', 'routing' => 'admin.controller', 'title' => 'Reset Password', 'icon' => '<i class="fas fa-key"></i>'];
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
        $this->obj_info['title'] = 'Reset Password'; //__('label.lb09');

        $default_protectme = config('dev.app.protectme');
        $this->protectme = null;

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
       
    } /*../function..*/

    /**
     * Show the application dashboard.
     *
     * @return \Illuminate\Contracts\Support\Renderable
     */
    public function index(Request $request, $condition = [], $setting = [])
    {
        
    }

    public function trash(Request $request, $condition = [], $setting = [])
    {
    }



    public function validator($request, $isupdate = false)
    {
        $newid = ($isupdate) ? $request->input($this->fprimarykey)  : $this->model->max($this->fprimarykey) + 1;
        $update_rules = [$this->fprimarykey => 'required'];
        $user = $this->args['userinfo'];
        $rules['password'] = [
            'required',
            // function ($attribute, $value, $fail) use ($user) {
            //     if (!\Hash::check($value, $user['pwd'])) {
            //         return $fail('Wrong Password');
            //     }
            // }

            function ($attribute, $value, $fail) {
                if (!Hash::check($value, \Auth::user()->password)) {
                    $fail('Current Password didn\'t match');
                }
            }
        ];
        $rules['newpassword'] = [
            'required',
            'string',
            'min:6',
            'regex:/[a-z]/',
            'regex:/[A-Z]/',
            'regex:/[0-9]/',
            'regex:/[@$!%*#?&]/',
        ];

        $rules['password_confirmation'] = ['required','same:newpassword' ];


        $validatorMessages = [
            /*'required' => 'The :attribute field can not be blank.'*/
            'required' => __('dev.fieldreqire'),
            'gt' => __('dev.fieldreqire'),
            'distinct' => __('dev.fielddistinct')
        ];

        return Validator::make($request->input(), $rules, $validatorMessages);
    }

    public function setinfo($request, $isupdate = false)
    {
        $newid = ($isupdate) ? $request->input($this->fprimarykey)  : $this->model->max($this->fprimarykey) + 1;
        $tableData = [];
        $record = [
            'password' =>  Hash::make($request->input('newpassword')),
        ];
        

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
            $editid = $this->args['userinfo']['id'];
        } else {
            $editid = $id;
        }

        if ($request->has($this->fprimarykey)) {
            $editid = $request->input($this->fprimarykey);
        }

        $input = $this->model
            ->where($this->fprimarykey, (int)$editid)
            ->get();
        // dd($input->toSql());
        if ($input->isEmpty()) {
            $routing = url_builder($obj_info['routing'], [$obj_info['name'], 'index']);
            return response()
                ->json(
                    [
                        "type" => "error",
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
        if ($validation_decode->status) {
            $data = $this->setinfo($request, true);
            return $this->proceed_update($request, $data, $obj_info);
        } else {
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
}
