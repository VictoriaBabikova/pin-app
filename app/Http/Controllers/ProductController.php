<?php

namespace App\Http\Controllers;

use App\Models\Product;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\Validator;

class ProductController extends Controller
{
    /**
     * Display a listing of the resource.
     */
    public function index()
    {
        //$products = Product::all();
        $products = Product::availablestatus()->get();
        $products->toArray();
        return view('product.productList', ['title' => 'Главная', 'products' => $products]);
    }

    /**
     * Show the form for creating a new resource.
     */
    public function create()
    {
        return view('product.createProduct', ['title' => 'Добавить продукт']);
    }

    /**
     * Store a newly created resource in storage.
     */
    public function store(Request $request)
    {
    $validate = Validator::make($request->all(), [
        'article' => ['required', 'regex:/^[A-Za-z0-9]+$/', 'unique:products'],
        'name' => ['required', 'string', 'min:10'],
    ], [
        'required' => 'поле :attribute обязательно к заполнению!',
        'article.unique:products' => ':attribute уже существует!',
        'name' => ':attribute должно быть длиной не менее 10 символов',
        'article' => ':attribute должен содержать только латинские символы и цифры' 
    ]);
    if ($validate->fails()) {
        $errors = $validate->errors();
        return $errors;
    }
        $product = new Product; 
        $product->article = trim($request->article);
        $product->name = trim($request->name);
        $product->status = $request->status;
        if (!empty($request->vendor_array)) {
            $trimmed = json_encode($request->vendor_array);
            $product->data = $trimmed;
        }
        $product->save();
        return $message = "success";
    }

    /**
     * Display the specified resource.
     */
    public function show(string $id)
    {
       $product = Product::find($id);
       return view('product.showProduct', ['title' => 'Информация об продукте', 'product' => $product]);
    }

    /**
     * Show the form for editing the specified resource.
     */
    public function edit(string $id)
    {
        $product = Product::find($id);
        return view('product.editProduct', ['title' => 'Редактировать продукт', 'product' => $product]);
    }

    /**
     * Update the specified resource in storage.
     */
    public function update(Request $request)
    {
        $validate = Validator::make($request->all(), [
            'article' => ['required', 'regex:/^[A-Za-z0-9]+$/'],
            'name' => ['required', 'string', 'min:10'],
        ], [
            'required' => 'поле :attribute обязательно к заполнению!',
            'name' => ':attribute должно быть длиной не менее 10 символов',
            'article' => ':attribute должен содержать только латинские символы и цифры' 
        ]);
        if ($validate->fails()) {
            $errors = $validate->errors();
            return $errors;
        }

        $product = Product::find($request->id);

        if (Auth::user()->isAdmin()=== 'true') {
            if (!empty($request->vendor_array)) {
            $trimmed = json_encode($request->vendor_array);
            $data = $trimmed;
            $product->update([
                'article' => trim($request->article),
                'name' => trim($request->name),
                'status' => trim($request->status),
                'data' => $data,
            ]);
            } else {
                $product->update([
                    'article' => trim($request->article),
                    'name' => trim($request->name),
                    'status' => trim($request->status),
                ]);
            }  
        } else {
            if (!empty($request->vendor_array)) {
                $trimmed = json_encode($request->vendor_array);
                $data = $trimmed;
                $product->update([
                    'name' => trim($request->name),
                    'status' => trim($request->status),
                    'data' => $data,
                ]);
            } else {
                $product->update([
                    'name' => trim($request->name),
                    'status' => trim($request->status),
                ]);
            }
        }
        return $message = "success";
    }

    /**
     * Remove the specified resource from storage.
     */
    public function destroy(string $id)
    {
        $product = Product::find($id);
        $product->delete();
        return "success";
    }
}

