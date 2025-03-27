<?php

namespace App\Models;
use Carbon\Carbon;
use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class CategorieGroups extends Model
{
    use HasFactory ;

    public $table = 'category_group';

    protected $fillable = [
        'category_id',
        'group_id'
    ];

    protected $dates = [
        'created_at',
        'updated_at',
        'deleted_at',
    ];

   
}
