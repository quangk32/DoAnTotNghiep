<?php
require_once('layouts/header.php');
require_once('db/database.php');

if (session_status() == PHP_SESSION_NONE) {
    session_start();
}

$db = new Database();

// Nếu người dùng chưa đăng nhập -> chuyển hướng
if (!isset($_SESSION['user']['id'])) {
    echo '<script>alert("Vui lòng đăng nhập để cập nhật thông tin."); window.location="login.php";</script>';
    exit;
}

$userId = intval($_SESSION['user']['id']);

// Xử lý cập nhật khi nhấn Submit
if ($_SERVER['REQUEST_METHOD'] === 'POST') {
    $name = $_POST['name'] ?? '';
    $email = $_POST['email'] ?? '';
    $phone = $_POST['phone'] ?? '';
    $address = $_POST['address'] ?? '';

    $sql = "UPDATE users_khach SET name='$name', email='$email', phone='$phone', address='$address' WHERE id=$userId";
    $db->execute($sql);

    // Cập nhật lại session
    $_SESSION['user'] = [
        'id' => $userId,
        'name' => $name,
        'email' => $email,
        'phone' => $phone,
        'address' => $address
    ];

    echo '<script>alert("Cập nhật thông tin thành công!"); window.location="inforuser.php";</script>';
    exit;
}

// Load lại thông tin
$name = $_SESSION['user']['name'];
$email = $_SESSION['user']['email'];
$phone = $_SESSION['user']['phone'];
$address = $_SESSION['user']['address'];
?>

<!-- Giao diện form giữ nguyên -->
<div class="container" style="margin: 50px auto; max-width: 400px;">
    <form method="post" action="inforuser.php">
        <div class="card">
            <div class="card-body">
                <h2 class="card-title text-center mb-4">Thông tin tài khoản</h2>

                <div class="mb-3">
                    <label for="name" class="form-label">Họ và tên</label>
                    <input required="true" type="text" class="form-control" id="name" name="name" value="<?=$name?>">
                </div>

                <div class="mb-3">
                    <label for="email" class="form-label">Email</label>
                    <input required="true" type="email" class="form-control" id="email" name="email" value="<?=$email?>">
                </div>

                <div class="mb-3">
                    <label for="phone" class="form-label">Số điện thoại</label>
                    <input required="true" type="tel" class="form-control" id="phone" name="phone" value="<?=$phone?>">
                </div>

                <div class="mb-3">
                    <label for="address" class="form-label">Địa chỉ</label>
                    <input required="true" type="text" class="form-control" id="address" name="address" value="<?=$address?>">
                </div>

                <div class="d-grid gap-2">
                    <button type="submit" class="btn btn-primary">Cập nhật thông tin</button>
                    <a href="logout.php" class="btn btn-danger">Đăng xuất</a>
                </div>
            </div>
        </div>
    </form>
</div>

<?php require_once('layouts/footer.php'); ?>
