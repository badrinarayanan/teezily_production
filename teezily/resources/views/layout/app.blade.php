<!DOCTYPE html>
<html>
<head>
    <title>Teezily</title>
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <!-- jQuery UI -->
    <link href="https://code.jquery.com/ui/1.10.3/themes/redmond/jquery-ui.css" rel="stylesheet" media="screen">

    <!-- Bootstrap -->
    <link href="assets/bootstrap/css/bootstrap.min.css" rel="stylesheet">
    <!-- styles -->
    <link href="assets/css/styles.css" rel="stylesheet">

    <!-- HTML5 Shim and Respond.js IE8 support of HTML5 elements and media queries -->
    <!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
    <!--[if lt IE 9]>
    <script src="https://oss.maxcdn.com/libs/html5shiv/3.7.0/html5shiv.js"></script>
    <script src="https://oss.maxcdn.com/libs/respond.js/1.3.0/respond.min.js"></script>
    <![endif]-->
    <script src="https://use.fontawesome.com/95b8a0c523.js"></script>
</head>
<body>
<div class="header">
    <div class="container">
        <div class="row">
            <div class="col-md-5">
                <!-- Logo -->
                <div class="logo">
                    <h1><a href="{{ Url('campaignlist') }}">Teezily</a></h1>
                </div>
            </div>

            <!--  <div class="col-md-2">
                  <div class="navbar navbar-inverse" role="banner">
                      <nav class="collapse navbar-collapse bs-navbar-collapse navbar-right" role="navigation">
                        <ul class="nav navbar-nav">
                          <li class="dropdown">
                            <a href="#" class="dropdown-toggle" data-toggle="dropdown">My Account <b class="caret"></b></a>
                            <ul class="dropdown-menu animated fadeInUp">
                              <li><a href="profile.html">Profile</a></li>
                              <li><a href="login.html">Logout</a></li>
                            </ul>
                          </li>
                        </ul>
                      </nav>
                  </div>
               </div>-->
        </div>
    </div>
</div>

<div class="page-content">
    <div class="row">
        <div class="col-md-2">
            <div class="sidebar content-box" style="display: block;">
                <ul class="nav">
                    <!-- Main menu -->
                    <li><a href="{{ Url('campaignlist') }}"><i class="fa fa-tags" aria-hidden="true"></i> Campaign List</a></li>
                    <li><a href="{{ Url('getmarketplace') }}"><i class="fa fa-list" aria-hidden="true"></i> Market Place Categories</a></li>
                    <li><a href="{{ Url('getproductlist') }}"><i class="fa fa-list-ol" aria-hidden="true"></i>Products List</a></li>
                    <li><a href="{{ Url('uploadimage') }}"><i class="fa fa-picture-o" aria-hidden="true"></i>Upload Image</a></li>
                    <li><a href="{{ Url('imagelist') }}"><i class="fa fa-picture-o" aria-hidden="true"></i>Image List</a></li>
                    <li><a href="{{ Url('createcampaign') }}"><i class="fa fa-plus-circle" aria-hidden="true"></i>Create Campaign</a></li>

                </ul>
            </div>
        </div>

@yield("body")
    </div>
</div>
<footer>
    <div class="container">

        <div class="copy text-center">
            Copyright {{ date('Y') }} <a href='#'>Website</a>
        </div>

    </div>
</footer>

<script>

    var _appurl = "{{ Url('/')  }}";
    function ajaxRequest(url,data,callback){

        $.ajax({
            url: _appurl+url,
            type: 'POST',
            data: data,
            cache: false,
            dataType: 'json',
            processData: false, // Don't process the files
            contentType: false, // Set content type to false as jQuery will tell the server its a query string request
            success: callback,
            error: callback
        });


    }

</script>
<link href="assets/plugins/datatables/dataTables.bootstrap.css" rel="stylesheet" media="screen">

<!-- jQuery (necessary for Bootstrap's JavaScript plugins) -->
<script src="https://code.jquery.com/jquery.js"></script>
<!-- jQuery UI -->
<script src="https://code.jquery.com/ui/1.10.3/jquery-ui.js"></script>
<!-- Include all compiled plugins (below), or include individual files as needed -->
<script src="assets/bootstrap/js/bootstrap.min.js"></script>

<script src="assets/plugins/datatables/js/jquery.dataTables.min.js"></script>

<script src="assets/plugins/datatables/dataTables.bootstrap.js"></script>

<script src="assets/js/custom.js"></script>
<script src="assets/js/tables.js"></script>
<script src="assets/js/fileupload.js"></script>
</body>
</html>