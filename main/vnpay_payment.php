<?php
session_start();

// Thông tin cấu hình VNPay
$vnp_TmnCode = "RRRQSGNN"; // Mã TmnCode từ VNPay
$vnp_HashSecret = "UDKS82G4M3342R9FYU19SWAH6GMW643D"; // Mã HashSecret từ VNPay
$vnp_Url = "https://sandbox.vnpayment.vn/paymentv2/vpcpay.html"; // URL sandbox VNPay
$vnp_Returnurl = "https://9c0f-2a09-bac1-7ae0-50-00-3d0-2a.ngrok-free.app/new dacn/N19_SportStore/vnpay_return.php"; // URL xử lý phản hồi (cần thay đổi cho đúng địa chỉ)

$vnp_TxnRef = date("YmdHis"); // Mã đơn hàng
$vnp_OrderInfo = "Thanh toán đơn hàng tại website của bạn"; // Thông tin đơn hàng
$vnp_OrderType = 'billpayment'; // Loại đơn hàng
$vnp_Amount = $_SESSION['gia'] * 100; // Tổng tiền (x100 để chuyển sang đơn vị VNĐ)
$vnp_Locale = 'vn'; // Ngôn ngữ
$vnp_IpAddr = $_SERVER['REMOTE_ADDR']; // Địa chỉ IP của khách hàng

// Tạo mảng dữ liệu đầu vào
$inputData = array(
    "vnp_Version" => "2.1.0",
    "vnp_TmnCode" => $vnp_TmnCode,
    "vnp_Amount" => $vnp_Amount,
    "vnp_Command" => "pay",
    "vnp_CreateDate" => date('YmdHis'),
    "vnp_CurrCode" => "VND",
    "vnp_IpAddr" => $vnp_IpAddr,
    "vnp_Locale" => $vnp_Locale,
    "vnp_OrderInfo" => $vnp_OrderInfo,
    "vnp_OrderType" => $vnp_OrderType,
    "vnp_ReturnUrl" => $vnp_Returnurl,
    "vnp_TxnRef" => $vnp_TxnRef
);

// Sắp xếp dữ liệu và tạo chuỗi hash
ksort($inputData);
$hashdata = "";
$query = "";
$i = 0;
foreach ($inputData as $key => $value) {
    if ($i == 1) {
        $hashdata .= '&' . urlencode($key) . "=" . urlencode($value);
    } else {
        $hashdata .= urlencode($key) . "=" . urlencode($value);
        $i = 1;
    }
    $query .= urlencode($key) . "=" . urlencode($value) . '&';
}

// Tạo URL thanh toán
$vnp_Url = $vnp_Url . "?" . $query;
$vnpSecureHash = hash_hmac('sha512', $hashdata, $vnp_HashSecret);
$vnp_Url .= 'vnp_SecureHash=' . $vnpSecureHash;

// Chuyển hướng đến VNPay
header('Location: ' . $vnp_Url);
die();
?>
