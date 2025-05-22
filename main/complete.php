<?php
session_start();
$baseUrl = './mail';
require_once('layouts/header.php');
require_once('db/database.php'); 

$db = new Database();

$invoices_directory = __DIR__ . '/' . $baseUrl . '/invoices/';
if (!is_dir($invoices_directory)) {
    mkdir($invoices_directory, 0777, true); 
}

// Kiểm tra giỏ hàng
if (!isset($_SESSION['cart']) || count($_SESSION['cart']) == 0) {
    echo "<p>Giỏ hàng của bạn đang trống.</p>";
    exit;
}

// Kiểm tra người dùng
if (!isset($_SESSION['user']['id'])) {
    exit("Thiếu thông tin người dùng, vui lòng đăng nhập lại.");
}

// Lấy thông tin người dùng
$user_id = intval($_SESSION['user']['id']);
$name = htmlspecialchars($_SESSION['user']['name']);
$email = htmlspecialchars($_SESSION['user']['email']);
$phone = htmlspecialchars($_SESSION['user']['phone']);
$address = htmlspecialchars($_SESSION['user']['address']);

$tieude = "Đặt hàng thành công!";
$noidung = "<p>Cảm ơn quý khách đã đặt hàng của chúng tôi: </p>";
$noidung .= "<h4>Đơn hàng của bạn bao gồm: </h4>";
$noidung .= "<table style='border-collapse: collapse; width: 100%; border: 1px solid black;'>";

$tongTien = 0;
foreach ($_SESSION['cart'] as $variant_id => $item) {
    $tien = $item['discount'] * $item['num'];
    $tongTien += $tien;
    $noidung .= "<tr>
        <td>" . htmlspecialchars($item['name']) . "</td>
        <td>" . number_format($item['discount']) . " VND</td>
        <td>" . intval($item['num']) . "</td>
    </tr>";
}
$noidung .= "</table>";

// Thêm đơn hàng vào bảng orders
$order_sql = "INSERT INTO orders (user_id, fullname, email, phone_number, address, order_date, total_money, status) 
              VALUES ($user_id, '$name', '$email', '$phone', '$address', NOW(), $tongTien, 0)";
$db->execute($order_sql);

// Lấy ID đơn hàng vừa thêm
$order_id = $db->getLastInsertedId();

// Thêm chi tiết đơn hàng và cập nhật kho
foreach ($_SESSION['cart'] as $variant_id => $item) {
    $variant_id_int = intval($variant_id);
    
    $sql = "SELECT product_id FROM product_variants WHERE id = $variant_id_int LIMIT 1";
    $variant_info = $db->executeResult($sql, true);
    $product_id = $variant_info ? intval($variant_info['product_id']) : 0;

    $price = floatval($item['discount']);
    $num = intval($item['num']);
    $total_money = $price * $num;
    $size = isset($item['size']) ? addslashes($item['size']) : '';
    $color = isset($item['color']) ? addslashes($item['color']) : '';

    $order_detail_sql = "INSERT INTO order_details (order_id, product_id, price, num, total_money, size, color) 
                         VALUES ($order_id, $product_id, $price, $num, $total_money, '$size', '$color')";
    $db->execute($order_detail_sql);

    $update_product_sql = "UPDATE products SET quantity = quantity - $num WHERE id = $product_id";
    $db->execute($update_product_sql);

    $update_variant_sql = "UPDATE product_variants SET quantity = quantity - $num WHERE id = $variant_id_int";
    $db->execute($update_variant_sql);
}

// Xóa giỏ hàng
unset($_SESSION['cart']);

// Hiển thị thông báo
echo "<div class='container' style='margin-top: 20px;'>";
echo "<div class='row'>";
echo "<div style='text-align: center;'>";
echo "<h1 style='color: green'>BẠN ĐÃ TẠO ĐƠN HÀNG THÀNH CÔNG!!!</h1>";
echo "<h4>Cảm ơn quý khách đã đặt mua sản phẩm của chúng tôi! Đơn hàng của quý khách đã được gửi đến email của bạn và sẽ giao hàng trong thời gian sớm nhất.</h4>";
echo "<a href='index.php'><button class='btn btn-success' style='border-radius: 0px; font-size: 26px;'>TIẾP TỤC MUA HÀNG</button></a>";
echo "</div></div></div>";

require_once('./layouts/footer.php');
?>
