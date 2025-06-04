<?php
require_once(__DIR__. '/../layouts/header.php');
$db = new Database();

// Kiểm tra người dùng đã đăng nhập chưa
if (!isset($_SESSION['user'])) {
    echo '<div class="container mt-5"><h3>Bạn cần đăng nhập để xem lịch sử đơn hàng.</h3></div>';
    require_once(__DIR__. '/../layouts/footer.php');
    exit;
}

$userEmail = $_SESSION['user']['email'];


// Lấy đơn hàng của người dùng hiện tại
$sql = "SELECT id, fullname, phone_number, address, order_date, status, total_money 
        FROM orders 
        WHERE email = '$userEmail'
        ORDER BY order_date DESC";
$orders = $db->executeResult($sql);
?>

<div class="container mt-5 mb-5">
    <h2 class="text-center mb-4">Lịch sử đơn hàng</h2>

    <?php if (count($orders) == 0): ?>
        <p class="text-center">Bạn chưa đặt đơn hàng nào.</p>
    <?php else: ?>
        <table class="table table-bordered table-striped">
            <thead class="thead-dark">
                <tr>
                    <th>STT</th>
                    <th>Ngày đặt</th>
                    <th>Tổng tiền</th>
                    <th>Trạng thái</th>
                    <th>Chi tiết</th>
                </tr>
            </thead>
            <tbody>
                <?php foreach ($orders as $index => $order): ?>
                    <tr>
                        <td><?= $index + 1 ?></td>
                        <td><?= $order['order_date'] ?></td>
                        <td><?= number_format($order['total_money']) ?> VND</td>
                        <td>
                            <?php
                                switch ($order['status']) {
                                    case 0: echo '<span class="badge bg-warning text-dark">Chờ xác nhận</span>'; break;
                                    case 1: echo '<span class="badge bg-success">Đã duyệt</span>'; break;
                                    case 2: echo '<span class="badge bg-danger">Đã huỷ</span>'; break;
                                    case 3: echo '<span class="badge bg-primary">Đã giao</span>'; break;
                                }
                            ?>
                        </td>
                        <td>
                            <a href="<?= $baseUrl ?>/pages/orderDetail.php?id=<?= $order['id'] ?>" class="btn btn-info btn-sm">Xem</a>
                            <?php if ($order['status'] == 0): ?>
                                <a href="<?= $baseUrl ?>/pages/cancelOrder.php?id=<?= $order['id'] ?>" class="btn btn-danger btn-sm" 
                                onclick="return confirm('Bạn có chắc muốn hủy đơn hàng này không?')">Hủy</a>
                            <?php endif ?>
                        </td>

                    </tr>
                <?php endforeach ?>
            </tbody>
        </table>
    <?php endif ?>
</div>

<?php require_once(__DIR__. '/../layouts/footer.php'); ?>
