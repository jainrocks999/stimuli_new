@extends('layouts.admin')
@section('content')
<div class="row">
    <div class="card bg-blueGray-100">
        <div class="card-header">
            <div class="card-header-container">
                <h6 class="card-title">
                    {{ trans('global.edit') }}
                    {{ trans('cruds.bgsound.title_singular') }}:
                    {{ trans('cruds.bgsound.fields.id') }}
                    {{ $bgsound->id }}
                </h6>
            </div>
        </div>

        <div class="card-body">
            @livewire('bgsound.edit', [$bgsound])
        </div>
    </div>
</div>
@endsection