<?php
session_start();
include('../../config/config.php');
ob_clean();

$name =capitalizeFirstLetter($_POST['name']);
$phone = capitalizeFirstLetter($_POST['mobile']);
$myid=$_SESSION['id'];
$date = new DateTime("now", new DateTimeZone('Europe/Belgrade') );
        $today=$date->format('Y-m-d H:i:s');
if (empty($name) || (!preg_match("/^([a-zA-Z' ]+)$/", $name))) 
{
    echo $error="1";
    exit;
}elseif(checknameexistence($con,$name))
{
    echo $error="2";
    exit;
}else{
    savedata($con,$name,$myid,$phone,$today);

}
function  savedata($con,$name,$myid,$phone,$today)
{
    $stmt = $con->prepare('INSERT INTO companies (name,userId,phone,registered) 
    VALUES(?,?,?,?)');
$stmt->bind_param('siss', $name, $myid,$phone,$today);
$stmt->execute();   
$stmt->close();
echo "<span class='success'>Te dhenat u ruajten me sukses</span>";
}

function capitalizeFirstLetter($string) {
    return ucfirst(strtolower($string));
  }



  function checknameexistence($con, $username)
    {
        $userid=$_SESSION['id'];
         $exists=true;
            if ($stmt = $con->prepare('SELECT * FROM companies WHERE name= ?')) {
                // Bind parameters (s = string, i = int, b = blob, etc), in our case the username is a string so we use "s"
                $stmt->bind_param('s', $username);
                $stmt->execute();
                // Store the result so we can check if the account exists in the database.
                $stmt->store_result();
                if ($stmt->num_rows > 0) {
                    $exists=true;
                } else {
            
                    $exists=false;
                }
            } else {
            }
        $stmt->close();
        return $exists;
    }
?>


