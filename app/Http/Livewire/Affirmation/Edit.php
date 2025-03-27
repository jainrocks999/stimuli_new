<?php

namespace App\Http\Livewire\Affirmation;

use App\Models\Affirmation;
use App\Models\Group;
use App\Models\Category;
use Livewire\Component;
use Spatie\MediaLibrary\MediaCollections\Models\Media;

class Edit extends Component
{
    public array $group = [];

    public array $category = [];

    public Affirmation $affirmation;

    public array $listsForFields = [];

    public array $mediaToRemove = [];

    public array $mediaCollections = [];

    public function addMedia($media): void
    {
        $this->mediaCollections[$media['collection_name']][] = $media;
    }

    public function removeMedia($media): void
    {
        $collection = collect($this->mediaCollections[$media['collection_name']]);

        $this->mediaCollections[$media['collection_name']] = $collection->reject(fn ($item) => $item['uuid'] === $media['uuid'])->toArray();

        $this->mediaToRemove[] = $media['uuid'];
    }

    public function getMediaCollection($name)
    {
        return $this->mediaCollections[$name];
    }

    protected function syncMedia(): void
    {
        collect($this->mediaCollections)->flatten(1)
            ->each(fn ($item) => Media::where('uuid', $item['uuid'])
                ->update(['model_id' => $this->affirmation->id]));

        Media::whereIn('uuid', $this->mediaToRemove)->delete();
    }

    public function mount(Affirmation $affirmation)
    {
        $this->affirmation = $affirmation;
        $this->group       = $this->affirmation->group()->pluck('id')->toArray();
        $this->category    = $this->affirmation->category()->pluck('id')->toArray();
        $this->initListsForFields();
        $this->mediaCollections = [
            'affirmation_voice_one'     => $affirmation->voice_one,
            'affirmation_voice_two'     => $affirmation->voice_two,
            'affirmation_voice_three'   => $affirmation->voice_three,
            'affirmation_voice_four'    => $affirmation->voice_four,
        ];
    }

    public function render()
    {
        return view('livewire.affirmation.edit');
    }

    public function submit()
    {
        $this->validate();
        $this->affirmation->save();
        $this->affirmation->group()->sync($this->group);
        $this->affirmation->category()->sync($this->category);
        $this->syncMedia();
        return redirect()->route('admin.affirmations.index');
    }

    protected function rules(): array
    {
        return [
            'affirmation.affirmation_text' => [
                'string',
                'required',
            ],
            'mediaCollections.affirmation_voice_one' => [
                'array',
                'required',
            ],
            'mediaCollections.affirmation_voice_one.*.id' => [
                'integer',
                'exists:media,id',
            ],
            'mediaCollections.affirmation_voice_two' => [
                'array',
                'nullable',
            ],
            'mediaCollections.affirmation_voice_two.*.id' => [
                'integer',
                'exists:media,id',
            ],
            'mediaCollections.affirmation_voice_three' => [
                'array',
                'required',
            ],
            'mediaCollections.affirmation_voice_three.*.id' => [
                'integer',
                'exists:media,id',
            ],
            'mediaCollections.affirmation_voice_four' => [
                'array',
                'nullable',
            ],
            'mediaCollections.affirmation_voice_four.*.id' => [
                'integer',
                'exists:media,id',
            ],
            'affirmation.status' => [
                'nullable',
                'in:' . implode(',', array_keys($this->listsForFields['status'])),
            ],
            'group' => [
                'required',
                'array',
            ],
            'group.*.id' => [
                'integer',
                'exists:groups,id',
            ],
        ];
    }

    protected function initListsForFields(): void
    {
        $this->listsForFields['status'] = $this->affirmation::STATUS_RADIO;
        $this->listsForFields['group']  = Group::pluck('group_name', 'id')->toArray();
        $this->listsForFields['category']  = Category::pluck('categories_name', 'id')->toArray();
    }
}
