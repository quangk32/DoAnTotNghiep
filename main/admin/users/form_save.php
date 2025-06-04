<?php
$db = new Database();
if (!empty($_POST)) {
    $id = Utility::getPost('id');
    $name = Utility::getPost('name');
    $address = Utility::getPost('address');
    $phone = Utility::getPost('phone');
    $email = Utility::getPost('email');
    $password = Utility::getPost('password');
    $role_id = Utility::getPost('role_id');


    if ($id > 0) {
        // update
        $sql = "SELECT * FROM users WHERE email='$email' AND id <> $id";
        $userItem = $db->executeResult($sql, true);
        if ($userItem != null) {
            $msgfail = 'Email này đã tồn tại trong tài khoản khác, vui lòng kiểm tra lại';
        } else {
            if ($password != '' ) {
                // đổi mật khẩu
                $sql = "UPDATE users set name='$name',email='$email',phone='$phone',address='$address',password='$password',role_id='$role_id' WHERE id =$id";
                $db->execute($sql);
                $msgsuccess = "Sửa tài khoản thành công";
            } else {
                // truong hop mat khau la rỗng
                $sql = "UPDATE users set name='$name',email='$email',phone='$phone',address='$address',role_id='$role_id' WHERE id =$id";

                $db->execute($sql);

                $msgsuccess = "Sửa tài khoản thành công";
            }
        }
    } else {
        // insert
        $sql = "SELECT * FROM users WHERE email='$email'";
        $userItem = $db->executeResult($sql, true);
        if ($userItem != null) {
            // tai khoan ton tai => faild
            $msgfail = 'Email đã được đăng ký, vui lòng kiểm tra lại';
        } else {
            $sql = "INSERT INTO users (name,email,phone,address,password,role_id) VALUES ('$name','$email','$phone','$address','$password',$role_id)";
            $db->execute($sql);
            $msgsuccess = "Đăng ký tài khoản thành công";
            $name = $role_id = $phone = $address = $password = '';
        }
    }
}
