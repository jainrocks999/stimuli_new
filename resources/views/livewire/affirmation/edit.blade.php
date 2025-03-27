<form wire:submit.prevent="submit" class="pt-3">

    <div class="form-group {{ $errors->has('affirmation.affirmation_text') ? 'invalid' : '' }}">
        <label class="form-label required" for="affirmation_text">{{ trans('cruds.affirmation.fields.affirmation_text') }}</label>
        <input class="form-control" type="text" name="affirmation_text" id="affirmation_text" required wire:model.defer="affirmation.affirmation_text">
        <div class="validation-message">
            {{ $errors->first('affirmation.affirmation_text') }}
        </div>
        <div class="help-block">
            {{ trans('cruds.affirmation.fields.affirmation_text_helper') }}
        </div>
    </div>
    <!-- <div class="form-group {{ $errors->has('affirmation.voice_one') ? 'invalid' : '' }}">
        <label class="form-label required" for="voice_one">{{ trans('cruds.affirmation.fields.voice_one') }}</label>
        <input class="form-control" type="text" name="voice_one" id="voice_one" required wire:model.defer="affirmation.voice_one">
        <div class="validation-message">
            {{ $errors->first('affirmation.voice_one') }}
        </div>
        <div class="help-block">
            {{ trans('cruds.affirmation.fields.voice_one_helper') }}
        </div>
    </div>
    <div class="form-group {{ $errors->has('affirmation.voice_two') ? 'invalid' : '' }}">
        <label class="form-label required" for="voice_two">{{ trans('cruds.affirmation.fields.voice_two') }}</label>
        <input class="form-control" type="text" name="voice_two" id="voice_two" required wire:model.defer="affirmation.voice_two">
        <div class="validation-message">
            {{ $errors->first('affirmation.voice_two') }}
        </div>
        <div class="help-block">
            {{ trans('cruds.affirmation.fields.voice_two_helper') }}
        </div>
    </div>
    <div class="form-group {{ $errors->has('affirmation.voice_three') ? 'invalid' : '' }}">
        <label class="form-label required" for="voice_three">{{ trans('cruds.affirmation.fields.voice_three') }}</label>
        <input class="form-control" type="text" name="voice_three" id="voice_three" required wire:model.defer="affirmation.voice_three">
        <div class="validation-message">
            {{ $errors->first('affirmation.voice_three') }}
        </div>
        <div class="help-block">
            {{ trans('cruds.affirmation.fields.voice_three_helper') }}
        </div>
    </div>
    <div class="form-group {{ $errors->has('affirmation.voice_four') ? 'invalid' : '' }}">
        <label class="form-label required" for="voice_four">{{ trans('cruds.affirmation.fields.voice_four') }}</label>
        <input class="form-control" type="text" name="voice_four" id="voice_four" required wire:model.defer="affirmation.voice_four">
        <div class="validation-message">
            {{ $errors->first('affirmation.voice_four') }}
        </div>
        <div class="help-block">
            {{ trans('cruds.affirmation.fields.voice_four_helper') }}
        </div>
    </div> -->

    <div class="form-group {{ $errors->has('mediaCollections.affirmation_voice_one') ? 'invalid' : '' }}">
        <label class="form-label required" for="voice_one">{{ trans('cruds.affirmation.fields.voice_one') }}</label>
        <x-dropzone id="voice_one" name="voice_one" action="{{ route('admin.affirmations.storeMedia') }}" collection-name="affirmation_voice_one" max-file-size="2" max-files="1" />
        <div class="validation-message">
            {{ $errors->first('mediaCollections.affirmation_voice_one') }}
        </div>
        <div class="help-block">
            {{ trans('cruds.affirmation.fields.voice_one_helper') }}
        </div>
    </div>
    <div class="form-group {{ $errors->has('mediaCollections.affirmation_voice_two') ? 'invalid' : '' }}">
        <label class="form-label" for="voice_two">{{ trans('cruds.affirmation.fields.voice_two') }}</label>
        <x-dropzone id="voice_two" name="voice_two" action="{{ route('admin.affirmations.storeMedia') }}" collection-name="affirmation_voice_two" max-file-size="5" max-files="1" />
        <div class="validation-message">
            {{ $errors->first('mediaCollections.affirmation_voice_two') }}
        </div>
        <div class="help-block">
            {{ trans('cruds.affirmation.fields.voice_two_helper') }}
        </div>
    </div>
    <div class="form-group {{ $errors->has('mediaCollections.affirmation_voice_three') ? 'invalid' : '' }}">
        <label class="form-label required" for="voice_three">{{ trans('cruds.affirmation.fields.voice_three') }}</label>
        <x-dropzone id="voice_three" name="voice_three" action="{{ route('admin.affirmations.storeMedia') }}" collection-name="affirmation_voice_three" max-file-size="5" max-files="1" />
        <div class="validation-message">
            {{ $errors->first('mediaCollections.affirmation_voice_three') }}
        </div>
        <div class="help-block">
            {{ trans('cruds.affirmation.fields.voice_three_helper') }}
        </div>
    </div>
    <div class="form-group {{ $errors->has('mediaCollections.affirmation_voice_four') ? 'invalid' : '' }}">
        <label class="form-label" for="voice_four">{{ trans('cruds.affirmation.fields.voice_four') }}</label>
        <x-dropzone id="voice_four" name="voice_four" action="{{ route('admin.affirmations.storeMedia') }}" collection-name="affirmation_voice_four" max-file-size="5" max-files="1" />
        <div class="validation-message">
            {{ $errors->first('mediaCollections.affirmation_voice_four') }}
        </div>
        <div class="help-block">
            {{ trans('cruds.affirmation.fields.voice_four_helper') }}
        </div>
    </div>
    <div class="form-group {{ $errors->has('affirmation.status') ? 'invalid' : '' }}">
        <label class="form-label">{{ trans('cruds.affirmation.fields.status') }}</label>
        @foreach($this->listsForFields['status'] as $key => $value)
            <label class="radio-label"><input type="radio" name="status" wire:model="affirmation.status" value="{{ $key }}">{{ $value }}</label>
        @endforeach
        <div class="validation-message">
            {{ $errors->first('affirmation.status') }}
        </div>
        <div class="help-block">
            {{ trans('cruds.affirmation.fields.status_helper') }}
        </div>
    </div>
    <div class="form-group {{ $errors->has('group') ? 'invalid' : '' }}">
        <label class="form-label required" for="group">{{ trans('cruds.affirmation.fields.group') }}</label>
        <x-select-list class="form-control" required id="group" name="group" wire:model="group" :options="$this->listsForFields['group']" multiple />
        <div class="validation-message">
            {{ $errors->first('group') }}
        </div>
        <div class="help-block">
            {{ trans('cruds.affirmation.fields.group_helper') }}
        </div>
    </div>

    <div class="form-group {{ $errors->has('category') ? 'invalid' : '' }}">
        <label class="form-label required" for="category">{{ trans('cruds.affirmation.fields.category') }}</label>
        <x-select-list class="form-control" required id="category" name="category" wire:model="category" :options="$this->listsForFields['category']" multiple />
        <div class="validation-message">
            {{ $errors->first('group') }}
        </div>
        <div class="help-block">
            {{ trans('cruds.affirmation.fields.category_helper') }}
        </div>
    </div>

    <div class="form-group">
        <button class="btn btn-indigo mr-2" type="submit">
            {{ trans('global.save') }}
        </button>
        <a href="{{ route('admin.affirmations.index') }}" class="btn btn-secondary">
            {{ trans('global.cancel') }}
        </a>
    </div>
</form>