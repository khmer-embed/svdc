<?php

namespace App\Http\Controllers\Auth;

use App\Http\Controllers\Controller;
use App\Providers\RouteServiceProvider;
use Illuminate\Foundation\Auth\AuthenticatesUsers;
use Illuminate\Http\Request;
class LoginController extends Controller
{
    /*
    |--------------------------------------------------------------------------
    | Login Controller
    |--------------------------------------------------------------------------
    |
    | This controller handles authenticating users for the application and
    | redirecting them to your home screen. The controller uses a trait
    | to conveniently provide its functionality to your applications.
    |
    */

    use AuthenticatesUsers;

    /**
     * Where to redirect users after login.
     *
     * @var string
     */
    protected $redirectTo = "home"; //RouteServiceProvider::HOME;
    

    /**
     * Create a new controller instance.
     *
     * @return void
     */
    public function __construct()
    {
        $this->middleware('guest')->except('logout');
    }

    public function login(Request $request)
    {
        $credentials = [
            'name' => function ($query) use($request){
                    $query->where('name', $request->input('username'))
                    ->orWhere('email', $request->input('username'));
            },
            'password' => $request->input('password'),
            'userstatus' => 'yes',
            'trash' => function ($query) {
                $query->whereRaw(where_not_trush());
           }
        ];

        if (\Auth::attempt($credentials)) {
            session(['current_company' => company()]);
            $db_arr = explode('_', company());
            $db = $db_arr[0];
            if(isset($db_arr[1])){
                $db = $db_arr[1];
            }

            return redirect()->intended($db."/home");
        }
        return redirect()->back()
            ->withInput()
            ->withErrors([
                'username' => 'User Or Password Invalids.....',
            ]);
    }

    public function logout(Request $request)
    {
        $this->guard()->logout();
        $request->session()->invalidate();
        $request->session()->regenerateToken();
        if ($response = $this->loggedOut($request)) {
            return $response;
        }

        $db_arr = explode('_', company());
            $db = $db_arr[0];
            if(isset($db_arr[1])){
                $db = $db_arr[1];
            }

        return redirect('/'.$db.'/');
    }
}
