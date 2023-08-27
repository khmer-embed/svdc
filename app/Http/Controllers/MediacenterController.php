<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use Validator;
use DB;
use Storage;
use App\Models\MediaCenter;
use Setvalue;

class MediacenterController extends Controller
{
    //
    private $obj_info = ['name' => 'mediacenter', 'routing' => 'admin.controller', 'title' => 'Media Center', 'icon' => '<i class="fas fa-photo-video"></i>'];
    public $args;

    private $model;
    private $submodel;
    private $tablename;
    private $fprimarykey = 'id';
    private $protectme = null;

    public $dflang;
    private $rcdperpage = 18; #record per page, set zero to get all record# set -1 to use default
    private $users;

    private $setvalue;
    private $disk = 'public'; //s3 or public
    private $path = 'uploads';
    /**
     * Create a new controller instance.
     *
     * @return void
     */
    public function __construct(array $args = [])
    {
        //$this->middleware('auth');
        // dd($args['userinfo']);
        $this->obj_info['title'] = 'Media Center'; //__('label.lb09');

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
        $this->model = new MediaCenter;
        $this->tablename = $this->model->gettable();
        $this->dflang = df_lang();
        $this->path = db();
        $this->setvalue = new Setvalue();
        // dd(filepath("s3"));
        
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
        return $this->model
        ->select(\DB::raw(   $this->fprimarykey." AS id, media, filename, media_type"));
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

        if ($request->has('textsearch')) 
        {
            $qry=$request->input('textsearch');
            $results = $results->whereRaw("(lower(JSON_UNQUOTE(filename)) like '%".strtolower($qry)."%' or media like '%".strtolower($qry)."%')");
            array_push($querystr, 'textsearch='.$qry);
            $appends = array_merge ($appends,['textsearch'=>$qry]);
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
                        'paginationlinks'    => $this->setvalue->set($pagination->links("pagination::bootstrap-4"))->toSilentPagination($this->obj_info['name'] . "-create-app")->get(),
                        'recordinfo'    => $recordinfo,
                        'sort'          => $sort,
                        'order'         => $order,
                        'querystr'      => $querystr,
                        'perpage_query' => $perpage_query
                    ];
    } /*../function..*/

    public function page(Request $request, $condition=[], $setting=[])
    {
        $results = $this->listingmodel();
        $sfp = $this->sfp($request, $results);
        $file_path = filepath();
      
        return view('app.'.$this->obj_info['name'].'.index')
        ->with([
            'obj_info'  => $this->obj_info,
            'fprimarykey'     => $this->fprimarykey,
            'file_path' => $file_path,
        ])
        ->with(['act' => 'index'])
        ->with($sfp)
        ->with($setting)
        ->render()
        ;
    }


    /**
     * Show the application dashboard.
     *
     * @return \Illuminate\Contracts\Support\Renderable
     */
    public function index(Request $request, $condition = [], $setting = [])
    {
        $default = $this->default();
        $sumit_route = url_builder(
            $this->obj_info['routing'],
            [$this->obj_info['name'], 'store', ''],
            [],
        );
        $cancel_route = redirect()->back()->getTargetUrl();

        $page = $this->page($request);
        
        if($request->has('page') || $request->has('formsearch')){
            return response()
            ->json(
                [
                "message"=> '',
                "html" => $this->page($request),
                ], 200); 
        }

        return view('app.' . $this->obj_info['name'] . '.create',  compact(['page']))
            ->with([
                'obj_info'  => $this->obj_info,
                'route' => ['submit'  => $sumit_route, 'cancel' => $cancel_route],
                'form' => ['save_type' => 'save'],
                'fprimarykey'     => $this->fprimarykey,
                'caption' => 'New',
                'isupdate' => false,
            ]);
    }


    public function trash(Request $request, $condition = [], $setting = [])
    {
    }



