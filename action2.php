<?php include 'database.php';

 
      // $username = htmlspecialchars($_GET['login']);
      // echo $username;
      //$username='yasmine.amr';
      // $temp = mysqli_query($conn, "select s.ssn from Students s where s.username = '$username' ");
      // $temp= mysqli_fetch_row($temp);
      // $ssn= $temp[0]; 
      // if (!$ssn) { die("Query to show fields from table failed"); } 


	// echo 'hello!!!';
if(isset($_POST["ch_signup"]))
{	
	echo 'hello!!!';
	// $user=$_POST["ch_signup"]; -->
	// $username= $_POST["ch_username"];
	$username = htmlspecialchars($_GET['login']);

	$ssn = $_POST["ch_ssn"];
	$name = $_POST["ch_name"];
	$level = $_POST["ch_level"];
	$gen = $_POST["ch_gen"];
	$bd = $_POST["ch_bdate"];
	$grade = $_POST["ch_grade"];
	// echo $username.' '.$ssn.' '.$name.' '.$level.' '.$gen.' '.$bd.' '.$grade;
	
		if (!mysqli_query($conn, "call add_child('$username','$ssn','$name','$gen','$bd','$grade','$level')")) {
			header('Location: failsignup.php?type=Child&login='.$username); 	
			// echo 'fail to load query';
		}
		else{
			echo 'succes';
			header('Location: Parents.php?login='.$username); 	
		}


}

if(isset($_POST["child_apply"]))
{	
	// echo 'helloapply!!!';
	// $user=$_POST["ch_signup"]; -->
	// $username= $_POST["ch_username"];
	$username = htmlspecialchars($_GET['login']);

	$sn = explode(" ",$_POST['child_name']);
	echo $_POST['child_Schools'];
	echo $_POST['child_name'];
	$sIDs = explode(" ",$_POST['child_Schools']);
		$sID=$sIDs[0];
		$ssn=$sn[0];
		$tmp2 = mysqli_query($conn, "select  s.name,s.level_name,s.gender, s.birth_date,s.grade from Students s WHERE s.ssn ='$ssn'");
                        
         if (!$tmp2) {die("Query to show fields from table failed"); }  
                          while($row = mysqli_fetch_row($tmp2)) {
                          	$name=$row[0];
                          	$level = $row[1];
							$gen = $row[2];
							$bd = $row[3];
							$grade = $row[4];
							}
		if (!mysqli_query($conn, "call apply_School('$username','$ssn','$name','$gen','$bd','$sID','$grade','$level')")) {
			header('Location: failapply.php?type= You are either picking a school which does not offer your childs educational level Or you have already filled an identical application! Go Back and figure out what went wrong '); 	
			// echo mysqli_connect_error().' hello';

			// echo 'fail to load query';
		}
		else{
			echo 'succes';
			header('Location: Parents.php?login='.$username); 	
		}


}







// 	$sId = explode(" ",$_POST['ht_schoolTeacher']);
// 			// 'Ahmed',NULL,'Emad','2014-2-5','24A Madinet Nasr','aDFe@gmail.com','M',1
// 		if (!mysqli_query($conn, "call signUp_Teacher('$fname','$mname','$lname','$bd','$a','$em','$g','$sId[0]')")) {
// 			header('Location: failsignup.php?type=Teacher');
// 		}
// 		else {
// 			header('Location: signedup.php');
// 		}
// } 

if(isset($_POST['hp_signup']))
{
	$user = $_POST['hp_user'];
	$pass = $_POST['hp_pass'];
	$fname = $_POST['hp_fname'];
	$lname = $_POST['hp_lname'];
	$num = $_POST['hp_num'];
	$a = $_POST['hp_add'];
	$em = $_POST['hp_email'];
		if (!mysqli_query($conn, "call signup_Parent('$user','$pass','$fname','$lname','$num','$a','$em')")) {
			header('Location: failsignup.php?type=Parent'); 	
		}
		else{
			header('Location: Parent.php?login='.$user); 	
		} 
}            


if(isset($_POST['add_phone']))
{
	    $username = htmlspecialchars($_GET['login']);
 
	$phone = $_POST['phone'];
		if (!mysqli_query($conn, "call add_Parent_Mobile('$username','$phone')")) {
			header('Location: failapply.php?type=You have added this phone number already!'); 	
		}
		else{
			header('Location: Parents.php?login='.$username); 	
		} 
}


if(isset($_POST['ht_clear']))
{
	header('Location: signupTeacher.php');
}
if(isset($_POST['ch_clear']))
{
	$username = htmlspecialchars($_GET['login']);
	header('Location: signupChild.php?login='.$username);
}

if(isset($_POST['child_clear']))
{	$username = htmlspecialchars($_GET['login']);
	header('Location: applySchool.php?login='.$username);
}


if(isset($_POST['hp_clear']))
{
	header('Location: signupParent.php');
}

if(isset($_POST['h_logb']))
{		
	$user = $_POST['h_logu'];
	$pass = $_POST['h_logp'];
	$type = $_POST['h_logt'];
	$t = $type;
	if($type == 'Teacher' || $type == 'Administrator')
		$t = 'Employee';
	$temp = mysqli_query($conn, "select * from ".$t."s x where x.username = '$user' and x.password = '$pass'");
	if(!$temp){
    	 header("Location: faillogin.php");
    }
    $temp= mysqli_fetch_row($temp);
    if(!$temp){
    	 header("Location: faillogin.php");
    }
    $tmp= $temp[0]; 
    if (!$tmp) {
    	header("Location: faillogin.php");
    } 
    else if($type == 'Teacher' || $type == 'Administrator')
	{
		include 'database.php';
		$temp = mysqli_query($conn, "select x.id from ".$t."s x where x.username = '$user' and x.password = '$pass'");
		if(!$temp){
    	 header("Location: faillogin.php");
    }
    	$temp= mysqli_fetch_row($temp);
    	if(!$temp){
    	 header("Location: faillogin.php");
    }
    	$temp = $temp[0];
    	if(!$temp){
    	 header("Location: faillogin.php");
    }
    	$temp = mysqli_query($conn, "select x.id from ".$type."s x where x.id = '$temp'");
    	if(!$temp){
			header("Location: faillogin.php");
		}	
    	$temp= mysqli_fetch_row($temp);
    	if(!$temp){
			header("Location: faillogin.php");
		}
    	$temp = $temp[0];
		if(!$temp){
			header("Location: faillogin.php");
		}
		else if($type == 'Teacher')
			header('Location: teacher.php?login='.$user);
		else 
			header('Location: admin.php?login='.$user);
	}
	else if($type == 'Student')
		header('Location: Student.php?login='.$user);
	else if($type == 'Parent')
		header('Location: Parent.php?login='.$user);
}

