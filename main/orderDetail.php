<?php 
$title = "Chi tiết đơn hàng";
$baseUrl = './';
include_once './layouts/header.php';
$db = new Database();
$orderId = Utility::getGet('id');

// Lấy thêm size, color trong select
$sql = "SELECT order_details.*, products.name, products.image 
        FROM order_details
        JOIN products ON order_details.product_id = products.id
        WHERE order_details.order_id = $orderId";
$data = $db->executeResult($sql);

$sql = "SELECT * FROM orders WHERE id = $orderId";
$orderItem = $db->executeResult($sql, true);
?>

<div class="content-wrapper">
    <div class="content-header">
        <div class="container-fluid">
            <div class="row mb-2">
                <div class="col-md-12">
                    <a href="./orderHistory.php"><button class="btn btn-primary">Quay lại</button></a>
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
                                    <td><img style="height: 120px;" src="<?= fixUrl($item['image']) ?>" alt=""></td>
                                    <td><?= htmlspecialchars($item['name']) ?></td>
                                    <td><?= htmlspecialchars($item['size']) ?></td>
                                    <td><?= htmlspecialchars($item['color']) ?></td>
                                    <td><?= number_format($item['price']) . ' VNĐ' ?></td>
                                    <td><?= intval($item['num']) ?></td>
                                    <td><?= number_format($item['total_money']) . ' VNĐ' ?></td>
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

<?php include_once './layouts/footer.php'; ?>
