<?php
$query = "SELECT * FROM color_setting ORDER BY id DESC LIMIT 0, 1";
$result = $con->query($query);
echo $con->error;

$data = $result->fetch_assoc();
$id = !empty($data['id']) ? $data['id'] : '';
$navbarBackground = !empty($data['navbar_background']) ? $data['navbar_background'] : '';
$sidebarBackground = !empty($data['sidebar_background']) ? $data['sidebar_background'] : '';
$textColor = !empty($data['text_color']) ? $data['text_color'] : '';
$saveButtonColor = !empty($data['save_button_color']) ? $data['save_button_color'] : '';
$editButtonColor = !empty($data['edit_button_color']) ? $data['edit_button_color'] : '';
$deleteButtonColor = !empty($data['delete_button_color']) ? $data['delete_button_color'] : '';

$viewButtonColor = !empty($data['view_button_color']) ? $data['view_button_color'] : '';
$labelTextColor = !empty($data['label_text_color']) ? $data['label_text_color'] : '';

user_logedId($con);
?>

<style type="text/css">
  .sidebar {
    background-color: <?php echo $sidebarBackground; ?> !important;
  }

  a.nav-link,
  h3.title,
  h4.text-light {
    color: <?php echo $textColor; ?> !important;
  }
  .btn-view{
    color: <?php echo $viewButtonColor; ?> !important;
    border: 0px;
  }
  .btn-secondary {
    background-color: <?php echo $saveButtonColor; ?> !important;
    border: 0px;
  }
  .btn-back {
    background-color: <?php echo $sidebarBackground; ?> !important;
    border: 0px;
  }
  a.text-success {
    color: <?php echo $editButtonColor; ?> !important;
  }

  a.delete {
    color: <?php echo $deleteButtonColor; ?> !important;

  }
  a.cancel {
    color: <?php echo $deleteButtonColor; ?> !important;

  }

  label {
    color: <?php echo $labelTextColor; ?> !important;

  }
</style>
<?php
$query = "SELECT * FROM companydetails WHERE id='1'";
$result = mysqli_query($con, $query);
$row = mysqli_fetch_array($result);
?>

<div class="container-fluid bg-secondary menu sticky-top" style="background-color: <?php echo $navbarBackground; ?>!important">
  <div class="row r34">
    <div class="col-sm-6">
      <ul class="nav">
        <li class="nav-item">

          <?php
          if ($row['logo'] == Null) {
          ?>
          <?php
          } else {
            ?>
                <a class="nav-link content-link" href="dashboard.php?"> <img src="../images/<?php echo $row['logo'] ?>" class="brand_logo2" alt="Logo"></a>
          <?php
          }
          ?>
        </li>
        <li class="nav-item name-comp">
          <?php
          if ($row['name'] != null) {
            echo '<a class="nav-link content-link companyName comp-LongName" href="dashboard.php">' . $row['name'] . '</a>';
          }
          ?>

        </li>
        <li class="nav-item">
          <?php
          if ($row['initials'] != null) {
            //echo '<a class="nav-link companyName comp-ShortName" href="dashboard.php">' . $row['initials'] . '</a>';
          }
          ?>
        </li>
      </ul>
    </div>
    <div class="col-sm-6 c34">
      <ul class="nav justify-content-end">
        <li class="nav-item">
          <a href="#" class="nav-link content-link" title="setting"><?php echo $username2; ?></a>
        </li>
        <li class="nav-item">
          <a class="nav-link " href="../logout.php" title="logout"><i class='fas fa-sign-out-alt'></i>
          </a>
        </li>
        <li class=" nav-item">
          <button class="navbar-toggler-right d-lg-none align-self-center" type="button" id="SidebarButton" data-toggle="offcanvas">
            <a class="nav-link " href="#" title="logout"> <i class="fa fa-bars"></i></a>
          </button>
        </li>
      </ul>
    </div>
  </div>

</div>

<script>
  document.getElementById("SidebarButton").addEventListener("click", function() {
    var x = document.getElementById("Sb3");
  if (x.style.display === "none") {
    var element = document.getElementById("Sidebar");
  element.classList.remove("sidebar-left");
  var element = document.getElementById("MainPage");
  element.classList.remove("containerFullW");
  element.classList.add("col-sm-10");
    $('.hide34').show();
    $('.arrowRight').hide();
    $('.arrowLeft').show();
    x.style.display = "block";
    x.classList.remove("hidedd");
    x.classList.add("showdd");
  } else {
    x.style.display = "none";
    x.classList.add("hidedd");
    x.classList.remove("showdd");
  }
});


  function showSidebar()
  {
    var element = document.getElementById("Sidebar");
  element.classList.add("sidebar-left");
  var element = document.getElementById("MainPage");
  element.classList.remove("col-sm-10");
  element.classList.add("containerFullW");
    $('.hide34').hide();
    $('.arrowLeft').hide();
    $('.arrowRight').show();
  }
  function hideSidebar()
  {
    var element = document.getElementById("Sidebar");
  element.classList.remove("sidebar-left");
  var element = document.getElementById("MainPage");
  element.classList.remove("containerFullW");
  element.classList.add("col-sm-10");
    $('.hide34').show();
    $('.arrowRight').hide();
    $('.arrowLeft').show();
  }
  </script>