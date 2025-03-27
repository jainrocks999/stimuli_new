<nav class="md:left-0 md:block md:fixed md:top-0 md:bottom-0 md:overflow-y-auto md:flex-row md:flex-nowrap md:overflow-hidden shadow-xl bg-white flex flex-wrap items-center justify-between relative md:w-64 z-10 py-0 px-6">
    <div class="md:flex-col md:items-stretch md:min-h-full md:flex-nowrap px-0 flex flex-wrap items-center justify-between w-full mx-auto">
        <button class="cursor-pointer text-black opacity-50 md:hidden px-3 py-1 text-xl leading-none bg-transparent rounded border border-solid border-transparent" type="button" onclick="toggleNavbar('example-collapse-sidebar')">
            <i class="fas fa-bars"></i>
        </button>
        <a class="md:block text-left md:pb-0 text-blueGray-700 mr-0 inline-block whitespace-nowrap text-sm uppercase font-bold px-0" href="{{ route('admin.home') }}">
            <img src="{{ asset('public/logo/logo.png') }}" class="h-44" alt="logo" title="logo">
        </a>
        <div class="md:flex md:flex-col md:items-stretch md:opacity-100 md:relative md:mt-4 md:shadow-none shadow absolute top-0 left-0 right-0 z-40 overflow-y-auto overflow-x-hidden h-auto items-center flex-1 rounded hidden" id="example-collapse-sidebar">
            <div class="md:min-w-full md:hidden block mb-4 border-b border-solid border-blueGray-300">
                <div class="flex flex-wrap">
                    <div class="w-6/12">
                        <a class="md:block text-left md:pb-2 text-blueGray-700 mr-0 inline-block whitespace-nowrap text-sm uppercase font-bold p-4 px-0" href="{{ route('admin.home') }}">
                            {{ trans('panel.site_title') }}
                        </a>
                    </div>
                    <div class="w-6/12 flex justify-end">
                        <button type="button" class="cursor-pointer text-black opacity-50 md:hidden px-3 py-1 text-xl leading-none bg-transparent rounded border border-solid border-transparent" onclick="toggleNavbar('example-collapse-sidebar')">
                            <i class="fas fa-times"></i>
                        </button>
                    </div>
                </div>
            </div>



            <!-- Divider -->
            <div class="flex md:hidden">
                @if(file_exists(app_path('Http/Livewire/LanguageSwitcher.php')))
                    <livewire:language-switcher />
                @endif
            </div>
            <hr class="mb-6 md:min-w-full" />
            <!-- Heading -->

            <ul class="md:flex-col md:min-w-full flex flex-col list-none">
                <li class="items-center">
                    <a href="{{ route("admin.home") }}" class="{{ request()->is("admin") ? "sidebar-nav-active" : "sidebar-nav" }}">
                        <i class="fas fa-tv"></i>
                        {{ trans('global.dashboard') }}
                    </a>
                </li>
                @can('group_access')
                    <li class="items-center">
                        <a class="{{ request()->is("admin/groups*") ? "sidebar-nav-active" : "sidebar-nav" }}" href="{{ route("admin.groups.index") }}">
                            <i class="fa-fw c-sidebar-nav-icon fas fa-users">
                            </i>
                            {{ trans('cruds.group.title') }}
                        </a>
                    </li>
                @endcan
                @can('category_access')
                    <li class="items-center">
                        <a class="{{ request()->is("admin/categories*") ? "sidebar-nav-active" : "sidebar-nav" }}" href="{{ route("admin.categories.index") }}">
                            <i class="fa-fw c-sidebar-nav-icon fab fa-cloudsmith">
                            </i>
                            {{ trans('cruds.category.title') }}
                        </a>
                    </li>
                @endcan
                @can('affirmation_access')
                    <li class="items-center">
                        <a class="{{ request()->is("admin/affirmations*") ? "sidebar-nav-active" : "sidebar-nav" }}" href="{{ route("admin.affirmations.index") }}">
                            <i class="fa-fw c-sidebar-nav-icon fab fa-asymmetrik">
                            </i>
                            {{ trans('cruds.affirmation.title') }}
                        </a>
                    </li>
                @endcan
                @can('bg_category_access')
                    <li class="items-center">
                        <a class="{{ request()->is("admin/bg-categories*") ? "sidebar-nav-active" : "sidebar-nav" }}" href="{{ route("admin.bg-categories.index") }}">
                            <i class="fa-fw c-sidebar-nav-icon fas fa-bezier-curve">
                            </i>
                            {{ trans('cruds.bgCategory.title') }}
                        </a>
                    </li>
                @endcan
                @can('bgsound_access')
                    <li class="items-center">
                        <a class="{{ request()->is("admin/bgsounds*") ? "sidebar-nav-active" : "sidebar-nav" }}" href="{{ route("admin.bgsounds.index") }}">
                            <i class="fa-fw c-sidebar-nav-icon fas fa-volume-up">
                            </i>
                            {{ trans('cruds.bgsound.title') }}
                        </a>
                    </li>
                @endcan
                @can('favorite_access')
                    <li class="items-center">
                        <a class="{{ request()->is("admin/favorites*") ? "sidebar-nav-active" : "sidebar-nav" }}" href="{{ route("admin.favorites.index") }}">
                        <i class="fa-fw c-sidebar-nav-icon fab fa-gratipay">
                            </i>  
                            {{ trans('cruds.favorite.title') }}
                        </a>
                    </li>
                @endcan
                @can('playlist_access')
                    <li class="items-center">
                        <a class="{{ request()->is("admin/playlists*") ? "sidebar-nav-active" : "sidebar-nav" }}" href="{{ route("admin.playlists.index") }}">
                            <i class="fa-fw c-sidebar-nav-icon fas fa-play-circle">
                            </i>
                            {{ trans('cruds.playlist.title') }}
                        </a>
                    </li>
                @endcan
                @can('playlist_item_access')
                    <li class="items-center">
                        <a class="{{ request()->is("admin/playlist-items*") ? "sidebar-nav-active" : "sidebar-nav" }}" href="{{ route("admin.playlist-items.index") }}">
                            <i class="fa-fw c-sidebar-nav-icon fab fa-itunes-note">
                            </i>
                            {{ trans('cruds.playlistItem.title') }}
                        </a>
                    </li>
                @endcan
                @can('user_management_access')
                    <li class="items-center">
                        <a class="has-sub {{ request()->is("admin/permissions*")||request()->is("admin/roles*")||request()->is("admin/users*") ? "sidebar-nav-active" : "sidebar-nav" }}" href="#" onclick="window.openSubNav(this)">
                            <i class="fa-fw fas c-sidebar-nav-icon fa-users">
                            </i>
                            {{ trans('cruds.userManagement.title') }}
                        </a>
                        <ul class="ml-4 subnav hidden">
                            @can('permission_access')
                                <li class="items-center">
                                    <a class="{{ request()->is("admin/permissions*") ? "sidebar-nav-active" : "sidebar-nav" }}" href="{{ route("admin.permissions.index") }}">
                                        <i class="fa-fw c-sidebar-nav-icon fas fa-unlock-alt">
                                        </i>
                                        {{ trans('cruds.permission.title') }}
                                    </a>
                                </li>
                            @endcan
                            @can('role_access')
                                <li class="items-center">
                                    <a class="{{ request()->is("admin/roles*") ? "sidebar-nav-active" : "sidebar-nav" }}" href="{{ route("admin.roles.index") }}">
                                        <i class="fa-fw c-sidebar-nav-icon fas fa-briefcase">
                                        </i>
                                        {{ trans('cruds.role.title') }}
                                    </a>
                                </li>
                            @endcan
                            @can('user_access')
                                <li class="items-center">
                                    <a class="{{ request()->is("admin/users*") ? "sidebar-nav-active" : "sidebar-nav" }}" href="{{ route("admin.users.index") }}">
                                        <i class="fa-fw c-sidebar-nav-icon fas fa-user">
                                        </i>
                                        {{ trans('cruds.user.title') }}
                                    </a>
                                </li>
                            @endcan
                        </ul>
                    </li>
                @endcan

                @if(file_exists(app_path('Http/Controllers/Auth/UserProfileController.php')))
                    @can('auth_profile_edit')
                        <li class="items-center">
                            <a href="{{ route("profile.show") }}" class="{{ request()->is("profile") ? "sidebar-nav-active" : "sidebar-nav" }}">
                                <i class="fa-fw c-sidebar-nav-icon fas fa-user-circle"></i>
                                {{ trans('global.my_profile') }}
                            </a>
                        </li>
                    @endcan
                @endif

                <li class="items-center">
                    <a href="#" onclick="event.preventDefault(); document.getElementById('logoutform').submit();" class="sidebar-nav">
                        <i class="fa-fw fas fa-sign-out-alt"></i>
                        {{ trans('global.logout') }}
                    </a>
                </li>
            </ul>
        </div>
    </div>
</nav>