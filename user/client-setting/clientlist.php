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

<br><br>
<div class="content-box">
    <?php if (!empty($_GET['view'])) { ?>

        <?php
        $clienthashId = $_GET['view'];
        $decryption_iv = '1234567891011121';
        $ciphering = "AES-128-CTR";
        $iv_length = openssl_cipher_iv_length($ciphering);
        $options = 0;

        // Store the decryption key
        $decryption_key = "BitCompany";

        // Use openssl_decrypt() function to decrypt the data
        $clientid = openssl_decrypt(
            $clienthashId,
            $ciphering,
            $decryption_key,
            $options,
            $decryption_iv
        );
        $query = "SELECT * FROM clients WHERE id=$clientid and companyId='$companyId'";
        $res = $con->query($query);
        $viewData = $res->fetch_assoc();
        if (empty($viewData)) {
            echo "Asnje e dhene per tu shfaqur!";
            exit;
        }
        $backId = $viewData['id'];
        $name = $viewData['name'];
        $surname = $viewData['surname'];
        $email = $viewData['email'];
        $phone1 = $viewData['phone1'];
        $phone2 = $viewData['phone2'];
        $address = $viewData['address'];
        $reference = $viewData['reference'];
        $bussinesName = $viewData['bussinesName'];
        $comment = $viewData['comment'];
        ?>
        <div class="row">
            <div class="col">
            </div>
            <div class="col text-right">
                <a href="dashboard.php?cat=client-setting&subcat=clientlist" class="btn btn-secondary btn-back content-link"><i class="fas fa-arrow-left"></i> Prapa</a>
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
                    <th>Emri dhe mbiemri -</th>
                    <td><?php echo $name . " " . $surname; ?></td>
                </tr>
                <tr>
                    <th>Emaili -</th>
                    <td><?php echo $email; ?></td>
                </tr>
                <tr>
                    <th>Tel (1) -</th>
                    <td><?php echo $phone1; ?></td>
                </tr>
                <tr>
                    <th>Tel (2) -</th>
                    <td><?php echo $phone2; ?></td>
                </tr>
                <tr>
                    <th>Adresa -</th>
                    <td class="wbreak"><?php echo $address; ?></td>
                </tr>
                <tr>
                    <th class="wbreak">Referenca -</th>
                    <td class="wbreak"><?php echo $reference; ?></td>
                </tr>
                <tr>
                    <th class="wbreak">Emri i biznesit -</th>
                    <td class="wbreak"><?php echo $bussinesName; ?></td>
                </tr>
                <tr>
                    <th>Komenti -</th>
                    <td class="wbreak"><?php echo $comment; ?></td>
                </tr>
            </table>
        </div>
        <div class="row">
            <div class="col" style="text-align: center;">
                <h5>Komentet</h5>
            </div>
        </div>
        <span id="Error" style="color: green;"></span>
        <form method="POST" id="CommentsForm" enctype="multipart/form-data">
            <span id="Commenteerror" style="color: red;font-size:0.8em"></span>
            <div class="form-group">
                <textarea class="form-input" name="comment" id="Comment34" placeholder="Komenti ..."></textarea>
            </div>
            <input type="hidden" name="clientHashId" value="<?php echo $clienthashId ?>">
            <div class="form-group">
                <button type="submit" name="add_comment" value="update" class="btn btn-secondary" style="font-size: 1.03em;">Komento </button>
            </div>
        </form>
        <div class="row">
            <div class="col">
                <div class="row">
                </div>
                <div class="table-responsive">
                    <table class="table" id="ClientList">
                        <?php
                        $sql1 = "SELECT * from comment where client_id='$clientid' and status='1' ORDER BY dateTime DESC";
                        $res1 = $con->query($sql1);
                        if ($res1->num_rows > 0) {
                            $i = 1;
                            while ($data = $res1->fetch_assoc()) {
                        ?>
                                <tr>
                                    <td><?php echo $i; ?></td>
                                    <td class="wbreak"><?php echo htmlentities($data['description']) ?></td>
                
                                    <td><?php echo htmlentities($data['dateTime']) ?></td>
                                </tr>
                            <?php
                                $i++;
                            }
                        } else {
                            ?>
                            <tr>
                                <td colspan="6">Asnje koment per tu shfaqur</td>
                            </tr>
                        <?php } ?>

                    </table>
                </div>
            </div>
        </div>
    <?php
    } elseif (!empty($_GET['edit'])) {
        $clienthashId = $_GET['edit'];
        $decryption_iv = '1234567891011121';
        $ciphering = "AES-128-CTR";
        $iv_length = openssl_cipher_iv_length($ciphering);
        $options = 0;

        // Store the decryption key
        $decryption_key = "BitCompany";

        // Use openssl_decrypt() function to decrypt the data
        $clientid = openssl_decrypt(
            $clienthashId,
            $ciphering,
            $decryption_key,
            $options,
            $decryption_iv
        );
        $query = "SELECT * FROM clients WHERE id=$clientid and companyId='$companyId'";
        $res = $con->query($query);
        $viewData = $res->fetch_assoc();
        if (empty($viewData)) {
            echo "Asnje e dhene per tu shfaqur!";
            exit;
        }
        $backId = $viewData['id'];
        $name = $viewData['name'];
        $surname = $viewData['surname'];
        $email = $viewData['email'];
        $phone1 = $viewData['phone1'];
        $phone2 = $viewData['phone2'];
        $address = $viewData['address'];
        $reference = $viewData['reference'];
        $bussinesName = $viewData['bussinesName'];
        $comment = $viewData['comment'];
    ?>
        <div class="row">
            <div class="col text-right">
                <a href="dashboard.php?cat=client-setting&subcat=clientlist" class="btn btn-secondary btn-back content-link"><i class="fas fa-arrow-left"></i> Prapa</a>
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
                    <td><?php echo $name; ?></td>
                    <td><?php echo $surname ?></td>
                    <td><?php echo $email; ?></td>
                    <td><?php echo $phone1; ?></td>
                    <td><?php echo $phone2; ?></td>
                    <td class="wbreak"><?php echo $address; ?></td>
                    <td class="wbreak"><?php echo $reference; ?></td>
                    <td class="wbreak"><?php echo $bussinesName; ?></td>
                    <td class="wbreak"><?php echo $comment;  ?></td>
                </tr>
            </table>
        </div>
        <div class="row">
            <div class="col">
            <a href="javascript:void(1);" onclick="showAddAppointmentForm();" class="btn btn-secondary btn-back content-link"><i class="fas fa-plus" aria-hidden="true"></i> Shto një tërmin</a>
            </div>
        </div>
        <div class="row">
            <div class="col" style="text-align: center;">
                <h5>Tërminet</h5>
            </div>
        </div>
        <span id="Error" style="color: green;"></span>
        <div class="row">
            <div class="col">
                <div class="row">
                </div>
                <div class="table-responsive">
                    <table class="table" id="ClientList">
                    <tr>
                    <th>Nr.</th>
                    <th>Përshkrimi</th>
                    <th>Data</th>
                    <th>Ora e fillimit</th>
                    <th>Ora e barimit</th>
                </tr>
                        <?php
                        $sql1 = "SELECT * FROM appointments WHERE clientId='$clientid' and status='1' ORDER BY date DESC,startTime ASC";
                        $res1 = $con->query($sql1);
                        if ($res1->num_rows > 0) {
                            $i = 1;
                            while ($data = $res1->fetch_assoc()) {
                        ?>
                                <tr>
                                    <td><?php echo $i; ?></td>
                                    <td class="wbreak"><?php echo htmlentities($data['shdesc']) ?></td>
                                    <td><?php echo htmlentities($data['date']) ?></td>
                                    <td><?php echo htmlentities($data['startTime']) ?></td>
                                    <td><?php echo htmlentities($data['endTime']) ?></td>
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

                    </table>
                </div>
            </div>
        </div>
        <div class="row">
            <div class="col" style="text-align: center;">
                <h5>Komentet</h5>
            </div>
        </div>
        <span id="Error" style="color: green;"></span>
        <div class="row">
            <div class="col">
                <div class="row">
                </div>
                <div class="table-responsive">
                <table class="table" id="ClientList">
                        <?php
                        $sql1 = "SELECT * from comment where client_id='$clientid' and status='1' ORDER BY dateTime DESC";
                        $res1 = $con->query($sql1);
                        if ($res1->num_rows > 0) {
                            $i = 1;
                            while ($data = $res1->fetch_assoc()) {
                        ?>
                                <tr>
                                    <td><?php echo $i; ?></td>
                                    <td class="wbreak"><?php echo htmlentities($data['description']) ?></td>
                
                                    <td><?php echo htmlentities($data['dateTime']) ?></td>
                                </tr>
                            <?php
                                $i++;
                            }
                        } else {
                            ?>
                            <tr>
                                <td colspan="6">Asnje koment per tu shfaqur</td>
                            </tr>
                        <?php } ?>

                    </table>
                </div>
            </div>
        </div>
</div>
<div class="hover_bkgr_fricc2">
<br>
<br>
    <span class="helper2"></span>
    <div>
        <div class="popupCloseButton2">×</div>
        <div id="AddNewEvent"><div class="headerPopup">
    <span class="textHeader">Termin i ri</span>
</div>
<div class="formPopup">
    <div class="container-contact100">
        <div class="wrap-contact100">
        <form id="AddAppointmentsForm" enctype="multipart/form-data">
        <div class="row">
            <div class="col">
                <div class="form-group label-input100">
                    <label><strong>Përshkrimi: <span style="color: red;">*</span></strong></label>
                    <input type="text" name="shortDescription" id="ShortDescription" class="form-control input100" placeholder="Shtypni përshkrimin">
                    <span id="ShDescError" style="color: red;"></span>
                </div>
            </div>
        </div>
        <input type="hidden" name="clientHashId" value="<?php echo $clienthashId ?>">
        <div class="row">
            <div class="col">
                <div class="form-group label-input100">
                    <label><strong>Data: <span style="color: red;">*</span></strong></label>
                    <input type="date" name="date" id="Date" class="form-control" />
                    <span id="DateError" style="color: red;"></span>
                </div>
            </div>
        </div>
        <div class="row">
            <div class="col">
                <div class="form-group label-input100">
                    <label><strong>Ora e fillimit: <span style="color: red;">*</span></strong></label>
                    <input type="time" name="strtTime" id="StrtTime" class="form-control" />
                    <span id="StartTimeError" style="color: red;"></span>
                </div>
            </div>
            <div class="col">
                <div class="form-group label-input100">
                    <label><strong>Ora e mbarimit: <span style="color: red;">*</span></strong></label>
                    <input type="time" name="endTime" id="EndTime" class="form-control" />
                    <span id="EndTimeError" style="color: red;"></span>
                </div>
            </div>
        </div>
        <div class="row">
            <div class="col">
                <div class="form-group label-input100">

                    <div class="wrap-input100 bg1">
                        <span class="label-input100" style="    width: 100%;
padding-bottom: 10px;"><strong>Tipi:</strong></span>
                        <div class="input-title-btn" id="Cond" style="display: inline-flex;">
                            <div class="" style="    padding-right: 10px;">
                                <input class="" type="radio" name="cond" value="red">
                                <label class="form-check-label" for="flexRadioDefault1">
                                    <a href="#" type="button" class="btn" style="width:40px; background: #ce5151; color:#ce5151; border:1px solid rgb(255, 142, 142); color: #ce5151" data-toggle="tooltip" data-placement="bottom">.</a>
                                </label>
                            </div>
                            <div class="" style="    padding-right: 10px;">
                                <input class="" type="radio" name="cond" value="blue">
                                <label class="form-check-label" for="flexRadioDefault1">
                                    <a href="#" type="button" class="btn" style=" width:40px; background: #518fce; border:1px solid rgb(199, 199, 105); color: #518fce" data-toggle="tooltip" data-placement="bottom">.</a>
                                </label>
                            </div>
                            <div class="" style="    padding-right: 10px;">
                                <input class="" type="radio" name="cond" value="green">
                                <label class="form-check-label" for="flexRadioDefault1">
                                    <a href="#" type="button" class="btn" style="width:40px; background: #51ce57; border:1px solid rgb(128, 253, 128); color: #51ce57" data-toggle="tooltip" data-placement="bottom">.</a>
                                </label>
                            </div>
                        </div>
                        <span id="Conditionerror" style="color: red;"></span>
                    </div>
                </div>
            </div>
        </div>
        <div class="row">
            <div class="col">
                <div class="form-group label-input100">
                    <label><strong>Komenti:</strong></label>
                    <textarea type="text" rows="4" name="comment" id="Comment" class="form-control txtarea" placeholder="Sheno komentin..."></textarea>
                    <span id="CommentError" style="color: red;"></span>
                </div>
            </div>
        </div>
        <div class="row">
            <div class="col">
                <div class="form-group">
                    <button class="btn btn-secondary" name="save_button_color" type="submit">Ruaj</button>
                </div>
            </div>
        </div>
    </form>
        </div>
    </div>
</div>
</div>
    </div>
</div>
<?php
} else { ?>
    <!-----=================table content start=================-->

    <div class="row">
        <div class="col">
            <h4>Klientet</h4>
        </div>
        <div class="col text-right">
            <a href="dashboard.php?cat=client-setting&subcat=addclient" class="btn btn-secondary btn-back content-link"> Shto <i class='fas fa-plus'></i></a>
        </div>
    </div>
    <br>
    <div class="row">
        <div class="col">
            <div class="row">
                <form id="SearchForm" enctype="multipart/form-data">
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
                                <a href="dashboard.php?cat=client-setting&subcat=clientlist" class="btn btn-secondary btn-back content-link"><i class="fas fa-sync"></i></a>

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
                        <th>Emaili</th>
                        <th>Tel</th>
                        <th>Adresa</th>
                        <th>Emri i biznesit</th>
                        <th>Shiko</th>
                        <th>Cakto termin</th>
                    </tr>
                    <?php
                    $sql1 = "SELECT * FROM clients WHERE companyId='$companyId' ORDER BY name";
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
                                <td><a href="dashboard.php?cat=client-setting&subcat=clientlist&view=<?php echo $encrypted_id; ?>" class="text-secondary btn-view content-link"><i class='fa fa-eye'></i></a></td>
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

                </table>
            </div>
        </div>
    </div>
    <!-----==================table content end===================-->
<?php } ?>

</div>
<script type="text/javascript" src="scripts/forms.js"></script>