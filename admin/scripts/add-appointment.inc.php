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

$myid=$_SESSION['id'];
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


$shortDesc = $_POST['shortDescription'];
$date = $_POST['date'];
$strtTime = $_POST['strtTime'];
$endTime = $_POST['endTime'];
$type=NULL;
$date = new DateTime("now", new DateTimeZone('Europe/Belgrade') );
        $today=$date->format('Y-m-d');
$nowtime = date("H:i");
if(!isset( $_POST['cond']))
{
}else{
    $type=$_POST['cond'];
}
$comment = $_POST['comment'];

if(empty($shortDesc))
{
    echo "11";
}elseif(strlen($shortDesc)>30)
{
    echo "12";
}elseif(empty($date))
{
    echo "13";
}elseif($date<$today)
{
    echo "14";
}elseif(empty($strtTime))
{
    echo "15";
}elseif($date==$today && $strtTime<=$nowtime)
{
    echo "16";
}elseif(checkappointmentExitence($con,$companyId,$date,$strtTime))
{
    $closestAppointment=closestAppointment($con,$strtTime,$companyId,$date);
    echo $error="26".$closestAppointment;
}elseif(empty($endTime))
{
    echo "17";
}elseif($strtTime>=$endTime)
{
    echo "18";
}elseif(checkappointmentExitenceEndtime($con,$endTime,$strtTime,$companyId,$date))
{$closestAppointmentend=closestAppointmentEnd($con,$endTime,$strtTime,$companyId,$date);
    echo $error="28".$closestAppointmentend;
}else{
    $numdays=1;
    $status=1;
  saveData($con,$myid,$clientid,$shortDesc,$comment,$date,$strtTime,$endTime,$numdays,$type,$today,$status);
}

function saveData($con,$myid,$clientid,$shortDesc,$comment,$date,$strtTime,$endTime,$numdays,$type,$today,$status)
{
    $date = new DateTime("now", new DateTimeZone('Europe/Belgrade') );
        $today=$date->format('Y-m-d H:i:s');
    $stmt = $con->prepare('INSERT INTO appointments (userId,clientId,shdesc,fullDesc,date,startTime,endTime,numOfDays,importance,dateTime,status) 
    VALUES(?,?,?,?,?,?,?,?,?,?,?)');
$stmt->bind_param('iisssssssss', $myid,$clientid,$shortDesc,$comment,$date,$strtTime,$endTime,$numdays,$type,$today,$status);
$stmt->execute();   
$stmt->close();
echo "<span class='success'>Termini u ruajt me sukses</span>";
}
$endtime=date("H:i");
function checkappointmentExitence($con,$companyId,$date,$strtTime)
{
    $exists=false;
    $query = mysqli_query($con, "SELECT * from appointments where clientId IN (SELECT id from clients where companyId='$companyId') and status='1' and date='$date' ORDER BY dateTime DESC");
    if (!$query) {
        die(mysqli_error($con).$query);
     } else {
        while($data = mysqli_fetch_array($query))
        {
            //if($data['date']!=$date);
           // $daynumber=$data['numOfDays'];
            //if($daynumber>1)
            //{
                //echo "11";
                //exit;
           // }
            $appoisttime=$data['startTime'];
               $appoientime=$data['endTime'];
               if(strtotime($strtTime)>=strtotime($appoisttime) && strtotime($strtTime)<=strtotime($appoientime))
               {
                   global $endtime;
                   $endtime=$appoientime;
                   $exists=true;
                   
               }
        }
            return $exists;
    }
}
function closestAppointment($con,$strtTime,$companyId,$date)
{
    global $endtime;
    $closestAppointment="";

    $date = new DateTime("now", new DateTimeZone('Europe/Belgrade') );
        $newformatfundit=$date->format('H:i:s',strtotime('+5 minutes',strtotime($endtime)));

    //$newformatfundit = date('H:i:s',strtotime('+5 minutes',strtotime($endtime)));
    for($count=0; $count<20 ; $count++)
    {
        if(!checkappointmentExitence($con,$companyId,$date,$newformatfundit))
        {
            
            return $newformatfundit;
            break;
        }
        $date = new DateTime("now", new DateTimeZone('Europe/Belgrade') );
        $newformatfundit=$date->format('H:i:s',strtotime('+5 minutes',strtotime($endtime)));
       // $newformatfundit = date('H:i:s',strtotime('+5 minutes',strtotime($endtime)));
    }
    return $closestAppointment;
}

$starttime=date("H:i");
function checkappointmentExitenceEndtime($con,$endTime,$strtTime,$companyId,$date)
{
    $exists=false;
    $query = mysqli_query($con, "SELECT * from appointments where clientId IN (SELECT id from clients where companyId='$companyId') and status='1' and date='$date' ORDER BY dateTime DESC");
         if (!$query) {
            die(mysqli_error($con).$query);
         } else {
             $datameafert=$endTime;
            while($data = mysqli_fetch_array($query))
            {
                $appoisttime=$data['startTime'];
                   $appoientime=$data['endTime'];
                   if(strtotime($appoisttime)>=strtotime($strtTime) && strtotime($appoisttime)<=strtotime($endTime) )
                   {
                       global $starttime;
                       $starttime=$appoisttime;
                       $exists=true;
                   }
            }
                return $exists;
        }

}
function closestAppointmentEnd($con,$endTime,$strtTime,$companyId,$date)
{
    global $starttime;
    $query = mysqli_query($con, "SELECT * from appointments where clientId IN (SELECT id from clients where companyId='$companyId') and status='1' and date='$date' ORDER BY dateTime DESC");
         if (!$query) {
            die(mysqli_error($con).$query);
         } else {
             $datameafert=$endTime;
             while($data = mysqli_fetch_array($query))
             {
                 $appoisttime=$data['startTime'];
                    $appoientime=$data['endTime'];
                    if(strtotime($appoisttime)>=strtotime($strtTime) && strtotime($appoisttime)<=strtotime($endTime) )
                    {
                        if($appoisttime<=$datameafert)
                        {
                            $datameafert=$appoisttime;
                        }
                    }
             }
             global $starttime;
             $starttime=$datameafert;
     return $starttime;
        }
}
?>