    public function validator($request, $isupdate = false)
    {
        $update_rules = [$this->fprimarykey => 'required'];


        $rules['f_media.*']      = [config('dev.app.uploadable'), 'max:2048']; //2048 = 2Mb
        if (!empty($request->txt_media)) {
            $rules['txt_media']      = ['url'];
        }
        if (!empty($request->mwidth)) {
            $rules['mwidth']      = ['numeric'];
        }

        if (!empty($request->mheight)) {
            $rules['mheight']      = ['numeric'];
        }


        $validatorMessages = [
            /*'required' => 'The :attribute field can not be blank.'*/
            'required' => 'The :attribute field can not be blank.',
        ];


        if ($isupdate) {
            $rules = array_merge($rules, $update_rules);
        }
        return Validator::make($request->all(), $rules, $validatorMessages);
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
        return view('app.' . $this->obj_info['name'] . '.create',  compact([]))
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
    public function setinfo($request, $isupdate = false){
        $mediadata = [];
        if ($request->hasfile('f_media')) {
            foreach ($request->file('f_media') as $key => $file) {
                $orginal_name = $file->getClientOriginalName();
                $fileName = sanitize_filename($orginal_name);
                $fileName = preg_replace_callback('/\.\w+$/', function ($m) {
                    return strtolower($m[0]);
                }, $fileName);

                $fileName = time() . '_' . $fileName;
                $filePath = $file->storeAs($this->path, $fileName, $this->disk);
                array_push(
                    $mediadata,
                    [
                        "media" => $fileName,
                        "filename" => $orginal_name,
                        "media_type" => "upload",
                        "disk" => $this->disk,
                        "mwidth"         => 0,
                        "mwidth"        => 0
                    ]
                );
            }
        }

        //for handling from Mobile/3rd party Upload;
        if($request->has('files')){
            $files =  $request->input('files');
            foreach ($files as $file) {
                $orginal_name = $file['name'];
                $fileName = sanitize_filename($orginal_name);
                $fileName = preg_replace_callback('/\.\w+$/', function ($m) {
                    return strtolower($m[0]);
                }, $fileName);
                $fileName = time() . '_' . $fileName;
                $binary_data = base64_decode($file['file']);
                $upload_status[] = Storage::disk($this->disk)->put($this->path . '/' . $fileName, $binary_data);
                array_push(
                    $mediadata,
                    [
                        "media" => $fileName,
                        "filename" => $orginal_name,
                        "media_type" => "upload",
                        "disk" => $this->disk,
                        "mwidth"         => 0,
                        "mwidth"        => 0
                    ]
                );
                //
            }
        }

        if (!empty($request->input('webcam'))) {
            $encoded_data  = $request->input('webcam');
            $binary_data = base64_decode($encoded_data);
            $filename = (string)(date("jnY")) . time() . '_webcam.jpg';
            $upload_status = Storage::disk($this->disk)->put($this->path . '/' . $filename, $binary_data);
            if ($upload_status) {
                array_push(
                    $mediadata,
                    [
                        "media" => $filename,
                        "filename" => $filename,
                        "media_type" => "webcam",
                        "disk" => $this->disk,
                        "mwidth"         => 0,
                        "mwidth"        => 0,
                    ]
                );
            }
        }
        // 
        if (!empty($request->input('txt_media'))) {
            $name = $this->setvalue->set($request->txt_media)->toString()->get();
            array_push(
                $mediadata,
                [
                    // to get file name
                    "media" => $this->setvalue->set($request->txt_media)->toString()->get(),
                    "filename" => basename($name),
                    "media_type" => "cloud",
                    "disk" => "",
                    "mwidth"        => $this->setvalue->set($request->mwidth)->toInteger()->get(),
                    "mheight"       => $this->setvalue->set($request->mheight)->toInteger()->get(),
                ]
            );
        }
        // 


        $tabledata = [];
        foreach ($mediadata as $data) {
            array_push(
                $tabledata,
                [
                    //"id"            => '', 
                    "filecategory_id"         => 0,
                    "media_type"    => $data['media_type'],
                    "media"         => $data['media'],
                    "filename"      => $data['filename'],
                    "mwidth"        => $data['mwidth'],
                    "mheight"       => $data['mwidth'],
                    "disk"          => $data['disk'],
                    "path"          => $this->path,
                    "url"           => '',
                    "extra"         => '{}',
                    "fix_extra"     => '{}',
                    "blongobj"      => 'public',
                    "blongto"       =>  $this->args['userinfo']['id'],
                ]
            );
        }

        return ['tabledata' => $tabledata, 'mediadata' => $mediadata];
    }

    public function store(Request $request)
    {

        $obj_info = $this->obj_info;
        $routing = url_builder($obj_info['routing'], [$obj_info['name'], 'create']);
        if ($request->isMethod('post')) {
            $validator = $this->validator($request);
            if ($validator->fails()) {

                $routing = url_builder($obj_info['routing'], [$obj_info['name'], 'create']);
                return response()
                    ->json(
                        [
                            "type" => "validator",
                            'status' => false,
                            'route' => ['url' => $routing],
                            "message" => __('dev.forminvalid'),
                            "data" => $validator->errors()
                        ],
                        422
                    );
            }
            return $this->proceed_store($request, $obj_info);
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
    /* end function*/

    function proceed_store($request, $obj_info=[])
    {
        $setinfo = $this->setinfo($request);
        $mediadata = $setinfo['mediadata'];
        $tabledata = $setinfo['tabledata'];
        $save_status = false;
        if(!empty($tabledata)){
            $save_status = $this->model->insert($tabledata);
        }
        
        if ($save_status) {
            $success_ms = __('dev.suc_save');
            $callback = 'aftersaved';
            if(is_axios() && !empty($request->jscallback)){
                $callback = $request->jscallback;
            }
            return response()
            ->json(
                [
                "type"=>"success", 
                "status" => $save_status,
                "message"=> $success_ms, 
                "callback" => $callback,
                "data" => $mediadata,
                "tabledata" => $tabledata,
                "html" => $this->page($request),
                ], 200);
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
        return null;
    } /*../end fun..*/

    public function update(Request $request)
    {
        return null;
    }/*../end fun..*/

    function proceed_update($request, $data, $obj_info)
    {

        return null;
    }
    /* end function*/

    public function totrash(Request $request, $id = 0)
    {
    }
}
