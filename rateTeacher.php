<?php include 'database.php';

   $all = htmlspecialchars($_GET['login']);
      $all2 = explode(" ",$all);
     $username=$all2[0];
     $tID=$all2[1];

                
              if(isset($_POST['rate'])){
                $rating=$_POST['rate:'];
               if (! mysqli_query($conn, "call rate_Teacher('$tID','$username','$rating')")) 
                {
			header('Location: failapply.php?type=It seems like there is a problem please refer to Mariem Kandil!'); 	
		}
		else{
			echo 'succes';
			header('Location: childTeacher2.php?login='.$all); 	
		}
              }
?>