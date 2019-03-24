<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="utf-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <!-- Lock viewport to prevent scaling -->
  <meta name="viewport" content="width=device-width,initial-scale=1,maximum-scale=1,user-scalable=no">
  <meta name="description" content="Tasmanian Maps :: Demo app for CSIRO Ocean & Atmosphere Interview">
  <meta name="author" content="">
  <link rel="icon" href="">
  <title>Tasmanian Maps :: Demo App</title>

  <!-- Custom styles for this template -->
  <link href="./assets/sbadmin/css/sb-admin-2.req.css" rel="stylesheet">

  <!-- Calcite Maps Bootstrap -->
  <link rel="stylesheet" href="./assets/calcite-maps/dist/css/calcite-maps-bootstrap.min-v0.10.css">

  <!-- Calcite Maps -->
  <link rel="stylesheet" href="./assets/calcite-maps/dist/css/calcite-maps-esri-leaflet.min-v0.10.css">
  <link rel="stylesheet" href="./assets/calcite-maps/dist/fonts/calcite/calcite-ui.css">

  <link rel="stylesheet" href="./assets/css/demo.css">

</head>
<body class="calcite-maps calcite-nav-top">

  <!-- Navbar -->
  <cfinclude template="navbar.cfm" runonce="true">
  <!--/.navbar -->

  <!-- Map Container  -->

  <div class="calcite-map calcite-nav-top">                
     <div id="map" class=" panel-body">
      <div>&nbsp;</div>
      <div>&nbsp;</div>
      <div class="card">
        <div class="card-header">
          <h4 class="">LGAs of Tasmania</h4>
        </div>
        <div class="card-body">
          <cfoutput>  
            <cfquery name="myQuery" datasource="localpostgresql"> 
                SELECT * FROM lga 
            </cfquery>
            <cfgrid format="html"
                name="maingrid" 
                query="myQuery" 
                pagesize="10" 
                autowidth="true" 
                href="data_sel.cfm?id="
                hrefKey="lga_id" 
                sort="yes"
                includeBootstrap="no"
                >
                <cfgridcolumn name="lga_id" display="no" />
                <cfgridcolumn name="name" header="Name" />
                <cfgridcolumn name="xcor" header="Easting" />
                <cfgridcolumn name="ycor" header="Northing" />
            </cfgrid>
          </cfoutput>
        </div>
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
</html>

