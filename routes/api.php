<?php
use App\Http\Controllers\Api\V1\Admin\ApiAuthController;

Route::group(['prefix' => 'v1', 'as' => 'api.'], function () { 
    Route::post('/registration', [ApiAuthController::class, 'register'])->name('registration.api');
    Route::post('password/forgot', [ApiAuthController::class, 'sendResetLinkEmail']);
    Route::post('password/reset', [ApiAuthController::class, 'reset']);
    Route::get('version-update', [ApiAuthController::class, 'version'])->name('version.api');
    Route::get('country', [ApiAuthController::class, 'getCountry'])->name('getCountry.api');
    Route::get('getCountryDetails', [ApiAuthController::class, 'getCountryDetails'])->name('getCountryDetails.api');
}); 
  
Route::group(['prefix' => 'v1', 'as' => 'api.', 'middleware' => ['auth:api']], function () {

    //Login & register, logout
    Route::post('/login', [ApiAuthController::class, 'login'])->name('login.api');
    Route::post('/register', [ApiAuthController::class, 'register'])->name('register.api');
    Route::post('/logout', [ApiAuthController::class, 'logout'])->name('logout.api');
    Route::get('/getUserDetails', [ApiAuthController::class, 'getUserDetails'])->name('getUserDetails.api');
    
    // Categories
    Route::get('/categories', [ApiAuthController::class, 'categories'])->name('categories.api');

    // groups
    Route::get('/groups', [ApiAuthController::class, 'groups'])->name('groups.api');
    Route::get('/categoryByAffermation', [ApiAuthController::class, 'categoryByAffermation'])->name('categoryByAffermation.api');

    // Affirmation
    Route::get('/affirmation', [ApiAuthController::class, 'affirmation'])->name('affirmation.api'); 
    Route::post('/createAffirmation', [ApiAuthController::class, 'createAffirmation'])->name('createAffirmation.api');

    // bgCategories
    Route::get('/bgCategories', [ApiAuthController::class, 'bgCategories'])->name('bgCategories.api');

    // bgSound
    Route::get('/bgSound', [ApiAuthController::class, 'bgSound'])->name('bgSound.api');

    // playlist 
    Route::get('/playList', [ApiAuthController::class, 'playList'])->name('playList.api');
    Route::get('/playListSearch', [ApiAuthController::class, 'playListSearch'])->name('playListSearch.api');
    
    //last sesseion api
    Route::get('/playList/LastSession', [ApiAuthController::class, 'playListLastSession'])->name('playListLastSession.api');
    Route::post('/playList/LastSessionUpdate', [ApiAuthController::class, 'playListLastSessionUpdate'])->name('playListLastSessionUpdate.api'); 
    
    //popular playlist
    Route::get('/playList/popularPlayList', [ApiAuthController::class, 'popularPlayList'])->name('popularPlayList.api');
    Route::post('/playList/populerPlayListUpdate', [ApiAuthController::class, 'populerPlayListUpdate'])->name('populerPlayListUpdate.api'); 


    Route::get('/playListDelete', [ApiAuthController::class, 'playListDelete'])->name('playListDelete.api');
    Route::post('/createPlayList', [ApiAuthController::class, 'createPlayList'])->name('createPlayList.api');
    Route::post('/updatePlayList', [ApiAuthController::class, 'updatePlayList'])->name('updatePlayList.api');

    //Play List Item
    Route::get('/playListItem', [ApiAuthController::class, 'playListItem'])->name('playListItem.api');
    Route::post('/createPlayListItem', [ApiAuthController::class, 'createPlayListItem'])->name('createPlayListItem.api');
    Route::post('/deletePlayListItem', [ApiAuthController::class, 'deletePlayListItem'])->name('deletePlayListItem.api');


    // favoritelist
    Route::get('/favoriteList', [ApiAuthController::class, 'favoriteList'])->name('favoriteList.api');
    Route::post('/createFavoriteList', [ApiAuthController::class, 'createFevoriteList'])->name('createFavoriteList.api');

    //like categories
    Route::get('/likeCategories', [ApiAuthController::class, 'likeCategories'])->name('likeCategories.api');
    Route::get('/unlikeCategories', [ApiAuthController::class, 'unlikeCategories'])->name('unlikeCategories.api');
    Route::get('/likeAffirmations', [ApiAuthController::class, 'likeAffirmations'])->name('likeAffirmations.api');
    Route::get('/unlikeAffirmations', [ApiAuthController::class, 'unlikeAffirmations'])->name('unlikeAffirmations.api');
    
    //Push Notification
    Route::get('/sendPushNotification', [ApiAuthController::class, 'sendPushNotification'])->name('sendPushNotification.api');
    
    //Schdule Api
    Route::post('/createReminder', [ApiAuthController::class, 'createReminder'])->name('createReminder.api');
    Route::get('/reminderList', [ApiAuthController::class, 'reminderList'])->name('reminderList.api');
    Route::get('/reminderDelete', [ApiAuthController::class, 'reminderDelete'])->name('reminderDelete.api');
    Route::get('/reminderCronJob', [ApiAuthController::class, 'reminderCronJob'])->name('reminderCronJob.api');

});