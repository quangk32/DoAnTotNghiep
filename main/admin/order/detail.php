<?php
$title = "Chi tiết đơn hàng";
include_once __DIR__. '/../layouts/header.php';
$db = new Database();
$orderId = Utility::getGet('id');
$sql = "
SELECT 
    od.*, 
    pv.size, 
    pv.color, 
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
$sql = "SELECT * FROM orders WHERE id=$orderId";
$orderItem = $db->executeResult($sql, true);
// $orderItem = $data1->
?>
<!-- Content Wrapper. Contains page content -->
<div class="content-wrapper">
    <!-- Content Header (Page header) -->
    <div class="content-header">
        <div class="container-fluid">
            <div class="row mb-2">
                
                <div class="col-md-12">
                    <a href="../order/index.php"><button class="btn btn-primary">Quay lại</button></a>
                    <a href="../invoice/export_invoice.php?id=<?= $orderId ?>" class="btn btn-success" target="_blank">In hóa đơn</a>
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
                                    <td><?= number_format($item['price'] * $item['num']) . ' VNĐ' ?></td>
                                </tr>

                            <?php endforeach ?>
                            <tr>
                                <td></td>
                                <td></td>
                                <td></td>
                                <td></td>
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
                            <td> <?= $orderItem['fullname'] ?></td>
                        </tr>
                        <tr>
                            <th>Email</th>
                            <td> <?= $orderItem['email'] ?></td>
                        </tr>
                        <tr>
                            <th>SDT</th>
                            <td> <?= $orderItem['phone_number'] ?></td>
                        </tr>
                        <tr>
                            <th>Địa chỉ</th>
                            <td> <?= $orderItem['address'] ?></td>
                        </tr>
                    </table>
                </div>
            </div>


        </div>
    </div>
</div>
</div>
<aside class="control-sidebar control-sidebar-dark">
</aside>
</div>

<script>
    function changeStatus(id, status) {
        option = confirm('Bạn có muốn xử lý không?');
        if (!option) {
            return;
        }
        $.post('form_api.php', {
            'id': id,
            'status': status,
            'action': 'update_status'
        }, function(data) {
            location.reload();
        })
    }
</script>
<?php
include_once __DIR__. '/../layouts/footer.php';
?>