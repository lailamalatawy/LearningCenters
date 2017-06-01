<?php include 'database.php';

if(isset($_POST["ht_signup"]))
{	
	$fname = $_POST["ht_fname"];
	$mname = $_POST["ht_mname"];
	$lname = $_POST["ht_lname"];
	$bd = $_POST["ht_bdate"];
	$a = $_POST["ht_address"];
	$em = $_POST["ht_email"];
	$g = $_POST["ht_gen"];
	$sId = explode(" ",$_POST['ht_schoolTeacher']);
			// 'Ahmed',NULL,'Emad','2014-2-5','24A Madinet Nasr','aDFe@gmail.com','M',1
		if (!mysqli_query($conn, "call signUp_Teacher('$fname','$mname','$lname','$bd','$a','$em','$g','$sId[0]')")) {
			header('Location: failsignup.php?type=Teacher');
		}
		else {
			header('Location: signedup.php');
		}
} 

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
			header('Location: Parents.php?login='.$user); 	
		} 
}            

if(isset($_POST['ht_clear']))
{
	header('Location: signupTeacher.php');
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
		header('Location: Parents.php?login='.$user);
}

if(isset($_POST['h_postA']))
{
	$username = $_GET['login'];
    $temp = mysqli_query($conn, "select s.id from Employees s where s.username = '$username' ");
    $temp= mysqli_fetch_row($temp);
    $id = $temp[0]; 
    if (!$id) { die("Query to show fields from table failed"); } 
	$due = $_POST['h_date'];
	$cont = $_POST['h_content'];
	$course = explode(" ",$_POST['h_courseA']);
	$course = $course[0];
	date_default_timezone_set('Africa/Cairo');	
	$post = date('Y-m-d');
	include 'database.php';

	if (!mysqli_query($conn, "call post_Assignment('$course','$post','$due','$cont','$id')")) {
		// header('Location: failPost.php?login='.$username); 	
		echo $course.' '.$due.' '.$cont.' '.$id;
	}
	else{
		header('Location: viewAssignments.php?login='.$username); 	
	} 
}

if(isset($_POST['h_qans'])){
	$tmp = explode("_",$_GET['login']);
	$username = $tmp[0];
	$qid = $tmp[1];
	$ans = $_POST['h_ans'];
	include 'database.php';
	if (!mysqli_query($conn, "call answer_Questions('$qid','$ans')")) {
		header('Location: failPostAns.php?login='.$username); 	
	}
	else{
		header('Location: viewQuestions.php?login='.$username); 	
	} 
}

if(isset($_POST['h_bgrade']))
{
	  $out = explode("_",$_GET['login']);
      $username = $out[0];
      $temp = mysqli_query($conn, "select s.id from Employees s where s.username = '$username' ");
      $temp= mysqli_fetch_row($temp);
      $id = $temp[0]; 
      if (!$id) { die("Query to show fields from table failed"); } 
      $hw = $out[1];
      $ssn = $out[2];
      $course = mysqli_query($conn, "select course_code from Assignments where assignment_id = '$hw'"); 
      $course = mysqli_fetch_row($course);
      $course = $course[0];
      $grade = $_POST['h_grade'];
      $temp = mysqli_query($conn, "call grade_Students_Solutions('$hw','$course','$ssn','$grade')");
      if(!$temp){
      	header('Location: failGrade.php?login='.$username.'_'.$hw);
      }
      else{
      	header('Location: viewAssignment.php?login='.$username.'_'.$hw);
      }
}


if(isset($_POST['h_write']))
{
	$username = $_GET['login'];
	$temp = mysqli_query($conn, "select s.id from Employees s where s.username = '$username' ");
    $temp= mysqli_fetch_row($temp);
    $id = $temp[0]; 
    $c = $_POST['h_repCon'];
    $com = $_POST['h_repComment'];
    $ssn = explode(" ",$_POST['h_rssn']);
    $ssn = $ssn[0];
    date_default_timezone_set('Africa/Cairo');	
    $post = date('Y-m-d');
    // include 'database.php';
	if (!mysqli_query($conn, "call add_Report('$ssn','$post','$c','$com','$id')")) {
		header('Location: failReport.php?login='.$username); 	
	}
	else{
		header('Location: writeReport.php?login='.$username); 	
	} 
}