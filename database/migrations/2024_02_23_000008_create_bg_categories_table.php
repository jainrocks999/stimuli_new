<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

class CreateBgCategoriesTable extends Migration
{
    public function up()
    {
        Schema::create('bg_categories', function (Blueprint $table) {
            $table->bigIncrements('id');
            $table->string('bg_name');
            $table->string('status')->nullable();
            $table->timestamps();
            $table->softDeletes();
        });
    }
}
