<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="utf-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <!-- Lock viewport to prevent scaling -->
  <meta name="viewport" content="width=device-width,initial-scale=1,maximum-scale=1,user-scalable=no">
  <meta name="description" content="Tasmanian Maps :: Demo app for CSIRO Oceans & Atmosphere JobInterview">
  <meta name="author" content="">
  <link rel="icon" href="">
  <title>Tasmanian Maps :: Demo App</title>

  <!-- Custom styles for this template-->
  <link href="./assets/sbadmin/css/sb-admin-2.req.css" rel="stylesheet">
  <link rel="stylesheet" href="./assets/css/demo.css">

  <!-- Calcite Maps Bootstrap -->
  <link rel="stylesheet" href="./assets/calcite-maps/dist/css/calcite-maps-bootstrap.min-v0.10.css">

  <!-- Calcite Maps -->
  <link rel="stylesheet" href="./assets/calcite-maps/dist/css/calcite-maps-esri-leaflet.min-v0.10.css">
  <link rel="stylesheet" href="./assets/calcite-maps/dist/fonts/calcite/calcite-ui.css">
  

<style>
   
    html { 
      background: url(assets/img/background.gif) no-repeat center center fixed; 
      -webkit-background-size: cover;
      -moz-background-size: cover;
      -o-background-size: cover;
      background-size: cover;
    }

    /*.calcite-title-index{font-size:50px;color:#fcfcfc!important;}*/
    div.calcite-title-index span { 
      margin: 0;
      position: absolute;
      top: 50%;
      left: 50%;
      margin-right: -20%;
      transform: translate(-50%, -50%)
     }

    .container {
      margin-right: auto;
      margin-left: auto;
      padding-left: 15px;
      padding-right: 15px; }
      .container:before, .container:after {
        content: " ";
        display: table; }
      .container:after {
        clear: both; }
      @media (min-width: 768px) {
        .container {
          width: 300px; } }
      @media (min-width: 992px) {
        .container {
          width: 400px; } }
      @media (min-width: 1200px) {
        .container {
          width: 600px; } }

  </style>

</head>
<body class="calcite-maps calcite-nav-top">

  <!-- Navbar -->

  <!-- Navbar -->
  <cfinclude template="navbar_index.cfm" runonce="true">
  <!--/.navbar --><!--/.navbar -->

  <!-- Map Container  -->

  <div class="calcite-map">                
    <div id="map" class="calcite-text-light calcite-bgcolor-coa calcite-title-index">
      <span>
        <div class="container">
          <div class="row justify-content-center">
            <div class="card">
              <div class="card-body">
                <div class="text-center">
                  <h1 class="h4">Welcome Back!</h1>
                </div>
                <form class="user">
                  <div class="form-group">
                    <input type="email" class="form-control form-control-user" id="exampleInputEmail" aria-describedby="emailHelp" placeholder="Enter Email Address...">
                  </div>
                  <div class="form-group">
                    <input type="password" class="form-control form-control-user" id="exampleInputPassword" placeholder="Password">
                  </div>
                  <div class="form-group">
                    <div class="custom-control custom-checkbox small">
                      <input type="checkbox" class="custom-control-input" id="customCheck">
                      <label class="custom-control-label" for="customCheck">Remember Me</label>
                    </div>
                  </div>
                  <a href="maps.cfm" class="btn btn-primary btn-user btn-block">
                    Login
                  </a>
                </form>
                <hr>
                <div class="text-center">
                  <a class="small" href="f#">Forgot Password?</a>
                </div>
                <div class="text-center">
                  <a class="small" href="#">Create an Account!</a>
                </div>
              </div>
            </div>
          </div>
        </div>
      </span>
      <div>
        <img src="assets/img/background.gif" longdesc="Picture Source: http://gifdrome.tumblr.com/post/70958240316" style="width: 100%; height: 100%;"></a>
      </div>
    </div>   
  </div><!-- /.container -->

  <div class="calcite-panels calcite-panels-left calcite-bg-custom calcite-text-light panel-group calcite-bgcolor-coa" role="tablist" aria-multiselectable="true">
    <cfinclude template="info_panel.cfm" runonce="true">
  </div> <!-- /.calcite-panels -->

  <!-- Logout Modal-->
  <cfinclude template="logout_modal.cfm" runonce="true">

  <!-- ====== -->
  <!-- jQuery --> 
  <cfinclude template="scripts.cfm" runonce="true">
  <!-- ====== -->

</body>