@extends("layout.app")
@section("body")
		  <div class="col-md-10">
  		<div class="row">
  			<div class="col-md-6">
	  					<div class="content-box-large">
			  				<div class="panel-heading">
					            <div class="panel-title">Create Campaign</div>
					          
					           
					        </div>
			  				<div class="panel-body">
			  					<form class="form-horizontal" role="form" id="create_campaign">
								  <div class="form-group">
								    <label for="inputEmail3" class="col-sm-2 control-label">Campaign Name</label>
								    <div class="col-sm-10">
								      <input type="text" class="form-control" id="inputEmail3" placeholder="Campaign Name" data-element="element" name="campaign_name">
								    </div>
								  </div>
								 
								  <div class="form-group">
								    <label class="col-sm-2 control-label">Campaign Description</label>
								    <div class="col-sm-10">
								      <textarea class="form-control" placeholder="Textarea" rows="3" data-element="element" name="description"></textarea>
								    </div>
								  </div>
								
								 <div class="form-group">
											<label class="col-md-2 control-label">Currency</label>
											<div class="col-md-10">
												<label class="radio radio-inline">
													<input type="radio" name="cur" data-element="element" value="eur">
													Euro </label>
												<label class="radio radio-inline">
													<input type="radio" name="cur" data-element="element" value="usd">
													USD </label>
												
											</div>
										</div>

									  <div class="form-group">
								    	<label for="inputEmail3" class="col-sm-2 control-label">Campaign Slug</label>
								   		 <div class="col-sm-10">
								      		<input type="text" class="form-control" id="inputEmail3" placeholder="my-awesome-campaign" name="slug" data-element="element">
								    	</div>
								    </div>
									<div class="form-group">
										<label class="col-md-2 control-label" for="select-1">Days Limit</label>
										<div class="col-md-10">

											<select class="form-control" id="days_limit" name="days_limit" data-element="element">
												<option value="">Select Days Limit</option>
												<option value="1">1</option>
												<option value="2">2</option>
												<option value="3">3</option>
												<option value="5">5</option>
												<option value="7">7</option>
												<option value="10">10</option>
												<option value=15>15</option>
												<option value="20">20</option>

											</select>

										</div>
									</div>
								    	<div class="form-group">
											<label class="col-md-2 control-label" for="select-1">Product ID</label>
											<div class="col-md-10">
			
												<select class="form-control" id="select-id" name="select_id" data-element="element">
												<option value="">Select Product ID</option>
													@foreach($products as $row)
                                                        <option value="{{ $row->product_id }}">{{ $row->product_id }}</option>
                                                    @endforeach
												</select> 
			
											</div>
										</div>
										<div class="form-group">
											<label class="col-md-2 control-label" for="select-1">Product Color</label>
											<div class="col-md-10">
			
												<select class="form-control" id="select-color" name="select_color" data-element="element">
                                                    <option value="">Select Color</option>

                                                    @foreach($products as $row)
                                                        <?php $colors = explode(',',$row->colors); ?>
                                                            @foreach($colors as $color)
                                                                 <option value="{{ $color}}" class="hide" data-id="{{$row->product_id}}">{{ $color }}</option>
                                                            @endforeach
                                                    @endforeach


												
												</select> 
			
											</div>
										</div>
								  <div class="form-group">
								        <label for="inputEmail3" class="col-sm-2 control-label">Product Price</label>
								    <div class="col-sm-10">
								      <input type="number" class="form-control" id="inputEmail3" placeholder="Product Price" name="price" data-element="element">
								    </div>
								  </div>

                                    <div class="form-group">
                                        <label for="inputEmail3" class="col-sm-2 control-label">Sales Goal</label>
                                        <div class="col-sm-10">
                                            <input type="number" class="form-control" id="inputEmail3" placeholder="Sales Goal" name="sales_goal" data-element="element" value="1">
                                        </div>
                                    </div>

								  <div class="form-group">
											<label class="col-md-2 control-label" for="select-1">Select design for the front side</label>
											<div class="col-md-10">
			
												<select class="form-control" id="select-front-image" name="select_front_image" data-element="element">
													<option value="">Select Image</option>
                                                    @foreach($images as $image)
                                                        <option value="{{ $image->teezily_name }}">{{$image->image_name}}</option>
                                                    @endforeach

												</select> 
			
											</div>
										</div>
										<div class="form-group">
											<label class="col-md-2 control-label" for="select-1">Select Desgin for the back side</label>
											<div class="col-md-10">
			
												<select class="form-control" id="select-back-image" name="select_back_image">
                                                    <option value="">Select Image</option>
                                                    @foreach($images as $image)
                                                        <option value="{{ $image->teezily_name }}">{{$image->image_name}}</option>
                                                    @endforeach
												
												</select> 
			
											</div>
										</div>

								  <div class="form-group">
								    <div class="col-sm-offset-2 col-sm-10">
								      <button type="button" class="btn btn-primary" id="submit_campaign" data-loading-text="<i class='fa fa-spinner fa-spin '></i> Creating Campaign">Submit</button>
								    </div>
								  </div>
								</form>
			  				</div>
			  			</div>
	  				</div>
  		</div>	

  		



		  </div><!-- Here-->
@endsection