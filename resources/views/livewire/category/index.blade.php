<div>
    <div class="card-controls sm:flex">
        <div class="w-full sm:w-1/2">
            Per page:
            <select wire:model="perPage" class="form-select w-full sm:w-1/6">
                @foreach($paginationOptions as $value)
                    <option value="{{ $value }}">{{ $value }}</option>
                @endforeach
            </select>

            @can('category_delete')
                <button class="btn btn-rose ml-3 disabled:opacity-50 disabled:cursor-not-allowed" type="button" wire:click="confirm('deleteSelected')" wire:loading.attr="disabled" {{ $this->selectedCount ? '' : 'disabled' }}>
                    {{ __('Delete Selected') }}
                </button>
            @endcan

            @if(file_exists(app_path('Http/Livewire/ExcelExport.php')))
                <livewire:excel-export model="Category" format="csv" />
                <livewire:excel-export model="Category" format="xlsx" />
                <livewire:excel-export model="Category" format="pdf" />
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
                            {{ trans('cruds.category.fields.id') }}
                            @include('components.table.sort', ['field' => 'id'])
                        </th>
                        <th>
                            {{ trans('cruds.category.fields.categories_image') }}
                        </th>
                        <th>
                            {{ trans('cruds.category.fields.categories_name') }}
                            @include('components.table.sort', ['field' => 'categories_name'])
                        </th>
                        <th>
                            {{ trans('cruds.category.fields.group') }}
                            @include('components.table.sort', ['field' => 'group'])
                        </th>
                       
                        <th>
                            {{ trans('cruds.category.fields.status') }}
                            @include('components.table.sort', ['field' => 'status'])
                        </th>

                        <th>
                        </th>
                    </tr>
                </thead>
                <tbody>
                    @forelse($categories as $category)
                        <tr>
                            <td>
                                <input type="checkbox" value="{{ $category->id }}" wire:model="selected">
                            </td>
                            <td>
                                {{ $category->id }}
                            </td>
                            <td>
                                @foreach($category->categories_image as $key => $entry)
                                    <a class="link-photo" href="{{ $entry['url'] }}">
                                        <img src="{{ $entry['thumbnail'] }}" alt="{{ $entry['name'] }}" title="{{ $entry['name'] }}">
                                    </a>
                                @endforeach
                            </td>
                            <td>
                                {{ $category->categories_name }}
                            </td>
                            <td>
                                @foreach($category->group as $key => $entry)
                                    <span class="badge badge-relationship">{{ $entry->group_name }}</span>
                                @endforeach
                            </td>
                            <td>
                                {{ $category->status_label }}
                            </td>
                            <td>
                                <div class="flex justify-end">
                                    @can('category_show')
                                        <a class="btn btn-sm btn-info mr-2" href="{{ route('admin.categories.show', $category) }}">
                                            {{ trans('global.view') }}
                                        </a>
                                    @endcan
                                    @can('category_edit')
                                        <a class="btn btn-sm btn-success mr-2" href="{{ route('admin.categories.edit', $category) }}">
                                            {{ trans('global.edit') }}
                                        </a>
                                    @endcan
                                    @can('category_delete')
                                        <button class="btn btn-sm btn-rose mr-2" type="button" wire:click="confirm('delete', {{ $category->id }})" wire:loading.attr="disabled">
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
            {{ $categories->links() }}
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