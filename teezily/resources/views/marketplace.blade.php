@extends("layout.app")
@section("body")
		  <div class="col-md-10">
 

  			<div class="content-box-large">
  				<div class="panel-heading">
					<div class="panel-title">Market Place Categories</div>
				</div>
  				<div class="panel-body">
  					<div class="table-responsive">
  						<table class="table" id="example">
			              <thead>
			                <tr>
			                  <th>#</th>
			                  <th>Name</th>
			                  <th>Slug</th>
			                  <th>Parent Id</th>
			                
			                </tr>
			              </thead>
			              <tbody>
						  @foreach($marketplace as $row)
			                <tr>
			                  <td>{{$row->marketplace_id}}</td>
			                  <td>{{$row->name}}</td>
			                  <td>{{$row->slug}}</td>
			                  <td>{{$row->parent_id}}</td>
			              
			                </tr>
                              @endforeach
			              </tbody>
			            </table>
  					</div>
  				</div>
  			</div>

  		



		  </div><!-- Here -->
		@endsection