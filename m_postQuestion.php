<?php include 'database.php'; ?>
<?php  
      $username = htmlspecialchars($_GET['login']);
      $course = htmlspecialchars($_GET['course']);
      //echo $course;
      //$username='yasmine.amr';
      $temp = mysqli_query($conn, "select s.ssn from Students s where s.username = '$username' ");
      $temp= mysqli_fetch_row($temp);
      $ssn= $temp[0]; 
      if (!$ssn) { die("Query to show fields from table failed"); } 
?>




<?php  
if(isset($_POST["ms_postQuestion"]))
{	
	$teacher= mysqli_query($conn, "select s.teacher_id from Course_Student_Teacher s where s.student_ssn = '$ssn' and s.course_code ='$course'");
	$teacher= mysqli_fetch_row($teacher);
	$teacher= $teacher[0];
	if (!$teacher) { die("Query to show fields from table failed"); } 
	$question = $_POST["ms_question"];
	if (!mysqli_query($conn, "call post_Question('$course','$question','$teacher','$ssn')")) {
		header('Location: QuestionFailed.php?login='.$username);
	}
		else {
			header('Location: QuestionSuccessful.php?login='.$username);                                      
		}
}

?>