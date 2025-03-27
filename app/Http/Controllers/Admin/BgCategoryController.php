<?php

namespace App\Http\Controllers\Admin;

use App\Http\Controllers\Controller;
use App\Models\BgCategory;
use Gate;
use Illuminate\Http\Request;
use Illuminate\Http\Response;

class BgCategoryController extends Controller
{
    public function index()
    {
        abort_if(Gate::denies('bg_category_access'), Response::HTTP_FORBIDDEN, '403 Forbidden');

        return view('admin.bg-category.index');
    }

    public function create()
    {
        abort_if(Gate::denies('bg_category_create'), Response::HTTP_FORBIDDEN, '403 Forbidden');

        return view('admin.bg-category.create');
    }

    public function edit(BgCategory $bgCategory)
    {
        abort_if(Gate::denies('bg_category_edit'), Response::HTTP_FORBIDDEN, '403 Forbidden');

        return view('admin.bg-category.edit', compact('bgCategory'));
    }

    public function show(BgCategory $bgCategory)
    {
        abort_if(Gate::denies('bg_category_show'), Response::HTTP_FORBIDDEN, '403 Forbidden');

        return view('admin.bg-category.show', compact('bgCategory'));
    }
}
