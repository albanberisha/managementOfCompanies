<?php
if (session_status() === PHP_SESSION_NONE) {
    session_start();
}
$myid = $_SESSION['id'];
include('../../config/config.php');
ob_clean();
$name = $_POST['name'];
$table = $_POST['table'];
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
if (strcmp($table, "clients") == 0) {
    searchClient($con, $name, $myid, $companyId);
} elseif (strcmp($table, "myApp") == 0) {
    searchMyAppointments($con, $name, $myid,$companyId);
}elseif (strcmp($table, "myAppCanceled") == 0) {
    searchMyCAppointments($con, $name, $myid,$companyId);
}  else {
    echo "1";
}


function searchClient($con, $name, $myid, $companyid)
{
    if (empty($name)) {
        echo $error = "1";
    } else {
?>
        <tr>
            <th>Nr.</th>
            <th>Emri</th>
            <th>Mbiemri</th>
            <th>Emaili</th>
            <th>Tel</th>
            <th>Adresa</th>
            <th>Emri i biznesit</th>
            <th>Shiko</th>
            <th>Cakto termin</th>
        </tr>
        <?php
        $sql1 = "SELECT * FROM clients WHERE companyId='$companyid' and name like '%$name%' ORDER BY name";
        $res1 = $con->query($sql1);
        if ($res1->num_rows > 0) {
            $i = 1;
            while ($data = $res1->fetch_assoc()) {
                $clientid = $data['id'];
                $ciphering = "AES-128-CTR";

                // Use OpenSSl Encryption method
                $iv_length = openssl_cipher_iv_length($ciphering);
                $options = 0;

                // Non-NULL Initialization Vector for encryption
                $encryption_iv = '1234567891011121';

                // Store the encryption key
                $encryption_key = "BitCompany";

                // Use openssl_encrypt() function to encrypt the data
                $encrypted_id = openssl_encrypt(
                    $clientid,
                    "AES-128-CTR",
                    $encryption_key,
                    $options,
                    $encryption_iv
                );
        ?>
                <tr>
                    <td><?php echo $i; ?></td>
                    <td><?php echo $data['name']; ?></td>
                    <td><?php echo $data['surname']; ?></td>
                    <td><?php echo $data['email']; ?></td>
                    <td><?php echo $data['phone1']; ?></td>
                    <td><?php echo $data['address']; ?></td>
                    <td><?php echo $data['bussinesName']; ?></td>
                    <td><a href="dashboard.php?cat=client-setting&subcat=clientlist&view=<?php echo $encrypted_id; ?>" class="text-secondary content-link"><i class='fa fa-eye'></i></a></td>
                    <td><a href="dashboard.php?cat=client-setting&subcat=clientlist&edit=<?php echo $encrypted_id; ?>" class="text-success content-link"><i class=' fa fa-calendar-check'></i></a></td>
                </tr>
            <?php
                $i++;
            }
        } else {

            ?>
            <tr>
                <td colspan="6">Asnje klient per tu shfaqur</td>
            </tr>
        <?php } ?>
<?php

    }
}

function searchMyCAppointments($con, $name, $myid,$companyId)
{
    if (empty($name)) {
        echo $error = "1";
    } else {
        ?>
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
                                                $sql1 = "SELECT appointments.id,clients.name,clients.surname,appointments.shdesc,appointments.date,appointments.startTime,appointments.endTime ,appointments.status from clients,appointments where appointments.userId IN (Select id from users where companyId='$companyId') and appointments.clientId=clients.id and clients.name like '%$name%' and appointments.status='2' ORDER BY clients.name ASC";
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
                                                                       <td><a href="dashboard.php?cat=appointments-setting&subcat=view-appointment&view=<?php echo $data['id']; ?>" class="text-secondary btn-view content-link"><i class='far fa-eye'></i></a></td>

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
        <?php
    }
}

function searchMyAppointments($con, $name, $myid,$companyId)
{
    if (empty($name)) {
        echo $error = "1";
    } else {
        ?>
      <tr>
      <th>Nr.</th>
                        <th>Emri</th>
                        <th>Mbiemri</th>
                        <th>Përshkrimi</th>
                        <th>Data</th>
                        <th>Ora e fillimit</th>
                        <th>Ora e mbarimit</th>
                        <th>Statusi</th>
                        <th>Anulo</th>
                        <th>Shiko</th>
                        <?php
                        /*
                         <th>Ndrysho</th>
                        */
                        ?>
                       
                    </tr>
                        <?php
                        $sql1 = "SELECT appointments.id,clients.name,clients.surname,appointments.shdesc,appointments.date,appointments.startTime,appointments.endTime ,appointments.status from clients,appointments where appointments.status='1' and appointments.userId IN (Select id from users where companyId='$companyId') and clients.name like '%$name%' and appointments.clientId=clients.id ORDER BY clients.name ASC";
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
                                    
                                    <td><a href="javascript:void(0)" class="cancel delete_button_color" name="appointments" id="<?php echo $data['id']; ?>">Anulo</a></td>
                                    <td><a href="dashboard.php?cat=appointments-setting&subcat=view-appointment&view=<?php echo $data['id']; ?>" class=" view_button_color"><i class='far fa-eye'></i></a></td>
                                   <?php
                                    /*
                                                                        <td><a href="dashboard.php?cat=appointments-setting&subcat=update-appointment&update=<?php echo $data['id']; ?>" class="text-success edit_button_color"><i class=' far fa-edit'></i></a></td>


                                    */
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
        <?php
    }
}

