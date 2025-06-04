<?php
// Phần đầu file vẫn giữ nguyên
$title = 'Thêm/Sửa Sản Phẩm';
require_once(__DIR__. '/../layouts/header.php');
$db = new Database();
$id = $thumbnail = $title = $price = $discount =  $quantity = $active =  $category_id = $description = '';
require_once(__DIR__. '/form_save.php');

$id = Utility::getGet('id');
if ($id != '' && $id > 0) {
  $sql = "SELECT * FROM products WHERE id=$id";
  $userItem = $db->executeResult($sql, true);
  if ($userItem != null) {
    $thumbnail = $userItem['image'];
    $title = $userItem['name'];
    $description = $userItem['description'];
    $discount = $userItem['discount'];
    $price = $userItem['price'];
    $active = $userItem['active'];
    $quantity = $userItem['quantity'];
    $category_id = $userItem['category_id'];
  } else {
    $id = 0;
  }
} else {
  $id = 0;
}

$sql = "select * from categories";
$categoryItems = $db->executeResult($sql);

// Lấy variants hiện tại của sản phẩm (size, color, quantity)

$productId = $id; // từ $_GET hoặc $_POST
$sql = "SELECT * FROM product_variants WHERE product_id = $productId AND deleted = 0";
$variantItems = $db->executeResult($sql);

?>
<style>
  table.variant-table {
    width: 100%;
    max-width: 650px;
    border-collapse: collapse;
    margin-bottom: 10px;
  }
  table.variant-table th, table.variant-table td {
    border: 1px solid #ddd;
    padding: 8px 12px;
    text-align: center;
    font-size: 14px;
  }
  table.variant-table th {
    background-color: #f0f0f0;
    font-weight: 600;
  }
  select, input[type="number"] {
    width: 100%;
    padding: 4px 6px;
    font-size: 14px;
    box-sizing: border-box;
  }
  .btn-add-variant {
    background-color: #007bff;
    border: none;
    padding: 8px 16px;
    color: white;
    font-weight: 600;
    cursor: pointer;
    border-radius: 4px;
    transition: background-color 0.3s;
  }
  .btn-add-variant:hover {
    background-color: #0056b3;
  }
  .btn-remove-variant {
    background-color: #dc3545;
    border: none;
    padding: 5px 12px;
    color: white;
    font-weight: 600;
    cursor: pointer;
    border-radius: 4px;
  }
  .btn-remove-variant:hover {
    background-color: #b02a37;
  }
