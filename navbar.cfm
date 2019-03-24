  <nav class="navbar calcite-navbar navbar-fixed-top calcite-bg-dark calcite-text-light calcite-bgcolor-coa">
     <!-- Menu -->
    <div class="dropdown calcite-dropdown calcite-bg-custom calcite-text-light" role="presentation">
      <a class="dropdown-toggle" role="menubutton" aria-haspopup="true" aria-expanded="false" tabindex="0">
        <div class="calcite-dropdown-toggle">
          <span class="sr-only">Toggle dropdown menu</span>
          <span></span>
          <span></span>
          <span></span>
          <span></span>
        </div>
      </a>
      <ul class="dropdown-menu calcite-bgcolor-coa">
        <li><a role="menuitem" tabindex="0" href="maps.cfm" aria-haspopup="true"><span class="glyphicon glyphicon-map-marker"></span> Map View</a></li>
        <li><a role="menuitem" tabindex="0" data-target="#panelInfo" aria-haspopup="true"><span class="glyphicon glyphicon-info-sign"></span> Info</a></li>
        <!--li><a role="menuitem" tabindex="0" id="calciteToggleNavbar" aria-haspopup="true"><span class="glyphicon glyphicon-fullscreen"></span> Full Screen</a></li-->
      </ul>
    </div>
    <!-- Title -->
    <div class="calcite-title calcite-overflow-hidden">
      <span class="calcite-title-main">DEMO :: Tasmanian Maps</span>
      <span class="calcite-title-divider hidden-xs"></span>
      <span class="calcite-title-sub hidden-xs">Demo App for Job Interview @ CSIRO Ocean & Atmosphere</span> 
    </div>
    <!-- Nav -->
    <ul class="calcite-nav nav navbar-nav">                    
      <li><div class="calcite-navbar-search "><div id="geocode"></div></div></li>
    </ul>
    <!-- Topbar Navbar -->
    <ul class="nav navbar-nav">
      <!-- Nav Item - User Information -->
      <li class="nav-item dropdown no-arrow">
        <a class="nav-link dropdown-toggle" href="#" id="userDropdown" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
          <span class="">Sachit Rajbhandari</span>
          <img class="img-profile rounded-circle" src="./assets/img/sachit.png">
        </a>
        <!-- Dropdown - User Information -->
        <div class="dropdown-menu  dropdown-menu-right shadow animated--grow-in" aria-labelledby="userDropdown">
          <a class="dropdown-item" href="#">
            <i class="glyphicon glyphicon-user"></i>
            Profile
          </a>
          <a class="dropdown-item" href="#">
            <i class="glyphicon glyphicon- glyphicon-cog"></i>
            Settings
          </a>
          <div class="dropdown-divider"></div>
          <a class="dropdown-item" href="#" data-toggle="modal" data-target="#logoutModal">
            <i class="glyphicon glyphicon-log-out"></i>
            Logout
          </a>
        </div>
      </li>
    </ul>
  </nav>

