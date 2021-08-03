<?php
if (session_status() === PHP_SESSION_NONE) {
  session_start();
}
$username2 = $_SESSION['username'];
if (empty($username2)) {
  header("location: ../../index.php");
}
$myid = $_SESSION['id'];
$query="SELECT registered,last_updated from users where id='$myid'";
$dbquery=mysqli_query($con,$query);
if(!$dbquery)
{
  mysqli_error($con).$dbquery;
}else{
  $data=mysqli_fetch_array($dbquery);
  if($data==0)
  {
    echo "Error";
    exit();
  }else{
    $registered=$data['registered'];
    $lastUpdated=$data['last_updated'];
  }
}


?>
<br><br>
<div class="row">
  <div class="col-sm-12">
    <h4>Ndrysho paswordin</h4>
  </div>
</div>
<div class="row">
  <div class="col-sm-12">
  <h6>Regjistruar me: <strong><?php echo $registered; ?> </strong></h6>
    <h6>Hera e fundit e përditësimit: <strong><?php echo $lastUpdated; ?> </strong></h6>
  </div>
</div>
<br>
<div class="form">
  <form id="PaswordUserForm" name="change_password" class="needs-validation" method="post">
    <div class="form-group">
      <label for="uname">Paswordi i vjeter</label>
      <input type="password" class="form-control" name="old_password" id="Old_password" placeholder="Sheno paswordin e vjeter" name="password">
      <span id="OldPasError" style="color: red;"></span>

    </div>
    <div class="form-group">
      <label for="pwd">Paswordi i ri</label>
      <input type="password" name="new_password" id="New_password" class="form-control" placeholder="Sheno paswordin e ri">
      <span id="NewPasError" style="color: red;"></span>
    </div>
    <div class="form-group">
      <label for="pwd">Përserit paswordin</label>
      <input type="password" name="new_password2" id="New2_password" class="form-control" placeholder="Përserit paswordin">
      <span id="New2PasError" style="color: red;"></span>
    </div>
    <div class="form-group">
      <button class="btn btn-secondary">Ruaj</button>
    </div>
  </form>
</div>
</div>

<script>
  /*
// Disable form submissions if there are invalid fields
(function() {
  'use strict';
  window.addEventListener('load', function() {
    // Get the forms we want to add validation styles to
    var forms = document.getElementsByClassName('needs-validation');
    // Loop over them and prevent submission
    var validation = Array.prototype.filter.call(forms, function(form) {
      form.addEventListener('submit', function(event) {
        if (form.checkValidity() === false) {
          event.preventDefault();
          event.stopPropagation();
        }
        form.classList.add('was-validated');
      }, false);
    });
  }, false);
})();
 */
</script>
<script type="text/javascript" src="scripts/forms.js"></script>