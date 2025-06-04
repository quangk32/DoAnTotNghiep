<?php
include_once(__DIR__. '/../layouts/header.php');
$category_id = Utility::getGet('id');

$db = new Database();
if ($category_id == null || $category_id == '') {
  $sql = "SELECT products.*, categories.name as category_name from products left join categories on 
	products.category_id = categories.id where active = '1' order by products.updated_at desc";
} else {
  $sql = "SELECT products.*, categories.name as category_name from 
products left join categories on products.category_id = categories.id 
WHERE products.category_id = $category_id AND active = '1' ORDER BY id desc";
}

$sql2 = "SELECT * FROM categories WHERE id=$category_id";
$cateName = $db->executeResult($sql2,true);
$lastestItems = $db->executeResult($sql);
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

<div class="container" style="margin-top: 20px; margin-bottom: 20px;">
  <h2 class="text-center" style="margin: 50px 0;"><?=$cateName['name']?></h2>

  <div class="row">
  <?php
  foreach ($lastestItems as $item) {
      echo '<div class="col-md-3 col-6 product-item">
              <a href="' . $baseUrl . '/pages/detail.php?id=' . $item['id'] . '">
                <img src="' . $baseUrl . '/' . $item['image'] . '" style="width: 100%; height: 220px; object-fit: cover; border-radius: 6px;">
              </a>
              <p style="font-weight: bold;">' . $item['category_name'] . '</p>
              <a href="' . $baseUrl . '/pages/detail.php?id=' . $item['id'] . '">
                <p style="font-weight: bold; min-height: 48px; overflow: hidden; margin-bottom: 8px;">' . $item['name'] . '</p>
              </a>
              <div class="price-container">
                <p class="discount-price" style="color: red; font-weight: bold;">' . number_format($item['price'] * (100 - $item['discount']) / 100) . ' VND</p> 
                <p class="original-price" style="text-decoration: line-through; color: grey;">' . number_format($item['price']) . ' VND</p>
              </div>
              <a href="' . $baseUrl . '/pages/detail.php?id=' . $item['id'] . '">
                <button style="
                  width: 100%;
                  margin-top: 20px;
                  padding: 10px 0;
                  background-color: rgb(235, 235, 235);
                  color: #333;
                  border: none;
                  border-radius: 6px;
                  font-weight: bold;
                ">
                  Xem chi tiết
                </button>
              </a>
            </div>';
  }
  ?>

  </div>
</div>
<?php
require_once(__DIR__. '/../layouts/footer.php');
?>
