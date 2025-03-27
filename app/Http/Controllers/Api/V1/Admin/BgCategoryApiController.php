<?php

namespace App\Http\Controllers\Api\V1\Admin;

use App\Http\Controllers\Controller;
use App\Http\Requests\StoreBgCategoryRequest;
use App\Http\Requests\UpdateBgCategoryRequest;
use App\Http\Resources\Admin\BgCategoryResource;
use App\Models\BgCategory;
use Gate;
use Illuminate\Http\Request;
use Illuminate\Http\Response;

class BgCategoryApiController extends Controller
{
    public function index()
    {
        abort_if(Gate::denies('bg_category_access'), Response::HTTP_FORBIDDEN, '403 Forbidden');

        return new BgCategoryResource(BgCategory::all());
    }

    public function store(StoreBgCategoryRequest $request)
    {
        $bgCategory = BgCategory::create($request->validated());

        return (new BgCategoryResource($bgCategory))
            ->response()
            ->setStatusCode(Response::HTTP_CREATED);
    }

    public function show(BgCategory $bgCategory)
    {
        abort_if(Gate::denies('bg_category_show'), Response::HTTP_FORBIDDEN, '403 Forbidden');

        return new BgCategoryResource($bgCategory);
    }

    public function update(UpdateBgCategoryRequest $request, BgCategory $bgCategory)
    {
        $bgCategory->update($request->validated());

        return (new BgCategoryResource($bgCategory))
            ->response()
            ->setStatusCode(Response::HTTP_ACCEPTED);
    }

    public function destroy(BgCategory $bgCategory)
    {
        abort_if(Gate::denies('bg_category_delete'), Response::HTTP_FORBIDDEN, '403 Forbidden');

        $bgCategory->delete();

        return response(null, Response::HTTP_NO_CONTENT);
    }
}
