<?php
$baseUrl = ""; // Như trên, hoặc lấy từ config
echo "<h3>Mô phỏng Thanh toán qua VNPay</h3>";
echo "<p>Chọn kết quả thanh toán:</p>";
echo "<a href='" . $baseUrl . "/pages/vnpay_return.php?vnp_ResponseCode=00&vnp_Amount=100000&vnp_TransactionStatus=00&vnp_TmnCode=58J8XP8R&vnp_SecureHash=mockhash'><button style='padding: 10px 20px; margin: 10px; background-color: green; color: white; border: none; cursor: pointer;'>Thanh toán thành công</button></a>";
echo "<a href='" . $baseUrl . "/pages/vnpay_return.php?vnp_ResponseCode=99&vnp_Amount=100000&vnp_TransactionStatus=01&vnp_TmnCode=58J8XP8R&vnp_SecureHash=mockhash'><button style='padding: 10px 20px; margin: 10px; background-color: red; color: white; border: none; cursor: pointer;'>Thanh toán thất bại</button></a>";
?>
