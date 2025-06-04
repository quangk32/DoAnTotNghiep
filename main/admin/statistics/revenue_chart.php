<?php
$title = "Thống kê Doanh thu";
include_once __DIR__. '/../layouts/header.php';

$sqlWeekly = "
SELECT 
    WEEK(order_date) AS week, 
    YEAR(order_date) AS year,
    SUM(total_money) AS revenue 
FROM 
    orders 
WHERE 
    status = 3 
GROUP BY year, week 
ORDER BY year DESC, week DESC
";

$sqlMonthly = "
SELECT 
    MONTH(order_date) AS month, 
    YEAR(order_date) AS year,
    SUM(total_money) AS revenue 
FROM 
    orders 
WHERE 
    status = 3
GROUP BY year, month 
ORDER BY year DESC, month DESC
";
$sqlDaily = "
SELECT 
    DATE(order_date) AS date, 
    SUM(total_money) AS revenue 
FROM 
    orders 
WHERE 
    status = 3 
GROUP BY date 
ORDER BY date DESC
";

$sqlYearly = "
SELECT 
    YEAR(order_date) AS year,
    SUM(total_money) AS revenue 
FROM 
    orders 
WHERE 
    status = 3 
GROUP BY year 
ORDER BY year DESC
";

$db = new Database();
$dataDaily = $db->executeResult($sqlDaily);
$dataYearly = $db->executeResult($sqlYearly);
$dataWeekly = $db->executeResult($sqlWeekly);
$dataMonthly = $db->executeResult($sqlMonthly);
$start_date = isset($_GET['start_date']) ? $_GET['start_date'] : date('Y-m-d');
$end_date = isset($_GET['end_date']) ? $_GET['end_date'] : date('Y-m-d');
$sqlDateRange = "
    SELECT 
        DATE(order_date) AS date, 
        SUM(total_money) AS revenue 
    FROM 
        orders 
    WHERE 
        status = 3 AND DATE(order_date) BETWEEN '$start_date' AND '$end_date'
    GROUP BY date 
    ORDER BY date DESC
    ";
$dataDateRange = $db->executeResult($sqlDateRange);

if (isset($_GET['start_date']) && isset($_GET['end_date'])) {
    $start_date = $_GET['start_date'];
    $end_date = $_GET['end_date'];
    $end_date = date('Y-m-d', strtotime($end_date . ' +1 day'));
    $sqlDateRange = "
    SELECT 
        DATE(order_date) AS date, 
        SUM(total_money) AS revenue 
    FROM 
        orders 
    WHERE 
        status = 3 AND order_date BETWEEN '$start_date' AND '$end_date'
    GROUP BY date 
    ORDER BY date DESC
    ";

    $dataDateRange = $db->executeResult($sqlDateRange);
}
?>
<div class="content-wrapper">
    <div class="content-header">
    <div class="col-md-12">
            <a href="index.php"><button class="btn btn-primary">Quay lại</button></a>
        </div>
        <div class="container-fluid">
            <h1 class="m-0 mb-3">Thống kê Doanh thu</h1>

            <form method="GET" action="">
                <label for="start_date">Từ ngày:</label>
                <input type="date" id="start_date" name="start_date" value="<?php echo $start_date; ?>" required>
                <label for="end_date">Đến ngày:</label>
                <input type="date" id="end_date" name="end_date" value="<?php echo $end_date; ?>" required>
                <button type="submit" class="btn-custom">Xem thống kê</button>
            </form>

            <!-- Biểu đồ doanh thu theo khoảng thời gian -->
            <div id="date_range_chart" style="width: 100%; height: 500px;"></div>
            <!-- Biểu đồ doanh thu theo ngày -->
            <div id="daily_chart" style="display:none; width: 100%; height: 500px;"></div>

            <!-- Biểu đồ doanh thu theo tuần -->
            <div id="weekly_chart" style="width: 100%; height: 500px;"></div>

            <!-- Biểu đồ doanh thu theo tháng -->
            <div id="monthly_chart" style="width: 100%; height: 500px;"></div>

            <!-- Biểu đồ doanh thu theo năm -->
            <div id="yearly_chart" style="width: 100%; height: 500px;"></div>
            <!-- Form chọn ngày -->
            
        </div>
    </div>
