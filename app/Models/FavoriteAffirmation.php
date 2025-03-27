<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;
use Illuminate\Support\Facades\DB;
class FavoriteAffirmation extends Model

{
    use HasFactory;
    public $table = 'favorite_affirmation';

    protected $fillable = [
        'favorite_id',
        'affirmation_id'
    ];

    protected $dates = [
        'created_at',
        'updated_at',
        'deleted_at',
    ];

    public function affermation()
    {
        return $this->belongsToMany(User::class);
    }
    
    
    public function categoryByAffermation($category_id){
        $category = Category::with('affermation')->where('id', $category_id)->first();
        $favAffermations = $this->favroiteAffermation(); 
        $catAffermationIds = [];
        $param = [];
        if (!empty($favAffermations)) {
            if (!empty($category['affermation'])) {
                foreach ($category['affermation'] as $affval) {
                    $catAffermationIds[] = $affval['id']; 
                }
                foreach ($favAffermations as $favAffermation) {
                    if (in_array($favAffermation->id, $catAffermationIds)) {
                        $param[] = $favAffermation;
                    }
                }
                $category['categoryByAffermation'] = $param; 
            } else {
                $category['categoryByAffermation'] = $param; 
            }
            unset($category['affermation']); 
        }
        return $category;
    }
    
    
    //Favroite Affermation
    public function favroiteAffermation()
    {
        $affirmations = Affirmation::with(['group', 'media'])->where('status', 1)->distinct()->get();
        $favAffirmations = DB::table('affirmation_favorite')->distinct()->get();
        if(!empty($affirmations)){
            foreach($affirmations as $affirmation){
                $affirmation->is_favorite = false;
                $affirmation->favorite_id = null;
                if(!empty($favAffirmations)){
                    foreach($favAffirmations as $favAffirmation){
                        if($favAffirmation->affirmation_id == $affirmation->id){
                            $affirmation->is_favorite = true;
                            $affirmation->favorite_id = $favAffirmation->favorite_id;
                        }
                    }
                }
            }
        }
        return $affirmations;
    } 
    
    
    
}
