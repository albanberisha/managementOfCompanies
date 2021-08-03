<?php 
if (session_status() === PHP_SESSION_NONE) {
	session_start();
}
include('../config/config.php');
// This is just an example of reading server side data and sending it to the client.
// It reads a json formatted text file and outputs it.
$query = "SELECT userId,count(id) as 'Terminet e aprovuara','5' from appointments group by userId";
$result = mysqli_query($con, $query);
while($row = mysqli_fetch_array($result)) {
    $names[] = $row['userId'];
 }
 $myJSON = json_encode($names);
return $names;

// Instead you can query your database and parse into JSON etc etc

?>