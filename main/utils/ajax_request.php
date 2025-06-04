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
// function updateCart() {
//     $variant_id = intval($_POST['variant_id'] ?? 0);
//     $num = intval($_POST['num'] ?? 1);

//     if (!isset($_SESSION['cart'][$variant_id])) {
//         echo 'Not in cart';
//         return;
//     }

//     require_once('../db/database.php');
//     $db = new Database();
//     $sql = "SELECT quantity FROM product_variants WHERE id = $variant_id";
//     $variant = $db->executeResult($sql, true);

//     if (!$variant) {
//         echo 'Variant not found';
//         return;
//     }

//     $maxQuantity = $variant['quantity'];

//     if ($num > $maxQuantity) {
//         $_SESSION['cart'][$variant_id]['num'] = $maxQuantity;
//     } else {
//         $_SESSION['cart'][$variant_id]['num'] = max(1, $num);
//     }

//     echo 'OK';
// }


// function deleteCart() {
// 	$variant_id = intval(Utility::getPost('variant_id'));

// 	// Nếu tồn tại sản phẩm trong giỏ hàng
// 	if (isset($_SESSION['cart'][$variant_id])) {
// 		unset($_SESSION['cart'][$variant_id]);
// 	}
// }
function updateCart() {
    $variant_id = intval($_POST['variant_id'] ?? 0);
    $num = intval($_POST['num'] ?? 1);
    $num = max(1, $num); // Đảm bảo >= 1

    require_once('../db/database.php');
    $db = new Database();

    // Lấy tồn kho của biến thể
    $variant = $db->executeResult("SELECT * FROM product_variants WHERE id = $variant_id", true);
    if (!$variant) {
        echo 'Variant not found';
        return;
    }

    $maxQuantity = $variant['quantity'];
    if ($num > $maxQuantity) {
        $num = $maxQuantity;
    }

    // Tạo cart nếu chưa có
    if (!isset($_SESSION['cart_id'])) {
        $created_at = date('Y-m-d H:i:s');
        $db->execute("INSERT INTO carts (user_id, status, created_at, updated_at, deleted) 
                      VALUES (NULL, 0, '$created_at', '$created_at', 0)");
        $_SESSION['cart_id'] = $db->getLastInsertedId();
    }

    $cart_id = $_SESSION['cart_id'];
    $now = date('Y-m-d H:i:s');
    $db->execute("UPDATE carts SET updated_at = '$now' WHERE id = $cart_id");

    // Tính giá sau giảm
    $total_price = $variant['price'] * $num;

    // Kiểm tra xem item đã tồn tại trong cart chưa
    $item = $db->executeResult("SELECT * FROM cart_items WHERE cart_id = $cart_id AND product_variant_id = $variant_id AND deleted = 0", true);

    if ($item) {
        // Update số lượng và tổng giá
        $sql = "UPDATE cart_items 
                SET quantity = $num, total_price = $total_price 
                WHERE id = {$item['id']}";
    } else {
        // Thêm mới item
        $sql = "INSERT INTO cart_items (cart_id, product_variant_id, quantity, total_price, deleted) 
                VALUES ($cart_id, $variant_id, $num, $total_price, 0)";
    }

    $db->execute($sql);
    echo 'OK';
}
function deleteCart() {
    $variant_id = intval(Utility::getPost('variant_id'));

    // Xử lý cho giỏ hàng đăng nhập
    if (isset($_SESSION['cart_id'])) {
        $cart_id = $_SESSION['cart_id'];

        $db = new Database();

        $sql = "DELETE FROM cart_items WHERE cart_id = $cart_id AND product_variant_id = $variant_id";
        $db->execute($sql);

        echo "OK";
        return;
    }

    // Xử lý cho giỏ hàng chưa đăng nhập lưu session
    if (isset($_SESSION['cart'][$variant_id])) {
        unset($_SESSION['cart'][$variant_id]);
        echo "OK";
        return;
    }

    echo "Item not found";
}
function checkout() {
    session_start();

    if (!isset($_SESSION['user']['id'])) {
        echo json_encode(['status' => 'error', 'message' => 'Bạn phải đăng nhập để thanh toán']);
        return;
    }

    $db = new Database();

    $user_id = $_SESSION['user']['id'];

    // Lấy cart hiện tại của user (status = 0 và deleted = 0)
    $sqlCartId = "SELECT id FROM carts WHERE user_id = $user_id AND status = 0 AND deleted = 0 LIMIT 1";
    $cart = $db->executeSingleResult($sqlCartId);
    if (!$cart) {
        echo json_encode(['status' => 'error', 'message' => 'Giỏ hàng trống hoặc không tồn tại']);
        return;
    }
    $cart_id = $cart['id'];

    // Lấy các item trong cart
    $sqlItems = "
    SELECT ci.product_variant_id, ci.quantity, ci.total_price, pv.price, p.discount
    FROM cart_items ci
    JOIN product_variants pv ON ci.product_variant_id = pv.id
    JOIN products p ON pv.product_id = p.id
    WHERE ci.cart_id = $cart_id AND ci.deleted = 0
    ";
    $cartItems = $db->executeResult($sqlItems);
    if (!$cartItems || count($cartItems) == 0) {
        echo json_encode(['status' => 'error', 'message' => 'Giỏ hàng trống']);
        return;
    }

    // Lấy dữ liệu từ ajax post
    $fullname = Utility::getPost('fullname');
    $email = Utility::getPost('email');
    $phone = Utility::getPost('phone_number');
    $address = Utility::getPost('address');
    $note = Utility::getPost('note');
    $order_date = date('Y-m-d H:i:s');

    // Tính tổng tiền thực tế (có tính discount)
    $total_price = 0;
    foreach ($cartItems as $item) {
        $price_after_discount = $item['price'] * (100 - $item['discount']) / 100;
        $total_price += $price_after_discount * $item['quantity'];
    }

    // Thêm đơn hàng
    $sqlOrder = "INSERT INTO orders (fullname, email, phone_number, address, note, order_date, total_price) 
                 VALUES (?, ?, ?, ?, ?, ?, ?)";
    $db->execute($sqlOrder, [$fullname, $email, $phone, $address, $note, $order_date, $total_price]);

    $orderId = $db->getLastInsertedId();

    // Thêm chi tiết đơn hàng, cập nhật tồn kho và xóa cart items
    foreach ($cartItems as $item) {
        $variant_id = $item['product_variant_id'];
        $quantity = $item['quantity'];
        $price_after_discount = $item['price'] * (100 - $item['discount']) / 100;

        // Insert order_details
        $sqlDetail = "INSERT INTO order_details (order_id, variant_id, price, num) VALUES (?, ?, ?, ?)";
        $db->execute($sqlDetail, [$orderId, $variant_id, $price_after_discount, $quantity]);

        // Cập nhật tồn kho
        $db->execute("UPDATE product_variants SET quantity = quantity - ? WHERE id = ?", [$quantity, $variant_id]);

        // Đánh dấu cart item deleted
       // $db->execute("UPDATE cart_items SET deleted = 1 WHERE cart_id = ? AND product_variant_id = ?", [$cart_id, $variant_id]);
    }

    // Cập nhật cart: status = 1 (đã checkout)
    $db->execute("UPDATE carts SET status = 1, updated_at = NOW() WHERE id = ?", [$cart_id]);

    // Xóa session cart_id để tạo cart mới khi user tiếp tục mua
    //unset($_SESSION['cart_id']);

    echo json_encode(['status' => 'success', 'message' => 'Đơn hàng đã được tạo thành công']);
}
