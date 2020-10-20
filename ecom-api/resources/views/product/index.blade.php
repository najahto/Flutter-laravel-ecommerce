@extends('layouts.tamplate')

@section('content')
<div class="container-fluid">
    @if(Session::get('success'))
    <div class="alert alert-success alert-dismissible fade show" role="alert" id="gone">
        <strong> {{ Session::get('success') }} </strong>
        <button type="button" class="close" data-dismiss="alert" aria-label="Close">
            <span aria-hidden="true">&times;</span>
        </button>
    </div>
    @endif

    @if(Session::get('failed'))
    <div class="alert alert-warning alert-dismissible fade show" role="alert" id="gone">
        <strong> {{ Session::get('failed') }} </strong>
        <button type="button" class="close" data-dismiss="alert" aria-label="Close">
            <span aria-hidden="true">&times;</span>
        </button>
    </div>
    @endif
    <a href=" {{ route('products.create') }} " class="btn btn-outline-primary float-right" id="create-btn">Add Prduct</a>
    <div>
        <h1 class="dash-title">Products</h1>

    </div>

    <div class="row">
        <div class="col-12">
            <div class="card easion-card">

                <div class="card-header">
                    <div class="easion-card-title">
                        All Products
                    </div>
                </div>
                <div class="card-body">

                    <table class="table table-in-card">
                        <thead>
                            <tr class="d-flex">
                                <th class="col-1">#</th>
                                <th class="col-2">Image</th>
                                <th class="col-2">Name</th>
                                <th class="col-1">Price</th>
                                <th class="col-2">Discount</th>
                                <th class="col-2">Category</th>
                                <th class="col-2">Actions</th>
                            </tr>
                        </thead>
                        <tbody>
                            @foreach($products as $product)
                            <tr class="d-flex">
                                <th class="col-1">{{$product->id}}</th>
                                <td class="col-2"><img src="{{$product->photo}}" width="100" height="100"></td>
                                <td class="col-2">{{$product->name}}</td>
                                <td class="col-1">{{$product->price}}</td>
                                <td class="col-2">{{$product->discount}}</td>
                                <td class="col-2">{{$product->category->name}}</td>
                                <td class="col-2">
                                    <div class="row">
                                        <a href="{{ route('products.edit', $product->id) }} " class="btn btn-outline-primary btn-sm"> Edit </a>
                                        |
                                        <form action="{{ route('products.destroy', $product->id)}}" method="post">
                                            @csrf
                                            @method('DELETE')
                                            <button class="btn btn-outline-danger btn-sm" type="submit" onclick="checkDelete()">Delete</button>
                                        </form>
                                    </div>
                                </td>
                            </tr>
                            @endforeach
                        </tbody>
                    </table>
                </div>
            </div>
        </div>
    </div>
</div>
@endsection