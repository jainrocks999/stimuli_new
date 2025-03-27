<?php

namespace App\Http\Controllers\Api\V1\Admin;

use App\Http\Controllers\Controller;
use App\Http\Resources\Admin\InnertuneApiResource;
use App\Models\User;
use App\Models\Category;
use App\Models\Group;
use App\Models\Affirmation;
use App\Models\GroupCategories;
use App\Models\BgCategory;
use App\Models\Bgsound;
use App\Models\Favorite;
use App\Models\FavoriteAffirmation;
use App\Models\Playlist;
use App\Models\PlaylistItem; 
use App\Http\Controllers\Traits\MediaUploadTrait;
use Spatie\MediaLibrary\MediaCollections\Models\Media;
use Symfony\Component\HttpFoundation\Response;
use Illuminate\Support\Facades\Hash;
use Illuminate\Support\Facades\Validator;
use Illuminate\Support\Str;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\DB;
use Illuminate\Support\Facades\Password;
use Illuminate\Validation\ValidationException;
use Carbon\Carbon;




class ApiAuthController extends Controller
{
  use MediaUploadTrait;
  
        // Register
        public function register(Request $request) 
        {
            
            $validator = Validator::make($request->all(), [
                'name' => 'required|string|max:255',
                'email' => 'required|string|email|max:255|unique:users',
                'password' => 'required|string|min:6|confirmed',
            ]);
            if ($validator->fails()) {
                return response(['errors'=>$validator->errors()->all()], 422);
            }
            $request['password']= Hash::make($request['password']);
            $request['remember_token'] = Str::random(10);
            $user = User::create($request->toArray());
            $token = $user->createToken('Laravel Password Grant Client')->accessToken;
            $response = ['status'=>200,'token' => $token,'data'=>$user];
            return response($response, 200);
        }

        //login-Request
        public function login (Request $request) {
            $validator = Validator::make($request->all(), [
                'email' => 'required|string|email|max:255',
                'password' => 'required|string|min:6',
                'fcm_token' => 'required|string'
            ]);
            if ($validator->fails())
            {
                return response(['errors'=>$validator->errors()->all()], 422);
            }
            $user = User::where('email', $request->email)->first();
            if ($user) {
                if (Hash::check($request->password, $user->password)) {
                    
                    $userLogin = DB::table('userslogindevice')->where('user_id', $user->id)->where('fcm_token', 'LIKE', '%' . $request->post('fcm_token') . '%')->first();
                    if (empty($userLogin->fcm_token)) {
                        $param['user_id'] = $user->id;
                        $param['fcm_token'] = $request->post('fcm_token');
                        $param['created_at'] = date('Y-m-d H:i:s');
                        DB::table('userslogindevice')->insertGetId($param);
                    } else {
                        $param['fcm_token'] = $request->post('fcm_token');
                        $param['updated_at'] = date('Y-m-d H:i:s');
                        DB::table('userslogindevice')->where('id', $userLogin->id)->update($param);
                    }
                    
                    $result = $user->createToken('Laravel Password Grant Client')->accessToken;
                    $user->token =  $result;
                    $response = ['data'=>$user];
                    return response($response, 200);
                } else {
                    $response = ["message" => "Password mismatch"];
                    return response($response, 422);
                }
            } else {
                $response = ["message" =>'User does not exist'];
                return response($response, 422);
            }
        } 
        
        //Version Api
        public function version(Request $request){
            $data = ['ios_version' =>"1.0.0",
                    'android_version' =>"1.0.0",
                    'ios_url' =>"",
                    'android_url' =>"",
                    'message_heading' =>"A newer version of this app is available for download. Please update it.",
                    'ios_message' =>"A newer version of this app is available for download. Please update it from App Store!",
                    'android_message' =>"A newer version of this app is available for download. Please update it from PlayStore!",
                    'useractive' => '',
                    'is_optional' => 0
                    ];
            $response = ['success'=>true,'code'=>200,'data'=>$data,'message'=>'Version'];
            return $response;
        }
        
        //forget-password
        public function sendResetLinkEmail(Request $request)
        {
            $request->validate(['email' => 'required|email']);
            $status = Password::sendResetLink(
                $request->only('email')
            );
            return $status === Password::RESET_LINK_SENT
                        ? response()->json(['message' => __($status)], 200)
                        : response()->json(['email' => __($status)], 400);
        }
        
        //Reset-password
        public function reset(Request $request)
        {
            $request->validate([
                'token' => 'required',
                'email' => 'required|email',
                'password' => 'required|min:8|confirmed',
            ]);
            $status = Password::reset(
                $request->only('email', 'password', 'password_confirmation', 'token'),
                function ($user, $password) {
                    $user->forceFill([
                        'password' => Hash::make($password)
                    ])->save();
                    $user->setRememberToken(Str::random(60));
                }
            );
            return $status === Password::PASSWORD_RESET
                        ? response()->json(['message' => __($status)], 200)
                        : response()->json(['email' => [__($status)]], 400);
        }
        
        //Users Details Api
        public function getUserDetails(Request $request)
        {
            $validate = $this->validations($request,"stimuli_user_details");
            if($validate["error"]){
               return $this->prepareResult(false, [], $validate['errors'],"Error while validating user");
            }
            $countrys = DB::table('users')->where('id',$request->input('user_id'))->first();
            if($countrys){
                $response = $this->prepareResult(true, $countrys, [],"User details are fetched successfully..");
            }else{
                $response = $this->prepareResult(true, [], $countrys,"Error.");
            }
            return $response;
        }
    
        //logout Api
        public function logout(Request $request)
        {
            $user = User::where('email', $request->post('email'))->first();
            $token = $user->AauthAcessToken()->delete();
            if($token){
                $response = ['status'=>200, 'message' => 'You have been successfully logged out!'];
            }else{
                $response = ['status'=>401, 'error' => False,'message' => 'User is not logged In.'];
            }
            return response($response);
        }
        
        
        //Country Api
        public function getCountry(Request $request)
        {
            $countrys = DB::table('country')->get();
            if($countrys){
                $response = $this->prepareResult(true, new InnertuneApiResource($countrys), [],"All country are fetched successfully..");
            }else{
                $response = $this->prepareResult(true, [], new InnertuneApiResource($countrys),"Error.");
            }
            return $response;
        }
        
        //Country Details Api
        public function getCountryDetails(Request $request)
        {
            $validate = $this->validations($request,"stimuli_country_details");
            if($validate["error"]){
               return $this->prepareResult(false, [], $validate['errors'],"Error while validating user");
            }
            $countrys = DB::table('country')->where('id',$request->input('country_id'))->first();
            if($countrys){
                $response = $this->prepareResult(true, $countrys, [],"Country details are fetched successfully..");
            }else{
                $response = $this->prepareResult(true, [], $countrys,"Error.");
            }
            return $response;
        }
        
    
    
        //Categories
        public function categories(Request $request)
        {
            $validate = $this->validations($request,"stimuli_categories");
            if($validate["error"]){
               return $this->prepareResult(false, [], $validate['errors'],"Error while validating user");
            }
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
    
            if($categories){
                $response = $this->prepareResult(true, new InnertuneApiResource($categories), [],"All categories are fetched successfully..");
            }else{
                $response = $this->prepareResult(true, [], new InnertuneApiResource($categories),"Error.");
            }
            return $response;
        }
    
