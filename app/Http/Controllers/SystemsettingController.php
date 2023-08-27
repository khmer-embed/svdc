<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use Validator;
use Illuminate\Validation\Rule;
use File;

use App\Models\Systemsetting;
use Setvalue;

class SystemsettingController extends Controller
{
    //
    private $obj_info = ['name' => 'systemsetting', 'routing' => 'admin.controller', 'title' => 'System', 'icon' => '<i class="fas fa-cogs"></i>'];
    public $args;

    private $model;
    private $tablename;
    private $fprimarykey = 'id';
    private $protectme = null;

    private $setvalue;

    private $optioninput;
    private $textinput;

    public $dflang;
    private $rcdperpage = 15; #record per page, set zero to get all record# set -1 to use default

    /**
     * Create a new controller instance.
     *
     * @return void
     */
    public function __construct(array $args = [])
    {
        //$this->middleware('auth');
        $this->obj_info['title'] = 'System Setting'; //__('label.lb09');

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
                'print' => ['cover' => ['print'], 'title' => 'Print'],
            ]
        ];

        $this->args = $args;
        $this->model = new Systemsetting;

        $this->tablename = $this->model->gettable();
        $this->dflang = df_lang();
        $this->setvalue = new Setvalue();

        $this->optioninput = [
            'telegramtoken' => '',
            'telegramid' => '',
            'dashboardform' => '',
            'provincefield' => 'cProvince',
            'districtfield' => 'cDistrict',
            'communefield' => 'cCommune',
            'metabaseurl' => '',
            'metabasesecret' => '',
            'metabasedashboard' => '',
            'metabasequestion' => '',
            'phpmyadmin' => '',
            

           
        ];

        $this->textinput = [
            'storagedisk' => 'public',
            'storagepath' => db(),
            'backgroundimage' =>'',
            'partnerimage' => '',
            'disclaimer' => '',
        ];

       

        $editid = 1;
        $input = $this->model->where($this->fprimarykey, (int)$editid)->get(); 
        if($input->isEmpty())
        {
            $savedata = $this->model->insert([
                $this->fprimarykey=>1,
              'optioninput' => json_encode($this->optioninput),
              'textinput' => json_encode($this->textinput),
              'main_currency'   => '',
              'sub_currency'    => '',
              'idformat'    => '',
              'accounting'  => '',
              'printing'   => '',
              'blongto' => 1
            ]);

            
        }
        
   

    }

    public function __destruct(){

        $input = $this->retrieveData();
        $this->writedata($input);
    

    } /*../function..*/

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
        

        return [
            
        ];
    } /*../function..*/

    public function listingModel()
    {

        return null;
    } /*../function..*/
    //JSON_UNQUOTE(JSON_EXTRACT(title, '$.".$this->dflang[0]."'))

    public function sfp($request, $results)
    {
        return null;
    } /*../function..*/

    /**
     * Show the application dashboard.
     *
     * @return \Illuminate\Contracts\Support\Renderable
     */
    public function index(Request $request, $condition = [], $setting = [])
    {
        
        $obj_info = $this->obj_info;
        $default = $this->default();
        $input = null;

        #Retrieve Data#
        $input = null;
        #Retrieve Data#
        $input = $this->retrieveData();

        // dd($input);

       
        $sumit_route = url_builder(
            $this->obj_info['routing'],
            [$this->obj_info['name'], 'update', ''],
            [],
        );
        $cancel_route = redirect()->back()->getTargetUrl();

        $codermode= 'hide';
        if(isset($this->args['routeinfo']['id']) && !empty($this->args['routeinfo']['id'])){
            $codermode = '';
        }
    
        return view(
            'app.' . $this->obj_info['name'] . '.create',
            compact(['default','codermode',])
        )
            ->with([
                'obj_info'  => $this->obj_info,
                'route' => ['submit'  => $sumit_route,  'cancel' => $cancel_route],
                'form' => ['save_type' => 'save'],
                'fprimarykey'     => $this->fprimarykey,
                'caption' => 'Edit',
                'isupdate' => true,
                'input' => $input,
            ]);
    }

    public function trash(Request $request, $condition = [], $setting = [])
    {
        return null;
    }
    public function validator($request, $isupdate = false)
    {
        return null;
    }

    public function setinfo($request, $isupdate = false)
    {
        // dd($request->input());
        $newid=1;
        //
        $main_fields = ['optioninput', 'textinput'];
        $all_input=[];
        foreach ($main_fields as $main_field) 
        {
            $input_tags = array_keys($this->$main_field);
            foreach ($input_tags as $field) 
            {
                $all_input[$main_field][$field]=$request->input($field)??'';
                    
            }
                
        }
        $tableData = [
            $this->fprimarykey=>1,
        ];
        $tableData = array_merge($tableData, $all_input);
        return ['tableData' => $tableData, 'id'=>$newid];
    }

    public function create()
    {
        return null;
    } /*../function..*/

    public function validation(Request $request)
    {
        return null;
    }

    public function store(Request $request)
    {
        return null;
    }
    /* end function*/
    

    public function edit(Request $request, $id = 0)
    {
        return null;
    } /*../end fun..*/

    public function update(Request $request)
    {
        $obj_info = $this->obj_info;
        $routing = url_builder($obj_info['routing'], [$obj_info['name'], 'create']);
        if ($request->isMethod('post')) {
            $data = $this->setinfo($request, true);
            // dd($data);
            return $this->proceed_update($request, $data, $obj_info);
        } /*end if is post*/

        return response()
            ->json(
                [
                    "type" => "error",
                    "message" => __('dev.fail_edit'),
                    "data" => []
                ],
                422
            );
    }/*../end fun..*/

    function proceed_update($request, $data, $obj_info)
    {
        $update_status[] = $this->model
            ->where($this->fprimarykey, $data['id'])
            ->update($data['tableData']);
            

        $return_type = "url";
        if (count($update_status) > 0) {
            $rout_to = url_builder(
                $this->obj_info['routing'],
                [$this->obj_info['name'], 'index', ''],
                [],
            );
            $success_ms = __('dev.suc_save');
            $route = ['url' => $rout_to];
            $callback = '';
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
        return null;
    }

    /* end function*/

    public function restore(Request $request, $id = 0)
    {
        return null;
    }

    /* end function*/

    public function delete(Request $request, $id = 0)
    {
        return null;
    }

    public function retrieveData(){
        $editid = 1;
        $input = $this->model->where($this->fprimarykey, (int)$editid)->get();
        $input = $input->toArray()[0];
        
      
        #extract#
        $data_input = array_merge(
            json_decode($input['optioninput'], TRUE), 
            json_decode($input['textinput'], TRUE),
        );
        $input_tag=[];
        if(!empty($data_input))
        foreach ($data_input as $key => $value) {
            $input_tag[$key]=$value;
        }
        return $input_tag;
    }

    public function writedata($input){
        config(['sysconfig' => $input]);
        $text = '<?php return ' . var_export(config('sysconfig'), true) . ';';
        $databaseName = db();
        $storageDir = config_path('sys');
        if(!File::exists($storageDir)){
            File::makeDirectory($storageDir, 0777, true, true);
        }
        file_put_contents(config_path('sys/'.$databaseName.'_sysconfig.php'), $text);
    }


   

    
}
