<?php

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

Route::get("syncproducts","AppController@syncProducts");
Route::get("syncmarketplace","AppController@syncMarketPlace");
Route::get("getproductlist","AppController@getProductList");
Route::get("getmarketplace","AppController@getMarketPlace");
Route::get("uploadimage","AppController@uploadimage");
Route::get("campaignlist","AppController@listCampaign");
Route::get("createcampaign","AppController@createCampaign");
Route::get("imagelist","AppController@imageList");


Route::post("postimage","AppController@postImage");

Route::post("uploadcampaign","AppController@uploadCampaign");