        // groups
        public function groups(Request $request)
        {
            $validate = $this->validations($request,"stimuli_groups");
            if($validate["error"]){
               return $this->prepareResult(false, [], $validate['errors'],"Error while validating user");
            }
            $groups = Group::with('category')->where('status', 1)->get();
            $groupCategories = new GroupCategories();
            $favCategories = $groupCategories->groupByCategories();
            $param = [];
            $gCategoryIds = [];
            if ($groups->isNotEmpty()) {
                foreach ($groups as $group) {
                    if ($group->category->isNotEmpty()) {
                        foreach ($group->category as $catval) {
                            $param = [];
                            if(!empty($catval->id)) {
                                $gCategoryIds[] = $catval->id;
                                if (!empty($favCategories)) {
                                    foreach ($favCategories as $favCategorie) {
                                        if (in_array($favCategorie->id, $gCategoryIds)) {
                                            $param[] = $favCategorie;
                                        }
                                    }
                                }
                            }
                        }
                        $group->groupByCategory = $param;
                    }else{
                        $group->groupByCategory = [];
                    }
                    unset($group->category);      
                }
            }
    
          
            if($groups){
                $response = $this->prepareResult(true, new InnertuneApiResource($groups), [],"All Groups are fetched successfully..");
            }else{
                $response = $this->prepareResult(true, [], new InnertuneApiResource($groups),"Error.");
            }
            return $response;
        }
        
       
        // Categories by affremation 
        public function categoryByAffermation(Request $request)
        {
            $validate = $this->validations($request,"stimuli_category_by_affermation");
            if($validate["error"]){
                return $this->prepareResult(false, [], $validate['errors'],"Error while validating user");
            }
            $favAffer =  new FavoriteAffirmation();
            $category =  $favAffer->categoryByAffermation($request->input('category_id'));   
            if($category){
                $response = $this->prepareResult(true, new InnertuneApiResource($category), [],"All Groups are fetched successfully..");
            }else{
                $response = $this->prepareResult(true, [], new InnertuneApiResource($category),"Error.");
            }
            return $response;
        }

      
        // affreamations
        public function affirmation(Request $request)
        {
            $validate = $this->validations($request,"stimuli_affirmation");
            if($validate["error"]){
               return $this->prepareResult(false, [], $validate['errors'],"Error while validating user");
            }
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
            if($affirmations){
                $response = $this->prepareResult(true, new InnertuneApiResource($affirmations), [],"All Affirmation are fetched successfully..");
            }else{
                $response = $this->prepareResult(true, [], new InnertuneApiResource($affirmations),"Error.");
            }
            return $response;
        }
        
        //create affreamations 
        public function createAffirmation(Request $request) 
        {
            $validate = $this->validations($request,"stimuli_store_Affirmation");
            if($validate["error"]){
               return $this->prepareResult(false, [], $validate['errors'],"Error while validating user");
            }
            $Affirmation = Affirmation::create($request->toArray());
            $Affirmations = $Affirmation->group()->sync($request->input('group_id'));
            $Affirmations = $Affirmation->category()->sync($request->input('category_id'));
            if($Affirmations){
                $response = $this->prepareResult(true, new InnertuneApiResource($Affirmations), [],"Affirmation are create successfully..");
            }else{
                $response = $this->prepareResult(true, [], new InnertuneApiResource($playlists),"Error.");
            }
            return $response;
        }  
    
        // bg categories
        public function bgCategories(Request $request)
        {
            $validate = $this->validations($request,"stimuli_bgcategories");
            if($validate["error"]){
               return $this->prepareResult(false, [], $validate['errors'],"Error while validating user");
            }
            $bgCategories = BgCategory::where('status',1)->get();
            if($bgCategories){
                $response = $this->prepareResult(true, new InnertuneApiResource($bgCategories), [],"All BgCategories are fetched successfully..");
            }else{
                $response = $this->prepareResult(true, [], new InnertuneApiResource($bgCategories),"Error.");
            }
            return $response;
        }
    
        // bg sounds
        public function bgSound(Request $request)
        {
            $validate = $this->validations($request,"stimuli_bgSound");
            if($validate["error"]){
               return $this->prepareResult(false, [], $validate['errors'],"Error while validating user");
            }
            $bgSounds = Bgsound::with(['media'])->where('status',1)->get();
            if($bgSounds){
                $response = $this->prepareResult(true, new InnertuneApiResource($bgSounds), [],"All bgSound are fetched successfully..");
            }else{
                $response = $this->prepareResult(true, [], new InnertuneApiResource($bgSounds),"Error.");
            }
            return $response;
        }
    
        // Get PlayList Api 
        public function playList(Request $request)
        {
            $validate = $this->validations($request,"stimuli_playlist");
            if($validate["error"]){
               return $this->prepareResult(false, [], $validate['errors'],"Error while validating user");
            }
            $playlist = User::with(['playlist','playlist.media'])->where('id',$request->get('user_id'))->get();
            if($playlist){
                $response = $this->prepareResult(true, new InnertuneApiResource($playlist), [],"All PlayList are fetched successfully.");
            }else{
                $response = $this->prepareResult(true, [], new InnertuneApiResource($playlist),"Error.");
            }
            return $response; 
        }

        //Add Playlist Api
        // public function createPlayList(Request $request) 
        // {
        //      $validate = $this->validations($request,"stimuli_store_playlist");
        //      if($validate["error"]){
        //         return $this->prepareResult(false, [], $validate['errors'],"Error while validating user");
        //      }
        //      $playlist = Playlist::create($request->toArray());
        //         if ($request->input('playlist_image', false)) { 
        //             $playlist->addMedia(storage_path('tmp/uploads/' . basename($request->input('playlist_image'))))->toMediaCollection('playlist_image');
        //         }
        //      $playlists = $playlist->user()->sync($request->input('user_id'));
             
        //      if($playlists){
        //          $response = $this->prepareResult(true, new InnertuneApiResource($playlist), [],"PlayList are create successfully..");
        //      }else{
        //          $response = $this->prepareResult(true, [], new InnertuneApiResource($playlist),"Error.");
        //      }
        //      return $response;
        //  }
        public function createPlayList(Request $request) 
        {
            
            // Validate the request
            $validate = $this->validations($request, "stimuli_store_playlist");
            if ($validate["error"]) {
                return $this->prepareResult(false, [], $validate['errors'], "Error while validating user");
            }
            
            
            // Create the playlist
            $playlist = Playlist::create($request->toArray());    
            $playlist->addMedia($request->file('image'))->toMediaCollection('playlist_images');
            
            // Sync user_id with the playlist
            $playlists = $playlist->user()->sync($request->input('user_id'));
            
            // Prepare response
            if ($playlists) {
                $response = $this->prepareResult(true, new InnertuneApiResource($playlist), [], "Playlist created successfully.");
            } else {
                $response = $this->prepareResult(true, [], new InnertuneApiResource($playlist), "Error.");
            }
            
            return $response;
        }

     