</div>
<style>
    .btn-custom {
        background-color: #4CAF50; /* Màu nền */
        color: white; /* Màu chữ */
        padding: 10px 20px; /* Khoảng cách bên trong */
        border: none; /* Bỏ viền */
        border-radius: 5px; /* Bo góc */
        cursor: pointer; /* Con trỏ chuột */
    }

    .btn-custom:hover {
        background-color: #45a049; /* Màu nền khi hover */
    }
</style>

</style>
<script type="text/javascript" src="https://www.gstatic.com/charts/loader.js"></script>
<script type="text/javascript">
    google.charts.load('current', {'packages':['corechart']});
    google.charts.setOnLoadCallback(drawCharts);

    function drawCharts() {
        // Biểu đồ doanh thu theo tuần
        var weeklyData = google.visualization.arrayToDataTable([
            ['Tuần', 'Doanh thu'],
            <?php
            foreach ($dataWeekly as $item) {
                echo "['Tuần " . $item['week'] . " (" . $item['year'] . ")', " . $item['revenue'] . "],";
            }
            ?>
        ]);

        var weeklyOptions = {
            title: 'Doanh thu theo Tuần',
            hAxis: { title: 'Tuần' },
            vAxis: { title: 'Doanh thu (VNĐ)' },
            legend: { position: 'none' }
        };

        var weeklyChart = new google.visualization.ColumnChart(document.getElementById('weekly_chart'));
        weeklyChart.draw(weeklyData, weeklyOptions);

        // Biểu đồ doanh thu theo tháng
        var monthlyData = google.visualization.arrayToDataTable([
            ['Tháng', 'Doanh thu'],
            <?php
            foreach ($dataMonthly as $item) {
                echo "['Tháng " . $item['month'] . " (" . $item['year'] . ")', " . $item['revenue'] . "],";
            }
            ?>
        ]);

        var monthlyOptions = {
            title: 'Doanh thu theo Tháng',
            hAxis: { title: 'Tháng' },
            vAxis: { title: 'Doanh thu (VNĐ)' },
            legend: { position: 'none' }
        };

        var monthlyChart = new google.visualization.ColumnChart(document.getElementById('monthly_chart'));
        monthlyChart.draw(monthlyData, monthlyOptions);

        // Biểu đồ doanh thu theo ngày
        var dailyData = google.visualization.arrayToDataTable([
            ['Ngày', 'Doanh thu'],
            <?php
            foreach ($dataDaily as $item) {
                echo "['" . $item['date'] . "', " . $item['revenue'] . "],";
            }
            ?>
        ]);

        var dailyOptions = {
            title: 'Doanh thu theo Ngày',
            hAxis: { title: 'Ngày' },
            vAxis: { title: 'Doanh thu (VNĐ)' },
            legend: { position: 'none' }
        };

        var dailyChart = new google.visualization.LineChart(document.getElementById('daily_chart'));
        dailyChart.draw(dailyData, dailyOptions);

        // Biểu đồ doanh thu theo năm
        var yearlyData = google.visualization.arrayToDataTable([
            ['Năm', 'Doanh thu'],
            <?php
            foreach ($dataYearly as $item) {
                echo "['" . $item['year'] . "', " . $item['revenue'] . "],";
            }
            ?>
        ]);

        var yearlyOptions = {
            title: 'Doanh thu theo Năm',
            hAxis: { title: 'Năm' },
            vAxis: { title: 'Doanh thu (VNĐ)' },
            legend: { position: 'none' }
        };

        var yearlyChart = new google.visualization.LineChart(document.getElementById('yearly_chart'));
        yearlyChart.draw(yearlyData, yearlyOptions);

        // Biểu đồ doanh thu theo khoảng thời gian
        <?php if (!empty($dataDateRange)) { ?>
        var dateRangeData = google.visualization.arrayToDataTable([
            ['Ngày', 'Doanh thu'],
            <?php
            foreach ($dataDateRange as $item) {
                echo "['" . $item['date'] . "', " . $item['revenue'] . "],";
            }
            ?>
        ]);

        var dateRangeOptions = {
            title: 'Doanh thu theo Khoảng thời gian ',
            hAxis: { title: 'Ngày' },
            vAxis: { title: 'Doanh thu (VNĐ)' },
            legend: { position: 'none' }
        };

        var dateRangeChart = new google.visualization.LineChart(document.getElementById('date_range_chart'));
        dateRangeChart.draw(dateRangeData, dateRangeOptions);
        <?php } ?>
    }
</script>

<?php
include_once __DIR__. '/../layouts/footer.php';
?>
