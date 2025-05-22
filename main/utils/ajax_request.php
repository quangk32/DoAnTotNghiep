<?php
session_start();
require_once('../db/database.php'); 
require_once('../utils/utility.php'); 
$db = new Database(); 
$action = Utility::getPost('action'); // Hoặc $_POST['action'] nếu không dùng class
switch ($action) {
	case 'update_cart':
		updateCart();
		break;
	case 'delete_cart':
		deleteCart();
		break;
    case 'checkout':
        checkout();
        break;
}

//XU LY TON KHO
function updateCart() {
    $variant_id = intval($_POST['variant_id'] ?? 0);
    $num = intval($_POST['num'] ?? 1);

    if (!isset($_SESSION['cart'][$variant_id])) {
        echo 'Not in cart';
        return;
    }

    require_once('../db/database.php');
    $db = new Database();
    $sql = "SELECT quantity FROM product_variants WHERE id = $variant_id";
    $variant = $db->executeResult($sql, true);

    if (!$variant) {
        echo 'Variant not found';
        return;
    }

    $maxQuantity = $variant['quantity'];

    if ($num > $maxQuantity) {
        $_SESSION['cart'][$variant_id]['num'] = $maxQuantity;
    } else {
        $_SESSION['cart'][$variant_id]['num'] = max(1, $num);
    }

    echo 'OK';
}


function deleteCart() {
	$variant_id = intval(Utility::getPost('variant_id'));

	// Nếu tồn tại sản phẩm trong giỏ hàng
	if (isset($_SESSION['cart'][$variant_id])) {
		unset($_SESSION['cart'][$variant_id]);
	}
}
function checkout() {
    $db = new Database(); // Tạo mới kết nối DB trong hàm

    if (!isset($_SESSION['cart']) || count($_SESSION['cart']) == 0) return;

    $fullname = Utility::getPost('fullname');
    $email = Utility::getPost('email');
    $phone = Utility::getPost('phone_number');
    $address = Utility::getPost('address');
    $note = Utility::getPost('note');
    $order_date = date('Y-m-d H:i:s');

    $total_price = 0;
    foreach ($_SESSION['cart'] as $item) {
        $total_price += $item['discount'] * $item['num'];
    }

    $sql = "INSERT INTO orders (fullname, email, phone_number, address, note, order_date, total_price)
            VALUES ('$fullname', '$email', '$phone', '$address', '$note', '$order_date', $total_price)";
    $db->execute($sql);

    $orderId = $db->getLastInsertedId();

    foreach ($_SESSION['cart'] as $variant_id => $item) {
        $num = $item['num'];
        $price = $item['discount'];
        $size = isset($item['size']) ? $item['size'] : '';
        $color = isset($item['color']) ? $item['color'] : '';

        $sql_detail = "INSERT INTO order_details(order_id, variant_id, price, num, size, color)
                       VALUES ($orderId, $variant_id, $price, $num, '$size', '$color')";
        $db->execute($sql_detail);
    }

    unset($_SESSION['cart']);
}
