<?php 
session_start(); // BẮT BUỘC phải có để dùng session
$title = "Chi tiết đơn hàng";
include_once (__DIR__. '/../layouts/header.php');

// Kiểm tra đăng nhập
if (!isset($_SESSION['user'])) {
    header('Location: $baseUrl/pages/login.php');
    exit;
}

$db = new Database();
$orderId = Utility::getGet('id');

// Lấy thông tin chi tiết sản phẩm trong đơn hàng
$sql = "
SELECT 
    od.*, 
    pv.size, 
    pv.color, 
    p.id AS product_id, 
    p.name, 
    p.image 
FROM 
    order_details od
INNER JOIN product_variants pv ON od.product_variant_id = pv.id
INNER JOIN products p ON pv.product_id = p.id
WHERE 
    od.order_id = $orderId
";
$data = $db->executeResult($sql);

// Lấy thông tin đơn hàng
$sql = "SELECT * FROM orders WHERE id = $orderId";
$orderItem = $db->executeResult($sql, true);

// Thông tin để xử lý review
$userId = $_SESSION['user']['id']; // Lấy user_id từ SESSION
$orderStatus = $orderItem['status'];

?>

<div class="content-wrapper">
    <div class="content-header">
        <div class="container-fluid">
            <div class="row mb-2">
                <div class="col-md-12">
                    <a href="<?= $baseUrl ?>/pages/orderHistory.php"><button class="btn btn-primary">Quay lại</button></a>
                </div>
                <div class="col-md-12">
                    <h1 class="m-0 mb-3" style="padding-top: 16px; text-align: center;"><b>Chi tiết đơn hàng</b></h1>
                </div>
                <div class="col-md-8">
                    <table class="table table-hover mt-5 table-bordered">
                        <thead>
                            <tr>
                                <th scope="col">STT</th>
                                <th scope="col">Ảnh</th>
                                <th scope="col">Tên sản phẩm</th>
                                <th scope="col">Size</th>
                                <th scope="col">Màu sắc</th>
                                <th scope="col">Giá</th>
                                <th scope="col">Số lượng</th>
                                <th scope="col">Tổng giá</th>
                            </tr>
                        </thead>
                        <tbody>
                            <?php
                            $index = 0;
                            foreach ($data as $item) : ?>
                                <tr>
                                    <th scope="row"><?= ++$index ?></th>
                                    
                                    <td>
                                        <a href="<?= $baseUrl ?>/pages/detail.php?id=<?= $item['product_id']?> ">
                                            <img style="height: 120px;" src="<?= $baseUrl ?>/<?= $item['image']?>" alt="">
                                        </a>
                                    </td>
                                    <td><?= htmlspecialchars($item['name']) ?></td>
                                    <td><?= htmlspecialchars($item['size']) ?></td>
                                    <td><?= htmlspecialchars($item['color']) ?></td>
                                    <td><?= number_format($item['price']) . ' VNĐ' ?></td>
                                    <td><?= intval($item['num']) ?></td>
                                    <td><?= number_format($item['price'] * $item['num']) . ' VNĐ' ?></td>
                                </tr>
                                <?php
                            // Kiểm tra xem user đã đánh giá sản phẩm này trong đơn hàng này chưa
                            $reviewSql = "SELECT * FROM reviews 
                                        WHERE user_id = $userId 
                                        AND product_id = {$item['product_id']} 
                                        AND order_id = $orderId
                                        AND deleted = 0";
                            $review = $db->executeResult($reviewSql, true);
                            ?>
                            <tr>
                                <td colspan="8">
                                    <?php if ($review): ?>
                                        <div class="alert alert-success">
                                            <strong>Đánh giá:</strong> <?= str_repeat("⭐", $review['rating']) ?><br>
                                            <em><?= htmlspecialchars($review['comment']) ?></em><br>
                                            <small><i>Đã đánh giá vào: <?= $review['created_at'] ?></i></small>
                                        </div>
                                    <?php elseif ($orderStatus == 3): ?>
                                        <form method="post" action="<?= $baseUrl ?>/pages/submit_review.php" class="review-form">
                                            <input type="hidden" name="user_id" value="<?= $userId ?>">
                                            <input type="hidden" name="product_id" value="<?= $item['product_id'] ?>">
                                            <input type="hidden" name="order_id" value="<?= $orderId ?>">

                                            <label>Đánh giá sản phẩm:</label><br>
                                            <select name="rating" required>
                                                <option value="">Chọn sao</option>
                                                <?php for ($i = 1; $i <= 5; $i++): ?>
                                                    <option value="<?= $i ?>"><?= $i ?> ⭐</option>
                                                <?php endfor; ?>
                                            </select><br><br>

                                            <textarea name="comment" placeholder="Nhận xét..." required class="form-control" rows="3"></textarea><br>
                                            <button class="btn btn-sm btn-primary">Gửi đánh giá</button>
                                        </form>
                                    <?php else: ?>
                                        <p class="text-muted">Đơn hàng chưa hoàn tất, chưa thể đánh giá.</p>
                                    <?php endif; ?>
                                </td>
                            </tr>


                            <?php endforeach ?>
                            <tr>
                                <td colspan="6"></td>
                                <th>Tổng tiền</th>
                                <td><?= number_format($orderItem['total_money']) . ' VNĐ' ?></td>
                            </tr>
                        </tbody>
                    </table>
                </div>
                <div class="col-md-4">
                    <table class="table table-hover mt-5 table-bordered">
                        <tr>
                            <th>Họ tên</th>
                            <td><?= htmlspecialchars($orderItem['fullname']) ?></td>
                        </tr>
                        <tr>
                            <th>Email</th>
                            <td><?= htmlspecialchars($orderItem['email']) ?></td>
                        </tr>
                        <tr>
                            <th>SDT</th>
                            <td><?= htmlspecialchars($orderItem['phone_number']) ?></td>
                        </tr>
                        <tr>
                            <th>Địa chỉ</th>
                            <td><?= htmlspecialchars($orderItem['address']) ?></td>
                        </tr>
                    </table>
                </div>
            </div>
        </div>
    </div>
</div>
<aside class="control-sidebar control-sidebar-dark"></aside>

<script>
    function changeStatus(id, status) {
        option = confirm('Bạn có muốn xử lý không?');
        if (!option) return;
        $.post('form_api.php', {
            'id': id,
            'status': status,
            'action': 'update_status'
        }, function(data) {
            location.reload();
        });
    }
</script>

<?php include_once(__DIR__. '/../layouts/footer.php'); ?>
