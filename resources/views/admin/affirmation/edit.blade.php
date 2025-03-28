@extends('layouts.admin')
@section('content')
<div class="row">
    <div class="card bg-blueGray-100">
        <div class="card-header">
            <div class="card-header-container">
                <h6 class="card-title">
                    {{ trans('global.edit') }}
                    {{ trans('cruds.affirmation.title_singular') }}:
                    {{ trans('cruds.affirmation.fields.id') }}
                    {{ $affirmation->id }}
                </h6>
            </div>
        </div>

        <div class="card-body">
            @livewire('affirmation.edit', [$affirmation])
        </div>
    </div>
</div>
@endsection