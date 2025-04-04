@extends('layouts.admin')
@section('content')
<div class="row">
    <div class="card bg-blueGray-100">
        <div class="card-header">
            <div class="card-header-container">
                <h6 class="card-title">
                    {{ trans('global.edit') }}
                    {{ trans('cruds.group.title_singular') }}:
                    {{ trans('cruds.group.fields.id') }}
                    {{ $group->id }}
                </h6>
            </div>
        </div>

        <div class="card-body">
            @livewire('group.edit', [$group])
        </div>
    </div>
</div>
@endsection