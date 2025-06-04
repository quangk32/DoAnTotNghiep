<?php
include_once  __DIR__. '/../../db/database.php';
include_once  __DIR__. '/../../utils/utility.php';

if ($_SERVER['REQUEST_METHOD'] === 'POST') {
    $db = new Database();
    $id = (int)($_POST['id'] ?? 0);
    $action = $_POST['action'] ?? '';

    if ($id > 0) {
        switch ($action) {
            case 'approve':
                $db->execute("UPDATE reviews SET status = 1 WHERE id = $id");
                break;

            case 'hide':
                $db->execute("UPDATE reviews SET status = 0 WHERE id = $id");
                break;

            case 'delete':
                $db->execute("UPDATE reviews SET deleted = 1 WHERE id = $id");
                break;
        }
    }

    header("Location: index.php");
    exit;
}
?>
