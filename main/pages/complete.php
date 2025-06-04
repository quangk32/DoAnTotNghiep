<?php
session_start();
require_once(__DIR__ . '/../layouts/header.php');
require_once(__DIR__ . '/../db/database.php');

$db = new Database();

if (!isset($_SESSION['user']['id'])) {
    exit("Vui lòng đăng nhập để thanh toán.");
}

$user_id = intval($_SESSION['user']['id']);

// Lấy giỏ hàng của user
$sql = "
SELECT 
  ci.id as cart_item_id,
  ci.product_variant_id,
  ci.quantity,
  ci.total_price,
  pv.price,
  p.name
FROM carts c
JOIN cart_items ci ON ci.cart_id = c.id AND ci.deleted = 0
JOIN product_variants pv ON ci.product_variant_id = pv.id
JOIN products p ON pv.product_id = p.id
WHERE c.user_id = $user_id AND c.deleted = 0
";

$cartItems = $db->executeResult($sql);

if (!$cartItems || count($cartItems) == 0) {
    exit("Giỏ hàng của bạn đang trống.");
}

// Tính tổng tiền
$tongTien = 0;
foreach ($cartItems as $item) {
    $tongTien += $item['total_price'];
}

// Lấy thông tin người dùng
$name = addslashes($_SESSION['user']['name']);
$email = addslashes($_SESSION['user']['email']);
$phone = addslashes($_SESSION['user']['phone']);
$address = addslashes($_SESSION['user']['address']);

// Tạo đơn hàng
$order_sql = "INSERT INTO orders (user_id, fullname, email, phone_number, address, order_date, total_money, status, deleted) 
              VALUES ($user_id, '$name', '$email', '$phone', '$address', NOW(), $tongTien, 0, 0)";
$db->execute($order_sql);
$order_id = $db->getLastInsertedId();

// Thêm chi tiết đơn hàng và cập nhật tồn kho
foreach ($cartItems as $item) {
    $variant_id = intval($item['product_variant_id']);
    $price = floatval($item['price']);
    $num = intval($item['quantity']);
    $cart_item_id = intval($item['cart_item_id']);

    $detail_sql = "INSERT INTO order_details (order_id, product_variant_id, price, num, deleted) 
                   VALUES ($order_id, $variant_id, $price, $num, 0)";
    $db->execute($detail_sql);

    $update_variant_sql = "UPDATE product_variants SET quantity = quantity - $num WHERE id = $variant_id";
    $db->execute($update_variant_sql);

    $delete_cart_item_sql = "UPDATE cart_items SET deleted = 1 WHERE id = $cart_item_id";
    $db->execute($delete_cart_item_sql);
}

// Hiển thị giao diện thành công
?>

<style>
    html, body {
        height: 100%;
    }
</style>

<div class="container d-flex flex-column justify-content-center align-items-center" style="min-height: 70vh;">
    <div class="text-center">
        <h1 class="text-success mb-3">🎉 Đặt hàng thành công!</h1>
        <p class="lead mb-4">Cảm ơn quý khách đã tin tưởng. Chúng tôi sẽ liên hệ sớm để giao hàng.</p>
        <a href="<?= $baseUrl ?>/index.php" class="btn btn-primary btn-lg">
            🛍️ Tiếp tục mua sắm
        </a>
    </div>
</div>

<?php require_once(__DIR__ . '/../layouts/footer.php'); ?>
