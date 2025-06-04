<?php
include_once(__DIR__. '/../layouts/header.php');
$productId = Utility::getGet('id');
$db = new Database();
$sql = "SELECT Products.*, Categories.name as category_name from Products left join Categories on Products.category_id = Categories.id where Products.id = $productId";
$product = $db->executeResult($sql, true);
$category_id = $product['category_id'];
$sql1 = "SELECT Products.*, Categories.name as category_name from Products left join Categories on Products.category_id = Categories.id where Products.category_id = $category_id AND products.deleted=0 order by Products.updated_at desc limit 0,4";
$lastestItems = $db->executeResult($sql1);
// product_variant
$sqlVariants = "SELECT id, size, color, quantity, price FROM product_variants WHERE product_id = $productId AND product_variants.deleted = 0 AND quantity > 0";
$variants = $db->executeResult($sqlVariants);
//total soldsold
$sqlTotalSold = "
SELECT 
    COALESCE(SUM(order_details.num), 0) AS total_sold 
FROM 
    order_details 
INNER JOIN orders ON orders.id = order_details.order_id 
INNER JOIN product_variants ON order_details.product_variant_id = product_variants.id 
WHERE 
    product_variants.product_id = $productId AND orders.status = 3
";

$result = $db->executeResult($sqlTotalSold);
$totalSold = $result[0]['total_sold'] ?? 0; // Nếu không có dữ liệu, mặc định là 0
//reviews:
$sqlReviews = "
    SELECT reviews.*, users.name 
    FROM reviews 
    JOIN users ON reviews.user_id = users.id 
    WHERE reviews.product_id = $productId AND reviews.status = 1
    ORDER BY reviews.created_at DESC
";
$reviews = $db->executeResult($sqlReviews);
// Tính điểm trung bình
$totalRating = 0;
$totalReviews = count($reviews);

foreach ($reviews as $r) {
    $totalRating += $r['rating'];
}

$averageRating = $totalReviews > 0 ? round($totalRating / $totalReviews, 1) : 0;
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
  max-height: 220px; 
  width: auto;
  margin: 0 auto; 
}
.product-item-content { 
  padding: 0 10px;
}

.product-item p {
  height: 3em; 
  overflow: hidden; 
  margin-bottom: 10px; 
}

