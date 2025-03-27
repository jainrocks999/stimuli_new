@extends('layouts.admin')
@section('content')
<div class="row">
    <div class="card bg-blueGray-100">
        <div class="card-header">
            <div class="card-header-container">
                <h6 class="card-title">
                    {{ trans('global.view') }}
                    {{ trans('cruds.category.title_singular') }}:
                    {{ trans('cruds.category.fields.id') }}
                    {{ $category->id }}
                </h6>
            </div>
        </div>

        <div class="card-body">
            <div class="pt-3">
                <table class="table table-view">
                    <tbody class="bg-white">
                        <tr>
                            <th>
                                {{ trans('cruds.category.fields.id') }}
                            </th>
                            <td>
                                {{ $category->id }}
                            </td>
                        </tr>
                        <tr>
                            <th>
                                {{ trans('cruds.category.fields.categories_name') }}
                            </th>
                            <td>
                                {{ $category->categories_name }}
                            </td>
                        </tr>
                        <tr>
                            <th>
                                {{ trans('cruds.category.fields.categories_image') }}
                            </th>
                            <td>
                                @foreach($category->categories_image as $key => $entry)
                                    <a class="link-photo" href="{{ $entry['url'] }}">
                                        <img src="{{ $entry['preview_thumbnail'] }}" alt="{{ $entry['name'] }}" title="{{ $entry['name'] }}">
                                    </a>
                                @endforeach
                            </td>
                        </tr>
                        <tr>
                            <th>
                                {{ trans('cruds.category.fields.status') }}
                            </th>
                            <td>
                                {{ $category->status_label }}
                            </td>
                        </tr>
                    </tbody>
                </table>
            </div>
            <div class="form-group">
                @can('category_edit')
                    <a href="{{ route('admin.categories.edit', $category) }}" class="btn btn-indigo mr-2">
                        {{ trans('global.edit') }}
                    </a>
                @endcan
                <a href="{{ route('admin.categories.index') }}" class="btn btn-secondary">
                    {{ trans('global.back') }}
                </a>
            </div>
        </div>
    </div>
</div>
@endsection