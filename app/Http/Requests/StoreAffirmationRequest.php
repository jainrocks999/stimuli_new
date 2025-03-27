<?php

namespace App\Http\Requests;

use App\Models\Affirmation;
use Gate;
use Illuminate\Foundation\Http\FormRequest;
use Illuminate\Http\Response;

class StoreAffirmationRequest extends FormRequest
{
    public function authorize()
    {
        abort_if(
            Gate::denies('affirmation_create'),
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
            'affirmation_text' => [
                'string',
                'required',
            ],
            'voice_one' => [
                'string',
                'required',
            ],
            'voice_two' => [
                'string',
                'required',
            ],
            'voice_three' => [
                'string',
                'required',
            ],
            'voice_four' => [
                'string',
                'required',
            ],
            'status' => [
                'nullable',
                'in:' . implode(',', array_keys(Affirmation::STATUS_RADIO)),
            ],
            'group' => [
                'required',
                'array',
            ],
            'group.*.id' => [
                'integer',
                'exists:groups,id',
            ],
        ];
    }
}
