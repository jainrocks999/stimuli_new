@extends('layouts.admin')
@section('content')
<div class="row">
    <div class="card bg-blueGray-100">
        <div class="card-header">
            <div class="card-header-container">
                <h6 class="card-title">
                    {{ trans('global.view') }}
                    {{ trans('cruds.group.title_singular') }}:
                    {{ trans('cruds.group.fields.id') }}
                    {{ $group->id }}
                </h6>
            </div>
        </div>

        <div class="card-body">
            <div class="pt-3">
                <table class="table table-view">
                    <tbody class="bg-white">
                        <tr>
                            <th>
                                {{ trans('cruds.group.fields.id') }}
                            </th>
                            <td>
                                {{ $group->id }}
                            </td>
                        </tr>
                        <tr>
                            <th>
                                {{ trans('cruds.group.fields.group_name') }}
                            </th>
                            <td>
                                {{ $group->group_name }}
                            </td>
                        </tr>
                        <tr>
                            <th>
                                {{ trans('cruds.group.fields.status') }}
                            </th>
                            <td>
                                {{ $group->status }}
                            </td>
                        </tr>
                    </tbody>
                </table>
            </div>
            <div class="form-group">
                @can('group_edit')
                    <a href="{{ route('admin.groups.edit', $group) }}" class="btn btn-indigo mr-2">
                        {{ trans('global.edit') }}
                    </a>
                @endcan
                <a href="{{ route('admin.groups.index') }}" class="btn btn-secondary">
                    {{ trans('global.back') }}
                </a>
            </div>
        </div>
    </div>
</div>
@endsection