<?php

namespace App\Models;

use App\Support\HasAdvancedFilter;
use Carbon\Carbon;
use DateTimeInterface;
use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\SoftDeletes;

class PlaylistItem extends Model
{
    use HasFactory, HasAdvancedFilter;

    public $table = 'playlist_items';

    protected $fillable = [
        'category_id',
        'playlist_id',
        'affirmation_id',
    ];

    protected $dates = [
        'created_at',
        'updated_at',
        'deleted_at',
    ];

    public $orderable = [
        'id',
        'categories.categories_name',
        'playlist.title',
        'playlist.description',
        'affirmation.affirmation_text',
    ];

    public $filterable = [
        'id',
        'categories.categories_name',
        'playlist.title',
        'playlist.description',
        'affirmation.affirmation_text',
    ];

    protected function serializeDate(DateTimeInterface $date)
    {
        return $date->format('Y-m-d H:i:s');
    }

    public function playlist()
    {
        return $this->belongsTo(Playlist::class);
    }

    public function category()
    {
        return $this->belongsTo(Category::class);
    }

    public function affirmation()
    {
        return $this->belongsTo(Affirmation::class);
    }

    public function getCreatedAtAttribute($value)
    {
        return $value ? Carbon::createFromFormat('Y-m-d H:i:s', $value)->format(config('project.datetime_format')) : null;
    }

    public function getUpdatedAtAttribute($value)
    {
        return $value ? Carbon::createFromFormat('Y-m-d H:i:s', $value)->format(config('project.datetime_format')) : null;
    }

    public function getDeletedAtAttribute($value)
    {
        return $value ? Carbon::createFromFormat('Y-m-d H:i:s', $value)->format(config('project.datetime_format')) : null;
    }
}