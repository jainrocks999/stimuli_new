<?php

namespace App\Http\Livewire\Bgsound;

use App\Models\BgCategory;
use App\Models\Bgsound;
use Livewire\Component;
use Spatie\MediaLibrary\MediaCollections\Models\Media;

class Edit extends Component
{
    public Bgsound $bgsound;

    public array $bgcategories = [];

    public array $mediaToRemove = [];

    public array $listsForFields = [];

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
                ->update(['model_id' => $this->bgsound->id]));

        Media::whereIn('uuid', $this->mediaToRemove)->delete();
    }

    public function mount(Bgsound $bgsound)
    {
        $this->bgsound      = $bgsound;
        $this->bgcategories = $this->bgsound->bgcategories()->pluck('id')->toArray();
        $this->initListsForFields();
        $this->mediaCollections = [
            'bgsound_sound'         => $bgsound->bgsound_sound,
            'bgsound_bgsound_image' => $bgsound->bgsound_image,
        ];
    }

    public function render()
    {
        return view('livewire.bgsound.edit');
    }

    public function submit()
    {
        $this->validate();

        $this->bgsound->save();
        $this->bgsound->bgcategories()->sync($this->bgcategories);
        $this->syncMedia();

        return redirect()->route('admin.bgsounds.index');
    }

    protected function rules(): array
    {
        return [
            'bgsound.bgsound_name' => [
                'string',
                'required',
            ],
            'mediaCollections.bgsound_sound' => [
                'array',
                'required',
            ],
            'mediaCollections.bgsound_sound.*.id' => [
                'integer',
                'exists:media,id',
            ],
            'mediaCollections.bgsound_bgsound_image' => [
                'array',
                'nullable',
            ],
            'mediaCollections.bgsound_bgsound_image.*.id' => [
                'integer',
                'exists:media,id',
            ],
            'bgsound.status' => [
                'required',
                'in:' . implode(',', array_keys($this->listsForFields['status'])),
            ],
            'bgsound.is_premium' => [
                'required',
                'in:' . implode(',', array_keys($this->listsForFields['is_premium'])),
            ],
            'bgcategories' => [
                'required',
                'array',
            ],
            'bgcategories.*.id' => [
                'integer',
                'exists:bg_categories,id',
            ],
        ];
    }

    protected function initListsForFields(): void
    {
        $this->listsForFields['status']       = $this->bgsound::STATUS_RADIO;
        $this->listsForFields['is_premium']       = $this->bgsound::PREMiUM_RADIO;
        $this->listsForFields['bgcategories'] = BgCategory::pluck('bg_name', 'id')->toArray();
    }
}
