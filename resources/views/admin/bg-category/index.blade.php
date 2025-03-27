@extends('layouts.admin')
@section('content')
<div class="row">
    <div class="card bg-white">
        <div class="card-header border-b border-blueGray-200">
            <div class="card-header-container">
                <h6 class="card-title">
                    {{ trans('cruds.bgCategory.title_singular') }}
                    {{ trans('global.list') }}
                </h6>

                @can('bg_category_create')
                    <a class="btn btn-indigo" href="{{ route('admin.bg-categories.create') }}">
                        {{ trans('global.add') }} {{ trans('cruds.bgCategory.title_singular') }}
                    </a>
                @endcan
            </div>
        </div>
        @livewire('bg-category.index')

    </div>
</div>
@endsection