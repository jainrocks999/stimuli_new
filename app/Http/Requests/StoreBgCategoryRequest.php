<?php

namespace App\Http\Requests;

use App\Models\BgCategory;
use Gate;
use Illuminate\Foundation\Http\FormRequest;
use Illuminate\Http\Response;

class StoreBgCategoryRequest extends FormRequest
{
    public function authorize()
    {
        abort_if(
            Gate::denies('bg_category_create'),
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
            'bg_name' => [
                'string',
                'required',
            ],
            'status' => [
                'nullable',
                'in:' . implode(',', array_keys(BgCategory::STATUS_RADIO)),
            ],
        ];
    }
}
