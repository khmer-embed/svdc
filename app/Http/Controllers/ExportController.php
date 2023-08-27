<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use Validator;

use Setvalue;

class ExportController extends Controller
{
    //
    private $obj_info = ['name' => 'export', 'routing' => 'admin.controller', 'title' => 'Eport Report', 'icon' => '<i class="fas fa-table"></i>'];
    public $args;

    private $model;
    private $tablename;
    private $fprimarykey = 'id';
    private $protectme = null;

    public $reportcontroller;

    public $dflang;
    private $rcdperpage = 15; #record per page, set zero to get all record# set -1 to use default

    private $setvalue;

    /**
     * Create a new controller instance.
     *
     * @return void
     */
    public function __construct(array $args = [])
    {
        //$this->middleware('auth');
        $this->obj_info['title'] = 'Export Report'; //__('label.lb09');

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
        $this->dflang = df_lang();

        $this->setvalue = new Setvalue();
        $classname = 'EcatchController';
        $classPath = 'App\Http\Controllers\Reports\\' .$classname;
        $this->reportcontroller = new  $classPath($args);
    
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


    } /*../function..*/

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

        return view('app.' . $this->obj_info['name'] . '.index', compact([]))
            ->with([
                'obj_info'  => $this->obj_info,
                'route' => [
                    'importloaddata' => $importloaddata_route,
                    'importstore'   => $importstore_route,
                ],
                'fprimarykey'     => $this->fprimarykey,
                'caption' => __('dev.active'),
            ])
            ->with(['act' => 'index'])
            ->with($setting);
    }


    /*============================= Start Import Stuff*/

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
            $blade = get_view_by_db_name($obj_info['name'], 'export');
            return view($blade, compact([]))
                ->with([
                    'obj_info'  => $this->obj_info,
                ])
                ->with('spreadsheet', $data['spreadsheet'])
                ;

            // return view('app.' . $this->obj_info['name'] . '.importlist')->with(['results' => $data['spreadsheet']]);
        }
    }

    public function importvalidation($data)
    {

        $tableData = $data['tableData'];
        $count_record = count($tableData);
        $rules = [];

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

        $obj_info = $this->obj_info;

        $reader = \PhpOffice\PhpSpreadsheet\IOFactory::createReaderForFile($request->file('file_import'));
        $worksheetData = $reader->listWorksheetInfo($request->file('file_import'));
        $reader->setLoadAllSheets();
        $spreadsheet = $reader->load($request->file('file_import'));
        $spreadsheet->setActiveSheetIndex(6);
        //https://phpspreadsheet.readthedocs.io/en/latest/topics/worksheets/
        $default= $this->reportcontroller->default();
        $t00_monthly = $default ['t00_monthly'];
        $start_row = 8;
        foreach($t00_monthly as $record){
            // dd($record);
            $spreadsheet->getActiveSheet()->setCellValue('b'.$start_row, $record->title);
            $spreadsheet->getActiveSheet()->setCellValue('c'.$start_row, $record->nat_sum);
            $spreadsheet->getActiveSheet()->setCellValue('d'.$start_row, $record->aqu_sum);
            $spreadsheet->getActiveSheet()->setCellValue('e'.$start_row, $record->total_sum);
            $spreadsheet->getActiveSheet()->setCellValue('f'.$start_row, $record->sum_pro);
            $start_row++;
        }

        $spreadsheet->getActiveSheet()
        ->setCellValue('c'.$start_row, '=sum(c8:c'.($start_row-1).')')
        ->setCellValue('d'.$start_row, '=sum(d8:d'.($start_row-1).')')
        ->setCellValue('e'.$start_row, '=sum(e8:e'.($start_row-1).')')
        ->setCellValue('f'.$start_row, '=sum(f8:f'.($start_row-1).')');
        
       

        return [
            'spreadsheet' => $spreadsheet,
        ];
    
    }

    public function importstore(Request $request)
    {
        dd('xx');
        //
    }
}
