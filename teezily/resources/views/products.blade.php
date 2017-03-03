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
			                  <th>Reference</th>
			                  <th>Sides</th>
			                  <th>Colors</th>
			                </tr>
			              </thead>
			              <tbody>
						  @foreach($products as $row)
			                <tr>
			                  <td>{{ $row->product_id  }}}</td>
			                  <td>{{ $row->product_reference }}</td>
			                  <td>{{ $row->sides }}</td>
			                  <td><a href="#" class="poptext" data-toggle="popover" title="Available Colors" data-content="{{$row->colors}}"><i class="fa fa-paint-brush" aria-hidden="true"></i></a></td>
			                </tr>
						  @endforeach
			              </tbody>
			            </table>
  					</div>
  				</div>
  			</div>

  		



		  </div>

		@endsection