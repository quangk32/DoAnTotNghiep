<?php
include_once(__DIR__. '/../db/config.php');
session_start();

// Hủy tất cả các biến session
$_SESSION = [];

// Hủy session hiện tại
session_destroy();

// Chuyển hướng về trang chủ
header("Location: $baseUrl/index.php");
exit;
