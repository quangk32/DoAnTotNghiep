<?php
session_start();
include_once __DIR__. '/../../utils/utility.php';
include_once __DIR__. '/../../db/database.php';
$token = Utility::getCookie('token');
// huy session, cookie
setcookie('token', '', time() - 100, '/');
session_destroy();
header("Location: login.php");