        //Update Playlist Api
        public function updatePlayList(Request $request) 
        {
            // Validate the request data
            $validate = $this->validations($request, "stimuli_update_playlist");
            if ($validate["error"]) {
                return $this->prepareResult(false, [], $validate['errors'], "Error while validating user");
            }
        
            // Find the playlist by ID
            $playlist = Playlist::find($request->input('playlist_id'));
            if (!$playlist) {
                return $this->prepareResult(false, [], ["Playlist not found"], "Error: Playlist not found");
            }
            
            if ($request->input('image', false)) {
                if (! $playlist->image || $request->input('image') !== $playlist->image->file_name) {
                    if ($playlist->image) {
                        $playlist->image->delete();
                    }
                    $playlist->addMedia(storage_path('tmp/uploads/' . basename($request->input('image'))))->toMediaCollection('playlist_images');
                }
            } elseif ($playlist->image) {
                $playlist->image->delete();
            }
            // Update the playlist with the request data
            $playlist->update($request->only(['title', 'description', 'status'])); // Add necessary fields
        
            // Sync the playlist with the user
            $playlist->user()->sync($request->input('user_id'));
        
            // Prepare and return the response
            return $this->prepareResult(true, new InnertuneApiResource($playlist), [], "Playlist updated successfully.");
        }

        // Get PlayList Remove Api 
        public function playListDelete(Request $request)
        {
            $validate = $this->validations($request,"stimuli_playlist_delete");
            if($validate["error"]){
            return $this->prepareResult(false, [], $validate['errors'],"Error while validating user");
            }
            $playlistItem = PlaylistItem::where('playlist_id',$request->get('playlist_id'))->get('id')->toArray();
            if(!empty($playlistItem) && isset($playlistItem)){
                PlaylistItem::whereIn('id', $playlistItem)->delete();
            }
            $playlist = Playlist::where('id',$request->get('playlist_id'))->delete();
            if($playlist){
                $response = $this->prepareResult(true, 200, [],"PlayList are delete successfully.");
            }else{
                $response = $this->prepareResult(false, 405,[], "Playlist already deleted successfully.");
            }
            return $response;
        }

        //Playlist search Api
        public function playListSearch(Request $request)
        {
            $validate = $this->validations($request, "stimuli_playlist_search");
            if ($validate["error"]) {
                return $this->prepareResult(false, [], $validate['errors'], "Error while validating user");
            }
        
            $searchText = $request->input('search_text');
            $searchType = $request->get('search_type');
            $user_id = $request->get('user_id');
            
            $playlists = collect();
            $categories = collect();
            $affirmations = collect();
            
            if ($searchType == 'playlist' || $searchType == 'All') {
                if (!empty($searchText)) {
                    $playlists = Playlist::where('title', 'LIKE', '%' . $searchText . '%')->get();
                }
            }
        
            if ($searchType == 'affirmation' || $searchType == 'All') {
                if (!empty($searchText)) {
                    $affirmations = Affirmation::with(['group', 'media'])
                        ->where('status', 1)
                        ->where('affirmation_text', 'LIKE', '%' . $searchText . '%')
                        ->get();
                    
                    $favAffirmations = DB::table('affirmation_favorite')->get();
                    foreach ($affirmations as $affirmation) {
                        $fav = $favAffirmations->firstWhere('affirmation_id', $affirmation->id);
                        if ($fav) {
                            $affirmation->is_favorite = true;
                            $affirmation->favorite_id = $fav->favorite_id;
                        } else {
                            $affirmation->is_favorite = false;
                            $affirmation->favorite_id = null;
                        }
                    }
                }
            }
        
            if ($searchType == 'All' || (!empty($searchText) && $searchType == 'playlist')) {
                $categories = Category::where('categories_name', 'LIKE', '%' . $searchText . '%')
                    ->where('status', 1)
                    ->get();
        
                $favCategories = DB::table('category_favorite')->get();
                foreach ($categories as $category) {
                    $fav = $favCategories->firstWhere('category_id', $category->id);
                    if ($fav) {
                        $category->is_favorite = true;
                        $category->favorite_id = $fav->favorite_id;
                    } else {
                        $category->is_favorite = false;
                        $category->favorite_id = null;
                    }
                }
            }
            
            $responseParams = [
                'playlists' => $playlists,
                'categories' => $categories,
                'affirmations' => $affirmations,
            ];
            
            $message = "Search results found successfully.";
            if ($searchType == 'playlist' && $playlists->isEmpty()) {
                $message = "No playlists found matching the search criteria.";
            } elseif ($searchType == 'affirmation' && $affirmations->isEmpty()) {
                $message = "No affirmations found matching the search criteria.";
            } elseif ($searchType == 'All' && $playlists->isEmpty() && $categories->isEmpty() && $affirmations->isEmpty()) {
                $message = "No results found matching the search criteria.";
            }
            
            $status = !empty($playlists) || !empty($categories) || !empty($affirmations);
            return $this->prepareResult($status, new InnertuneApiResource($responseParams), [], $message);
        }
    
    
        //last session updated code 
        public function playListLastSession(Request $request)
        {
            $validate = $this->validations($request, "stimuli_playlist_lastsession");
            if ($validate["error"]) {
                return $this->prepareResult(false, [], $validate['errors'], "Error while validating user");
            }
            $lastsessions = DB::table('last_session')->where('user_id', $request->get('user_id'))->orderBy('id', 'DESC')->get();
            if(!empty($lastsessions)){
                foreach($lastsessions as $lastsession){
                    $favAffer =  new FavoriteAffirmation();
                    $category =  $favAffer->categoryByAffermation($lastsession->category_id);   
                    $lastsession->categories[] =  $category;  
                }
                
            }
            if ($lastsessions) {
                $response = $this->prepareResult(true, new InnertuneApiResource($lastsessions), [], "Last session update successfully.");
            } else {
                $response = $this->prepareResult(false, 404, [], "Playlist not found.");
            }
            return $response;
        }
    
