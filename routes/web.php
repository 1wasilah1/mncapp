<?php

use Illuminate\Support\Facades\Route;

/*
|--------------------------------------------------------------------------
| Web Routes
|--------------------------------------------------------------------------
|
| Here is where you can register web routes for your application. These
| routes are loaded by the RouteServiceProvider within a group which
| contains the "web" middleware group. Now create something great!
|
*/
use App\Http\Controllers\produkController;


Route::get('/', function () {
    return view('welcome');
});

Route::get('/produk', [produkController::class, 'indexList']);
Route::get('/create', [produkController::class, 'indexCreate']);

Route::get('/produk/listProduk', [produkController::class, 'listProduk']);
Route::get('/produk/listProdukByKeyword', [produkController::class, 'listProdukByKeyword']);
Route::get('/produk/listProdukByKategori', [produkController::class, 'listProdukByKategori']);


Route::get('/produk/listProdukDetail', [produkController::class, 'listProdukDetail']);

Route::GET('/produk/storeProduk', [produkController::class, 'storeProduk']);


Route::get('/produk/DeleteProduk', [produkController::class, 'DeleteProduk']);
