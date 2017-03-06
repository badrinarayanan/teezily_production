<?php
/**
 * Created by PhpStorm.
 * User: badrinarayanananravi
 * Date: 19/02/17
 * Time: 9:01 PM
 */

namespace app\Repository;
use App\Images;
use App\Marketplace;
use App\Products;
use App\Campaigns;
use App\Jobs\createCampaign;
use Illuminate\Support\Facades\Log;
use Carbon\Carbon;

class AppRepository
{


    /**
     *  This function calls the Teezily Products API and updates all products in the database
     *
     */
    public function syncProducts(){

        $token = generateAccessToken();

        $productsList = getProductsList($token);
        Products::truncate();

        foreach($productsList['data'] as $row){

            $this->products = new Products();

            $sideid = array(); $sides = array();
            foreach($row['sides'] as $side){

                $sideid[] = $side['id'];
                $sides[] = $side['name'];

            }

            $this->products->product_id = $row['id'];
            $this->products->product_reference = $row['reference'];
            $this->products->sides_id = implode(',',$sideid);
            $this->products->sides = implode(',',$sides);
            $this->products->colors = implode(',',$row['colors']);
            $this->products->save();

        }




    }

    /*
     *  This function calls the Market Place Categories API
     *  and syncs it with the database
     *
     */
    public function syncMarketPlace(){

        $token = generateAccessToken();

        $marketPlace = getMarketPlaceCategories($token);

        Marketplace::truncate();


        foreach($marketPlace['data'] as $row) {

            $this->marketplace = new Marketplace();

            $this->marketplace->marketplace_id = intval($row['id']);
            $this->marketplace->name = $row['name'];
            $this->marketplace->slug = $row['slug'];
            $this->marketplace->parent_id = $row['parent_id'] == '' ? 0:$row['parent_id'];
            $this->marketplace->save();


        }

    }

    /*
     *  List All Products
     *
     */
    public function getProductList(){


        $products = Products::get();

        return $products;

    }

    /*
     *  List All Image List
     */
    public function imageList(){

        $images = Images::get();

        return $images;
    }

    /*
     *  List All Market Place Categories
     *
     */
    public function getMarketPlace(){

        $marketplace = Marketplace::get();

        return $marketplace;
    }
    /*
     *   This function uploads the image to the local directory images and then
     *   the uploaded image is send to Teezily
     */
    public function postImage($request){

        $this->images = new Images();
        $path = $request->file("imagefile")->store("images");
        $token = generateAccessToken();

        $imagefile = [
            'files[]' => new \CurlFile(public_path($path), 'image/png', $request->filename.'.png')
        ];

        $result = uploadImage($token,$imagefile);

        $this->images->image_name = $request->filename;
        $this->images->teezily_name = $result[0]['filename'];
        $this->images->teezily_image_path = $result[0]['url'];
        $this->images->save();

        return json_encode(array("status" => "01","message" => "success"));

    }
    /*
     * Call the Teezily list campaign API and return all campaigns
     */
    public function listCampaign(){

        $token = generateAccessToken();
        $campaigns = listCampaign($token);
        return $campaigns['data'];

    }

    /**
     * @return array
     * @desc Returns the create campaign API
     */
    public function createCampaign(){

        $products = Products::get();

        $images = Images::get();

        return array("products" => $products,"images" => $images);


    }

    /**
     * @param $request
     * @desc Save the campaign in the database can push the request tp the Queue
     * @return string
     */
    public function saveCampaign($request){

        $details =  '';  $token = generateAccessToken();
        parse_str($request,$details);

        $campaign = new Campaigns();

        $items[] = array("price" => $details['price'],"product_id" => $details["select_id"],"color" => $details["select_color"]);

        $frontobject[] = array("image" => $details['select_front_image']);

        $design[] = array("side" => "front","objects" => $frontobject);

        if($details['select_back_image'] != ""){

            $backobject[] = array("image" => $details['select_front_image']);

            $design[] = array("side" => "back","objects" => $backobject);

        }

        $campaign->campaign_name = $details['campaign_name'];
        $campaign->description = $details['description'];
        $campaign->currency = $details['cur'];
        $campaign->campaign_slug = $details["slug"];
        $campaign->days_limit = $details["days_limit"];
        $campaign->sales_goal = $details["sales_goal"];
        $campaign->items = serialize($items);
        $campaign->design = serialize($design);
        $campaign->save();

        dispatch(new createCampaign($campaign->id));

        return json_encode(array("status" => "01","message" => "success"));
    }

    /**
     * @param $campaignid
     * @desc This function is used for calling the Teezily create campaign API
     */
    public function pushCampaignToTeezily($campaignid){


        $campaignDetails = Campaigns::findOrFail($campaignid);
        $token = generateAccessToken();

        $createCampaign  = array(

        "name" => $campaignDetails->campaign_name,
        "description" => $campaignDetails->description,
        "currency" => $campaignDetails->currency,
        'slug' => $campaignDetails->campaign_slug,
        "sales_goal" => strval($campaignDetails->sales_goal),
        "days_limit" => strval($campaignDetails->days_limit),
        "items" => unserialize($campaignDetails->items),
        "designs" => unserialize($campaignDetails->design)

        );

        $result = uploadCampaign($token,json_encode($createCampaign));
        Log::info($result);
            // Check if the campaign has been created else push it into the queue again and add 5 minutes
        if(isJson($result)){

            Campaigns::where("id","=",$campaignid)->update(["record_status" => "active"]);

        }else{

            dispatch(new createCampaign($campaignid))->delay(Carbon::now()->addMinutes(5));
        }


    }



}