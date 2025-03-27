<?php

namespace App\Http\Livewire\Favorite;

use App\Models\Favorite;
use App\Models\User;
use App\Models\Affirmation;
use App\Models\Category;
use Livewire\Component;

class Edit extends Component
{
    public array $user = [];
    public array $affirmation = [];
    public array $categories = [];

    public Favorite $favorite;

    public array $listsForFields = [];

    public function mount(Favorite $favorite)
    {
        $this->favorite = $favorite;
        $this->user     = $this->favorite->user()->pluck('id')->toArray();
        $this->affirmation     = $this->favorite->affirmation()->pluck('id')->toArray();
        $this->categories     = $this->favorite->categories()->pluck('id')->toArray();
        $this->initListsForFields();
    }

    public function render()
    {
        return view('livewire.favorite.edit');
    }

    public function submit()
    {
        $this->validate();

        $this->favorite->save();
        $this->favorite->user()->sync($this->user);
        $this->favorite->affirmation()->sync($this->affirmation);
        $this->favorite->categories()->sync($this->categories);

        return redirect()->route('admin.favorites.index');
    }

    protected function rules(): array
    {
        return [
            'user' => [
                'array',
            ],
            'user.*.id' => [
                'integer',
                'exists:users,id',
            ],
            'favorite.item' => [
                'string',
                'nullable',
            ],
        ];
    }

    protected function initListsForFields(): void
    {
        $this->listsForFields['user'] = User::pluck('name', 'id')->toArray();
        $this->listsForFields['affirmation'] = Affirmation::pluck('affirmation_text', 'id')->toArray();
        $this->listsForFields['categories'] = Category::pluck('categories_name', 'id')->toArray();
    }
}