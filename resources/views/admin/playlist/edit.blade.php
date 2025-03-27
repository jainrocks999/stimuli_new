@extends('layouts.admin')
@section('content')
<div class="row">
    <div class="card bg-blueGray-100">
        <div class="card-header">
            <div class="card-header-container">
                <h6 class="card-title">
                    {{ trans('global.edit') }}
                    {{ trans('cruds.playlist.title_singular') }}:
                    {{ trans('cruds.playlist.fields.id') }}
                    {{ $playlist->id }}
                </h6>
            </div>
        </div>

        <div class="card-body">
            @livewire('playlist.edit', [$playlist])
        </div>
    </div>
</div>
@endsection