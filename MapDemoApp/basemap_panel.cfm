<div id="panelBasemaps" class="panel collapse">
      <div id="headingBasemaps" class="panel-heading" role="tab">
        <div class="panel-title">
          <a class="panel-toggle collapsed" role="button" data-toggle="collapse" href="#collapseBasemaps" aria-expanded="false"   aria-controls="collapseBasemaps"><span class="glyphicon glyphicon-th-large" aria-hidden="true"></span><span class="panel-label">Basemaps</span></a> 
          <a class="panel-close" role="button" data-toggle="collapse" tabindex="0" href="#panelBasemaps"><span class="esri-icon esri-icon-close" aria-hidden="true"></span></a>  
        </div>
      </div>
      <div id="collapseBasemaps" class="panel-collapse collapse" role="tabpanel" aria-labelledby="headingBasemaps">
        <div class="panel-body">
          <select id="selectStandardBasemap" class="form-control">
            <option value="Streets">Streets</option>
            <option value="Imagery">Satellite</option>
            <!-- <option value="Hybrid">Hybrid</option> -->
            <option selected value="NationalGeographic">National Geographic</option>
            <option value="Topographic">Topographic</option>
            <option value="Gray">Gray</option>
            <option value="DarkGray">Dark Gray</option>
            <option value="OpenStreetMap">Open Street Map</option>
            <option value="theList">theList Map</option>
            <option value="USGS">USGS Map</option>
          </select>
        </div>
      </div>