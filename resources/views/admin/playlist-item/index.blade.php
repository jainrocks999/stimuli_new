@extends('layouts.admin')
@section('content')
<div class="row">
    <div class="card bg-white">
        <div class="card-header border-b border-blueGray-200">
            <div class="card-header-container">
                <h6 class="card-title">
                    {{ trans('cruds.playlistItem.title_singular') }}
                    {{ trans('global.list') }}
                </h6>

                @can('playlist_item_create')
                    <a class="btn btn-indigo" href="{{ route('admin.playlist-items.create') }}">
                        {{ trans('global.add') }} {{ trans('cruds.playlistItem.title_singular') }}
                    </a>
                @endcan
            </div>
        </div>
        @livewire('playlist-item.index')

    </div>
</div>
@endsection