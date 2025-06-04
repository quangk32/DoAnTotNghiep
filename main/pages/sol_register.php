<?php
include_once(__DIR__. '/../db/database.php');
include_once(__DIR__. '/../utils/utility.php');
$db = new Database();
$name = $email = $msg = '';
if (!empty($_POST)) {
    $name = Utility::getPost('name');
    $email = Utility::getPost('email');
    $phone = Utility::getPost('phone');
    $address = Utility::getPost('address');
    $password = Utility::getPost('password');
    if( strlen($password) < 6) {
        $msg = "Mật khẩu phải tối thiểu 6 ký tự";
    }else{
        $sql1 = "SELECT * FROM users WHERE email='{$email}'";
        $userExist = $db->executeResult($sql1, true);
        if ($userExist != null) {
            $msg = "Email đã tồn tại, vui lòng nhập email khác";
        } else {
            $sql = "INSERT INTO users (name, email, phone, address, password, role_id) VALUES ('$name', '$email', '$phone', '$address', '$password', 3)";

            $db->execute($sql);
            $msg1 = "Đăng ký tài khoản thành công!!!";
        }
    }
}