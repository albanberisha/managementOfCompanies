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

include 'calendar.php';

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

<!DOCTYPE html>
<html lang="en">

<head>
  <title>Bit Company</title>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <!--custom style-->
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css">
  <link rel="stylesheet" href="assets/css/style.css">


  <link href="assets/css/style.css" rel="stylesheet" type="text/css">
  <link href="assets/css/calendar.css" rel="stylesheet" type="text/css">
</head>

<body>
  <?php
  include('partials/header.php');
  ?>
  <div id="confirmBox">
    <p>Are You Sure to Delete ?</p>
    <button value="1">Yes</button><button value="0">No</button>
  </div>
  <div id="alertBox">mhvmbvbm</div>
  <div class="container-fluid">
    <div class="row" id="Row1" style="margin-bottom: 50px;">
      <div class="col-sm-2" id="Sb3">
        <?php include('partials/sidebar.php'); ?>
      </div>
      <div class="col-sm-10" id="MainPage">
      
        <div id="dynamic-page">

          <!--dynamic page content-->

          <?php
          if (!empty($cat) && !empty($subcat)) {


            $sub = explode('-', $subcat);
            if ($sub[0] == 'add') {
              $val = [];
              foreach ($sub as $key => $value) {
                if ($value == $sub[0]) {
                  continue;
                }
                $val[] = $value;
              }

              include($cat . "/" . implode('-', $val) . ".php");
            } else {
              include($cat . "/" . $subcat . ".php");
            }
          } else {
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
          <!-- dynamic page content-->
        </div>

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