<?php 
      
include('../../config/config.php');
session_start();
       $cat= !empty($_GET['cat'])?$_GET['cat']:'';
       $subcat = !empty($_GET['subcat'])?$_GET['subcat']:'';
          if($cat=='website-setting' && $subcat=='add-website-menu'){
          
          include('../scripts/multilevel-script.php');
          
        }

        if(!empty($cat) && !empty($subcat)){

            
            $sub=explode('-', $subcat);
if($sub[0]=='add')
{
           $val=[];
          foreach ($sub as $key => $value) {
            if($value==$sub[0])
            {
             continue;
            }
            $val[]=$value;
            
         }
        
      include("../".$cat."/".implode('-',$val).".php");   
 }else{
  include("../".$cat."/".$subcat.".php");
 }
 

          
        }else{
          include '../calendar.php';
          $myid = $_SESSION['id'];
          $date = new DateTime("now", new DateTimeZone('Europe/Belgrade') );
    $today=$date->format('Y-m-d');
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
          <h1 class='text-success text-center'></h1>
              <div id="CalendarTT">
             
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
</div>
            <?php
            //echo "<h1 class='text-success text-center'>Welcome To Admin Panel</h1>";
        }
