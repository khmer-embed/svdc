<?php

namespace App\Http\Controllers;

use DB;
use Schema;
use Illuminate\Http\Request;

use App\Models\Xlsform;

class HomeController extends Controller
{
    private $obj_info = ['name' => 'home', 'routing' => 'admin.controller', 'title' => 'Dashboard', 'icon' => '<i class="fas fa-th"></i>'];
    private $args;
    private $request;

    private $model;
    private $submodel;
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
        //$this->middleware('auth');
        $this->obj_info['title'] = 'Dashboard'; //__('label.lb09');
        $default_protectme = config('dev.app.protectme');
        // $this->protectme = [
        //     'display' => 'yes',
        //     'object' => [$this->obj_info['name']],
        //     'method'  => [
        //         'index' => $default_protectme['index'],
        //         'show' => $default_protectme['show'],
        //         'create' => $default_protectme['create'],
        //         'edit' => $default_protectme['edit'],
        //         'delete' => $default_protectme['delete'],
        //         'destroy' => $default_protectme['destroy'],
        //         'restore' => $default_protectme['restore'],
        //     ]
        // ];
        $this->args = $args;
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
        // dd(config('sysconfig.dashboardform'));
        $count = 0;
        $count_distinct = 0;
        $count_commune = 0;
        $koboformid = config('sysconfig.dashboardform');
        $tablename = '';
        if (!empty($koboformid)) {
            $get_formqry = Xlsform::where('id', $koboformid)->get();
            if (!$get_formqry->isEmpty()) {
                $title = $get_formqry[0]->title;
                $title_nospace = str_replace(' ', '_', $title);
                $tablename  = 'kobo' . $koboformid . '_' . $title_nospace;
                if (Schema::hasTable($tablename)) {
                    $tablecolumns = getTableColumns($tablename);
                    $tbl_question = 'kobo' . $koboformid . '_questions';
                    $tbl_choice = 'kobo' . $koboformid . '_choices';
                    $count = DB::table($tablename)->count();
                    try {
                        
                        $proceed_qry = DB::transaction(function () use ($tablename, $tbl_choice) {
                            $count_distinct = DB::table($tablename)->distinct()->count('group_location/commune');
                            $count_commune = DB::table($tbl_choice)->where('list_name', 'cCommune')->count();
                        });

                    }
                    catch(\Throwable $exception) {
                        goto skip_dberror;
                    }
                }
            }
        }
        skip_dberror:

        $total = 0;
        try {
            if (Schema::hasTable($tablename)) {
                $xx = DB::table($tablename)
                    ->select("group_location/province", DB::raw("count(`group_location/province`) as count_commune"))
                    ->groupby("group_location/province")->get();

                foreach ($xx as $x) {
                    $total += $x->count_commune;
                }

                $commune_byprovince = DB::table($tbl_choice)
                    ->select(DB::raw("IF(LENGTH(name) = 5, SUBSTRING(name, 1, 1),  SUBSTRING(name, 1, 2)) as pronvince, count(IF(LENGTH(name) = 5, SUBSTRING(name, 1, 1),  SUBSTRING(name, 1, 2))) as mcount"))
                    ->where('list_name', 'cCommune')
                    ->groupby(DB::raw("IF(LENGTH(name) = 5, SUBSTRING(name, 1, 1),  SUBSTRING(name, 1, 2))"))->get();
            }
        }
        catch(\Throwable $exception) {
                goto skip_dberror1;
        }

        skip_dberror1:

        // dd($commune_byprovince);
        /*
        SELECT IF(LENGTH(name) = 5, SUBSTRING(name, 1, 1),  SUBSTRING(name, 1, 2)) as pronvince, count(IF(LENGTH(name) = 5, SUBSTRING(name, 1, 1),  SUBSTRING(name, 1, 2))) as mcount FROM `kobo4_choices` WHERE list_name='cCommune'
GROUP BY IF(LENGTH(name) = 5, SUBSTRING(name, 1, 1),  SUBSTRING(name, 1, 2))

        SELECT tblprovince.label_0 as province, tbldistrict.label_0 as district, tblcommune.label_0 as commune, count_cm 
FROM `view_kobo4` LEFT JOIN kobo4_choices as tblprovince on view_kobo4.province = tblprovince.name left join kobo4_choices as tbldistrict on view_kobo4.district = tbldistrict.name left join kobo4_choices as tblcommune on view_kobo4.commune = tblcommune.name
WHERE tblprovince.list_name='cProvince' and tbldistrict.list_name = 'cDistrict' and tblcommune.list_name = 'cCommune'

        */

        $counter = ['count' => $count, 'count_distinct' => $count_distinct, 'count_commune' => $count_commune];
        return view('home')
            ->with([
                'obj_info'  => $this->obj_info,
                'counter' => $counter
            ]);
    }
}
