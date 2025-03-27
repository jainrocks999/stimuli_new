<form wire:submit.prevent="submit" class="pt-3">

    <div class="form-group {{ $errors->has('group.group_name') ? 'invalid' : '' }}">
        <label class="form-label required" for="group_name">{{ trans('cruds.group.fields.group_name') }}</label>
        <input class="form-control" type="text" name="group_name" id="group_name" required wire:model.defer="group.group_name">
        <div class="validation-message">
            {{ $errors->first('group.group_name') }}
        </div>
        <div class="help-block">
            {{ trans('cruds.group.fields.group_name_helper') }}
        </div>
    </div>

    <div class="form-group {{ $errors->has('categories') ? 'invalid' : '' }}">
        <label class="form-label required" for="categories">{{ trans('cruds.group.fields.categories') }}</label>
        <x-select-list class="form-control" required id="category" name="category" wire:model="category" :options="$this->listsForFields['category']" multiple />
        <div class="validation-message">
            {{ $errors->first('categories') }}
        </div>
        <div class="help-block">
            {{ trans('cruds.group.fields.categories_helper') }}
        </div>
    </div>

    <div class="form-group {{ $errors->has('group.status') ? 'invalid' : '' }}">
        <label class="form-label required" for="status">{{ trans('cruds.group.fields.status') }}</label>
        @foreach($this->listsForFields['status'] as $key => $value)
            <label class="radio-label"><input type="radio" name="status" wire:model="group.status" value="{{ $key }}">{{ $value }}</label>
        @endforeach
        <div class="validation-message">
            {{ $errors->first('group.status') }}
        </div>
        <div class="help-block">
            {{ trans('cruds.group.fields.status_helper') }}
        </div>
    </div>
    
    <div class="form-group">
        <button class="btn btn-indigo mr-2" type="submit">
            {{ trans('global.save') }}
        </button>
        <a href="{{ route('admin.groups.index') }}" class="btn btn-secondary">
            {{ trans('global.cancel') }}
        </a>
    </div>
</form>