.product-item .btn-success {
  width: 100%;
  border-radius: 0;
  margin-top: auto; 
  transition: background-color 0.3s;
}
  .product-item:hover {
    transform: translateY(-5px);
  }

  .product-item:hover img {
    transform: scale(1.05);
  }

  .product-item:hover .btn-warning {
    background-color:#ca0000;
	color:rgb(255, 255, 255);
  }
  .pagination {
    display: flex;
    justify-content: center;
    list-style: none;
    padding: 0;
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
  .size-option {
    display: inline-block;
    border: 1px solid #ccc;
    padding: 8px 14px;
    margin-right: 8px;
    cursor: pointer;
    border-radius: 4px;
    user-select: none;
    transition: 0.3s;
}
.size-option.selected {
    border-color: #007bff;
    background-color: #007bff;
    color: white;
}

/* Style color circles */
.color-option {
    display: inline-block;
    width: 30px;
    height: 30px;
    border-radius: 50%;
    border: 2px solid transparent;
    margin-right: 10px;
    cursor: pointer;
    vertical-align: middle;
    transition: border-color 0.3s;
}
.color-option.selected {
    border-color: #007bff;
}

/* Nút thêm giỏ hàng */
button.add-to-cart-btn {
    background-color: #28a745;
    color: white;
    border: none;
    padding: 12px 25px;
    font-size: 16px;
    border-radius: 5px;
    cursor: pointer;
    transition: background-color 0.3s;
    margin-top: 15px;
    width: 100%;
}
button.add-to-cart-btn:hover {
    background-color: #218838;
}

/* Số lượng */
#quantity {
    width: 70px;
    padding: 5px;
    font-size: 16px;
    margin-left: 10px;
}
#stock-info {
    margin-top: 10px;
    font-weight: bold;
    color: #555;
}
.color-option {
    display: inline-block;
    width: 30px;
    height: 30px;
    margin: 5px;
    border: 2px solid transparent;
    border-radius: 50%;
    cursor: pointer;
    transition: 0.2s;
}
.color-option.selected {
    border: 3px solid #333;
    box-shadow: 0 0 8px rgba(0, 0, 0, 0.5);
    transform: scale(1.2);
}
</style>
<div class="container" style="margin-top: 20px; margin-bottom: 20px;">
	<div class="row">
		<div class="col-md-6">
			<img src="<?= $baseUrl ?>/<?= $product['image'] ?>" style="width: 100%;">
		</div>
		<div class="col-md-6">
			<ul class="breadcrumb">
				<li><a href="<?= $baseUrl ?>/pages/index.php">Trang Chủ</a></li>
				<li><a href="<?= $baseUrl ?>/pages/category.php?id=<?= $product['category_id'] ?>"> / <?= $product['category_name'] ?></a></li>
				<li> / <?= $product['name'] ?></li>
			</ul>
			<h2><?= $product['name'] ?></h2>
            <?php
                $totalRating = 0;
                $totalReviews = count($reviews);

                if ($totalReviews > 0) {
                    foreach ($reviews as $review) {
                        $totalRating += $review['rating'];
                    }
                    $averageRating = $totalRating / $totalReviews;
                } else {
                    $averageRating = 0;
                }
            ?>
            <ul style="display: flex; list-style-type: none; margin: 0px; padding: 0px;">
                <li style="color: #333; font-size: 13pt; padding-top: 2px; margin-right: 5px;">
                    <?= number_format($averageRating, 1) ?>
                </li>
                <?php
                    $roundedRating = round($averageRating * 2) / 2;
                    for ($i = 1; $i <= 5; $i++) {
                        echo '<li style="color: orange; padding: 2px;">';
                        if ($roundedRating >= $i) {
                            // Sao đầy
                            echo '<i class="bi bi-star-fill"></i>';
                        } elseif ($roundedRating >= $i - 0.5) {
                            // Nửa sao
                            echo '<i class="bi bi-star-half"></i>';
                        } else {
                            // Sao rỗng
                            echo '<i class="bi bi-star"></i>';
                        }
                        echo '</li>';
                    }
                ?>
                <span style="margin-left: 10px; font-size: 13pt; color: gray;">
                    (<?= $totalReviews ?> đánh giá)
                </span>

				<li style="margin-left: 20px; border-left: solid #dad7d7 1px; font-size: 13pt; padding-top: 3px; padding-left: 20px;">
					<?php echo number_format($totalSold); ?> Đã Bán
				</li>
			</ul>
			<p id="productPrice" style="font-size: 30px; color: red; margin-top: 15px; margin-bottom: 15px;">
                <!-- Giá sẽ cập nhật bằng JS -->
            </p>
            <p style="font-size: 30px; color: red;">
                <?= number_format($product['price'] * (100-$product['discount']) / 100) ?> VND
            </p>

			<form method="post" action="<?= $baseUrl ?>/pages/cart.php" id="addToCartForm">
				<input type="hidden" name="product_id" value="<?= $product['id'] ?>">
				<input type="hidden" name="product_name" value="<?= $product['name'] ?>">
				<input type="hidden" name="product_price" value="<?= $product['price'] ?>">
				<input type="hidden" name="variant_id" id="variant_id" value="">

				<!-- Chọn size -->
				<div>
					<label>Size:</label><br>
					<?php
					$sizes = array_unique(array_column($variants, 'size'));
					foreach ($sizes as $size) {
						echo "<div class='size-option' data-size='$size'>$size</div>";
					}
					?>
				</div>

				<!-- Chọn màu -->
				<div style="margin-top: 15px;">
					<label>Màu sắc:</label><br>
					<?php
					$colors = array_unique(array_column($variants, 'color'));
					// Map màu hiển thị
					$colorMap = [
						'Đỏ' => 'red',
						'Xanh' => 'blue',
						'Đen' => 'black',
						'Trắng' => 'white',
						'Be' => 'Beige',
						// 
					];
					foreach ($colors as $color) {
						$colorCss = $colorMap[$color] ?? 'grey';
						$borderColor = ($colorCss === 'white') ? '#ccc' : 'transparent'; // border cho trắng
						echo "<div class='color-option' data-color='$color' style='background-color: $colorCss; border-color: $borderColor'></div>";
					}
					?>
				</div>

				<!-- Số lượng -->
				<div style="margin-top: 15px;">
					<label for="quantity">Số lượng:</label>
					<input type="number" name="quantity" id="quantity" value="1" min="1" required>
					<div id="stock-info">Vui lòng chọn size và màu để xem tồn kho</div>
				</div>

				<button type="submit" class="add-to-cart-btn" name="add_to_cart" disabled>Thêm vào giỏ hàng</button>
			</form>	

		</div>
		<div class="col-md-12" style="margin-top: 20px; margin-bottom: 30px;">
			<h3>Chi Tiết Sản Phẩm</h3>
			<?= $product['description'] ?>
		</div>
	</div>
