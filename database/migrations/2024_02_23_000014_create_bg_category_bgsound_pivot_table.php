<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

class CreateBgCategoryBgsoundPivotTable extends Migration
{
    public function up()
    {
        Schema::create('bg_category_bgsound', function (Blueprint $table) {
            $table->unsignedBigInteger('bgsound_id');
            $table->foreign('bgsound_id', 'bgsound_id_fk_9528755')->references('id')->on('bgsounds')->onDelete('cascade');
            $table->unsignedBigInteger('bg_category_id');
            $table->foreign('bg_category_id', 'bg_category_id_fk_9528755')->references('id')->on('bg_categories')->onDelete('cascade');
        });
    }
}
