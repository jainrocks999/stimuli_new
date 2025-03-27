<form wire:submit.prevent="submit" class="pt-3">

    <div class="form-group {{ $errors->has('user') ? 'invalid' : '' }}">
        <label class="form-label" for="user">{{ trans('cruds.playlist.fields.user') }}</label>
        <x-select-list class="form-control" id="user" name="user" wire:model="user" :options="$this->listsForFields['user']" multiple />
        <div class="validation-message">
            {{ $errors->first('user') }}
        </div>
        <div class="help-block">
            {{ trans('cruds.playlist.fields.user_helper') }}
        </div>
    </div>
    <div class="form-group {{ $errors->has('playlist.title') ? 'invalid' : '' }}">
        <label class="form-label" for="title">{{ trans('cruds.playlist.fields.title') }}</label>
        <input class="form-control" type="text" name="title" id="title" wire:model.defer="playlist.title">
        <div class="validation-message">
            {{ $errors->first('playlist.title') }}
        </div>
        <div class="help-block">
            {{ trans('cruds.playlist.fields.title_helper') }}
        </div>
    </div>
    <div class="form-group {{ $errors->has('playlist.description') ? 'invalid' : '' }}">
        <label class="form-label" for="description">{{ trans('cruds.playlist.fields.description') }}</label>
        <textarea class="form-control" name="description" id="description" wire:model.defer="playlist.description" rows="4"></textarea>
        <div class="validation-message">
            {{ $errors->first('playlist.description') }}
        </div>
        <div class="help-block">
            {{ trans('cruds.playlist.fields.description_helper') }}
        </div>
    </div>

    <div class="form-group">
        <button class="btn btn-indigo mr-2" type="submit">
            {{ trans('global.save') }}
        </button>
        <a href="{{ route('admin.playlists.index') }}" class="btn btn-secondary">
            {{ trans('global.cancel') }}
        </a>
    </div>
</form>