@extends("layout.app")
@section("body")
		  <div class="col-md-10">
          <div class="row">
          <div class="col-md-8">
              <div class="content-box-large">
                <div class="panel-heading">
                      <div class="panel-title">Upload Image</div>
                    

                  </div>
                <div class="panel-body">
                  <form class="form-horizontal" role="form" id="imageform" >
                  <div class="form-group">
                    <label for="inputEmail3" class="col-sm-2 control-label">Image name</label>
                    <div class="col-sm-10">
                      <input type="text" class="form-control" id="image_name" placeholder="Image name">
                    </div>
                  </div>
                  <div class="form-group">
                    <label for="inputPassword3" class="col-sm-2 control-label">Upload Image File</label>
                    <div class="col-sm-10">
                      <input type="file" class="form-control" id="upload_image">
                    </div>
                  </div>
                 
                  
                 
                  <div class="form-group">
                    <div class="col-sm-offset-2 col-sm-10">
                      <button type="button" class="btn btn-primary" id="submit_image" data-loading-text="<i class='fa fa-spinner fa-spin '></i> Uploading Image">Submit</button>
                    </div>
                  </div>
                </form>
                </div>
              </div>
            </div>
        </div>
      </div><!-- Here-->

@endsection