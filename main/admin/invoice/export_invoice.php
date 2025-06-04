<?php
require_once(__DIR__. '/../../TCPDF/tcpdf.php');
require_once(__DIR__. '/../../db/database.php');
require_once(__DIR__. '/../../utils/utility.php');

$orderId = Utility::getGet('id');
$db = new Database();

// Lấy thông tin đơn hàng
$sql = "SELECT * FROM orders WHERE id = $orderId";
$order = $db->executeResult($sql, true);

// Lấy chi tiết sản phẩm
$sql = "
SELECT od.*, p.name, pv.size, pv.color
FROM order_details od
JOIN product_variants pv ON od.product_variant_id = pv.id
JOIN products p ON pv.product_id = p.id
WHERE od.order_id = $orderId";
$orderDetails = $db->executeResult($sql);

// Khởi tạo PDF
$pdf = new TCPDF();
$pdf->AddPage();

// Logo và tiêu đề
$pdf->Image('./dist/img/logo.png', 15, 10, 40); // Đổi đường dẫn logo phù hợp
$pdf->SetFont('dejavusans', 'B', 16);
$pdf->Cell(0, 15, 'HÓA ĐƠN BÁN HÀNG TORANO', 0, 1, 'C');
$pdf->Ln(5);

// Thông tin đơn hàng
$pdf->SetFont('dejavusans', '', 11);
$pdf->Write(0, "Mã đơn hàng: #" . $order['id']);
$pdf->Ln(6);
$pdf->Write(0, "Ngày tạo: " . date('d/m/Y H:i:s', strtotime($order['order_date'])));
$pdf->Ln(6);
$pdf->Write(0, "Khách hàng: " . $order['fullname']);
$pdf->Ln(6);
$pdf->Write(0, "Email: " . $order['email']);
$pdf->Ln(6);
$pdf->Write(0, "SĐT: " . $order['phone_number']);
$pdf->Ln(6);
$pdf->Write(0, "Địa chỉ: " . $order['address']);
$pdf->Ln(10);

// Bảng sản phẩm
$html = '<table border="1" cellpadding="4">
    <tr style="background-color:#f2f2f2;">
        <th><b>STT</b></th>
        <th><b>Tên sản phẩm</b></th>
        <th><b>Size</b></th>
        <th><b>Màu</b></th>
        <th><b>Giá</b></th>
        <th><b>Số lượng</b></th>
        <th><b>Tổng</b></th>
    </tr>';

$index = 0;
$total = 0;
foreach ($orderDetails as $item) {
    $index++;
    $lineTotal = $item['price'] * $item['num'];
    $total += $lineTotal;
    $html .= '<tr>
        <td>' . $index . '</td>
        <td>' . htmlspecialchars($item['name']) . '</td>
        <td>' . $item['size'] . '</td>
        <td>' . $item['color'] . '</td>
        <td>' . number_format($item['price']) . 'đ</td>
        <td>' . $item['num'] . '</td>
        <td>' . number_format($lineTotal) . 'đ</td>
    </tr>';
}
$html .= '<tr>
    <td colspan="6" align="right"><b>Tổng cộng</b></td>
    <td><b>' . number_format($total) . 'đ</b></td>
</tr>';
$html .= '</table>';

$pdf->writeHTML($html, true, false, false, false, '');

// Lời cảm ơn
$pdf->Ln(10);
$pdf->SetFont('dejavusans', 'I', 11);
$pdf->MultiCell(0, 0, "Cảm ơn bạn đã mua hàng tại Torano!\nHẹn gặp lại quý khách lần sau.", 0, 'C');

// Xuất PDF
$pdf->Output("invoice_order_$orderId.pdf", 'I');
?>
