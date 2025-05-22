<?php
//session_start();
//$db = new Database();
include_once  '../../db/database.php';
include_once  '../../utils/utility.php';

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

    if ($product_id <= 0 || $color === '' || $size === '') {
        echo json_encode(['success' => false, 'message' => 'Thiếu thông tin bắt buộc']);
        exit;
    }

    $db = new Database();

    if ($variant_id > 0) {
        // Cập nhật biến thể đã có
        $sql = "UPDATE product_variants SET color = '$color', size = '$size', quantity = $quantity WHERE id = $variant_id AND product_id = $product_id";
    } else {
        // Thêm mới biến thể
        $sql = "INSERT INTO product_variants (product_id, color, size, quantity) VALUES ($product_id, '$color', '$size', $quantity)";
    }

    $db->execute($sql);

    echo json_encode(['success' => true, 'message' => 'Đã lưu thành công']);
    exit;
}
