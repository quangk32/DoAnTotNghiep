<?php
include_once  __DIR__. '/../../db/database.php';
include_once  __DIR__. '/../../utils/utility.php';
if (!empty($_POST)) {
    $action = Utility::getPost('action');
    switch ($action) {
        case 'delete':
            deleteUser();
            break;

        default:
            # code...
            break;
    }
}
function deleteUser()
{
    $db = new Database();
    $id = Utility::getPost('id');
    $sql = "delete from roles where id= $id";
    $db->execute($sql);
}
