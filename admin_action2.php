<?php include 'database.php'; 
 $all = htmlspecialchars($_GET['login']);
      $info = explode("@",$all);
      // echo $all;
      $username =$info[0];
      $schoolid =$info[1];
 
// ---------------------------------------------------------------------

if(isset($_POST["la_enterSchoolID"]))
{	$schoolid = $_POST["la_schoolid"];
	if (!mysqli_query($conn, "call checker('$username','$schoolid')")) {
		// echo $username;
		header('Location: admin2.php?login='.$username); 	
	}
	else{
		header('Location: admin_main.php?login='.$username.' '.$schoolid);	
	} 
} 

// ---------------------------------------------------------------------

$total = 1000;

$count = 1;
while ($count <= $total) {
	if(isset($_POST["la_accept".$count]))
	{
	$studentssn = $_POST["la_ssn".$count];
	mysqli_query($conn, "CALL accept_Parent_Application ('$studentssn','$schoolid',true);");
	// DO SMTH IF ACCEPTED
	header('Location: admin_main.php?login='.$username);  // CHANGE THAT
	}
	$count = $count + 1;
}


// ---------------------------------------------------------------------

$total = 1000;

$count = 1;
while ($count <= $total) {
	if(isset($_POST["la_reject".$count]))
	{
	$studentssn = $_POST["la_ssn".$count];
	mysqli_query($conn, "CALL accept_Parent_Application ('$studentssn','$schoolid',false);");
	// DO SMTH IF REJECTED like delete or smth
	header('Location: admin_main.php?login='.$username);  // CHANGE THAT
	}
	$count = $count + 1;
}



// ---------------------------------------------------------------------

$total = 1000;

$count = 1;
while ($count <= $total) {
	if(isset($_POST["la_verify".$count]))
	{
	$teacherid = $_POST["la_tid".$count];
	$teacherusername = $_POST["la_tusername".$count];
	$teacherpassword = $_POST["la_tpassword".$count];
	mysqli_query($conn, "CALL add_Teachers('$teacherid', '$teacherusername', '$teacherpassword');");
	header('Location: admin_main.php?login='.$username);  // CHANGE THAT
	}
	$count = $count + 1;
}



// ---------------------------------------------------------------------

$total = 1000;

$count = 1;
while ($count <= $total) {
	if(isset($_POST["la_assignTeachAct".$count]))
	{
	$teacherid = $_POST["la_tidActivity".$count];
	$activityid = $_POST["la_acid".$count];
	// HATY ADMIN ID
	mysqli_query($conn, "CALL assign_Activity_Teacher('$activityid', '$teacherid', '$adminid');");
	header('Location: admin_main.php?login='.$username);  // CHANGE THAT
	}
	$count = $count + 1;
}



// ---------------------------------------------------------------------

$total = 1000;

$count = 1;
while ($count <= $total) {
	if(isset($_POST["la_assignTeachCourse".$count]))
	{
	$teacherid = $_POST["la_tidCourse".$count];
	$coursecode = $_POST["la_ccode".$count];
	// HATY SCHOOL ID
	mysqli_query($conn, "CALL assign_Teacher_Course('$coursecode', '$teacherid', '$schoolid');");
	header('Location: admin_main.php?login='.$username);  // CHANGE THAT
	}
	$count = $count + 1;
}


// ---------------------------------------------------------------------

if(isset($_POST["la_submitAn"]))
{	$atitle = $_POST["la_atitle"];
    $atype = $_POST["la_atype"];
    $adate = $_POST["la_adate"];
    $adesc = $_POST["la_adesc"];
    $all = htmlspecialchars($_GET['login']);
      $info = explode("@",$all);
      // echo $all;
      $username =$info[0];
      $schoolid =$info[1];
    $result = mysqli_query($conn, "SELECT e.id FROM Employees e WHERE e.username = '$username';");   // HOW TO TAKE ID AS STRING?
    // $schoolid
    echo $result;
    // $adminid="1";
    			if (!$result) { die("Query to show fields from table failed"); }
                while($row = mysqli_fetch_row($result)){
                $adminid=$row[0];}
                // echo $adminid;
     if (!mysqli_query($conn, "CALL add_Announcement('$atitle', '$atype', '$adate', '$adesc','$adminid');")) {
		echo $username;
		// header('Location: admin_postNewAnnouncement.php?login='.$username); 	
	}
	else{
		header('Location: admin_postAnnouncement.php?login='.$username.'@'.$schoolid);	
	} 
} 


// ---------------------------------------------------------------------

