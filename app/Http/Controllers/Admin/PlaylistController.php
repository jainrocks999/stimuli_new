<?php

namespace App\Http\Controllers\Admin;

use App\Http\Controllers\Controller;
use App\Models\Playlist;
use Gate;
use Illuminate\Http\Request;
use Illuminate\Http\Response;

class PlaylistController extends Controller
{
    public function index()
    {
        abort_if(Gate::denies('playlist_access'), Response::HTTP_FORBIDDEN, '403 Forbidden');

        return view('admin.playlist.index');
    }

    public function create()
    {
        abort_if(Gate::denies('playlist_create'), Response::HTTP_FORBIDDEN, '403 Forbidden');

        return view('admin.playlist.create');
    }

    public function edit(Playlist $playlist)
    {
        abort_if(Gate::denies('playlist_edit'), Response::HTTP_FORBIDDEN, '403 Forbidden');

        return view('admin.playlist.edit', compact('playlist'));
    }

    public function show(Playlist $playlist)
    {
        abort_if(Gate::denies('playlist_show'), Response::HTTP_FORBIDDEN, '403 Forbidden');

        $playlist->load('user');

        return view('admin.playlist.show', compact('playlist'));
    }
}