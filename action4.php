<?php include 'database.php';
  // echo 'helloooo';
      if(isset($_POST['viewReport'])){
         // echo 'hurry';
        $all1 = htmlspecialchars($_GET['logins']);
        // echo $all1;
        $all2 = explode(" ",$all1);
        $username=$all2[0];
        $reportID=$all2[1];
        $ssn=$all2[2];

        $reply=$_POST['reply'];
        // echo $username.' '.$reportID;
    if (!mysqli_query($conn, "call replyTo_Report('$username','$reportID','$ssn','$reply')")) {
                header('Location: failapply.php?type=Something went wrong please try again');   
              }else{
                // echo 'yay';
                header('Location: parents.php?login='.$username);
                 }


      }
else  if(isset($_POST['delete'])){
         // echo 'hurry';
        $all1 = htmlspecialchars($_GET['login']);
        // echo $all1;
        $all2 = explode(" ",$all1);
        $username=$all2[0];
        $school_id=$all2[1];

        // echo $username.' '.$reportID;
    if (!mysqli_query($conn, "call delete_School_Review('$school_id','$username')")) {
                header('Location: failapply.php?type=Something went wrong please try again');   
              }else{
                // echo 'yay';
                header('Location: parents.php?login='.$username);
                 }


      }
      else{ 

           $all = htmlspecialchars($_GET['type']);
        $all2 = explode("%",$all);
        $val=$all2[0];
        $username=$all2[1];
        $review=$all2[2];
             if (!mysqli_query($conn, "call write_School_Review('$val','$username','$review')")) {
                header('Location: failapply.php?type=Something went wrong please try again');   
              }else{
                // echo 'yay';
              	header('Location: parents.php?login='.$username);
                 }
                 
          
            }

             
?>