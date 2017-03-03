<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Repository\AppRepository;

class AppController extends Controller
{

    private $repository;

    public function __construct()
    {
        $this->repository = new AppRepository();
    }

    public function syncProducts(){

        $this->repository->syncProducts();
    }

    public function syncMarketPlace(){

        $this->repository->syncMarketPlace();
    }

    public function getProductList(){

        $data['products'] = $this->repository->getProductList();
        return view("products",$data);
    }

    public function getMarketPlace(){

        $data['marketplace'] = $this->repository->getMarketPlace();
        return view("marketplace",$data);
    }

    public function imageList(){

        $data['images'] = $this->repository->imageList();

        return view("images",$data);

    }

    public function uploadImage(){

        return view("uploadimage");
    }

    public function postImage(Request $request){

        $result = $this->repository->postImage($request);
        echo $result;
    }

    public function listCampaign(){

        $data['campaignlist'] = $this->repository->listCampaign();
        return view("campaignlist",$data);

    }

    public function createCampaign(){

        $query = $this->repository->createCampaign();
        $data["products"] = $query["products"];
        $data["images"] = $query["images"];

        return view("createcampaign",$data);
    }

    public function uploadCampaign(Request $request){

        $result = $this->repository->saveCampaign($request->details);
        echo $result;

    }

}
