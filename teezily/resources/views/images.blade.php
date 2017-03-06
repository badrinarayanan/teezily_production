@extends("layout.app")
@section("body")
    <div class="col-md-10">


        <div class="content-box-large">
            <div class="panel-heading">
                <div class="panel-title">Product List</div>
            </div>
            <div class="panel-body">
                <div class="table-responsive">
                    <table class="table" id="example">
                        <thead>
                        <tr>
                            <th>#</th>
                            <th>Image Name</th>
                            <th>Teezily Name</th>
                            <th>Image</th>
                            <th>Link</th>
                        </tr>
                        </thead>
                        <tbody>
                        @foreach($images as $row)
                            <tr>
                                <td>{{ $row->id }}</td>
                                <td>{{ $row->image_name }}</td>
                                <td>{{ $row->teezily_name }}</td>
                                <td><img src="{{ $row->teezily_image_path }}" style="display:inline-block; height:40%"></td>
                                <td><a href="{{ $row->teezily_image_path }}" target="_blank">Link</a></td>
                            </tr>
                        @endforeach
                        </tbody>
                    </table>
                </div>
            </div>
        </div>





    </div>

@endsection