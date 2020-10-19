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
    <h1 class="dash-title">Categories</h1>
    <div class="row">
        <div class="col-12">
            <div class="card easion-card">
                <div class="card-header">
                    <div class="easion-card-title">Edit Category</div>
                </div>
                <div class="card-body">
                    <form method="post" action="{{ route('categories.update', $category->id) }}" enctype="multipart/form-data">
                        @method('PATCH')
                        @csrf
                        <div class="form-group">
                            <label for="name">Name</label>
                            <input type="text" class="form-control" name="name" value="{{ $category->name}}">
                        </div>
                        <div class=" form-group">
                            <label for="icon">Icon</label>
                            <input type="file" class="form-control" name="icon" onchange="loadPhoto(event)">
                        </div>
                        <div class="form-group">
                            <img id="icon" height="100" width="100">
                        </div>
                        <button type="submit" class="btn btn-primary">Update</button>
                    </form>

                    </form>
                </div>
            </div>
        </div>
    </div>
</div>
@endsection

@section('script')
<script>
    function loadPhoto(event) {
        var reader = new FileReader();
        reader.onload = function() {
            var output = document.getElementById('icon');
            output.src = reader.result;
        };
        reader.readAsDataURL(event.target.files[0]);
    }
</script>
@endsection