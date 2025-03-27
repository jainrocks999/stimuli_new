<div>
    <div class="card-controls sm:flex">
        <div class="w-full sm:w-1/2">
            Per page:
            <select wire:model="perPage" class="form-select w-full sm:w-1/6">
                @foreach($paginationOptions as $value)
                    <option value="{{ $value }}">{{ $value }}</option>
                @endforeach
            </select>

            @can('playlist_item_delete')
                <button class="btn btn-rose ml-3 disabled:opacity-50 disabled:cursor-not-allowed" type="button" wire:click="confirm('deleteSelected')" wire:loading.attr="disabled" {{ $this->selectedCount ? '' : 'disabled' }}>
                    {{ __('Delete Selected') }}
                </button>
            @endcan

            @if(file_exists(app_path('Http/Livewire/ExcelExport.php')))
                <livewire:excel-export model="PlaylistItem" format="csv" />
                <livewire:excel-export model="PlaylistItem" format="xlsx" />
                <livewire:excel-export model="PlaylistItem" format="pdf" />
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
                            {{ trans('cruds.playlistItem.fields.id') }}
                            @include('components.table.sort', ['field' => 'id'])
                        </th>
                        <th>
                            {{ trans('cruds.playlistItem.fields.categories') }}
                            @include('components.table.sort', ['field' => 'categories.categories_name'])
                        </th>
                        <th>
                            {{ trans('cruds.playlistItem.fields.playlist') }}
                            @include('components.table.sort', ['field' => 'playlist.title'])
                        </th>
                        <th>
                            {{ trans('cruds.playlistItem.fields.affirmation') }}
                            @include('components.table.sort', ['field' => 'affirmation.affirmation_text'])
                        </th>
                        <th>
                        </th>
                    </tr>
                </thead>
                <tbody>
                    @forelse($playlistItems as $playlistItem)
                        <tr>
                            <td>
                                <input type="checkbox" value="{{ $playlistItem->id }}" wire:model="selected">
                            </td>
                            <td>
                                {{ $playlistItem->id }}
                            </td>
                            <td>
                                @if($playlistItem->category)
                                    <span class="badge badge-relationship">{{ $playlistItem->category->categories_name ?? '' }}</span>
                                @endif
                            </td>
                            <td>
                                @if($playlistItem->playlist)
                                    <span class="badge badge-relationship">{{ $playlistItem->playlist->title ?? '' }}</span>
                                @endif
                            </td>
                            <td>
                                @if($playlistItem->affirmation)
                                    <span class="badge badge-relationship">{{ $playlistItem->affirmation->affirmation_text ?? '' }}</span>
                                @endif
                            </td>
                            <td>
                                <div class="flex justify-end">
                                    @can('playlist_item_show')
                                        <a class="btn btn-sm btn-info mr-2" href="{{ route('admin.playlist-items.show', $playlistItem) }}">
                                            {{ trans('global.view') }}
                                        </a>
                                    @endcan
                                    @can('playlist_item_edit')
                                        <a class="btn btn-sm btn-success mr-2" href="{{ route('admin.playlist-items.edit', $playlistItem) }}">
                                            {{ trans('global.edit') }}
                                        </a>
                                    @endcan
                                    @can('playlist_item_delete')
                                        <button class="btn btn-sm btn-rose mr-2" type="button" wire:click="confirm('delete', {{ $playlistItem->id }})" wire:loading.attr="disabled">
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
            {{ $playlistItems->links() }}
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