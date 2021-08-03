<?php
if (session_status() === PHP_SESSION_NONE) {
    session_start();
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
$appointmentid = "1";
if (isset($_GET['view'])) {
    $appointmentid = $_GET['view'];
    $query = "SELECT * from appointments where id='$appointmentid' and userId IN (SELECT id from users where companyId='$companyId')";
    $result = mysqli_query($con, $query);
    $row = mysqli_fetch_array($result);
    if ($row > 0) {
        $query = "SELECT users.id as userid,users.name as username,users.surname as usersurname,users.email as useremail,
         users.username as usersusername,clients.id as clientid,clients.name as clientname, clients.surname as clientsurname,
         clients.email as clientemail, clients.phone1 as tel1, clients.phone2 as tel2, clients.address, clients.reference,clients.bussinesName,
          clients.comment,appointments.id as appointmentid,appointments.shdesc,appointments.fullDesc,appointments.date as appdate,appointments.startTime,
          appointments.endTime,appointments.importance,appointments.dateTime, appointments.status from appointments,clients,users
           where appointments.id='$appointmentid' and appointments.userId=users.id and appointments.clientId=clients.id";
        $res = $con->query($query);
        $viewData = $res->fetch_assoc();
        if (empty($viewData)) {
            echo "Asnje e dhene per tu shfaqur!";
            exit;
        }
        $appointmentid = $viewData['appointmentid'];
        $appointshdesc = $viewData['shdesc'];
        $appointfullDesc = $viewData['fullDesc'];
        $appointappdate = $viewData['appdate'];
        $appointstartTime = $viewData['startTime'];
        $appointendTime = $viewData['endTime'];

        $appointdateTime = $viewData['dateTime'];
        $appointstatus = $viewData['status'];
        $color = $viewData['importance'];
        if (empty($color)) {
            $color = 'deffault';
        }


        $userid = $viewData['userid'];
        $username = $viewData['username'];
        $usersurname = $viewData['usersurname'];
        $useremail = $viewData['useremail'];
        $usersusername = $viewData['usersusername'];


        $clientid = $viewData['clientid'];
        $clientname = $viewData['clientname'];
        $clientsurname = $viewData['clientsurname'];
        $clientemail = $viewData['clientemail'];
        $clienttel1 = $viewData['tel1'];
        $clienttel2 = $viewData['tel2'];
        $clientaddress = $viewData['address'];
        $clientreference = $viewData['reference'];
        $clientbussinesName = $viewData['bussinesName'];
        $clientcomment = $viewData['comment'];



?>

        <br><br>
        <div class="content-box">
            <div id="dynamic-page">
                <div class="row">
                    <div class="col">
                        <div class="row">
                            <div class="col text-right">
                                <a href="dashboard.php?cat=appointments-setting&subcat=myAppointmentsList" class="btn btn-secondary btn-back content-link"><i class="fas fa-arrow-left"></i> Prapa</a>
                            </div>
                        </div>
                        <div class="row">
                            <div class="col" style="text-align: center;">
                                <h5>Të dhënat personale</h5>
                            </div>
                        </div>
                        <br>
                        <div class="table-responsive">
                            <table class="table">
                                <tr>
                                    <th>Emri</th>
                                    <th>Mbiemri</th>
                                    <th>Emaili</th>
                                    <th>Tel(1)</th>
                                    <th>Tel(2)</th>
                                    <th>Adresa</th>
                                    <th>Referenca</th>
                                    <th>Emri i biznesit</th>
                                    <th>Komenti</th>
                                </tr>
                                <tr>
                                    <td><?php echo $clientname; ?></td>
                                    <td><?php echo $clientsurname ?></td>
                                    <td><?php echo $clientemail; ?></td>
                                    <td><?php echo $clienttel1; ?></td>
                                    <td><?php echo $clienttel2; ?></td>
                                    <td class="wbreak"><?php echo $clientaddress; ?></td>
                                    <td class="wbreak"><?php echo $clientreference; ?></td>
                                    <td class="wbreak"><?php echo $clientbussinesName; ?></td>
                                    <td class="wbreak"><?php echo $clientcomment;  ?></td>
                                </tr>
                            </table>
                        </div>

                        <div class="row">
                            <div class="col" style="text-align: center;">
                                <h5>Detajet e terminit
                                <?php

                                    if($appointstatus==1)
                                    {
                                        ?>
                                        <span class="approved" title="Aprovuar"><i class="fas fa-check"></i></span>
                                        <?php
                                    }else{
                                        ?>
                                         <span class="canceled" title="Anuluar"><i class="fas fa-ban"></i></span>
                                        <?php
                                    }

                                    ?></h5>
                            </div>
                        </div>
                        <br>
                        <div class="content-box">
                        <div class="" id="AddNewEvent">
                            <div class="headerPopup btn-back">
                                <span class="textHeader" style="text-transform: none;">Shtuar nga: <?php echo $username . " " . $usersurname . " " . $appointdateTime ?></span>
                            </div>
                            <div class="formPopup">
                                <div class="">
                                    <div class="">
                                        <div class="validate-form">
                                            <p class="headingT6" style="text-align: center;">
                                                Përshkrimi:
                                            </p>
                                            <div class="wrap-input100 validate-input bg1 bt3 <?php echo $color ?>" data-validate="Please Type Your Name">
                                                <div>

                                                    <p class="headingT5">
                                                        <?php echo $appointshdesc ?>
                                                    </p>

                                                </div>
                                            </div>
                                            <div class="headingTime"  style="font-size: 16px; text-align: center;">
                                                <div>
                                                    <h6 class="">
                                                        Data dhe ora:
                                                    </h6>
                                                </div>
                                            </div>
                                            <div class="headingTime" style="font-size: 16px; text-align: center;">
                                                <div>
                                                    <h6 class="">
                                                        <?php echo $appointappdate ?>
                                                    </h6>
                                                </div>
                                                <div>
                                                    <h6>
                                                        <?php

                                                        echo " nga " . $appointstartTime . " deri ne " . $appointendTime;
                                                        ?>
                                                    </h6>
                                                </div>
                                            </div>
                                            <p class="headingT6" style="text-align: center;">
                                                Komenti:
                                            </p>
                                            <div class="wrap-input100 validate-input bg1 bt3" data-validate="Please Type Your Name">
                                                <div>

                                                    <p class="headingT6" style="text-align: center;">
                                                        <?php echo $appointfullDesc ?>
                                                    </p>
                                                </div>
                                            </div>

                                            <div class="form-group">
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                        </div>
                        <br>
                        <br>
                        <div class="row">
                            <div class="col" style="text-align: center;">
                                <h5>Termimi i shtuar</h5>
                            </div>
                        </div>
                        <br>
                        <div class="table-responsive">
                            <table class="table">
                                <tr>
                                    <th>Emri</th>
                                    <th>Mbiemri</th>
                                    <th>Username</th>
                                    <th>Emaili</th>

                                </tr>
                                <tr>
                                    <td><?php echo $username; ?></td>
                                    <td><?php echo $usersurname ?></td>
                                    <td><?php echo $usersusername; ?></td>
                                    <td><?php echo $useremail; ?></td>
                                </tr>
                            </table>
                        </div>
                    </div>
                </div>
            </div>
        </div>
<?php
    } else {
        echo "Hyrje e pa lejuar!";
    }
} else {
    echo "Hyrje e pa lejuar!";
}
?>