<?php

use Illuminate\Support\Facades\Schema;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Database\Migrations\Migration;

class CreateCampaignsTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('campaigns', function (Blueprint $table) {
            $table->increments('id');
            $table->string("campaign_name");
            $table->string("description");
            $table->enum("currency",["eur","usd"]);
            $table->string("campaign_slug");
            $table->integer("days_limit");
            $table->integer("sales_goal");
            $table->text("items");
            $table->text("design");
            $table->enum("record_status",["active","inactive"])->default("inactive");
            $table->timestamps();
        });
    }

    /**
     * Reverse the migrations.
     *
     * @return void
     */
    public function down()
    {
        Schema::dropIfExists('campaigns');
    }
}
