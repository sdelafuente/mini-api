<?php

namespace App\Http\Controllers\Api;

use App\Http\Controllers\Controller;
use App\Models\Position;
use Illuminate\Http\Request;

class PositionController extends Controller
{
    public function index()
    {
        $positions = Position::when(request()->has('search'), function($query) {
            $query->search(request()->get('search','algo'));
        })->get();

        return response()->json(['positions' => $positions]);
    }

    public function store(Request $request)
    {
        try {
            $validated = $request->validate([
                'name' => 'required|string|min:10, max:255',
                'description'  => 'required|string|min:100',
                'location'  => 'nullable|string|min:3,max:50',
                'salary'  => 'required|integer|between:1,1000000',
            ]);
        } catch (\Illuminate\Validation\ValidationException $th) {
            return $th->validator->errors();
        }

        $post = Position::create([
            'name' => $validated['name'],
            'description'  => $validated['description'],
            'location'  => $validated['location'],
            'salary'  => $validated['salary'],
       ]);

        return response()->json(["position" => $post], 201);
    }
}
