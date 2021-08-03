<?php
if (session_status() === PHP_SESSION_NONE) {
  session_start();
}
include('../config/config.php');
$myid = $_SESSION['id'];
$privilege = $_SESSION['privilege'];
if ($privilege != 2) {
  header("location: ../index.php");
}
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
?>

<section>
  <div class="container mt-5">
    <div class="row">
      <div class="col-sm-12" id="greenAlert">
        <?php
        $date = new DateTime("now", new DateTimeZone('Europe/Belgrade') );
        $today=$date->format('Y-m-d');
        $nowtime=$date->format('H:i:s');
        $timeb4 = date('H:i:s', strtotime($nowtime . ' + 30 minutes'));
        
        $query23 = mysqli_query($con, "SELECT id,Shdesc, FullDesc, Date,StartTime,EndTime,NumOfDays,Importance from appointments where date='$today' and startTime<'$timeb4' and startTime>'$nowtime' and  userId IN (SELECT id from users WHERE companyId='$companyId' ) and status!='2' ORDER BY (CASE WHEN StartTime IS NOT NULL THEN 1 ELSE 2 END),
        StartTime ASC");
        if (!$query23) {
          die("E pamundur te azhurohen te dhenat: " . mysqli_connect_error());
        } else {
          while ($data23 = mysqli_fetch_array($query23)) {
        ?>
            <div class="alert fade alert-simple alert-success alert-dismissible text-left font__family-montserrat font__size-16 font__weight-light brk-library-rendered rendered show">
              <button type="button" class="close font__size-18" data-dismiss="alert">
                <span aria-hidden="true"><a href="https://www.google.com/url?sa=t&rct=j&q=&esrc=s&source=web&cd=&cad=rja&uact=8&ved=2ahUKEwjVtMfrsbLwAhXryzgGHdXMB7I4ChAWMAh6BAgIEAM&url=https%3A%2F%2Fwww.ftcab.com%2F&usg=AOvVaw3v44T5yZdpdgVq0agYf0eg" target="_blank">
                    <i class="fa fa-times greencross"></i>
                  </a></span>
                <span class="sr-only">Close</span>
              </button>
              <div onclick="window.open('dashboard.php?cat=appointments-setting&subcat=view-appointment&view=<?php echo $data23['id']; ?>','_self');" style="cursor: pointer;">

              <i class="start-icon far fa-check-circle faa-tada animated"></i>
              <strong class="font__weight-semibold">Termin ne ora: <?php echo $data23['StartTime'] ?>!</strong> Kliko per te pare detajet e terminit.
             </div>
            </div>
            
        <?php
          }
        }
        ?>

      </div>
      <?php
      /*
      <div class="col-sm-12">
        <div class="alert fade alert-simple alert-info alert-dismissible text-left font__family-montserrat font__size-16 font__weight-light brk-library-rendered rendered show" role="alert" data-brk-library="component__alert">
          <button type="button" class="close font__size-18" data-dismiss="alert">
									<span aria-hidden="true">
										<i class="fa fa-times blue-cross"></i>
									</span>
									<span class="sr-only">Close</span>
								</button>
          <i class="start-icon  fa fa-info-circle faa-shake animated"></i>
          <strong class="font__weight-semibold">Heads up!</strong> This alert needs your attention, but it's not super important.
        </div>

      </div>

      <div class="col-sm-12">
        <div class="alert fade alert-simple alert-warning alert-dismissible text-left font__family-montserrat font__size-16 font__weight-light brk-library-rendered rendered show" role="alert" data-brk-library="component__alert">
          <button type="button" class="close font__size-18" data-dismiss="alert">
									<span aria-hidden="true">
										<i class="fa fa-times warning"></i>
									</span>
									<span class="sr-only">Close</span>
								</button>
          <i class="start-icon fa fa-exclamation-triangle faa-flash animated"></i>
          <strong class="font__weight-semibold">Warning!</strong> Better check yourself, you're not looking too good.
        </div>
      </div>

      <div class="col-sm-12">
        <div class="alert fade alert-simple alert-danger alert-dismissible text-left font__family-montserrat font__size-16 font__weight-light brk-library-rendered rendered show" role="alert" data-brk-library="component__alert">
          <button type="button" class="close font__size-18" data-dismiss="alert">
									<span aria-hidden="true">
										<i class="fa fa-times danger "></i>
									</span>
									<span class="sr-only">Close</span>
								</button>
          <i class="start-icon far fa-times-circle faa-pulse animated"></i>
          <strong class="font__weight-semibold">Oh snap!</strong> Change a few things up and try submitting again.
        </div>
      </div>

      <div class="col-sm-12">
        <div class="alert fade alert-simple alert-primary alert-dismissible text-left font__family-montserrat font__size-16 font__weight-light brk-library-rendered rendered show" role="alert" data-brk-library="component__alert">
          <button type="button" class="close font__size-18" data-dismiss="alert">
									<span  aria-hidden="true"><i class="fa fa-times alertprimary"></i></span>
									<span class="sr-only">Close</span>
								</button>
          <i class="start-icon fa fa-thumbs-up faa-bounce animated"></i>
          <strong class="font__weight-semibold">Well done!</strong> You successfullyread this important.
        </div>

      </div>
      
      
      */
      ?>


    </div>
  </div>
</section>
<script>


setInterval(function() {

      $.ajax({
          method: "POST",
          url: "newalert-popup.php"
        })
        .done(function(response) {
          //example usage
          var newElement = document.createElement("div");
          newElement.classList.add("col-sm-12");
          newElement.innerHTML = response;
          var myCurrentElement = document.getElementById("greenAlert");
          insertAfter(newElement, myCurrentElement);
        });
      return false;
    }, 60000);

  function insertAfter(newElement, referenceElement) {
    referenceElement.parentNode.insertBefore(newElement, referenceElement.nextSibling);
  }
</script>

