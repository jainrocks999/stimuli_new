<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

class CreateBgsoundsTable extends Migration
{
    public function up()
    {
        Schema::create('bgsounds', function (Blueprint $table) {
            $table->bigIncrements('id');
            $table->string('bgsound_name');
            $table->string('sound');
            $table->string('status');
            $table->timestamps();
            $table->softDeletes();
        });
    }
}
