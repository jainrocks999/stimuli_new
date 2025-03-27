<div>
    <div class="card-controls sm:flex">
        <div class="w-full sm:w-1/2">
            Per page:
            <select wire:model="perPage" class="form-select w-full sm:w-1/6">
                @foreach($paginationOptions as $value)
                    <option value="{{ $value }}">{{ $value }}</option>
                @endforeach
            </select>

            @can('bgsound_delete')
                <button class="btn btn-rose ml-3 disabled:opacity-50 disabled:cursor-not-allowed" type="button" wire:click="confirm('deleteSelected')" wire:loading.attr="disabled" {{ $this->selectedCount ? '' : 'disabled' }}>
                    {{ __('Delete Selected') }}
                </button>
            @endcan

            @if(file_exists(app_path('Http/Livewire/ExcelExport.php')))
                <livewire:excel-export model="Bgsound" format="csv" />
                <livewire:excel-export model="Bgsound" format="xlsx" />
                <livewire:excel-export model="Bgsound" format="pdf" />
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
                            {{ trans('cruds.bgsound.fields.id') }}
                            @include('components.table.sort', ['field' => 'id'])
                        </th>
                        <th>
                            {{ trans('cruds.bgsound.fields.bgsound_name') }}
                            @include('components.table.sort', ['field' => 'bgsound_name'])
                        </th>
                        <th>
                            {{ trans('cruds.bgsound.fields.sound') }}
                        </th>
                        <th>
                            {{ trans('cruds.bgsound.fields.bgsound_image') }}
                        </th>
                        <th>
                            {{ trans('cruds.bgsound.fields.status') }}
                            @include('components.table.sort', ['field' => 'status'])
                        </th>
                        <th>
                            {{ trans('cruds.bgsound.fields.is_premium') }}
                            @include('components.table.sort', ['field' => 'is_premium'])
                        </th>
                        <th>
                            {{ trans('cruds.bgsound.fields.bgcategories') }}
                        </th>
                        <th>
                        </th>
                    </tr>
                </thead>
                <tbody>
                    @forelse($bgsounds as $bgsound)

                    <?php //dd($bgsound->media); ?>
                        <tr>
                            <td>
                                <input type="checkbox" value="{{ $bgsound->id }}" wire:model="selected">
                            </td>
                            <td>
                                {{ $bgsound->id }}
                            </td>
                            <td>
                                {{ $bgsound->bgsound_name }}
                            </td>
                            <td>
                                @foreach($bgsound->bgsound_sound as $key => $entry)
                                    <a class="link-light-blue" href="{{ $entry['url'] }}">
                                        <i class="far fa-file">
                                        </i>
                                        {{ $entry['file_name'] }}
                                    </a>
                                @endforeach
                            </td>
                            <td>
                                @foreach($bgsound->bgsound_image as $key => $entry)
                                    <a class="link-photo" href="{{ $entry['url'] }}">
                                        <img src="{{ $entry['thumbnail'] }}" alt="{{ $entry['name'] }}" title="{{ $entry['name'] }}">
                                    </a>
                                @endforeach
                            </td>
                            <td>
                                {{ $bgsound->status_label }}
                            </td>
                            <td>
                                {{ $bgsound->premium_label }}
                            </td>
                            <td>
                                @foreach($bgsound->bgcategories as $key => $entry)
                                    <span class="badge badge-relationship">{{ $entry->bg_name }}</span>
                                @endforeach
                            </td>
                            <td>
                                <div class="flex justify-end">
                                    @can('bgsound_show')
                                        <a class="btn btn-sm btn-info mr-2" href="{{ route('admin.bgsounds.show', $bgsound) }}">
                                            {{ trans('global.view') }}
                                        </a>
                                    @endcan
                                    @can('bgsound_edit')
                                        <a class="btn btn-sm btn-success mr-2" href="{{ route('admin.bgsounds.edit', $bgsound) }}">
                                            {{ trans('global.edit') }}
                                        </a>
                                    @endcan
                                    @can('bgsound_delete')
                                        <button class="btn btn-sm btn-rose mr-2" type="button" wire:click="confirm('delete', {{ $bgsound->id }})" wire:loading.attr="disabled">
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
            {{ $bgsounds->links() }}
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