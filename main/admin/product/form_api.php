<?php
//session_start();
//$db = new Database();
include_once  __DIR__. '/../../db/database.php';
include_once  __DIR__. '/../../utils/utility.php';
// $user = Utility::getUserToken();
// if($user == null) {
// 	die();
// }

if(!empty($_POST)) {
	$action = Utility::getPost('action');

	switch ($action) {
		case 'delete':
			deleteProduct();
			break;
	}
}

function deleteProduct() {
	$db = new Database();
	$id = Utility::getPost('id');
	$updated_at = date("Y-m-d H:i:s");
    $sql = "UPDATE products set deleted = 1,updated_at='$updated_at' WHERE id =$id";
	$db->execute($sql);
}
if ($_GET['action'] == 'save_variant') {
    header('Content-Type: application/json');
    $json = file_get_contents('php://input');
    $data = json_decode($json, true);

    if (!$data) {
        echo json_encode(['success' => false, 'message' => 'Dữ liệu không hợp lệ']);
        exit;
    }

    $product_id = (int)$data['product_id'];
    $variant_id = (int)$data['variant_id'];
    $color = trim($data['color']);
    $size = trim($data['size']);
    $quantity = (int)$data['quantity'];
    $price = (int)$data['price']; // THÊM DÒNG NÀY

    if ($product_id <= 0 || $color === '' || $size === '') {
        echo json_encode(['success' => false, 'message' => 'Thiếu thông tin bắt buộc']);
        exit;
    }

    $db = new Database();

    if ($variant_id > 0) {
        // Cập nhật biến thể
        $sql = "UPDATE product_variants SET color = '$color', size = '$size', quantity = $quantity, price = $price WHERE id = $variant_id AND product_id = $product_id";
    } else {
        // Thêm mới
        $sql = "INSERT INTO product_variants (product_id, color, size, quantity, price) VALUES ($product_id, '$color', '$size', $quantity, $price)";
    }

    $db->execute($sql);
    echo json_encode(['success' => true, 'message' => 'Đã lưu thành công']);
    exit;
}
if ($_GET['action'] == 'delete_variant') {
    header('Content-Type: application/json');
    $json = file_get_contents('php://input');
    $data = json_decode($json, true);
    $variant_id = (int)($data['variant_id'] ?? 0);
    if ($variant_id > 0) {
        $db = new Database();
        $sql = "UPDATE product_variants SET deleted = 1 WHERE id = $variant_id";
        $db->execute($sql);
        echo json_encode(['success' => true]);
    } else {
        echo json_encode(['success' => false, 'message' => 'ID không hợp lệ']);
    }
    exit;
}