if(isset($_POST["la_submitAc"]))
{	$acname = $_POST["la_acname"];
    $actype = $_POST["la_actype"];
    $acdate = $_POST["la_acdate"];
    $acloc = $_POST["la_acloc"];
    $adesc = $_POST["la_acdesc"];
    $result = mysqli_query($conn, "SELECT e.id FROM Employees e WHERE e.username = '$username';");   // HOW TO TAKE ID AS STRING?
    // $schoolid
                if (!$result) { die("Query to show fields from table failed"); }
                while($row = mysqli_fetch_row($result)){
                $adminid=$row[0];}

	if (!mysqli_query($conn, "CALL create_Activity('$actype', '$acdate', '$acloc', '$adesc','$acname','$schoolid' ,'$adminid');")) {
		// echo $username;
		header('Location: admin_createNewActivity.php?login='.$username); 	
	}
	else{
		header('Location: admin_createActivity.php?login='.$username.' '.$schoolid);	
	} 
} 



// ---------------------------------------------------------------------

if(isset($_POST["la_editname"]))
{	$scname = $_POST["la_schoolname"];
	if (mysqli_query($conn, "UPDATE Schools s SET s.name = '$scname' WHERE s.school_id = '$schoolid';")) {
		
		header('Location: admin_editSchoolInfo.php?login='.$username.'@'.$schoolid); 	
	}
} 


if(isset($_POST["la_editaddress"]))
{	$scaddress = $_POST["la_schooladdress"];
	if (mysqli_query($conn, "UPDATE Schools s SET s.address = '$scaddress' WHERE s.school_id = '$schoolid';")) {
		
		header('Location: admin_editSchoolInfo.php?login='.$username.'@'.$schoolid); 	
	}
} 


if(isset($_POST["la_editphone"]))
{	$scphone = $_POST["la_schoolphone"];
	if (mysqli_query($conn, "UPDATE Schools s SET s.phone_number = '$scphone' WHERE s.school_id = '$schoolid';")) {
		
		header('Location: admin_editSchoolInfo.php?login='.$username.'@'.$schoolid); 	
	}
} 


if(isset($_POST["la_editemail"]))
{	$scemail = $_POST["la_schoolemail"];
	if (mysqli_query($conn, "UPDATE Schools s SET s.email = '$scemail' WHERE s.school_id = '$schoolid';")) {
		
		header('Location: admin_editSchoolInfo.php?login='.$username.'@'.$schoolid); 	
	}
} 


if(isset($_POST["la_editinfo"]))
{	$scinfo = $_POST["la_schoolinfo"];
	if (mysqli_query($conn, "UPDATE Schools s SET s.general_info = '$scinfo' WHERE s.school_id = '$schoolid';")) {
		
		header('Location: admin_editSchoolInfo.php?login='.$username.'@'.$schoolid); 	
	}
} 


if(isset($_POST["la_editvision"]))
{	$scvision = $_POST["la_schoolvision"];
	if (mysqli_query($conn, "UPDATE Schools s SET s.vision = '$scvision' WHERE s.school_id = '$schoolid';")) {
		
		header('Location: admin_editSchoolInfo.php?login='.$username.'@'.$schoolid); 	
	}
} 


if(isset($_POST["la_editmission"]))
{	$scmission = $_POST["la_schoolmission"];
	if (mysqli_query($conn, "UPDATE Schools s SET s.mission = '$scmission' WHERE s.school_id = '$schoolid';")) {
		
		header('Location: admin_editSchoolInfo.php?login='.$username.'@'.$schoolid); 	
	}
} 


if(isset($_POST["la_editlang"]))
{	$sclang = $_POST["la_schoolmainlang"];
	if (mysqli_query($conn, "UPDATE Schools s SET s.main_language = '$sclang' WHERE s.school_id = '$schoolid';")) {
		
		header('Location: admin_editSchoolInfo.php?login='.$username.'@'.$schoolid); 	
	}
} 


if(isset($_POST["la_edittype"]))
{	$sctype = $_POST["la_schooltype"];
	if (mysqli_query($conn, "UPDATE Schools s SET s.type = '$sctype' WHERE s.school_id = '$schoolid';")) {
		
		header('Location: admin_editSchoolInfo.php?login='.$username.'@'.$schoolid); 	
	}
} 

if(isset($_POST["la_editfees"]))
{	$scfees = $_POST["la_schoolfees"];
	if (mysqli_query($conn, "UPDATE Schools s SET s.fees= '$scfees' WHERE s.school_id = '$schoolid';")) {
		
		header('Location: admin_editSchoolInfo.php?login='.$username.'@'.$schoolid); 	
	}
} 


?>