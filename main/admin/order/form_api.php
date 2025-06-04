<?php
include_once  __DIR__. '/../../db/database.php';
include_once  __DIR__. '/../../utils/utility.php';
if (!empty($_POST)) {
    $action = Utility::getPost('action');
    switch ($action) {
        case 'update_status':
            updateStatus();
            break;
        case 'delete':
            deleteUser();
            break;
        default:
            break;
    }
}
// Cập nhật trạng thái đơn hàng
if ($_POST['action'] == 'update_status') {
    $id = $_POST['id'];
    $status = $_POST['status'];
    $update_sql = "UPDATE orders SET status = $status WHERE id = $id";
    $db->execute($update_sql);
}

function updateStatus()
{
    $db = new Database();
    $id = Utility::getPost('id');
    $status = Utility::getPost('status');
    $sql = "UPDATE orders SET status=$status WHERE id=$id"; 
    $db->execute($sql);
}

function deleteUser()
{
    $db = new Database();
    $id = Utility::getPost('id');
     $sql = "UPDATE orders SET deleted = 1 WHERE id = $id";
    $db->execute($sql);
}