<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

class CreateAffirmationsTable extends Migration
{
    public function up()
    {
        Schema::create('affirmations', function (Blueprint $table) {
            $table->bigIncrements('id');
            $table->string('affirmation_text');
            $table->string('voice_one');
            $table->string('voice_two');
            $table->string('voice_three');
            $table->string('voice_four');
            $table->string('status')->nullable();
            $table->timestamps();
            $table->softDeletes();
        });
    }
}
