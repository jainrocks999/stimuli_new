<?php

namespace App\Models;

use App\Support\HasAdvancedFilter;
use Carbon\Carbon;
use DateTimeInterface;
use Hash;
use Illuminate\Contracts\Translation\HasLocalePreference;
use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\SoftDeletes;
use Illuminate\Foundation\Auth\User as Authenticatable;
use Illuminate\Notifications\Notifiable;
use Laravel\Passport\HasApiTokens;


class User extends Authenticatable implements HasLocalePreference
{
    use HasFactory,HasApiTokens, HasAdvancedFilter, Notifiable, SoftDeletes;

    public $table = 'users';

    protected $hidden = [
        'remember_token',
        'password',
    ];

    public const STATUS_RADIO = [
        '1' => 'Active',
        '0' => 'InActive',
    ];

    protected $dates = [
        'email_verified_at',
        'created_at',
        'updated_at',
        'deleted_at',
    ];

    protected $fillable = [
        'first_name',
        'last_name',
        'mobile_no',
        'name',
        'email',
        'password',
        'country_id',
        'locale',
        'status',
    ];

    public $orderable = [
        'id',
        'first_name',
        'last_name',
        'mobile_no',
        'name',
        'email',
        'email_verified_at',
        'locale',
        'status',
    ];

    public $filterable = [
        'id',
        'first_name',
        'last_name',
        'mobile_no',
        'name',
        'email',
        'email_verified_at',
        'roles.title',
        'locale',
        'status',
        'categories.categories_name',
    ];

    public function getIsAdminAttribute()
    {
        return $this->roles()->where('title', 'Admin')->exists();
    }

    public function scopeAdmins()
    {
        return $this->whereHas('roles', fn ($q) => $q->where('title', 'Admin'));
    }

    public function preferredLocale()
    {
        return $this->locale;
    }

    protected function serializeDate(DateTimeInterface $date)
    {
        return $date->format('Y-m-d H:i:s');
    }

    public function getEmailVerifiedAtAttribute($value)
    {
        return $value ? Carbon::createFromFormat('Y-m-d H:i:s', $value)->format(config('project.datetime_format')) : null;
    }

    public function setEmailVerifiedAtAttribute($value)
    {
        $this->attributes['email_verified_at'] = $value ? Carbon::createFromFormat(config('project.datetime_format'), $value)->format('Y-m-d H:i:s') : null;
    }

    public function setPasswordAttribute($input)
    {
        if ($input) {
            $this->attributes['password'] = Hash::needsRehash($input) ? Hash::make($input) : $input;
        }
    }

    public function roles()
    {
        return $this->belongsToMany(Role::class);
    }

    public function getStatusLabelAttribute($value)
    {
        return static::STATUS_RADIO[$this->status] ?? null;
    }

    public function categories()
    {
        return $this->belongsToMany(Category::class);
    }

    public function playlist()
    {
        return $this->belongsToMany(Playlist::class);
    }

    public function favoritelist()
    {
        return $this->belongsToMany(Favorite::class);
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

    public function AauthAcessToken(){
        return $this->hasMany('\App\Models\OauthAccessToken');
    }
}
