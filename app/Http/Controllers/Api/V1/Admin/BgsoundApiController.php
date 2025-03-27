<?php

namespace App\Http\Controllers\Api\V1\Admin;

use App\Http\Controllers\Controller;
use App\Http\Controllers\Traits\MediaUploadTrait;
use App\Http\Requests\StoreBgsoundRequest;
use App\Http\Requests\UpdateBgsoundRequest;
use App\Http\Resources\Admin\BgsoundResource;
use App\Models\Bgsound;
use Gate;
use Illuminate\Http\Request;
use Illuminate\Http\Response;

class BgsoundApiController extends Controller
{
    use MediaUploadTrait;

    public function index()
    {
        abort_if(Gate::denies('bgsound_access'), Response::HTTP_FORBIDDEN, '403 Forbidden');

        return new BgsoundResource(Bgsound::with(['bgcategories'])->get());
    }

    public function store(StoreBgsoundRequest $request)
    {
        $bgsound = Bgsound::create($request->validated());
        $bgsound->bgcategories()->sync($request->input('bgcategories', []));
        if ($request->input('bgsound_bgsound_image', false)) {
            $bgsound->addMedia(storage_path('tmp/uploads/' . basename($request->input('bgsound_bgsound_image'))))->toMediaCollection('bgsound_bgsound_image');
        }

        return (new BgsoundResource($bgsound))
            ->response()
            ->setStatusCode(Response::HTTP_CREATED);
    }

    public function show(Bgsound $bgsound)
    {
        abort_if(Gate::denies('bgsound_show'), Response::HTTP_FORBIDDEN, '403 Forbidden');

        return new BgsoundResource($bgsound->load(['bgcategories']));
    }

    public function update(UpdateBgsoundRequest $request, Bgsound $bgsound)
    {
        $bgsound->update($request->validated());
        $bgsound->bgcategories()->sync($request->input('bgcategories', []));
        if ($request->input('bgsound_bgsound_image', false)) {
            if (! $bgsound->bgsound_bgsound_image || $request->input('bgsound_bgsound_image') !== $bgsound->bgsound_bgsound_image->file_name) {
                if ($bgsound->bgsound_bgsound_image) {
                    $bgsound->bgsound_bgsound_image->delete();
                }
                $bgsound->addMedia(storage_path('tmp/uploads/' . basename($request->input('bgsound_bgsound_image'))))->toMediaCollection('bgsound_bgsound_image');
            }
        } elseif ($bgsound->bgsound_bgsound_image) {
            $bgsound->bgsound_bgsound_image->delete();
        }

        return (new BgsoundResource($bgsound))
            ->response()
            ->setStatusCode(Response::HTTP_ACCEPTED);
    }

    public function destroy(Bgsound $bgsound)
    {
        abort_if(Gate::denies('bgsound_delete'), Response::HTTP_FORBIDDEN, '403 Forbidden');

        $bgsound->delete();

        return response(null, Response::HTTP_NO_CONTENT);
    }
}
