<?php
include_once  __DIR__. '/../../db/database.php';
include_once  __DIR__. '/../../utils/utility.php';
date_default_timezone_set('Asia/Ho_Chi_Minh');  // đặt timezone cho Việt Nam

$user = Utility::getUserToken();
if ($user == null) {
    http_response_code(403);
    exit('Access denied');
}

$action = $_POST['action'] ?? '';
$db = new Database();

switch ($action) {
    case 'delete_comment':
        $commentId = (int)($_POST['comment_id']);
        $sql = "UPDATE comments SET deleted = 1 WHERE id = $commentId";
        $db->execute($sql);
        header('Location: index.php');
        break;

    case 'reply_comment':
        $parentId = (int)($_POST['parent_id']);
        $content = trim($_POST['content']);
        if ($content !== '') {
            $userId = (int)$user['id'];
            $content = addslashes($content);
            $createdAt = date('Y-m-d H:i:s');

            // Lấy product_id từ comment cha
            $sqlProduct = "SELECT product_id FROM comments WHERE id = $parentId";
            $product = $db->executeResult($sqlProduct);
            if ($product && count($product) > 0) {
                $productId = (int)$product[0]['product_id'];

                $sqlInsert = "INSERT INTO comments (user_id, product_id, content, parent_id, created_at, deleted) 
                              VALUES ($userId, $productId, '$content', $parentId, '$createdAt', 0)";
                $db->execute($sqlInsert);
            }
        }
        header('Location: index.php');
        break;

    default:
        http_response_code(400);
        echo "Invalid action";
}
