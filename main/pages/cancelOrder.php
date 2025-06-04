<?php
require_once(__DIR__. '/../layouts/header.php');
$db = new Database();

if (!isset($_SESSION['user'])) {
    header('Location: $baseUrl/pages/login.php');
    exit;
}

if (isset($_GET['id'])) {
    $orderId = intval($_GET['id']);

    // Kiểm tra xem đơn hàng có thuộc về người dùng và đang chờ xác nhận không
    $userEmail = $_SESSION['user']['email'];
    $checkSql = "SELECT * FROM orders WHERE id = $orderId AND email = '$userEmail' AND status = 0";
    $order = $db->executeResult($checkSql, true);

    if ($order) {
        // Cập nhật trạng thái đơn hàng thành đã hủy (2)
        $updateSql = "UPDATE orders SET status = 2 WHERE id = $orderId";
        $db->execute($updateSql);
        echo '<div class="container mt-5"><div class="alert alert-success">Đã hủy đơn hàng thành công.</div></div>';
    } else {
        echo '<div class="container mt-5"><div class="alert alert-danger">Không thể hủy đơn hàng này.</div></div>';
    }
}
?>

<a href="<?= $baseUrl ?>/pages/orderHistory.php" class="btn btn-secondary mt-3 ms-3">Quay lại lịch sử</a>
<?php require_once(__DIR__. '/../layouts/footer.php'); ?>
