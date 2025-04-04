<div>
    <div class="card-controls sm:flex">
        <div class="w-full sm:w-1/2">
            Per page:
            <select wire:model="perPage" class="form-select w-full sm:w-1/6">
                @foreach($paginationOptions as $value)
                    <option value="{{ $value }}">{{ $value }}</option>
                @endforeach
            </select>

            @can('affirmation_delete')
                <button class="btn btn-rose ml-3 disabled:opacity-50 disabled:cursor-not-allowed" type="button" wire:click="confirm('deleteSelected')" wire:loading.attr="disabled" {{ $this->selectedCount ? '' : 'disabled' }}>
                    {{ __('Delete Selected') }}
                </button>
            @endcan

            @if(file_exists(app_path('Http/Livewire/ExcelExport.php')))
                <livewire:excel-export model="Affirmation" format="csv" />
                <livewire:excel-export model="Affirmation" format="xlsx" />
                <livewire:excel-export model="Affirmation" format="pdf" />
            @endif




        </div>
        <div class="w-full sm:w-1/2 sm:text-right">
            Search:
            <input type="text" wire:model.debounce.300ms="search" class="w-full sm:w-1/3 inline-block" />
        </div>
    </div>
    <div wire:loading.delay>
        Loading...
    </div>

    <div class="overflow-hidden">
        <div class="overflow-x-auto">
            <table class="table table-index w-full">
                <thead>
                    <tr>
                        <th class="w-9">
                        </th>
                        <th class="w-28">
                            {{ trans('cruds.affirmation.fields.id') }}
                            @include('components.table.sort', ['field' => 'id'])
                        </th>
                        <th>
                            {{ trans('cruds.affirmation.fields.affirmation_text') }}
                            @include('components.table.sort', ['field' => 'affirmation_text'])
                        </th>
                        <th>
                            {{ trans('cruds.affirmation.fields.voice_one') }}
                            @include('components.table.sort', ['field' => 'voice_one'])
                        </th>
                        <th>
                            {{ trans('cruds.affirmation.fields.voice_two') }}
                            @include('components.table.sort', ['field' => 'voice_two'])
                        </th>
                        <th>
                            {{ trans('cruds.affirmation.fields.voice_three') }}
                            @include('components.table.sort', ['field' => 'voice_three'])
                        </th>
                        <th>
                            {{ trans('cruds.affirmation.fields.voice_four') }}
                            @include('components.table.sort', ['field' => 'voice_four'])
                        </th>
                        <th>
                            {{ trans('cruds.affirmation.fields.status') }}
                            @include('components.table.sort', ['field' => 'status'])
                        </th>
                        <th>
                            {{ trans('cruds.affirmation.fields.group') }}
                        </th>
                        <th>
                            {{ trans('cruds.affirmation.fields.category') }}
                        </th>
                        <th>
                        </th>
                    </tr>
                </thead>
                <tbody>
                    @forelse($affirmations as $affirmation)
                        <tr>
                            <td>
                                <input type="checkbox" value="{{ $affirmation->id }}" wire:model="selected">
                            </td>
                            <td>
                                {{ $affirmation->id }}
                            </td>
                            <td>
                                {{ $affirmation->affirmation_text }}
                            </td>
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
                            <td>
                                {{ $affirmation->status_label }}
                            </td>
                            <td>
                                @foreach($affirmation->group as $key => $entry)
                                    <span class="badge badge-relationship">{{ $entry->group_name }}</span>
                                @endforeach
                            </td>
                            <td>
                                @foreach($affirmation->category as $key => $entry)
                                    <span class="badge badge-relationship">{{ $entry->categories_name }}</span>
                                @endforeach
                            </td>
                            <td>
                                <div class="flex justify-end">
                                    @can('affirmation_show')
                                        <a class="btn btn-sm btn-info mr-2" href="{{ route('admin.affirmations.show', $affirmation) }}">
                                            {{ trans('global.view') }}
                                        </a>
                                    @endcan
                                    @can('affirmation_edit')
                                        <a class="btn btn-sm btn-success mr-2" href="{{ route('admin.affirmations.edit', $affirmation) }}">
                                            {{ trans('global.edit') }}
                                        </a>
                                    @endcan
                                    @can('affirmation_delete')
                                        <button class="btn btn-sm btn-rose mr-2" type="button" wire:click="confirm('delete', {{ $affirmation->id }})" wire:loading.attr="disabled">
                                            {{ trans('global.delete') }}
                                        </button>
                                    @endcan
                                </div>
                            </td>
                        </tr>
                        @empty
                        <tr>
                            <td colspan="10">No entries found.</td>
                        </tr>
                    @endforelse
                </tbody>
            </table>
        </div>
    </div>

    <div class="card-body">
        <div class="pt-3">
            @if($this->selectedCount)
                <p class="text-sm leading-5">
                    <span class="font-medium">
                        {{ $this->selectedCount }}
                    </span>
                    {{ __('Entries selected') }}
                </p>
            @endif
            {{ $affirmations->links() }}
        </div>
    </div>
</div>

@push('scripts')
    <script>
        Livewire.on('confirm', e => {
    if (!confirm("{{ trans('global.areYouSure') }}")) {
        return
    }
@this[e.callback](...e.argv)
})
    </script>
@endpush