@extends('layouts.admin')
@section('content')
<div class="row">
    <div class="card bg-blueGray-100">
        <div class="card-header">
            <div class="card-header-container">
                <h6 class="card-title">
                    {{ trans('global.view') }}
                    {{ trans('cruds.playlist.title_singular') }}:
                    {{ trans('cruds.playlist.fields.id') }}
                    {{ $playlist->id }}
                </h6>
            </div>
        </div>

        <div class="card-body">
            <div class="pt-3">
                <table class="table table-view">
                    <tbody class="bg-white">
                        <tr>
                            <th>
                                {{ trans('cruds.playlist.fields.id') }}
                            </th>
                            <td>
                                {{ $playlist->id }}
                            </td>
                        </tr>
                        <tr>
                            <th>
                                {{ trans('cruds.playlist.fields.user') }}
                            </th>
                            <td>
                                @foreach($playlist->user as $key => $entry)
                                    <span class="badge badge-relationship">{{ $entry->name }}</span>
                                @endforeach
                            </td>
                        </tr>
                        <tr>
                            <th>
                                {{ trans('cruds.playlist.fields.title') }}
                            </th>
                            <td>
                                {{ $playlist->title }}
                            </td>
                        </tr>
                        <tr>
                            <th>
                                {{ trans('cruds.playlist.fields.description') }}
                            </th>
                            <td>
                                {{ $playlist->description }}
                            </td>
                        </tr>
                    </tbody>
                </table>
            </div>
            <div class="form-group">
                @can('playlist_edit')
                    <a href="{{ route('admin.playlists.edit', $playlist) }}" class="btn btn-indigo mr-2">
                        {{ trans('global.edit') }}
                    </a>
                @endcan
                <a href="{{ route('admin.playlists.index') }}" class="btn btn-secondary">
                    {{ trans('global.back') }}
                </a>
            </div>
        </div>
    </div>
</div>
@endsection