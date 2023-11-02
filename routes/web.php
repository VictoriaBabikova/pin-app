<?php

use Illuminate\Support\Facades\Route;
use App\Http\Controllers\LoginController;
use App\Http\Controllers\ProductController;
use App\Http\Controllers\RegistrationController;

/*
|--------------------------------------------------------------------------
| Web Routes
|--------------------------------------------------------------------------
|
| Here is where you can register web routes for your application. These
| routes are loaded by the RouteServiceProvider and all of them will
| be assigned to the "web" middleware group. Make something great!
|
*/

Route::get('/', function () { return view('product.title', ['title' => 'title']); });

Route::get('/products', [ProductController::class, 'index'])->name('products.index');
Route::get('/products/create', [ProductController::class, 'create'])->name('products.create');
Route::post('/products/store', [ProductController::class, 'store'])->name('products.store');
Route::get('/products/show/{id}', [ProductController::class, 'show'])->name('products.show');
Route::get('/products/edit/{id}', [ProductController::class, 'edit'])->name('products.edit');
Route::post('/products/update', [ProductController::class, 'update'])->name('products.update');
Route::get('/products/destroy/{id}', [ProductController::class, 'destroy'])->name('products.destroy');

Route::get('/registration', [RegistrationController::class, 'showRegisterPage'])->name('registration');
Route::post('/user/create', [RegistrationController::class, 'create'])->name('user.create');

Route::get('/logout', [LoginController::class, 'logout'])->name('logout');
Route::post('/login', [LoginController::class, 'authenticate'])->name('login.authenticate');
Route::get('/authenticate', [LoginController::class, 'showLoginPage'])->name('login');
