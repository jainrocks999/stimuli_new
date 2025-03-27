@extends('layouts.admin')
@section('content')
<div class="row">
    <div class="card bg-blueGray-100">
        <div class="card-header">
            <div class="card-header-container">
                <h6 class="card-title">
                    {{ trans('global.view') }}
                    {{ trans('cruds.bgsound.title_singular') }}:
                    {{ trans('cruds.bgsound.fields.id') }}
                    {{ $bgsound->id }}
                </h6>
            </div>
        </div>

        <div class="card-body">
            <div class="pt-3">
                <table class="table table-view">
                    <tbody class="bg-white">
                        <tr>
                            <th>
                                {{ trans('cruds.bgsound.fields.id') }}
                            </th>
                            <td>
                                {{ $bgsound->id }}
                            </td>
                        </tr>
                        <tr>
                            <th>
                                {{ trans('cruds.bgsound.fields.bgsound_name') }}
                            </th>
                            <td>
                                {{ $bgsound->bgsound_name }}
                            </td>
                        </tr>
                        <tr>
                            <th>
                                {{ trans('cruds.bgsound.fields.sound') }}
                            </th>
                            <td>
                                @foreach($bgsound->bgsound_sound as $key => $entry)
                                    <a class="link-light-blue" href="{{ $entry['url'] }}">
                                        <i class="far fa-file">
                                        </i>
                                        {{ $entry['file_name'] }}
                                    </a>
                                @endforeach
                            </td>
                        </tr>
                        <tr>
                            <th>
                                {{ trans('cruds.bgsound.fields.bgsound_image') }}
                            </th>
                            <td>
                                @foreach($bgsound->bgsound_image as $key => $entry)
                                    <a class="link-photo" href="{{ $entry['url'] }}">
                                        <img src="{{ $entry['preview_thumbnail'] }}" alt="{{ $entry['name'] }}" title="{{ $entry['name'] }}">
                                    </a>
                                @endforeach
                            </td>
                        </tr>
                        <tr>
                            <th>
                                {{ trans('cruds.bgsound.fields.status') }}
                            </th>
                            <td>
                                {{ $bgsound->status_label }}
                            </td>
                        </tr>
                        <tr>
                            <th>
                                {{ trans('cruds.bgsound.fields.bgcategories') }}
                            </th>
                            <td>
                                @foreach($bgsound->bgcategories as $key => $entry)
                                    <span class="badge badge-relationship">{{ $entry->bg_name }}</span>
                                @endforeach
                            </td>
                        </tr>
                    </tbody>
                </table>
            </div>
            <div class="form-group">
                @can('bgsound_edit')
                    <a href="{{ route('admin.bgsounds.edit', $bgsound) }}" class="btn btn-indigo mr-2">
                        {{ trans('global.edit') }}
                    </a>
                @endcan
                <a href="{{ route('admin.bgsounds.index') }}" class="btn btn-secondary">
                    {{ trans('global.back') }}
                </a>
            </div>
        </div>
    </div>
</div>
@endsection