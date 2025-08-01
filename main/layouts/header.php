<?php
if (session_status() == PHP_SESSION_NONE) {
    session_start();
}
	include_once(__DIR__. '/../db/config.php');
	include_once(__DIR__. '/../utils/utility.php');
	include_once(__DIR__. '/../db/database.php');

	if(!isset($_SESSION["isLogin"]) || empty($_SESSION["isLogin"])){
		$_SESSION["isLogin"] = 0;
	}
	$db = new Database();
	$sql = "SELECT * from categories where deleted = 0";
	$menuItems = $db->executeResult($sql);
?>
<!DOCTYPE html>
<html>
<head>
	<meta charset="utf-8">
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<title>Torano- Thời trang nam</title>
	<link rel="shortcut icon" href="https://t004.gokisoft.com/uploads/2021/07/1-s-1637-ico-web.jpg">
	<link href="https://kit-pro.fontawesome.com/releases/v5.15.4/css/pro.min.css" rel="stylesheet">
	<!-- Latest compiled and minified CSS -->
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css">

	<!-- jQuery library -->
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>

	<!-- Popper JS -->
	<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>

	<!-- Latest compiled JavaScript -->
	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js"></script>

	<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.6.1/font/bootstrap-icons.css">

<style type="text/css">
	
	.nav li {
		text-transform: uppercase;
		color: #064f88;
		margin-top: 10px;
	}

	.nav li a {
		color:rgb(0, 0, 0);
		font-weight: bold;
		font-size: large;
		font-family: 'Quicksand', sans-serif;
	}

	.nav li a:hover {
		color:rgb(0, 0, 0);
		transition: 0.3s;
	}

	.carousel-inner img {
		height: 20%;
		width: 100%;
	}

	.product-item:hover {
		background-color: #f5f6f7;
		cursor: pointer;
	}

	footer {
		padding-top: 20px;
	}

	footer ul {
		list-style-type: none;
		padding: 0px;
		margin: 0px;
		padding-top: 10px;
		padding-bottom: 10px;
	}

	.cart_icon {
		position: fixed;
		z-index: 999;
		right: 0px;
		top: 45%;
	}

	.cart_icon img {
		width: 45px;
	}

	.cart_icon .cart_count {
		background-color: red;
		color: white;
		font-size: 16px;
		padding-top: 2px;
		padding-bottom: 2px;
		padding-left: 10px;
		padding-right: 10px;
		font-weight: bold;
		border-radius: 12px;
		position: fixed;
		right: 40px;
	}

	.preloader {
		background-color: #fff;
		bottom: 0;
		height: 100%;
		left: 0;
		position: fixed;
		right: 0;
		display: block;
		top: 0;
		width: 100%;
		z-index: 9999;
	}

	.preloader img {
		display: block;
		width: 100px;
		height: 100px;
		position: absolute;
		top: 50%;
		left: 50%;
		-webkit-transform: translate(-50%, -50%);
		-moz-transform: translate(-50%, -50%);
		-ms-transform: translate(-50%, -50%);
		-o-transform: translate(-50%, -50%);
		transform: translate(-50%, -50%);
	}

	#back-to-top {
		background-color: #171717;
		bottom: 20px;
		color: #fff;
		display: none;
		font-size: 24px;
		height: 40px;
		line-height: 40px;
		position: fixed;
		right: 20px;
		text-align: center;
		width: 40px;
		z-index: 99;
	}

	.name {
		color:rgb(0, 0, 0);
		font-family: 'Quicksand', sans-serif;
		
	}

	.nav-item{
		position: relative;
		display: flex;
		align-items: center;
	}
	.nav-item img{
		
		width: 25px;
		height: 25px;
	}
	.nav-item-sub{
		position: absolute;
		top: 20px;
		left: -110px;
		width: 250px;
		list-style: none;
		display: none;
		z-index: 100;
	}
	.nav-item-sub::after{
		
		position: absolute;
		display: block;
		content: "";
		width: 250px;
		height: 30px;
		top: -10px;
		left: 0;
	}
	.nav-item-sub li a{
		color: #28a745;
		font-size: 16px;
		margin-left: -16px;

	}
	.nav-item:hover .nav-item-sub{
		display: block;
		border-radius: 12px;
		background-color: #f5f6f7; 
		margin-top: 16px;
		box-shadow: 4px 4px 4px;
		list-style-type: none;
	}
	.btn-infor ,.btn-out{
		width: 100%;
		text-align: left;
	}
	.btn:hover{
		box-shadow: 4px 4px 4px;
	}
	.btn-out{
		margin-bottom: 16px;
	}
	.btn-out:hover{
		color: red !important; 
	}
	nav{
		background-color:rgb(255, 255, 255);
	}
	#main-menu {
		display: flex;
	}
	#toggle {
		display: none;
		background: #064f88 !important;
		color: #fff;
		text-align: right;
		padding: 10px;
		font-size: 20px;
		cursor: pointer;
	}
	@media screen and (max-width: 1250px) {
		#main-menu {
			flex-direction: column;
			text-align: center;
		}
		#toggle {
			display: block;
		}
		nav {
			display: none;
		}
	}
	.form-group{
		width: 50%;
	}
	.search-form {
		position: relative;
		margin-left: auto;
		margin-right: auto;
		max-width: 300px; 
	}

	.search-form input {
		width: 100%;
		padding: 10px;
		margin: 0 50px;
		border-radius: 5px;
		border: 2px solid rgb(6, 7, 6); 
	}

	.search-form button {
		position: absolute;
		top: 0;
		right: 0;
		height: 100%;
		padding: 10px;
		border-radius: 0 5px 5px 0;
		background-color:rgb(115, 105, 255); 
		color: #fff; 
		border: 1px solidrgb(80, 134, 250); 
		cursor: pointer;
		transition: background-color 0.3s;
	}

	.search-form button:hover {
		background-color:rgb(39, 53, 42); 
	}
	.nav-item > a {
    display: flex;
    align-items: center;
    justify-content: space-between;
    padding-right: 15px; /* Để tránh mũi tên bị chồng lên chữ */
}

