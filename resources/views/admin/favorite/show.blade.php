@extends('layouts.admin')
@section('content')
<div class="row">
    <div class="card bg-blueGray-100">
        <div class="card-header">
            <div class="card-header-container">
                <h6 class="card-title">
                    {{ trans('global.view') }}
                    {{ trans('cruds.favorite.title_singular') }}:
                    {{ trans('cruds.favorite.fields.id') }}
                    {{ $favorite->id }}
                </h6>
            </div>
        </div>

        <div class="card-body">
            <div class="pt-3">
                <table class="table table-view">
                    <tbody class="bg-white">
                        <tr>
                            <th>
                                {{ trans('cruds.favorite.fields.id') }}
                            </th>
                            <td>
                                {{ $favorite->id }}
                            </td>
                        </tr>
                        <tr>
                            <th>
                                {{ trans('cruds.favorite.fields.bg_name') }}
                            </th>
                            <td>
                                {{ $favorite->bg_name }}
                            </td>
                        </tr>
                        <tr>
                            <th>
                                {{ trans('cruds.favorite.fields.status') }}
                            </th>
                            <td>
                                {{ $favorite->status_label }}
                            </td>
                        </tr>
                    </tbody>
                </table>
            </div>
            <div class="form-group">
                @can('bg_category_edit')
                    <a href="{{ route('admin.favorites.edit', $favorite) }}" class="btn btn-indigo mr-2">
                        {{ trans('global.edit') }}
                    </a>
                @endcan
                <a href="{{ route('admin.favorites.index') }}" class="btn btn-secondary">
                    {{ trans('global.back') }}
                </a>
            </div>
        </div>
    </div>
</div>
@endsection