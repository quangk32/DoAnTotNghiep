<?php
session_start();
require_once(__DIR__. '/../db/database.php');  // Đường dẫn đúng
function getVariantById($variant_id) {
    $db = new Database();
    $variant_id = intval($variant_id);
    $sql = "SELECT pv.*, p.name, p.image FROM product_variants pv
            LEFT JOIN products p ON pv.product_id = p.id
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
            $db = new Database();

            $user_id = $_SESSION['user']['id'] ?? null;

            if ($user_id) {
                // 1. Lấy giỏ hàng đang hoạt động của user
                $cart = $db->executeResult("SELECT * FROM carts WHERE user_id = $user_id AND status = 0 LIMIT 1", true);

                if (!$cart) {
                    // Tạo giỏ hàng mới
                    $db->execute("INSERT INTO carts(user_id, status, created_at, updated_at) VALUES ($user_id, 0, NOW(), NOW())");
                    $cart_id = $db->getLastInsertedId(); // lấy id vừa insert
                } else {
                    $cart_id = $cart['id'];
                }

                // 2. Kiểm tra sản phẩm đã có trong cart_items chưa
                $existing = $db->executeResult("SELECT * FROM cart_items WHERE cart_id = $cart_id AND product_variant_id = $variant_id AND deleted = 0", true);

                if ($existing) {
                    $new_quantity = $existing['quantity'] + $quantity;
                    if ($new_quantity > $variant['quantity']) {
                        $new_quantity = $variant['quantity'];
                    }
                    $new_total_price = $new_quantity * $variant['price'];
                    $db->execute("UPDATE cart_items SET quantity = $new_quantity, total_price = $new_total_price WHERE id = " . $existing['id']);
                } else {
                    if ($quantity > $variant['quantity']) {
                        $quantity = $variant['quantity'];
                    }
                    $total_price = $quantity * ($variant['price']);
                    $db->execute("INSERT INTO cart_items(cart_id, product_variant_id, quantity, total_price) VALUES ($cart_id, $variant_id, $quantity, $total_price)");
                }
            } else {
                if (!isset($_SESSION['cart'])) {
                    $_SESSION['cart'] = [];
                }
                if (isset($_SESSION['cart'][$variant_id])) {
                    $new_quantity = $_SESSION['cart'][$variant_id]['num'] + $quantity;
                    if ($new_quantity > $variant['quantity']) {
                        $new_quantity = $variant['quantity'];
                    }
                    $_SESSION['cart'][$variant_id]['num'] = $new_quantity;
                } else {
                    if ($quantity > $variant['quantity']) {
                        $quantity = $variant['quantity'];
                    }
                    $_SESSION['cart'][$variant_id] = [
                        'name' => $variant['name'],
                        'image' => $variant['image'],
                        'size' => $variant['size'],
                        'color' => $variant['color'],
                        'price' => $variant['price'],
                        'num' => $quantity
                    ];
                }
            }
        }
    }

    // Sau khi thêm vào giỏ hàng, chuyển hướng về trang cart
    header('Location: cart.php');
    exit;
}

require_once(__DIR__. '/../layouts/header.php');

$db = new Database();
$cart_items = [];

