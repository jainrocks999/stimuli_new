<?php

namespace App\Http\Controllers\Api\V1\Admin;

use App\Http\Controllers\Controller;
use App\Http\Requests\StoreAffirmationRequest;
use App\Http\Requests\UpdateAffirmationRequest;
use App\Http\Resources\Admin\AffirmationResource;
use App\Models\Affirmation;
use Gate;
use Illuminate\Http\Request;
use Illuminate\Http\Response;

class AffirmationApiController extends Controller
{
    public function index()
    {
        abort_if(Gate::denies('affirmation_access'), Response::HTTP_FORBIDDEN, '403 Forbidden');

        return new AffirmationResource(Affirmation::with(['group'])->get());
    }

    public function store(StoreAffirmationRequest $request)
    {
        $affirmation = Affirmation::create($request->validated());
        $affirmation->group()->sync($request->input('group', []));

        return (new AffirmationResource($affirmation))
            ->response()
            ->setStatusCode(Response::HTTP_CREATED);
    }

    public function show(Affirmation $affirmation)
    {
        abort_if(Gate::denies('affirmation_show'), Response::HTTP_FORBIDDEN, '403 Forbidden');

        return new AffirmationResource($affirmation->load(['group']));
    }

    public function update(UpdateAffirmationRequest $request, Affirmation $affirmation)
    {
        $affirmation->update($request->validated());
        $affirmation->group()->sync($request->input('group', []));

        return (new AffirmationResource($affirmation))
            ->response()
            ->setStatusCode(Response::HTTP_ACCEPTED);
    }

    public function destroy(Affirmation $affirmation)
    {
        abort_if(Gate::denies('affirmation_delete'), Response::HTTP_FORBIDDEN, '403 Forbidden');

        $affirmation->delete();

        return response(null, Response::HTTP_NO_CONTENT);
    }
}
