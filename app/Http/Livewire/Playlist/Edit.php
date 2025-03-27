<?php

namespace App\Http\Livewire\Playlist;

use App\Models\Playlist;
use App\Models\User;
use Livewire\Component;

class Edit extends Component
{
    public array $user = [];

    public Playlist $playlist;

    public array $listsForFields = [];

    public function mount(Playlist $playlist)
    {
        $this->playlist = $playlist;
        $this->user     = $this->playlist->user()->pluck('id')->toArray();
        $this->initListsForFields();
    }

    public function render()
    {
        return view('livewire.playlist.edit');
    }

    public function submit()
    {
        $this->validate();

        $this->playlist->save();
        $this->playlist->user()->sync($this->user);

        return redirect()->route('admin.playlists.index');
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
            'playlist.title' => [
                'string',
                'nullable',
            ],
            'playlist.description' => [
                'string',
                'nullable',
            ],
        ];
    }

    protected function initListsForFields(): void
    {
        $this->listsForFields['user'] = User::pluck('name', 'id')->toArray();
    }
}