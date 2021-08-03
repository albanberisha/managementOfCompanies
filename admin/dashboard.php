<?php
session_start();
$username2 = $_SESSION['username'];
include('../config/config.php');
include_once('scripts/logincheck.php');
if (empty($username2)) {
  header("location: ../index.php");
}

// 

$cat = !empty($_GET['cat']) ? $_GET['cat'] : '';
$subcat = !empty($_GET['subcat']) ? $_GET['subcat'] : '';
if ($cat == 'website-setting' && $subcat == 'add-website-menu') {

  include('scripts/multilevel-script.php');
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

?>

<!DOCTYPE html>
<html lang="en">

<head>
  <title>Bit Company</title>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <!--custom style-->
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css">
  <link rel="stylesheet" href="assets/css/style.css">

  <link href="assets/css/main.css" rel="stylesheet" type="text/css">
  <link href="assets/css/style.css" rel="stylesheet" type="text/css">
  <link href="assets/css/calendar.css" rel="stylesheet" type="text/css">
  <script type="text/javascript" src="https://www.gstatic.com/charts/loader.js"></script>
  <script type="text/javascript" src="https://www.gstatic.com/charts/loader.js"></script>
  <?php  
$query="SELECT companies.name, count(users.username) as countadmin, table2.countusers2 as countusers from companies,users, (SELECT users.companyId,count(users.username) as countusers2 from companies,users where users.companyId=companies.id and users.status!=2 and users.privilege=3 GROUP by users.companyId) as table2 where table2.companyId=users.companyId and users.companyId=companies.id and users.status!=2 and users.privilege=2 GROUP by users.companyId";
 $result = mysqli_query($con, $query);  
    ?>  
    <script type="text/javascript">
      google.charts.load('current', {'packages':['bar']});
      google.charts.setOnLoadCallback(drawStuff);

      function drawStuff() {

        var data2 = google.visualization.arrayToDataTable([  
          ['Numri i perdoruesve', 'Admintratoret','Perdoruesit'],
                   <?php  
                   $count=0;
                   while($row = mysqli_fetch_array($result))  
                   {  
                       $count++;
                        ?>
                        <?php echo "['".$row['name']."',".$row['countadmin'].",".$row['countusers']."]," ?>
                        <?php
                   }  
                   ?>  
              ]); 

        //var data = new google.visualization.arrayToDataTable(data2);

        var options = {
          width: 800,
          chart: {
            title: 'Lista e perdoruesve'
          },
          bars: 'vertical', // Required for Material Bar Charts.
          series: {
            0: { axis: 'distance' }, // Bind series 0 to an axis named 'distance'.
            1: { axis: 'distance' }//, // Bind series 0 to an axis named 'distance'.
          },
          axes: {
            x: {
              distance: {label: 'parsecs'}, // Bottom x-axis.
              distance: {side: 'top', label: 'apparent magnitude'} // Top x-axis.
            }
          }
        };

      var chart = new google.charts.Bar(document.getElementById('dual_x_div'));
      chart.draw(data2, options);
    };
    </script>
     <?php  
$query="SELECT companies.name, count(users.username) as countadmin, table2.countusers2 as countusers from companies,users, (SELECT users.companyId,count(users.username) as countusers2 from companies,users where users.companyId=companies.id and users.status!=2 and users.privilege=3 GROUP by users.companyId) as table2 where table2.companyId=users.companyId and users.companyId=companies.id and users.status!=2 and users.privilege=2 GROUP by users.companyId";
 $result = mysqli_query($con, $query);  
    ?>  
    <script type="text/javascript">
      google.charts.load('current', {'packages':['bar']});
      google.charts.setOnLoadCallback(drawStuff);

      function drawStuff() {

        var data2 = google.visualization.arrayToDataTable([  
          ['Numri i perdoruesve', 'Admintratoret','Perdoruesit'],
                   <?php  
                   $count=0;
                   while($row = mysqli_fetch_array($result))  
                   {  
                       $count++;
                        ?>
                        <?php echo "['".$row['name']."',".$row['countadmin'].",".$row['countusers']."]," ?>
                        <?php
                   }  
                   ?>  
              ]); 

        //var data = new google.visualization.arrayToDataTable(data2);

        var options = {
          width: 800,
          chart: {
            title: 'Lista e perdoruesve'
          },
          bars: 'vertical', // Required for Material Bar Charts.
          series: {
            0: { axis: 'distance' }, // Bind series 0 to an axis named 'distance'.
            1: { axis: 'distance' }//, // Bind series 0 to an axis named 'distance'.
          },
          axes: {
            x: {
              distance: {label: 'parsecs'}, // Bottom x-axis.
              distance: {side: 'top', label: 'apparent magnitude'} // Top x-axis.
            }
          }
        };

      var chart = new google.charts.Bar(document.getElementById('dual_x_div'));
      chart.draw(data2, options);
    };
    </script>
</head>

<body>
  <?php
  include('partials/header.php');
  ?>
    <div class="boxbox3" id="Boxbox3">
<div id="confirmBox">
<p>A jeni i sigurte qe deshironi ta fshini?</p>
  <button value="1" >Po</button><button value="0">Jo</button>
 </div>
 <div id="confirmBox2">
<p>Duke e fshire nje administrator, ju do te fshini te gjithe perdoruesit e atij administratori. A deshironi ta fshini?</p>
  <button value="1" >Po</button><button value="0">Jo</button>
 </div>
    </div>
<div id="alertBox">mhvmbvbm</div>
<div class="container-fluid">
  <div class="row">
      <div class="col-sm-2" id="Sb3">
 <?php include('partials/sidebar.php'); ?>
      </div>
      <div class="col-sm-10" id="MainPage">
        <div id="dynamic-page">
          <!--dynamic page content-->
          <?php
    
  
        
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
        
      include($cat."/".implode('-',$val).".php");   
 }else{
  include($cat."/".$subcat.".php");
 }
 
        }else{
        

         ?> 
         <br>
         <br>
        
                  <div class="col-12 mt-35" style="width: 98%;">
                    <div class="row h-100 mx-n425">

                      <div class="col-12 col-md-4 px-0 mb-2 mb-md-0">
                        <div class="ccard h-100 pt-2 pb-25 px-25 d-flex mx-2 overflow-hidden">
                          <!-- the colored circles on bottom right -->
                          <div class="position-br	mb-n5 mr-n5 radius-round bgc-purple-l3 opacity-3" style="width: 5.25rem; height: 5.25rem;"></div>
                          <div class="position-br	mb-n5 mr-n5 radius-round bgc-purple-l2 opacity-5" style="width: 4.75rem; height: 4.75rem;"></div>
                          <div class="position-br	mb-n5 mr-n5 radius-round bgc-purple-l1 opacity-5" style="width: 4.25rem; height: 4.25rem;"></div>


                          <div class="flex-grow-1 pl-25 pos-rel d-flex flex-column">
                            <div class="text-secondary-d4">
                              <span class="text-200">
                              <?php
                              $date = new DateTime("now", new DateTimeZone('Europe/Belgrade') );
                              $today=$date->format('Y-m-d');
                              $thism= date('Y-m-d', strtotime($today. ' - 7 days'));
                              $query4 = "SELECT count(id) as c from appointments where CAST(dateTime AS DATE)>'$thism'";
                              $result4 = mysqli_query($con, $query4);
                              $row4 = mysqli_fetch_array($result4);
                                $numrows = $row4['c'];
                                echo $numrows;
                              ?>
                				</span>
                        <?php
                              $date = new DateTime("now", new DateTimeZone('Europe/Belgrade') );
                              $today=$date->format('Y-m-d');
                              $thismonth= date('Y-m-d', strtotime($today. ' - 7 days'));
                              $prevmonth= date('Y-m-d', strtotime($today. ' - 14 days'));
                              $query2 = "SELECT count(*) as c from appointments where CAST(dateTime AS DATE)<'$thismonth' and CAST(dateTime AS DATE)>'$prevmonth'";
                              $result2 = mysqli_query($con, $query2);
                              $row2 = mysqli_fetch_array($result2);
                              $numrows2 = $row2['c'];
                              if($numrows2!=0)
                              {
                                $diff=$numrows-$numrows2;

                                $perc=round(($diff/$numrows2)*100, 1,PHP_ROUND_HALF_DOWN);
                              }else{
                                $perc=NULL;
                              }
                              
                              ?>
                              <?php
                              if($perc>=0 && $perc!=NULL)
                              {
                                ?>
                                <span class="text-md text-success-m1 align-text-bottom text-nowrap">
                						(+<?php echo $perc ?>% <i class="ml-2px fa fa-caret-up" aria-hidden="true"></i>)
                					</span>
                                <?php
                              }elseif($perc<0 && $perc!=NULL){
                                ?>
                                <span class="text-md text-danger-m1 align-text-bottom text-nowrap">
                						(<?php echo $perc ?>% <i class="ml-2px fa fa-caret-down"></i>)
                					</span>
                                <?php
                              }else{
                                ?>
                                <span class="text-md text-success-m1 align-text-bottom text-nowrap">
                						(<?php echo $perc ?>% <i class="ml-2px fa fa-caret-up"></i>)
                					</span>
                                <?php
                                }
                              ?>
                            </div>
                            <div class="text-secondary-d4">
                            Termine javen e kaluar: <?php echo  $numrows2?>
                            </div>
                            <div class="mt-auto text-nowrap text-secondary-d2 text-105 letter-spacing mt-n1">
                              Termine
                            </div>
                          </div>


                          <div class="ml-auto pr-1 align-self-center pos-rel text-125">
                            <i class="fa fa-calendar-check text-purple opacity-1 fa-2x mr-25"></i>
                          </div>
                        </div><!-- /.ccard -->
                      </div><!-- /.col -->



                      <div class="col-12 col-md-4 px-0 mb-2 mb-md-0">
                        <div class="ccard h-100 pt-2 pb-25 px-25 d-flex mx-2 overflow-hidden">
                          <!-- the colored circles on bottom right -->
                          <div class="position-br	mb-n5 mr-n5 radius-round bgc-blue-l3 opacity-3" style="width: 5.25rem; height: 5.25rem;"></div>
                          <div class="position-br	mb-n5 mr-n5 radius-round bgc-blue-l2 opacity-5" style="width: 4.75rem; height: 4.75rem;"></div>
                          <div class="position-br	mb-n5 mr-n5 radius-round bgc-blue-l1 opacity-5" style="width: 4.25rem; height: 4.25rem;"></div>


                          <div class="flex-grow-1 pl-25 pos-rel d-flex flex-column">
                            <div class="text-secondary-d4">
                              <span class="text-200">
                              <?php
                              $date = new DateTime("now", new DateTimeZone('Europe/Belgrade') );
                              $today=$date->format('Y-m-d');
                              $thism= date('Y-m-d', strtotime($today. ' - 7 days'));
                              $query44 = "SELECT count(id) as c from users where CAST(registered AS DATE)>'$thism'";
                              $result44 = mysqli_query($con, $query44);
                              $row44 = mysqli_fetch_array($result44);
                                $numrows4 = $row44['c'];
                                echo $numrows4;
                              ?>
                				</span>
                        <?php
                              $date = new DateTime("now", new DateTimeZone('Europe/Belgrade') );
                              $today=$date->format('Y-m-d');
                              $thismonth= date('Y-m-d', strtotime($today. ' - 7 days'));
                              $prevmonth= date('Y-m-d', strtotime($today. ' - 14 days'));
                              $query22 = "SELECT count(id) as c from users where CAST(registered AS DATE)<'$thismonth' and CAST(registered AS DATE)>'$prevmonth'";
                              $result22 = mysqli_query($con, $query22);
                              $row22 = mysqli_fetch_array($result22);
                              $numrows22 = $row22['c'];
                              if(mysqli_num_rows($result22)>0  )
                              {
                                $diff2=$numrows4-$numrows22;

                                $perc2=round(($diff2/$numrows22)*100, 1,PHP_ROUND_HALF_DOWN);
                              }else{
                                $perc2=NULL;
                              }
                              
                              ?>
                              <?php
                              if($perc2>=0 && $perc2!=NULL)
                              {
                                ?>
                                <span class="text-md text-success-m1 align-text-bottom text-nowrap">
                						(+<?php echo $perc2 ?>% <i class="ml-2px fa fa-caret-up" aria-hidden="true"></i>)
                					</span>
                                <?php
                              }elseif($perc2<0 && $perc2!=NULL){
                                ?>
                                <span class="text-md text-danger-m1 align-text-bottom text-nowrap">
                						(<?php echo $perc2 ?>% <i class="ml-2px fa fa-caret-down"></i>)
                					</span>
                                <?php
                              }else{
                                ?>
                                <span class="text-md text-success-m1 align-text-bottom text-nowrap">
                						(<?php echo $perc2 ?>% <i class="ml-2px fa fa-caret-up"></i>)
                					</span>
                                <?php
                                }
                              ?>


                            </div>
                            <div class="text-secondary-d4">
                            Perdorues te rinje javen e kaluar: <?php echo  $numrows22?>
                            </div>
                            <div class="mt-auto text-nowrap text-secondary-d2 text-105 letter-spacing mt-n1">
                              Perdorues te rinje
                            </div>
                          </div>


                          <div class="ml-auto pr-1 align-self-center pos-rel text-125">
                            <i class="fas fa-users text-blue opacity-1 fa-2x mr-25"></i>
                          </div>
                        </div><!-- /.ccard -->
                      </div><!-- /.col -->



                      <div class="col-12 col-md-4 px-0 mb-2 mb-md-0">
                        <div class="ccard h-100 pt-2 pb-25 px-25 d-flex mx-2 overflow-hidden">
                          <!-- the colored circles on bottom right -->
                          <div class="position-br	mb-n5 mr-n5 radius-round bgc-orange-l3 opacity-3" style="width: 5.25rem; height: 5.25rem;"></div>
                          <div class="position-br	mb-n5 mr-n5 radius-round bgc-orange-l2 opacity-5" style="width: 4.75rem; height: 4.75rem;"></div>
                          <div class="position-br	mb-n5 mr-n5 radius-round bgc-orange-l1 opacity-5" style="width: 4.25rem; height: 4.25rem;"></div>


                          <div class="flex-grow-1 pl-25 pos-rel d-flex flex-column">
                            <div class="text-secondary-d4">
                              <span class="text-200">
                              <?php
                              $query5 = "SELECT count(id) as c from companies";
                              $result5 = mysqli_query($con, $query5);
                              $row5 = mysqli_fetch_array($result5);
                              $numberofc=$row5['c'];
                              echo $numberofc;
                              ?>
                				</span>



                            </div>

                            <div class="mt-auto text-nowrap text-secondary-d2 text-105 letter-spacing mt-n1">
                              Klientet tanë
                            </div>
                          </div>


                          <div class="ml-auto pr-1 align-self-center pos-rel text-125">
                            <i class="fas fa-building text-orange opacity-1 fa-2x mr-25"></i>
                          </div>
                        </div><!-- /.ccard -->
                      </div><!-- /.col -->


                    </div>
                  </div>
         <div class="content-box">
<div class="row" style="width:100%;">
<div id="dual_x_div" style="width:100%; height:250px; margin: auto;"></div>

</div>
         </div>
         <?php
         }
         ?>
             

          <!-- dynamic page content-->
        </div>
        
      </div>
  </div>

  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
  <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js"></script>
  <script src='https://kit.fontawesome.com/a076d05399.js'></script>
  <script type="text/javascript" src="scripts/ajax-script.js"></script>
  <script type="text/javascript" src="scripts/forms.js"></script>

  <script type="text/javascript">
    var acontent = document.querySelectorAll('.accordion-content');
    var atitle = document.querySelectorAll('.accordion-content .title');
    for (i = 0; i < atitle.length; i++) {

      atitle[i].onclick = function() {

        var contentClass = this.parentNode.className;

        for (i = 0; i < acontent.length; i++) {
          acontent[i].className = 'accordion-content hide';
        }

        if (contentClass == 'accordion-content hide') {
          this.parentNode.className = 'accordion-content show';
        }
      }
    }
  </script>

  <script>
    // Add the following code if you want the name of the file appear on select
    $(document).on("change", ".custom-file-input", function() {
      var fileName = $(this).val().split("\\").pop();
      $(this).siblings(".custom-file-label").addClass("selected").html(fileName);
    });
  </script>
  <script type="text/javascript" src='https://cdn.tiny.cloud/1/no-api-key/tinymce/5/tinymce.min.js' referrerpolicy="origin">
  </script>
  <script type="text/javascript">
    $(document).ready(function() {
      $('body').find('.tox-notifications-container').hide();
    })
  </script>

