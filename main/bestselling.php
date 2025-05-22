<?php
$baseUrl = '';
include_once('./layouts/header.php');

$db = new Database();

// Lấy danh sách sản phẩm bán chạy nhất
$sql = "
    SELECT p.*, totals.total_sold
    FROM products p
    JOIN (
        SELECT product_id, SUM(num) AS total_sold
        FROM order_details
        GROUP BY product_id
        HAVING SUM(num) > 0
    ) AS totals ON totals.product_id = p.id
    WHERE p.active = 1
    ORDER BY totals.total_sold DESC
    LIMIT 20
";


$bestSellingItems = $db->executeResult($sql);

?>

<style type="text/css">
  .product-item {
    display: flex;
    flex-direction: column;
    justify-content: space-between;
    height: 100%;
    border: 1px solid #e0e0e0;
    margin-bottom: 20px;
    transition: transform 0.3s;
  }

  .product-item img {
    width: 100%;
    height: auto;
    display: block;
    transition: transform 0.3s;
  }

  .product-item:hover {
    transform: translateY(-5px);
  }

  .product-item:hover img {
    transform: scale(1.05);
  }

  .price-container {
    display: flex;
    justify-content: space-between;
    align-items: baseline;
  }

  .discount-price,
  .original-price {
    margin: 0;
  }
</style>

<div class="container" style="margin-top: 20px; margin-bottom: 40px;">
  <h2 class="text-center" style="margin: 50px 0;">Sản phẩm bán chạy nhất</h2>

  <div class="row">
    <?php foreach ($bestSellingItems as $item): ?>
      <div class="col-md-3 col-6 product-item">
        <a href="detail.php?id=<?= $item['id'] ?>">
          <img src="<?= $item['image'] ?>" style="width: 100%; height: 220px; object-fit: cover; border-radius: 6px;">
        </a>
        <p style="font-weight: bold;"><?= $item['brand'] ?></p>
        <a href="detail.php?id=<?= $item['id'] ?>">
          <p style="font-weight: bold; min-height: 48px; overflow: hidden; margin-bottom: 8px;"><?= $item['name'] ?></p>
        </a>
        <div class="price-container">
          <p class="discount-price" style="color: red; font-weight: bold;"><?= number_format($item['discount']) ?> VND</p>
          <p class="original-price" style="text-decoration: line-through; color: grey;"><?= number_format($item['price']) ?> VND</p>
        </div>
        <a href="detail.php?id=<?= $item['id'] ?>">
          <button style="
            width: 100%;
            margin-top: 20px;
            padding: 10px 0;
            background-color:rgb(235, 235, 235);
            color: #333;
            border: none;
            border-radius: 6px;
            font-weight: bold;">
            Xem chi tiết
          </button>
        </a>
      </div>
    <?php endforeach; ?>
  </div>
</div>

<?php
require_once('./layouts/footer.php');
?>
