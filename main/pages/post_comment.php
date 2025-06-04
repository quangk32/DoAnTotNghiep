<?php
session_start();
include_once(__DIR__. '/../db/database.php'); // File chứa class Database

if (!isset($_SESSION['user'])) {
    header('Location: $baseUrl/pages/login.php');
    exit;
}

$userId = $_SESSION['user']['id'];
$productId = $_POST['product_id'];
$content = trim($_POST['content']);
$parentId = isset($_POST['parent_id']) && $_POST['parent_id'] !== '' ? $_POST['parent_id'] : 'NULL';

if ($content != '') {
    $sql = "INSERT INTO comments(user_id, product_id, content, parent_id, created_at, deleted)
            VALUES($userId, $productId, '$content', $parentId, NOW(), 0)";
    $db = new Database();
    $db->execute($sql);
}

header("Location: $baseUrl/pages/detail.php?id=$productId");
exit;
