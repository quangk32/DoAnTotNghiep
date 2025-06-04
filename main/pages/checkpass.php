<?php
if (session_status() == PHP_SESSION_NONE) {
    session_start();
} 

include_once (__DIR__. '/../db/database.php');
include_once (__DIR__. '/../utils/utility.php');

$db = new Database();

$password = $email = $msg = '';

if (!empty($_POST)) {
    $email = Utility::getPost('email');
    $password = Utility::getPost('pass');

    if (empty($email) || empty($password)) {
        $msg = "Vui lòng nhập đầy đủ email và mật khẩu!";
    } else {
        // Truy vấn tìm user
        $sql = "SELECT * FROM users WHERE email = '$email' AND password = '$password' LIMIT 1";
        $user = $db->executeResult($sql, true); // dùng true để lấy 1 dòng duy nhất

        if ($user == null) {
            $msg = "Tên email hoặc mật khẩu không hợp lệ, vui lòng kiểm tra lại.";
            $_SESSION['isLogin'] = 0;
        } else {
            // Đăng nhập thành công
            $_SESSION['isLogin'] = 1;
            $_SESSION['user'] = [
                'id' => $user['id'],              // QUAN TRỌNG: để insert vào bảng orders
                'name' => $user['name'],
                'email' => $user['email'],
                'phone' => $user['phone'],
                'address' => $user['address']
            ];
            // ======= XỬ LÝ GIỎ HÀNG THEO user_id ============
            // Lấy hoặc tạo giỏ hàng hiện tại
            $userId = $user['id'];
            $sql = "SELECT * FROM carts WHERE user_id = $userId AND status = 0 AND deleted = 0 LIMIT 1";
            $cart = $db->executeResult($sql, true);

            if ($cart == null) {
                // Tạo mới giỏ hàng
                $now = date('Y-m-d H:i:s');
                $insertSql = "INSERT INTO carts (user_id, status, created_at, updated_at, deleted) 
                            VALUES ($userId, 0, '$now', '$now', 0)";
                $db->execute($insertSql);

                // Lấy cart vừa tạo
                $cart = $db->executeResult($sql, true);
            }

            // Lưu cart_id vào session
            $_SESSION['cart_id'] = $cart['id'];
            // ================================================
            echo '<script>
                alert("Đăng nhập thành công!");
                window.location.href = "' .$baseUrl. '/index.php";
            </script>';
            exit;
        }
    }
}
?>
