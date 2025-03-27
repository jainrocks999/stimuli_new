<?php

namespace App\Http\Livewire\Category;

use App\Models\Category;
use Livewire\Component;
use App\Models\Group;
use Spatie\MediaLibrary\MediaCollections\Models\Media;

class Edit extends Component
{
    public Category $category;

    public array $group = [];

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
                ->update(['model_id' => $this->category->id]));

        Media::whereIn('uuid', $this->mediaToRemove)->delete();
    }

    public function mount(Category $category)
    {
        $this->category = $category;
        $this->initListsForFields();
        $this->mediaCollections = [
            'category_categories_image' => $category->categories_image,
        ];
        $this->group = $this->category->group()->pluck('id')->toArray();
    }

    public function render()
    {
        return view('livewire.category.edit');
    }

    public function submit()
    {
        $this->validate();

        $this->category->save();
        $this->syncMedia();
        $this->category->group()->sync($this->group);

        return redirect()->route('admin.categories.index');
    }

    protected function rules(): array
    {
        return [
            'category.categories_name' => [
                'string',
                'required',
            ],
            // 'mediaCollections.category_categories_image' => [
            //     'array',
            //     'required',
            // ],
            // 'mediaCollections.category_categories_image.*.id' => [
            //     'integer',
            //     'exists:media,id',
            // ],
            'category.status' => [
                'nullable',
                'in:' . implode(',', array_keys($this->listsForFields['status'])),
            ],
        ];
    }

    protected function initListsForFields(): void
    {
        $this->listsForFields['status'] = $this->category::STATUS_RADIO;
        $this->listsForFields['group']  = Group::pluck('group_name', 'id')->toArray();
    }
}
