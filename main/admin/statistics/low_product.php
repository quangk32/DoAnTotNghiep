<?php
$title = "Thống kê Sản phẩm Bán ít";
$baseUrl = '../';
include_once '../layouts/header.php';

// Sửa lại SQL để lấy 5 sản phẩm bán ít nhất
$sql = "
SELECT 
    products.id, 
    products.name, 
    IFNULL(SUM(order_details.num), 0) AS total_sold 
FROM 
    products 
LEFT JOIN order_details ON products.id = order_details.product_id 
LEFT JOIN orders ON orders.id = order_details.order_id 
WHERE orders.id IS NULL  -- Không có đơn hàng nào liên quan đến sản phẩm này
GROUP BY products.id 
ORDER BY total_sold ASC 
LIMIT 5
";
$data = $db->executeResult($sql);
?>

<div class="content-wrapper">
    <div class="content-header">
        <div class="col-md-12">
            <a href="index.php"><button class="btn btn-primary">Quay lại</button></a>
        </div>
        <div class="container-fluid align-center">
            <h1 class="m-0">Sản phẩm bán ít</h1>
            <div id="chart_low_products"></div>
        </div>
        
    </div>
</div>

<script type="text/javascript" src="https://www.gstatic.com/charts/loader.js"></script>
<script type="text/javascript">
    google.charts.load('current', { 'packages': ['corechart', 'bar'] });
    google.charts.setOnLoadCallback(drawLowProductsChart);

    function drawLowProductsChart() {
        var data = google.visualization.arrayToDataTable([
            ['Sản phẩm', 'Số lượng bán'],
            <?php foreach ($data as $item) {
                echo "['" . addslashes($item['name']) . "', " . $item['total_sold'] . "],";
            } ?>
        ]);

        var options = {
            title: 'Sản phẩm ít bán được',
            chartArea: { width: '60%' },
            hAxis: {
                title: 'Số lượng bán',
                minValue: 0, // Không có giá trị âm
                gridlines: { count: 5 }, // Giới hạn số lượng vạch chia
                ticks: [0, 1, 2, 3, 4, 5], // Tạo các ticks cụ thể cho số nguyên
            },
            vAxis: {
                title: 'Sản phẩm',
                textStyle: { fontSize: 14, color: '#555' },
                titleTextStyle: { fontSize: 16 },
                slantedText: true,  // Xoay tên sản phẩm để dễ đọc
                slantedTextAngle: 45,
            },
            bars: 'horizontal', // Dạng cột ngang
            legend: { position: 'none' },
            colors: ['#ff6347'], // Màu sắc cột
            width: 900,
            height: 600,
            animation: {
                duration: 1000,
                easing: 'out',
            },
            tooltip: { trigger: 'selection' },
        };

        var chart = new google.visualization.BarChart(document.getElementById('chart_low_products'));
        chart.draw(data, options);
    }
</script>

<?php include_once '../layouts/footer.php'; ?>
