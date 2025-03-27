<?php

namespace App\Http\Livewire\Affirmation;

use App\Http\Livewire\WithConfirmation;
use App\Http\Livewire\WithSorting;
use App\Models\Affirmation;
use Illuminate\Http\Response;
use Illuminate\Support\Facades\Gate;
use Livewire\Component;
use Livewire\WithPagination;

class Index extends Component
{
    use WithPagination, WithSorting, WithConfirmation;

    public int $perPage;

    public array $orderable;

    public string $search = '';

    public array $selected = [];

    public array $paginationOptions;

    protected $queryString = [
        'search' => [
            'except' => '',
        ],
        'sortBy' => [
            'except' => 'id',
        ],
        'sortDirection' => [
            'except' => 'desc',
        ],
    ];

    public function getSelectedCountProperty()
    {
        return count($this->selected);
    }

    public function updatingSearch()
    {
        $this->resetPage();
    }

    public function updatingPerPage()
    {
        $this->resetPage();
    }

    public function resetSelected()
    {
        $this->selected = [];
    }

    public function mount()
    {
        $this->sortBy            = 'id';
        $this->sortDirection     = 'desc';
        $this->perPage           = 100;
        $this->paginationOptions = config('project.pagination.options');
        $this->orderable         = (new Affirmation())->orderable;
    }

    public function render()
    {
        $query = Affirmation::with(['group'])->advancedFilter([
            's'               => $this->search ?: null,
            'order_column'    => $this->sortBy,
            'order_direction' => $this->sortDirection,
        ]);

        $affirmations = $query->paginate($this->perPage);

        return view('livewire.affirmation.index', compact('affirmations', 'query'));
    }

    public function deleteSelected()
    {
        abort_if(Gate::denies('affirmation_delete'), Response::HTTP_FORBIDDEN, '403 Forbidden');

        Affirmation::whereIn('id', $this->selected)->delete();

        $this->resetSelected();
    }

    public function delete(Affirmation $affirmation)
    {
        abort_if(Gate::denies('affirmation_delete'), Response::HTTP_FORBIDDEN, '403 Forbidden');

        $affirmation->delete();
    }
}
