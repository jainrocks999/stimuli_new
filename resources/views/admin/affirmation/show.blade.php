@extends('layouts.admin')
@section('content')
<div class="row">
    <div class="card bg-blueGray-100">
        <div class="card-header">
            <div class="card-header-container">
                <h6 class="card-title">
                    {{ trans('global.view') }}
                    {{ trans('cruds.affirmation.title_singular') }}:
                    {{ trans('cruds.affirmation.fields.id') }}
                    {{ $affirmation->id }}
                </h6>
            </div>
        </div>

        <div class="card-body">
            <div class="pt-3">
                <table class="table table-view">
                    <tbody class="bg-white">
                        <tr>
                            <th>
                                {{ trans('cruds.affirmation.fields.id') }}
                            </th>
                            <td>
                                {{ $affirmation->id }}
                            </td>
                        </tr>
                        <tr>
                            <th>
                                {{ trans('cruds.affirmation.fields.affirmation_text') }}
                            </th>
                            <td>
                                {{ $affirmation->affirmation_text }}
                            </td>
                        </tr>
                        <tr>
                            <th>
                                {{ trans('cruds.affirmation.fields.voice_one') }}
                            </th>
                            <td>
                                @if(!empty($affirmation->voice_one))
                                    @foreach($affirmation->voice_one as $key => $entry)
                                        <a class="link-light-blue" href="{{ $entry['url'] }}">
                                            <i class="far fa-file">
                                            </i>
                                            {{ $entry['file_name'] }}
                                        </a>
                                    @endforeach
                                @endif
                            </td>
                        </tr>
                        <tr>
                            <th>
                                {{ trans('cruds.affirmation.fields.voice_two') }}
                            </th>
                            <td>
                            @if(!empty($affirmation->voice_two))
                                    @foreach($affirmation->voice_two as $key => $entry)
                                        <a class="link-light-blue" href="{{ $entry['url'] }}">
                                            <i class="far fa-file">
                                            </i>
                                            {{ $entry['file_name'] }}
                                        </a>
                                    @endforeach
                                @endif
                            </td>
                        </tr>
                        <tr>
                            <th>
                                {{ trans('cruds.affirmation.fields.voice_three') }}
                            </th>
                            <td>
                                @if(!empty($affirmation->voice_three))
                                    @foreach($affirmation->voice_three as $key => $entry)
                                        <a class="link-light-blue" href="{{ $entry['url'] }}">
                                            <i class="far fa-file">
                                            </i>
                                            {{ $entry['file_name'] }}
                                        </a>
                                    @endforeach
                                @endif
                            </td>
                        </tr>
                        <tr>
                            <th>
                                {{ trans('cruds.affirmation.fields.voice_four') }}
                            </th>
                            <td>
                                @if(!empty($affirmation->voice_four))
                                    @foreach($affirmation->voice_four as $key => $entry)
                                        <a class="link-light-blue" href="{{ $entry['url'] }}">
                                            <i class="far fa-file">
                                            </i>
                                            {{ $entry['file_name'] }}
                                        </a>
                                    @endforeach
                                @endif
                            </td>
                        </tr>
                        <tr>
                            <th>
                                {{ trans('cruds.affirmation.fields.status') }}
                            </th>
                            <td>
                                {{ $affirmation->status_label }}
                            </td>
                        </tr>
                        <tr>
                            <th>
                                {{ trans('cruds.affirmation.fields.group') }}
                            </th>
                            <td>
                                @foreach($affirmation->group as $key => $entry)
                                    <span class="badge badge-relationship">{{ $entry->group_name }}</span>
                                @endforeach
                            </td>
                        </tr>
                    </tbody>
                </table>
            </div>
            <div class="form-group">
                @can('affirmation_edit')
                    <a href="{{ route('admin.affirmations.edit', $affirmation) }}" class="btn btn-indigo mr-2">
                        {{ trans('global.edit') }}
                    </a>
                @endcan
                <a href="{{ route('admin.affirmations.index') }}" class="btn btn-secondary">
                    {{ trans('global.back') }}
                </a>
            </div>
        </div>
    </div>
</div>
@endsection