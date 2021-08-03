<?php 
session_start();
include('../../config/config.php');
ob_clean();

$myid=$_SESSION['id'];
$name = $_POST['name'];
$surname = $_POST['surname'];
$compid = $_POST['companies'];
$username = $_POST['username'];
$email = $_POST['email'];
$mobile  = $_POST['mobile'];
$birthday = $_POST['birthday'];
if(isset($_POST['gender']))
{
    $gender = $_POST['gender'];
}else{
    $gender=NULL;
}

$password = $_POST['password'];
$cpassword = $_POST['cpassword'];

$date = new DateTime("now", new DateTimeZone('Europe/Belgrade') );
        $today=$date->format('Y-m-d');
        $nowtime=$date->format('H:i');
        $now=$date->format('Y-m-d H:i:s');

    if (empty($name) || (!preg_match("/^([a-zA-Z' ]+)$/", $name))) 
    {
        echo $error="1";
    }elseif(!empty($surname) && (!preg_match("/^([a-zA-Z' ]+)$/", $surname)))
    {
        echo $error="2";
    }elseif($compid==-1)
    {
        echo $error="3";
    }elseif(empty($username))
    {
        echo $error="4";
    }elseif(checkusernameexistence($con,$username))
    {
        echo $error="5";
    }elseif(!preg_match("/^[a-zA-Z0-9_.+-]+@[a-zA-Z0-9-]+\.[a-zA-Z0-9-.]+$/", $email) && !empty($email))
    {
        echo $error="6";
    }elseif(!preg_match("/^(?=.*?[a-z])(?=.*?[0-9]).{4,}$/", $password) ||  empty($password) )
    {
        echo $error="7";
    }elseif(strcmp($password, $cpassword) == 0)
    {
     saveData2($con,$compid,$name,$surname,$email,$username,$password,$birthday,$gender,$mobile);
    }else{
        echo "8";
    }

function   saveData2($con,$compid,$name,$surname,$email,$username,$password,$birthday,$gender,$mobile)
{
    $date = new DateTime("now", new DateTimeZone('Europe/Belgrade') );
        $now=$date->format('Y-m-d H:i:s');
    $hashed_password = password_hash($password, PASSWORD_DEFAULT); 
    $today=date("Y-m-d H:i:s");
    $privilege="2";
    $status="1";
    $stmt = $con->prepare('INSERT INTO users (companyId,name,surname,email,username,password,birthday,gender,phone,privilege,status,registered) 
    VALUES(?,?,?,?,?,?,?,?,?,?,?,?)');
$stmt->bind_param('ssssssssssss', $compid, $name,$surname,$email,$username,$hashed_password,$birthday,$gender,$mobile,$privilege,$status,$now);
$stmt->execute();   
$stmt->close();
echo "<span class='success'>Te dhenat u ruajten me sukses</span>";

}
function saveData($con,$editId,$name,$surname,$email,$username,$password,$birthday,$gender,$mobile)
{
    $date = new DateTime("now", new DateTimeZone('Europe/Belgrade') );
        $today=$date->format('Y-m-d H:i:s');

        $query = "UPDATE users SET name='$name',surname='$surname',email='$email',username='$username',birthday='$birthday',gender='$gender',phone='$mobile',last_updated='$today' WHERE id='$editId'";
        if(!empty($password))
        {
            $hashed_password = password_hash($password, PASSWORD_DEFAULT); 
            $query = "UPDATE users SET name='$name',surname='$surname',email='$email',username='$username',password='$hashed_password',birthday='$birthday',gender='$gender',phone='$mobile',last_updated='$today' WHERE id='$editId'";
        }
        mysqli_query($con, $query);
echo "<span class='success'>Te dhenat u ruajten me sukses.</span>";
}
    function checkusernameexistence($con, $username)
    {
        $userid=$_SESSION['id'];
         $exists=true;

            if ($stmt = $con->prepare('SELECT * FROM users WHERE username= ?')) {
                // Bind parameters (s = string, i = int, b = blob, etc), in our case the username is a string so we use "s"
                $stmt->bind_param('s',$username);
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