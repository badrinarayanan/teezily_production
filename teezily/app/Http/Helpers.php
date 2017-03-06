<?php
/**
 * This files contains all the helper functions
 *
 *
 *
 */

function generateAccessToken(){


    // array which contains the data to get the access token
    $fields = array(

        "client_id" => env('CLIENT_APP_ID'),
        "client_secret" => env('CLIENT_APP_SECRET') ,
        "grant_type" => "password" ,
        "email" => env('USER_EMAIL') ,
        "password" => env('USER_PASSWORD')

    );

    // A Curl request to get the access token
    $ch = curl_init();

    curl_setopt($ch, CURLOPT_URL,'https://www.teezily.com/oauth/token');
    curl_setopt($ch, CURLOPT_HTTPHEADER, array(
            'Content-Type: application/json',
            'Content-Length: ' . strlen(json_encode($fields)))
    );
    curl_setopt($ch, CURLOPT_POST,1);
    curl_setopt($ch, CURLOPT_POSTFIELDS,json_encode($fields));
    curl_setopt($ch, CURLOPT_RETURNTRANSFER, 1);
    $result=curl_exec ($ch);


    curl_close ($ch);

    $token = json_decode($result,true);

    return  $token['access_token'];



}

function  getProductsList($token){

    $ch = curl_init();
    curl_setopt($ch, CURLOPT_URL,"https://www.teezily.com/api/v1/products");
    curl_setopt($ch,CURLOPT_HTTPHEADER,array("Authorization: Bearer ".$token));
    curl_setopt($ch, CURLOPT_RETURNTRANSFER, true);
    $result =  curl_exec ($ch);
    curl_close ($ch);

    return json_decode($result,true);

}

function getMarketPlaceCategories($token){

    $ch = curl_init();
    curl_setopt($ch, CURLOPT_URL,"https://www.teezily.com/api/v1/marketplace_categories");
    curl_setopt($ch,CURLOPT_HTTPHEADER,array("Authorization: Bearer ".$token));
    curl_setopt($ch, CURLOPT_RETURNTRANSFER, true);
    $result =  curl_exec ($ch);
    curl_close ($ch);

    return json_decode($result,true);

}

function uploadImage($token,$imagefile){

    $ch = curl_init();
    curl_setopt($ch, CURLOPT_URL,"https://www.teezily.com/api/v1/images");
    curl_setopt($ch,CURLOPT_HTTPHEADER,array("Authorization: Bearer ".$token,'Content-Type:multipart/form-data'));
    curl_setopt($ch, CURLOPT_POST,1);
    curl_setopt($ch, CURLOPT_POSTFIELDS, $imagefile);
    curl_setopt($ch, CURLOPT_RETURNTRANSFER, true);
    $result =  curl_exec ($ch);
    curl_close ($ch);

    return json_decode($result,true);

}

function listCampaign($token){

    $ch = curl_init();
    curl_setopt($ch, CURLOPT_URL,"https://www.teezily.com/api/v1/campaigns");
    curl_setopt($ch,CURLOPT_HTTPHEADER,array("Authorization: Bearer ".$token));
    curl_setopt($ch, CURLOPT_RETURNTRANSFER, true);
    $result =  curl_exec ($ch);
    curl_close ($ch);

    return json_decode($result,true);



}

function uploadCampaign($token,$campaign){


    $ch = curl_init();
    curl_setopt($ch, CURLOPT_URL,"https://www.teezily.com/api/v1/campaigns");
    curl_setopt($ch,CURLOPT_HTTPHEADER,array("Authorization: Bearer ".$token,'Content-Type: application/json'));
    curl_setopt($ch, CURLOPT_POST,1);
    curl_setopt($ch, CURLOPT_POSTFIELDS, $campaign);
    curl_setopt($ch, CURLOPT_RETURNTRANSFER, true);
    $result =  curl_exec ($ch);
    curl_close ($ch);

    echo $result;


}

/*
 *  Function to check whether
 */
function isJson($string) {
    json_decode($string);
    return (json_last_error() == JSON_ERROR_NONE);
}

