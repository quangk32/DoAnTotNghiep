<?php
if (session_status() == PHP_SESSION_NONE) {
    session_start();
}
error_reporting(E_ALL);
ini_set('display_errors', 1);

require_once(__DIR__ . '/../db/database.php'); // Đảm bảo include db trước, không liên quan header

$vnp_HashSecret = "HZ83SJZAXLHPBWFNPL7RYV6BY30JHN8U";

$vnp_ResponseData = $_GET;
if (empty($vnp_ResponseData)) {
    die('Không có dữ liệu trả về từ VNPay.');
}

$secureHash = $vnp_ResponseData['vnp_SecureHash'] ?? '';
unset($vnp_ResponseData['vnp_SecureHash'], $vnp_ResponseData['vnp_SecureHashType']);
ksort($vnp_ResponseData);

$hashData = "";
foreach ($vnp_ResponseData as $key => $value) {
    $hashData .= urlencode($key) . "=" . urlencode($value) . '&';
}
$hashData = rtrim($hashData, '&');

$expectedSecureHash = hash_hmac('sha512', $hashData, $vnp_HashSecret);

$transactionStatus = $vnp_ResponseData['vnp_TransactionStatus'] ?? '';
$responseCode = $vnp_ResponseData['vnp_ResponseCode'] ?? '';

// **Xử lý chuyển hướng trước khi output bất kỳ nội dung nào**
if ($secureHash === $expectedSecureHash && $transactionStatus === '00' && $responseCode === '00') {
    header("Location: complete.php"); // Đường dẫn tương đối, điều chỉnh cho đúng
    exit();
}

// Nếu không chuyển hướng thì mới include header và show lỗi
require_once(__DIR__ . '/../layouts/header.php');

echo "<h3>Thanh toán không thành công!</h3>";
echo "<p>Mã trạng thái: " . htmlspecialchars($transactionStatus) . "</p>";
echo "<p>Mã phản hồi: " . htmlspecialchars($responseCode) . "</p>";
echo "<p>Thông tin chi tiết:</p>";
echo "<pre>";
print_r($vnp_ResponseData);
echo "</pre>";

require_once(__DIR__ . '/../layouts/footer.php');
?>
