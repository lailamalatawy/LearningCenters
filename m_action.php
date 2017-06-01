<?php include 'database.php'; ?>
<?php  
      $username = htmlspecialchars($_GET['login']);

      //$username='yasmine.amr';
      $temp = mysqli_query($conn, "select s.* from Students s where s.username = '$username' ");
      $temp= mysqli_fetch_row($temp);
      $ssn= $temp[0]; 
      $sc_id= $temp[8];
      if (!$ssn) { die("Query to show fields from table failed"); } 
?>




<?php  
if(isset($_POST["ms_submit"]))
{	
	$name = $_POST["ms_name"];
	$bd = $_POST["ms_bdate"];
	$g = $_POST["ms_gender"];
	$pass= $_POST["ms_pass"];
	 // $sId = explode(" ",$_POST['ht_schoolTeacher']);
		// 	 'Ahmed',NULL,'Emad','2014-2-5','24A Madinet Nasr','aDFe@gmail.com','M',1 
	if (!mysqli_query($conn, "call update_Account_Info('$ssn', '$name','$g', '$bd', '$pass')")) {
		// echo "<span class='h_signupmes'>Update failed!</span>"; 
		header('Location: failedUpdate.php?login='.$username);                                      
	}
		else {
			// echo "<span class='h_signupmes'>Updated successfully!</span>"; 
			header('Location: Updated.php?login='.$username);

		}
}

?>

<?php  
if(isset($_POST["ms_join"]))
{	
	$act = $_POST["ms_act"];
	
	 // $sId = explode(" ",$_POST['ht_schoolTeacher']);
		// 	 'Ahmed',NULL,'Emad','2014-2-5','24A Madinet Nasr','aDFe@gmail.com','M',1 
	if (!mysqli_query($conn, "call apply_Activity('$act','$ssn')")) {
		// echo "<span class='h_signupmes'>Update failed!</span>"; 
		header('Location: failedJoin.php?login='.$username);                                      
	}
		else {	
			// echo "<span class='h_signupmes'>Updated successfully!</span>"; 
			header('Location: joined.php?login='.$username);

		}
}

?>


<?php  
if(isset($_POST["ms_club"]))
{	
	$club = $_POST["ms_cl"];
	
	 // $sId = explode(" ",$_POST['ht_schoolTeacher']);
		// 	 'Ahmed',NULL,'Emad','2014-2-5','24A Madinet Nasr','aDFe@gmail.com','M',1 
	if (!mysqli_query($conn, "call join_Club('$sc_id','$club','$ssn')")) {
		// echo "<span class='h_signupmes'>Update failed!</span>"; 
		header('Location: failedJoin.php?login='.$username);                                      
	}
		else {
			// echo "<span class='h_signupmes'>Updated successfully!</span>"; 
			header('Location: joined.php?login='.$username);

		}
}

?>