</body>

</html>
<script>
  $("#SearchForm").submit(function(e) {
    e.preventDefault();
    $('#NameError').html("");
    var myform = document.getElementById("SearchForm");
    var fd = new FormData(myform);
    e.preventDefault();
    name = $('#Name').val();
    table = 'clients';
    companyid = <?php echo $companyId ?>;
    $.ajax({
        method: "POST",
        url: "scripts/search.inc.php",
        data: {
          name: name,
          table: table,
          companyid: companyid
        }
      })
      .done(function(response) {
        $message = "";
        switch (response) {
          case "1":
            $message = "Emri duhet te permbaje vetem shkronja dhe nuk mund te jete i zbrazet!";
            $('#NameError').html($message);
            document.getElementById('Name').scrollIntoView({
              behavior: 'auto',
              block: 'center',
              inline: 'center'
            });
            break;
          default:
            window.scrollTo(0, 0);
            $('#SearchForm')[0].reset();
            $('#ClientList').html(response);
        }
      });
    return false;
  });
  $('.popupCloseButton2').click(function() {
    window.scrollTo(0, 0);
    $('.hover_bkgr_fricc2').hide();
  });

  function backDay(day, month, year) {
    myid = <?php echo $myid ?>;
    dita = day;
    muaji = month;
    viti = year;
    if ((day.length) == 1) {
      dita = "0" + day;
    }

    $.ajax({
        method: "POST",
        url: "prevMonth.php",
        data: {
          myid: myid,
          dita: day,
          muaji: month,
          viti: year,
        }
      })
      .done(function(response) {
        $("#CalendarTT").html(response);
      });
    return false;

  }

  function forwardDay(day, month, year) {
    myid = <?php echo $myid ?>;
    dita = day;
    muaji = month;
    viti = year;
    if ((day.length) == 1) {
      dita = "0" + day;
    }

    $.ajax({
        method: "POST",
        url: "forwMonth.php",
        data: {
          myid: myid,
          dita: day,
          muaji: month,
          viti: year,
        }
      })
      .done(function(response) {
        $("#CalendarTT").html(response);
      });
    return false;

  }
</script>
<script>
    $(document).ready(function() {
        setInterval(function() {

            $('#AlertPopup').load('alert-popup.php');
        }, 10*60000);
    });
</script>
