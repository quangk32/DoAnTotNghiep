<?php
$title = "Trang Quản lý Thống kê";
$formNameIndex = "Danh sách thống kê";
include_once __DIR__. '/../layouts/header.php';
$db = new Database();

// Truy vấn thống kê sản phẩm
$sql = "SELECT categories.id, categories.`name`,
        COUNT(*) AS 'soluong',
        MAX(products.price) AS 'giacao',
        MIN(products.price) AS 'giathap',
        AVG(products.price) AS 'giatb'
        FROM categories, products 
        WHERE categories.id = products.category_id
        GROUP BY categories.`name`, categories.id";
$data = $db->executeResult($sql);
?>

<!-- Content Wrapper -->
<div class="content-wrapper">
    <!-- Content Header -->
    <div class="content-header">
        <div class="container-fluid">
            <div class="row mb-2">
                <div class="col-md-12">
                    <h1 class="m-0 mb-3"><?= $formNameIndex ?></h1>

                    <!-- Các liên kết đến các trang thống kê -->
                    <a href="low_product.php" class="btn btn-info mb-3">Sản phẩm bán ít</a>
                    <a href="top_product.php" class="btn btn-success mb-3">Sản phẩm bán chạy</a>
                    <a href="revenue_chart.php" class="btn btn-warning mb-3">Biểu đồ doanh thu</a>

                    <!-- Biểu đồ thống kê sản phẩm -->
                    <div id="piechart"></div>
                </div>
            </div>
        </div>
    </div>
</div>

<!-- Button quay lại -->
<div class="container-fluid">
    <a href="index.php" class="btn btn-primary">Quay lại</a>
</div>

<?php include_once __DIR__. '/../layouts/footer.php'; ?>

<script type="text/javascript" src="https://www.gstatic.com/charts/loader.js"></script>
<script type="text/javascript">
    google.charts.load('current', {'packages': ['corechart']});
    google.charts.setOnLoadCallback(drawChart);

    function drawChart() {
        var data = google.visualization.arrayToDataTable([
            ['Danh mục', 'Số lượng sản phẩm'],
            <?php
            $i = 1;
            $sumCat = count($data);
            foreach ($data as $val) {
                $comma = ($i == $sumCat) ? "" : ",";
                echo "['" . $val['name'] . "'," . $val['soluong'] . "]" . $comma;
                $i++;
            }
            ?>
        ]);

        var options = {
            'width': 1000,
            'height': 800,
            'title': 'Thống kê sản phẩm theo danh mục'
        };

        var chart = new google.visualization.PieChart(document.getElementById('piechart'));
        chart.draw(data, options);
    }
</script>
