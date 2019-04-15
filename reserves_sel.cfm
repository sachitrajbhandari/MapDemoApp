<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="utf-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <!-- Lock viewport to prevent scaling -->
  <meta name="viewport" content="width=device-width,initial-scale=1,maximum-scale=1,user-scalable=no">
  <meta name="description" content="Tasmanian Maps :: Demo App">
  <meta name="author" content="">
  <link rel="icon" href="">
  <title>Tasmanian Maps :: Map Demo App</title>

  <!-- Custom styles for this template -->
  <link href="./assets/sbadmin/css/sb-admin-2.req.css" rel="stylesheet">

  <!-- Calcite Maps Bootstrap -->
  <link rel="stylesheet" href="./assets/calcite-maps/dist/css/calcite-maps-bootstrap-v0.10-modified.css">
  <!-- Calcite Maps -->
  <link rel="stylesheet" href="./assets/calcite-maps/dist/css/calcite-maps-esri-leaflet.min-v0.10.css">
  <link rel="stylesheet" href="./assets/calcite-maps/dist/fonts/calcite/calcite-ui.css">

  <link rel="stylesheet" href="./assets/css/demo.css">
 <cfquery name="getSelected" datasource="awspostgres"> 
    SELECT * FROM list_local_govt_reserves_statewide where cid=#id#
  </cfquery>
</head>
<body class=" calcite-nav-top">
  <!-- Navbar -->
  <cfinclude template="navbar.cfm" runonce="true">
  <!--/.navbar -->

  <!-- Map Container  -->

  <div class="calcite-nav-top">                
     <div id="map" class=" panel-body">
      <div>&nbsp;</div>
      <div>&nbsp;</div>
      <div>&nbsp;</div>
      <cfoutput QUERY="getSelected">
          <div class="row">
            <!-- Area Chart -->
            <div class="col-xl-1 col-lg-12">
              <div class="card shadow mb-4">
              <div class="card-header">
                <h4 class="m-0 font-weight-bold text-primary">Reserve Category :: <cfset feat_name = feat_name><cfoutput>#category#</cfoutput></h4>
              </div>
              <div class="card-body">
                  <form>
                    <div class="form-group row">
                      <label for="staticLgaId" class="col-sm-2 col-form-label">ID</label>
                      <div class="col-sm-10">
                        <input type="text" readonly class="form-control-plaintext" id="cid" value="#cid#">
                      </div>
                    </div>
                    <div class="form-group row">
                      <label for="staticName" class="col-sm-2 col-form-label">Category</label>
                      <div class="col-sm-10">
                        <input type="text" readonly class="form-control-plaintext" id="category" value="#category#">
                      </div>
                    </div>
                    <div class="form-group row">
                      <label for="staticName" class="col-sm-2 col-form-label">Feature Name</label>
                      <div class="col-sm-10">
                        <input type="text" readonly class="form-control-plaintext" id="feat_name" value="#feat_name#">
                      </div>
                    </div>
                    <div class="form-group row">
                      <label for="staticShapeArea" class="col-sm-2 col-form-label">Shape Area (sq. m)</label>
                      <div class="col-sm-10">
                        <input type="text" readonly class="form-control-plaintext" id="shape_area" value="#shape_area#">
                      </div>
                    </div>
                    <div class="form-group row">
                      <label for="staticShapeLen" class="col-sm-2 col-form-label">Shape Length (m)</label>
                      <div class="col-sm-10">
                        <input type="text" readonly class="form-control-plaintext" id="shape_len" value="#shape_len#">
                      </div>
                    </div>
                  </form>
                </div>
              </div>
            </div>
          </div>
        </div>
      </cfoutput>
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
     
    <!-- Core plugin JavaScript-->
  <script src="assets/sbadmin/vendor/jquery-easing/jquery.easing.min.js"></script>

 

</body>
</html>

