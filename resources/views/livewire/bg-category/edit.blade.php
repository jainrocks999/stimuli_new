<form wire:submit.prevent="submit" class="pt-3">

    <div class="form-group {{ $errors->has('bgCategory.bg_name') ? 'invalid' : '' }}">
        <label class="form-label required" for="bg_name">{{ trans('cruds.bgCategory.fields.bg_name') }}</label>
        <input class="form-control" type="text" name="bg_name" id="bg_name" required wire:model.defer="bgCategory.bg_name">
        <div class="validation-message">
            {{ $errors->first('bgCategory.bg_name') }}
        </div>
        <div class="help-block">
            {{ trans('cruds.bgCategory.fields.bg_name_helper') }}
        </div>
    </div>
    <div class="form-group {{ $errors->has('bgCategory.status') ? 'invalid' : '' }}">
        <label class="form-label">{{ trans('cruds.bgCategory.fields.status') }}</label>
        @foreach($this->listsForFields['status'] as $key => $value)
            <label class="radio-label"><input type="radio" name="status" wire:model="bgCategory.status" value="{{ $key }}">{{ $value }}</label>
        @endforeach
        <div class="validation-message">
            {{ $errors->first('bgCategory.status') }}
        </div>
        <div class="help-block">
            {{ trans('cruds.bgCategory.fields.status_helper') }}
        </div>
    </div>

    <div class="form-group">
        <button class="btn btn-indigo mr-2" type="submit">
            {{ trans('global.save') }}
        </button>
        <a href="{{ route('admin.bg-categories.index') }}" class="btn btn-secondary">
            {{ trans('global.cancel') }}
        </a>
    </div>
</form>