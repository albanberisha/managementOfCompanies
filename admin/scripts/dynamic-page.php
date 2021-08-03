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
<div class="row">
<div id="dual_x_div" style="width:fit-content; height:250px; margin: auto;"></div>

</div>
         </div>




          
          
          
          <?php
                  }



        ?>