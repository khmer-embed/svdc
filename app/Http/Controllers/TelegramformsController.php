<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use Validator;
use Illuminate\Validation\Rule;
use DB;

use App\Models\Telegramforms;

use App\Rules\CustomUnique;
use Setvalue;

class TelegramformsController extends Controller
{
    //
    private $obj_info = ['name' => 'telegramforms', 'routing' => 'admin.controller', 'title' => 'Telegram Forms', 'icon' => '<i class="fas fa-puzzle-piece"></i>'];
    public $args;

    public $model;
    public $model_content;
    public $model_file;
    private $tablename;
    private $tablenamesub;
    private $fprimarykey = 'id';
    public $foreignkey = 'product_id';
    private $protectme = null;

    private $setvalue;

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
        $this->obj_info['title'] = 'Telegram Forms'; //__('label.lb09');

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
        $this->model = new Telegramforms;
        

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
        

        return [
        ];
    } /*../function..*/

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
                    ->where("title", "like", "%" . $qry . "%")
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
            'paginationsilent'    => $this->setvalue->set($pagination->links("pagination::bootstrap-4"))->toSilentPagination($this->obj_info['name'] . "-create-app")->get(),
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

        $import_route = url_builder(
            $this->obj_info['routing'],
            [
                $this->obj_info['name'], 'import', ''
            ],
        );
        $counttrash = $this->model->where('trash', 'yes')->count();
        return view('app.' . $this->obj_info['name'] . '.index', compact(['counttrash']))
            ->with([
                'obj_info'  => $this->obj_info,
                'route' => [
                    'create'  => $create_route,
                    'trash' => $trash_route,
                    'import'  => $import_route,
                ],
                'fprimarykey'     => $this->fprimarykey,
                'caption' => __('dev.active'),
            ])
            ->with(['act' => 'index'])
            ->with($sfp)
            ->with($setting);
    }

    public function browse(Request $request, $condition = [], $setting = []){
        $page = $this->browsepage($request);
        if($request->has('page') || $request->has('formsearch')){
            return response()
            ->json(
                [
                "message"=> '',
                "html" => $page,
                ], 200); 
        }
        
        return view('app.' . $this->obj_info['name'] . '.browse',  compact(['page']))
            ->with([
                'obj_info'  => $this->obj_info,
                'form' => ['save_type' => 'save'],
                'fprimarykey'     => $this->fprimarykey,
                'caption' => 'New',
                'isupdate' => false,
            ]);
    }


    public function browsepage(Request $request, $condition=[], $setting=[])
    {
        $results = $this->listingmodel();
        $results = $results->where($this->tablename . '.trash', '<>', 'yes');
        $sfp = $this->sfp($request, $results);
    
        return view('app.'.$this->obj_info['name'].'.browsepage')
        ->with([
            'obj_info'  => $this->obj_info,
            'fprimarykey'     => $this->fprimarykey,
        ])
        ->with(['act' => 'index'])
        ->with($sfp)
        ->with($setting)
        ->render()
        ;
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

        return view('app.' . $this->obj_info['name'] . '.index', compact([]))
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

        $numrecord = count($request->input('telegramtitle'));

        for ($i = 0; $i < $numrecord; $i++) {
            if ($isupdate) {
                $rules['telegramtitle.' . $i]      = ['required', new CustomUnique($this->tablename, "table_name=? and " . $this->fprimarykey . "<>?", [$request->input('telegramtitle')[$i], $request->input($this->fprimarykey)[0]])];
            } else {

                $rules['telegramtitle.' . $i]      = ['required', new CustomUnique($this->tablename, "table_name=?", [$request->input('telegramtitle')[$i]])];
            }
        }

        if($isupdate){
            $rules=array_merge($rules, $update_rules);
        }

        $validatorMessages = [
            /*'required' => 'The :attribute field can not be blank.'*/
            'required' => __('dev.fieldreqire'),
            'gt' => __('dev.fieldreqire'),
        ];
        
        return Validator::make($request->input(), $rules, $validatorMessages);
    }



    public function setinfo($request, $isupdate = false)
    {

        $newid = ($isupdate) ? $request->input($this->fprimarykey)[0]  : $this->model->max($this->fprimarykey) + 1;
        $tableData = [];

        /* Extra Field */
        $count_extrafields = count($request->input('telegramtitle')??[]);
        $field_partern = ['telegramtitle', 'kobofield'];
        $extra_fields = [];
        for($e=0; $e<$count_extrafields ; $e++){
           foreach ($field_partern as $extra) {
               foreach (config('dev.app.multilang') as $lang) {
                $extra_record[$extra] = $request->input($extra)[$e]??"";
               }
            }
            array_push($extra_fields, $extra_record);
        }
        dd($extra_fields);
        $record = [
            $this->fprimarykey => $newid,
            'ordering'  => $this->setvalue->set($request->ordering)->toInteger()->get(),
            'trash' => 'no',
            'blongto' => $this->args['userinfo']['id']
        ];

        if ($isupdate) {
            $record = array_except($record, [
                // $this->fprimarykey,
                'blongto'
            ]);
        }
        array_push($tableData, $record);
        return [
            'tableData' => $tableData,
            'id' => $newid
        ];
        
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
        return view(
            'app.' . $this->obj_info['name'] . '.create',
            compact([])
        )
            ->with([
                'obj_info'  => $this->obj_info,
                'route' => ['submit'  => $sumit_route, 'cancel' => $cancel_route],
                'form' => ['save_type' => 'save'],
                'fprimarykey'     => $this->fprimarykey,
                'caption' => __('dev.new'),
                'isupdate' => false,

            ]);
    } /*../function..*/

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
        
    }
    /* end function*/

    /* end function*/
    public function retrieve_subform($model, $editid, $dflang, $useremianqty = false)
    {
        $tablename = $model->gettable();
        $input = [];
        $subform_qry = $model
            ->where('parent_id', $editid)
            ->orderby($tablename . '.id', 'asc')
            ->get();
        if (!$subform_qry->isEmpty()) {
            $input = $subform_qry->toArray();
        }
        return $input;
    }
    /* end function*/

    public function edit(Request $request, $id = 0)
    {
        $obj_info = $this->obj_info;

        $default = $this->default();
        $cat_tree = $default['cat_tree'];
        $category_list = $default['category_list'];
        $allsizes = $default['sizes'];
        $allcolors = $default['colors'];
        $unit = $default['unit'];
        $input = null;

        #Retrieve Data#
        if (empty($id)) {
            $editid = $this->args['routeinfo']['id'];
        } else {
            $editid = $id;
        }

        if ($request->has('ids')) {
            $editid = $request->get('ids');
        } elseif ($request->has($this->fprimarykey)) {
            $editid = $request->input($this->fprimarykey);
        }
        $editid = explode('-', $editid);

        $input = $this->model->whereIn($this->fprimarykey, $editid)->get();
        if ($input->isEmpty()) {
            $routing = url_builder($obj_info['routing'], [$obj_info['name'], 'index']);
            return response()
                ->json(
                    [
                        "type" => "url",
                        'status' => false,
                        'route' => ['url' => $routing],
                        "message" => __('dev.fail_edit'),
                        "data" => ['id' => $editid]
                    ],
                    422
                );
        }

        $medias_qry = $this->model_file->whereIn($this->foreignkey, $editid)->get();
        $medias = [];
        if (!$medias_qry->isEmpty()) {
            $medias = $medias_qry->toArray();
        }

        /* Retrieve from Translate */
        $content_qry = $this->model_content->whereIn($this->foreignkey, $editid)->get();
        $contents = [];

        if (!$content_qry->isEmpty()) {
            //$translate_qry = $translate_qry->toArray();

            foreach ($content_qry as $key => $value) {
                $lang = $value->lg_code;
                $tran = $value->translate;
                $tran_decode = json_decode($tran, TRUE);

                foreach ($tran_decode as $key => $value) {
                    $contents[$key . '-' . $lang] = $value;
                }
            }
        }
        //dd($contents);

        $input = $input->toArray();
        $input = $input[0];
        // dd($input);
        $subform = json_decode($input['madewith'], true);
        $sumit_route = url_builder(
            $this->obj_info['routing'],
            [$this->obj_info['name'], 'update', ''],
            [],
        );

        $cancel_route = redirect()->back()->getTargetUrl();
        return view(
            'app.' . $this->obj_info['name'] . '.create',
            compact([
                'cat_tree',
                'category_list',
                'unit',
                'allsizes',
                'allcolors',
            ])
        )
            ->with([
                'obj_info'  => $this->obj_info,
                'route' => ['submit'  => $sumit_route,  'cancel' => $cancel_route],
                'form' => ['save_type' => 'save'],
                'fprimarykey'     => $this->fprimarykey,
                'caption' => 'Edit',
                'isupdate' => true,
                'madewith_ban' => $editid,
                'input' => $input,
                'subform' => $subform,
                'medias' => $medias,
                'contents' => $contents,

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
        $trash = $this->model->where($this->fprimarykey, $editid)->update(["trash" => "yes"]);
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
        $deleted = $this->model->where($this->fprimarykey, $editid)->delete();
        if ($deleted) {
            $deleted_content = $this->model_content->where($this->fprimarykey, $editid)->delete();
            $deleted_file = $this->model_file->where($this->fprimarykey, $editid)->delete();
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

    public function clone(Request $request, $id = 0)
    {
        $obj_info = $this->obj_info;
        #Retrieve Data#
        if (empty($id)) {
            $editid = $this->args['routeinfo']['id'];
        } else {
            $editid = $id;
        }

        $replicate = $this->model->where($this->fprimarykey, (int)$editid)->get()->toArray()[0];

        #extract title#
        $data_title = json_decode($replicate['title'], TRUE);
        $title = [];
        foreach ($data_title as $key => $value) {
            $title[$key] = $value;
        }
        $newtitle = copyTitle($title[$this->dflang[0]], '', $this->model, "JSON_UNQUOTE(title->'$." . $this->dflang[0] . "')");
        $title[$this->dflang[0]] = $newtitle;
        $newid = $this->model->max($this->fprimarykey) + 1;
        $replicate[$this->fprimarykey] = $newid;
        $replicate['title'] = json_encode($title);
        $replicate['visitor_counter'] = 0;
        $replicate['blongto'] = $this->args['userinfo']['id'];
        #Retrieve from Translate#
        $translate = $this->model_content->where($this->foreignkey, $editid)->get();
        $tranrecord = $translateData = [];
        if (!$translate->isEmpty()) {
            foreach ($translate as $key => $value) {
                $lang = $value->lg_code;
                $tran = $value->translate;

                $translateRecord = [
                    'id' => 0,
                    $this->foreignkey => $newid,
                    'lg_code' => $lang,
                    'translate' => $tran

                ];

                array_push($translateData, $translateRecord);
            }
        }
        $savedata = false;
        try {
            $transaction = DB::transaction(function () use ($replicate, $translateData) {
                $this->model->insert($replicate);
                $this->model_content->insert($translateData);
            });
            $savedata =  is_null($transaction) ? true : false;
            $message = __('dev.suc_clone');
        } catch (\Throwable $e) {
            // dd($e);
            $savedata = false;
            $message = __('dev.rqnvalid');
        }
        $routing = url_builder(
            $this->obj_info['routing'],
            [
                $this->obj_info['name'], 'index', ''
            ],
        );

        return response()
            ->json(
                [
                    "type" => "url",
                    'status' => $savedata ?? false,
                    'route' => ['url' => $routing],
                    "message" => $message,
                    "data" => ['id' => $editid]
                ],
                422
            );
    } /*../function..*/

    /*for api and default data*/
    public function apilistingmodel()
    {
        #DEFIND MODEL#

        $products = $this->modelquery()
            ->where('pos_product.trash', '!=', 'yes');
        // dd($products->get()->toArray());
        return $products;
    } /*../function..*/

    public function modelquery()
    {
        return $this->model
            ->leftJoin('pos_unit', 'pos_unit.id', '=', 'pos_product.unit_id')
            ->leftJoin('pos_product_category', 'pos_product_category.id', '=', 'pos_product.category_id')
            ->select(
                \DB::raw(
                    "pos_product.id AS id,
                            category_id,
                            barcode,
                            productcode,
                            sizes,
                            colors,
                            units,
                            unit_id,
                            printer_id,
                            costing,
                            pricing,
                            xtraprice,
                            xtracost
                            discount,
                            pvat,
                            madewith,
                            product_type,
                            isservice,
                            imginfo,
                            display,
                            JSON_UNQUOTE(pos_product.title->'$." . $this->dflang[0] . "') AS title,
                            JSON_UNQUOTE(pos_unit.title->'$." . $this->dflang[0] . "') AS unit"
                )
            );
    }
    /*end func*/

    public function madewith_condi()
    {
        return "LENGTH(madewith)>3";
    }

    public function madewith($subforms, $setting = [])
    {
        $products = [];
        foreach ($subforms as $item) {
            array_push($products, $item['product_id']);
        }
        $qry = $this->model
            ->leftJoin('pos_product_category', 'pos_product.id', '=', 'pos_product_category.id')
            ->select(
                "pos_product.id as id",
                "coa_idinv",
            )
            ->whereIn('pos_product.id', $products);

        $result = $qry->pluck('coa_idinv', 'id')->toArray();
        $rules = [];
        $data = [];
        if (!empty($result)) {
            foreach ($result as $id => $itm) {
                $rules['inventoryid_' . $id] = ['required', 'numeric', 'gt:0'];
                $data['inventoryid_' . $id] = $itm;
            }
        }

        $validatorMessages = [
            /*'required' => 'The :attribute field can not be blank.'*/
            'required' => __('dev.fieldreqire'),
            'gt' => __('dev.fieldreqire'),
            'numeric' =>  __('dev.fieldreqire'),
        ];

        return Validator::make($data, $rules, $validatorMessages);
    }
    /*end func*/

    /*============================= Start Import Stuff*/
    public function import(Request $request)
    {
        $obj_info = $this->obj_info;
        $default = $this->default();

        $importloaddata_route = url_builder(
            $this->obj_info['routing'],
            [
                $this->obj_info['name'], 'importloaddata', ''
            ],
        );

        $importstore_route = url_builder(
            $this->obj_info['routing'],
            [
                $this->obj_info['name'], 'importstore', ''
            ],
        );

        return view(
            'app.' . $this->obj_info['name'] . '.import',
            compact('obj_info')

        )->with(
            [
                'route' => [
                    'importloaddata' => $importloaddata_route,
                    'importstore'   => $importstore_route,
                ],
                'submitto'  => 'storeimport',
                'fprimarykey'     => $this->fprimarykey,
                'caption' => __('dev.import')
            ]
        );
    } /*../function..*/

    public function importloaddata(Request $request)
    {
        if ($request->isMethod('post')) {
            $obj_info = $this->obj_info;
            $validator = Validator::make($request->all(), [
                'file_import' => 'required|mimes:xls,xlsx,xlsm'
            ]);
            if ($validator->fails()) {

                return response()
                    ->json(
                        [
                            "type" => "error",
                            'status' => false,
                            "message" => __('dev.importinvalid'),
                        ],
                        422
                    );
            }
            $data = $this->importsetinfo($request);
            //Try validation here
            $validator = $this->importvalidation($data);
            if ($validator->fails()) {
                $routing = url_builder($obj_info['routing'], [$obj_info['name'], 'import']);
                return response()
                    ->json(
                        [
                            "type" => "validator",
                            'status' => false,
                            "message" => $validator->errors()->first(), // __('dev.importinvalid'),
                            'url' => $routing,
                        ],
                        422
                    );
            }
            //

            return view('app.' . $this->obj_info['name'] . '.importlist')->with(['results' => $data['spreadsheet']]);
        }
    }

    public function importvalidation($data)
    {

        $tableData = $data['tableData'];
        
        $count_record = count($tableData);
        $rules = [];
        $rules['*.'.$this->fprimarykey] = ['required', 'distinct'];
        for ($i = 0; $i < $count_record; $i++) {
            $rules[$i . '.' . $this->fprimarykey]       = 'required|distinct|unique:' . $this->model->gettable() . ',' . $this->fprimarykey;
            $rules[$i.'.category_id']       = ['required', 'numeric', 'min:1'];
            $rules[$i.'.unit_id']       = ['required', 'numeric', 'min:1'];
            
        }
        $validatorMessages = [
            /*'required' => 'The :attribute field can not be blank.'*/
            'required' => __('dev.fieldreqire'),
            'unique' => __('dev.fieldunique'),
            'distinct' => __('dev.fielddistinct')

        ];
        
        return Validator::make($tableData, $rules, $validatorMessages);
    }
    public function importsetinfo($request)
    {

        #loading and convert data to array from excel file
        /*
         $spreadsheet = IOFactory::load($request->file('file_import'));
         $sheetData = $spreadsheet->getActiveSheet()->toArray(null, true, true, true);
         $collectSheet = collect(array_values($sheetData));
         */

        $reader = \PhpOffice\PhpSpreadsheet\IOFactory::createReaderForFile($request->file('file_import'));
        $sheetname = ucfirst($this->obj_info['name']);
        $reader->setLoadSheetsOnly([$sheetname]);
        $reader->setReadDataOnly(true);
        $spreadsheet = $reader->load($request->file('file_import'));
        //$spreadsheet->getSheet(0);
        $sheetData = $spreadsheet->getActiveSheet()->toArray(null, true, true, true);
        $collectSheet = collect(array_values($sheetData));

        $collectSheet = $collectSheet->forget(0); // remmove first row
        $collectSheet = collect($collectSheet->values()->all()); // refill array key index

        $collectSheet = $collectSheet
        ->where('C', '!=', null)
        ->where('E', '>', 0)
        ->where('G', '>', 0)
        ->where('J', '!=', null);
        #table data format
        $tableData = [];
        $newid = $this->model->max($this->fprimarykey) + 1;
        $arr_col = ['C', 'L', 'M', 'N'];
        if ($collectSheet->count() > 0) {
            $customertype = $this->default()['customertype'];
            $post_date = $this->setvalue->set()->toDatetime()->get();


            foreach ($collectSheet as $row) {
                #title
                $title = [];
                $df_title = $row[$arr_col[0]] ?? '';
                $ind = 0;
                $df_title = $row[$arr_col[0]] ?? '';
                foreach (config('dev.app.multilang') as $lang) {

                    $row_name = $arr_col[$ind] ?? $arr_col[0];
                    $title[$lang[0]] = $row[$row_name] ?? $df_title;
                    $ind++;
                }

                $pricing['dfpricing'] = $this->setvalue->set($row['J'])->toDecimal()->get();
                foreach ($customertype as $key => $value) {
                    $pricing[$value] = $this->setvalue->set($row['J'])->toDecimal()->get();
                }
                $record = [

                    $this->fprimarykey => $newid,
                    'barcode'  => $this->setvalue->set($request->barcode ?? '')->toString()->get(),
                    'productcode' => '',
                    'title' => json_encode($title),
                    'imginfo' => '{}',
                    'product_type'  => 'item',
                    'category_id'   => $this->setvalue->set($row['E'] ?? 1)->toInteger()->get(),
                    'categories'    => '',
                    'unit_id'       => $this->setvalue->set($row['G'])->toInteger()->get(),
                    'units'         => '[]',
                    'status'        => $this->setvalue->set($request->status)->toString()->get(),
                    'permission_id' => $this->setvalue->set($request->permission_id)->toInteger()->get(),
                    'permission_password'   => $this->setvalue->set($request->permission_password)->toString()->get(),
                    'parent_id' => 0,
                    'madewith'  => '{}',
                    'costing'   => $this->setvalue->set($row['J'])->toDecimal()->get(),
                    'pricing'   => json_encode($pricing),
                    'sizes'     => '',
                    'colors'    => '',
                    'xtraprice' => '',
                    'xtracost'  => '',
                    'discount'  => 0,
                    'pvat'  => $this->setvalue->set($request->pvat)->toDecimal()->get(),
                    'p_series'  => 0,
                    'p_location'    => 0,
                    'attribute_id'  => 0,
                    'att_ele'   => '',
                    'isservice' => 'yes',
                    'currentstock'  => 0,
                    'stock_alert'   => $this->setvalue->set($request->stock_alert)->toDecimal()->get(),
                    'stocksc_alert' => $this->setvalue->set($request->stocksc_alert)->toDecimal()->get(),
                    'extra' => '{}',
                    'extra_fix' => '',
                    'visitor_counter'   => 0,
                    'created_at'    => $this->setvalue->set()->toTimestamp()->get(),
                    'updated_at'    => $this->setvalue->set()->toTimestamp()->get(),
                    'post_date'     => $this->setvalue->set($post_date)->toTimestamp()->get(),
                    'expired_date'  => null,
                    'page_id'   => 0,
                    'branch_id' => $this->args['userinfo']['branch_id'],
                    'ordering'  => $this->setvalue->set($request->ordering)->toInteger()->get(),
                    'trash' => 'no',
                    'blongto' => $this->args['userinfo']['id']
                ];

                array_push($tableData, $record);
                $newid++;
            }
        }

        #end table data format
        return [
            'tableData' => $tableData,
            'spreadsheet' => $collectSheet,
        ];
    }

    public function importstore(Request $request)
    {
        if ($request->isMethod('post')) {
            $obj_info = $this->obj_info;
            $validator = Validator::make($request->all(), [
                'file_import' => 'required|mimes:xls,xlsx,xlsm'
            ]);
            if ($validator->fails()) {

                return response()
                    ->json(
                        [
                            "type" => "error",
                            'status' => false,
                            "message" => __('dev.importinvalid'),
                        ],
                        422
                    );
            }
            $data = $this->importsetinfo($request);

            //Try validation here
            $validator = $this->importvalidation($data);
            if ($validator->fails()) {
                $routing = url_builder($obj_info['routing'], [$obj_info['name'], 'import']);
                return response()
                    ->json(
                        [
                            "type" => "validator",
                            'status' => false,
                            "message" => $validator->errors()->first(), // __('dev.importinvalid'),
                            'url' => $routing,
                        ],
                        422
                    );
            }
            //
            $tableData = $data['tableData'];

            $savedata = false;
            if (!empty($tableData)) {
                $savedata = $this->model->insert($tableData);
            }
            $success_ms = __('dev.suc_save');

            if ($savedata) {
                $routing = url_builder($obj_info['routing'], [$obj_info['name'], 'index']);

                return response()
                    ->json(
                        [
                            "type" => "success",
                            "status" => $savedata,
                            "message" => $success_ms,
                            "route" => $routing,
                            "callback" => 'delayRefresh',
                        ],
                        200
                    );
            }

            return response()
                ->json(
                    [
                        "type" => "error",
                        'status' => false,
                        "message" => __('dev.importinvalid'),
                    ],
                    422
                );
        }
        //
    }

    public function picker(Request $request, $condition = [], $setting = [])
    {

        return view('app.' . $this->obj_info['name'] . '.picker', compact([]))
            ->with([
                'obj_info'  => $this->obj_info,
                'fprimarykey'     => $this->fprimarykey,
                'caption' => 'Color Picker',
            ]);
    }
}
