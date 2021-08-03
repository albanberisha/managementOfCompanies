<br><br>
<?php
if (session_status() === PHP_SESSION_NONE) {
	session_start();
}

$myid = $_SESSION['id'];
$privilege = $_SESSION['privilege'];
if ($privilege != 2) {
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
	if ($_GET['subcat'] == 'add-admin-profile') {

		if (!empty($_GET['edit'])) {
			$editId = $_GET['edit'];
			$query = "SELECT * FROM users WHERE id=$editId and companyId='$companyId'";
			$res = $con->query($query);
			$editData = $res->fetch_assoc();
			if($editData>0)
			{
				$name = $editData['name'];
				$surname = $editData['surname'];
				$username = $editData['username'];
				$email = $editData['email'];
				$birthday = $editData['birthday'];
				$gender = $editData['gender'];
				$phone = $editData['phone'];
				$registered = $editData['registered'];
				$lastupdated = $editData['last_updated'];
	
			}else{
				echo "Hyrje e pa lejuar";
				exit;
			}
			
			$idAttr = "updateForm";
		} else {
			$name = "";
			$surname = "";
			$username = "";
			$email = "";
			$birthday = "";
			$gender = "";
			$phone = "";
			$registered = "";
			$lastupdated = "";
			$editId = '';
			$idAttr = "adminForm";
		}
	?>
		<div class="row">
			<div class="col">
				<h3>Admin Profile</h3>
			</div>
			<div class="col text-right">
				<a href="dashboard.php?cat=website-admin&subcat=admin-profile" class="btn btn-secondary btn-back content-link"> Prapa</a>
			</div>
		</div>
		<br>
		<form id="UpdateUSerForm" name="change_password" class="needs-validation" method="post">
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
				<div class="col">
					<div class="form-group">
						<label><strong>Mbiemri:</strong></label>
						<input type="text" placeholder="Mbiemri" class="form-control" name="surname" id="Surname" value="<?php echo $surname; ?>">
						<span id="Surnameerror" style="color: red;"></span>

					</div>
				</div>
			</div>
			<div class="row">
				<div class="col">
					<div class="form-group">
						<label><strong>Username: <span  style="color: red;">*</span></strong></label>
						<input type="text" placeholder="Username" class="form-control" name="username" id="Username" value="<?php echo $username; ?>">
						<span id="Usernameerror" style="color: red;"></span>

					</div>
				</div>
				<div class="col">
					<div class="form-group">
						<label><strong>Email:</strong></label>
						<input type="text" placeholder="Email" class="form-control" name="email" id="Email" value="<?php echo $email; ?>">
						<span id="Emailerror" style="color: red;"></span>

					</div>
				</div>
			</div>
			<div class="row">
				<div class="col">
					<div class="form-group">
						<label><strong>Numri Mobil:</strong></label>
						<input type="text" name="mobile" id="phone" class="form-control" placeholder="(383) 44-555-555" value="<?php echo $phone; ?>" />
						<span id="Phoneerror" style="color: red;"></span>

				</div>
				</div>
				<div class="col">
					<div class="form-group">
						<label><strong>Datelindja:</strong></label>
						<input type="date" placeholder="Datelindja" class="form-control" name="birthday" value="<?php echo $birthday; ?>">
					</div>
				</div>
				<div class="col">
					<div class="form-group">
						<label><strong>Gjinia:</strong></label>
						<br>
						<?php
						switch ($gender) {
							case 'm': ?><input type="radio" name="gender" value="male" checked> Mashkull<br>
								<input type="radio" name="gender" value="female"> Femer<br><?php ;
																							break;
																						case 'f': ?><input type="radio" class="" name="gender" value="male"> Mashkull<br>
								<input type="radio" name="gender" value="female" checked> Femer<br><?php ;
																									break;
																								default: ?><input type="radio" name="gender" value="male"> Mashkull<br>
								<input type="radio" name="gender" value="female"> Femer<br><?php ;
																							}
																							?>
					</div>
				</div>
			</div>

			<div class="row">
				<div class="col">
					<div class="form-group">
						<label><strong>Password:</strong></label>
						<input type="password" placeholder="Password" class="form-control" name="password" id="Password">
						<span id="Pswerror" style="color: red;"></span>

					</div>
				</div>
				<div class="col">
					<div class="form-group">
						<label><strong>Konfirmo paswordint:</strong></label>
						<input type="password" placeholder="Password" class="form-control" name="cpassword" id="Cpassword">
						<span id="Psw2error" style="color: red;"></span>

					</div>
				</div>

			</div>
			<div class="row">
				<div class="col">
					<div class="form-group">
						<button class="btn btn-secondary">Save</button>
					</div>
				</div>
				<div class="col">

				</div>
			</div>
		</form>
	<?php } elseif (!empty($_GET['view'])) { ?>

		<?php

		$id = $_GET['view'];
		$query = "SELECT * FROM users WHERE id=$id and companyId='$companyId'";
		$res = $con->query($query);

		$viewData = $res->fetch_assoc();
		if ($viewData == 0) {
			echo "Hyrje e pa lejuar";
		} else {



			$fullName = $viewData['name'] . ' ' . $viewData['surname'];
			$username = $viewData['username'];
			$email = $viewData['email'];
			$birthday = $viewData['birthday'];
			$gender = $viewData['gender'];
			$phone = $viewData['phone'];
			$registered = $viewData['registered'];
			$lastupdated = $viewData['last_updated'];

		?>
			<div class="row">
				<div class="col-sm-12">
					<h6>Regjistruar me: <strong><?php echo $registered; ?> </strong></h6>
					<h6>Hera e fundit e përditësimit: <strong><?php echo $lastupdated; ?> </strong></h6>
				</div>
			</div>
			<div class="row">
				<div class="col">
				</div>
				<div class="col text-right">
					<a href="dashboard.php?cat=website-admin&subcat=admin-profile" class="btn btn-secondary btn-back content-link">Prapa</a>
				</div>
			</div>
			<br>
			<div class="table-responsive">
				<table class="table">
					<tr>
						<th>Emri dhe mbiemri -</th>
						<td><?php echo $fullName; ?></td>
					</tr>
					<tr>
						<th>Username -</th>
						<td><?php echo $username; ?></td>
					</tr>
					<tr>
						<th>Email -</th>
						<td><?php echo $email; ?></td>
					</tr>
					<tr>
						<th>Datelindja -</th>
						<td><?php echo $birthday; ?></td>
					</tr>
					<tr>
						<th>Gjinia -</th>
						<td><?php echo $gender; ?></td>
					</tr>
					<tr>
						<th>Telefoni -</th>
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
				<h4>Admin Profile</h4>
			</div>
			<div class="col text-right">
				<a href="dashboard.php?cat=website-admin&subcat=add-admin-profile" class="btn btn-secondary btn-back content-link"> Shto <i class='fas fa-plus'></i></a>
			</div>
		</div>
		<br>
		<div class="row">
			<div class="col">
				<div class="table-responsive">
					<table class="table">
						<tr>
							<th>Nr.</th>
							<th>Emri dhe mbiemri</th>

							<th>Username</th>
							<th>Privilegji</th>
							<th>Statusi</th>
							<th>Shiko</th>
							<th>Ndrysho</th>
							<th>Fshij</th>
						</tr>
						<?php
						$sql1 = "SELECT * FROM users where companyId='$companyId' and status!='2' ORDER BY privilege ASC,name ASC";
						$res1 = $con->query($sql1);
						if ($res1->num_rows > 0) {
							$i = 1;
							while ($data = $res1->fetch_assoc()) {
						?>
								<tr>
									<td><?php echo $i; ?></td>
									<td><?php echo $data['name'] . " " . $data['surname']; ?></td>

									<td><?php echo $data['username']; ?></td>
									<td>
										<?php
										$priv;
										switch ($data['privilege']) {
											case "2":
												$priv = 'Administrator';
												break;
											case "3":
												$priv = 'Perdorues';
												break;
											default:
												$priv = ' ';
												break;
										}
										echo $priv;
										?>
									</td>
									<td>
									<?php
									if(strcmp($data['privilege'],2)==0)
									{
									}else{
										?>
<?php
										if ($data['status'] == 0) {
										?>
											<a href="javascript:void(0)" name="admin_profile" class="text-secondary adminRole" rel="<?php echo $data['id']; ?>">
												<i class='fas fa-user-alt-slash iconRole'></i>
											<?php } else { ?>
												<a href="javascript:void(0)" name="admin_profile" class="text-success adminRole" rel="<?php echo $data['id']; ?>">
													<i class='fas fa-user-alt iconRole'></i></a>
												<?php } ?>

										<?php
									}
									?>
										

												
									</td>
									<?php
									if(strcmp($data['privilege'],2)==0)
									{
										?>
										<td><a href="dashboard.php?cat=website-admin&subcat=admin-profile&view=<?php echo $data['id']; ?>" class=" text-secondary btn-view content-link"><i class='far fa-eye'></i></a></td>
									<td><a href="dashboard.php?cat=website-admin&subcat=add-admin-profile&edit=<?php echo $data['id']; ?>" class="text-success edit_button_color"><i class=' far fa-edit'></i></a></td>
									<td></td>

										<?php
									}else{
										?>
<td><a href="dashboard.php?cat=website-admin&subcat=admin-profile&view=<?php echo $data['id']; ?>" class="text-secondary btn-view content-link"><i class='far fa-eye'></i></a></td>
									<td><a href="dashboard.php?cat=website-admin&subcat=add-admin-profile&edit=<?php echo $data['id']; ?>" class="text-success edit_button_color"><i class=' far fa-edit'></i></a></td>
									<td><a href="javascript:void(0)" class="delete delete_button_color" name="users" id="<?php echo $data['id']; ?>"><i class='far fa-trash-alt'></i></a></td>

										<?php
									}
									?>
									
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