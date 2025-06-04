<?php
include_once  __DIR__. '/../../db/database.php';
include_once  __DIR__. '/../../utils/utility.php';
if (!empty($_POST)) {
    $action = Utility::getPost('action');
    switch ($action) {
        case 'mark':
            updateStatus();
            break;

        default:
            # code...
            break;
    }
}
function updateStatus()
{
    $db = new Database();
    $id = Utility::getPost('id');
    $sql = "update feedback set status = 1 where id = $id";
    $db->execute($sql);
}