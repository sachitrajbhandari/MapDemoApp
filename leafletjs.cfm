
<!DOCTYPE html>
<html>
<head>
	
	<title>WMS example - Leaflet</title>

	<meta charset="utf-8" />
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
	<link rel="shortcut icon" type="image/x-icon" href="docs/images/favicon.ico" />
    <link rel="stylesheet" href="https://unpkg.com/leaflet@1.4.0/dist/leaflet.css" integrity="sha512-puBpdR0798OZvTTbP4A8Ix/l+A4dHDD0DGqYW6RQ+9jxkRFclaxxQb/SJAWZfWAkuyeQUytO7+7N4QKrDh+drA==" crossorigin=""/>
    <script src="https://unpkg.com/leaflet@1.4.0/dist/leaflet.js" integrity="sha512-QVftwZFqvtRNi0ZyCtsznlKSWOStnDORoefr1enyq5mVL4tmKB3S/EnC3rRJcxCPavG10IcrVGSmPh6Qw5lwrg==" crossorigin=""></script>


	<style>
		html, body {
			height: 100%;
			margin: 0;
		}
		#map {
			width: 100%;
			height: 100%;
		}
	</style>

	
</head>
<body>

<div id='map'></div>

<script type="text/javascript">

	var theListUrl = 'https://services.thelist.tas.gov.au/arcgis/rest/services/Basemaps/Topographic/MapServer/tile/{z}/{y}/{x}', attr='theList'
    var USGSUrl = 'http://server.arcgisonline.com/ArcGIS/rest/services/NatGeo_World_Map/MapServer/tile/{z}/{y}/{x}', name='USGS', attr='USGS'
    var OpenStreetMapUrl = 'https://{s}.tile.openstreetmap.org/{z}/{x}/{y}.png'

	var theList = L.tileLayer(theListUrl, {id: 'theList', attribution: theList}),
    	USGS   = L.tileLayer(USGSUrl, {id: 'USGS', attribution: USGS}),
    	OpenStreetMap   = L.tileLayer(OpenStreetMapUrl, {id: 'OpenStreetMap', attribution: OpenStreetMap});

	var map = L.map('map', {
		center: [-42, 147],
		zoom: 8,
		layers: [theList, USGS, OpenStreetMap]
	});
	//L.tileLayer(USGS).addTo(map);

	var TasLGAs = L.tileLayer.wms("http://127.0.0.1:8888/geoserver/ows?", {
        layers: 'TasLGAs:lga',
        format: 'image/png',
        transparent: true,
        version: '1.1.0',
    });
    //wmsLayer.addTo(map);

	
	/*var wmsLayer = L.tileLayer.wms('http://127.0.0.1:8888/geoserver/ows?', {
		layers: 'TasLGAs:lga'
	}).addTo(map);*/
	/*var wmsLayer = L.tileLayer.wms('https://demo.boundlessgeo.com/geoserver/ows?', {
		layers: 'nasa:bluemarble'
	}).addTo(map);*/
	

/*
	var owsrootUrl = 'http://127.0.0.1:8888/geoserver/ows';

	var defaultParameters = {
	    service : 'WFS',
	    version : '2.0',
	    request : 'GetFeature',
	    typeName : 'TasLGAs:lga',
	    outputFormat : 'text/javascript',
	    format_options : 'callback:getJson',
	    SrsName : 'EPSG:28355'
	};

	var parameters = L.Util.extend(defaultParameters);
	var URL = owsrootUrl + L.Util.getParamString(parameters);
	//window.location.href = URL;


	
	var WFSLayer = null;
	var ajax = $.ajax({
	    url : URL,
	    dataType : 'jsonp',
	    jsonpCallback : 'getJson',
	    success : function (response) {
	        WFSLayer = L.geoJson(response, {
	            style: function (feature) {
	                return {
	                    stroke: false,
	                    fillColor: 'FFFFFF',
	                    fillOpacity: 0
	                };
	            },
	            onEachFeature: function (feature, layer) {
	                popupOptions = {maxWidth: 200};
	                layer.bindPopup(feature.properties.name
	                    ,popupOptions);
	            }
	        }).addTo(map);
	    }
	});*/
/*
	var boundaries = new L.WFS({
    url: 'http://127.0.0.1:8888/geoserver/ows',
    typeNS: 'TasLGAs',
    typeName: 'TasLGAs:lga',
    crs: 'EPSG:28355',
    style: {
        color: 'blue',
        weight: 2
		    }
		}).addTo(map)
		  .on('load', function () {
		      map.fitBounds(boundaries);
		  })
*/
	var baseMaps = {
	    "theList": theList,
	    "USGS": USGS,
	    "OpenStreetMap": OpenStreetMap
	};

	var overlayMaps = {
	    "TasLGAs": TasLGAs
	};


	L.control.layers(baseMaps, overlayMaps).addTo(map);



</script>



</body>
</html>
