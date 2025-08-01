<?php
	include_once(__DIR__. '/../../db/config.php');
	include_once(__DIR__. '/../../utils/utility.php');
	include_once(__DIR__. '/../../db/database.php');
    $user = Utility::getUserToken(); 
?>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title><?= $title ?></title>

    <link rel="icon" type="image/png" href="<?= $baseUrl ?>/admin/dist/img/logo.png">

    <!-- Google Font: Source Sans Pro -->
    <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Source+Sans+Pro:300,400,400i,700&display=fallback">
    <!-- Font Awesome -->
    <link href="https://kit-pro.fontawesome.com/releases/v5.15.4/css/pro.min.css" rel="stylesheet">
    <!-- Ionicons -->
    <link rel="stylesheet" href="https://code.ionicframework.com/ionicons/2.0.1/css/ionicons.min.css">
    <!-- Tempusdominus Bootstrap 4 -->
    <link rel="stylesheet" href="<?= $baseUrl ?>/admin/plugins/tempusdominus-bootstrap-4/css/tempusdominus-bootstrap-4.min.css">
    <!-- iCheck -->
    <link rel="stylesheet" href="<?= $baseUrl ?>/admin/plugins/icheck-bootstrap/icheck-bootstrap.min.css">
    <!-- JQVMap -->
    <link rel="stylesheet" href="<?= $baseUrl ?>/admin/plugins/jqvmap/jqvmap.min.css">
    <!-- Theme style -->
    <link rel="stylesheet" href="<?= $baseUrl ?>/admin/dist/css/adminlte.min.css">
    <!-- My css -->
    <link rel="stylesheet" href="<?= $baseUrl ?>/admin/dist/css/styles.css">
    <!-- overlayScrollbars -->
    <link rel="stylesheet" href="<?= $baseUrl ?>/admin/plugins/overlayScrollbars/css/OverlayScrollbars.min.css">
    <!-- Daterange picker -->
    <link rel="stylesheet" href="<?= $baseUrl ?>/admin/plugins/daterangepicker/daterangepicker.css">
    <!-- summernote -->
    <link rel="stylesheet" href="<?= $baseUrl ?>/admin/plugins/summernote/summernote-bs4.min.css">
    <link rel="stylesheet" href="<?= $baseUrl ?>/admin/plugins/ckeditor/">


</head>

