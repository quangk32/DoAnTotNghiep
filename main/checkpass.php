<?php
if (session_status() == PHP_SESSION_NONE) {
    session_start();
} 

include_once 'db/database.php';
include_once "utils/utility.php";

$db = new Database();

$password = $email = $msg = '';

if (!empty($_POST)) {
    $email = Utility::getPost('email');
    $password = Utility::getPost('pass');

    if (empty($email) || empty($password)) {
        $msg = "Vui lòng nhập đầy đủ email và mật khẩu!";
    } else {
        // Truy vấn tìm user
        $sql = "SELECT * FROM users_khach WHERE email = '$email' AND password = '$password' LIMIT 1";
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

            echo '<script>
                alert("Đăng nhập thành công!");
                window.location.href = "index.php";
            </script>';
            exit;
        }
    }
}
?>
