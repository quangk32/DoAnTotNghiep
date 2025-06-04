<?php
    $sv = "localhost";
    $us = "root";
    $pw = "";
    $db = "thoitrangnam";
    $baseUrl = "/DATN/main"; // Đường dẫn gốc của website
    date_default_timezone_set('Asia/Ho_Chi_Minh');  // đặt timezone cho Việt Nam

    $conn = mysqli_connect($sv,$us,$pw,$db);
?>