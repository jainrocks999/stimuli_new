<?php

namespace App\Models;

use App\Support\HasAdvancedFilter;
use Carbon\Carbon;
use DateTimeInterface;
use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\SoftDeletes;
use Spatie\MediaLibrary\HasMedia;
use Spatie\MediaLibrary\InteractsWithMedia;

class Affirmation extends Model implements HasMedia
{
    use HasFactory, HasAdvancedFilter, SoftDeletes, InteractsWithMedia;

    public $table = 'affirmations';

    public const STATUS_RADIO = [
        '1' => 'Active',
        '0' => 'Inactive',
    ];

    protected $dates = [
        'created_at',
        'updated_at',
        'deleted_at',
    ];

    protected $fillable = [
        'affirmation_text',
        'voice_one',
        'voice_two',
        'voice_three',
        'voice_four',
        'status',
    ];

    public $orderable = [
        'id',
        'affirmation_text',
        'voice_one',
        'voice_two',
        'voice_three',
        'voice_four',
        'status',
    ];

    public $filterable = [
        'id',
        'affirmation_text',
        'voice_one',
        'voice_two',
        'voice_three',
        'voice_four',
        'status',
        'group.group_name',
        'category.categories_name',
    ];

    protected function serializeDate(DateTimeInterface $date)
    {
        return $date->format('Y-m-d H:i:s');
    }

    public function getStatusLabelAttribute($value)
    {
        return static::STATUS_RADIO[$this->status] ?? null;
    }

    public function group()
    {
        return $this->belongsToMany(Group::class);
    }

    public function category()
    {
        return $this->belongsToMany(Category::class);
    }

    public function favorite()
    {
        return $this->hasMany(FavoriteAffirmation::class);
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


    
    public function getVoiceOneAttribute()
    {
        return $this->getMedia('affirmation_voice_one')->map(function ($item) {
            $media        = $item->toArray();
            $media['url'] = $item->getUrl();
            return $media;
        });
    }

    public function getVoiceTwoAttribute()
    {
        return $this->getMedia('affirmation_voice_two')->map(function ($item) {
            $media        = $item->toArray();
            $media['url'] = $item->getUrl();

            return $media;
        });
    }

    public function getVoiceThreeAttribute()
    {
        return $this->getMedia('affirmation_voice_three')->map(function ($item) {
            $media        = $item->toArray();
            $media['url'] = $item->getUrl();

            return $media;
        });
    }

    public function getVoiceFourAttribute()
    {
        return $this->getMedia('affirmation_voice_four')->map(function ($item) {
            $media        = $item->toArray();
            $media['url'] = $item->getUrl();

            return $media;
        });
    }

}
