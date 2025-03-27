<form wire:submit.prevent="submit" class="pt-3">

    <div class="form-group {{ $errors->has('bgsound.bgsound_name') ? 'invalid' : '' }}">
        <label class="form-label required" for="bgsound_name">{{ trans('cruds.bgsound.fields.bgsound_name') }}</label>
        <input class="form-control" type="text" name="bgsound_name" id="bgsound_name" required wire:model.defer="bgsound.bgsound_name">
        <div class="validation-message">
            {{ $errors->first('bgsound.bgsound_name') }}
        </div>
        <div class="help-block">
            {{ trans('cruds.bgsound.fields.bgsound_name_helper') }}
        </div>
    </div>
    <div class="form-group {{ $errors->has('mediaCollections.bgsound_sound') ? 'invalid' : '' }}">
        <label class="form-label required" for="sound">{{ trans('cruds.bgsound.fields.sound') }}</label>
        <x-dropzone id="sound" name="bgsound" action="{{ route('admin.bgsounds.storeMedia') }}" collection-name="bgsound_sound" max-file-size="5000" max-files="1" />
        <div class="validation-message">
            {{ $errors->first('mediaCollections.bgsound_sound') }}
        </div>
        <div class="help-block">
            {{ trans('cruds.bgsound.fields.sound_helper') }}
        </div>
    </div>

    <div class="form-group {{ $errors->has('mediaCollections.bgsound_bgsound_image') ? 'invalid' : '' }}">
        <label class="form-label" for="bgsound_image">{{ trans('cruds.bgsound.fields.bgsound_image') }}</label>
        <x-dropzone id="bgsound_image" name="bgsound_image" action="{{ route('admin.bgsounds.storeMedia') }}" collection-name="bgsound_bgsound_image" max-file-size="2" max-width="4096" max-height="4096" max-files="1" />
        <div class="validation-message">
            {{ $errors->first('mediaCollections.bgsound_bgsound_image') }}
        </div>
        <div class="help-block">
            {{ trans('cruds.bgsound.fields.bgsound_image_helper') }}
        </div>
    </div>
    <div class="form-group {{ $errors->has('bgsound.status') ? 'invalid' : '' }}">
        <label class="form-label required">{{ trans('cruds.bgsound.fields.status') }}</label>
        @foreach($this->listsForFields['status'] as $key => $value)
            <label class="radio-label"><input type="radio" name="status" wire:model="bgsound.status" value="{{ $key }}">{{ $value }}</label>
        @endforeach
        <div class="validation-message">
            {{ $errors->first('bgsound.status') }}
        </div>
        <div class="help-block">
            {{ trans('cruds.bgsound.fields.status_helper') }}
        </div>
    </div>
    <div class="form-group {{ $errors->has('bgsound.is_premium') ? 'invalid' : '' }}">
        <label class="form-label required">{{ trans('cruds.bgsound.fields.is_premium') }}</label>
        @foreach($this->listsForFields['is_premium'] as $key => $value)
            <label class="radio-label">
                <input type="radio" name="is_premium" wire:model="bgsound.is_premium" value="{{ $key }}">{{ $value }}</label>
        @endforeach
        <div class="validation-message">
            {{ $errors->first('bgsound.is_premium') }}
        </div>
        <div class="help-block">
            {{ trans('cruds.bgsound.fields.is_premium_helper') }}
        </div>
    </div>
    <div class="form-group {{ $errors->has('bgcategories') ? 'invalid' : '' }}">
        <label class="form-label required" for="bgcategories">{{ trans('cruds.bgsound.fields.bgcategories') }}</label>
        <x-select-list class="form-control" required id="bgcategories" name="bgcategories" wire:model="bgcategories" :options="$this->listsForFields['bgcategories']" multiple />
        <div class="validation-message">
            {{ $errors->first('bgcategories') }}
        </div>
        <div class="help-block">
            {{ trans('cruds.bgsound.fields.bgcategories_helper') }}
        </div>
    </div>

    <div class="form-group">
        <button class="btn btn-indigo mr-2" type="submit">
            {{ trans('global.save') }}
        </button>
        <a href="{{ route('admin.bgsounds.index') }}" class="btn btn-secondary">
            {{ trans('global.cancel') }}
        </a>
    </div>
</form>