<?php
session_start();
require_once(__DIR__. '/../db/config.php'); // Để lấy $baseUrl nếu cần
include_once(__DIR__. '/../db/database.php');

if (!isset($_SESSION['user'])) {
    header("Location: {$baseUrl}/pages/login.php");
    exit;
}

$user_id = intval($_SESSION['user']['id']);
$product_id = intval($_POST['product_id'] ?? 0);
$order_id = intval($_POST['order_id'] ?? 0);
$rating = intval($_POST['rating'] ?? 0);
$comment = addslashes(trim($_POST['comment'] ?? ''));

if ($user_id && $product_id && $order_id && $rating && $comment) {
    $db = new Database();

    // Kiểm tra nếu đã đánh giá sản phẩm này trong đơn hàng này rồi thì không cho đánh giá lại
    $checkSql = "SELECT id FROM reviews
                 WHERE user_id = $user_id 
                 AND product_id = $product_id 
                 AND order_id = $order_id 
                 AND deleted = 0";
    $existingReview = $db->executeResult($checkSql, true);

    if (!$existingReview) {
        $sql = "INSERT INTO reviews (user_id, product_id, order_id, rating, comment, created_at, status, deleted)
                VALUES ($user_id, $product_id, $order_id, $rating, '$comment', NOW(), 0, 0)";
        $db->execute($sql);
    }
}

// Quay lại trang chi tiết đơn hàng
header("Location: {$baseUrl}/pages/orderDetail.php?id=$order_id");
exit;
