@extends('layouts.admin')
@section('content')
<div class="row">
    <div class="card bg-blueGray-100">
        <div class="card-header">
            <div class="card-header-container">
                <h6 class="card-title">
                    {{ trans('global.edit') }}
                    {{ trans('cruds.favorite.title_singular') }}:
                    {{ trans('cruds.favorite.fields.id') }}
                    {{ $favorite->id }}
                </h6>
            </div>
        </div>

        <div class="card-body">
            @livewire('favorite.edit', [$favorite])
        </div>
    </div>
</div>
@endsection