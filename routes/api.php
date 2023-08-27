<?php

use Illuminate\Http\Request;
use Illuminate\Support\Facades\Route;

/*
|--------------------------------------------------------------------------
| API Routes
|--------------------------------------------------------------------------
|
| Here is where you can register API routes for your application. These
| routes are loaded by the RouteServiceProvider within a group which
| is assigned the "api" middleware group. Enjoy building your API!
|
*/

$company = company();
// dd($company);


// Route::get('/', function () {
//     // return view('welcome');
//     return 'aaa';
// });
Route::group(
    ['prefix' => $company],
    function () use ($company) {
        // dd($company);
        // Auth::routes();
        //Route::get('/home', [App\Http\Controllers\HomeController::class, 'index'])->name('home');
        // Route::group(['prefix' => 'acc'], function () {
        Route::group(['middleware' => ['auth:sanctum']], function () {
            Route::any('{controller}/{method?}/{id?}', ['uses' => 'App\Http\Controllers\UserAccessController@index'])
                ->where(['id' => '[0-9]+', 'controller' => '[0-9a-z]+', 'method' => '[_a-z]+'])->name('api.controller');
        });
    }
);