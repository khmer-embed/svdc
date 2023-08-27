<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use Validator;
use Illuminate\Validation\Rule;
use Schema;
use DB;

use App\Models\Importtable;
use App\Rules\CustomUnique;
use Setvalue;

class ImporttableController extends Controller
{
    //
    private $obj_info = ['name' => 'importtable', 'routing' => 'admin.controller', 'title' => 'Import Table', 'icon' => '<i class="fas fa-table"></i>'];
    public $args;

    private $model;
    private $tablename;
    private $fprimarykey = 'id';
    private $protectme = null;

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
        $this->obj_info['title'] = 'Import Table'; //__('label.lb09');

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
        $this->model = new Importtable;
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

        return [];
    } /*../function..*/

    public function listingModel()
    {

        #DEFIND MODEL#
        return $this->model
            ->select(
                $this->fprimarykey,
                "name"
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
        // $results = $results->where($this->tablename . '.trash', '!=', 'yes');
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

        return view('app.' . $this->obj_info['name'] . '.index', compact([]))
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

        $numrecord = count($request->input($this->fprimarykey));
        $rules['title-' . $this->dflang[0] . '.*'] = ['required', 'distinct'];

        for ($i = 0; $i < $numrecord; $i++) {
            if ($isupdate) {
                $rules['title-' . $this->dflang[0] . '.' . $i]      = ['required', new CustomUnique($this->tablename, "JSON_UNQUOTE(JSON_EXTRACT(title, '$.en'))=? and " . $this->fprimarykey . "<>?", [$request->input('title-' . $this->dflang[0] . '.' . $i), $request->input($this->fprimarykey)[0]])];
            } else {

                $rules['title-' . $this->dflang[0] . '.' . $i]      = ['required', new CustomUnique($this->tablename, "JSON_UNQUOTE(JSON_EXTRACT(title, '$.en'))=?", [$request->input('title-' . $this->dflang[0] . '.' . $i)])];
            }
        }

        $validatorMessages = [
            /*'required' => 'The :attribute field can not be blank.'*/
            'required' => __('dev.fieldreqire'),
        ];

        return Validator::make($request->input(), $rules, $validatorMessages);
    }

    public function setinfo($request, $isupdate = false)
    {
        $newid = ($isupdate) ? $request->input($this->fprimarykey)[0]  : $this->model->max($this->fprimarykey) + 1;
        $tableData = [];
        /*For translate*/
        $title = [];
        $numrecord = count($request->input($this->fprimarykey));

        for ($i = 0; $i < $numrecord; $i++) {
            $title = $this->setvalue->toTranslate($request, 'title', $i)->get();
            $record = [
                $this->fprimarykey => $newid + $i,
                'title' => json_encode($title),
                'code'  => '',
                'colorcode' => $this->setvalue->set($request->colorcode[$i])->toString()->get(),
                'pic'   => $this->setvalue->set($request->pic[$i])->toString()->get(),
                'ordering' => 0,
                'tag' => '',
                'trash' => 'no',
                'blongto' => $this->args['userinfo']['id']
            ];
            array_push($tableData, $record);
        }

        if ($isupdate) {

            $tableData = $tableData[0];
            $tableData = array_except($tableData, [$this->fprimarykey, 'trash', 'blongto']);
            //function removes the given key / value pairs from an array:
        }
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
        return view('app.' . $this->obj_info['name'] . '.create',  compact([]))
            ->with([
                'obj_info'  => $this->obj_info,
                'route' => ['submit'  => $sumit_route, 'cancel' => $cancel_route],
                'form' => ['save_type' => 'save'],
                'fprimarykey'     => $this->fprimarykey,
                'caption' => __('dev.new'),
                'isupdate' => false,

            ]);
    } /*../function..*/

    public function store(Request $request)
    {
        $data = [];
        $obj_info = $this->obj_info;
        $routing = url_builder($obj_info['routing'], [$obj_info['name'], 'create']);
        if ($request->isMethod('post')) {
            $validate = $this->validator($request);
            if ($validate->fails()) {
                return response()
                    ->json(
                        [
                            "type" => "validator",
                            'status' => false,
                            "message" => __('dev.forminvalid'),
                            "data" => $validate->errors()
                        ],
                        422
                    );
            }
            $data = $this->setinfo($request);
            return $this->proceed_store($request, $data, $obj_info);
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
    function proceed_store($request, $data, $obj_info)
    {
        $save_status = $this->model->insert($data['tableData']);
        if ($save_status) {
            $savetype = strtolower($request->input('savetype'));
            $id = $data['id'];
            $rout_to = save_type_route($savetype, $obj_info, $id);
            $success_ms = __('dev.suc_save');
            $callback = 'formreset';
            if (is_axios() && !empty($request->jscallback)) {
                $callback = $request->input('jscallback');
            }
            return response()
                ->json(
                    [
                        "type" => "success",
                        "status" => $save_status,
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
                    "message" => 'Save is false',
                    "data" => []
                ],
                422
            );
    }
    /* end function*/

    public function edit(Request $request, $id = 0)
    {
        return view('notfound');
    } /*../end fun..*/

    public function update(Request $request)
    {
        $obj_info = $this->obj_info;
        $routing = url_builder($obj_info['routing'], [$obj_info['name'], 'create']);
        if ($request->isMethod('post')) {
            $validator = $this->validator($request, true);
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

            $data = $this->setinfo($request, true);

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

        $update_status = $this->model
            ->where($this->fprimarykey, $data['id'])
            ->update($data['tableData']);

        if ($update_status) {
            $savetype = strtolower($request->input('savetype'));
            $id = $data['id'];
            $rout_to = save_type_route($savetype, $obj_info, $id);
            $success_ms = __('dev.suc_save');
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
                    "message" => __('dev.fail_edit'),
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
        // $deleted = $this->model->where($this->fprimarykey, $editid)->delete();
        $find = $this->model->find($editid);

        if ($find) {
            $tablename = $find->name;
            Schema::dropIfExists($tablename);
            $deleted = $find->delete();
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
                'file_import' => 'required|mimes:xls,xlsx,xlsm,csv'
            ]);
            if ($validator->fails()) {

                return response()
                    ->json(
                        [
                            "type" => "validator",
                            'status' => false,
                            "message" => 'Import invalid!',
                            "data" => $validator->errors()
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
        //$rules['tablename'] = 'required|unique:' . $this->model->gettable() . ',tablename';
        // for ($i = 0; $i < $count_record; $i++) {
        //     $rules[$i . '.' . $this->fprimarykey]       = 'required|distinct|unique:' . $this->model->gettable() . ',' . $this->fprimarykey;
        // }

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
        $worksheetData = $reader->listWorksheetInfo($request->file('file_import'));
        $sheetname = $worksheetData[0]['worksheetName'];
        // dd($worksheetData);
        $reader->setLoadSheetsOnly([$sheetname]);
        $reader->setReadDataOnly(true);
        $spreadsheet = $reader->load($request->file('file_import'));
        // $spreadsheet->getSheet(0);
        $sheetData = $spreadsheet->getActiveSheet()->toArray(null, true, true, true);
        $collectSheet = collect(array_values($sheetData));
        $collect_first_row = $collectSheet[0];
        // dd($collect_first_row);
        $collectSheet = $collectSheet->forget(0); // remmove first row
        $collectSheet = collect($collectSheet->values()->all()); // refill array key index
        $collectSheet = $collectSheet->where('A', '!=', null);

        #table data format
        $tablename = $request->input('tablename');
        $newid = $this->model->max($this->fprimarykey) + 1;
        $tableData = [
            // 'id' => $newid,
            'creator_id' => 0,
            'name'  => $tablename,
            'slug'  => '',
            'description'   => '',
            'status'    => 1
        ];
        $importtabledata = [];
        if ($collectSheet->count() > 0) {
            foreach ($collectSheet as $row) {
                foreach ($collect_first_row as $cell => $fieldname) {
                    if (!empty($fieldname)) {
                        $record[$fieldname] = $row[$cell] . '' ?? '';
                    }
                }
                array_push($importtabledata, $record);
            }
        }
        #end table data format
        /*collect_first_row use for create a tabale field/column*/

        return [
            'tablename' => $tablename,
            'collect_first_row' => $collect_first_row,
            'importtabledata' => $importtabledata,
            'tableData' => $tableData,
            'spreadsheet' => $collectSheet,
        ];
    }

    public function importstore(Request $request)
    {
        if ($request->isMethod('post')) {
            $obj_info = $this->obj_info;
            $validator = Validator::make($request->all(), [
                //'tablename' => 'required|unique:' . $this->model->gettable() . ',name',
                'tablename' => 'required',
                'file_import' => 'required|mimes:xls,xlsx,xlsm,csv'
            ]);
            if ($validator->fails()) {

                return response()
                    ->json(
                        [
                            "type" => "validator",
                            'status' => false,
                            "message" => 'Import invalid!',
                            "data" => $validator->errors()
                        ],
                        422
                    );
            }
            $data = $this->importsetinfo($request);
            // dd($data);

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
                $savedata = $this->model->updateOrInsert(['name' => $tableData['name']], $tableData);
            }
            $success_ms = __('dev.suc_save');

            if ($savedata) {
                /*start*/
                $tablename = $data['tablename'];
                $collect_first_row = $data['collect_first_row'];
                $importtabledata = $data['importtabledata'];
                Schema::dropIfExists($tablename);
                Schema::create($tablename, function ($table) {
                    $table->engine = 'InnoDB';
                    $table->increments('_id');
                });

                foreach ($collect_first_row as $cell => $fieldname) {
                    if (!empty($fieldname)) {
                        Schema::table($tablename, function ($table) use ($tablename, $fieldname) {
                            if (!\Schema::hasColumn($tablename, $fieldname)) {
                                $fluent = $table->text($fieldname)->collate('utf8_general_ci')->nullable();
                            }
                        });
                    }
                }

                $value = array_chunk($importtabledata, ceil(count($importtabledata) / 50));
                // dd($value);
                $count = count($value);
                for ($i = 0; $i < $count; $i++) {
                    DB::table($tablename)->insert(
                        $value[$i]
                    );
                }


                /*END*/


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
}
