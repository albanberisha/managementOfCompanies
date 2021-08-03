<?php
include 'Calendar.php';
$myid = $_SESSION['id'];


$date = new DateTime("now", new DateTimeZone('Europe/Belgrade') );
    $today=$date->format('Y-m-d');;
$today = date('Y-m-d', strtotime($today . ' + 1 days'));
$calendar = new Calendar($today);
$query = mysqli_query($con, "SELECT id,Shdesc, FullDesc, Date,StartTime,EndTime,NumOfDays,Importance from appointments where UserId='$myid' and status!='2' ORDER BY (CASE WHEN StartTime IS NOT NULL THEN 1 ELSE 2 END),
StartTime ASC");
if (!$query) {
    die("E pamundur te azhurohen te dhenat: " . mysqli_connect_error());
} else {
    while ($data = mysqli_fetch_array($query)) {
        $strtTime = "";
        $endTime = "";
        if ($data['StartTime'] != NULL) {
            $strtTime = date('H:i', strtotime($data['StartTime']));
        }
        if ($data['EndTime'] != NULL) {
            $endTime = date('H:i', strtotime($data['EndTime']));
        }
        $calendar->add_event($data['id'], $data['Shdesc'], $strtTime . '-' . $endTime, $data['Date'], $data['NumOfDays'], $data['Importance']);
    }
}
?>
<nav class="navtop">
</nav>
<div class="content home">
    <?= $calendar ?>
</div>
<div class="hover_bkgr_fricc1">
    <span class="helper1"></span>
    <div>
        <div class="popupCloseButton1">&times;</div>
        <div id="EventInfo">
        </div>
    </div>
</div>
<div class="hover_bkgr_fricc2">
    <span class="helper2"></span>
    <div>
        <div class="popupCloseButton2">&times;</div>
        <div id="AddNewEvent">
        </div>
    </div>
</div>
<div class="hover_bkgr_fricc3">
    <span class="helper3"></span>
    <div>
        <div class="popupCloseButton3">&times;</div>
        <div id="UpdateEvent">
        </div>
    </div>
</div>
<script src="assets/vendors/js/vendor.bundle.base.js"></script>
    <!-- endinject -->
    <!-- Plugin js for this page -->
    <script src="assets/vendors/jquery-bar-rating/jquery.barrating.min.js"></script>
    <script src="assets/vendors/chart.js/Chart.min.js"></script>
    <script src="assets/vendors/flot/jquery.flot.js"></script>
    <script src="assets/vendors/flot/jquery.flot.resize.js"></script>
    <script src="assets/vendors/flot/jquery.flot.categories.js"></script>
    <script src="assets/vendors/flot/jquery.flot.fillbetween.js"></script>
    <script src="assets/vendors/flot/jquery.flot.stack.js"></script>
    <!-- End plugin js for this page -->
    <!-- inject:js -->
    <script src="assets/js/off-canvas.js"></script>
    <script src="assets/js/hoverable-collapse.js"></script>
    <script src="assets/js/misc.js"></script>
    <script src="assets/js/settings.js"></script>
    <script src="assets/js/todolist.js"></script>
    <!-- endinject -->
    <!-- Custom js for this page -->
    <script src="assets/js/dashboard.js"></script>

    <script type="text/javascript" src="https://www.gstatic.com/charts/loader.js"></script>
