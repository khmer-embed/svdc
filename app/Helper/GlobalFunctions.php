<?php

/*
* 1. Create the functions file : App\Functions\GlobalFunctions.php
* 2. Create a ServiceProvider: php artisan make:provider GlobalFunctionsServiceProvider
* 3. Open the new file App\Providers\GlobalFunctionsServiceProvider.php and edit the register method
    public function register()
    {
        require_once base_path().'/app/Functions/GlobalFunctions.php';
    }

* 4. Register your provider into App\Config\App.php wihtin the providers
* 5. Run some artisan's commands: php artisan clear-compiled, php artisan config:cache
*/

function verify_companysession($request, $company)
{
    // dd('xxx');
    if (session('current_company') != null) {
        if ($company != session('current_company')) {
            session()->flush();
            session(['current_company' => null]);
            Auth::logout();
        }
    } else {
        session(['current_company' => $company]);
    }
}

function df_lang()
{
    /*user for get data from DB*/
    //return ['kh', 'Khmer', 'ខ្មែរ', 'kh.gif'];
    // return ['en', 'English', 'English', 'en.gif'];

    $app_lang = config('dev.app.bankend_lang');
    $cr_lang = app()->getLocale() ?? reset($app_lang)[0];
    // dd($app_lang[$cr_lang]);
    return $app_lang[$cr_lang];
}
// 

function current_lang()
{
    $app_lang = config('dev.app.bankend_lang');
    $cr_lang = app()->getLocale() ?? reset($app_lang)[0];
    // dd($app_lang[$cr_lang]);
    return $app_lang[$cr_lang];
}


function langConfig($request)
{
    // dd(array_key_first(config('me.app.bankend_lang')));
    $lang = array_key_first(config('dev.app.bankend_lang'));
    if ($request->has('lang')) {
        $lang = $request->query('lang');
        session(['lang' => $lang]);
    } elseif (null == session('lang')) {
        session(['lang' => $lang]);
    }

    $lang = session('lang');
    \App::setLocale($lang);
}

function url_builder($routename, $path, $qstring = [], $mix = false)
{
    if (is_string($path)) {
        return $path;
    }

    $c = count($path);
    $url = array_merge($path, array_filter($qstring));
    if ($mix)
        return route($routename . $c, $url);
    else
        return route($routename, $url);
}

function url_language($lang)
{
    $currentURL = url()->full();
    if (empty($_GET)) {
        return $currentURL . "?lang=" . $lang;
    } else {
        return $currentURL . "&lang=" . $lang;
    }
}

function nav_checkactive($subject = [], $args = [], $extra_css = "active")
{
    /*Navegation check Active*/
    // dd($args['userinfo']['permission_setting']);
    $permission_setting = $args['userinfo']['permission_setting'];
    $routeinfo = $args['routeinfo'];
    $active_obj = $routeinfo['obj'] . '-' . $routeinfo['act'];
    $showhide = '';
    if ($args['userinfo']['permission_id'] != 1) {
        $only_object = array_map(function ($permission) {
            [$obj, $act] = explode('-', $permission);
            return $obj;
        }, $permission_setting);

        if (count($subject) == 1) {
            $only_subject = explode('-', $subject[0])[0];

            if ($only_subject != 'home') {
                if (!in_array($only_subject, $only_object)) {
                    $showhide = 'hide';
                }
            }
        } else {
            $showhide = 0 == count(array_intersect($subject, $only_object)) ? 'hide' : '';
        }
    }


    return in_array($active_obj, $subject) || in_array($routeinfo['obj'], $subject) ? $extra_css : $showhide;
}

function str_sanitize($str_input)
{
    $str_input = strip_tags($str_input, config('dev.app.allowtags'));
    $str_input = str_replace('\\r\\n', '', $str_input);
    $str_input = htmlentities($str_input, ENT_QUOTES);
    $str_input = str_replace('\\r\\n', '', $str_input);
    return $str_input;
}

