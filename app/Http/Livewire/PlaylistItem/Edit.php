<?php

namespace App\Http\Livewire\PlaylistItem;

use App\Models\Affirmation;
use App\Models\Playlist;
use App\Models\PlaylistItem;
use App\Models\Category;
use Livewire\Component;

class Edit extends Component
{
    public array $listsForFields = [];

    public PlaylistItem $playlistItem;

    public Category $category;

    public function mount(PlaylistItem $playlistItem)
    {
        $this->playlistItem = $playlistItem;
        $this->initListsForFields();
    }

    public function render()
    {
        return view('livewire.playlist-item.edit');
    }

    public function submit()
    {
        $this->validate();
        if($this->playlistItem->category_id == null){
            $this->playlistItem->category_id = 0;
        }
        $this->playlistItem->save();

        return redirect()->route('admin.playlist-items.index');
    }

    protected function rules(): array
    {
        return [
            'playlistItem.playlist_id' => [
                'integer',
                'exists:playlists,id',
                'nullable',
            ],
            'playlistItem.affirmation_id' => [
                'integer',
                'exists:affirmations,id',
                'required',
            ],
            'playlistItem.category_id' => [
                'integer',
                'exists:categories,id',
                'nullable',
            ]
        ];
    }

    protected function initListsForFields(): void
    {
        $this->listsForFields['playlist']    = Playlist::pluck('title', 'id')->toArray();
        $this->listsForFields['affirmation'] = Affirmation::pluck('affirmation_text', 'id')->toArray();
        $this->listsForFields['category']  = Category::pluck('categories_name', 'id')->toArray();
    }
}