</div>
<div class="container" style="margin-top: 20px; margin-bottom: 20px;">
	<h1 style="text-align: center; margin-top: 20px; margin-bottom: 20px;">SẢN PHẨM LIÊN QUAN</h1>
	<div class="row">
	<?php foreach ($lastestItems as $item) : ?>
        <div class="col-md-3 col-6 product-item">
            <a href="<?= $baseUrl ?>/pages/detail.php?id=<?= $item['id'] ?>">
                <img src="<?= $baseUrl ?>/<?= $item['image'] ?>" alt="<?= $item['name'] ?>" class="product-image">
            </a>
            <p style="font-weight: bold;"><?= $item['category_name'] ?></p>
            <a href="<?= $baseUrl ?>/<?= $baseUrl ?>/pages/detail.php?id=<?= $item['id'] ?>">
                <p style="font-weight: bold;"><?= $item['name'] ?></p>
            </a>
			<div class="price-container">
                <p class="discount-price" style="color: red; font-weight: bold;"><?=  number_format($item['price'] * (100-$item['discount']) / 100) ?> VND </p> 
                <p class="original-price" style="text-decoration: line-through; color: grey;"><?=  number_format($item['price']) ?> VND </p> 
            </div>

            <p>
                <button class="btn btn-danger" onclick="addCart(<?= $item['id'] ?>, 1)">
                    <i class="bi bi-cart-plus-fill"></i> Thêm giỏ hàng
                </button>
            </p>
        </div>
    <?php endforeach; ?>
	</div>
</div>
<!--reviewreview-->
<div class="container" style="margin-top: 30px;">
    <h4>Đánh giá sản phẩm</h4>
    <?php if (count($reviews) == 0): ?>
        <p>Chưa có đánh giá nào.</p>
    <?php else: ?>
        <?php foreach ($reviews as $review): ?>
            <div class="card mb-2">
                <div class="card-body">
                    <h5 class="card-title"><?= htmlspecialchars($review['name']) ?></h5>
                    <p>
                        <?php for ($i = 0; $i < 5; $i++): ?>
                            <span style="color: orange;">
                                <?= $i < $review['rating'] ? '★' : '☆' ?>
                            </span>
                        <?php endfor; ?>
                    </p>
                    <p class="card-text"><?= nl2br(htmlspecialchars($review['comment'])) ?></p>
                    <small class="text-muted"><?= date('d/m/Y H:i', strtotime($review['created_at'])) ?></small>
                </div>
            </div>
        <?php endforeach; ?>
    <?php endif; ?>
