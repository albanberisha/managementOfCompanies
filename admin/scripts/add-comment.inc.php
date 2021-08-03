<?php
session_start();
include('../../config/config.php');
ob_clean();

$clienthashId = $_POST['clientHashId'];
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
$myid = $_SESSION['id'];
$comment = $_POST['comment'];
if (empty($comment)) {
    echo $error = '2';
} else {
    $date = new DateTime("now", new DateTimeZone('Europe/Belgrade') );
    $today=$date->format('Y-m-d H:i:s');
        $status = 1;
    savedata($con, $clientid, $myid, $comment, $today, $status);
}
function savedata($con, $clientid, $myid, $comment, $today, $status)
{
    $date = new DateTime("now", new DateTimeZone('Europe/Belgrade') );
        $now=$date->format('Y-m-d H:i:s');
    $query = "INSERT INTO comment (client_id,user_id,description,dateTime,status) 
    VALUES('$clientid','$myid','$comment','$now','$status')";
    mysqli_query($con, $query);
    showComments($con, $clientid);
}
function showComments($con, $clientid)
{
?>
    <div class="be-comment-block" id="Comments">
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
    </div>
<?php
}
?>