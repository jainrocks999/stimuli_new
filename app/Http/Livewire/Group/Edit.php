<?php

namespace App\Http\Livewire\Group;

use App\Models\Group;
use App\Models\Category;
use Livewire\Component;

class Edit extends Component
{
    public Group $group;

    public array $category = [];

    public array $listsForFields = [];

    public function mount(Group $group)
    {
        $this->group = $group;
        $this->category = $this->group->category()->pluck('id')->toArray();
        $this->initListsForFields();
    }

    public function render()
    {
        return view('livewire.group.edit');
    }

    public function submit()
    {
        $this->validate();
        $this->group->save();
        $this->group->category()->sync($this->category);
        return redirect()->route('admin.groups.index');
    }

    protected function rules(): array
    {
        return [
            'group.group_name' => [
                'string',
                'required',
            ],
            'group.status' => [
                'string',
                'required',
            ],
        ];
    }

    protected function initListsForFields(): void
    {
        $this->listsForFields['status'] = $this->group::STATUS_RADIO;
        $this->listsForFields['category']  = Category::pluck('categories_name', 'id')->toArray();
    }
}
