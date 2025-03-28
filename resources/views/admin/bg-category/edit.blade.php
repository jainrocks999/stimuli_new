@extends('layouts.admin')
@section('content')
<div class="row">
    <div class="card bg-blueGray-100">
        <div class="card-header">
            <div class="card-header-container">
                <h6 class="card-title">
                    {{ trans('global.edit') }}
                    {{ trans('cruds.bgCategory.title_singular') }}:
                    {{ trans('cruds.bgCategory.fields.id') }}
                    {{ $bgCategory->id }}
                </h6>
            </div>
        </div>

        <div class="card-body">
            @livewire('bg-category.edit', [$bgCategory])
        </div>
    </div>
</div>
@endsection