<form wire:submit.prevent="submit" class="pt-3">

    <div class="form-group {{ $errors->has('category.categories_name') ? 'invalid' : '' }}">
        <label class="form-label required" for="categories_name">{{ trans('cruds.category.fields.categories_name') }}</label>
        <input class="form-control" type="text" name="categories_name" id="categories_name" required wire:model.defer="category.categories_name">
        <div class="validation-message">
            {{ $errors->first('category.categories_name') }}
        </div>
        <div class="help-block">
            {{ trans('cruds.category.fields.categories_name_helper') }}
        </div>
    </div>
    <div class="form-group {{ $errors->has('mediaCollections.category_categories_image') ? 'invalid' : '' }}">
        <label class="form-label required" for="categories_image">{{ trans('cruds.category.fields.categories_image') }}</label>
        <x-dropzone id="categories_image" name="categories_image" action="{{ route('admin.categories.storeMedia') }}" collection-name="category_categories_image" max-file-size="2" max-width="4096" max-height="4096" max-files="1" />
        <div class="validation-message">
            {{ $errors->first('mediaCollections.category_categories_image') }}
        </div>
        <div class="help-block">
            {{ trans('cruds.category.fields.categories_image_helper') }}
        </div>
    </div>

    <div class="form-group {{ $errors->has('group') ? 'invalid' : '' }}">
        <label class="form-label required" for="group">{{ trans('cruds.category.fields.group') }}</label>
        <x-select-list class="form-control" required id="group" name="group" wire:model="group" :options="$this->listsForFields['group']" multiple />
        <div class="validation-message">
            {{ $errors->first('group') }}
        </div>
        <div class="help-block">
            {{ trans('cruds.category.fields.group_helper') }}
        </div>
    </div>


    <div class="form-group {{ $errors->has('category.status') ? 'invalid' : '' }}">
        <label class="form-label">{{ trans('cruds.category.fields.status') }}</label>
        @foreach($this->listsForFields['status'] as $key => $value)
            <label class="radio-label"><input type="radio" name="status" wire:model="category.status" value="{{ $key }}">{{ $value }}</label>
        @endforeach
        <div class="validation-message">
            {{ $errors->first('category.status') }}
        </div>
        <div class="help-block">
            {{ trans('cruds.category.fields.status_helper') }}
        </div>
    </div>

    <div class="form-group">
        <button class="btn btn-indigo mr-2" type="submit">
            {{ trans('global.save') }}
        </button>
        <a href="{{ route('admin.categories.index') }}" class="btn btn-secondary">
            {{ trans('global.cancel') }}
        </a>
    </div>
</form>