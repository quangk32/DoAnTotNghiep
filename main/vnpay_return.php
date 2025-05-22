<?php
if (session_status() == PHP_SESSION_NONE) {
    session_start();
}
error_reporting(E_ALL);
ini_set('display_errors', 1);

require_once('layouts/header.php');
require_once('db/database.php');

// Thông tin cấu hình VNPay
$vnp_HashSecret = "UDKS82G4M3342R9FYU19SWAH6GMW643D"; // Mã HashSecret từ VNPay

// Lấy dữ liệu trả về từ VNPay
$vnp_ResponseData = $_GET; // Dữ liệu trả về từ VNPay
if (empty($vnp_ResponseData)) {
    die('Không có dữ liệu trả về từ VNPay.');
}

$secureHash = $vnp_ResponseData['vnp_SecureHash']; // Secure Hash
unset($vnp_ResponseData['vnp_SecureHash']); // Xóa secure hash khỏi dữ liệu trả về
ksort($vnp_ResponseData); // Sắp xếp dữ liệu

// Tạo lại chuỗi hash để kiểm tra
$hashdata = "";
foreach ($vnp_ResponseData as $key => $value) {
    $hashdata .= urlencode($key) . "=" . urlencode($value) . '&';
}
$hashdata = rtrim($hashdata, '&'); // Loại bỏ ký tự & ở cuối

// Tính toán secure hash
$expectedSecureHash = hash_hmac('sha512', $hashdata, $vnp_HashSecret);

// Kiểm tra xem giao dịch có thành công hay không
if ($secureHash === $expectedSecureHash && $vnp_ResponseData['vnp_ResponseCode'] === '00') {
    // Ghi vào database hoặc xử lý đơn hàng
    echo "<h3>Thanh toán thành công!</h3>";
    include('complete.php'); // Chuyển đến file complete.php
} else {
    // Xử lý nếu thanh toán không thành công
    echo "<h3>Thanh toán không thành công!</h3>";
    echo "<p>Mã phản hồi: " . htmlspecialchars($vnp_ResponseData['vnp_ResponseCode']) . "</p>";
    echo "<p>Thông tin chi tiết:</p>";
    echo "<pre>";
    print_r($vnp_ResponseData); // Hiển thị dữ liệu trả về để kiểm tra
    echo "</pre>";
}

require_once('./layouts/footer.php');
?>