function sanitize_filename($filename, $forceextension = "")
{
    /*
    1. Remove leading and trailing dots
    2. Remove dodgy characters from filename, including spaces and dots except last.
    3. Force extension if specified
    */

    $defaultfilename = "none";
    $dodgychars = "[^0-9a-zA-z()_-]"; // allow only alphanumeric, underscore, parentheses and hyphen
    $filename = str_sanitize($filename);
    $filename = preg_replace("/^[.]*/", "", $filename); // lose any leading dots
    $filename = preg_replace("/[.]*$/", "", $filename); // lose any trailing dots
    $filename = $filename ? $filename : $defaultfilename; // if filename is blank, provide default

    $lastdotpos = strrpos($filename, "."); // save last dot position
    $filename = preg_replace("/$dodgychars/", "_", $filename); // replace dodgy characters
    $afterdot = "";
    if ($lastdotpos !== false) { // explode into name and extension, if any.
        $beforedot = substr($filename, 0, $lastdotpos);
        if ($lastdotpos < (strlen($filename) - 1))
            $afterdot = substr($filename, $lastdotpos + 1);
    } else // no extension
        $beforedot = $filename;

    if ($forceextension)
        $filename = $beforedot . "." . $forceextension;
    elseif ($afterdot)
        $filename = $beforedot . "." . $afterdot;
    else
        $filename = $beforedot;

    return $filename;
}/*end func*/

function db()
{
    $databaseName = \DB::connection()->getDatabaseName();
    return $databaseName; //config('dev.app.backend');
}

function company()
{

    $company = $api = \Request::segment(1) ?? 'backend9';
    if (in_array($company, ['api', 'mobile', 'menukh'])) {
        $company = \Request::segment(2) ?? 'backend9';
    }
    return $company;
}

function csymbol()
{
    // dd(config('currencyinfo')['main']['symbol']);
    // return config('currencyinfo')['main']['symbol'];
    return config('currencyinfo.main.symbol');
}

function dbis($db = 'beta')
{
    return db() == $db;
}

function is_axios()
{

    return request()->input('action_handler_mode') && request()->input('action_handler_mode') == 'axios';
}

function save_type_route($savetype, $obj_info, $id = '', $other_type = [], $qstring = [])
{
    $arr_savetype = [
        "save" => "index",
        "new" => "create",
        "apply" => 'edit'
    ];
    $arr_savetype = array_merge($arr_savetype, $other_type);
    $action = empty($arr_savetype[$savetype]) ? 'index' : $arr_savetype[$savetype];
    $routing = url_builder(
        $obj_info['routing'],
        [$obj_info['name'], $action, $id],
        $qstring
    );

    return $routing;
}

function is_topadmin(int $blongto, int $permission_id)
{
    return $blongto == 0 && $permission_id == 1;
}

function is_admin(int $blongto, int $permission_id)
{
    return $permission_id == 1;
}

function where_not_topadmin()
{
    return "(blongto<>0)";
}

function where_not_trush($table = '')
{
    return "(" . $table . "trash<>'yes' OR " . $table . "trash IS NULL)";
}

function check_user_permission($controller, $act, $protectme, $userinfo)
{
    if ($protectme == null || $userinfo['permission_id'] == 1) {
        return true;
    }
    $controller =  strtolower($controller);
    $act = strtolower($act);
    $gonext = true;
    $levelsetting = ($userinfo['permission_setting']) ? $userinfo['permission_setting'] : [];
    $cover_method = [];
    $cover_object = [];
    $object = $protectme['object'];
    $method = $protectme['method'];
    foreach ($method as $main => $sub) {
        foreach ($sub['cover'] as $cover)
            $cover_method[$cover] = $main;
    }
    if (array_key_exists($act, $cover_method)) {
        foreach ($object as $item) {
            $trytoaccess = $item . '-' . $cover_method[$act];
            if (in_array($trytoaccess, $levelsetting)) {
                $gonext = true;
                break;
            } else {
                $gonext = false;
            }
        }
    }
    return $gonext;
}

function checkpermission($checkfor, $userinfo)
{
    $return = false;
    $levelid = $userinfo['permission_id'];
    $levelsetting = $userinfo['permission_setting'];
    if ($levelid == 1 || in_array($checkfor, $levelsetting))
        //if(in_array($checkfor, $levelsetting))
        $return = true;

    return $return;
}