</div>
<div class="container" style="margin-top: 100px;">
<!--comment-->
<?php if (isset($_SESSION['user'])): ?>
    <h4>Bình luận</h4>
    <form method="post" action="<?= $baseUrl ?>/pages/post_comment.php">
        <input type="hidden" name="product_id" value="<?= $productId ?>">
        <input type="hidden" name="parent_id" value="">
        <div class="form-group">
            <textarea name="content" class="form-control" placeholder="Viết bình luận của bạn..." required></textarea>
        </div>
        <button type="submit" class="btn btn-primary">Gửi bình luận</button>
    </form>
    <?php else: ?>
        <p><a href="<?= $baseUrl ?>/pages/login.php">Đăng nhập</a> để bình luận.</p>
    <?php endif; ?>

    <h5 style="margin-top: 30px;">Các bình luận:</h5>
    
<?php
$sqlComments = "
    SELECT comments.*, users.name 
    FROM comments 
    JOIN users ON comments.user_id = users.id 
    WHERE comments.product_id = $productId AND comments.deleted = 0 
    ORDER BY comments.created_at ASC
";
$allComments = $db->executeResult($sqlComments);

// Hàm đệ quy dựng cây comment + reply
function buildCommentTree(array $comments, $parentId = null) {
    $branch = [];
    foreach ($comments as $comment) {
        if ($comment['parent_id'] == $parentId) {
            $comment['replies'] = buildCommentTree($comments, $comment['id']);
            $branch[] = $comment;
        }
    }
    return $branch;
}

$commentTree = buildCommentTree($allComments);

// Hàm đệ quy hiển thị comment, reply và form reply
function renderComments(array $comments, $baseUrl, $productId, $level = 0) {
    foreach ($comments as $comment) {
        $marginLeft = $level * 30;
        $bgColor = $level > 0 ? '#f9f9f9' : '#fff';

        echo '<div class="card mb-3" style="margin-left:' . $marginLeft . 'px; background-color:' . $bgColor . ';">';
        echo '<div class="card-body">';
        echo '<h6 class="card-title mb-1">' . htmlspecialchars($comment['name']);
        if ($level > 0) echo ' <small class="text-muted">(phản hồi)</small>';
        echo '</h6>';
        echo '<p class="card-text mb-1">' . nl2br(htmlspecialchars($comment['content'])) . '</p>';
        echo '<small class="text-muted">' . date('d/m/Y H:i', strtotime($comment['created_at'])) . '</small>';

        if (isset($_SESSION['user'])) {
            echo '<div><a href="javascript:void(0);" class="text-primary" onclick="showReplyForm(' . $comment['id'] . ')">Phản hồi</a></div>';
            echo '<form id="reply-form-' . $comment['id'] . '" method="post" action="' . $baseUrl . '/pages/post_comment.php" style="display:none; margin-top: 10px;">
                <input type="hidden" name="product_id" value="' . $productId . '">
                <input type="hidden" name="parent_id" value="' . $comment['id'] . '">
                <textarea name="content" class="form-control mb-2" placeholder="Viết phản hồi..." rows="2" required></textarea>
                <button type="submit" class="btn btn-sm btn-secondary">Gửi phản hồi</button>
            </form>';
        }

        echo '</div></div>';

        if (!empty($comment['replies'])) {
            $maxVisible = 2;
            $totalReplies = count($comment['replies']);
            $visibleReplies = array_slice($comment['replies'], 0, $maxVisible);
            $hiddenReplies = array_slice($comment['replies'], $maxVisible);

            echo '<div id="reply-container-visible-' . $comment['id'] . '">';
            renderComments($visibleReplies, $baseUrl, $productId, $level + 1);
            echo '</div>';

            if ($totalReplies > $maxVisible) {
                echo '<div id="reply-container-hidden-' . $comment['id'] . '" style="display:none;">';
                renderComments($hiddenReplies, $baseUrl, $productId, $level + 1);
                echo '</div>';

                echo '<a href="javascript:void(0);" class="text-info" id="toggle-replies-' . $comment['id'] . '" onclick="toggleReplies(' . $comment['id'] . ')">Xem thêm (' . ($totalReplies - $maxVisible) . ')</a>';
            }
        }
    }
}
renderComments($commentTree, $baseUrl, $productId);
?>
</div>
<script>
const variants = <?= json_encode($variants) ?>;