        //last session craeted/updated code 
        public function playListLastSessionUpdate(Request $request)
        {
            $validate = $this->validations($request, "stimuli_playlist_lastsession_update"); 
            if ($validate["error"]) {
                return $this->prepareResult(false, [], $validate['errors'], "Error while validating user");
            }
            
            $lastsession = $cateoryCheck =  DB::table('last_session')->where('user_id', $request->get('user_id'))->where('category_id', $request->get('category_id'))->first();
            $param = [];
            $param['user_id'] = $request->post('user_id');
            $param['category_id'] = $request->post('category_id');
            $param['date'] = date('Y-m-d');
            $param['time'] = date('H:i:s');
            
            $last_session_id = 0;
            if($last_session_id != 0){
                $param['updated_at'] = date('Y-m-d H:i:s');
            }else{
                $param['created_at'] = date('Y-m-d H:i:s');
            }
            
            if ($lastsession === null && $last_session_id == 0) {   
                $lastsession = DB::table('last_session')->where('user_id', $request->get('user_id'))->count();
                if($lastsession < 6){
                    $lastSessionUpdated = DB::table('last_session')->insert($param);
                }else{
                    $lastsession = DB::table('last_session')
                                    ->where('user_id', $request->get('user_id'))
                                    ->orderBy('id', 'ASC')
                                    ->first();
                    if(empty($cateoryCheck->category_id)){                
                        DB::table('last_session')->where('id', $lastsession->id)->delete();
                        $lastSessionUpdated = DB::table('last_session')->insert($param);
                    }
                }
            } else {
                    
                    $lastsession = DB::table('last_session')
                                    ->where('user_id', $request->get('user_id'))
                                    ->where('category_id', $request->get('category_id'))
                                    ->orderBy('id', 'ASC')
                                    ->first();
                                    
                    DB::table('last_session')->where('id', $lastsession->id)->delete();
                    $lastSessionUpdated = DB::table('last_session')->insert($param);
            }
            if ($lastSessionUpdated) {
                $response = $this->prepareResult(true, 200, [], "Last session update playlist successfully.");
            } else {
                $response = $this->prepareResult(false, 404, [], "Playlist not found.");
            }
            return $response;
        }
    
    
        // popular playlist Api
        public function popularPlayList(Request $request){
            
             $validate = $this->validations($request, "stimuli_playlist_popular"); 
            if ($validate["error"]) {
                return $this->prepareResult(false, [], $validate['errors'], "Error while validating user");
            }
            $popularPlayLists = DB::table('popular_playlist')->where('user_id', $request->get('user_id'))->orderBy('countdown','DESC')->get();
            if(!empty($popularPlayLists)){
                foreach($popularPlayLists as $popularPlayList){
                    $favAffer =  new FavoriteAffirmation();
                    $category =  $favAffer->categoryByAffermation($popularPlayList->playlist_id);   
                    $popularPlayList->categories[] =  $category;   
                }
            }
            
            if ($popularPlayLists) { 
                $response = $this->prepareResult(true, new InnertuneApiResource($popularPlayLists), [], "Last session update successfully.");
            } else { 
                $response = $this->prepareResult(false, 404, [], "Playlist not found.");
            }
            return $response;
        }
        
        
        // popular playlist Update Api
        public function populerPlayListUpdate(Request $request) 
        {
            $validate = $this->validations($request, "stimuli_playlist_popular_update"); 
            if ($validate["error"]) {
                return $this->prepareResult(false, [], $validate['errors'], "Error while validating user");
            }
            $param = [];
            $count = 1;
            if(!empty($request->get('playlist_id'))){
                $lastsession = $cateoryCheck =  DB::table('popular_playlist')->where('user_id', $request->get('user_id'))->where('playlist_id', $request->get('playlist_id'))->first();
                $param['user_id'] = $request->post('user_id');
                $param['playlist_id'] = $request->post('playlist_id');
                if(isset($lastsession) && !empty($lastsession)){
                    $param['affirmation_id'] = 0;
                    $param['countdown'] = $count + $lastsession->countdown;    
                    $param['updated_at'] = date('Y-m-d H:i:s');
                    $lastSessionUpdated = DB::table('popular_playlist')->where('user_id', $request->get('user_id'))->where('playlist_id', $request->get('playlist_id'))->update($param);
                }else{
                    $param['affirmation_id'] = 0;
                    $param['countdown'] = $count;  
                    $param['created_at'] = date('Y-m-d H:i:s');
                    $lastSessionUpdated = DB::table('popular_playlist')->insert($param);
                }   
            }
            
            $param = [];
            $count = 1;
            if(!empty($request->get('affirmation_id'))){
                $lastsession = $cateoryCheck =  DB::table('popular_playlist')->where('user_id', $request->get('user_id'))->where('affirmation_id', $request->get('affirmation_id'))->first();
                $param['user_id'] = $request->post('user_id');
                $param['affirmation_id'] = $request->post('affirmation_id');
                if(isset($lastsession) && !empty($lastsession)){
                    $param['playlist_id'] = 0;
                    $param['countdown'] = $count + $lastsession->countdown;    
                    $param['updated_at'] = date('Y-m-d H:i:s');
                    $lastSessionUpdated = DB::table('popular_playlist')->where('user_id', $request->get('user_id'))->where('affirmation_id', $request->get('affirmation_id'))->update($param);
                }else{
                    $param['playlist_id'] = 0;
                    $param['countdown'] = $count;  
                    $param['created_at'] = date('Y-m-d H:i:s');
                    $lastSessionUpdated = DB::table('popular_playlist')->insert($param);
                }   
            }
            
            if ($lastSessionUpdated) {
                $response = $this->prepareResult(true, 200, [], "Last session update playlist successfully.");
            } else {
                $response = $this->prepareResult(false, 404, [], "Playlist not found.");
            }
            return $response;
        }
    


