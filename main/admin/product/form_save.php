<?php
if (!empty($_POST)) {
	$db = new Database();

	$id = Utility::getPost('id');
	$name = Utility::getPost('name');
	$price = Utility::getPost('price');
	$discount = Utility::getPost('discount');
	$quantity = Utility::getPost('quantity');
	$image = moveFile('image');
	$created_at = $updated_at = date('Y-m-d H:i:s');
	$description = Utility::getPost('description');
	$category_id = Utility::getPost('category_id');
	$active = Utility::getPost('active');

	if ($id > 0) {
		//update
		if ($image != '') {
			$sql = "UPDATE products set image = '$image', discount=$discount, name = '$name', price = $price, description = '$description', quantity = $quantity, category_id = $category_id, active= $active, updated_at = '$updated_at' where id = $id";
		} else {
			$sql = "UPDATE products set name = '$name', price = $price,discount=$discount, description = '$description', active = $active, category_id = $category_id , quantity = $quantity, updated_at = '$updated_at' where id = $id";
		}
		$db->execute($sql);
		$msgsuccess = "Sửa thành công";
	} else {
		//insert
		$sql = "insert into products(image, name, price,discount, description, quantity, active, deleted, category_id,updated_at,created_at)
		values ('$image', '$name', $price,$discount, '$description', $quantity, $active, 0, $category_id,'$updated_at','$created_at')";
		$db->execute($sql);
		$msgsuccess = "Thêm thành công";
	}

	// Sua variants
// 	if ($id > 0) {
//     // Xóa cart_items liên quan đến các variants cũ của sản phẩm
//     $db->execute("
//         DELETE ci FROM cart_items ci
//         JOIN product_variants pv ON ci.product_variant_id = pv.id
//         WHERE pv.product_id = $id
//     ");

//     // Ẩn các variants cũ thay vì xóa cứng (soft delete)
// $db->execute("UPDATE product_variants SET deleted = 1 WHERE product_id = $id");

// // Ẩn các cart_items liên quan đến variants này nếu cần (không bắt buộc nếu không dùng giỏ hàng cũ)
// $db->execute("
//     UPDATE cart_items 
//     SET deleted = 1 
//     WHERE product_variant_id IN (
//         SELECT id FROM product_variants WHERE product_id = $id
//     )
// ");
// $variantsColor = $_POST['variants']['color'] ?? [];
// $variantsSize = $_POST['variants']['size'] ?? [];
// $variantsQuantity = $_POST['variants']['quantity'] ?? [];
// $variantsPrice = $_POST['variants']['price'] ?? [];

// foreach ($variantsColor as $key => $color) {
//     $color = trim($color);
//     $size = trim($variantsSize[$key] ?? '');
//     $quantityVariant = intval($variantsQuantity[$key] ?? 0);
//     $priceVariant = intval($variantsPrice[$key] ?? 0);

//     if ($color !== '' && $size !== '') {
//         $sqlInsertVariant = "INSERT INTO product_variants(product_id, color, size, quantity, price, deleted) VALUES($id, '$color', '$size', $quantityVariant, $priceVariant, 0)";
//         $db->execute($sqlInsertVariant);
//     }
// }
// }
}
