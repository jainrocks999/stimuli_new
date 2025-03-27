<?php

namespace App\Http\Livewire\BgCategory;

use App\Models\BgCategory;
use Livewire\Component;

class Create extends Component
{
    public BgCategory $bgCategory;

    public array $listsForFields = [];

    public function mount(BgCategory $bgCategory)
    {
        $this->bgCategory = $bgCategory;
        $this->initListsForFields();
    }

    public function render()
    {
        return view('livewire.bg-category.create');
    }

    public function submit()
    {
        $this->validate();

        $this->bgCategory->save();

        return redirect()->route('admin.bg-categories.index');
    }

    protected function rules(): array
    {
        return [
            'bgCategory.bg_name' => [
                'string',
                'required',
            ],
            'bgCategory.status' => [
                'nullable',
                'in:' . implode(',', array_keys($this->listsForFields['status'])),
            ],
        ];
    }

    protected function initListsForFields(): void
    {
        $this->listsForFields['status'] = $this->bgCategory::STATUS_RADIO;
    }
}