function recordInfo($current, $perpage, $total, $lastpage = 0)
{
    #use for Pagination, it will inform other info of pagination#
    $from = ($current == 1) ? ($total == 0) ? 0 : 1 : (($current - 1) * $perpage) + 1;

    $to = ($current == 1) ? $perpage  : ($current * $perpage);
    if ($to > $total) $to = $total;
    return ['from' => $from, 'to' => $to, 'total' => $total, 'perpage' => $perpage, 'lastpage' => $lastpage];
}

function addColumn($sTable, $sColumn)
{
    // use Schema;
    // use Illuminate\Database\Schema\Blueprint;
    // use Illuminate\Support\Facades\DB;
    $fluent = null;
    \Schema::table($sTable, function (Illuminate\Database\Schema\Blueprint $table) use ($sTable, $sColumn, &$fluent) {
        if (!\Schema::hasColumn($sTable, $sColumn)) {
            if ($sColumn == '_attachments') {
                $fluent = $table->text($sColumn)->collate('utf8_general_ci')->nullable();
            } else {
                $fluent = $table->text($sColumn)->collate('utf8_general_ci')->nullable();
            }
        }
    });

    return response()->json($fluent);
}

function addColumnDouble($sTable, $sColumn)
{
    // use Schema;
    // use Illuminate\Database\Schema\Blueprint;
    // use Illuminate\Support\Facades\DB;

    \Schema::table($sTable, function (Illuminate\Database\Schema\Blueprint $table) use ($sTable, $sColumn, &$fluent) {
        if (!\Schema::hasColumn($sTable, $sColumn)) {
            $fluent = $table->double($sColumn)->nullable();
        }
    });

    //return response()->json($fluent);
}


function getTableColumns($table)
{
    return \DB::getSchemaBuilder()->getColumnListing($table);

    // OR

    return \Schema::getColumnListing($table);
}

function getJsonColumn($jsonfield, $attibute)
{
    return "JSON_UNQUOTE(JSON_EXTRACT(" . $jsonfield . ", '$." . $attibute . "'))";
}

function month_in_khmer($index)
{
    $mont = [
        "", "មករា", "កុម្ភៈ", "មីនា",
        "មេសា", "ឧសភា", "មិថុនា", "កក្កដា", "សីហា",
        "កញ្ញា", "តុលា", "វិច្ឆិកា", "ធ្នូ"
    ];
    $index = (int)$index;
    $index = ($index < 1) ? 0 : $index;
    $index = ($index > 12) ? 0 : $index;
    return $mont[$index];
}
function num_in_khmer($num_en)
{
    $length = strlen($num_en);
    // dd($length);
    $num_kh = ["០", "១", "២", "៣", "៤", "៥", "៦", "៧", "៨", "៩"];
    $num_en = str_split($num_en);
    $new_str = '';
    for ($i = 0; $i < $length; $i++) {
        $index = $num_en[$i];
        if (is_numeric($index)) {
            $index = (int)$index;
            if ($index >= 0 && $index <= 9) {
                $new_str .= $num_kh[$index];
            }
        } else {
            $new_str .= $index;
        }
    }

    return $new_str;
}

function setinfoFieldObject($model, $field)
{
    return $model->setinfoField()[$field];
}

/**
 * @param Array elements[id,parent_id,name,...]
 * @param Array $defaultField(id_fieldname,parent_fieldname)
 * @param Int parentId
 * @return Array
 */
function buildArrayTree(array $elements, $defaultField = ['id', 'parent_id'], $parentId = 0)
{
    $tree = array();
    foreach ($elements as $element) {
        if ($element[$defaultField[1]] == $parentId) {
            $children = buildArrayTree($elements, $defaultField, $element[$defaultField[0]]);
            if ($children) {
                $element['children'] = $children;
            }
            $tree[] = $element;
        }
    }

    return $tree;
}
/**@endfun**/

function copyTitle($old_title, $new_title, $model, $field)
{
    $check_title = $model->select(
        \DB::raw(
            $field . " AS title"
        )
    )
        ->where(\DB::raw($field), '=', $old_title)
        ->get()->toArray();

    if (!empty($check_title)) {
        $new_title = "copy of " . $check_title[0]['title'];
        $new_title = copyTitle($new_title, $new_title, $model, $field);
    } else {
        $new_title = $old_title;
    }
    return $new_title;
}
/**@endfun**/