if (isset($_SESSION['user']['id'])) {
    $user_id = $_SESSION['user']['id'];
    // Lấy giỏ hàng đang hoạt động
    $cart = $db->executeResult("SELECT * FROM carts WHERE user_id = $user_id AND status = 0 LIMIT 1", true);
    if ($cart) {
        $cart_id = $cart['id'];
        // Lấy item trong cart_items join với product_variants + products
        $cart_items = $db->executeResult("
            SELECT ci.*, pv.size, pv.color, pv.price, p.name, p.image
            FROM cart_items ci
            LEFT JOIN product_variants pv ON ci.product_variant_id = pv.id
            LEFT JOIN products p ON pv.product_id = p.id
            WHERE ci.cart_id = $cart_id AND ci.deleted = 0
        ");
    }
} else {
    // Nếu chưa đăng nhập thì lấy giỏ hàng từ session
    $cart_items = $_SESSION['cart'] ?? [];
}

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
            $index = 0;
            if (isset($_SESSION['user']['id'])) {
                // Hiển thị theo DB
                foreach ($cart_items as $item) {
                    echo '<tr>
                        <td>' . (++$index) . '</td>
                        <td><img src="' .$baseUrl.'/' . htmlspecialchars($item['image']) . '" style="height: 80px"/></td>
                        <td>' . htmlspecialchars($item['name']) . '</td>
                        <td>' . htmlspecialchars($item['size'] ?? 'N/A') . '</td>
                        <td>' . htmlspecialchars($item['color'] ?? 'N/A') . '</td>
                        <td>' . number_format($item['price']) . ' VND</td>
                        <td style="display: flex; align-items: center;">
                            <button class="btn btn-light" style="border: solid #e0dede 1px; border-radius: 4px;" onclick="addMoreCart(' . $item['product_variant_id'] . ', -1)">-</button>
                            <input type="number" id="num_' . $item['product_variant_id'] . '" value="' . $item['quantity'] . '" class="form-control" style="width: 90px; border-radius: 4px; margin: 0 5px;" onchange="fixCartNum(' . $item['product_variant_id'] . ')"/>
                            <button class="btn btn-light" style="border: solid #e0dede 1px; border-radius: 4px;" onclick="addMoreCart(' . $item['product_variant_id'] . ', 1)">+</button>
                        </td>
                        <td style="color:green;font-weight:500">' . number_format($item['total_price']) . ' VND</td>
                        <td><button class="btn btn-danger" onclick="deleteCart(' . $item['product_variant_id'] . ')">Xoá</button></td>
                    </tr>';
                }
            } else {
                // Hiển thị theo session
                foreach ($cart_items as $variant_id => $item) {
                    echo '<tr>
                        <td>' . (++$index) . '</td>
                        <td><img src="'.$baseUrl.'/' . htmlspecialchars($item['image']) . '" style="height: 80px"/></td>
                        <td>' . htmlspecialchars($item['name']) . '</td>
                        <td>' . htmlspecialchars($item['size'] ?? 'N/A') . '</td>
                        <td>' . htmlspecialchars($item['color'] ?? 'N/A') . '</td>
                        <td>' . number_format($item['price']) . ' VND</td>
                        <td style="display: flex; align-items: center;">
                            <button class="btn btn-light" style="border: solid #e0dede 1px; border-radius: 4px;" onclick="addMoreCart(' . $variant_id . ', -1)">-</button>
                            <input type="number" id="num_' . $variant_id . '" value="' . $item['num'] . '" class="form-control" style="width: 90px; border-radius: 4px; margin: 0 5px;" onchange="fixCartNum(' . $variant_id . ')"/>
                            <button class="btn btn-light" style="border: solid #e0dede 1px; border-radius: 4px;" onclick="addMoreCart(' . $variant_id . ', 1)">+</button>
                        </td>
                        <td style="color:green;font-weight:500">' . number_format($item['price'] * $item['num']) . ' VND</td>
                        <td><button class="btn btn-danger" onclick="deleteCart(' . $variant_id . ')">Xoá</button></td>
                    </tr>';
                }
            }
            ?>
        </table>

        <?php if (count($cart_items) > 0) : ?>
            <a href="<?= $baseUrl ?>/pages/checkout.php"><button class="btn btn-danger" style="border-radius: 6px; font-size: 26px; float:right !important">TIẾP TỤC THANH TOÁN</button></a>
        <?php endif ?>

    </div>
</div>

<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
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
        $.post('<?= $baseUrl ?>/utils/ajax_request.php', {
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
            $.post('<?= $baseUrl ?>/utils/ajax_request.php', {
                'action': 'delete_cart',
                'variant_id': variantId
            }, function(data) {
                location.reload();
            });
        }
    }
</script>

<?php require_once(__DIR__. '/../layouts/footer.php'); ?>
