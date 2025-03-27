@extends('layouts.admin')
@section('content')
<div class="row">
    <div class="card bg-blueGray-100">
        <div class="card-header">
            <div class="card-header-container">
                <h6 class="card-title">
                    {{ trans('global.view') }}
                    {{ trans('cruds.playlistItem.title_singular') }}:
                    {{ trans('cruds.playlistItem.fields.id') }}
                    {{ $playlistItem->id }}
                </h6>
            </div>
        </div>

        <div class="card-body">
            <div class="pt-3">
                <table class="table table-view">
                    <tbody class="bg-white">
                        <tr>
                            <th>
                                {{ trans('cruds.playlistItem.fields.id') }}
                            </th>
                            <td>
                                {{ $playlistItem->id }}
                            </td>
                        </tr>
                        <tr>
                            <th>
                                {{ trans('cruds.playlistItem.fields.playlist') }}
                            </th>
                            <td>
                                @if($playlistItem->playlist)
                                    <span class="badge badge-relationship">{{ $playlistItem->playlist->title ?? '' }}</span>
                                @endif
                            </td>
                        </tr>
                        <tr>
                            <th>
                                {{ trans('cruds.playlistItem.fields.affirmation') }}
                            </th>
                            <td>
                                @if($playlistItem->affirmation)
                                    <span class="badge badge-relationship">{{ $playlistItem->affirmation->affirmation_text ?? '' }}</span>
                                @endif
                            </td>
                        </tr>
                    </tbody>
                </table>
            </div>
            <div class="form-group">
                @can('playlist_item_edit')
                    <a href="{{ route('admin.playlist-items.edit', $playlistItem) }}" class="btn btn-indigo mr-2">
                        {{ trans('global.edit') }}
                    </a>
                @endcan
                <a href="{{ route('admin.playlist-items.index') }}" class="btn btn-secondary">
                    {{ trans('global.back') }}
                </a>
            </div>
        </div>
    </div>
</div>
@endsection