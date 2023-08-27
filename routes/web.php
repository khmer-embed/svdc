<?php

use Illuminate\Support\Facades\Route;
// use Session;

/*
|--------------------------------------------------------------------------
| Web Routes
|--------------------------------------------------------------------------
|
| Here is where you can register web routes for your application. These
| routes are loaded by the RouteServiceProvider within a group which
| contains the "web" middleware group. Now create something great!
|
*/

$company = company();

try {
    config(['database.connections.mysql.database' => $company]);
    DB::connection()->getPdo();
} catch (\Exception $e) {
    exit();
}


// config(['sysconfig' => config('dev.' . $company . '_kobo')]);
config(['sysprofile' => config('sys.' . $company . '_profile')]);


Route::group(['prefix' => $company], function () use ($company) {
    Route::get('/', function () use ($company) {
        // return view('welcome');
        return redirect("/$company/home");
    });
    Route::get('logout', '\App\Http\Controllers\Auth\LoginController@logout')->name('logout');
    Auth::routes();

    //Route::get('/home', [App\Http\Controllers\HomeController::class, 'index'])->name('home');

    // Route::group(['prefix' => 'acc'], function () {

    Route::group(['middleware' => ['auth']], function () {

        Route::any('/{controller}/{method?}/{id?}', ['uses' => 'App\Http\Controllers\UserAccessController@index'])
            ->where(['id' => '[0-9]+', 'controller' => '[0-9a-z]+', 'method' => '[_a-z]+'])->name('admin.controller');
    });
    // });

});
