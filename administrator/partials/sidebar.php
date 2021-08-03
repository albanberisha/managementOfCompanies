       <!-- A vertical navbar -->
<nav class="navbar bg-light sidebar dbtnone" id="Sidebar" >
<ul class="accordion-container navbar-nav sidebar-list">
<li class="nav-item">
      <a class="nav-link content-link" href="dashboard.php"><i class='fas fa-home'></i> <span class="hide34">Kryefaqja</span></a>
 </li>
 <li class="nav-item accordion-content hide">
<h3 class="title"><i class='fas fa-users'></i><span class="hide34"> Klientet</span></h3>
<ul class="description navbar-nav">

     <li class="nav-item">
      <a class="nav-link content-link" href="dashboard.php?cat=client-setting&subcat=addclient"><i class="fas fa-user-plus"></i><span class="hide34"> Shto klient</span></a>
    </li>
      <li class="nav-item">
      <a class="nav-link content-link" href="dashboard.php?cat=client-setting&subcat=clientlist"><i class="far fa-list-alt"></i><span class="hide34"> Lista e klienteve</span></a>
    </li>

</ul>
</li>
<!--==== accordion list-3 =====-->
<li class="nav-item accordion-content hide">
<h3 class="title"><i class=" far fa-calendar-check" aria-hidden="true"></i><span class="hide34"> Tërminet</span></h3>
<ul class="description navbar-nav">
      <li class="nav-item">
      <a class="nav-link content-link" href="dashboard.php?cat=appointments-setting&subcat=myAppointmentsList"><i class="fa fa-clipboard-list"></i> <span class="hide34"> Lista e termineve</span></a>
    </li>
      <li class="nav-item">
      <a class="nav-link content-link" href="dashboard.php?cat=appointments-setting&subcat=canceledAppointments"><i class="fas fa-calendar-times"></i> <span class="hide34"> Tërminet e anuluara</span></a>
    </li>

</ul>
</li>
<li class="nav-item accordion-content hide">
<h3 class="title"><i class='fas fa-user-cog'></i><span class="hide34"> Menaxho llogarite</span></h3>
<ul class="description navbar-nav">
  <li class="nav-item">
      <a class="nav-link content-link" href="dashboard.php?cat=website-admin&subcat=admin-profile"><i class="fas fa-users"></i> <span class="hide34">Llogaritë</span></a>
    </li>
    <li class="nav-item">
    <a class="nav-link content-link" href="dashboard.php?cat=website-admin&subcat=change-password"><i class="far fa-user-circle"></i> <span class="hide34"> Llogaria ime</span></a>
    <!--====<a class="nav-link content-link" href="dashboard.php?cat=website-admin&subcat=change-password"><i class='fas fa-user-cog'></i> <span class="hide34"> Ndrysho paswordin</span></a> =====-->
    </li>
</ul>
</li>
<!--==== accordion list-3
<li class="nav-item accordion-content hide">
<h3 class="title"><i class='fas fa-cog'></i> Website Setting</h3>
<ul class="description navbar-nav">

     <li class="nav-item">
      <a class="nav-link content-link" href="dashboard.php?cat=website-setting&subcat=website-menu">Website Menu</a>
    </li>
      <li class="nav-item">
      <a class="nav-link content-link" href="dashboard.php?cat=website-setting&subcat=website-setting">Website-Setting</a>
    </li>
      <li class="nav-item">
      <a class="nav-link content-link" href="dashboard.php?cat=website-setting&subcat=theme-setting">Theme Setting</a>
    </li>

</ul>
</li>
 =====-->
<!--==== accordion list-3
<li class="nav-item accordion-content hide">
<h3 class="title"><i class='fas fa-envelope'></i> Contact Us</h3>
<ul class="description navbar-nav">

     <li class="nav-item">
      <a class="nav-link content-link" href="dashboard.php?cat=contact&subcat=contact-details">Contact Detail</a>
    </li>
      <li class="nav-item">
      <a class="nav-link content-link" href="dashboard.php?cat=contact&subcat=contact-us-message">Contact Message</a>
    </li>
      <li class="nav-item">
      <a class="nav-link content-link" href="dashboard.php?cat=contact&subcat=contact-email">Contact Email</a>
    </li>

</ul>
</li>

<li class="nav-item accordion-content hide">
<h3 class="title"><i class='fas fa-file-alt'></i> Website Content</h3>
<ul class="description navbar-nav">
  <li class="nav-item">
      <a class="nav-link content-link" href="dashboard.php?cat=website-content&subcat=home-content">Home Content</a>
    </li>
    
</ul>
</li>
<li class="nav-item accordion-content hide">
<h3 class="title"><i class='fas fa-user-cog'></i> Website Admin</h3>
<ul class="description navbar-nav">
  <li class="nav-item">
      <a class="nav-link content-link" href="dashboard.php?cat=website-admin&subcat=admin-profile">Admin Profile</a>
    </li>
    <li class="nav-item">
      <a class="nav-link content-link" href="dashboard.php?cat=website-admin&subcat=change-password">Change Password</a>
    </li>
</ul>
</li>
=====-->
<li class="nav-item text-center" style="
    margin-top: 10px;
" id="LeftArrow">
<a href="javascript:void(0)" class="arrowLeft" onclick="showSidebar();"><i class='far fa-arrow-alt-circle-left'></i></a>
</li>
<li class="nav-item text-center" style="
    margin-top: 10px;
" id="RightArrow">
<a href="javascript:void(0)" class="arrowRight" onclick="hideSidebar();"><i class='far fa-arrow-alt-circle-right'></i></a>
</li>
</ul>
</nav>
<script>


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

