<br><br>
<?php
if (session_status() === PHP_SESSION_NONE) {
	session_start();
}

$myid = $_SESSION['id'];
$privilege = $_SESSION['privilege'];
if ($privilege != 1) {
	header("location: ../index.php");
}
?>
<div class="content-box">
	<?php
	$username2 = $_SESSION['username'];
	if (empty($username2)) {
		header("location: ../../index.php");
	}
	$myid = $_SESSION['id'];
	$companyId = "";
	$query = "SELECT companyId from users where id='$myid'";
	$result = mysqli_query($con, $query);
	$row = mysqli_fetch_array($result);
	if ($row > 0) {
		$companyId = $row['companyId'];
	} else {
		echo $error = "1";
		exit;
	}
	if ($_GET['subcat'] == 'add-companies') {
			$idAttr = "updateForm";
	?>
		<div class="row">
			<div class="col">
				<h3>Profili i kompanise</h3>
			</div>
			<div class="col text-right">
				<a href="dashboard.php?cat=website-admin&subcat=companies" class="btn btn-secondary btn-back content-link"> Prapa</a>
			</div>
		</div>
		<br>
		<form id="AddCompanyForm" name="change_password" class="needs-validation" method="post">
			<div class="row">
				<div class="col">
					<div class="form-group">
						<label><strong>Emri: <span  style="color: red;">*</span></strong></label>
						<input type="text" placeholder="Emri" class="form-control" name="name" id="Name">
						<span id="Nameerror" style="color: red;"></span>

					</div>
				</div>
			</div>
			<div class="row">
				<div class="col">
					<div class="form-group">
						<label><strong>Telefoni: </strong></label>
                        <input type="text" name="mobile" id="phone" class="form-control" placeholder="(383) 44-555-555"  />
						<span id="Phoneerror" style="color: red;"></span>

					</div>
				</div>
			</div>
			<div class="row">
				<div class="col">
					<div class="form-group">
						<button class="btn btn-secondary">Ruaj</button>
					</div>
				</div>
				<div class="col">
				</div>
			</div>
		</form>
	<?php } elseif (!empty($_GET['update'])) {
			$editId = $_GET['update'];
			$query = "SELECT * FROM companies WHERE id='$editId'";
			$res = $con->query($query);
			$editData = $res->fetch_assoc();
			if($editData>0)
			{
				$name = $editData['name'];
				$phone = $editData['phone'];
				$registered = $editData['registered'];
	
			}else{
				echo "Hyrje e pa lejuar";
				exit;
			}
			
			$idAttr = "updateForm";
	?>
		<div class="row">
			<div class="col">
				<h3>Profili i kompanise</h3>
			</div>
			<div class="col text-right">
				<a href="dashboard.php?cat=website-admin&subcat=companies" class="btn btn-secondary btn-back content-link"> Prapa</a>
			</div>
		</div>
		<br>
		<form id="UpdateCompanyForm" name="change_password" class="needs-validation" method="post">
		<?php
		if(strcmp($idAttr,"updateForm")==0)
		{
			?>
			<input type="hidden" name="editid" id="UserId" value="<?php echo $editId ?>">
			<?php
		}
		?>
			<div class="row">
				<div class="col">
					<div class="form-group">
						<label><strong>Emri: <span  style="color: red;">*</span></strong></label>
						<input type="text" placeholder="Emri" class="form-control" name="name" id="Name" value="<?php echo $name; ?>">
						<span id="Nameerror" style="color: red;"></span>

					</div>
				</div>
			</div>
			<div class="row">
				<div class="col">
					<div class="form-group">
						<label><strong>Telefoni: </strong></label>
                        <input type="text" name="mobile" id="phone" class="form-control" placeholder="(383) 44-555-555" value="<?php echo $phone; ?>" />
						<span id="Phoneerror" style="color: red;"></span>

					</div>
				</div>
			</div>
			<div class="row">
				<div class="col">
					<div class="form-group">
						<button class="btn btn-secondary">Ruaj</button>
					</div>
				</div>
				<div class="col">
				</div>
			</div>
		</form>
	<?php } elseif (!empty($_GET['view'])) { ?>

		<?php

		$id = $_GET['view'];
		$query = "SELECT * FROM companies WHERE id=$id";
		$res = $con->query($query);

		$viewData = $res->fetch_assoc();
		if ($viewData == 0) {
			echo "Hyrje e pa lejuar";
		} else {
			$name = $viewData['name'];
			$phone = $viewData['phone'];
			$registered = $viewData['registered'];
		?>
			<div class="row">
				<div class="col-sm-12">
					<h6>Regjistruar me: <strong><?php echo $registered; ?> </strong></h6>
				</div>
			</div>
			<div class="row">
				<div class="col">
				</div>
				<div class="col text-right">
					<a href="dashboard.php?cat=website-admin&subcat=companies" class="btn btn-secondary btn-back content-link">Prapa</a>
				</div>
			</div>
			<br>
			<div class="table-responsive">
				<table class="table">
					<tr>
						<th>Emri- </th>
						<td><?php echo $name; ?></td>
					</tr>
					<tr>
						<th>Phone -</th>
						<td><?php echo $phone; ?></td>
					</tr>
				</table>
			</div>
		<?php
		}
	} else { ?>


		<!-----=================table content start=================-->

		<div class="row">
			<div class="col">
				<h4>Profili i kompanise</h4>
			</div>
			<div class="col text-right">
				<a href="dashboard.php?cat=website-admin&subcat=add-companies" class="btn btn-secondary btn-back content-link"> Shto <i class='fas fa-plus'></i></a>
			</div>
		</div>
		<br>
		<div class="row">
			<div class="col">
				<div class="table-responsive">
					<table class="table">
						<tr>
							<th>Nr.</th>
							<th>Emri</th>

							<th>Telefoni</th>
							<th>Shiko</th>
							<th>Ndrysho</th>
							<th>Fshij</th>
						</tr>
						<?php
						$sql1 = "SELECT * FROM companies";
						$res1 = $con->query($sql1);
						if ($res1->num_rows > 0) {
							$i = 1;
							while ($data = $res1->fetch_assoc()) {
						?>
								<tr>
									<td><?php echo $i; ?></td>
									<td><?php echo $data['name']; ?></td>

									<td><?php echo $data['phone']; ?></td>
										<td><a href="dashboard.php?cat=website-admin&subcat=companies&view=<?php echo $data['id']; ?>" class=" text-secondary btn-view content-link"><i class='far fa-eye'></i></a></td>
									<td><a href="dashboard.php?cat=website-admin&subcat=companies&update=<?php echo $data['id']; ?>" class="text-success edit_button_color"><i class=' far fa-edit'></i></a></td>
									<td><a href="javascript:void(0)" class="delete delete_button_color" name="companies" id="<?php echo $data['id']; ?>"><i class='far fa-trash-alt'></i></a></td>
									
								</tr>
							<?php
								$i++;
							}
						} else {

							?>
							<tr>
								<td colspan="6">No Admin Profile Data</td>
							</tr>
						<?php } ?>

					</table>
				</div>
			</div>
		</div>
		<!-----==================table content end===================-->
	<?php } ?>

</div>
<script>
	document.getElementById('phone').addEventListener('input', function(e) {
		var x = e.target.value.replace(/\D/g, '').match(/(\d{0,3})(\d{0,2})(\d{0,3})(\d{0,3})/);
		e.target.value = !x[2] ? x[1] : '(' + x[1] + ') ' + x[2] + (x[3] ? '-' + x[3] : '') + (x[4] ? '-' + x[4] : '');
	});
</script>
<script type="text/javascript" src="scripts/forms.js"></script>