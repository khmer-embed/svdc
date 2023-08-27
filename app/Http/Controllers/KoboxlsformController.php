<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use Schema;
use DB;
use Illuminate\Support\Facades\Http;


use App\Models\Xlsform;
use App\Models\TeamXlsform;
use App\Models\Questionsinfo;
use App\Models\Realtimeinsert;

use Setvalue;

class KoboxlsformController extends Controller
{
    //
    private $obj_info = ['name' => 'koboxlsform', 'routing' => 'admin.controller', 'title' => 'Kobo Form', 'icon' => '<i class="fas fa-weight-hanging"></i>'];
    public $args;

    private $model;
    private $tablename;
    private $fprimarykey = 'id';
    private $protectme = null;

    private $setvalue;
    public $dflang;
    private $kobo_config = '';
    private $rcdperpage = 15; #record per page, set zero to get all record# set -1 to use default

    /**
     * Create a new controller instance.
     *
     * @return void
     */
    public function __construct(array $args = [])
    {

        //$this->middleware('auth');
        $this->obj_info['title'] = 'Kobo Form'; //__('label.lb09');

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
        $this->model = new Xlsform;
        $this->tablename = $this->model->gettable();
        $this->dflang = df_lang();

        $this->setvalue = new Setvalue();
        $this->kobo_config = 'dev.' . company() . '_kobo';
        // dd($this->kobo_config);
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
            ->join('team_xlsform', 'team_xlsform.xlsform_id', '=', 'xlsforms.id')
            ->leftjoin('questions_info', 'questions_info.kobo_id', '=', 'team_xlsform.kobo_id')
            ->select("xlsforms.id as id", "xlsforms.title as title", "team_xlsform.kobo_id", 'countq as num_question')
            // ->groupBy('xlsforms.id')
            // ->groupBy('xlsforms.title')
            // ->groupBy('team_xlsform.kobo_id')
        ;
    } /*../function..*/
    //JSON_UNQUOTE(JSON_EXTRACT(title, '$.".$this->dflang[0]."'))

