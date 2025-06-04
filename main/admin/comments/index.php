<?php
$title = "Trang Quản Lý Phản Hồi";
include_once __DIR__. '/../layouts/header.php';
date_default_timezone_set('Asia/Ho_Chi_Minh'); // Đặt timezone cho PHP

$db = new Database();

// Lấy tất cả comment kèm theo thông tin user và sản phẩm
$sql = "SELECT comments.*, users.name AS user_name, users.role_id, products.name AS product_name 
        FROM comments 
        JOIN users ON comments.user_id = users.id 
        JOIN products ON comments.product_id = products.id 
        WHERE comments.deleted = 0 
        ORDER BY comments.created_at DESC"; // Lấy comment mới nhất trước
$allComments = $db->executeResult($sql);

// Gom comment theo từng sản phẩm
$groupedComments = []; // [product_id => ['product_name' => ..., 'comments' => [...]]]
foreach ($allComments as $c) {
    $pid = $c['product_id'];
    if (!isset($groupedComments[$pid])) {
        $groupedComments[$pid] = [
            'product_name' => $c['product_name'],
            'comments' => []
        ];
    }
    $groupedComments[$pid]['comments'][] = $c;
}

// Hàm hiển thị đệ quy comment cha - con, sắp xếp replies mới nhất lên đầu
function renderComments($comments, $level = 0) {
    // Sắp xếp comment theo created_at giảm dần (mới nhất lên trên)
    usort($comments, function($a, $b) {
        return strtotime($b['created_at']) - strtotime($a['created_at']);
    });

    foreach ($comments as $comment) {
        $isAdmin = isset($comment['role_id']) && $comment['role_id'] == 1; // Giả sử role_id=1 là admin
        echo '<div style="margin-left: '.($level * 30).'px; border: 1px solid #ccc; padding: 10px; margin-bottom: 5px; border-radius: 5px;">';
        echo '<b>' . htmlspecialchars($comment['user_name']);
        if ($isAdmin) {
            echo ' <span title="Admin" style="color: red; font-weight: bold;">&#128081;</span>';
        }
        echo '</b> <small style="color:gray;">' . htmlspecialchars($comment['created_at']) . '</small>';
        echo '<p style="margin: 8px 0;">' . nl2br(htmlspecialchars($comment['content'])) . '</p>';

        // Nút xóa
        echo '<form method="post" action="form_api.php" style="display:inline-block; margin-right: 10px;">';
        echo '<input type="hidden" name="action" value="delete_comment">';
        echo '<input type="hidden" name="comment_id" value="' . $comment['id'] . '">';
        echo '<button type="submit" class="btn btn-sm btn-danger" onclick="return confirm(\'Bạn có chắc muốn xóa?\')">Xóa</button>';
        echo '</form>';

        // Nút reply
        echo '<button class="btn btn-sm btn-secondary" onclick="toggleReplyForm(' . $comment['id'] . ')">Trả lời</button>';
        echo '<form method="post" action="form_api.php" id="reply-form-' . $comment['id'] . '" style="display:none; margin-top:5px;">';
        echo '<input type="hidden" name="action" value="reply_comment">';
        echo '<input type="hidden" name="parent_id" value="' . $comment['id'] . '">';
        echo '<input type="hidden" name="product_id" value="' . $comment['product_id'] . '">';
        echo '<textarea name="content" required rows="2" class="form-control mt-2" placeholder="Viết trả lời..."></textarea>';
        echo '<button type="submit" class="btn btn-sm btn-primary mt-1">Gửi</button>';
        echo '</form>';

        // Nếu có replies thì hiển thị tiếp
        if (!empty($comment['replies'])) {
            renderComments($comment['replies'], $level + 1);
        }

        echo '</div>';
    }
}

?>

<div class="content-wrapper">
    <div class="content-header">
        <div class="container-fluid">
            <h1 class="mb-4">Quản lý phản hồi sản phẩm</h1>
            <!-- Danh sách phản hồi theo sản phẩm -->
            <?php foreach ($groupedComments as $productId => $group): ?>
                <h4 class="text-primary mt-4 mb-3">🛒 Sản phẩm: <?= htmlspecialchars($group['product_name']) ?></h4>
                <?php
                // Tạo cây comment cha - con 2 cấp, comment cha mới nhất lên đầu
                $commentTree = [];

                // Lấy comment cha (parent_id = null) - đã sắp xếp trong $group['comments'] theo created_at DESC
                foreach ($group['comments'] as $c) {
                    if ($c['parent_id'] === null) {
                        $commentTree[$c['id']] = $c;
                        $commentTree[$c['id']]['replies'] = [];
                    }
                }

                // Gán replies cho comment cha, cũng sắp xếp mới nhất lên đầu
                foreach ($group['comments'] as $c) {
                    if ($c['parent_id'] !== null && isset($commentTree[$c['parent_id']])) {
                        $commentTree[$c['parent_id']]['replies'][] = $c;
                    }
                }

                // Vì $commentTree là mảng key = id ko sắp xếp được, ta sắp xếp lại theo created_at giảm dần
                usort($commentTree, function($a, $b) {
                    return strtotime($b['created_at']) - strtotime($a['created_at']);
                });

                renderComments($commentTree);
                ?>
            <?php endforeach; ?>
        </div>
    </div>
</div>

<script>
function toggleReplyForm(id) {
    const form = document.getElementById('reply-form-' + id);
    form.style.display = (form.style.display === 'none' || form.style.display === '') ? 'block' : 'none';
}
</script>

<?php include_once __DIR__. '/../layouts/footer.php'; ?>
