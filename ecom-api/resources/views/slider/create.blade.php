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
    <h1 class="dash-title">Sliders</h1>
    <div class="row">
        <div class="col-12">
            <div class="card easion-card">
                <div class="card-header">
                    <div class="easion-card-title">Add Slider</div>
                </div>
                <div class="card-body">
                    <form method="post" action="{{ route('sliders.store') }}" enctype="multipart/form-data">
                        @csrf
                        <div class="form-group">
                            <label for="title">Title</label>
                            <input type="text" class="form-control" name="title" id="title">
                        </div>
                        <div class="form-group">
                            <label for="message">Message</label>
                            <textarea class="form-control" name="message" id="message" cols="30" rows="10"></textarea>
                        </div>
                        <div class="form-group">
                            <label for="image">Image</label>
                            <input type="file" class="form-control" name="image" onchange="loadPhoto(event)">
                        </div>
                        <div class="form-group">
                            <img id="image" height="100" width="100">
                        </div>
                        <button type="submit" class="btn btn-primary">Submit</button>
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
            var output = document.getElementById('image');
            output.src = reader.result;
        };
        reader.readAsDataURL(event.target.files[0]);
    }
</script>
@endsection