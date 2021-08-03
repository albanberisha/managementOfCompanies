<?php
session_start();
include('../../config/config.php');
ob_clean();
$name =capitalizeFirstLetter($_POST['name']);
$surname = capitalizeFirstLetter($_POST['surname']);
$email = $_POST['email'];
$mobile1 = $_POST['mobile1'];
$mobile2 = $_POST['mobile2'];
$address = $_POST['address'];
$reference = $_POST['reference'];
$bussinesName = $_POST['bussinesName'];
$comment = $_POST['comment'];
$myid=$_SESSION['id'];
$date = new DateTime("now", new DateTimeZone('Europe/Belgrade') );
$today=$date->format('Y-m-d H:i:s');
$companyId="";
$query = "SELECT companyId from users where id='$myid'";
$result = mysqli_query($con, $query);
$row = mysqli_fetch_array($result);
if($row>0)
{
    $companyId=$row['companyId'];
}else{
    echo $error="1";
    exit;
}
if (empty($name) || (!preg_match("/^([a-zA-Z' ]+)$/", $name))) 
{
    echo $error="1";
}elseif(!empty($surname) && (!preg_match("/^([a-zA-Z' ]+)$/", $surname)))
{
    echo $error="2";
}elseif(!preg_match("/^[a-zA-Z0-9_.+-]+@[a-zA-Z0-9-]+\.[a-zA-Z0-9-.]+$/", $email) && !empty($email))
{
    echo $error="3";
}elseif(empty($mobile1)){

echo $error="4";}else{
    savedata($con,$name,$surname,$email,$mobile1,$mobile2,$address,$reference,$bussinesName,$comment,$today,$myid,$companyId);
}
function  savedata($con,$name,$surname,$email,$mobile1,$mobile2,$address,$reference,$bussinesName,$comment,$today,$myid,$companyId)
{
    $stmt = $con->prepare('INSERT INTO clients (name,surname,email,phone1,phone2,address,reference,bussinesName,comment,regDate,registeredBy,companyId) 
    VALUES(?,?,?,?,?,?,?,?,?,?,?,?)');
$stmt->bind_param('ssssssssssis', $name, $surname,$email,$mobile1,$mobile2,$address,$reference,$bussinesName,$comment,$today,$myid,$companyId);
$stmt->execute();   
$stmt->close();
echo "<span class='success'>Te dhenat u ruajten me sukses</span>";
}

function capitalizeFirstLetter($string) {
    return ucfirst(strtolower($string));
  }
?>