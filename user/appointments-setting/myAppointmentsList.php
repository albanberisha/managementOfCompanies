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
?>
<br></br>
<div class="content-box">

<br>
<div class="row">
        <div class="col">
            <h4>Tërminet e caktuara nga unë</h4>
        </div>
        <div class="col text-right">
        </div>
    </div>
    <br>
    <div class="row">
        <div class="col">
            <div class="row">
                <form id="SearchFormMyApp" enctype="multipart/form-data">
                    <span id="NameError" style="color: red;"></span>
                    <div class="row">
                        <div class="col searchTpt3">
                            <div class="form-group">
                                <input type="text" id="Name" name="name" class="form-control" placeholder="Kërko spas emrit">
                            </div>
                            <div class="form-group">
                                <button class="btn btn-secondary " type="submit">Kërko</button>
                            </div>
                            <div class="form-group">
                                <a href="dashboard.php?cat=appointments-setting&subcat=myAppointmentsList" class="btn btn-secondary btn-back content-link"><i class="fas fa-sync"></i></a>

                            </div>
                        </div>
                    </div>
                </form>
            </div>
            <div class="table-responsive">
                <table class="table" id="ClientList">
                    <tr>
                        <th>Nr.</th>
                        <th>Emri</th>
                        <th>Mbiemri</th>
                        <th>Përshkrimi</th>
                        <th>Data</th>
                        <th>Ora e fillimit</th>
                        <th>Ora e mbarimit</th>
                        <th>Statusi</th>
                    </tr>
                        <?php
                        $sql1 = "SELECT clients.name,clients.surname,appointments.shdesc,appointments.date,appointments.startTime,appointments.endTime ,appointments.status from clients,appointments where appointments.userId='$myid' and appointments.clientId=clients.id ORDER BY appointments.dateTime DESC";
                        $res1 = $con->query($sql1);
                        if ($res1->num_rows > 0) {
                            $i = 1;
                            while ($data = $res1->fetch_assoc()) {
                        ?>
                                <tr>
                                    <td><?php echo $i; ?></td>
                                    <td><?php echo htmlentities($data['name']) ?></td>
                                    <td><?php echo htmlentities($data['surname']) ?></td>
                                    <td><?php echo htmlentities($data['shdesc']) ?></td>
                                    <td><?php echo htmlentities($data['date']) ?></td>
                                    <td><?php echo htmlentities($data['startTime']) ?></td>
                                    <td><?php echo htmlentities($data['endTime']) ?></td>
                                    <?php
                                    $statusi=$data['status'];
                                    if($statusi==1)
                                    {
                                        ?>
                                        <td class="approved" title="Aprovuar"><i class="fas fa-check"></i></td>
                                        <?php
                                    }else{
                                        ?>
                                         <td class="canceled" title="Anuluar"><i class="fas fa-ban"></i></td>
                                        <?php
                                    }

                                    ?>
                                </tr>
                            <?php
                                $i++;
                            }
                        } else {
                            ?>
                            <tr>
                                <td colspan="6">Asnje termin per tu shfaqur</td>
                            </tr>
                        <?php } ?>
                </table>
            </div>
        </div>
    </div>
</div>
<script type="text/javascript" src="scripts/forms.js"></script>