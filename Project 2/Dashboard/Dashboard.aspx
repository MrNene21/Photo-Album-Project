<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Dashboard.aspx.cs" Inherits="Project_2.Dashboard.Dashboard" %>


<!DOCTYPE html> 

<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <meta charset="utf-8"/>
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no"/>
    <title>Photo Album App</title>
    <link rel="stylesheet" href="assets/vendors/iconfonts/mdi/css/materialdesignicons.min.css"/>
    <link rel="stylesheet" href="assets/vendors/iconfonts/ionicons/css/ionicons.css"/>
    <link rel="stylesheet" href="assets/vendors/iconfonts/typicons/src/font/typicons.css"/>
    <link rel="stylesheet" href="assets/vendors/iconfonts/flag-icon-css/css/flag-icon.min.css"/>
    <link rel="stylesheet" href="assets/vendors/css/vendor.bundle.base.css"/>
    <link rel="stylesheet" href="assets/vendors/css/vendor.bundle.addons.css"/>
    <link rel="stylesheet" href="assets/css/shared/style.css"/>
    <link rel="stylesheet" href="assets/css/flax/style.css"/>
    <link rel="shortcut icon" href="assets/images/favicon.png" />
  </head> 
<body>
      <form id="form1" runat="server">
          <div class="container-scroller">
              <!-- partial:partials/_navbar.html -->
              <nav class="navbar default-layout col-lg-12 col-12 p-0 fixed-top d-flex flex-row">
                  <div class="text-center navbar-brand-wrapper d-flex align-items-top justify-content-center">
                      <a class="navbar-brand brand-logo" href="index.html">
                      </a>
                      <a class="navbar-brand brand-logo-mini" href="index.html">
                          <img src="assets/images/favicon.png" alt="logo" />
                      </a>
                  </div>
                  <div class="navbar-menu-wrapper d-flex align-items-center">
                      <h5><span class="text-muted d-block text-center text-sm-left d-sm-inline-block" id="date_txt" onclick="load()">Date: </span></h5>
                      <ul class="navbar-nav ml-auto">
                          <li class="nav-item dropdown d-none d-xl-inline-block user-dropdown">
                              <a class="nav-link dropdown-toggle" id="UserDropdown" href="#" data-toggle="dropdown" aria-expanded="false">
                                  <img class="img-xs rounded-circle" src="assets/images/faces/profile/user.png" alt="Profile image">
                              </a>
                              <div class="dropdown-menu dropdown-menu-right navbar-dropdown" aria-labelledby="UserDropdown">
                                  <div class="dropdown-header text-center">
                                      <img class="img-md rounded-circle" src="assets/images/faces/profile/user.png" alt="Profile image">
                                      <p class="mb-1 mt-3 font-weight-semibold">Luyanda</p>
                                      <p class="font-weight-light text-muted mb-0">luyandanene50@gmail.com</p>
                                  </div>
                                  <a class="dropdown-item" href="javascript:void(0)">Sign Out<i class="dropdown-item-icon ti-power-off"></i></a>
                              </div>
                          </li>
                      </ul>
                      <button class="navbar-toggler navbar-toggler-right d-lg-none align-self-center" type="button" data-toggle="offcanvas">
                          <span class="mdi mdi-menu"></span>
                      </button>
                  </div>
              </nav>
              <!-- partial -->
              <div class="container-fluid page-body-wrapper">
                  <!-- partial:partials/_sidebar.html -->
                  <nav class="sidebar sidebar-offcanvas" id="sidebar">
                      <ul class="nav">
                          <li class="nav-item nav-category">Main Menu</li>
                          <li class="nav-item" runat="server" OnClick="DashboardClick">
                              <a class="nav-link" href="index.html">
                                  <i class="menu-icon typcn typcn-document-text"></i>
                                  <span class="menu-title">View Photos</span>
                              </a>
                          </li>

                           <li class="nav-item" runat="server" OnClick="ShowClasses">
                              <a class="nav-link" href="#">
                                  <i class="menu-icon typcn typcn-document-text"></i>
                                  <span class="menu-title">Upload</span>

                              </a>
                          </li>
                           <li class="nav-item">
                              <a class="nav-link" href="index.html">
                                  <i class="menu-icon typcn typcn-document-text"></i>
                                  <span class="menu-title">Share</span>
                              </a>
                          </li>
                          <li class="nav-item">
                              <a class="nav-link" href="pages/forms/basic_elements.html">
                                  <i class="menu-icon typcn typcn-shopping-bag"></i>
                                  <span class="menu-title">da da da</span>
                              </a>
                          </li>
                      </ul>
                  </nav>
              </div>
              <!-- page-body-wrapper ends -->
          <!-- container-scroller -->
          <!-- plugins:js -->
          <script src="assets/vendors/js/vendor.bundle.base.js"></script>
          <script src="assets/vendors/js/vendor.bundle.addons.js"></script>
          <!-- endinject -->
          <!-- Plugin js for this page-->
          <!-- End plugin js for this page-->
          <!-- inject:js -->
          <script src="assets/js/shared/off-canvas.js"></script>
          <script src="assets/js/shared/misc.js"></script>
          <!-- endinject -->
          <!-- Custom js for this page-->
          <script src="assets/js/flax/dashboard.js"></script>
          <!-- End custom js for this page-->
      </form>
    
</body>
</html>

