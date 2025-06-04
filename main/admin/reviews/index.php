<?php
include_once __DIR__. '/../layouts/header.php';
include_once __DIR__. '/../../db/database.php';

$db = new Database();
$sql = "SELECT reviews.*, products.name AS product_name, users.name AS user_name 
        FROM reviews 
        JOIN products ON reviews.product_id = products.id 
        LEFT JOIN users ON reviews.user_id = users.id 
        WHERE reviews.deleted = 0
        ORDER BY created_at DESC";
$reviews = $db->executeResult($sql);
?>

<div class="content-wrapper">
    <div class="content-header">
        <div class="container-fluid">
            <h1 class="mb-4">Quản lý đánh giá sản phẩm</h1>

    <table class="table table-bordered table-hover">
        <thead class="table-active">
            <tr>
                <th>STT</th>
                <th>Sản phẩm</th>
                <th>Người dùng</th>
                <th>Đánh giá</th>
                <th>Sao</th>
                <th>Ngày</th>
                <th>Trạng thái</th>
                <th>Hành động</th>
            </tr>
        </thead>
        <tbody>
            <?php $i = 1; foreach ($reviews as $row): ?>
                <tr>
                    <td><?= $i++ ?></td>
                    <td><?= htmlspecialchars($row['product_name']) ?></td>
                    <td><?= htmlspecialchars($row['user_name'] ?? 'Ẩn danh') ?></td>
                    <td><?= nl2br(htmlspecialchars($row['comment'])) ?></td>
                    <td><?= (int)$row['rating'] ?> ⭐</td>
                    <td><?= $row['created_at'] ?></td>
                    <td>
                        <?= $row['status'] == 1 ? '<span class="badge bg-success">Hiển thị</span>' : '<span class="badge bg-warning text-dark">Chờ duyệt</span>' ?>
                    </td>
                    <td>
                        <form method="post" action="form_api.php" style="display:inline-block;">
                            <input type="hidden" name="id" value="<?= $row['id'] ?>">

                            <div class="display-flex gap: 5px;">
                            <?php if ($row['status'] == 0): ?>
                                <button name="action" value="approve" class="btn btn-sm btn-success">Duyệt</button>
                            <?php endif; ?>

                            <button name="action" value="hide" class="btn btn-sm btn-secondary">Ẩn</button>
                            <button name="action" value="delete" class="btn btn-sm btn-danger" onclick="return confirm('Xác nhận xóa đánh giá này?')">Xóa</button>
                            </div>
                        </form>
                    </td>
                </tr>
            <?php endforeach; ?>
        </tbody>
    </table>
</div>
</div>
</div>
<style>
    td, th {
        vertical-align: middle;
    }
</style>