function getid($keyid, $arr)
{
    $b = array_map(function ($a) use ($keyid) {
        return $a[$keyid] ?? 0;
    }, $arr);
    return $b;
}
/**@endfun**/

function get_now($type = '')
{
    $date = new Carbon\Carbon();
    $date->timezone('Asia/Phnom_Penh');
    if ($type == 'date') {
        return $date->now()->format('Y-m-d');
    } elseif ($type == 'time') {
        return $date->now()->format('H:i:s');
    } else {
        return $date->now()->format('Y-m-d H:i:s');
    }
}

function timestamp_to_date($value)
{
    $date = new Carbon\Carbon();
    $x = $date->parse($value)->timezone('Asia/Phnom_Penh')->format('d-m-Y H:i:s');
    return $x;
}

function timestamp_to_onlydate($value)
{
    $date = new Carbon\Carbon();
    $x = $date->parse($value)->timezone('Asia/Phnom_Penh')->format('d-m-Y');
    return $x;
}

function special_json_to_array($string = '')
{
    if (empty($string)) {
        return [];
    }
    $string = htmlspecialchars_decode($string);
    return json_decode(htmlspecialchars_decode($string), true);
}

function key_same_value($arr, $replace = [])
{
    foreach ($arr as $ind => $data) {
        $arr[$ind] = array_replace($data, $replace);
    }
    return $arr;
}

function getMaxId($tablename, $primarykey = 'id')
{
    return $tablename->max($primarykey);
}
/**@endfun**/

function idsizecolor($id, $sizeid, $colorid)
{
    return $id . '-' . $sizeid . '-' . $colorid;
}

function date_validate_query($field = 'add_date', $from_date = 'fromdate', $to_date = 'todate', $opts = [])
{
    $appends = [];
    $querystr = '';
    $fromdate = '';
    $todate = '';
    $query = '';
    if (request()->has($from_date) && !empty(request()->input($from_date))) {
        $qry = request()->input($from_date);
        $fromdate = date("Y-m-d", strtotime($qry));
        $query = "DATE($field)='" . $fromdate . "'";

        $querystr = $from_date . '=' . $qry;
        $appends = [$from_date => $qry];
    }
    if (request()->has($to_date) && !empty(request()->input($to_date))) {
        $qry = request()->input($to_date);
        $todate = date("Y-m-d", strtotime($qry));
        $query = "DATE($field)='" . $todate . "'";

        $querystr = $to_date . '=' . $qry;
        $appends = [$to_date => $qry];
    }
    if (request()->has($from_date) && request()->has($to_date) && !empty(request()->input($from_date)) && !empty(request()->input($to_date))) {
        $fromdate = request()->input($from_date);
        $fromdate = date("Y-m-d", strtotime($fromdate));

        $todate = request()->input($to_date);

        $todate = date("Y-m-d", strtotime($todate));

        $query = "(DATE($field) between '$fromdate' and '$todate')";
        $querystr = $from_date . '=' . $fromdate . '&' . $to_date . '=' . $todate;
        $appends = [$from_date => $fromdate, $to_date => $todate];
    }
    return [
        'from_date' => $fromdate,
        'to_date' => $todate,
        'query' => $query,
        'request_query_string' => $querystr,
        'appends' => $appends
    ];
}

function where_between_filter($str, $separator = ':')
{
    $is_between = strpos($str, $separator);
    if (empty($str) || $is_between === false) {
        return false;
    }
    $between = explode($separator, $str);
    if (empty($between[0]) || empty($between[1])) {
        $between[0] = $between[1] = 0;
        return $between;
    }
    return $between;
}

function where_in_filter($str, $separator = ',')
{
    $is_where_in = strpos($str, $separator);
    if (empty($str) || $is_where_in === false) {
        return [];
    }
    return explode($separator, $str);
}


function branch_condition($userinfo, $field = 'branch_id', $conjunction = ' and ', $opts = [])
{
    $branch_cond = $conjunction . "$field=" . $userinfo['branch_id'];
    if ($userinfo['permission_id'] == 1) {
        if ($userinfo['branch_id'] == 0) {
            $branch_cond = "";
        }
    }
    return $branch_cond;
}
/**@endfun**/
function publicfilepath()
{
    return asset('public');
}

