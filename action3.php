<?php include 'database.php';

 
      $username = htmlspecialchars($_GET['login']);

                $result5 = mysqli_query($conn, "call view_all_Schools()"); 
                if (!$result5) {  }else{

                while($row = mysqli_fetch_row($result5)){
                $val = $row[1];
              if(isset($_POST[$val])){
                $review=$_POST['ch_review'];
               		header('Location: action4.php?type='.$val.'%'.$username.'%'.$review);
					break;               	}}}

               		?>

