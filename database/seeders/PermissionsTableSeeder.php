<?php

namespace Database\Seeders;

use App\Models\Permission;
use Illuminate\Database\Seeder;

class PermissionsTableSeeder extends Seeder
{
    public function run()
    {
        $permissions = [
            [
                'id'    => 1,
                'title' => 'auth_profile_edit',
            ],
            [
                'id'    => 2,
                'title' => 'user_management_access',
            ],
            [
                'id'    => 3,
                'title' => 'permission_create',
            ],
            [
                'id'    => 4,
                'title' => 'permission_edit',
            ],
            [
                'id'    => 5,
                'title' => 'permission_show',
            ],
            [
                'id'    => 6,
                'title' => 'permission_delete',
            ],
            [
                'id'    => 7,
                'title' => 'permission_access',
            ],
            [
                'id'    => 8,
                'title' => 'role_create',
            ],
            [
                'id'    => 9,
                'title' => 'role_edit',
            ],
            [
                'id'    => 10,
                'title' => 'role_show',
            ],
            [
                'id'    => 11,
                'title' => 'role_delete',
            ],
            [
                'id'    => 12,
                'title' => 'role_access',
            ],
            [
                'id'    => 13,
                'title' => 'user_create',
            ],
            [
                'id'    => 14,
                'title' => 'user_edit',
            ],
            [
                'id'    => 15,
                'title' => 'user_show',
            ],
            [
                'id'    => 16,
                'title' => 'user_delete',
            ],
            [
                'id'    => 17,
                'title' => 'user_access',
            ],
            [
                'id'    => 18,
                'title' => 'group_create',
            ],
            [
                'id'    => 19,
                'title' => 'group_edit',
            ],
            [
                'id'    => 20,
                'title' => 'group_show',
            ],
            [
                'id'    => 21,
                'title' => 'group_delete',
            ],
            [
                'id'    => 22,
                'title' => 'group_access',
            ],
            [
                'id'    => 23,
                'title' => 'category_create',
            ],
            [
                'id'    => 24,
                'title' => 'category_edit',
            ],
            [
                'id'    => 25,
                'title' => 'category_show',
            ],
            [
                'id'    => 26,
                'title' => 'category_delete',
            ],
            [
                'id'    => 27,
                'title' => 'category_access',
            ],
            [
                'id'    => 28,
                'title' => 'affirmation_create',
            ],
            [
                'id'    => 29,
                'title' => 'affirmation_edit',
            ],
            [
                'id'    => 30,
                'title' => 'affirmation_show',
            ],
            [
                'id'    => 31,
                'title' => 'affirmation_delete',
            ],
            [
                'id'    => 32,
                'title' => 'affirmation_access',
            ],
            [
                'id'    => 33,
                'title' => 'bg_category_create',
            ],
            [
                'id'    => 34,
                'title' => 'bg_category_edit',
            ],
            [
                'id'    => 35,
                'title' => 'bg_category_show',
            ],
            [
                'id'    => 36,
                'title' => 'bg_category_delete',
            ],
            [
                'id'    => 37,
                'title' => 'bg_category_access',
            ],
            [
                'id'    => 38,
                'title' => 'bgsound_create',
            ],
            [
                'id'    => 39,
                'title' => 'bgsound_edit',
            ],
            [
                'id'    => 40,
                'title' => 'bgsound_show',
            ],
            [
                'id'    => 41,
                'title' => 'bgsound_delete',
            ],
            [
                'id'    => 42,
                'title' => 'bgsound_access',
            ],
        ];

        Permission::insert($permissions);
    }
}
