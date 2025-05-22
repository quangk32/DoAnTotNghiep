<?php
$name=$email=$phone=$address=''; 
require_once('layouts/header.php');

if(isset($_SESSION['user']['id'])){
	$name = $_SESSION['user']['name'];
	$email = $_SESSION['user']['email'];
	$phone = $_SESSION['user']['phone'];
	$address = $_SESSION['user']['address'];
}
?>
<div class="container row" style=" margin-top: 20px; margin-bottom: 20px; margin-left: auto; margin-right: auto;">
<!-- display:flex; justify-content: space-between; -->
	<form method="post" onsubmit="completeCheckout()" class="col-md-6">
		<div class="row">
			<div class="col-md-12">
				<div class="form-group" style="width: 100%">
					Tên:<input required="true" type="text" class="form-control" name="name" value="<?=$name?>">
				</div>
				<div class="form-group" style="width: 100%">
					Email:<input required="true" type="text" class="form-control" name="email" value="<?=$email?>">
				</div>
				<div class="form-group" style="width: 100%">
					Phone:<input required="true" type="text" class="form-control" name="phone" value="<?=$phone?>">
				</div>
				<div class="form-group" style="width: 100%">
					Address:<input required="true" type="text" class="form-control" name="address" value="<?=$address?>">
				</div>
				<div class="form-group" style="width: 100%">
				<label for="pwd">Nội dung:</label>
				<textarea class="form-control" rows="3" name="note"></textarea>
				</div>
			</div>
		</div>
	</form>

	<div class="col-md-6">
		<div>
			<table class="table table-bordered">
			<tr>
				<th>STT</th>
				<th>Tiêu Đề</th>
				<th>Size</th>
				<th>Color</th>
				<th>Giá</th>
				<th>Số Lượng</th>
				<th>Tổng Giá</th>
			</tr>
			<?php
			$_SESSION['gia'] = 0;
			if(!isset($_SESSION['cart'])) {
				$_SESSION['cart'] = [];
			}
			$index = 0;
			foreach($_SESSION['cart'] as $item) {
				echo '<tr>
						<td>'.(++$index).'</td>
						<td>'.$item['name'].'</td>
						<td>'.($item['size'] ?? 'N/A').'</td>
						<td>'.($item['color'] ?? 'N/A').'</td>
						<td>'.number_format($item['discount']).' VND</td>
						<td>'.$item['num'].'</td>
						<td>'.number_format($item['discount'] * $item['num']).' VND</td>
					</tr>';
				$_SESSION['gia'] += $item['discount'] * $item['num'];
			}
			
			?>
			</table>
			<a href="complete.php"><button class="btn btn-warning" style="border-radius: 4px; font-size: 26px; width: 100%;">Thanh toán COD </button></a>
		</div>
	
		<div style="margin-top: 10px;">
			<h5>Thanh toán qua VNPay</h5>
			<form action="vnpay_payment.php" method="post">
				<button type="submit" class="btn btn-success" style="width: 100%;">Thanh Toán VNPay</button>
			</form>
		</div>



	</div>

</div>

<script type="text/javascript">
	function completeCheckout() {
		$.post('utils/ajax_request.php', {
			'action': 'checkout',
			'fullname': $('[name=name]').val(),
			'email': $('[name=email]').val(),
			'phone_number': $('[name=phone]').val(),
			'address': $('[name=address]').val(),
			'note': $('[name=note]').val()
		}, function() {
			window.open('complete.php', '_self');
		})
		return false;
	}
</script>
<?php
require_once('layouts/footer.php');
?>