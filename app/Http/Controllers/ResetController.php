<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use Schema;
use DB;
class ResetController extends Controller
{
    private $obj_info = ['name' => 'reset', 'title' => 'Reset System', 'icon' => '<i class="fa fa-database" style="color: green" aria-hidden="true"></i>'];
    private $args;
    private $request;

    private $model;
    private $submodel;
    private $tablename;
    private $fprimarykey = '';
    private $protectme = null;

    private $dflang;
    private $rcdperpage = -1; #record per page, set negetive to get all record#
    private $realtimeinsert;

    /**
     * Create a new controller instance.
     *
     * @return void
     */
    public function __construct(array $args = [])
    {
        //$this->middleware('auth');
        $this->obj_info['title'] = 'Reset System'; //__('label.lb09');
        $default_protectme = config('dev.app.protectme');
        $this->protectme = [
            'display' => 'yes',
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
        $this->realtimeinsert = new RealtimeinsertController($args);
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

    /**
     * Show the application dashboard.
     *
     * @return \Illuminate\Contracts\Support\Renderable
     */
    public function index()
    {
        
        //
        $tables = DB::select("SHOW TABLES;");
        $tables = array_map('current',$tables);
        foreach($tables as $table)
        {
            $head_4 = substr($table,0,4);
            if(strtolower($head_4) == 'kobo'){
                Schema::dropIfExists($table);
            }
        }
        
        //

        $results = $this->realtimeinsert->listingmodel();
        $forms = $results->get();
        if(!$forms->isEmpty()){
            foreach($forms as $form){
                // dd($form);
                Schema::dropIfExists($form->table_name);
            }
        }
        
        
        \App\Models\Question::truncate();
        \App\Models\TeamXlsform::truncate();
        \App\Models\Xlsform::truncate();
        \App\Models\Questionsinfo::truncate();
        \App\Models\Realtimeinsert::truncate();
        
        
    }
    //
}
