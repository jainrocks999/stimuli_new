<?php

namespace App\Models;
use Carbon\Carbon;
use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;
use Illuminate\Support\Facades\DB;

class GroupCategories extends Model
{
    use HasFactory;

    public $table = 'category_group';

    protected $fillable = [
        'category_id',
        'group_id'
    ];
    
    
    public function groupByCategories(){
        $categories = Category::where('status',1)->distinct()->get();
        $favCategories = DB::table('category_favorite')->distinct()->get(); 
        if(!empty($categories)){
            foreach($categories as $categorie){
                $categorie->is_favorite = false;
                $categorie->favorite_id = null;
                if(!empty($favCategories)){
                    foreach($favCategories as $favCategorie){
                        if($favCategorie->category_id == $categorie->id){
                            $categorie->is_favorite = true;
                            $categorie->favorite_id = $favCategorie->favorite_id;
                        }
                    }
                }
            }
        }
       return $categories;
    }
}
