<?php

use Illuminate\Support\Facades\Route;
use App\Http\Controllers\Api\PositionController;

Route::get('/hello', function () {
    return response()->json([ 'status' => 'Hello', 'timestamp' => now() ]);
});

Route::get('/positions', [PositionController::class, 'index'])->name('positions');
Route::post('/positions', [PositionController::class, 'store'])->name('positions');