</style>
<div class="content-wrapper">
  <!-- Content Header (Page header) -->
  <div class="content-header">
    <div class="container-fluid">
      <div class="row mb-2">
        <div class="col-md-12">
          <a href="index.php"><button class="btn btn-success">Quay lại</button></a>
          <h3 style="text-align: center;">Thêm/Sửa Sản Phẩm</h3>

          <?php if ((isset($msgfail)) && !empty($msgfail)) : ?>
            <div class="alert alert-danger alert-dismissible fade show toast" role="alert" style="max-width: 100%;">
              <strong><?= $msgfail ?></strong>
              <button type="button" class="close" data-dismiss="alert" aria-label="Close">
                <span aria-hidden="true">&times;</span>
              </button>
            </div>
          <?php elseif ((isset($msgsuccess)) && !empty($msgsuccess)) : ?>
            <div class="alert alert-success alert-dismissible fade show toast" role="alert" style="max-width: 100%;">
              <strong><?= $msgsuccess ?></strong>
              <button type="button" class="close" data-dismiss="alert" aria-label="Close">
                <span aria-hidden="true">&times;</span>
              </button>
            </div>
          <?php endif; ?>

          <div class="panel panel-primary">
            <div class="panel-body">
              <form method="post" enctype="multipart/form-data">
                <div class="row">
                  <div class="col-md-9 col-12">
                    <div class="form-group">
                      <label for="usr">Tên Sản Phẩm:</label>
                      <input required="true" type="text" class="form-control" id="usr" placeholder="Nhập tên sản phẩm" name="name" value="<?= $title ?>">
                      <input type="text" name="id" value="<?= $id ?>" hidden="true">
                    </div>

                    <div class="form-group">
                      <label for="pwd">Nội Dung:</label>
                      <textarea class="form-control" rows="5" name="description" id="description" placeholder="Nhập nội dung sản phẩm"><?= $description ?></textarea>
                    </div>

                  <table class="variant-table table table-bordered" id="variant_table">
                      <thead>
                        <tr>
                          <th>Màu</th>
                          <th>Kích cỡ</th>
                          <th>Số lượng</th>
                          <th>Giá</th>
                          <th>Thao tác</th>
                        </tr>
                      </thead>
                      <tbody id="variant_table_body">
                        <?php foreach ($variantItems as $variant): ?>
                          <tr>
                            <td><input type="text" class="form-control color" value="<?= htmlspecialchars($variant['color']) ?>"></td>
                            <td><input type="text" class="form-control size" value="<?= htmlspecialchars($variant['size']) ?>"></td>
                            <td><input type="number" class="form-control quantity" value="<?= (int)$variant['quantity'] ?>" min="0"></td>
                            <td><input type="number" class="form-control price" value="<?= (float)($variant['price'] ?? 0) ?>" min="0"></td> <!-- New -->
                            <td>
                              <div class="d-flex gap-2">
                                <button type="button" class="btn btn-success btn-sm" onclick="saveVariant(this, <?= $id ?>, <?= $variant['id'] ?>)">Lưu</button>
                                <button type="button" class="btn btn-danger btn-sm" onclick="deleteVariant(this, <?= $variant['id'] ?>)">Xóa</button>
                            </div>
                            </td>
                          </tr>
                        <?php endforeach; ?>
                      </tbody>
                    </table>

                    <button type="button" class="btn btn-primary btn-sm" onclick="addVariantRow()">+ Thêm mới</button>

                    <script>
                      function addVariantRow() {
                        const tbody = document.getElementById('variant_table_body');
                        const tr = document.createElement('tr');

                        tr.innerHTML = `
                          <td><input type="text" class="form-control color" placeholder="Màu" required></td>
                          <td><input type="text" class="form-control size" placeholder="Size" required></td>
                          <td><input type="number" class="form-control quantity" value="1" min="0" required></td>
                          <td><input type="number" class="form-control price" value="0" min="0" required></td>
                          <td>
                            <button type="button" class="btn btn-success btn-sm" onclick="saveVariant(this, <?= $id ?>, 0)">Lưu</button>
                            <button type="button" class="btn btn-danger btn-sm" onclick="removeVariantRow(this)">Xóa</button>
                          </td>
                        `;


                        tbody.appendChild(tr);
                      }

                      function removeVariantRow(button) {
                        const row = button.closest('tr');
                        row.remove();
                      }

                      function saveVariant(button, productId, variantId) {
                        const row = button.closest('tr');
                        const color = row.querySelector('.color').value.trim();
                        const size = row.querySelector('.size').value.trim();
                        const quantity = parseInt(row.querySelector('.quantity').value);
                        const price = parseFloat(row.querySelector('.price').value);
                        if (!color || !size || quantity < 0) {
                          alert('Vui lòng nhập đầy đủ thông tin hợp lệ.');
                          return;
                        }

                        fetch('form_api.php?action=save_variant', {
                          method: 'POST',
                          headers: { 'Content-Type': 'application/json' },
                          body: JSON.stringify({
                            product_id: productId,
                            variant_id: variantId,
                            color: color,
                            size: size,
                            quantity: quantity,
                            price: price
                          })
                        })
                        .then(res => res.json())
                        .then(data => {
                          if (data.success) {
                            alert('Lưu thành công!');
                            location.reload();
                          } else {
                            alert(data.message || 'Lưu thất bại!');
                          }
                        })
                        .catch(err => {
                          console.error(err);
                          alert('Có lỗi xảy ra khi lưu.');
                        });
                      }
                    </script>

                    <!-- Phần cũ vẫn giữ nguyên -->
                    <button class="btn btn-success">Lưu Sản Phẩm</button>
                  </div>

                  <div class="col-md-3 col-12" style="border: solid grey 1px; padding-top: 10px; padding-bottom: 10px;">
                    <!-- Image -->
                    <div class="form-group">
                      <label for="thumbnail">Thumbnail:</label>
                      <input value="<?= $thumbnail ?>" type="file" class="form-control" id="thumbnail" name="image" accept=".jpg, .png, .jpeg, .gif, .bmp, .tif, .tiff|image/*" onchange="updateThumbnail()">
                      <img id="thumbnail_img" src="<?= fixUrl($thumbnail) ?>" style="max-height: 160px; margin-top: 5px; margin-bottom: 15px;">
                    </div>

                    <!-- Danh Mục Sản Phẩm -->
                    <div class="form-group">
                      <label for="usr">Danh Mục Sản Phẩm:</label>
                      <select class="form-control" name="category_id" id="category_id" required="true">
                        <option value="">-- Chọn --</option>
                        <?php
                        foreach ($categoryItems as $item) {
                          if ($item['id'] == $category_id) {
                            echo '<option selected value="' . $item['id'] . '">' . $item['name'] . '</option>';
                          } else {
                            echo '<option value="' . $item['id'] . '">' . $item['name'] . '</option>';
                          }
                        }
                        ?>
                      </select>
                    </div>

                    <div class="form-group">
                      <label for="price">Giá:</label>
                      <input required="true" type="number" class="form-control" id="price" name="price" value="<?= $price ?>">
                    </div>

                    <div class="form-group">
                      <label for="price">Giảm Giá:</label>
                      <input required="true" type="number" class="form-control" id="price" name="discount" value="<?= $discount ?>">
                    </div>

                    <div class="form-group">
                      <label for="quantity">Số lượng:</label>
                      <input required="true" type="number" class="form-control" id="quantity" name="quantity" value="<?= $quantity ?>">
                    </div>

                    <div class="form-group">
                      <label for="quantity">Kích hoạt:</label>
                      <select class="form-control" name="active" id="active" required="true">
                        <option value="">-- Chọn --</option>
                        <option value="0" <?= $active == 0 ? 'selected' : '' ?>>Không kích hoạt</option>
                        <option value="1" <?= $active == 1 ? 'selected' : '' ?>>Kích hoạt</option>
                      </select>
                    </div>
                  </div>
                </div>
              </form>
            </div>
          </div>

        </div>
      </div>
    </div>
  </div>
</div>

<script>
function updateThumbnail() {
  var input = document.getElementById('thumbnail');
  var img = document.getElementById('thumbnail_img');
  if (input.files && input.files[0]) {
    img.src = URL.createObjectURL(input.files[0]);
  }
}

function deleteVariant(button, variantId) {
  if (!confirm('Xóa biến thể này?')) return;
  fetch('form_api.php?action=delete_variant', {
    method: 'POST',
    headers: { 'Content-Type': 'application/json' },
    body: JSON.stringify({ variant_id: variantId })
  })
  .then(res => res.json())
  .then(data => {
    if (data.success) {
      button.closest('tr').remove();
    } else {
      alert(data.message || 'Xóa thất bại');
    }
  });
}

</script>
<?php
require_once(__DIR__. '/../layouts/footer.php');
?>
<!-- Thêm CKEditor -->

<script>
  CKEDITOR.replace('ckeditor');
  CKEDITOR.replace('description');
</script>