<?php
include_once('./utils/utility.php');
include_once('./db/database.php');

$db = new Database();

$title = "Kết quả tìm kiếm";
$baseUrl = './';
include_once './layouts/header.php';

if (isset($_GET['query']) && !empty($_GET['query'])) {
    $search = $_GET['query'];
    $sql = "SELECT products.*, categories.name as category_name FROM products
            LEFT JOIN categories ON products.category_id = categories.id
            WHERE products.deleted = 0 AND products.name LIKE '%" . $search . "%'
            ORDER BY id DESC";

    $data = $db->executeResult($sql);
} else {
    
    echo "Vui lòng nhập thông tin cần tìm kiếm.";
    include_once './layouts/footer.php';
    exit(); 
}
?>
<style>
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
<!-- Hiển thị kết quả tìm kiếm -->
  <div class="container" style="margin-top: 20px; margin-bottom: 20px;">
      <h1 class="m-0 mb-3" style="text-align:center;padding:30px 30px;">KẾT QUẢ TÌM KIẾM</h1>
      <!-- Hiển thị danh sách sản phẩm tìm kiếm -->
      <div class="row">
      <?php
        foreach ($data as $pItem) {
          echo '<div class="col-md-3 col-6 product-item">
          <a href="detail.php?id=' . $pItem['id'] . '">
            <img src="' . $pItem['image'] . '" style="width: 100%; height: 220px; object-fit: cover; border-radius: 6px;">
          </a>
        
          <p style="font-weight: bold;">' . $pItem['category_name'] . '</p>
          
          <a href="detail.php?id=' . $pItem['id'] . '">
            <p style="font-weight: bold; min-height: 48px; overflow: hidden; margin-bottom: 8px;">' . $pItem['name'] . '</p>
          </a>
          
          <div class="price-container">
            <p class="discount-price" style="color: red; font-weight: bold;">' . number_format($pItem['discount']) . ' VND </p> 
            <p class="original-price" style="text-decoration: line-through; color: grey;">' . number_format($pItem['price']) . ' VND </p>
          </div>
          
          <a href="detail.php?id=' . $pItem['id'] . '">
            <button style="
              width: 100%;
              margin-bottom: 6px;
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
include_once './layouts/footer.php';
?>
