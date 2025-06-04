<?php
session_start();
require_once(__DIR__. '/../layouts/header.php');
require_once(__DIR__. '/../db/database.php');

$db = new Database();

if (!isset($_SESSION['user']['id'])) {
    echo "Vui lòng đăng nhập để thanh toán!";
    exit;
}

$user_id = $_SESSION['user']['id'];
$name = $_SESSION['user']['name'] ?? '';
$email = $_SESSION['user']['email'] ?? '';
$phone = $_SESSION['user']['phone'] ?? '';
$address = $_SESSION['user']['address'] ?? '';

// Lấy cart_id của user (mỗi user có 1 cart chưa xóa)
$sqlCartId = "SELECT id FROM carts WHERE user_id = $user_id AND deleted = 0 LIMIT 1";
$cart = $db->executeSingleResult($sqlCartId);
if (!$cart) {
    echo "Giỏ hàng trống hoặc chưa tồn tại.";
    exit;
}
$cart_id = $cart['id'];

// Lấy các item trong cart_items của cart đó, chưa xóa
$sql = "
SELECT 
    ci.id AS cart_item_id,
    p.name AS product_name,
    p.image,
    pv.color,
    pv.size,
    pv.price,
    ci.quantity,
    ci.total_price
FROM cart_items ci
JOIN product_variants pv ON ci.product_variant_id = pv.id
JOIN products p ON pv.product_id = p.id
WHERE ci.cart_id = $cart_id AND ci.deleted = 0
";

$cartItems = $db->executeResult($sql);

$totalMoney = 0;
?>

<div class="container row" style="margin: 20px auto;">
    <form method="post" onsubmit="return completeCheckout()" class="col-md-6">
        <div class="form-group">
            Tên:<input required type="text" class="form-control" name="name" value="<?= htmlspecialchars($name) ?>">
        </div>
        <div class="form-group">
            Email:<input required type="email" class="form-control" name="email" value="<?= htmlspecialchars($email) ?>">
        </div>
        <div class="form-group">
            Phone:<input required type="text" class="form-control" name="phone" value="<?= htmlspecialchars($phone) ?>">
        </div>
        <div class="form-group">
            Address:<input required type="text" class="form-control" name="address" value="<?= htmlspecialchars($address) ?>">
        </div>
        <div class="form-group">
            <label>Nội dung:</label>
            <textarea class="form-control" rows="3" name="note"></textarea>
        </div>
    </form>

    <div class="col-md-6">
        <table class="table table-bordered">
            <thead>
                <tr>
                    <th>STT</th>
                    <th>Tiêu Đề</th>
                    <th>Size</th>
                    <th>Color</th>
                    <th>Giá</th>
                    <th>Số Lượng</th>
                    <th>Tổng Giá</th>
                </tr>
            </thead>
            <tbody>
                <?php
                $index = 0;
                foreach ($cartItems as $item) {
                    $totalMoney += $item['total_price'];

                    echo '<tr>
                        <td>' . (++$index) . '</td>
                        <td>' . htmlspecialchars($item['product_name']) . '</td>
                        <td>' . htmlspecialchars($item['size'] ?? 'N/A') . '</td>
                        <td>' . htmlspecialchars($item['color'] ?? 'N/A') . '</td>
                        <td>' . number_format($item['price']) . ' VND</td>
                        <td>' . $item['quantity'] . '</td>
                        <td>' . number_format($item['total_price']) . ' VND</td>
                    </tr>';
                }
                ?>
                <tr>
                    <td colspan="6" style="text-align: right;"><strong>Tổng tiền:</strong></td>
                    <td><strong><?= number_format($totalMoney) ?> VND</strong></td>
                </tr>
            </tbody>
        </table>
        <?php
        $_SESSION['gia'] = $totalMoney;
        ?>
        <a href="<?= $baseUrl ?>/pages/complete.php">
            <button class="btn btn-warning" style="border-radius: 4px; font-size: 26px; width: 100%;">Thanh toán COD</button>
        </a>

        <div style="margin-top: 10px;">
            <h5>Thanh toán qua VNPay</h5>
            
            <form action="<?= $baseUrl ?>/pages/payment.php" method="post">
                <button type="submit" class="btn btn-success" style="width: 100%;">Thanh Toán VNPay</button>
            </form>
        </div>
    </div>
</div>

<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script>
function completeCheckout() {
    $.post('<?= $baseUrl ?>/utils/ajax_request.php', {
        action: 'checkout',
        fullname: $('[name=name]').val(),
        email: $('[name=email]').val(),
        phone_number: $('[name=phone]').val(),
        address: $('[name=address]').val(),
        note: $('[name=note]').val()
    }, function() {
        window.open('<?= $baseUrl ?>/pages/complete.php', '_self');
    });
    return false; // ngăn submit reload trang
}
</script>

<?php require_once(__DIR__. '/../layouts/footer.php'); ?>
