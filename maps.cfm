<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="utf-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <!-- Lock viewport to prevent scaling -->
  <meta name="viewport" content="width=device-width,initial-scale=1,maximum-scale=1,user-scalable=no">
  <meta name="description" content="Tasmanian Maps :: Demo app for CSIRO Oceans & Atmosphere Job Interview">
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

  <!-- Load Leaflet from CDN
  <link rel="stylesheet" href="https://unpkg.com/leaflet@1.0.3/dist/leaflet.css" />
  <script src="https://unpkg.com/leaflet@1.0.3/dist/leaflet-src.js"></script>
  -->
  <link rel="stylesheet" href="https://unpkg.com/leaflet@1.4.0/dist/leaflet.css" integrity="sha512-puBpdR0798OZvTTbP4A8Ix/l+A4dHDD0DGqYW6RQ+9jxkRFclaxxQb/SJAWZfWAkuyeQUytO7+7N4QKrDh+drA==" crossorigin=""/>
  <script src="https://unpkg.com/leaflet@1.4.0/dist/leaflet.js" integrity="sha512-QVftwZFqvtRNi0ZyCtsznlKSWOStnDORoefr1enyq5mVL4tmKB3S/EnC3rRJcxCPavG10IcrVGSmPh6Qw5lwrg==" crossorigin=""></script>
  
  <!-- Load Esri Leaflet from CDN 
  <script src="https://unpkg.com/esri-leaflet@2.0.7"></script>
  -->
  <script src="https://unpkg.com/esri-leaflet@2.2.4/dist/esri-leaflet.js"
    integrity="sha512-tyPum7h2h36X52O2gz+Pe8z/3l+Y9S1yEUscbVs5r5aEY5dFmP1WWRY/WLLElnFHa+k1JBQZSCDGwEAnm2IxAQ=="
    crossorigin=""></script>

  <!-- Load Esri Leaflet Geocoder from CDN 
  <link rel="stylesheet" href="https://unpkg.com/esri-leaflet-geocoder@2.2.3/dist/esri-leaflet-geocoder.css">
  <script src="https://unpkg.com/esri-leaflet-geocoder@2.2.3"></script>
  -->
  <link rel="stylesheet" href="https://unpkg.com/esri-leaflet-geocoder@2.2.13/dist/esri-leaflet-geocoder.css"
    integrity="sha512-v5YmWLm8KqAAmg5808pETiccEohtt8rPVMGQ1jA6jqkWVydV5Cuz3nJ9fQ7ittSxvuqsvI9RSGfVoKPaAJZ/AQ=="
    crossorigin="">
  <script src="https://unpkg.com/esri-leaflet-geocoder@2.2.13/dist/esri-leaflet-geocoder.js"
    integrity="sha512-zdT4Pc2tIrc6uoYly2Wp8jh6EPEWaveqqD3sT0lf5yei19BC1WulGuh5CesB0ldBKZieKGD7Qyf/G0jdSe016A=="
    crossorigin=""></script>

  <style>

    .calcite-navbar-search {
        margin-top: 5px;
    }
  </style>

