<?php

namespace App\Http\Livewire\User;

use App\Models\Category;
use App\Models\Role;
use App\Models\User;
use Livewire\Component;

class Edit extends Component
{
    public User $user;

    public array $roles = [];

    public string $password = '';

    public array $categories = [];

    public array $listsForFields = [];

    public function mount(User $user)
    {
        $this->user       = $user;
        $this->roles      = $this->user->roles()->pluck('id')->toArray();
       // $this->categories = $this->user->categories()->pluck('id')->toArray();
        $this->initListsForFields();
    }

    public function render()
    {
        return view('livewire.user.edit');
    }

    public function submit()
    {
        $this->validate();
        $this->user->password = $this->password;
        $this->user->save();
        $this->user->roles()->sync($this->roles);
        // $this->user->categories()->sync($this->categories);

        return redirect()->route('admin.users.index');
    }

    protected function rules(): array
    {
        return [
            'user.first_name' => [
                'string',
                'required',
            ],
            'user.last_name' => [
                'string',
                'required',
            ],
            'user.mobile_no' => [
                'string',
                'min:6',
                'max:10',
                'required',
            ],
            'user.name' => [
                'string',
                'required',
            ],
            'user.email' => [
                'email:rfc',
                'required',
                'unique:users,email,' . $this->user->id,
            ],
            'password' => [
                'string',
            ],
            'roles' => [
                'required',
                'array',
            ],
            'roles.*.id' => [
                'integer',
                'exists:roles,id',
            ],
            'user.locale' => [
                'string',
                'nullable',
            ],
            'user.status' => [
                'nullable',
                'in:' . implode(',', array_keys($this->listsForFields['status'])),
            ],
            // 'categories' => [
            //     'required',
            //     'array',
            // ],
            // 'categories.*.id' => [
            //     'integer',
            //     'exists:categories,id',
            // ],
        ];
    }

    protected function initListsForFields(): void
    {
        $this->listsForFields['roles']      = Role::pluck('title', 'id')->toArray();
        $this->listsForFields['status']     = $this->user::STATUS_RADIO;
        // $this->listsForFields['categories'] = Category::pluck('categories_name', 'id')->toArray();
    }
}
