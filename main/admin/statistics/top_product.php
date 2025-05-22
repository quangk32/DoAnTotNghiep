<?php
$title = "Thống kê Sản phẩm Bán chạy";
$baseUrl = '../';
include_once '../layouts/header.php';

$sql = "
SELECT 
    products.id, 
    products.name, 
    SUM(order_details.num) AS total_sold, 
    SUM(order_details.total_money) AS total_revenue 
FROM 
    products 
INNER JOIN order_details ON products.id = order_details.product_id 
INNER JOIN orders ON orders.id = order_details.order_id 
WHERE orders.status = 3
GROUP BY products.id 
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
<?php include_once '../layouts/footer.php'; ?>
