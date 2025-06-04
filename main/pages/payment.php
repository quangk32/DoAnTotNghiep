<?php
date_default_timezone_set('Asia/Ho_Chi_Minh');
session_start();

$vnp_TmnCode = "PFRIEH06";
$vnp_HashSecret = "HZ83SJZAXLHPBWFNPL7RYV6BY30JHN8U";
$vnp_Url = "https://sandbox.vnpayment.vn/paymentv2/vpcpay.html";
$vnp_Returnurl = "https://d06d-2001-ee0-1ac4-3ad1-745f-4874-263b-24b2.ngrok-free.app/DATN/main/pages/vnpay_return.php";

$vnp_TxnRef = date("YmdHis") . rand(1000,9999);
$vnp_CreateDate = date('YmdHis');
$vnp_Amount = $_SESSION['gia'] * 100;
$vnp_OrderInfo = "Thanh toán đơn hàng tại website của bạn";
$vnp_OrderType = 'billpayment';
$vnp_Locale = 'vn';
$vnp_IpAddr = $_SERVER['REMOTE_ADDR'];

$inputData = [
    "vnp_Version" => "2.1.0",
    "vnp_TmnCode" => $vnp_TmnCode,
    "vnp_Amount" => $vnp_Amount,
    "vnp_Command" => "pay",
    "vnp_CreateDate" => $vnp_CreateDate,
    "vnp_CurrCode" => "VND",
    "vnp_IpAddr" => $vnp_IpAddr,
    "vnp_Locale" => $vnp_Locale,
    "vnp_OrderInfo" => $vnp_OrderInfo,
    "vnp_OrderType" => $vnp_OrderType,
    "vnp_ReturnUrl" => $vnp_Returnurl,
    "vnp_TxnRef" => $vnp_TxnRef,
];

ksort($inputData);
$hashdata = http_build_query($inputData, '', '&');
$vnpSecureHash = hash_hmac('sha512', $hashdata, $vnp_HashSecret);
$vnp_Url = $vnp_Url . '?' . $hashdata . '&vnp_SecureHash=' . $vnpSecureHash;

header("Location: $vnp_Url");
exit();
