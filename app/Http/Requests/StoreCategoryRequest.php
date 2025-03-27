<?php

namespace App\Http\Requests;

use App\Models\Category;
use Gate;
use Illuminate\Foundation\Http\FormRequest;
use Illuminate\Http\Response;

class StoreCategoryRequest extends FormRequest
{
    public function authorize()
    {
        abort_if(
            Gate::denies('category_create'),
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
            'categories_name' => [
                'string',
                'required',
            ],
            'status' => [
                'nullable',
                'in:' . implode(',', array_keys(Category::STATUS_RADIO)),
            ],
        ];
    }
}
