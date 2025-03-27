<?php

namespace App\Http\Requests;

use App\Models\Favorite;
use Gate;
use Illuminate\Foundation\Http\FormRequest;
use Illuminate\Http\Response;

class UpdateFavoriteRequest extends FormRequest
{
    public function authorize()
    {
        abort_if(
            Gate::denies('favorite_edit'),
            response()->json(
                ['message' => 'This action is unauthorized.'],
                Response::HTTP_FORBIDDEN
            ),
        );

        return true;
    }

    public function rules(): array
    {
        return [
            'user' => [
                'array',
            ],
            'user.*.id' => [
                'integer',
                'exists:users,id',
            ],
            'item' => [
                'string',
                'nullable',
            ],
            'item_type' => [
                'string',
                'nullable',
            ],
        ];
    }
}