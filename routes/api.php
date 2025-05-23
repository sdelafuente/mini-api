<?php

use Illuminate\Support\Facades\Route;
use App\Http\Controllers\Api\PositionController;

Route::get('/hello', function () {
    return response()->json([ 'status' => 'Hello', 'timestamp' => now() ]);
});

Route::get('/goodbye', function () {
    return response()->json([ 'status' => 'Goodbye', 'timestamp' => now() ]);
});

Route::get('/positions', [PositionController::class, 'index']);
Route::post('/positions', [PositionController::class, 'store']);