@extends("layout.app")
@section("body")
  <div class="col-md-10">
  			<div class="content-box-large">
  				<div class="panel-heading">
					<div class="panel-title">Campaign List</div>
				</div>
  				<div class="panel-body">
  					<div class="table-responsive">
  						<table class="table" id="example">
			              <thead>
			                <tr>
			                  <th>#</th>
			                  <th>Campaign Name</th>
			                  <th>Reference</th>
			                  <th>Total Sales</th>
			                  <th>Profit</th>
			                  <th>End Date</th>
			                  <th>State</th>
			                </tr>
			              </thead>
			              <tbody>
						  <?php $i = 0; ?>
                          @foreach($campaignlist as $row)
			                <tr>
			                  <td><?php  echo $i + 1 ?></td>
			                  <td>{{ $row['title'] }}</td>
			                  <td>{{ $row['reference'] }}</td>
			                  <td>{{ $row['nb_sales'] }}</td>
			                  <td>{{ $row['profit']['amount']." ".$row['profit']['currency'] }}</td>
			                  <td>2017-02-17 4:00 PM</td>
			                  <td>{{ implode(',',$row['states']) }}</td>
			                </tr>
                              <?php $i++ ?>
                          @endforeach
			              </tbody>
			            </table>
  					</div>
  				</div>
  			</div>
		  </div><!-- Here -->
@endsection