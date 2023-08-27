<?php

namespace App\Http\Controllers;

use DB;


use Illuminate\Http\Request;

class DefaultController extends Controller
{
    private $obj_info = ['name' => 'default', 'title' => 'Default', 'icon' => '<i class="fa fa-home" style="color: green" aria-hidden="true"></i>'];
    private $args;
    private $request;

    private $model;
    private $submodel;
    private $productobj;
    private $exchangeobject;
    private $tablename;
    private $fprimarykey = '';
    private $protectme = null;

    private $dflang;
    private $rcdperpage = -1; #record per page, set negetive to get all record#
    private $users;

    /**
     * Create a new controller instance.
     *
     * @return void
     */
    public function __construct(array $args = [])
    {
        $this->obj_info['title'] = 'Default'; //__('label.lb09');
        $this->args = $args;
        $this->dflang = df_lang();
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

    /**
     * Show the application dashboard.
     *
     * @return \Illuminate\Contracts\Support\Renderable
     */
    public function index(Request $request, $condition = [], $setting = [])
    {
        
    }

    public function enviromentInit($args=[]){

        
    }

    public function reset(){
        // Reset::resetdb();
    }

    public function vpf(){

    }
}
