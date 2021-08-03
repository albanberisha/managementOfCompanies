<?php 
session_start();
include('../../config/config.php');
ob_clean();

$myid=$_SESSION['id'];
$oldPsw = $_POST['old_password'];
$newPsw = $_POST['new_password'];
$new2Psw = $_POST['new_password2'];
$type=NULL;

$date = new DateTime("now", new DateTimeZone('Europe/Belgrade') );
        $today=$date->format('Y-m-d');
        $nowtime=$date->format('H:i');
        $now=$date->format('Y-m-d H:i:s');

if(empty($oldPsw))
{
    echo "1";
}elseif(!oldPswCorrect($con,$oldPsw,$myid))
{
    echo "2";
}elseif(!preg_match("/^(?=.*?[a-z])(?=.*?[0-9]).{4,}$/", $newPsw))
{
    echo $error="3";
}elseif(strcmp($newPsw, $new2Psw) == 0)
{
  saveData($con,$myid,$newPsw);

}else{
    echo "4";
}

function   saveData($con,$myid,$newPsw)
{
    $date = new DateTime("now", new DateTimeZone('Europe/Belgrade') );
        $today=$date->format('Y-m-d H:i:s');

    $hashed_password = password_hash($newPsw, PASSWORD_DEFAULT); 
        $query = "UPDATE users SET password='$hashed_password', last_updated='$today' WHERE id='$myid'";
        mysqli_query($con, $query);
echo "<span class='success'>Te dhenat u ruajten me sukses.</span>";
}

function oldPswCorrect($con, $pasword, $id)
    {
        $validimi = false;
        $oldpass = $pasword;
        $query = mysqli_query($con, "SELECT * FROM users WHERE id='$id'");
        $data = mysqli_fetch_array($query);
        if (!$query) {
            die("E pamundur te azhurohen te dhenat: " . mysqli_connect_error());
        } else {
            if ($data > 0) {
                $dbpsw = $data['password'];
                if (password_verify($oldpass, $dbpsw)) {
                    $validimi = true;
                }
            } else {
            }
        }
        return $validimi; //psw gabim
    }
?>