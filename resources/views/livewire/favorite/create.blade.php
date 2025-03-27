<form wire:submit.prevent="submit" class="pt-3">
    <!-- <div class="form-group {{ $errors->has('favorite.item') ? 'invalid' : '' }}">
        <label class="form-label" for="item">{{ trans('cruds.favorite.fields.item') }}</label>
        <input class="form-control" type="text" name="item" id="item" wire:model.defer="favorite.item">
        <div class="validation-message">
            {{ $errors->first('favorite.item') }}
        </div>
        <div class="help-block">
            {{ trans('cruds.favorite.fields.item_helper') }}
        </div>
    </div> -->

    <div class="form-group {{ $errors->has('user') ? 'invalid' : '' }}">
        <label class="form-label" for="user">{{ trans('cruds.favorite.fields.user') }}</label>
        <x-select-list class="form-control" id="user" name="user" wire:model="user" :options="$this->listsForFields['user']" multiple />
        <div class="validation-message">
            {{ $errors->first('user') }}
        </div>
        <div class="help-block">
            {{ trans('cruds.favorite.fields.user_helper') }}
        </div>
    </div>

    <div class="form-group {{ $errors->has('categories') ? 'invalid' : '' }}">
        <label class="form-label" for="categories">{{ trans('cruds.favorite.fields.categories') }}</label>
        <x-select-list class="form-control" id="categories" name="categories" wire:model="categories" :options="$this->listsForFields['categories']" multiple />
        <div class="validation-message">
            {{ $errors->first('categories') }}
        </div>
        <div class="help-block">
            {{ trans('cruds.favorite.fields.categories_helper') }}
        </div>
    </div>
    <div class="form-group {{ $errors->has('affirmation') ? 'invalid' : '' }}">
        <label class="form-label" for="affirmation">{{ trans('cruds.favorite.fields.affirmation') }}</label>
        <x-select-list class="form-control" id="affirmation" name="affirmation" wire:model="affirmation" :options="$this->listsForFields['affirmation']" multiple />
        <div class="validation-message">
            {{ $errors->first('affirmation') }}
        </div>
        <div class="help-block">
            {{ trans('cruds.favorite.fields.affirmation_helper') }}
        </div>
    </div>
    
    <div class="form-group">
        <button class="btn btn-indigo mr-2" type="submit">
            {{ trans('global.save') }}
        </button>
        <a href="{{ route('admin.favorites.index') }}" class="btn btn-secondary">
            {{ trans('global.cancel') }}
        </a>
    </div>
</form>