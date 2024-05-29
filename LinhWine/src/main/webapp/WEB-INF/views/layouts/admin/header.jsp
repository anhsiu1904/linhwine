<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="en">

<head>
  <!-- Required meta tags -->
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
  <title>Trang chủ</title>
  <!-- plugins:css -->
  <link rel='stylesheet' id='flatsome-main-css' href='<c:url value="/assets/user/css/flatsome2916.css' type='text/css" />' media='all' />
  <link rel="stylesheet" href="<c:url value="/assets/admin/vendors/mdi/css/materialdesignicons.min.css" />">
  <link rel="stylesheet" href="<c:url value="/assets/admin/vendors/base/vendor.bundle.base.css" />">
  <!-- endinject -->
  <!-- plugin css for this page -->
  <link rel="stylesheet" href="<c:url value="/assets/admin/vendors/datatables.net-bs4/dataTables.bootstrap4.css" />">
  <!-- End plugin css for this page -->
  <!-- inject:css -->
  <link rel="stylesheet" href="<c:url value="/assets/admin/css/style.css" />">
  <!-- endinject -->
  <link rel="shortcut icon" href="images/favicon.png" />
  <script src="http://ajax.aspnetcdn.com/ajax/jQuery/jquery-3.2.1.js"></script> 
  <script src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.6.0/Chart.min.js"></script>
</head>

<body>
  <div class="container-scroller">
    <!-- partial:partials/_navbar.html -->
    <nav class="navbar col-lg-12 col-12 p-0 fixed-top d-flex flex-row">
      <div class="navbar-brand-wrapper d-flex justify-content-center">
        <div class="navbar-brand-inner-wrapper d-flex justify-content-between align-items-center w-100">
          <a class="navbar-brand brand-logo" href="<c:url value="/quan-tri/trang-chu" />"><img
              src="<c:url value="/assets/user/img/logo.jpg" />" alt="logo" /></a>
          <a class="navbar-brand brand-logo-mini" href="<c:url value="/quan-tri/trang-chu" />"><img
              src="<c:url value="/assets/user/img/logo.jpg" />" alt="logo" /></a>
          <button class="navbar-toggler navbar-toggler align-self-center" type="button" data-toggle="minimize">
            <span class="mdi mdi-sort-variant"></span>
          </button>
        </div>
      </div>
      <div class="navbar-menu-wrapper d-flex align-items-center justify-content-end">
        <ul class="navbar-nav mr-lg-4 w-100">
          <li class="nav-item nav-search d-none d-lg-block w-100">
            <div class="input-group">
              <div class="input-group-prepend">
                <span class="input-group-text" id="search">
                  <i class="mdi mdi-magnify"></i>
                </span>
              </div>
              <input type="text" class="form-control" placeholder="Nhập từ khóa tìm kiếm" aria-label="search"
                aria-describedby="search">
            </div>
          </li>
        </ul>
        <ul class="navbar-nav navbar-nav-right">

          <li class="nav-item nav-profile dropdown">
            <a class="nav-link dropdown-toggle" href="#" data-toggle="dropdown" id="profileDropdown">
              <img
                src="https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTLTV_Q9PEpanZDpvpboBdIfVWyPDBsJTn1hg&usqp=CAU"
                alt="profile" />
              <span class="nav-profile-name">${LoginInfo.hoten }</span>
            </a>
            <div class="dropdown-menu dropdown-menu-right navbar-dropdown" aria-labelledby="profileDropdown">
              <!-- <a class="dropdown-item">
                <i class="mdi mdi-settings text-primary"></i>
                Settings
              </a> -->
              <a href="<c:url value="/dang-xuat" />" class="dropdown-item">
                <i class="mdi mdi-logout text-primary"></i>
                Đăng xuất
              </a>
            </div>
          </li>
        </ul>
        <button class="navbar-toggler navbar-toggler-right d-lg-none align-self-center" type="button"
          data-toggle="offcanvas">
          <span class="mdi mdi-menu"></span>
        </button>
      </div>
    </nav>
    <!-- partial -->
    <div class="container-fluid page-body-wrapper">
      <!-- partial:partials/_sidebar.html -->
      <nav class="sidebar sidebar-offcanvas" id="sidebar">
        <ul class="nav">
          <li class="nav-item">
            <a class="nav-link" href="<c:url value="/quan-tri/thong-ke" />">
              <i class="mdi mdi-view-dashboard mr-2"></i>
              <span class="menu-title">Bảng Điều Khiển</span>
            </a>
          </li>
          <li class="nav-item">
            <a class="nav-link" href="<c:url value="/quan-tri/quan-ly-san-pham" />">
              <i class="mdi mdi-cube mr-2"></i>
              <span class="menu-title">Quản Lý Sản Phẩm</span>
            </a>
          </li>
          <li class="nav-item">
            <a class="nav-link" href="<c:url value="/quan-tri/quan-ly-danh-muc" />">
              <i class="mdi mdi-file-document-box  mr-2"></i>
              <span class="menu-title">Quản Lý Danh Mục</span>
            </a>
          </li>
          <li class="nav-item">
            <a class="nav-link" href="<c:url value="/quan-tri/quan-ly-hoa-don" />">
              <i class="mdi mdi-file-document  mr-2"></i>
              <span class="menu-title">Quản Lý Hóa Đơn</span>
            </a>
          </li>
          <li class="nav-item">
            <a class="nav-link" href="<c:url value="/quan-tri/quan-ly-tai-khoan" />">
              <i class="mdi mdi-account  mr-2"></i>
              <span class="menu-title">Quản Lý Tài Khoản</span>
            </a>
          </li>
          <li class="nav-item">
            <a class="nav-link" href="<c:url value="/quan-tri/quan-ly-tin-tuc" />">
              <i class="mdi mdi-ruler mr-2"></i>
              <span class="menu-title">Quản Lý Tin Tức</span>
            </a>
          </li>
        </ul>
      </nav>