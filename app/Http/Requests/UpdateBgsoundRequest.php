<?php

namespace App\Http\Requests;

use App\Models\Bgsound;
use Gate;
use Illuminate\Foundation\Http\FormRequest;
use Illuminate\Http\Response;

class UpdateBgsoundRequest extends FormRequest
{
    public function authorize()
    {
        abort_if(
            Gate::denies('bgsound_edit'),
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
            'bgsound_name' => [
                'string',
                'required',
            ],
            'sound' => [
                'string',
                'required',
            ],
            'status' => [
                'required',
                'in:' . implode(',', array_keys(Bgsound::STATUS_RADIO)),
            ],
            'bgcategories' => [
                'required',
                'array',
            ],
            'bgcategories.*.id' => [
                'integer',
                'exists:bg_categories,id',
            ],
        ];
    }
}