function filepath($disk = "", $path = "")
{

    $disk = empty($disk) ? config('sysconfig.storagedisk') : $disk;
    $path = empty($path) ? config('sysconfig.storagepath') : $path;
    $file_path = Storage::disk($disk)->url($path);
    if ($disk != 's3') {
        // $file_path = str_replace("storage", db() . "/storage/app/public", $file_path . '/');
        //$file_path = str_replace( 'http://', 'https://', $file_path);

        $file_path = \URL::asset("/storage/app/public/" . $path);
        $file_path .= "/";
    }
    return $file_path;
}

function get_userinfo($id)
{
    $qry = App\Models\User::select('*')->find($id);
    if ($qry) {
        return $qry->toArray();
    }
    return [];
}

function unauthuser()
{
    $users = App\Models\User::where('permission_id', 1)->first();
    return $users;
}

function userinfo($users)
{
    if(!isset($users->permission_id)){
        redirect($_SERVER['REQUEST_URI']);
    }
    $permission_id = $users->permission_id;
    $user_permission = App\Models\Userpermission::getpermission($permission_id);
    $permission_setting = ($user_permission) ? json_decode($user_permission->levelsetting) : [];
    $userinfo = ['id' => $users->id, 'blongto' => $users->blongto, 'permission_id' => $users->permission_id, 'name' => $users->name, 'fullname' => $users->fullname, 'pwd' => $users->password ?? '', 'branch_id' => $users->branch_id, 'warehouse_id' => $users->warehouse_id, 'province_id' => $users->province_id, 'permission_setting' => $permission_setting];
    return $userinfo;
}



function formatID($num)
{
    $digit = !empty(config('sysconfig.iddigit')) ? config('sysconfig.iddigit') : 6;
    return str_pad($num, $digit, "0", STR_PAD_LEFT);
}

function parseFloat($num)
{
    return (float)$num;
}


function array_merge_numeric_values($arrays)
{
    // $arrays = func_get_args();
    $merged = array();
    foreach ($arrays as $array) {
        foreach ($array as $key => $value) {
            if (!is_numeric($value)) {
                continue;
            }
            if (!isset($merged[$key])) {
                $merged[$key] = $value;
            } else {
                $merged[$key] += $value;
            }
        }
    }
    return $merged;
}


function koboToLaraType()
{
    return [
        'integer' => 'integer',
        'decimal' => 'decimal',
        'range' => 'double',
        'text' => 'text',
        'select_one' => 'text', //'string',
        'select_multiple' => 'text', //'string',
        'select_one_from_file' => 'text', //'string',
        'select_multiple_from_file' => 'text', //'string',
        'rank' => 'text', //'string',
        'note' => 'text',
        'geopoint' => 'longText',
        'geotrace' => 'longText',
        'geoshape' => 'longText',
        'date' => 'dateTime',
        'time' => 'time',
        'dateTime' => 'dateTime',
        'image' => 'text', //'string',
        'file' => 'text', //'string',
        'calculate' => 'text', //'double',
        'acknowledge' => 'boolean',
        'start' => 'dateTime',
        'end'   => 'dateTime',
        'today' => 'dateTime',

    ];
}

function koboExceptionType()
{
    return [
        'begin_repeat',
        'end_repeat',
        'end_group',
        'begin_group'
    ];
}

function getchoice($listname, $choices){
    $filtered_array = array();
    foreach ($choices as $value) {
        if (isset($value->list_name)) {
            if ($value->list_name == $listname) {
                $filtered_array[$value->name] = $value->label_0;
            }
        }
    }
    return $filtered_array;
}

function get_view_by_db_name($path, $blade = 'index', $parent_path = 'app.', $opts = []){
    $dbname = config('ccms.backend');
    $view_path = $parent_path.$path.'.'.$dbname.'_'.$blade;
    if (!view()->exists($view_path)){
      return $parent_path.$path.'.'.$blade;
    }
    return $view_path;
  }

function isip($string=''){
    // $string = "http://192.168.0.0";
    $parts = parse_url($string);
    return (bool)ip2long($parts['host']??'');
}
