<form wire:submit.prevent="submit" class="pt-3">
    
    <div class="form-group {{ $errors->has('playlistItem.category_id') ? 'invalid' : '' }}">
        <label class="form-label" for="categories">{{ trans('cruds.playlistItem.fields.categories') }}</label>
        <x-select-list class="form-control"  id="category_id" name="category_id"  wire:model="playlistItem.category_id" :options="$this->listsForFields['category']" />
        <div class="validation-message">
            {{ $errors->first('categories') }}
        </div>
        <div class="help-block">
            {{ trans('cruds.playlistItem.fields.categories_helper') }}
        </div>
    </div>

    <div class="form-group {{ $errors->has('playlistItem.playlist_id') ? 'invalid' : '' }}">
        <label class="form-label" for="playlist">{{ trans('cruds.playlistItem.fields.playlist') }}</label>
        <x-select-list class="form-control" id="playlist" name="playlist" :options="$this->listsForFields['playlist']" wire:model="playlistItem.playlist_id" />
        <div class="validation-message">
            {{ $errors->first('playlistItem.playlist_id') }}
        </div>
        <div class="help-block">
            {{ trans('cruds.playlistItem.fields.playlist_helper') }}
        </div>
    </div>
    <div class="form-group {{ $errors->has('playlistItem.affirmation_id') ? 'invalid' : '' }}">
        <label class="form-label required" for="affirmation">{{ trans('cruds.playlistItem.fields.affirmation') }}</label>
        <x-select-list class="form-control" required id="affirmation" name="affirmation" :options="$this->listsForFields['affirmation']" wire:model="playlistItem.affirmation_id" />
        <div class="validation-message">
            {{ $errors->first('playlistItem.affirmation_id') }}
        </div>
        <div class="help-block">
            {{ trans('cruds.playlistItem.fields.affirmation_helper') }}
        </div>
    </div>

    <div class="form-group">
        <button class="btn btn-indigo mr-2" type="submit">
            {{ trans('global.save') }}
        </button>
        <a href="{{ route('admin.playlist-items.index') }}" class="btn btn-secondary">
            {{ trans('global.cancel') }}
        </a>
    </div>
</form>