.submenu {
    display: none;
    position: absolute;
    top: 25px;
    left: 0;
	min-width: 240px;
    background-color: #fff;
    border-radius: 8px;
    box-shadow: 0 4px 8px rgba(0,0,0,0.15);
    z-index: 1000;
    padding: 10px 0;
    transition: all 0.3s ease;
	list-style-type: none;
	
}

.submenu li {
    padding: 8px 20px;
}

.submenu li a {
    color:rgb(1, 21, 37);
    text-decoration: none;
    font-size: 15px;
    font-weight: bold;
    display: block;
    transition: 0.2s;
}

.submenu li:hover {
    background-color:rgb(241, 241, 241);
}

.submenu li a:hover {
    color:rgb(21, 4, 172);
	box-shadow: 0 4px;
}

.nav-item .submenu {
    display: none;
}

.nav-item.open > .submenu {
    display: block;
}

.nav-item > a .arrow {
    font-size: 24px;
    transition: transform 0.3s ease;
}

.nav-item.open > a .arrow {
    transform: rotate(180deg); /* Quay mũi tên khi menu con mở */
}

</style>
<script>
        $(document).ready(function() {
            $('#toggle').click(function() {
                $('nav').slideToggle();
            });
        });
		
		function toggleMenu(event, element) {
			event.preventDefault(); 
			var parent = element.closest('.nav-item');
			parent.classList.toggle('open');
		}
		$(document).ready(function() {
    // Khi hover vào nav-item
    $('.nav-item').hover(
        function() {
            $(this).addClass('open');  // Mở menu khi hover vào
        },
        function() {
            $(this).removeClass('open');  // Đóng menu khi hover ra ngoài
        }
    );

    // Khi click vào một menu để toggle
    $('.nav-item > a').click(function(event) {
        event.stopPropagation(); // Ngừng sự kiện lan truyền
        var parent = $(this).closest('.nav-item');
        parent.toggleClass('open');
    });

    // Ẩn menu khi click ra ngoài
    $(document).click(function(event) {
        if (!$(event.target).closest('.nav-item').length) {
            $('.nav-item').removeClass('open');
        }
    });
});

