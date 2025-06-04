<?php
$title = "Thống kê Sản phẩm Bán chạy";
include_once __DIR__. '/../layouts/header.php';
$db = new Database();
$sql = "
SELECT 
    p.id, 
    p.name, 
    p.image,
    SUM(od.num) AS total_sold,
    COUNT(DISTINCT o.id) AS total_orders,
    SUM(o.total_money) AS total_revenue
FROM 
    products p
INNER JOIN product_variants pv ON pv.product_id = p.id
INNER JOIN order_details od ON od.product_variant_id = pv.id
INNER JOIN orders o ON o.id = od.order_id
WHERE o.status = 3
GROUP BY p.id, p.name, p.image
ORDER BY total_sold DESC
LIMIT 10
";
$data = $db->executeResult($sql);
?>
<div class="content-wrapper">
    <div class="content-header">
    <div class="col-md-12">
            <a href="index.php"><button class="btn btn-primary">Quay lại</button></a>
        </div>
        <div class="container-fluid">
            <h1 class="m-0">Sản phẩm bán chạy</h1>
            <div id="chart_top_products"></div>
        </div>
    </div>
</div>

<script type="text/javascript" src="https://www.gstatic.com/charts/loader.js"></script>
<script type="text/javascript">
    google.charts.load('current', { 'packages': ['corechart'] });
    google.charts.setOnLoadCallback(drawTopProductsChart);

    function drawTopProductsChart() {
        var data = google.visualization.arrayToDataTable([
            ['Sản phẩm', 'Số lượng bán'],
            <?php foreach ($data as $item) {
                echo "['" . $item['name'] . "', " . $item['total_sold'] . "],";
            } ?>
        ]);

        var options = {
            title: 'Sản phẩm bán chạy',
            width: 900,
            height: 500,
            is3D: true
        };

        var chart = new google.visualization.PieChart(document.getElementById('chart_top_products'));
        chart.draw(data, options);
    }
</script>
<?php include_once __DIR__. '/../layouts/footer.php'; ?>