let selectedSize = null;
let selectedColor = null;
let maxQuantity = 0;

// Lấy các nút chọn size, color
const sizeOptions = document.querySelectorAll('.size-option');
const colorOptions = document.querySelectorAll('.color-option');
const quantityInput = document.getElementById('quantity');
const stockInfo = document.getElementById('stock-info');
const addToCartBtn = document.querySelector('button.add-to-cart-btn');
const variantIdInput = document.getElementById('variant_id');
//chon mau
document.querySelectorAll('.color-option').forEach(option => {
    option.addEventListener('click', function () {
        document.querySelectorAll('.color-option').forEach(o => o.classList.remove('selected'));
        this.classList.add('selected');
    });
});
function updateSelection() {
    if (!selectedSize || !selectedColor) {
        stockInfo.textContent = "Vui lòng chọn size và màu để xem tồn kho";
        addToCartBtn.disabled = true;
        variantIdInput.value = "";
        quantityInput.value = 1;
        quantityInput.min = 1;
        maxQuantity = 0;
        return;
    }

    // Tìm variant phù hợp
    const variant = variants.find(v => v.size === selectedSize && v.color === selectedColor);

    if (variant) {
        maxQuantity = variant.quantity;
        variantIdInput.value = variant.id;
        stockInfo.textContent = "Số lượng còn lại: " + maxQuantity;
        addToCartBtn.disabled = (maxQuantity === 0);

        // Reset số lượng nếu vượt max
        if (parseInt(quantityInput.value) > maxQuantity) {
            quantityInput.value = maxQuantity;
        }
        quantityInput.min = 1;
        quantityInput.max = maxQuantity;
    } else {
        stockInfo.textContent = "Không có sản phẩm với size và màu này.";
        addToCartBtn.disabled = true;
        variantIdInput.value = "";
        quantityInput.value = 1;
        maxQuantity = 0;
    }
}

// Xử lý chọn size
sizeOptions.forEach(el => {
    el.addEventListener('click', () => {
        // Bỏ chọn cũ
        sizeOptions.forEach(s => s.classList.remove('selected'));
        el.classList.add('selected');
        selectedSize = el.getAttribute('data-size');
        updateSelection();
    });
});

// Xử lý chọn màu
colorOptions.forEach(el => {
    el.addEventListener('click', () => {
        // Bỏ chọn cũ
        colorOptions.forEach(c => c.classList.remove('selected'));
        el.classList.add('selected');
        selectedColor = el.getAttribute('data-color');
        updateSelection();
    });
});

// Kiểm tra số lượng nhập thủ công
quantityInput.addEventListener('input', () => {
    let val = parseInt(quantityInput.value);

    if (isNaN(val) || val < 1) {
        quantityInput.value = 1;
        return;
    }

    if (val > maxQuantity) {
        // Delay wwhen typing
        setTimeout(() => {
            alert("Số lượng vượt quá tồn kho!");
            quantityInput.value = maxQuantity;
        }, 100);
    }
});
//Reply comments
function showReplyForm(commentId) {
    const form = document.getElementById('reply-form-' + commentId);
    form.style.display = (form.style.display === 'block') ? 'none' : 'block';
}

function toggleReplies(commentId) {
    const hiddenContainer = document.getElementById('reply-container-hidden-' + commentId);
    const toggleLink = document.getElementById('toggle-replies-' + commentId);

    if (hiddenContainer.style.display === 'none' || hiddenContainer.style.display === '') {
        hiddenContainer.style.display = 'block';
        toggleLink.textContent = 'Thu gọn';
    } else {
        hiddenContainer.style.display = 'none';
        const hiddenCount = hiddenContainer.children.length;
        toggleLink.textContent = 'Xem thêm (' + hiddenCount + ')';
    }
}
</script>

<?php
require_once(__DIR__. '/../layouts/footer.php');
?>