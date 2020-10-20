<?php

namespace App\Http\Controllers;

use App\Models\Category;
use App\Models\Product;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;

class ProductController extends Controller
{
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index()
    {   
        $products = Product::all();
        return view('product.index')->with('products',$products);
    }

    /**
     * Show the form for creating a new resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function create()
    {
        $categories = Category::all();
        return view('product.create')->with('categories', $categories);
    }

    /**
     * Store a newly created resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @return \Illuminate\Http\Response
     */
    public function store(Request $request)
    {
        $product = new Product();
        $product->name = $request->input('name');
        $product->price = $request->input('price');
        $product->discount = $request->input('discount');
        $product->category_id = $request->input('category');
        $product->photo = "";
        $product->is_hot_product = $request->input('isHotProduct') ? true : false;
        $product->is_new_arrival = $request->input('isNewArrival') ? true : false;
        $product->user_id = Auth::id();
        if ($product->save()) {
            $photo = $request->file('image');
            if ($photo != null) {
                $ext = $photo->getClientOriginalExtension();
                $fileName = rand(10000, 50000) . '.' . $ext;
                if ($ext == 'jpg' || $ext == 'png') {
                    if ($photo->move(public_path(), $fileName)) {
                        $product = Product::find($product->id);
                        $product->photo = url('/') . '/' . $fileName;
                        $product->save();
                    }
                }
            }
            return redirect()->back()->with('success', 'Product information inserted successfully!');
        }
        return redirect()->back()->with('failed', 'Product information could not be inserted!');
    }

    /**
     * Display the specified resource.
     *
     * @param  \App\Models\Product  $product
     * @return \Illuminate\Http\Response
     */
    public function show(Product $product)
    {
        //
    }

    /**
     * Show the form for editing the specified resource.
     *
     * @param  \App\Models\Product  $product
     * @return \Illuminate\Http\Response
     */
    public function edit($id)
    {   
        $product = Product::find($id);
        $categories = Category::all();
        return view('product.edit')->with(['product' => $product,'categories' =>$categories]);
    }

    /**
     * Update the specified resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @param  \App\Models\Product  $product
     * @return \Illuminate\Http\Response
     */
    public function update(Request $request, $id)
    {
        $product = Product::find($id);
        $product->name = $request->input('name');
        $product->price = $request->input('price');
        $product->discount = $request->input('discount');
        $product->is_hot_product = $request->input('isHotProduct') ? true : false;
        $product->is_new_arrival = $request->input('isNewArrival') ? true : false;
        $product->category_id = $request->input('category');
        $product->user_id = Auth::id();
        if($product->save()){
            $photo = $request->file('image');
            if($photo != null){
                $ext = $photo->getClientOriginalExtension();
                $fileName = rand(10000, 50000) . '.' . $ext;
                if($ext == 'jpg' || $ext == 'png'){
                    if($photo->move(public_path(), $fileName)){
                        $product = Product::find($product->id);
                        $product->photo = url('/') . '/' . $fileName;
                        $product->save();
                    }
                }

            }
            return redirect()->back()->with('success', 'Product information updated successfully!');
        }
        return redirect()->back()->with('failed', 'Product information could not update!');
    }

    /**
     * Remove the specified resource from storage.
     *
     * @param  \App\Models\Product  $product
     * @return \Illuminate\Http\Response
     */
    public function destroy($id)
    {
        if(Product::destroy($id)){
            return redirect()->back()->with('deleted', 'Deleted successfully');
        }
        return redirect()->back()->with('delete-failed', 'Could not delete');
    }
}
