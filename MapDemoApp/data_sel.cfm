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
 <cfquery name="getSelectedLGA" datasource="awspostgres"> 
              SELECT * FROM list_local_govt_areas_statewide where lga_id=#id#
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
      <cfoutput QUERY="getSelectedLGA">
          <div class="row">
            <!-- Area Chart -->
            <div class="col-xl-8 col-lg-7">
              <div class="card shadow mb-4">
              <div class="card-header">
                <h4 class="m-0 font-weight-bold text-primary">LGA of Tasmania :: <cfset lganame = name><cfoutput>#lganame#</cfoutput></h4>
              </div>
              <div class="card-body">
                  <form>
                    <div class="form-group row">
                      <label for="staticLgaId" class="col-sm-2 col-form-label">LGA ID</label>
                      <div class="col-sm-10">
                        <input type="text" readonly class="form-control-plaintext" id="lga_id" value="#lga_id#">
                      </div>
                    </div>
                    <div class="form-group row">
                      <label for="staticName" class="col-sm-2 col-form-label">LGA Name</label>
                      <div class="col-sm-10">
                        <input type="text" readonly class="form-control-plaintext" id="name" value="#name#">
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
                    <div class="form-group row">
                      <label for="staticEasting" class="col-sm-2 col-form-label">Easting</label>
                      <div class="col-sm-10">
                        <input type="text" readonly class="form-control-plaintext" id="easting" value="#xcor#">
                      </div>
                    </div>
                    <div class="form-group row">
                      <label for="staticNorthing" class="col-sm-2 col-form-label">Northing</label>
                      <div class="col-sm-10">
                        <input type="text" readonly class="form-control-plaintext" id="northing" value="#ycor#">
                      </div>
                    </div>
                  </form>
                </div>
              </div>
            </div>


            <!-- Pie Chart -->
            <div class="col-xl-4 col-lg-5">
              <div class="card">
                <!-- Card Header - Dropdown -->
                <div class="card-header">
                  <h4 class="m-0 font-weight-bold text-primary">Area Coverage</h4>
                </div>
                <!-- Card Body -->
                <div class="card-body">
                  <div class="chartjs-size-monitor" style="position: absolute; left: 0px; top: 0px; right: 0px; bottom: 0px; overflow: hidden; pointer-events: none; visibility: hidden; z-index: -1;">
                    <div class="chartjs-size-monitor-expand" style="position:absolute;left:0;top:0;right:0;bottom:0;overflow:hidden;pointer-events:none;visibility:hidden;z-index:-1;">
                      <div style="position:absolute;width:1000000px;height:1000000px;left:0;top:0"></div>
                    </div>
                    <div class="chartjs-size-monitor-shrink" style="position:absolute;left:0;top:0;right:0;bottom:0;overflow:hidden;pointer-events:none;visibility:hidden;z-index:-1;">
                      <div style="position:absolute;width:200%;height:200%;left:0; top:0"></div>
                    </div>
                  </div>
                  <div class="chart-pie pt-4 pb-2">
                    <canvas id="myPieChart" width="501" height="180" class="chartjs-render-monitor" style="display: block; height: 235px; width: 557px;"></canvas>
                  </div>
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

 <!-- Page level plugins -->
  <script src="assets/sbadmin/vendor/chart.js/Chart.min.js"></script>

  <!-- Page level custom scripts >
  <script src="assets/sbadmin/js/demo/chart-area-demo.js"></script>
  <script src="assets/sbadmin/js/demo/chart-pie-demo.js"></script>
  <script src="assets/sbadmin/js/demo/chart-bar-demo.js"></script-->

  <script>
      // Set new default font family and font color to mimic Bootstrap's default styling
      Chart.defaults.global.defaultFontFamily = 'Nunito', '-apple-system,system-ui,BlinkMacSystemFont,"Segoe UI",Roboto,"Helvetica Neue",Arial,sans-serif';
      Chart.defaults.global.defaultFontColor = '#858796';

      // Pie Chart Example
      var lga = document.getElementById("name").value;
      var lga_area = document.getElementById("shape_area").value;
      var ctx = document.getElementById("myPieChart");
      var myPieChart = new Chart(ctx, {
        type: 'doughnut',
        data: {
          labels: [lga, "Area of rest of the LGAs"],
          datasets: [{
            data: [lga_area, (69208645493.9138-parseFloat(lga_area))],
            backgroundColor: ['#4e73df', '#36b9cc'],
            hoverBackgroundColor: ['#2e59d9', '#2c9faf'],
            hoverBorderColor: "rgba(234, 236, 244, 1)",
          }],
        },
        options: {
          maintainAspectRatio: false,
          tooltips: {
            backgroundColor: "rgb(255,255,255)",
            bodyFontColor: "#858796",
            borderColor: '#dddfeb',
            borderWidth: 1,
            xPadding: 15,
            yPadding: 15,
            displayColors: false,
            caretPadding: 10,
          },
          legend: {
            display: false
          },
          cutoutPercentage: 80,
        },
      });
  </script>

  <!-- ====== -->

</body>
</html>

