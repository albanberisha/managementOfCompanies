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
$date = new DateTime("now", new DateTimeZone('Europe/Belgrade') );
$today=$date->format('Y-m-d');
          $calendar = new Calendar($today);
          $query = mysqli_query($con, "SELECT id,Shdesc, FullDesc, Date,StartTime,EndTime,NumOfDays,Importance from appointments where userId IN (SELECT id from users WHERE companyId='$companyId' ) and status!='2' ORDER BY (CASE WHEN StartTime IS NOT NULL THEN 1 ELSE 2 END),
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
              <!-- clock widget start 
              <div class="clock"> <h3><a style="text-decoration:none;" href="https://www.zeitverschiebung.net/en/country/al"></a></h3> <iframe src="https://www.zeitverschiebung.net/clock-widget-iframe-v2?language=en&size=medium&timezone=Europe%2FTirane" width="100%" height="115" frameborder="0" seamless></iframe> </div><!-- clock widget end -->
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
                  }



        ?>