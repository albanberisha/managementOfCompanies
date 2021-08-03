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
<?php

$date = new DateTime("now", new DateTimeZone('Europe/Belgrade') );
$today=$date->format('Y-m-d');
$nowtime=$date->format('H:i:s');

$timeb3 = date('H:i:s', strtotime($nowtime . ' + 29 minutes'));
$timeb4 = date('H:i:s', strtotime($nowtime . ' + 30 minutes'));
$query23 = mysqli_query($con, "SELECT id,Shdesc, FullDesc, Date,StartTime,EndTime,NumOfDays,Importance from appointments where date='$today' and startTime<'$timeb4' and startTime>='$timeb3' and  userId IN (SELECT id from users WHERE companyId='$companyId' ) and status!='2' ORDER BY (CASE WHEN StartTime IS NOT NULL THEN 1 ELSE 2 END),
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