<?php

namespace App\Http\Requests;

use App\Models\Group;
use Gate;
use Illuminate\Foundation\Http\FormRequest;
use Illuminate\Http\Response;

class UpdateGroupRequest extends FormRequest
{
    public function authorize()
    {
        abort_if(
            Gate::denies('group_edit'),
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
            'group_name' => [
                'string',
                'required',
            ],
            'status' => [
                'string',
                'required',
            ],
        ];
    }
}
