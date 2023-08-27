<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;

use App\Models\User;
use App\Models\UserPermission;
use App\Models\Xlsform;
use App\Http\Controllers\DefaultController;

class UserAccessController extends Controller
{
    private $path = "App\Http\Controllers\\";
    private $branch;
    private $warehouse;
    //

    public function apiAuth(Request $request)
    {

    }

    public function index(Request $request, $obj = 'home', $act = 'index', $id = 0, $title = '')
    {
        verify_companysession($request, company());
        langConfig($request);
        $dflang = df_lang();
        
        $d_path = $this->path . "HomeController";
        $a_path = $this->path . ucfirst($obj) . "Controller"; //ArticleController

        $users = auth()->user();

        if(!$users){
            return \Redirect::to("/".company()."/logout");
        }
        // if(empty($users->api_token)){
        //     $token = $users->createToken('myapptoken')->plainTextToken;
        //     $users->api_token = $token;
        //     $users->save();
        // }
        $userinfo = userinfo($users);
        $routeinfo = ['obj' => $obj, 'act' => $act, 'id' => $id, 'title' => $title];

        try {
            $request->session()->put('routeinfo', $routeinfo);
        } catch (\Exception $e) {
            goto a;
        }
        a:


        $args = [
            //$request,
            'userinfo' => $userinfo,
            'routeinfo' => $routeinfo
        ];
        /* start setup eviroment*/
        $dfobject = new DefaultController();
        $dfobject->enviromentInit($args);
        /*end*/

        /*
            get data from Kobo form for side bar menu
        */
        $xlsform_qry = Xlsform::orderby('title', 'asc')->get();
        // dd($xlsform_qry);
        view()->share('xlsform', $xlsform_qry);
        
        view()->share('userinfo', (object)$userinfo);
        view()->share('args', $args);
        if (class_exists($a_path)) {
            $a_class = new $a_path($args);/*acees class*/

            if (method_exists($a_class, $act)) {

                $protectme = $a_class->getters('protectme');
                // dd($userinfo);
                $gonext = check_user_permission($obj, $act, $protectme, $userinfo);

                //check dynamic form
                if($userinfo['permission_id'] != 1 && ($obj=='dynamicform' || $obj=='dynamicreport')){
                    
                    if (request()->has('koboformid')) {
                        $koboformid = request()->input('koboformid');
                        session(['koboformid' => $koboformid]);
                    }
                    elseif (null == session('koboformid') || empty(session('koboformid'))) {
                        session(['koboformid' => 0]);
                    }
                    $koboformid = session('koboformid');
                    

                    if (!in_array("kobo_".$koboformid.'-index', $userinfo['permission_setting'])) {
                        $gonext = false;
                    }
                    
                }
                if ($gonext) {
                    if ($id)
                        $getact = $a_class->$act($request, $id);
                    else {
                        $getact = $a_class->$act($request);
                    }
                    // dd(json_decode($getact->content(), true));
                    if (is_object($getact) && method_exists($getact, 'getContent')) {
                        $getact_toobj = json_decode($getact->getContent());
                        if (isset($getact_toobj->type) && $getact_toobj->type == 'url') {
                            if (isset($getact_toobj->route->url)) {
                                return \Redirect::to($getact_toobj->route->url)
                                    ->with((array)$getact_toobj);
                            }
                        }
                    }

                    return $getact;
                } else {
                    if (is_axios()) {
                        return response()
                            ->json(
                                [
                                    "type" => "error",
                                    "message" => 'You have no permission to access this!',
                                ],
                                422
                            );
                    }
                    return view('nopermission');
                }
            }
        }

        if (is_axios()) {

            return response()
                ->json(
                    [
                        "type" => "error",
                        "message" => 'Page/Action you try to access is not found!',
                    ],
                    422
                );
        }
        return view('notfound');
    }
}