</head>
<body class="calcite-maps calcite-nav-top">

  <!-- Navbar -->
  <cfinclude template="navbar_map.cfm">
  <!--/.navbar -->
  
 <!-- Logout Modal-->
  <cfinclude template="logout_modal.cfm" runonce="true">

  <!-- Map Container  -->

  <div class="calcite-map">                
    <div id="map" class="calcite-map-absolute"></div> 
  </div><!-- /.container -->

   <!-- Panel -->
  <div class="calcite-panels calcite-panels-left calcite-bg-custom calcite-text-light panel-group calcite-bgcolor-coa" role="tablist" aria-multiselectable="true">
  
    <!-- Info Panel -->
    <cfinclude template="info_panel.cfm" runonce="true">

    <!-- Search Panel -->
    <cfinclude template="searchmap_panel.cfm" runonce="true">

    <!-- Basemaps Panel -->
    <cfinclude template="basemap_panel.cfm" runonce="true">
    
  </div> <!-- /.calcite-panels -->

 
  <script>
    
    // ============
    // Esri-Leaflet 
    // ============

    var theListUrl = 'https://services.thelist.tas.gov.au/arcgis/rest/services/Basemaps/Topographic/MapServer/tile/{z}/{y}/{x}', attr='theList'
    var USGSUrl = 'http://server.arcgisonline.com/ArcGIS/rest/services/NatGeo_World_Map/MapServer/tile/{z}/{y}/{x}', name='USGS', attr='USGS'
    var OpenStreetMapUrl = 'https://{s}.tile.openstreetmap.org/{z}/{x}/{y}.png'

    var theList = L.tileLayer(theListUrl, {id: 'theList', attribution: theList}),
      USGS   = L.tileLayer(USGSUrl, {id: 'USGS', attribution: USGS}),
      OpenStreetMap   = L.tileLayer(OpenStreetMapUrl, {id: 'OpenStreetMap', attribution: OpenStreetMap});

    /* 
    var map = L.map('map', {
      center: [-42, 147],
      zoom: 8,
      layers: [theList, USGS, OpenStreetMap]
    });
    //L.tileLayer(USGS).addTo(map);
    */

    var TasLGAs = L.tileLayer.wms("http://127.0.0.1:8888/geoserver/ows?", {
          layers: 'TasLGAs:lga',
          format: 'image/png',
          transparent: true,
          version: '1.1.0',
      });

    var TasWaterBodies = L.tileLayer.wms("http://127.0.0.1:8888/geoserver/ows?", {
          layers: 'topp:tasmania_water_bodies',
          format: 'image/png',
          transparent: true,
          version: '1.1.0',
      });


    var owsrootUrl = 'http://127.0.0.1:8888/geoserver/ows';

    var defaultParameters = {
        service : 'WFS',
        version : '2.0',
        request : 'GetFeature',
        typeName : 'TasLGAs:lga',
        outputFormat : 'text/javascript',
        format_options : 'callback:getJson',
        SrsName : 'EPSG:4326'
        /*SrsName : 'EPSG:28355'*/
    };

    var parameters = L.Util.extend(defaultParameters);
    var URL = owsrootUrl + L.Util.getParamString(parameters);
    console.log(URL);

    var worldTransportation = L.esri.basemapLayer('ImageryTransportation');

    var map = L.map('map', {zoomControl: false}).setView([-42, 147], 8),
      layerLabels = null,
      layer = theList.addTo(map),
      worldTransportation = L.esri.basemapLayer('ImageryTransportation').addTo(map)
    ;  



    function setBasemap(basemap) {
      if (layer) {
        map.removeLayer(layer);
      }
      if (basemap === 'OpenStreetMap') {
        layer = L.tileLayer(OpenStreetMapUrl);
      }
      else if (basemap === 'USGS') {
        layer = L.tileLayer(USGSUrl);
      }
      else if (basemap === 'theList') {
        layer = L.tileLayer(theListUrl);
      }
      else {
        layer = L.esri.basemapLayer(basemap);
      }
      map.addLayer(layer);


      if (layerLabels) {
        map.removeLayer(layerLabels);
      }

      if (basemap === 'ShadedRelief' || basemap === 'Oceans' || basemap === 'Gray' || basemap === 'DarkGray' || basemap === 'Imagery' || basemap === 'Terrain') {
        layerLabels = L.esri.basemapLayer(basemap + 'Labels');
        map.addLayer(layerLabels);
      }
        
      // add world transportation service to Imagery basemap
      if (basemap === 'Imagery'  || basemap === 'theList') {
        worldTransportation.addTo(map);
        TasLGAs.addTo(map);   
        TasWaterBodies.addTo(map);   
        WFSLayer.addTo(map);     
      } else if (map.hasLayer(worldTransportation)) {
        // remove world transportation if Imagery basemap is not selected    
        map.removeLayer(worldTransportation);
      }
    }

    var baseMaps = {
      "OpenStreetMap": OpenStreetMap,
      "USGS": USGS,
      "theList": theList
    };

    var overlayMaps = {
        "<a target='_blank' href='http://localhost:8888/geoserver/TasLGAs/wms?service=WMS&version=1.1.0&request=GetMap&layers=TasLGAs%3Alga&bbox=224665.609375%2C5141043.0%2C629535.375%2C5664526.0&width=593&height=768&srs=EPSG%3A28355&format=application/openlayers'>TasLGAs - WMS Layer</a>": TasLGAs,
        "<a target='_blank' href='http://localhost:8888/geoserver/topp/wms?service=WMS&version=1.1.0&request=GetMap&layers=topp%3Atasmania_water_bodies&bbox=145.97161899999998%2C-43.031944%2C147.219696%2C-41.775558&width=762&height=768&srs=EPSG%3A4326&format=application/openlayers'>TasWaterBodies - WMS Layer</a>": TasWaterBodies
    };


    layerControl = L.control.layers(baseMaps, overlayMaps, {position: 'bottomright'}).addTo(map);   
    

    L.control.zoom({
      position:'bottomright'
    }).addTo(map);

    //var searchControl = L.esri.Geocoding.Controls.geosearch({expanded: true, collapseAfterResult: false, zoomToResult: false}).addTo(map);
    var searchControl = L.esri.Geocoding.geosearch({expanded: true, collapseAfterResult: false, zoomToResult: false}).addTo(map);
    
    searchControl.on('results', function(data){ 
      if (data.results.length > 0) {
        var popup = L.popup()
          .setLatLng(data.results[0].latlng)
          .setContent(data.results[0].text)
          .openOn(map);
        map.setView(data.results[0].latlng)
      }
    })
  
  </script>

  <!-- ====== -->
  <!-- jQuery --> 
  <!-- ====== -->

  <!--script src="https://esri.github.io/calcite-bootstrap/scripts/vendor.js"></script-->
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
  <!-- Include all plugins or individual files as needed -->
  <script src="//maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
  
  <script type="text/javascript">

    $(document).ready(function(){

      // Added LGA Feature layer
      var WFSLayer = null;
      var ajax = $.ajax({
        url : URL,
        dataType : 'jsonp',
        jsonpCallback : 'getJson',
        success : function (response) {
          //console.log(response)
          WFSLayer = L.geoJSON(response, {
              style: function (feature) {
                  return {
                      /*stroke: false,*/
                      color: '#999',
                      weight: 1,
                      opacity: 1,
                      fillColor: '#FAFAFA',
                      fillOpacity: 0.5


                  };
              },
              onEachFeature: function (feature, layer) {
                popupOptions = {maxWidth: 200,closeButton: false, offset: L.point(0, -20)};
                layer.bindPopup('LGA Name: '+feature.properties.name,popupOptions);
                layer.on('mouseover', function () {
                  layer.openPopup(); 
                  this.setStyle({
                    'fillColor': '#999999'
                  });
                });

                layer.on('mouseout', function () {
                  layer.closePopup();
                  this.setStyle({
                    'fillColor': '#FAFAFA',
                    'fillOpacity': 0.5
                  });
                });

                layer.on('click', function () {
                  window.location = 'data_sel.cfm?id='+feature.properties.lga_id;
                });
              },
            }).addTo(map);
            layerControl.addOverlay(WFSLayer, "TasLGAs - WFS Layer");
            
            /*WFSLayer.on('mouseover', function(ev) {
                window.alert('hover');
            });*/

            WFSLayer.on('click', function(ev) {
                // React to the user clicking over something here.
                //window.alert(ev);
            });


          }
      });

      
      // Basemap changed
      $("#selectStandardBasemap").on("change", function(e) {
        setBasemap($(this).val());
      });

      // Search
      var input = $(".geocoder-control-input");
      input.focus(function(){
        $("#panelSearch .panel-body").css("height", "150px");
      });
      input.blur(function(){
         $("#panelSearch .panel-body").css("height", "auto");
      });

      // Attach search control for desktop or mobile
      function attachSearch() {
        var parentName = $(".geocoder-control").parent().attr("id"),
          geocoder = $(".geocoder-control"),
          width = $(window).width();
        if (width <= 767 && parentName !== "geocodeMobile") {
          geocoder.detach();
          $("#geocodeMobile").append(geocoder);
        } else if (width > 767 && parentName !== "geocode"){
          geocoder.detach();
          $("#geocode").append(geocoder);
        }
      }

      $(window).resize(function() {
        attachSearch();
      });

      attachSearch();

    });<!-- jQuery -->
  </script>


<!-- Bootstrap core JavaScript
  ================================================== -->
  <!-- Placed at the end of the document so the pages load faster -->
  <!-- jQuery (for Bootstrap's JavaScript plugins). NOTE: You can also use pure Dojo. See examples. -->
  <!--script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.3/jquery.min.js"></script-->
  <!-- Include all  plugins or individual files as needed -->
  <!--script src="//maxcdn.bootstrapcdn.com/bootstrap/3.3.5/js/bootstrap.min.js"></script-->

  <!-- IE10 viewport hack for Surface/desktop Windows 8 bug -->
  <!--script src=".././assets/js/ie10-viewport-bug-workaround.js"></script-->
  
  <!--script src="https://esri.github.io/calcite-bootstrap/scripts/vendor.js"></script-->
  <!--script src="https://esri.github.io/calcite-bootstrap/scripts/plugins.js"></script-->
  <script src="./assets/calcite-maps/dist/js/jquery/calcitemaps-v0.10.js"></script>

  <!-- Custom scripts for all pages-->
  <script src="./assets/sbadmin/js/sb-admin-2.min.js"></script>
  <!-- ====== -->
  <!-- End of jQuery --> 
  <!-- ====== -->

</body>
</html>

