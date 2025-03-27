<form wire:submit.prevent="submit" class="pt-3">

    <div class="form-group {{ $errors->has('user.first_name') ? 'invalid' : '' }}">
        <label class="form-label required" for="first_name">{{ trans('cruds.user.fields.first_name') }}</label>
        <input class="form-control" type="text" name="first_name" id="first_name" required wire:model.defer="user.first_name">
        <div class="validation-message">
            {{ $errors->first('user.first_name') }}
        </div>
        <div class="help-block">
            {{ trans('cruds.user.fields.first_name_helper') }}
        </div>
    </div>
    <div class="form-group {{ $errors->has('user.last_name') ? 'invalid' : '' }}">
        <label class="form-label required" for="last_name">{{ trans('cruds.user.fields.last_name') }}</label>
        <input class="form-control" type="text" name="last_name" id="last_name" required wire:model.defer="user.last_name">
        <div class="validation-message">
            {{ $errors->first('user.last_name') }}
        </div>
        <div class="help-block">
            {{ trans('cruds.user.fields.last_name_helper') }}
        </div>
    </div>
    <div class="form-group {{ $errors->has('user.mobile_no') ? 'invalid' : '' }}">
        <label class="form-label required" for="mobile_no">{{ trans('cruds.user.fields.mobile_no') }}</label>
        <input class="form-control" type="text" name="mobile_no" id="mobile_no" required wire:model.defer="user.mobile_no">
        <div class="validation-message">
            {{ $errors->first('user.mobile_no') }}
        </div>
        <div class="help-block">
            {{ trans('cruds.user.fields.mobile_no_helper') }}
        </div>
    </div>
    <div class="form-group {{ $errors->has('user.name') ? 'invalid' : '' }}">
        <label class="form-label required" for="name">{{ trans('cruds.user.fields.name') }}</label>
        <input class="form-control" type="text" name="name" id="name" required wire:model.defer="user.name">
        <div class="validation-message">
            {{ $errors->first('user.name') }}
        </div>
        <div class="help-block">
            {{ trans('cruds.user.fields.name_helper') }}
        </div>
    </div>
    <div class="form-group {{ $errors->has('user.email') ? 'invalid' : '' }}">
        <label class="form-label required" for="email">{{ trans('cruds.user.fields.email') }}</label>
        <input class="form-control" type="email" name="email" id="email" required wire:model.defer="user.email">
        <div class="validation-message">
            {{ $errors->first('user.email') }}
        </div>
        <div class="help-block">
            {{ trans('cruds.user.fields.email_helper') }}
        </div>
    </div>
    <div class="form-group {{ $errors->has('user.password') ? 'invalid' : '' }}">
        <label class="form-label required" for="password">{{ trans('cruds.user.fields.password') }}</label>
        <input class="form-control" type="password" name="password" id="password" required wire:model.defer="password">
        <div class="validation-message">
            {{ $errors->first('user.password') }}
        </div>
        <div class="help-block">
            {{ trans('cruds.user.fields.password_helper') }}
        </div>
    </div>
    <div class="form-group {{ $errors->has('roles') ? 'invalid' : '' }}">
        <label class="form-label required" for="roles">{{ trans('cruds.user.fields.roles') }}</label>
        <x-select-list class="form-control" required id="roles" name="roles" wire:model="roles" :options="$this->listsForFields['roles']" multiple />
        <div class="validation-message">
            {{ $errors->first('roles') }}
        </div>
        <div class="help-block">
            {{ trans('cruds.user.fields.roles_helper') }}
        </div>
    </div>
    <div class="form-group {{ $errors->has('user.locale') ? 'invalid' : '' }}">
        <label class="form-label" for="locale">{{ trans('cruds.user.fields.locale') }}</label>
        <input class="form-control" type="text" name="locale" id="locale" wire:model.defer="user.locale">
        <div class="validation-message">
            {{ $errors->first('user.locale') }}
        </div>
        <div class="help-block">
            {{ trans('cruds.user.fields.locale_helper') }}
        </div>
    </div>
    <div class="form-group {{ $errors->has('user.status') ? 'invalid' : '' }}">
        <label class="form-label">{{ trans('cruds.user.fields.status') }}</label>
        @foreach($this->listsForFields['status'] as $key => $value)
            <label class="radio-label"><input type="radio" name="status" wire:model="user.status" value="{{ $key }}">{{ $value }}</label>
        @endforeach
        <div class="validation-message">
            {{ $errors->first('user.status') }}
        </div>
        <div class="help-block">
            {{ trans('cruds.user.fields.status_helper') }}
        </div>
    </div>
    <div class="form-group {{ $errors->has('categories') ? 'invalid' : '' }}">
        <label class="form-label required" for="categories">{{ trans('cruds.user.fields.categories') }}</label>
        <x-select-list class="form-control" required id="categories" name="categories" wire:model="categories" :options="$this->listsForFields['categories']" multiple />
        <div class="validation-message">
            {{ $errors->first('categories') }}
        </div>
        <div class="help-block">
            {{ trans('cruds.user.fields.categories_helper') }}
        </div>
    </div>

    <div class="form-group">
        <button class="btn btn-indigo mr-2" type="submit">
            {{ trans('global.save') }}
        </button>
        <a href="{{ route('admin.users.index') }}" class="btn btn-secondary">
            {{ trans('global.cancel') }}
        </a>
    </div>
</form>