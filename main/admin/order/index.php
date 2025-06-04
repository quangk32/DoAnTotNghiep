<?php
$title = "Trang Quản lý đơn hàng";
include_once __DIR__. '/../layouts/header.php';
$db = new Database();

// Lấy danh sách đơn hàng
$sql = "SELECT id, fullname, email, phone_number, address, order_date, status, total_money 
        FROM orders WHERE deleted = 0
        ORDER BY order_date DESC";
$data = $db->executeResult($sql);

// Đếm số lượng đơn chờ xử lý
$pendingCount = $approvedCount =0;
foreach ($data as $item) {
  if ($item['status'] == 0) $pendingCount++;
  if ($item['status'] == 1) $approvedCount++;
}
?>
<style>
  .nav-pills .nav-link.active {
    background-color: #e8f0fe !important;
    color: #000 !important;
  }

  .nav-pills .nav-link {
    transition: background-color 0.2s;
  }

  .badge-danger {
    background-color: #dc3545 !important;
  }
</style>
<div class="content-wrapper">
  <div class="container-fluid">
    <h1 class="m-3">Quản lý đơn hàng</h1>

    <ul class="nav nav-pills nav-justified mb-3 bg-white rounded shadow-sm p-2" id="orderTabs">
      <li class="nav-item">
        <a class="nav-link active text-dark fw-semibold" data-toggle="tab" href="#pending">
          <i class="fa fa-clock mr-1"></i> Chờ xử lý
          <?php if ($pendingCount > 0) echo '<span class="badge badge-danger ml-1">' . $pendingCount . '</span>'; ?>
        </a>
      </li>
      <li class="nav-item">
        <a class="nav-link text-dark fw-semibold" data-toggle="tab" href="#approved">
          <i class="fa fa-check mr-1"></i> Đã duyệt
          <?php if ($approvedCount > 0) echo '<span class="badge badge-danger ml-1">' . $approvedCount . '</span>'; ?>
        </a>
      </li>
      <li class="nav-item">
        <a class="nav-link text-dark fw-semibold" data-toggle="tab" href="#delivered">
          <i class="fa fa-truck mr-1"></i> Đã giao
        </a>
      </li>
      <li class="nav-item">
        <a class="nav-link text-dark fw-semibold" data-toggle="tab" href="#canceled">
          <i class="fa fa-times mr-1"></i> Đã huỷ
        </a>
      </li>
    </ul>

    <div class="tab-content mt-3">
      <?php renderOrderTabContent($data); ?>
    </div>
  </div>
</div>

<script>
function changeStatus(id, status) {
  $.post('form_api.php', {
    id: id,
    status: status,
    action: 'update_status'
  }, function(data) {
    location.reload();
  }).fail(function() {
    alert('Có lỗi xảy ra.');
  });
}

function deleteUser(id) {
  if (!confirm('Chắc chắn muốn xóa đơn này?')) return;

  $.post('form_api.php', {
    id: id,
    action: 'delete'
  }, function(data) {
    location.reload();
  }).fail(function() {
    alert('Xóa thất bại.');
  });
}
</script>

<?php
include_once __DIR__. '/../layouts/footer.php';

function renderOrderTabContent($orders) {
  $statuses = [0 => 'pending', 1 => 'approved', 3 => 'delivered', 2 => 'canceled'];

  foreach ($statuses as $status => $tabId) {
    echo '<div class="tab-pane fade'. ($status === 0 ? ' show active' : '') .'" id="' . $tabId . '">';

    $filtered = array_filter($orders, function ($o) use ($status) {
      return $o['status'] == $status;
    });

    if (empty($filtered)) {
      echo '<p class="text-muted">Không có đơn nào.</p>';
    } else {
      echo '<div class="table-responsive">
            <table class="table table-hover table-bordered align-middle text-center">
        <thead class="thead-light"><tr>
          <th>#</th><th>Tên</th><th>SĐT</th><th>Địa chỉ</th><th>Ngày</th><th>Tổng</th><th>Chi tiết</th><th>Hành động</th>
        </tr></thead>
        <tbody>';
      $i = 0;
      foreach ($filtered as $o) {
        echo '<tr>
          <td>' . (++$i) . '</td>
          <td>' . htmlspecialchars($o['fullname']) . '</td>
          <td>' . htmlspecialchars($o['phone_number']) . '</td>
          <td>' . htmlspecialchars($o['address']) . '</td>
          <td>' . $o['order_date'] . '</td>
          <td>' . number_format($o['total_money']) . ' VNĐ</td>
          <td><a href="detail.php?id=' . $o['id'] . '" class="btn btn-sm btn btn-info">Xem</a></td>
          <td>';

        if ($o['status'] == 0) {
          echo '<button class="btn btn-sm btn-success" onclick="changeStatus(' . $o['id'] . ',1)">Duyệt</button>
                <button class="btn btn-sm btn-danger" onclick="changeStatus(' . $o['id'] . ',2)">Huỷ</button>';
        } elseif ($o['status'] == 1) {
          echo '<button class="btn btn-sm btn-primary" onclick="changeStatus(' . $o['id'] . ',3)">Giao hàng</button>';
        } elseif ($o['status'] == 3) {
          echo '<span class="badge badge-primary">Hoàn tất</span>';
        } else {
          echo '<span class="badge badge-danger">Huỷ</span>';
        }

        echo '</td></tr>';
      }
      echo '</tbody></table></div>';
    }

    echo '</div>';
  }
}
