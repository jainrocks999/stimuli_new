@extends('layouts.admin')
@section('content')
<div class="row">
    <div class="card bg-blueGray-100">
        <div class="card-header">
            <div class="card-header-container">
                <h6 class="card-title">
                    {{ trans('global.view') }}
                    {{ trans('cruds.bgCategory.title_singular') }}:
                    {{ trans('cruds.bgCategory.fields.id') }}
                    {{ $bgCategory->id }}
                </h6>
            </div>
        </div>

        <div class="card-body">
            <div class="pt-3">
                <table class="table table-view">
                    <tbody class="bg-white">
                        <tr>
                            <th>
                                {{ trans('cruds.bgCategory.fields.id') }}
                            </th>
                            <td>
                                {{ $bgCategory->id }}
                            </td>
                        </tr>
                        <tr>
                            <th>
                                {{ trans('cruds.bgCategory.fields.bg_name') }}
                            </th>
                            <td>
                                {{ $bgCategory->bg_name }}
                            </td>
                        </tr>
                        <tr>
                            <th>
                                {{ trans('cruds.bgCategory.fields.status') }}
                            </th>
                            <td>
                                {{ $bgCategory->status_label }}
                            </td>
                        </tr>
                    </tbody>
                </table>
            </div>
            <div class="form-group">
                @can('bg_category_edit')
                    <a href="{{ route('admin.bg-categories.edit', $bgCategory) }}" class="btn btn-indigo mr-2">
                        {{ trans('global.edit') }}
                    </a>
                @endcan
                <a href="{{ route('admin.bg-categories.index') }}" class="btn btn-secondary">
                    {{ trans('global.back') }}
                </a>
            </div>
        </div>
    </div>
</div>
@endsection