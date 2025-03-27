<?php

namespace App\Http\Controllers\Admin;

use App\Http\Controllers\Controller;
use App\Models\Affirmation;
use Gate;
use Illuminate\Http\Request;
use Illuminate\Http\Response;

class AffirmationController extends Controller
{
    public function index()
    {
        abort_if(Gate::denies('affirmation_access'), Response::HTTP_FORBIDDEN, '403 Forbidden');

        return view('admin.affirmation.index');
    }

    public function create()
    {
        abort_if(Gate::denies('affirmation_create'), Response::HTTP_FORBIDDEN, '403 Forbidden');

        return view('admin.affirmation.create');
    }

    public function edit(Affirmation $affirmation)
    {
        abort_if(Gate::denies('affirmation_edit'), Response::HTTP_FORBIDDEN, '403 Forbidden');

        return view('admin.affirmation.edit', compact('affirmation'));
    }

    public function show(Affirmation $affirmation)
    {
        abort_if(Gate::denies('affirmation_show'), Response::HTTP_FORBIDDEN, '403 Forbidden');

        $affirmation->load('group');

        return view('admin.affirmation.show', compact('affirmation'));
    }

    public function storeMedia(Request $request)
    {
        abort_if(Gate::none(['affirmation_create', 'affirmation_edit']), Response::HTTP_FORBIDDEN, '403 Forbidden');
        if ($request->has('size')) {
            $this->validate($request, [
                'file' => 'max:' . $request->input('size') * 1024,
            ]);
        }

        $model                     = new Affirmation();
        $model->id                 = $request->input('model_id', 0);
        $model->exists             = true;
        $media                     = $model->addMediaFromRequest('file')->toMediaCollection($request->input('collection_name'));
        $media->wasRecentlyCreated = true;

        return response()->json(compact('media'), Response::HTTP_CREATED);
    }
}
