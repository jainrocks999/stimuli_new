<?php

namespace App\Http\Livewire\Group;

use App\Models\Group;
use App\Models\Category;
use App\Models\CategorieGroups;
use Livewire\Component;

class Create extends Component
{
    public Group $group;
    public $category = [];   
    public array $listsForFields = [];

    public function mount(Group $group)
    {
        $this->group = $group;
        $this->category  = Category::pluck('categories_name', 'id')->toArray();
        $this->initListsForFields();
    }

    public function render()
    {
        return view('livewire.group.create');
    }

    public function submit()
    {
        $this->validate();
        $data = [
            'group_name' => $this->group->group_name,
            'status' => $this->group->status,
            'created_at' => date('Y-m-d')
        ];
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
