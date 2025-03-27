<?php

use App\Http\Controllers\Admin\AffirmationController;
use App\Http\Controllers\Admin\BgCategoryController;
use App\Http\Controllers\Admin\BgsoundController;
use App\Http\Controllers\Admin\CategoryController;
use App\Http\Controllers\Admin\GroupController;
use App\Http\Controllers\Admin\HomeController;
use App\Http\Controllers\Admin\PermissionController;
use App\Http\Controllers\Admin\RoleController;
use App\Http\Controllers\Admin\UserController;
use App\Http\Controllers\Admin\FavoriteController;
use App\Http\Controllers\Admin\PlaylistController;
use App\Http\Controllers\Admin\PlaylistItemController;
use App\Http\Controllers\Auth\UserProfileController;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\Route;

Route::redirect('/', '/login');
Auth::routes(['register' => false]);

Route::group(['prefix' => 'admin', 'as' => 'admin.', 'middleware' => ['auth']], function () {
    Route::get('/', [HomeController::class, 'index'])->name('home');

    // Permissions
    Route::resource('permissions', PermissionController::class, ['except' => ['store', 'update', 'destroy']]);

    // Roles
    Route::resource('roles', RoleController::class, ['except' => ['store', 'update', 'destroy']]);

    // Users
    Route::resource('users', UserController::class, ['except' => ['store', 'update', 'destroy']]);

    // Group
    Route::resource('groups', GroupController::class, ['except' => ['store', 'update', 'destroy']]);

    // Categories
    Route::post('categories/media', [CategoryController::class, 'storeMedia'])->name('categories.storeMedia');
    Route::resource('categories', CategoryController::class, ['except' => ['store', 'update', 'destroy']]);

    // Affirmations

    Route::post('affirmations/media', [AffirmationController::class, 'storeMedia'])->name('affirmations.storeMedia');
    Route::resource('affirmations', AffirmationController::class, ['except' => ['store', 'update', 'destroy']]);

    // Bg Categories
    Route::resource('bg-categories', BgCategoryController::class, ['except' => ['store', 'update', 'destroy']]);

   // Favorite
   Route::resource('favorites', FavoriteController::class, ['except' => ['store', 'update', 'destroy']]);

   // Playlist
   Route::resource('playlists', PlaylistController::class, ['except' => ['store', 'update', 'destroy']]);

   // Playlist Item
   Route::resource('playlist-items', PlaylistItemController::class, ['except' => ['store', 'update', 'destroy']]);
   
    // Bgsound
    Route::post('bgsounds/media', [BgsoundController::class, 'storeMedia'])->name('bgsounds.storeMedia');
    Route::resource('bgsounds', BgsoundController::class, ['except' => ['store', 'update', 'destroy']]);
});

Route::group(['prefix' => 'profile', 'as' => 'profile.', 'middleware' => ['auth']], function () {
    if (file_exists(app_path('Http/Controllers/Auth/UserProfileController.php'))) {
        Route::get('/', [UserProfileController::class, 'show'])->name('show');
    }
});
