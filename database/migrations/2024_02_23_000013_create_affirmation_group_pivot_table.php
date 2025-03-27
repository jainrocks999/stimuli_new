<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

class CreateAffirmationGroupPivotTable extends Migration
{
    public function up()
    {
        Schema::create('affirmation_group', function (Blueprint $table) {
            $table->unsignedBigInteger('affirmation_id');
            $table->foreign('affirmation_id', 'affirmation_id_fk_9528512')->references('id')->on('affirmations')->onDelete('cascade');
            $table->unsignedBigInteger('group_id');
            $table->foreign('group_id', 'group_id_fk_9528512')->references('id')->on('groups')->onDelete('cascade');
        });
    }
}