    public function sfp($request, $results)
    {
        #Sort Filter Pagination#

        // CACHE SORTING INPUTS
        $allowed = array('title', $this->fprimarykey);
        $sort = in_array($request->input('sort'), $allowed) ? $request->input('sort') : "title";
        $order = $request->input('order') === 'desc' ? 'desc' : 'asc';
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

        $syncdata_route = url_builder(
            $this->obj_info['routing'],
            [
                $this->obj_info['name'], 'syncdata', ''
            ],
        );

        $reset_route = url_builder(
            $this->obj_info['routing'],
            [
                $this->obj_info['name'], 'reset', ''
            ],
        );

        return view('app.' . $this->obj_info['name'] . '.index', compact([]))
            ->with([
                'obj_info'  => $this->obj_info,
                'route' => [
                    'create'  => $create_route,
                    'sync'  => $sync_route,
                    'syncdata' => $syncdata_route,
                    'reset'  => $reset_route,
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
    }
    // 
    public function validator($request, $isupdate = false)
    {
    }

    public function setinfo($request, $isupdate = false)
    {
    }

    public function create(Request $request)
    {

        //form
        $response = Http::withBasicAuth(config($this->kobo_config . '.user'), config($this->kobo_config . '.password'))
            ->withHeaders(['Accept' => 'application/json'])
            ->get(config($this->kobo_config . '.url') . '/assets/?asset_type=survey');
        $forms = $response->throw()->json();
        // dd($forms);

        // TeamXlsform::truncate();
        // Xlsform::truncate();
        // Question::truncate();

        $fs   = [];
        foreach ($forms['results'] as $form) {
            if (TeamXlsform::where('kobo_id', $form['uid'])->exists()) {
                continue;
            } else {
                if (!empty($form['uid']) && (bool) $form["deployment__active"] && $form["asset_type"] === "survey") {
                    $xform = Xlsform::create([
                        'title'       => $form['name'],
                        'description' => $form['data'] ?? '',
                        'available'   => true,
                    ]);

                    $teamf = $xform->teamXlsform()->create([
                        'team_id'         => 0,
                        'is_active'       => true,
                        'kobo_id'         => $form['uid'],
                        'kobo_version_id' => $form['version_id'],
                    ]);

                    $fs[] = $teamf;
                }
            }
        }

        TeamXlsform::whereNull('kobo_id')->delete();

        if (count($fs) > 0) {
            $callback = 'formreset';
            if (is_axios() && !empty($request->jscallback)) {
                $callback = $request->input('jscallback');
            }

            return response()
                ->json(
                    [
                        "type" => "success",
                        'status' => true,
                        'route' => ['url' => redirect()->back()->getTargetUrl()],
                        "callback" => $callback,
                        "message" => count($fs) . ' forms synced successfully.',
                    ],
                    200
                );
        } else {
            return response()
                ->json(
                    [
                        "type" => "error",
                        'status' => false,
                        'route' => ['url' => redirect()->back()->getTargetUrl()],
                        "message" => 'No new forms found',
                    ],
                    422
                );
        }
    } /*../function..*/

    public function store(Request $request)
    {
    }
    /* end function*/
    function proceed_store($request, $data, $obj_info)
    {
    }
    /* end function*/

    public function edit(Request $request, $id = 0)
    {
    } /*../end fun..*/

    public function update(Request $request)
    {
    }/*../end fun..*/

    function proceed_update($request, $data, $obj_info)
    {
    }
    /* end function*/

    public function totrash(Request $request, $id = 0)
    {
    }

    public function runschedule()
    {
        $request = new Request();
        $sync = $this->sync($request);
    }
    public function sync_bk(Request $request, $id = 'aC77hBHhJCLnpKWzkddzeN')
    {

        $kobo_id = $request->input('kobo_id') ?? $id;
        $xlsform_id = '';
        if (empty($kobo_id)) {
            return response()
                ->json(
                    [
                        "type" => "error",
                        "message" => __('me.forminvalid'),
                        "data" => []
                    ],
                    422
                );
        }



        //question
        //Question::truncate();
        $fs     = [];
        $teamf  = TeamXlsform::where('kobo_id', $kobo_id)->first();
        $return = Http::withBasicAuth(config($this->kobo_config . '.user'), config($this->kobo_config . '.password'))
            ->withHeaders(['Accept' => 'application/json'])
            ->get(config($this->kobo_config . '.url') . "/api/v2/assets/" . $kobo_id . ".json")->throw()->json();

        $xlsform_id = $teamf->xlsform_id ?? 0;
        $table_question = "kobo" . $xlsform_id . "_questions";
        $table_choice = "kobo" . $xlsform_id . '_' . 'choices';
        // $table_question = "kobo_" . strtolower($kobo_id) . "_questions";
        // $table_choice = "kobo_" . strtolower($kobo_id) . '_' . 'choices';



        if (isset($return['content']) && isset($return['content']['survey'])) {
            //create table question//
            // 
            // dd($return);
            Schema::dropIfExists($table_question);
            DB::statement('CREATE TABLE IF NOT EXISTS ' . $table_question . ' LIKE questions');
            Schema::table($table_question, function ($table) {
                $table->dropColumn(['label']);
            });
            addColumn($table_question, 'select_from_list_name');
            addColumn($table_question, 'type');
            // dd($return['content']['survey']);
            $first_question = [];
            foreach ($return['content']['survey'] as $survey) {
                if (array_key_exists('label', $survey)) {
                    $first_question = $survey;
                    break;
                }
            }


            $only_label = array_keys($first_question['label']);
            $max = count($only_label);
            for ($i = 0; $i < $max; $i++) {
                addColumn($table_question, "label_" . $i);
            }


            $sTable = str_replace(' ', '_', $return['name']);
            $sTable = 'kobo' . $xlsform_id . '_' . $sTable;

            /* insert table name to Realtime insert for get data from kobo when kobo submit*/
            $realtime_data = [
                'table_name' => $sTable,
                'json' => '',
                'trash' => 'no',
            ];
            $insert_realtime = Realtimeinsert::updateOrCreate([
                "table_name" => $sTable
            ], $realtime_data);


            // Schema::dropIfExists($sTable);
            if (!Schema::hasTable($sTable)) {
                Schema::create($sTable, function ($table) {
                    $table->engine = 'InnoDB';
                    $table->increments('_id');
                    $table->longText('original')->collate('utf8_general_ci')->nullable();
                });
            }


            //ALTER TABLE your_table ROW_FORMAT=DYNAMIC;
            //$db=DB::statement("ALTER TABLE ".$sTable." ROW_FORMAT=DYNAMIC KEY_BLOCK_SIZE=8;");

            $koboToLaraType = koboToLaraType();
            $kobo_exception_type = koboexceptiontype();
            $subtable = [];
            $start_subtable = false;
            $subtable_fields = [];
            foreach ($return['content']['survey'] as $choice) {
                $sColumn = strtolower($choice['name'] ?? '');
                $sColumn = str_replace(' ', '_', $sColumn);
                $type = strtolower($choice['type']);

                //create SubTable

                if ($type == 'begin_repeat') {
                    $start_subtable = true;
                    $subtable_name = 'kobo' . $xlsform_id . '_' . $sColumn . "_" . $kobo_id;
                    array_push($subtable, strtolower($sColumn));
                }
                if ($start_subtable && $type != 'begin_repeat' && $type != 'end_repeat') {
                    array_push($subtable_fields, $choice['name'] ?? '');
                }
                if ($type == 'end_repeat') {
                    Schema::dropIfExists($subtable_name);
                    if (!Schema::hasTable($subtable_name)) {
                        Schema::create($subtable_name, function ($table) {
                            $table->engine = 'InnoDB';
                            $table->increments('_id');
                            $table->integer('_parent_index');
                            $table->string('_submission__id');
                            $table->string('_parent_table_name');
                            $table->string('kobo_id');
                        });
                    }

                    foreach ($subtable_fields as $sub_field) {
                        if (!empty($sub_field) && !Schema::hasColumn($subtable_name, $sub_field)) {
                            Schema::table($subtable_name, function ($table) use($sub_field){
                                $table->text($sub_field)->collate('utf8_general_ci')->nullable();
                            });
                        }
                    }
                    $subtable_fields = [];
                    $start_subtable = false;
                }

                $label = $choice['label'] ?? [];
                // dd($label[0]);
                $label_lang = ['kh' => $label[0] ?? '', 'en' => $label[1] ?? $label[0] ?? ''];
                $choicename = $choice['name'] ?? '';
                $choicename  = str_replace(' ', '_', $choicename);
                $choicename  = str_replace('.', '_', $choicename);
                $fs[] = $teamf->questions()->updateOrCreate([
                    "name" => $choicename,
                    "kuid" => $choice['$kuid'],
                ], [
                    "name"      => $choice['name'] ?? '',
                    "kuid"      => $choice['$kuid'],
                    "label"     => json_encode($label_lang) ?? '',
                    "hint"     => $choice['hint'][0] ?? '',
                    "list_name" => $choice['type'] ?? '',
                    "autovalue"  => $choice['$autoname'] ?? '',
                    'required'   => $choice['required'] ?? '',
                    'validation' => $choice['constraint'] ?? '',
                ]);

                Schema::table($sTable, function ($table)
                use ($sTable, $choice, $koboToLaraType, $kobo_exception_type) {

                    $sColumn = strtolower($choice['name'] ?? '');
                    $type = strtolower($choice['type']);

                    if (!empty($sColumn) && !Schema::hasColumn($sTable, $sColumn) && !in_array($type, $kobo_exception_type)) {
                        $lara_type = $koboToLaraType[$type] ?? '';
                        if (!empty($lara_type)) {
                            if ($sColumn == '__version__') {
                                $table->text('__version__')->collate('utf8_general_ci')->nullable();
                            } else {
                                //$table->$lara_type($sColumn)->collate('utf8_general_ci')->nullable();
                                //$table->text($sColumn)->collate('utf8_general_ci')->nullable();
                            }
                            //$table->$lara_type($sColumn)->collate('utf8_general_ci')->nullable();

                        } else {

                            //$table->text($sColumn)->collate('utf8_general_ci')->nullable();
                        }
                    }
                });

                $choicename = $choice['name'] ?? '';
                $choicename  = str_replace(' ', '_', $choicename);
                $choicename  = str_replace('.', '_', $choicename);

                $question_record = [
                    "name"      => $choicename,
                    "team_xlsform_id"   => $xlsform_id ?? '',
                    "kuid"      => $choice['$kuid'],
                    "hint"     => $choice['hint'][0] ?? '',
                    "list_name" => $choice['list_name'] ?? '',
                    "autovalue"  => $choice['$autoname'] ?? '',
                    'required'   => $choice['required'] ?? '',
                    "select_from_list_name" => $choice['select_from_list_name'] ?? '',
                    "type" => $choice['type'] ?? '',
                    'validation' => $choice['constraint'] ?? '',
                ];
                $only_label = $choice['label'] ?? ["", ""];
                foreach ($only_label as $i => $v) {
                    $question_record['label_' . $i] = $v;
                }

                $tbl_question_columns = getTableColumns($table_question);
                $question_record = array_only($question_record, $tbl_question_columns);

                
                $fs[] = DB::table($table_question)->updateOrInsert(
                    [
                        "name" => $choice['name'] ?? '',
                        "kuid" => $choice['$kuid'],
                    ],
                    $question_record
                );
            
                
            }

            // dd($subtable);
            // a_hhmember
            //choice//
            if (isset($return['content']) && isset($return['content']['choices'])) {

                Schema::dropIfExists($table_choice);
                Schema::create($table_choice, function ($table) {
                    $table->engine = 'InnoDB';
                    $table->increments('_id');
                });

                $choices = $return['content']['choices'];
                
                $first_choice = $choices[0];
                $exceipt_label = array_except($first_choice, 'label');
                $only_label = array_keys($first_choice['label']);
                $max = count($only_label);
                for ($i = 0; $i < $max; $i++) {
                    $only_label[$i] = 'label_' . $only_label[$i];
                }
                $all = array_merge(array_keys($exceipt_label), $only_label);
                foreach ($all as $ch_field) {
                    Schema::table($table_choice, function ($table) use ($table_choice, $ch_field) {
                        if (!\Schema::hasColumn($table_choice, $ch_field)) {
                            $fluent = $table->text($ch_field)->collate('utf8_general_ci')->nullable();
                        }
                    });
                }
                $tbl_ch_columns = getTableColumns($table_choice);
                foreach ($choices as $ch_record) {
                    $exceipt_label = array_except($ch_record, 'label');
                    $only_label = $ch_record['label'] ?? ["", ""];
                    $max = count($only_label);
                    $new_label = [];
                    for ($i = 0; $i < $max; $i++) {
                        $new_label['label_' . $i] = $only_label[$i];
                    }
                    $all = array_merge($exceipt_label, $new_label);
                    $insert_info = array_only($all, $tbl_ch_columns);
                    
                    DB::table($table_choice)->insert(
                        $insert_info
                    );
                    
                }
            }
            //end choice//


            //try get all record
            $response = Http::withBasicAuth(config($this->kobo_config . '.user'), config($this->kobo_config . '.password'))
                ->withHeaders(['Accept' => 'application/json'])
                ->timeout(600)
                ->get(config($this->kobo_config . '.url') . "/api/v2/assets/" .  $kobo_id . "/data/");
            if ($response->failed()) {
                return response()
                    ->json(
                        [
                            "type" => "error",
                            "message" => 'Sync record failed',
                            "data" => []
                        ],
                        422
                    );
            }

            $data = $response['results'] ?? null;

            if ($data) {
                $count_element = array_map('count', $data);
                $longest_len = array_search(max($count_element), $count_element);
                $first_record = $data[$longest_len];

                $tbl_columns = getTableColumns($sTable);
                $tbl_columns = array_merge($tbl_columns, $subtable);
                foreach ($first_record as $key => $value) {
                    $create_field = $key;
                    $separate_key = explode('/', $key);
                    $check_subtable_field = array_last($separate_key);

                    $create_field = array_last($separate_key);
                    $create_field = str_replace('.', '_', $create_field);
                    $create_field = str_replace(' ', '_', $create_field);
                    // $create_field = str_replace('/', '=', $create_field);
                    if (!in_array(strtolower($check_subtable_field), $tbl_columns)) {
                        addColumn($sTable, $create_field);
                    }
                }


                //insert data
                $tbl_columns = getTableColumns($sTable);
                foreach ($data as $index => $record) {
                    $orignal_record = json_encode($record, JSON_THROW_ON_ERROR);
                    foreach ($record as $field => $value) {

                        $separate_key = explode('/', $field);
                        $field_name = array_last($separate_key);
                        $field_name = str_replace('.', '_', $field_name);

                        if (is_array($value)) {
                            $record[$field_name] = json_encode($value, JSON_THROW_ON_ERROR);
                        }
                        else {
                            $record[$field_name] = $value;
                        }

                        //prepare data for subable and insert
                        $check_subtable_field = array_last(explode('/', $field));
                        if (in_array(strtolower($check_subtable_field), $subtable)) {
                            $subtable_name = 'kobo' . $xlsform_id . '_' . $check_subtable_field . "_" . $kobo_id;
                            $main_table_fields = [
                                '_parent_index' => $record['_id'] ?? '',
                                '_submission__id' => $record['_uuid'] ?? '',
                                '_parent_table_name' => $sTable,
                                'kobo_id' => $kobo_id ?? '',
                            ];

                            
                            $subtable_field = getTableColumns($subtable_name);
                            foreach ($value as $subtablerecord) {
                                $subtablerecord_newfield = [];
                                foreach($subtablerecord as $col => $data){
                                    $col = array_last(explode('/', $col));
                                    $subtablerecord_newfield[$col] = $data;
                                }
                                $subtablerecord_newfield = array_merge($main_table_fields, $subtablerecord_newfield);
                                $subtablerecord_newfield = array_only($subtablerecord_newfield, $subtable_field);
                                DB::table($subtable_name)->insert(
                                    $subtablerecord_newfield
                                );
                                
                            }
                            
                            
                        }

                    }
                    $record['original'] =  $orignal_record;
                    $record = array_only($record, $tbl_columns);
                    
                    $ifexist = DB::table($sTable)->where('_uuid', $record['_uuid'])->first();
                    if (is_null($ifexist)) {
                        $fs[] = DB::table($sTable)->insert(
                            $record
                        );
                    }
                    
                    
                }
            }
        }

        if (count($fs) > 0) {
            $qinfo = Questionsinfo::updateOrCreate([
                "kobo_id" => $kobo_id,

            ], [
                "team_xlsform_id"      => $xlsform_id,
                "kobo_id" => $kobo_id,
                "countq"      => count($fs),
            ]);

            $callback = 'formreset';
            if (is_axios() && !empty($request->jscallback)) {
                $callback = $request->input('jscallback');
            }

            return response()
                ->json(
                    [
                        "type" => "success",
                        "message" => count($fs) . ' attributes synced successfully.',
                        "callback" => $callback,
                        "data" => [
                            '#' . $kobo_id => count($fs),

                        ]
                    ],
                    200
                );
        } else {
            return response()
                ->json(
                    [
                        "type" => "error",
                        "message" => 'No new attributes found',
                        "data" => []
                    ],
                    422
                );
        }
    }
    //

    public function sync(Request $request, $id = 'aC77hBHhJCLnpKWzkddzeN')
    {

        $kobo_id = $request->input('kobo_id') ?? $id;
        $xlsform_id = '';
        if (empty($kobo_id)) {
            return response()
                ->json(
                    [
                        "type" => "error",
                        "message" => __('me.forminvalid'),
                        "data" => []
                    ],
                    422
                );
        }



        //question
        //Question::truncate();
        $fs     = [];
        $teamf  = TeamXlsform::where('kobo_id', $kobo_id)->first();
        $return = Http::withBasicAuth(config($this->kobo_config . '.user'), config($this->kobo_config . '.password'))
            ->withHeaders(['Accept' => 'application/json'])
            ->get(config($this->kobo_config . '.url') . "/api/v2/assets/" . $kobo_id . ".json")->throw()->json();

        $xlsform_id = $teamf->xlsform_id ?? 0;
        $table_question = "kobo" . $xlsform_id . "_questions";
        $table_choice = "kobo" . $xlsform_id . '_' . 'choices';
       
        if (isset($return['content']) && isset($return['content']['survey'])) {
           
            $do_import_question = true;
            $do_import_choice = true;
            if($do_import_question){

                Schema::dropIfExists($table_question);
                DB::statement('CREATE TABLE IF NOT EXISTS ' . $table_question . ' LIKE questions');
                Schema::table($table_question, function ($table) {
                    $table->dropColumn(['label']);
                });
                addColumn($table_question, 'select_from_list_name');
                addColumn($table_question, 'type');

                // dd($return['content']['survey']);
                $first_question = [];
                foreach ($return['content']['survey'] as $survey) {
                    if (array_key_exists('label', $survey)) {
                        $first_question = $survey;
                        break;
                    }
                }


                $only_label = array_keys($first_question['label']);
                $max = count($only_label);
                for ($i = 0; $i < $max; $i++) {
                    addColumn($table_question, "label_" . $i);
                }

            }
            


            $sTable = str_replace(' ', '_', $return['name']);
            $sTable = 'kobo' . $xlsform_id . '_' . $sTable;

            /* insert table name to Realtime insert for get data from kobo when kobo submit*/
            $realtime_data = [
                'table_name' => $sTable,
                'json' => '',
                'trash' => 'no',
            ];
            $insert_realtime = Realtimeinsert::updateOrCreate([
                "table_name" => $sTable
            ], $realtime_data);


            // Schema::dropIfExists($sTable);
            // if (!Schema::hasTable($sTable)) {
            //     Schema::create($sTable, function ($table) {
            //         $table->engine = 'InnoDB';
            //         $table->increments('_id');
            //         $table->longText('original')->collate('utf8_general_ci')->nullable();
            //     });
            // }


            //ALTER TABLE your_table ROW_FORMAT=DYNAMIC;
            //$db=DB::statement("ALTER TABLE ".$sTable." ROW_FORMAT=DYNAMIC KEY_BLOCK_SIZE=8;");

            
            foreach ($return['content']['survey'] as $choice) {
                $sColumn = strtolower($choice['name'] ?? '');
                $sColumn = str_replace(' ', '_', $sColumn);
                $type = strtolower($choice['type']);

                //create SubTable

    
                $label = $choice['label'] ?? [];
                // dd($label[0]);
                $label_lang = ['kh' => $label[0] ?? '', 'en' => $label[1] ?? $label[0] ?? ''];
                $choicename = $choice['name'] ?? '';
                $choicename  = str_replace(' ', '_', $choicename);
                $choicename  = str_replace('.', '_', $choicename);


                $fs[] = $teamf->questions()->updateOrCreate([
                    "name" => $choicename,
                    "kuid" => $choice['$kuid'],
                ], [
                    "name"      => $choice['name'] ?? '',
                    "kuid"      => $choice['$kuid'],
                    "label"     => json_encode($label_lang) ?? '',
                    "hint"     => $choice['hint'][0] ?? '',
                    "list_name" => $choice['type'] ?? '',
                    "autovalue"  => $choice['$autoname'] ?? '',
                    'required'   => $choice['required'] ?? '',
                    'validation' => $choice['constraint'] ?? '',
                ]);


                $choicename = $choice['name'] ?? '';
                $choicename  = str_replace(' ', '_', $choicename);
                $choicename  = str_replace('.', '_', $choicename);

                $question_record = [
                    "name"      => $choicename,
                    "team_xlsform_id"   => $xlsform_id ?? '',
                    "kuid"      => $choice['$kuid'],
                    "hint"     => $choice['hint'][0] ?? '',
                    "list_name" => $choice['list_name'] ?? '',
                    "autovalue"  => $choice['$autoname'] ?? '',
                    'required'   => $choice['required'] ?? '',
                    "select_from_list_name" => $choice['select_from_list_name'] ?? '',
                    "type" => $choice['type'] ?? '',
                    'validation' => $choice['constraint'] ?? '',
                ];
                $only_label = $choice['label'] ?? ["", ""];
                foreach ($only_label as $i => $v) {
                    $question_record['label_' . $i] = $v;
                }

                $tbl_question_columns = getTableColumns($table_question);
                $question_record = array_only($question_record, $tbl_question_columns);

                
                if($do_import_question){
                    $fs[] = DB::table($table_question)->updateOrInsert(
                        [
                            "name" => $choice['name'] ?? '',
                            "kuid" => $choice['$kuid'],
                        ],
                        $question_record
                    );
                }
            
                
            }

           
            //choice//
            if ($do_import_choice && isset($return['content']) && isset($return['content']['choices'])) {

                Schema::dropIfExists($table_choice);
                Schema::create($table_choice, function ($table) {
                    $table->engine = 'InnoDB';
                    $table->increments('_id');
                });

                $choices = $return['content']['choices'];
                
                $first_choice = $choices[0];
                $exceipt_label = array_except($first_choice, 'label');
                $only_label = array_keys($first_choice['label']);
                $max = count($only_label);
                for ($i = 0; $i < $max; $i++) {
                    $only_label[$i] = 'label_' . $only_label[$i];
                }
                $all = array_merge(array_keys($exceipt_label), $only_label);
                foreach ($all as $ch_field) {
                    Schema::table($table_choice, function ($table) use ($table_choice, $ch_field) {
                        if (!\Schema::hasColumn($table_choice, $ch_field)) {
                            $fluent = $table->text($ch_field)->collate('utf8_general_ci')->nullable();
                        }
                    });
                }
                $tbl_ch_columns = getTableColumns($table_choice);
                foreach ($choices as $ch_record) {
                    $exceipt_label = array_except($ch_record, 'label');
                    $only_label = $ch_record['label'] ?? ["", ""];
                    $max = count($only_label);
                    $new_label = [];
                    for ($i = 0; $i < $max; $i++) {
                        $new_label['label_' . $i] = $only_label[$i];
                    }
                    $all = array_merge($exceipt_label, $new_label);
                    $insert_info = array_only($all, $tbl_ch_columns);
                    
                    DB::table($table_choice)->insert(
                        $insert_info
                    );
                    
                }
            }
            //end choice//
        }

        if (count($fs) > 0) {
            $callback = 'formreset';
            if (is_axios() && !empty($request->jscallback)) {
                $callback = $request->input('jscallback');
            }
            return response()
                ->json(
                    [
                        "type" => "success",
                        "message" => count($fs) . ' attributes synced successfully.',
                        "callback" => $callback,
                        "data" => [
                            '#' . $kobo_id => count($fs),

                        ]
                    ],
                    200
                );
        } else {
            return response()
                ->json(
                    [
                        "type" => "error",
                        "message" => 'No new attributes found',
                        "data" => []
                    ],
                    422
                );
        }
    }
    //


    public function syncdata(Request $request, $id = 'aC77hBHhJCLnpKWzkddzeN')
    {

        $kobo_id = $request->input('kobo_id') ?? $id;
        $xlsform_id = '';
        if (empty($kobo_id)) {
            return response()
                ->json(
                    [
                        "type" => "error",
                        "message" => __('me.forminvalid'),
                        "data" => []
                    ],
                    422
                );
        }
        //question
        //Question::truncate();
        $fs     = [];
        $teamf  = TeamXlsform::where('kobo_id', $kobo_id)->first();
        $return = Http::withBasicAuth(config($this->kobo_config . '.user'), config($this->kobo_config . '.password'))
            ->withHeaders(['Accept' => 'application/json'])
            ->get(config($this->kobo_config . '.url') . "/api/v2/assets/" . $kobo_id . ".json")->throw()->json();

        $xlsform_id = $teamf->xlsform_id ?? 0;
        if (isset($return['content']) && isset($return['content']['survey'])) {
            $sTable = str_replace(' ', '_', $return['name']);
            $sTable = 'kobo' . $xlsform_id . '_' . $sTable;
            
            if (!Schema::hasTable($sTable)) {
                Schema::create($sTable, function ($table) {
                    $table->engine = 'InnoDB';
                    $table->increments('_id');
                    $table->longText('original')->collate('utf8_general_ci')->nullable();
                });
            }
            
            $koboToLaraType = koboToLaraType();
            $kobo_exception_type = koboexceptiontype();
            $subtable = [];
            $start_subtable = false;
            $subtable_fields = [];

            foreach ($return['content']['survey'] as $choice) {
                $sColumn = strtolower($choice['name'] ?? '');
                $sColumn = str_replace(' ', '_', $sColumn);
                $type = strtolower($choice['type']);
                if ($type == 'begin_repeat') {
                    $start_subtable = true;
                    $subtable_name = 'kobo' . $xlsform_id . '_' . $sColumn . "_" . $kobo_id;
                    array_push($subtable, strtolower($sColumn));
                }
                if ($start_subtable && $type != 'begin_repeat' && $type != 'end_repeat') {
                    array_push($subtable_fields, $choice['name'] ?? '');
                }
                if ($type == 'end_repeat') {
                    Schema::dropIfExists($subtable_name);
                    if (!Schema::hasTable($subtable_name)) {
                        Schema::create($subtable_name, function ($table) {
                            $table->engine = 'InnoDB';
                            $table->increments('_id');
                            $table->integer('_parent_index');
                            $table->string('_submission__id');
                            $table->string('_parent_table_name');
                            $table->string('kobo_id');
                        });
                    }

                    foreach ($subtable_fields as $sub_field) {
                        if (!empty($sub_field) && !Schema::hasColumn($subtable_name, $sub_field)) {
                            Schema::table($subtable_name, function ($table) use($sub_field){
                                $table->text($sub_field)->collate('utf8_general_ci')->nullable();
                            });
                        }
                    }
                    $subtable_fields = [];
                    $start_subtable = false;
                }


                // create 
                Schema::table($sTable, function ($table)
                use ($sTable, $choice, $koboToLaraType, $kobo_exception_type) {

                    $sColumn = strtolower($choice['name'] ?? '');
                    $type = strtolower($choice['type']);

                    if (!empty($sColumn) && !Schema::hasColumn($sTable, $sColumn) && !in_array($type, $kobo_exception_type)) {
                        $lara_type = $koboToLaraType[$type] ?? '';
                        if (!empty($lara_type)) {
                            if ($sColumn == '__version__') {
                                $table->text('__version__')->collate('utf8_general_ci')->nullable();
                            } else {
                                //$table->$lara_type($sColumn)->collate('utf8_general_ci')->nullable();
                                //$table->text($sColumn)->collate('utf8_general_ci')->nullable();
                            }
                            //$table->$lara_type($sColumn)->collate('utf8_general_ci')->nullable();

                        } else {

                            //$table->text($sColumn)->collate('utf8_general_ci')->nullable();
                        }
                    }
                });
            }

            //try get all record
            $response = Http::withBasicAuth(config($this->kobo_config . '.user'), config($this->kobo_config . '.password'))
                ->withHeaders(['Accept' => 'application/json'])
                ->timeout(600)
                ->get(config($this->kobo_config . '.url') . "/api/v2/assets/" .  $kobo_id . "/data/");
            if ($response->failed()) {
                return response()
                    ->json(
                        [
                            "type" => "error",
                            "message" => 'Sync record failed',
                            "data" => []
                        ],
                        422
                    );
            }

            $data = $response['results'] ?? null;

            if ($data) {
                $count_element = array_map('count', $data);
                $longest_len = array_search(max($count_element), $count_element);
                $first_record = $data[$longest_len];

                $tbl_columns = getTableColumns($sTable);
                $tbl_columns = array_merge($tbl_columns, $subtable);
                foreach ($first_record as $key => $value) {
                    $create_field = $key;
                    $separate_key = explode('/', $key);
                    $check_subtable_field = array_last($separate_key);

                    $create_field = array_last($separate_key);
                    $create_field = str_replace('.', '_', $create_field);
                    $create_field = str_replace(' ', '_', $create_field);
                    // $create_field = str_replace('/', '=', $create_field);
                    if (!in_array(strtolower($check_subtable_field), $tbl_columns)) {
                        addColumn($sTable, $create_field);
                    }
                }


                //insert data
                $tbl_columns = getTableColumns($sTable);
                foreach ($data as $index => $record) {
                    $orignal_record = json_encode($record, JSON_THROW_ON_ERROR);
                    foreach ($record as $field => $value) {

                        $separate_key = explode('/', $field);
                        $field_name = array_last($separate_key);
                        $field_name = str_replace('.', '_', $field_name);

                        if (is_array($value)) {
                            $record[$field_name] = json_encode($value, JSON_THROW_ON_ERROR);
                        }
                        else {
                            $record[$field_name] = $value;
                        }

                        //prepare data for subable and insert
                        $check_subtable_field = array_last(explode('/', $field));
                        if (in_array(strtolower($check_subtable_field), $subtable)) {
                            $subtable_name = 'kobo' . $xlsform_id . '_' . $check_subtable_field . "_" . $kobo_id;
                            $main_table_fields = [
                                '_parent_index' => $record['_id'] ?? '',
                                '_submission__id' => $record['_uuid'] ?? '',
                                '_parent_table_name' => $sTable,
                                'kobo_id' => $kobo_id ?? '',
                            ];

                            
                            $subtable_field = getTableColumns($subtable_name);
                            foreach ($value as $subtablerecord) {
                                $subtablerecord_newfield = [];
                                foreach($subtablerecord as $col => $data){
                                    $col = array_last(explode('/', $col));
                                    $subtablerecord_newfield[$col] = $data;
                                }
                                $subtablerecord_newfield = array_merge($main_table_fields, $subtablerecord_newfield);
                                $subtablerecord_newfield = array_only($subtablerecord_newfield, $subtable_field);
                                DB::table($subtable_name)->insert(
                                    $subtablerecord_newfield
                                );
                                
                            }
                            
                            
                        }

                    }
                    $record['original'] =  $orignal_record;
                    $record = array_only($record, $tbl_columns);
                    
                    $ifexist = DB::table($sTable)->where('_uuid', $record['_uuid'])->first();
                    if (is_null($ifexist)) {
                        $fs[] = DB::table($sTable)->insert(
                            $record
                        );
                    }
                    
                    
                }
            }
        }

        if (count($fs) > 0) {
            $qinfo = Questionsinfo::updateOrCreate([
                "kobo_id" => $kobo_id,

            ], [
                "team_xlsform_id"      => $xlsform_id,
                "kobo_id" => $kobo_id,
                "countq"      => count($fs),
            ]);

            $callback = 'formreset';
            if (is_axios() && !empty($request->jscallback)) {
                $callback = $request->input('jscallback');
            }

            return response()
                ->json(
                    [
                        "type" => "success",
                        "message" => count($fs) . ' attributes synced successfully.',
                        "callback" => $callback,
                        "data" => [
                            '#' . $kobo_id => count($fs),

                        ]
                    ],
                    200
                );
        } else {
            return response()
                ->json(
                    [
                        "type" => "error",
                        "message" => 'No new attributes found',
                        "data" => []
                    ],
                    422
                );
        }
    }
    //
    

    public function reset(Request $request, $id = '')
    {

        $kobo_id = $request->input('kobo_id') ?? $id;
        $kobo_title = $request->input('kobo_title') ?? '';
        $xlsform_id = '';
        if (empty($kobo_id)) {
            return response()
                ->json(
                    [
                        "type" => "error",
                        "message" => __('me.forminvalid'),
                        "data" => []
                    ],
                    422
                );
        }
        $teamf  = TeamXlsform::where('kobo_id', $kobo_id)->first();
        $xlsform_id = $teamf->xlsform_id ?? 0;

        $sTable = str_replace(' ', '_', $kobo_title);
        $sTable = 'kobo' . $xlsform_id . '_' . $sTable;
        $xx = Schema::dropIfExists($sTable);

         /* delete all related tables*/
         $form_head = 'kobo'.$xlsform_id;
         $tables = DB::select("SHOW TABLES;");
         $tables = array_map('current',$tables);

         foreach($tables as $table)
         {
            $head_check = substr($table,0, strlen($form_head));
             if(strtolower($head_check) == $form_head){
                 Schema::dropIfExists($table);
             }
         }
         //

        return response()
            ->json(
                [
                    "type" => "success",
                    "message" => 'Reset successfully.',
                ],
                200
            );
    }

    //
}