        // Get PlayList Item Api 
        public function playListItem(Request $request)
        {
            $validate = $this->validations($request,"stimuli_playlist_item");
            if($validate["error"]){
                return $this->prepareResult(false, [], $validate['errors'],"Error while validating user");
            }
            $playlistAfferimations = PlaylistItem::where('playlist_id',$request->get('playlist_id'))->pluck('affirmation_id')->toArray();
            
            $afferimationDatas = [];
            if(!empty($playlistAfferimations)){
                foreach($playlistAfferimations as $playlistAfferimation){
                    $affirmation = Affirmation::with('media')->where('status', 1)->where('id', $playlistAfferimation)->distinct()->first();
                    $afferimationDatas[] = $affirmation; 
                }
            }
            
            $favAffirmations = DB::table('affirmation_favorite')->distinct()->get()->toArray();
            if(!empty($afferimationDatas)){
                foreach($afferimationDatas as $affirmation){
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
            if($afferimationDatas){
                $response = $this->prepareResult(true, new InnertuneApiResource($afferimationDatas), [],"All play-lists item are fetched successfully.");
            }else{
                $response = $this->prepareResult(true, [], [],"Error.");
            }
            return $response;
        }
  
   
        //Add Playlist Item Api
        public function createPlayListItem(Request $request) 
        {
            $validate = $this->validations($request,"stimuli_store_playlist_item");
            if($validate["error"]){
               return $this->prepareResult(false, [], $validate['errors'],"Error while validating user");
            }
            $affirmationIds = $request->post('affirmation_id');
            if (!is_array($affirmationIds)) {
                return $this->prepareResult(false, [], ['affirmation_id' => 'Affirmation IDs should be an array'], "Validation Error");
            }
            if(!empty($request->post('affirmation_id'))){
                foreach($request->post('affirmation_id') as $val){
                    $param = [];
                    $param['playlist_id'] = $request->post('playlist_id');
                    $param['category_id'] = 0;
                    $param['affirmation_id'] = $val;
                    $param['created_at'] = date('Y-m-d H:i:s');
                    $playlistitem = PlaylistItem::create($param);
                }
                $results = $playlistitem;
            }
            if($results){
                $response = $this->prepareResult(true, new InnertuneApiResource($results), [],"Play-lists item are create successfully..");
            }else{
                $response = $this->prepareResult(true, [], new InnertuneApiResource($results),"Error.");
            }
            return $response;
        }
    
        //deletePlaylistItem
        public function deletePlayListItem(Request $request) 
        {
            // Validate the request data
            $validate = $this->validations($request, "stimuli_delete_playlist_item");
            if ($validate["error"]) {
                return $this->prepareResult(false, [], $validate['errors'], "Error while validating user");
            }
        
            $affirmationIds = $request->post('affirmation_id');
            if (!is_array($affirmationIds)) {
                return $this->prepareResult(false, [], ['affirmation_id' => 'Affirmation IDs should be an array'], "Validation Error");
            }
            
            // echo $request->post('playlist_id');
            // die();
            
            // Check if the playlist exists
            $playlistId = $request->post('playlist_id');
            $playlist = Playlist::find($playlistId);
            if (!$playlist) {
                return $this->prepareResult(false, [], ['playlist_id' => 'Playlist not found'], "Error: Playlist not found");
            }
        
            // Delete the specified playlist items
            $deletedItems = PlaylistItem::where('playlist_id', $playlistId)->delete();
            
            if($deletedItems) {
                if(!empty($request->post('affirmation_id'))){
                    foreach($request->post('affirmation_id') as $val){
                        $param = [];
                        $param['playlist_id'] = $request->post('playlist_id');
                        $param['category_id'] = 0;
                        $param['affirmation_id'] = $val;
                        $param['created_at'] = date('Y-m-d H:i:s');
                        $playlistitem = PlaylistItem::create($param);
                    }
                    $results = $playlistitem;
                }
            }
        
            // Prepare and return the response
            if ($results) {
                $response = $this->prepareResult(true, [], [], "Playlist items updated successfully.");
            } else {
                $response = $this->prepareResult(false, [], [], "Error: No playlist items were updated.");
            }
            
            return $response;
        }
        
        
    
        //Add FevoriteList categories & Affermation 
        public function createFevoriteList(Request $request) 
        {
            $validate = $this->validations($request,"stimuli_store_fevoritelist");
            if($validate["error"]){
            return $this->prepareResult(false, [], $validate['errors'],"Error while validating user");
            }
            
            $favUsers = DB::table('favorite_user')->where('user_id',$request->input('user_id'))->first();
            if(!empty($favUsers->favorite_id) && isset($favUsers->favorite_id)){
                $favorite = Favorite::where('id', $favUsers->favorite_id)->first();
                $favoriteId =  $favUsers->favorite_id;
            }else{
                $favorite = new Favorite();
                $favorite->save();        
                $favorite->user()->sync($request->input('user_id'));
                $favoriteId =  $favorite->id;
            }
            
            $param = [];
            $param['favroitlist'] = $favorite;
            if(!empty($request->input('affirmation_id'))){
                $favAffirmations = DB::table('affirmation_favorite')->where('favorite_id',$favoriteId)->where('affirmation_id',$request->input('affirmation_id'))->first();
                  if(!$favAffirmations){
                   $favorite->affirmation()->sync($request->input('affirmation_id'));
                  }else{
                    $param['affermation'] = ['status'=>false,'error'=>"affrimation already add in favroite-list."];
                  }
            }
            if(!empty($request->input('category_id'))){
                  $favCategories = DB::table('category_favorite')->where('favorite_id',$favoriteId)->where('category_id',$request->input('category_id'))->first();
                  if(!$favCategories){
                    $favorite->categories()->sync($request->input('category_id'));
                  }else{
                    $param['categories'] = ['status'=>false,'error'=>"categires already add in favroite-list."];
                  }
            }
            if($favorite){
                $response = $this->prepareResult(true, new InnertuneApiResource($param), [],"favorite-list are create successfully..");
            }else{
                $response = $this->prepareResult(true, [], new InnertuneApiResource($favorite),"Error.");
            }
            return $response;
        }
        
        // Get favoriteList Api 
        public function favoriteList(Request $request)
        {
            $validate = $this->validations($request,"stimuli_favoritelist");
            if($validate["error"]){
                return $this->prepareResult(false, [], $validate['errors'],"Error while validating user");
            }
            $favoritelist = User::with(['favoritelist','favoritelist.categories','favoritelist.affirmation'])->where('id',$request->get('user_id'))->get();
            if($favoritelist){
                $response = $this->prepareResult(true, new InnertuneApiResource($favoritelist), [],"All favorite list are fetched successfully..");
            }else{
                $response = $this->prepareResult(true, [], new InnertuneApiResource($favoritelist),"Error.");
            }
            return $response;
        }
    
        // Get favoriteList likeCategories
        public function likeCategories(Request $request)
        {
            $validate = $this->validations($request,"stimuli_likeCategories");
            if($validate["error"]){
               return $this->prepareResult(false, [], $validate['errors'],"Error while validating user");
            }
            $categories = Category::where('status',1)->distinct()->get();
            $favCategories = DB::table('category_favorite')->distinct()->get();
            $likeCategories = [];
            if(!empty($categories)){
                foreach($categories as $categorie){
                    if(!empty($favCategories)){
                        foreach($favCategories as $favCategorie){
                            if($favCategorie->category_id == $categorie->id){
                                $favAffer =  new FavoriteAffirmation();
                                $category =  $favAffer->categoryByAffermation($categorie->id);
                                $category->is_favorite = true;
                                $category->favorite_id = $favCategorie->favorite_id;
                                $likeCategories[] = $category;
                            }
                        }
                    }
                }
            }
    
            if($likeCategories){
                $response = $this->prepareResult(true, new InnertuneApiResource($likeCategories), [],"All categories are fetched successfully..");
            }else{
                $response = $this->prepareResult(true, [], [],"Error.");
            }
            return $response;
        }
    
        //Rmove favoriteList likeCategories
        public function unlikeCategories(Request $request)
        {
            $validate = $this->validations($request,"stimuli_unlikeCategories");
            if($validate["error"]){
            return $this->prepareResult(false, [], $validate['errors'],"Error while validating user");
            }
    
            // Multiple delete
            // $unlikeCategories = Favorite::with('categories')->where('id', $request->input('favorite_id'))->pluck('id')->toArray();  
            //$results = DB::table('category_favorite')->whereIn('favorite_id', $favoriteIds)->whereIn('category_id', $categoryIds)->delete();
            $error = [];
            $userIds =  $request->input('user_id');
            $favoriteIds =  $request->input('favorite_id');
            $categoryIds =  $request->input('category_id');
            $users = DB::table('favorite_user')->where('user_id', $userIds)->pluck('favorite_id')->toArray();
            $results = false;
            if(!empty($users)){
                if(in_array($favoriteIds, $users)){
                    $results = DB::table('category_favorite')->where('favorite_id', $favoriteIds)->where('category_id', $categoryIds)->delete();
                    if($results){
                        $response = ['status'=>true,'msg'=>'categories are remove favorite list successfully..'];
                    }else{
                        $error = ['status'=>false,'msg'=>'database record error.'];
                    }
                }else{
                    $error = ['status'=>false,'msg'=>'favroite list not exist'];    
                }
            }else{
                $error = ['status'=>false,'msg'=>'user not exist'];
            }
            if($results){
                $response = $this->prepareResult(true, '', [],"categories are remove favorite list successfully..");
            }else{
                $response = $this->prepareResult(true, [], $error,'Error');
            }
            return $response;
        }
        
        // Get favoriteList likeAffermation
        public function likeAffirmations(Request $request)
        {
            $validate = $this->validations($request,"stimuli_likeaffirmation");
            if($validate["error"]){
            return $this->prepareResult(false, [], $validate['errors'],"Error while validating user");
            }
            $affirmations = Affirmation::with(['group', 'media'])->where('status', 1)->distinct()->get();
            $favAffirmations = DB::table('affirmation_favorite')->distinct()->get();
            $likeAffirmations = [];
            if(!empty($affirmations)){
                foreach($affirmations as $affirmation){
                    $affirmation->is_favorite = false;
                    if(!empty($favAffirmations)){
                        foreach($favAffirmations as $favAffirmation){
                            if($favAffirmation->affirmation_id == $affirmation->id){
                                $affirmation->is_favorite = true;
                                $affirmation->favorite_id = $favAffirmation->favorite_id;
                                $likeAffirmations[] = $affirmation;
                            }
                        }
                    }
                }
            }
            if($likeAffirmations){
                $response = $this->prepareResult(true, new InnertuneApiResource($likeAffirmations), [],"All Affirmation are fetched successfully..");
            }else{
                $response = $this->prepareResult(true, [], [],"Error.");
            }
            return $response;
        }
        
        //Rmove favoriteList likeCategories
        public function unlikeAffirmations(Request $request)
        {
           $validate = $this->validations($request,"stimuli_unlikeaffirmation");
           if($validate["error"]){
           return $this->prepareResult(false, [], $validate['errors'],"Error while validating user");
           }
           // Multiple delete
           // $unlikeCategories = Favorite::with('categories')->where('id', $request->input('favorite_id'))->pluck('id')->toArray();  
           //$results = DB::table('category_favorite')->whereIn('favorite_id', $favoriteIds)->whereIn('category_id', $categoryIds)->delete();
           $error = [];
           $userIds =  $request->input('user_id');
           $favoriteIds =  $request->input('favorite_id');
           $affirmationIds =  $request->input('affirmation_id');
           $users = DB::table('favorite_user')->where('user_id', $userIds)->pluck('favorite_id')->toArray();
           $results = false;
           if(!empty($users)){
               if(in_array($favoriteIds, $users)){
                   $results = DB::table('affirmation_favorite')->where('favorite_id', $favoriteIds)->where('affirmation_id', $affirmationIds)->delete();
                   if($results){
                       $response = ['status'=>true,'msg'=>'affirmation are remove favorite list successfully..'];
                   }else{
                       $error = ['status'=>false,'msg'=>'database record error.'];
                   }
               }else{
                   $error = ['status'=>false,'msg'=>'favroite list not exist'];    
               }
           }else{
               $error = ['status'=>false,'msg'=>'user not exist'];
           }
           if($results){
               $response = $this->prepareResult(true, '', [],"affirmation are remove favorite list successfully..");
           }else{
               $response = $this->prepareResult(true, [], $error,'Error');
           }
           return $response;
       }
       
        //Send push notification 
        public function sendPushNotification(Request $request)
        {
            $validate = $this->validations($request,"stimuli_push_notification");
            if($validate["error"]){
                return $this->prepareResult(false, [], $validate['errors'],"Error while validating user");
            }
            
            $serverKey = env('SERVER_KEY');
          
            // if(is_array($params)){
            //     $dataTwo = [
            //         'id' => $params['sender_id'],
            //         'SupplierName'=> $params['SupplierName'],
            //     ];  
            // }else{
            //     $dataTwo = ['id' => $params];
            // }
             
            $dataTwo = ['status' => 1];
            $title = 'Testing Reminder';
            $msg = 'Testing Reminder working now.';
            $fcmToken = $request->input('fcm_token');
             
             
            // Set the data payload
            $data = [
                'title' => $title,
                'body' => $msg,
            ];  
            
            
            // Set the cURL request headers
            $headers = [
                'Authorization: key=' . $serverKey, 
                'Content-Type: application/json',
            ]; 
        
            // Set the notification payload
            $payload = [
                'to' => $fcmToken,
                'notification' => $data, // Use 'data' instead of 'notification'
                'data' => $dataTwo
            ];  
        
            // Initialize cURL
            $ch = curl_init(); 
            curl_setopt($ch, CURLOPT_URL, 'https://fcm.googleapis.com/fcm/send');
            curl_setopt($ch, CURLOPT_POST, true);
            curl_setopt($ch, CURLOPT_HTTPHEADER, $headers);
            curl_setopt($ch, CURLOPT_RETURNTRANSFER, true);
            curl_setopt($ch, CURLOPT_SSL_VERIFYPEER, false);
            curl_setopt($ch, CURLOPT_POSTFIELDS, json_encode($payload));
            $result = curl_exec($ch);
            curl_close($ch);
        
            if ($result === false) {
                $error = curl_error($ch);
                return $result;
            } else {
                return $result;
            }
        }

        //Riminder create 
        public function createReminder(Request $request) 
        {
            $validate = $this->validations($request,"stimuli_create_reminder");
            if($validate["error"]){
                return $this->prepareResult(false, [], $validate['errors'],"Error while validating user");
            }
            
            // Convert times to GMT if provided
            // $gmtStartTime = null;
            // if (!empty($request->post('start_at'))) {

            //     // $inputTime = Carbon::parse($request->post('start_at'));
            //     // $gmtStartTime = $inputTime->setTimezone('Asia/Kolkata')->toDateTimeString();
            // }
            
            $gmtEndTime = null;
            if (!empty($request->post('end_at'))) {
                $inputTime = Carbon::parse($request->post('end_at'));
                $gmtEndTime = $inputTime->setTimezone('GMT')->toDateTimeString();
            }
    
            // Prepare the parameters
            $params = [
                'user_id' => $request->post('user_id'),
                'affirmation_id' => $request->post('affirmation_id') ?? 0,
                'playlist_id' => $request->post('playlist_id') ?? 0,
                'start_at' =>  $request->post('start_at') ?? 0,
                'end_at' => $gmtEndTime,
                'r_status' => $request->post('r_status') ?? 1,
                'mon' => $request->post('mon') ?? false,
                'tues' => $request->post('tues') ?? false,
                'wed' => $request->post('wed') ?? false,
                'thurs' => $request->post('thurs') ?? false,    
                'fri' => $request->post('fri') ?? false,
                'sat' => $request->post('sat') ?? false,
                'sun' => $request->post('sun') ?? false,
                'created_at' => now(),
            ];
    
            // Insert or update the schedule
            if (empty($request->post('reminder_id')) || $request->post('reminder_id') == 0) {
                $results = DB::table('schedule')->insert($params);
                $msg = "User reminder created successfully.";
            } else {
                $results = DB::table('schedule')->where('id', $request->post('reminder_id'))->update($params);
                $msg = "User reminder updated successfully.";
            }
            
           if($results){
               $response = $this->prepareResult(true, $results, [],$msg); 
           }else{
               $response = $this->prepareResult(true, [], $results,'Error');
           }
           return $response;
        }
        
        
        //Reminder List
        public function reminderList(Request $request)
        {
            $validate = $this->validations($request,"stimuli_reminderlist");
            if($validate["error"]){
                return $this->prepareResult(false, [], $validate['errors'],"Error while validating user");
            }
            $reminderlist = DB::table('schedule')->where('user_id',$request->get('user_id'))->get();
            if($reminderlist){
                $response = $this->prepareResult(true, new InnertuneApiResource($reminderlist), [],"User reminder list are fetched successfully..");
            }else{
                $response = $this->prepareResult(true, [], new InnertuneApiResource($reminderlist),"Error.");
            }
            return $response;
        }
        
        
         //Reminder List
        public function reminderDelete(Request $request)
        {
            $validate = $this->validations($request,"stimuli_reminderdelete");
            if($validate["error"]){
                return $this->prepareResult(false, [], $validate['errors'],"Error while validating user");
            }
            $reminderlist = DB::table('schedule')->where('id',$request->get('reminder_id'))->where('user_id',$request->get('user_id'))->delete();
            if($reminderlist){
                $response = $this->prepareResult(true, $reminderlist, [],"User reminder delete successfully..");
            }else{
                $response = $this->prepareResult(true, [], $reminderlist,"Error.");
            }
            return $response;
        }
        
        
        public function reminderCronJob(Request $request)
        {
            $validate = $this->validations($request,"stimuli_reminder_cronjob");
            if($validate["error"]){
                return $this->prepareResult(false, [], $validate['errors'],"Error while validating user");
            }
            
            $currentDayShortName = strtolower(Carbon::now()->format('D'));
            $reminderlists = DB::table('schedule')->where('user_id',$request->get('user_id'))->where($currentDayShortName,1)->where('r_status',1)->get();
            
            $status = false;
            if(!empty($reminderlists)){
                foreach($reminderlists as $reminderlist){
                    
                    $time2 = $reminderlist->start_at;
                    $time1 = date('H:i:s');
                    
                    list($hours, $minutes) = explode(':', $time1);
                    $firstTimestamp = mktime($hours, $minutes);
                    
                    list($hours, $minutes) = explode(':', $time2);
                    $secondTimestamp = mktime($hours, $minutes);
                    
                    $seconds =  $secondTimestamp - $firstTimestamp;
                    
                    $seconds<0?$seconds+=24*60*60:"";
                    
                    $minutes = ($seconds / 60) % 60;
                    $hours = floor($seconds / (60 * 60));
                    $totalTime = $hours.":".$minutes;
                    
                    $userslogindevices = DB::table('userslogindevice')->where('user_id',$request->get('user_id'))->get();
                    $users = DB::table('users')->where('id',$request->get('user_id'))->first();
                    
                    if($totalTime == '0:0'){
                        $data = ['name'=>$users->name];
                        if(!empty($userslogindevices)){
                            foreach($userslogindevices as $userslogindevice){
                                $fcm_token = $userslogindevice->fcm_token;
                                $responseData = $this->sendPushNotificationApp($fcm_token,$data);
                                $responseDatas = json_decode($responseData);
                                $paramTwo = [
                                            'user_id'=>$request->get('user_id'),
                                            'user_name'=>$users->name,
                                            'date_time'=>$time2,
                                            'status'=>$responseDatas->success,
                                            'response'=>$responseData,
                                            'created_at'=>date('Y-m-d H:i:s')
                                            ];
                                $response = DB::table('log')->insert($paramTwo);
                            }
                        }
                        $response = ['status'=>true,'Msg'=>'Notification send succsesfully..'];
                    }else{
                        $response = ['error'=>false,'Msg'=>"something went to wrong."];
                    }                   
                }
            }else{
                $response = $this->prepareResult(true, [], [],"Reminder is not available.");
            }
          
            if($response){
                $response = $this->prepareResult(true, new InnertuneApiResource($response), [],"");
            }else{
                $response = $this->prepareResult(true, [], new InnertuneApiResource($response),"");
            }
            return $response;
        }
        
        
         //Send push notification 
        public function sendPushNotificationApp($fcm_token,$data)
        {
                  
            $serverKey = env('SERVER_KEY');
            // if(is_array($params)){
            //     $dataTwo = [
            //         'id' => $params['sender_id'],
            //         'SupplierName'=> $params['SupplierName'],
            //     ];  
            // }else{
            //     $dataTwo = ['id' => $params];
            // }
             
            $dataTwo = ['status' => 1];
            $title = 'Testing Reminder';
            $msg = 'Testing Reminder working now.';
            $fcmToken = $fcm_token;
             
             
            // Set the data payload
            $data = [
                'title' => $title,
                'body' => $msg,
            ];  
            
            
            // Set the cURL request headers
            $headers = [
                'Authorization: key=' . $serverKey, 
                'Content-Type: application/json',
            ]; 
        
            // Set the notification payload
            $payload = [
                'to' => $fcmToken,
                'notification' => $data, // Use 'data' instead of 'notification'
                'data' => $dataTwo
            ];  
        
            // Initialize cURL
            $ch = curl_init(); 
            curl_setopt($ch, CURLOPT_URL, 'https://fcm.googleapis.com/fcm/send');
            curl_setopt($ch, CURLOPT_POST, true);
            curl_setopt($ch, CURLOPT_HTTPHEADER, $headers);
            curl_setopt($ch, CURLOPT_RETURNTRANSFER, true);
            curl_setopt($ch, CURLOPT_SSL_VERIFYPEER, false);
            curl_setopt($ch, CURLOPT_POSTFIELDS, json_encode($payload));
            $result = curl_exec($ch);
            curl_close($ch);
        
            if ($result === false) {
                $error = curl_error($ch);
                return $result;
            } else {
                return $result;
            }
        }
        
        
        // response msg format
        private function prepareResult($status, $data, $errors, $msg)
        {
            return ['status' => $status,'data'=> $data,'message' => $msg,'errors' => $errors];
        }

        // Validation for all Method
        private function validations($request,$type)    
        {
            $errors = [];
            $error = false;
            if($type == "stimuli_categories"){
                $validator = Validator::make($request->all(),[
                'user_id' => 'required'
                ]);
                if($validator->fails()){
                    $error = true;
                    $errors = $validator->errors();
                }
            }else if($type == "stimuli_groups"){
                $validator = Validator::make($request->all(),[
                'user_id' => 'required'
                ]);
                if($validator->fails()){
                    $error = true;
                    $errors = $validator->errors();
                }
            }else if($type == "stimuli_user_details"){
                $validator = Validator::make($request->all(),[
                'user_id' => 'required'
                ]);
                if($validator->fails()){
                    $error = true;
                    $errors = $validator->errors();
                }
            }else if($type == "stimuli_country_details"){
                $validator = Validator::make($request->all(),[
                'country_id' => 'required'
                ]);
                if($validator->fails()){
                    $error = true;
                    $errors = $validator->errors();
                }
            }else if($type == "stimuli_category_by_affermation"){
                $validator = Validator::make($request->all(),[
                'user_id' => 'required',
                'category_id' => 'required'
                ]);
                if($validator->fails()){
                    $error = true;
                    $errors = $validator->errors();
                }
            }else if($type == "stimuli_affirmation"){
                $validator = Validator::make($request->all(),[
                'user_id' => 'required'
                ]);
                if($validator->fails()){
                    $error = true;
                    $errors = $validator->errors();
                }
            }else if($type == "stimuli_store_affirmation"){
                $validator = Validator::make($request->all(),[
                    'affirmation_text' => 'required',
                    'voice_one' => 'required',
                    'voice_two' => 'required',
                    'voice_three' => 'required',
                    'voice_four' => 'required',
                    'status' => 'required',
                    'group_id' => 'required',
                    'category_id' => 'required',
                ]);
                if($validator->fails()){
                    $error = true;
                    $errors = $validator->errors();
                }
            }else if($type == "stimuli_bgcategories"){
                $validator = Validator::make($request->all(),[
                'user_id' => 'required'
                ]);
                if($validator->fails()){
                    $error = true;
                    $errors = $validator->errors();
                }
            }else if($type == "stimuli_bgSound"){
                $validator = Validator::make($request->all(),[
                'user_id' => 'required'
                ]);
                if($validator->fails()){
                    $error = true;
                    $errors = $validator->errors();
                }
            }else if($type == "stimuli_playlist"){
                $validator = Validator::make($request->all(),[
                'user_id' => 'required'
                ]);
                if($validator->fails()){
                    $error = true;
                    $errors = $validator->errors();
                }
            }else if($type == "stimuli_playlist_delete"){
                $validator = Validator::make($request->all(),[
                'playlist_id' => 'required',
                'user_id' => 'required'
                ]);
                if($validator->fails()){
                    $error = true;
                    $errors = $validator->errors();
                }
            }else if($type == "stimuli_playlist_search"){
                $validator = Validator::make($request->all(),[
                'user_id' => 'required'
                ]);
                if($validator->fails()){
                    $error = true;
                    $errors = $validator->errors();
                }
            }else if($type == "stimuli_playlist_lastsession"){
                $validator = Validator::make($request->all(),[
                'user_id' => 'required'
                ]);
                if($validator->fails()){
                    $error = true;
                    $errors = $validator->errors();
                }
            }else if($type == "stimuli_playlist_lastsession_update"){
                $validator = Validator::make($request->all(),[
                'user_id' => 'required',
                'category_id' => 'required'
                ]);
                if($validator->fails()){
                    $error = true;
                    $errors = $validator->errors();
                }
            }else if($type == "stimuli_playlist_popular"){
                $validator = Validator::make($request->all(),[
                'user_id' => 'required',
                ]);
                if($validator->fails()){
                    $error = true;
                    $errors = $validator->errors();
                }
            }else if($type == "stimuli_playlist_popular_update"){
                $validator = Validator::make($request->all(),[
                'user_id' => 'required',
                'playlist_id' => 'required'
                ]);
                if($validator->fails()){
                    $error = true;
                    $errors = $validator->errors();
                }
            }else if($type == "stimuli_store_playlist"){
                $validator = Validator::make($request->all(),[
                'title' => 'required',
                'description' => 'required',
                'user_id' => 'required'
                ]);
                if($validator->fails()){
                    $error = true;
                    $errors = $validator->errors();
                }
            }else if($type == "stimuli_update_playlist"){
                $validator = Validator::make($request->all(),[
                'title' => 'required',
                'playlist_id' => 'required',
                'user_id' => 'required'
                ]);
                if($validator->fails()){
                    $error = true;
                    $errors = $validator->errors();
                }
            }else if($type == "stimuli_playlist_item"){
                $validator = Validator::make($request->all(),[
                'playlist_id' => 'required'
                ]);
                if($validator->fails()){
                    $error = true;
                    $errors = $validator->errors();
                }
            }else if($type == "stimuli_store_playlist_item"){
                $validator = Validator::make($request->all(),[
                'playlist_id' => 'required',
                'affirmation_id' => 'required'
                ]);
                if($validator->fails()){
                    $error = true;
                    $errors = $validator->errors();
                }
            }else if($type == "stimuli_delete_playlist_item"){
                $validator = Validator::make($request->all(),[
                'playlist_id' => 'required',
                'affirmation_id' => 'required'
                ]);
                if($validator->fails()){
                    $error = true;
                    $errors = $validator->errors();
                }
            }else if($type == "stimuli_favoritelist"){
                $validator = Validator::make($request->all(),[
                'user_id' => 'required'
                ]);
                if($validator->fails()){
                    $error = true;
                    $errors = $validator->errors();
                }
            }else if($type == "stimuli_likeCategories"){
                $validator = Validator::make($request->all(),[
                'user_id' => 'required'
                ]);
                if($validator->fails()){
                    $error = true;
                    $errors = $validator->errors();
                }
            }else if($type == "stimuli_unlikeCategories"){
                $validator = Validator::make($request->all(),[
                'user_id' => 'required',
                'category_id' => 'required',
                'favorite_id' => 'required',
                ]);
                if($validator->fails()){
                    $error = true;
                    $errors = $validator->errors();
                }
            }else if($type == "stimuli_likeaffirmation"){
                $validator = Validator::make($request->all(),[
                'user_id' => 'required'
                ]);
                if($validator->fails()){
                    $error = true;
                    $errors = $validator->errors();
                }
            }if($type == "stimuli_unlikeaffirmation"){
                $validator = Validator::make($request->all(),[
                'user_id' => 'required',
                'affirmation_id' => 'required',
                'favorite_id' => 'required',
                ]);
                if($validator->fails()){
                    $error = true;
                    $errors = $validator->errors();
                }
            }else if($type == "stimuli_store_fevoritelist"){
                $validator = Validator::make($request->all(),[
                'user_id' => 'required',
                ]);
                if($validator->fails()){
                    $error = true;
                    $errors = $validator->errors();
                }
            }else if($type == "stimuli_push_notification"){
                $validator = Validator::make($request->all(),[
                'user_id' => 'required',
                'fcm_token' => 'required',
                ]);
                if($validator->fails()){
                    $error = true;
                    $errors = $validator->errors();
                }
            }else if($type == "stimuli_create_reminder"){
                $validator = Validator::make($request->all(),[
                'user_id' => 'required',
                'start_at' => 'required',
                // 'end_at' => 'required',
                ]);
                if($validator->fails()){
                    $error = true;
                    $errors = $validator->errors();
                }
            }else if($type == "stimuli_reminderlist"){
                $validator = Validator::make($request->all(),[
                'user_id' => 'required',
                ]);
                if($validator->fails()){
                    $error = true;
                    $errors = $validator->errors();
                }
            }else if($type == "stimuli_reminderdelete"){
                $validator = Validator::make($request->all(),[
                'reminder_id' => 'required',
                'user_id' => 'required',
                ]);
                if($validator->fails()){
                    $error = true;
                    $errors = $validator->errors();
                }
            }else if($type == "stimuli_reminder_cronjob"){
                $validator = Validator::make($request->all(),[
                'user_id' => 'required',
                ]);
                if($validator->fails()){
                    $error = true;
                    $errors = $validator->errors();
                }
            }
            return ["error" => $error,"errors"=>$errors];
        }
}
