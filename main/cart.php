<?php
session_start();
require_once('./db/database.php');  // Đường dẫn đúng

/*if (isset($_SESSION['error_quantity'])) {
    echo "<script>alert('" . addslashes($_SESSION['error_quantity']) . "');</script>";
    unset($_SESSION['error_quantity']);
}
*/
function getVariantById($variant_id) {
    $db = new Database();
    $variant_id = intval($variant_id);
    $sql = "SELECT pv.*, p.name, p.discount, p.image FROM product_variants pv
            LEFT JOIN Products p ON pv.product_id = p.id
            WHERE pv.id = $variant_id LIMIT 1";
    $variant = $db->executeResult($sql, true);
    return $variant;
}

if ($_SERVER['REQUEST_METHOD'] === 'POST' && isset($_POST['add_to_cart'])) {
    $variant_id = $_POST['variant_id'] ?? null;
    $quantity = intval($_POST['quantity'] ?? 1);

    if ($variant_id && $quantity > 0) {
        $variant = getVariantById($variant_id);
        if ($variant) {
            if (!isset($_SESSION['cart'])) {
                $_SESSION['cart'] = [];
            }
            if ($quantity > $variant['quantity']) {
                $quantity = $variant['quantity'];
				//$_SESSION['error_quantity'] = "Số lượng bạn chọn vượt quá tồn kho (" . $variant['quantity'] . ").";
            }
            if (isset($_SESSION['cart'][$variant_id])) {
                $new_quantity = $_SESSION['cart'][$variant_id]['num'] + $quantity;
                if ($new_quantity > $variant['quantity']) {
                    $new_quantity = $variant['quantity'];
                }
                $_SESSION['cart'][$variant_id]['num'] = $new_quantity;
            } else {
                $_SESSION['cart'][$variant_id] = [
                    'name' => $variant['name'],
                    'image' => $variant['image'],
                    'size' => $variant['size'],
                    'color' => $variant['color'],
                    'discount' => $variant['discount'],
                    'num' => $quantity
                ];
            }
        }
    }
    // Sau khi thêm vào giỏ hàng, chuyển hướng về trang cart
    header('Location: cart.php');
    exit;
}
require_once('layouts/header.php');
?>

<div class="container" style="margin-top: 20px; margin-bottom: 20px;">
	<div class="row">
		<table class="table table-bordered">
			<tr>
				<th>STT</th>
				<th>Ảnh sản phẩm</th>
				<th>Tên sản phẩm</th>
				<th>Size</th>
				<th>Color</th>
				<th>Giá</th>
				<th>Số lượng</th>
				<th>Tổng giá</th>
				<th></th>
			</tr>
			<?php
			if (!isset($_SESSION['cart'])) {
				$_SESSION['cart'] = [];
			}
			$index = 0;
			foreach ($_SESSION['cart'] as $variant_id => $item) {
				echo '<tr>
			<td>' . (++$index) . '</td>
			<td><img src="' . htmlspecialchars($item['image']) . '" style="height: 80px"/></td>
			<td>' . htmlspecialchars($item['name']) . '</td>
			<td>' . htmlspecialchars($item['size'] ?? 'N/A') . '</td>
			<td>' . htmlspecialchars($item['color'] ?? 'N/A') . '</td>
			<td>' . number_format($item['discount']) . ' VND</td>
			<td style="display: flex; align-items: center;">
				<button class="btn btn-light" style="border: solid #e0dede 1px; border-radius: 4px;" onclick="addMoreCart(' . $variant_id . ', -1)">-</button>
				<input type="number" id="num_' . $variant_id . '" value="' . $item['num'] . '" class="form-control" style="width: 90px; border-radius: 4px; margin: 0 5px;" onchange="fixCartNum(' . $variant_id . ')"/>
				<button class="btn btn-light" style="border: solid #e0dede 1px; border-radius: 4px;" onclick="addMoreCart(' . $variant_id . ', 1)">+</button>
			</td>
			<td style="color:green;font-weight:500">' . number_format($item['discount'] * $item['num']) . ' VND</td>
			<td><button class="btn btn-danger" onclick="deleteCart(' . $variant_id . ')">Xoá</button></td>
		</tr>';
			}
			?>
		</table>
		
		<?php if (count($_SESSION['cart']) > 0) : ?>
			<a href="checkout.php"><button class="btn btn-danger" style="border-radius: 6px; font-size: 26px; float:right !important">TIẾP TỤC THANH TOÁN</button></a>
		<?php endif ?>

	</div>
</div>

<script type="text/javascript">
	function addMoreCart(variantId, delta) {
		let numInput = $('#num_' + variantId);
		let num = parseInt(numInput.val()) || 0;
		num += delta;
		if (num < 1) num = 1;
		numInput.val(num);
		updateCart(variantId, num);
	}

	function fixCartNum(variantId) {
		let numInput = $('#num_' + variantId);
		let num = Math.abs(parseInt(numInput.val())) || 1;
		numInput.val(num);
		updateCart(variantId, num);
	}

	function updateCart(variantId, num) {
    $.post('utils/ajax_request.php', {
        'action': 'update_cart',
        'variant_id': variantId,
        'num': num
    }, function(data) {
        if (data.trim() !== 'OK') {
            alert(data);
        }
        location.reload();
    });
	}


	function deleteCart(variantId) {
		if (confirm("Bạn có muốn xoá không?")) {
			$.post('utils/ajax_request.php', {
				'action': 'delete_cart',
				'variant_id': variantId
			}, function(data) {
				location.reload();
			});
		}
	}
</script>
<?php require_once('layouts/footer.php'); ?>
