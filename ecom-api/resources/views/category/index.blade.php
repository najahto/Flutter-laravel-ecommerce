@extends('layouts.tamplate')

@section('style')
<style>
    .card-header {
        width: 100%;
    }
</style>
@endsection

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
    <a href="{{ route('categories.create') }}" class="btn btn-outline-primary float-right" id="create-btn">Add Category</a>
    <div>
        <h1 class="dash-title">Categories</h1>

    </div>

    <div class="row">
        <div class="col-12">
            <div class="card easion-card">

                <div class="card-header">
                    <div class="easion-card-title">
                        All Categories
                    </div>
                </div>
                <div class="card-body">

                    <table class="table table-in-card">
                        <thead>
                            <tr class="d-flex">
                                <th class="col-3">#</th>
                                <th class="col-3">Icon</th>
                                <th class="col-3">Name</th>
                                <th class="col-3">Actions</th>
                            </tr>
                        </thead>
                        <tbody>
                            @foreach($categories as $category)
                            <tr class="d-flex">
                                <th class="col-3">{{$category->id}}</th>
                                <td class="col-3">{{$category->name}}</td>
                                <td class="col-3"><img src="{{$category->icon}}" width="100" height="100"></td>
                                <td class="col-3">
                                    <div class="row">
                                        <a href="{{ route('categories.edit', $category->id) }} " class="btn btn-outline-primary btn-sm"> Edit </a>
                                        |
                                        <form action="{{ route('categories.destroy', $category->id)}}" method="post">
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