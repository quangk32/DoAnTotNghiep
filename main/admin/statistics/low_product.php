<?php
$title = "Thống kê Sản phẩm Bán ít";
include_once __DIR__ . '/../layouts/header.php';
$db = new Database();

$start_date = $_GET['start_date'] ?? date('Y-m-01');
$end_date = $_GET['end_date'] ?? date('Y-m-d');

// Truy vấn: tổng số lượng bán theo biến thể trong khoảng thời gian
$sql = "
SELECT 
    p.id,
    p.name,
    p.quantity AS stock_quantity,
    IFNULL(SUM(CASE 
        WHEN o.status = 3 AND DATE(o.order_date) BETWEEN '$start_date' AND '$end_date' 
        THEN od.num ELSE 0 END), 0) AS total_sold
FROM products p
LEFT JOIN product_variants pv ON pv.product_id = p.id
LEFT JOIN order_details od ON od.product_variant_id = pv.id
LEFT JOIN orders o ON o.id = od.order_id
GROUP BY p.id
ORDER BY total_sold ASC
LIMIT 10
";
$data = $db->executeResult($sql);
?>

<div class="content-wrapper">
    <div class="content-header">
        <div class="col-md-12 mb-3">
            <a href="index.php"><button class="btn btn-secondary">← Quay lại</button></a>
        </div>
        <div class="container-fluid">
            <h2 class="mb-4">Top 10 sản phẩm bán ít nhất</h2>

            <form method="GET" action="" class="form-inline mb-4">
                <label class="mr-2">Từ ngày:</label>
                <input type="date" name="start_date" value="<?= $start_date ?>" required class="form-control mr-3">
                <label class="mr-2">Đến ngày:</label>
                <input type="date" name="end_date" value="<?= $end_date ?>" required class="form-control mr-3">
                <button type="submit" class="btn btn-primary">Lọc</button>
            </form>

            <div id="chart_low_products" style="width: 100%; height: 500px;"></div>

            <h5 class="mt-4">Chi tiết sản phẩm</h5>
            <table class="table table-bordered">
                <thead>
                    <tr>
                        <th>Tên sản phẩm</th>
                        <th>Đã bán</th>
                        <th>Tồn kho</th>
                        <th>Gợi ý</th>
                    </tr>
                </thead>
                <tbody>
                    <?php foreach ($data as $item): ?>
                        <tr>
                            <td><?= htmlspecialchars($item['name']) ?></td>
                            <td><?= (int)$item['total_sold'] ?></td>
                            <td><?= (int)$item['stock_quantity'] ?></td>
                            <td>
                                <?php
                                    if ($item['total_sold'] == 0 && $item['stock_quantity'] > 0) {
                                        echo '<span class="text-danger">Không bán được - Xem lại nhập hàng</span>';
                                    } elseif ($item['total_sold'] < 3) {
                                        echo '<span class="text-warning">Bán chậm - Xem xét khuyến mãi</span>';
                                    } else {
                                        echo 'Ổn';
                                    }
                                ?>
                            </td>
                        </tr>
                    <?php endforeach; ?>
                </tbody>
            </table>

        </div>
    </div>
</div>

<!-- Google Charts -->
<script type="text/javascript" src="https://www.gstatic.com/charts/loader.js"></script>
<script>
    google.charts.load('current', { packages: ['corechart', 'bar'] });
    google.charts.setOnLoadCallback(drawLowProductsChart);

    function drawLowProductsChart() {
        var data = google.visualization.arrayToDataTable([
            ['Sản phẩm', 'Đã bán', 'Tồn kho'],
            <?php foreach ($data as $item): ?>
                ['<?= addslashes($item['name']) ?>', <?= (int)$item['total_sold'] ?>, <?= (int)$item['stock_quantity'] ?>],
            <?php endforeach; ?>
        ]);

        var options = {
            title: 'So sánh Đã bán và Tồn kho',
            chartArea: { width: '60%' },
            bars: 'horizontal',
            hAxis: {
                title: 'Số lượng',
                minValue: 0,
                format: '0',
            },
            colors: ['#f39c12', '#2ecc71'],
            legend: { position: 'top', maxLines: 2 },
            animation: {
                duration: 1000,
                easing: 'out',
                startup: true
            }
        };

        var chart = new google.visualization.BarChart(document.getElementById('chart_low_products'));
        chart.draw(data, options);
    }
</script>

<?php include_once __DIR__ . '/../layouts/footer.php'; ?>
