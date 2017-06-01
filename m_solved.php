<?php include 'database.php'; ?>
<?php  
      $username = htmlspecialchars($_GET['login']);
      $course= htmlspecialchars($_GET['course']);
      $id= htmlspecialchars($_GET['id']);
      //$username='yasmine.amr';
      $temp = mysqli_query($conn, "select s.ssn from Students s where s.username = '$username' ");
      $temp= mysqli_fetch_row($temp);
      $ssn= $temp[0]; 
      if (!$ssn) { die("Query to show fields from table failed"); } 
?>




<?php  
if(isset($_POST["ms_solve"]))
{	
	$sol = $_POST["ms_sol"];
	
	if (!mysqli_query($conn, "call solve_Assignment('$id','$course','$ssn','$sol')")) {
		// echo "<span class='h_signupmes'>Update failed!</span>"; 
		header('Location: QuestionFailed.php?login='.$username);                                      
	}
		else {
			// echo "<span class='h_signupmes'>Updated successfully!</span>"; 
			header('Location: QuestionSuccessful.php?login='.$username);

		}
}

?>