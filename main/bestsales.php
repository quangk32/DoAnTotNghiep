<?php
$baseUrl = '';
include_once('./layouts/header.php');

$db = new Database();

// Lấy danh sách sản phẩm đang giảm giá nhiều nhất (tính theo phần trăm giảm giá)
$sql = "SELECT *, (price - discount)/price AS discount_ratio 
        FROM products 
        WHERE active = 1 AND price > 0 AND discount > 0 
        ORDER BY discount_ratio DESC 
        LIMIT 20"; // lấy top 20 sản phẩm giảm giá cao nhất

$discountedItems = $db->executeResult($sql);
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
  <h2 class="text-center" style="margin: 50px 0;">Sản phẩm giảm giá nhiều nhất</h2>

  <div class="row">
    <?php foreach ($discountedItems as $item): ?>
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