<body class="hold-transition sidebar-mini layout-fixed">
    <div class="wrapper">
        <!-- Navbar -->
        <nav class="main-header navbar navbar-expand navbar-white navbar-light">
            <!-- Left navbar links -->
            <ul class="navbar-nav">
                <li class="nav-item">
                    <a class="nav-link" data-widget="pushmenu" href="#" role="button"><i class="fas fa-bars"></i></a>
                </li>
                <li class="nav-item d-none d-sm-inline-block">
                    <a href="<?= $baseUrl ?>/admin/index.php" class="nav-link">Trang chủ</a>
                </li>
                <!-- <li class="nav-item d-none d-sm-inline-block">
                    <a href="#" class="nav-link">Liên hệ</a>
                </li> -->
            </ul>

            <!-- Right navbar links -->

        </nav>
        <!-- /.navbar -->

        <!-- Main Sidebar Container -->
        <aside class="main-sidebar sidebar-dark-primary elevation-4">
            <!-- Brand Logo -->
            <a href="<?= $baseUrl ?>/admin/index.php" class="brand-link">
                <img src="<?= $baseUrl ?>/admin/dist/img/logo.jfif" alt="AdminLTE Logo" class="brand-image img-circle elevation-3" style="opacity: .8">
                <span class="brand-text font-weight-light font-weight-bold">Torano</span>
            </a>

            <!-- Sidebar -->
            <div class="sidebar">
                <!-- Sidebar user panel (optional) -->
                <div class="user-panel mt-3 pb-3 mb-3 d-flex">
                    <div class="image">
                        <img src="<?= $baseUrl ?>/<?= $user['avatar'] ?>" class="img-circle elevation-2">
                    </div>
                    <div class="info">
                        <a href="#" class="d-block"><?= $user['fullname'] ?></a>
                        <a href="<?= $baseUrl ?>/admin/authen/logout.php" onclick="return confirm('Bạn có muốn đăng xuất không?')" class="d-block btn-logout">Đăng xuất</a>
                    </div>
                </div>

                <!-- SidebarSearch Form -->
                <div class="form-inline">
                    <div class="input-group" data-widget="sidebar-search">
                        <input class="form-control form-control-sidebar" type="search" placeholder="Search" aria-label="Search">
                        <div class="input-group-append">
                            <button class="btn btn-sidebar">
                                <i class="fas fa-search fa-fw"></i>
                            </button>
                        </div>
                    </div>
                </div>

                <!-- Sidebar Menu -->
                <nav class="mt-2">
                    <ul class="nav nav-pills nav-sidebar flex-column" data-widget="treeview" role="menu" data-accordion="false">
                        <!-- Add icons to the links using the .nav-icon class
               with font-awesome or any other icon font library -->
                        <li class="nav-item ">
                            <a href="#" class="nav-link">
                                <i class="nav-icon fa fa-list-alt"></i>
                                <p>
                                    Quản lý danh mục
                                    <i class="right fas fa-angle-left"></i>
                                </p>
                            </a>
                            <ul class="nav nav-treeview">
                                <li class="nav-item">
                                    <a href="<?= $baseUrl ?>/admin/category/editor.php" class="nav-link ">
                                        <i class="far fa-circle nav-icon"></i>
                                        <p>Thêm danh mục</p>
                                    </a>
                                </li>
                                <li class="nav-item">
                                    <a href="<?= $baseUrl ?>/admin/category/index.php" class="nav-link ">
                                        <i class="far fa-circle nav-icon"></i>
                                        <p>Danh sách danh mục</p>
                                    </a>
                                </li>
                            </ul>
                        </li>
                        <li class="nav-item ">
                            <a href="#" class="nav-link ">
                                <i class="nav-icon fab fa-product-hunt"></i>
                                <p>
                                    Quản lý sản phẩm
                                    <i class="right fas fa-angle-left"></i>
                                </p>
                            </a>
                            <ul class="nav nav-treeview">
                                <li class="nav-item">
                                    <a href="<?= $baseUrl ?>/admin/product/editor.php" class="nav-link ">
                                        <i class="far fa-circle nav-icon"></i>
                                        <p>Thêm sản phẩm</p>
                                    </a>
                                </li>
                                <li class="nav-item">
                                    <a href="<?= $baseUrl ?>/admin/product/index.php" class="nav-link ">
                                        <i class="far fa-circle nav-icon"></i>
                                        <p>Danh sách sản phẩm</p>
                                    </a>
                                </li>
                                
                            </ul>
                        </li>
                        <li class="nav-item ">
                            <a href="#" class="nav-link ">
                                <i class="nav-icon fas fa-sliders-h"></i>
                                <p>
                                    Quản Lý Slider
                                    <i class="right fas fa-angle-left"></i>
                                </p>
                            </a>
                            <ul class="nav nav-treeview">
                                <li class="nav-item">
                                    <a href="<?= $baseUrl ?>/admin/slider/editor.php" class="nav-link ">
                                        <i class="far fa-circle nav-icon"></i>
                                        <p>Thêm Slider</p>
                                    </a>
                                </li>
                                <li class="nav-item">
                                    <a href="<?= $baseUrl ?>/admin/slider/index.php" class="nav-link ">
                                        <i class="far fa-circle nav-icon"></i>
                                        <p>Danh sách Slider</p>
                                    </a>
                                </li>
                            </ul>
                        </li>
                        <li class="nav-item ">
                            <a href="#" class="nav-link ">
                                <i class="nav-icon fas fa-users"></i>
                                <p>
                                    Quản lý tài khoản
                                    <i class="right fas fa-angle-left"></i>
                                </p>
                            </a>
                            <ul class="nav nav-treeview">
                                <li class="nav-item">
                                    <a href="<?= $baseUrl ?>/admin/admin/editor.php" class="nav-link ">
                                        <i class="far fa-circle nav-icon"></i>
                                        <p>Thêm tài khoản</p>
                                    </a>
                                </li>
                                <li class="nav-item">
                                    <a href="<?= $baseUrl ?>/admin/admin/index.php" class="nav-link ">
                                        <i class="far fa-circle nav-icon"></i>
                                        <p>DSTK quản trị</p>
                                    </a>
                                </li>
                                <li class="nav-item">
                                    <a href="<?= $baseUrl ?>/admin/users/index.php" class="nav-link ">
                                        <i class="far fa-circle nav-icon"></i>
                                        <p>DSTK khách hàng</p>
                                    </a>
                                </li>
                            </ul>
                        </li>
                        <li class="nav-item ">
                            <a href="#" class="nav-link ">
                                <i class="nav-icon fas fa-user-tag"></i>
                                <p>
                                    Quản lý quyền
                                    <i class="right fas fa-angle-left"></i>
                                </p>
                            </a>
                            <ul class="nav nav-treeview">
                                <li class="nav-item">
                                    <a href="<?= $baseUrl ?>/admin/roles/editor.php" class="nav-link ">
                                        <i class="far fa-circle nav-icon"></i>
                                        <p>Thêm quyền</p>
                                    </a>
                                </li>
                                <li class="nav-item">
                                    <a href="<?= $baseUrl ?>/admin/roles/index.php" class="nav-link ">
                                        <i class="far fa-circle nav-icon"></i>
                                        <p>Danh sách quyền</p>
                                    </a>
                                </li>
                            </ul>
                        </li>

                        <li class="nav-item ">
                            <a href="<?= $baseUrl ?>/admin/order/index.php" class="nav-link " class="nav-link ">
                                <i class="nav-icon fas fa-shopping-cart"></i>
                                <p> Quản lý đơn đặt hàng</p>
                            </a>
                        </li>
                        
                        <li class="nav-item ">
                            <a href="#" class="nav-link ">
                                <i class="nav-icon fas fa-mail-bulk"></i>
                                <p>
                                    Quản lý phản hồi
                                    <i class="right fas fa-angle-left"></i>
                                </p>
                            </a>
                            <ul class="nav nav-treeview">
                                <li class="nav-item">
                                    <a href="<?= $baseUrl ?>/admin/feedback/index.php" class="nav-link ">
                                        <i class="far fa-circle nav-icon"></i>
                                        <p> Danh sách phản hồi</p>
                                    </a>
                                </li>
                            </ul>
                        </li>

                        <li class="nav-item ">
                            <a href="#" class="nav-link ">
                                <i class="nav-icon fas fa-comments"></i>
                                <p>
                                    Quản lý bình luận
                                    <i class="right fas fa-angle-left"></i>
                                </p>
                            </a>
                            <ul class="nav nav-treeview">
                                <li class="nav-item">
                                    <a href="<?= $baseUrl ?>/admin/comments/index.php" class="nav-link ">
                                        <i class="far fa-circle nav-icon"></i>
                                        <p> Danh sách bình luận</p>
                                    </a>
                                </li>
                            </ul>
                        </li>

                        <li class="nav-item ">
                            <a href="#" class="nav-link ">
                                <i class="nav-icon fas fa-star"></i>
                                <p>
                                    Quản lý đánh giá 
                                    <i class="right fas fa-angle-left"></i>
                                </p>
                            </a>
                            <ul class="nav nav-treeview">
                                <li class="nav-item">
                                    <a href="<?= $baseUrl ?>/admin/reviews/index.php" class="nav-link ">
                                        <i class="far fa-circle nav-icon"></i>
                                        <p> Danh sách đánh giá</p>
                                    </a>
                                </li>
                            </ul>
                        </li>

                        <li class="nav-item ">
                            <a href="<?= $baseUrl ?>/admin/statistics/index.php" class="nav-link ">
                                <i class="nav-icon fas fa-chart-bar"></i>
                                <p>
                                    Quản Lý Thống kê
                                    <i class="right fas fa-angle-left"></i>
                                </p>
                            </a>
                            
                        </li>
                    </ul>
                </nav>
                <!-- /.sidebar-menu -->
            </div>
            <!-- /.sidebar -->
        </aside>