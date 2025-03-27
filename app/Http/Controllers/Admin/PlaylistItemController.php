<?php

namespace App\Http\Controllers\Admin;

use App\Http\Controllers\Controller;
use App\Models\PlaylistItem;
use Gate;
use Illuminate\Http\Request;
use Illuminate\Http\Response;

class PlaylistItemController extends Controller
{
    public function index()
    {
        abort_if(Gate::denies('playlist_item_access'), Response::HTTP_FORBIDDEN, '403 Forbidden');

        return view('admin.playlist-item.index');
    }

    public function create()
    {
        abort_if(Gate::denies('playlist_item_create'), Response::HTTP_FORBIDDEN, '403 Forbidden');

        return view('admin.playlist-item.create');
    }

    public function edit(PlaylistItem $playlistItem)
    {
        abort_if(Gate::denies('playlist_item_edit'), Response::HTTP_FORBIDDEN, '403 Forbidden');

        return view('admin.playlist-item.edit', compact('playlistItem'));
    }

    public function show(PlaylistItem $playlistItem)
    {
        abort_if(Gate::denies('playlist_item_show'), Response::HTTP_FORBIDDEN, '403 Forbidden');

        $playlistItem->load('playlist', 'affirmation');

        return view('admin.playlist-item.show', compact('playlistItem'));
    }
}