</script>
</head>
<body>
	
	<!-- Menu START -->
	<div class="wapper">
		<div id="header">
			<div id="toggle">
				<a href="<?= $baseUrl ?>/index.php" style="text-decoration:none; color:white; font-weight:bold;">TRANG CHỦ</a>
				<i class="fas fa-bars"></i>
			</div>
			<nav>
				<ul class="nav" id="main-menu" style="width: 100%;align-items:center;justify-content:center;padding:20px 0;">
						<li class="nav-item">
							<a href="<?= $baseUrl ?>/index.php">
								<img src="<?= $baseUrl ?>/assets/photos/logo.png" style="width:240px; height:60px; margin:0px" />
							</a>
						</li>
						<li class="nav-item" style="margin-top: 8px !important;">
							<a href="<?= $baseUrl ?>/pages/bestselling.php" style="text-decoration: none ;padding: 0 15px; line-height:20px";>SẢN PHẨM BÁN CHẠY</a>
						</li>
						<li class="nav-item" style="margin-top: 8px !important;">
							<a href="<?= $baseUrl ?>/pages/bestsales.php" style="text-decoration: none ;padding: 0 15px; line-height:20px";>SALES</a>
						</li>
						<li class="nav-item" style=" margin-top: 8px !important;">
						<a href="#" style="cursor: pointer;padding: 0 15px;" onclick="toggleMenu(event, this)">ÁO NAM
							<span class="arrow">&#9662;</span>
						</a>
							
						<ul class="submenu">
							<?php						
								include_once(__DIR__. '/../utils/utility.php');
								include_once(__DIR__. '/../db/database.php');
								if(!isset($_SESSION["isLogin"]) || empty($_SESSION["isLogin"])){
									$_SESSION["isLogin"] = 0;
								}
								$db = new Database();
								$sql = "SELECT * from categories where parent_id = 1 and deleted = 0";
								$menuItems = $db->executeResult($sql);
								foreach ($menuItems as $item){
									?>
									<li class="nav-item">
										<a class="nav-link" href="<?= $baseUrl ?>/pages/category.php?id=<?=$item['id']?>"><?=$item['name']?></a>
									</li>
									<?php
								}
									
							?>
							</ul>
						</li>
						<li class="nav-item" style=" margin-top: 8px !important;">
						<a href="#" style="cursor: pointer;padding: 0 15px;" onclick="toggleMenu(event, this)">QUẦN NAM
							<span class="arrow">&#9662;</span>
						</a>
							
						<ul class="submenu">
							<?php						
								include_once(__DIR__. '/../utils/utility.php');
								include_once(__DIR__. '/../db/database.php');
								if(!isset($_SESSION["isLogin"]) || empty($_SESSION["isLogin"])){
									$_SESSION["isLogin"] = 0;
								}
								$db = new Database();
								$sql = "SELECT * from categories where parent_id = 2 and deleted = 0";
								$menuItems = $db->executeResult($sql);
								foreach ($menuItems as $item){
									?>
									<li class="nav-item">
										<a class="nav-link" href="<?= $baseUrl ?>/pages/category.php?id=<?=$item['id']?>"><?=$item['name']?></a>
									</li>
									<?php
								}
									
							?>
							</ul>
						</li>
						<!--<li class="nav-item" style="margin-top: 8px !important;">
							<a href="<?= $baseUrl ?>/pages/collections.php" style="text-decoration: none ;padding: 0 10px; line-height:20px";>BỘ SƯU TẬP
								<span class="arrow">&#9662;</span>
							</a>
							
						</li>-->
						<li class="nav-item" style="margin-top: 8px !important;">
							<a href="<?= $baseUrl ?>/pages/contact.php" style="text-decoration: none ;padding: 0 10px; line-height:20px";>PHẢN HỒI</a>
						</li>
						
						<div>
							<form action="<?= $baseUrl ?>/pages/search.php" method="GET" class="form-inline my-2 my-lg-0 search-form">
								<input class="form-control mr-sm-2" type="search" placeholder="Tìm kiếm" aria-label="Search" name="query">
								<button class="btn btn-outline-success my-2 my-sm-0" type="submit" style="background-color:blue; text-align:center;">Tìm kiếm</button>
							</form>
						</div>
						<li class="nav-item">
							<?php 
							if($_SESSION["isLogin"]== 0){
								echo '<a class="nav-link" href="'.$baseUrl. '/pages/login.php">Đăng nhập</a>';
							}else{
								?>
								<img src="<?= $baseUrl ?>/assets/photos/Thay-the-hinh-dai-dien-tai-khoan-nguoi-dung-mac.png" alt="">
								<div class="name" style="cursor: pointer;"><b>TÀI KHOẢN</b></div>
								<ul class="submenu" >
									<li >
										<a href="<?= $baseUrl ?>/pages/inforuser.php" class="btn btn-infor" >Thông tin tài khoản</a>
									</li>
									<li >
										<a href="<?= $baseUrl ?>/pages/orderHistory.php" class="btn btn-infor" >Lịch sử đơn hàng</a>
									</li>
									
									<li >
										<a href="<?= $baseUrl ?>/pages/logout.php" class="btn btn-out" >Đăng xuất</a>
									</li>
								</ul>
								<?php
							}
							?>
						</li>
					</ul>
			</nav>
		</div>
	</div>
</body>
