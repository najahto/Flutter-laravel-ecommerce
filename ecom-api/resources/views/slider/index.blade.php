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
    <a href="{{ route('sliders.create') }}" class="btn btn-outline-primary float-right" id="create-btn">Add Slider</a>
    <div>
        <h1 class="dash-title">Sliders</h1>

    </div>

    <div class="row">
        <div class="col-12">
            <div class="card easion-card">

                <div class="card-header">
                    <div class="easion-card-title">
                        All Sliders
                    </div>
                </div>
                <div class="card-body">

                    <table class="table table-in-card">
                        <thead>
                            <tr class="d-flex">
                                <th class="col-1">#</th>
                                <th class="col-3">Image</th>
                                <th class="col-3">Title</th>
                                <th class="col-3">Message</th>
                                <th class="col-3">Actions</th>
                            </tr>
                        </thead>
                        <tbody>
                            @foreach($sliders as $slider)
                            <tr class="d-flex">
                                <th class="col-1">{{$slider->id}}</th>
                                <td class="col-3"><img src="{{$slider->image_url}}" width="100" height="100"></td>
                                <td class="col-3">{{$slider->title}}</td>
                                <td class="col-3">{{$slider->message}}</td>
                                <td class="col-3">
                                    <div class="row">
                                        <a href="{{ route('sliders.edit', $slider->id) }} " class="btn btn-outline-primary btn-sm"> Edit </a>
                                        |
                                        <form action="{{ route('sliders.destroy', $slider->id)}}" method="post">
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