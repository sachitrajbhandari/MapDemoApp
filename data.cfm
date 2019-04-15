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
      <div class="card">
        <div class="card-header">
          <h4 class="">LGAs of Tasmania</h4>
        </div>
        <div class="card-body">
          <cfoutput>  
            <cfquery name="myQuery" datasource="awspostgres"> 
                SELECT * FROM list_local_govt_areas_statewide 
            </cfquery>
            <cfquery name="myGraphQuery" datasource="awspostgres">
              SELECT name as name_list, (sum(shape_area)/1000000) as shape_area_list FROM public.list_local_govt_areas_statewide group BY name
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

      <div>&nbsp;</div>
      <!-- Bar Chart -->
      <div class="card shadow mb-4">
        <div class="card-header py-3">
          <h4 >Total Area per LGA</h4>
        </div>
        <div class="card-body">
          <div class="chart-bar">
            <canvas id="myBarChart"></canvas>
          </div>
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

  function number_format(number, decimals, dec_point, thousands_sep) {
    // *     example: number_format(1234.56, 2, ',', ' ');
    // *     return: '1 234,56'
    number = (number + '').replace(',', '').replace(' ', '');
    var n = !isFinite(+number) ? 0 : +number,
      prec = !isFinite(+decimals) ? 0 : Math.abs(decimals),
      sep = (typeof thousands_sep === 'undefined') ? ',' : thousands_sep,
      dec = (typeof dec_point === 'undefined') ? '.' : dec_point,
      s = '',
      toFixedFix = function(n, prec) {
        var k = Math.pow(10, prec);
        return '' + Math.round(n * k) / k;
      };
    // Fix for IE parseFloat(0.55).toFixed(0) = 0;
    s = (prec ? toFixedFix(n, prec) : '' + Math.round(n)).split('.');
    if (s[0].length > 3) {
      s[0] = s[0].replace(/\B(?=(?:\d{3})+(?!\d))/g, sep);
    }
    if ((s[1] || '').length < prec) {
      s[1] = s[1] || '';
      s[1] += new Array(prec - s[1].length + 1).join('0');
    }
    return s.join(dec);
  }

  // Bar Chart Example

  var my_shape_area_list1 = new Array(); 
  var my_name_list1 = new Array(); 

  <cfset myLoop = 0> 
  <cfoutput> 
    <cfloop query="myGraphQuery"> 
      my_name_list1 [#variables.myLoop #] = "#myGraphQuery.name_list#"; 
      my_shape_area_list1 [#variables.myLoop #] = #myGraphQuery.shape_area_list#; 
      <cfset variables.myLoop = variables.myLoop + 1> 
    </cfloop> 
  </cfoutput> 


  var ctx = document.getElementById("myBarChart");

  var myBarChart = new Chart(ctx, {
    type: 'bar',
    data: {
      labels: my_name_list1,
      datasets: [{
        label: "Shape_Area",
        backgroundColor: "#4e73df",
        hoverBackgroundColor: "#2e59d9",
        borderColor: "#4e73df",
        data: my_shape_area_list1,
      }],
    },
    options: {
      maintainAspectRatio: false,
      layout: {
        padding: {
          left: 10,
          right: 25,
          top: 25,
          bottom: 0
        }
      },
      scales: {
        xAxes: [{
          time: {
            unit: ''
          },
          gridLines: {
            display: false,
            drawBorder: false
          },
          ticks: {
            maxTicksLimit: 96
          },
          maxBarThickness: 25,
        }],
        yAxes: [{
          ticks: {
            min: 0,
            
            maxTicksLimit: 5,
            padding: 10,
            // Include a dollar sign in the ticks
            callback: function(value, index, values) {
              return number_format(value) + ' sq. km';
            }
          },
          gridLines: {
            color: "rgb(234, 236, 244)",
            zeroLineColor: "rgb(234, 236, 244)",
            drawBorder: false,
            borderDash: [2],
            zeroLineBorderDash: [2]
          }
        }],
      },
      legend: {
        display: false
      },
      tooltips: {
        titleMarginBottom: 10,
        titleFontColor: '#6e707e',
        titleFontSize: 14,
        backgroundColor: "rgb(255,255,255)",
        bodyFontColor: "#858796",
        borderColor: '#dddfeb',
        borderWidth: 1,
        xPadding: 15,
        yPadding: 15,
        displayColors: false,
        caretPadding: 10,
        callbacks: {
          label: function(tooltipItem, chart) {
            var datasetLabel = chart.datasets[tooltipItem.datasetIndex].label || '';
            return datasetLabel + ': ' + number_format(tooltipItem.yLabel) + ' sq. km';
          }
        }
      },
    }
  });
</script>

<!-- ====== -->

</body>
</html>

