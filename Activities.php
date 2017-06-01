<?php include 'database.php'; ?>
<?php  
      $username = htmlspecialchars($_GET['login']);

      //$username='yasmine.amr';
      $temp = mysqli_query($conn, "select s.ssn from Students s where s.username = '$username' ");
      $temp= mysqli_fetch_row($temp);
      $ssn= $temp[0]; 
      if (!$ssn) { die("Query to show fields from table failed"); } 
?>
<html lang="en">
<head>
<title>Learn Center | Activities</title>
<meta charset="utf-8">
<link rel="stylesheet" href="css/reset.css" type="text/css" media="all">
<link rel="stylesheet" href="css/layout.css" type="text/css" media="all">
<link rel="stylesheet" href="css/style.css" type="text/css" media="all">
<script type="text/javascript" src="js/jquery-1.5.2.js" ></script>
<script type="text/javascript" src="js/cufon-yui.js"></script>
<script type="text/javascript" src="js/cufon-replace.js"></script>
<script type="text/javascript" src="js/Molengo_400.font.js"></script>
<script type="text/javascript" src="js/Expletus_Sans_400.font.js"></script>
<!--[if lt IE 9]>
<script type="text/javascript" src="js/html5.js"></script>
<style type="text/css">.bg, .box2{behavior:url("js/PIE.htc");}</style>
<![endif]-->
</head>
<body id="page3">
<div class="body1">
  <div class="main">
    <!-- header -->
    <header>
      <div class="wrapper">
        <nav>
          <ul id="menu">
            <li><a href="#">About</a></li>
            <li><a href="#">Courses</a></li>
            <li><a href="#">Programs</a></li>
            <li><a href="#">Teachers</a></li>
            <li><a href="#">Admissions</a></li>
            <li class="end"><a href="schools.php">Schools</a></li>
          </ul>
        </nav>

       <!--  <ul id="m_icon">
          		<li><a href="student.php"><?php echo $username ?></a></li>
        		</ul> -->

        
        
     
     <?php  
                	echo '<ul id=m_icon><a href="Student.php?login='. $username . '"><li>'.$username.'</a>'.'</li></ul>';
                   echo '<ul id=m_icon><a href="Info.php?login='. $username . '"><li>'.'update my info'.'</a>'.'</li></ul>';
        ?>

         </div>

      <div class="wrapper">
        <h1><a href="index.php" id="logo">Learn Center</a></h1>
      </div>
      <div id="slogan"> We Will Open The World<span>of knowledge for you!</span> </div>
    </header>
    <!-- / header -->
  </div>
</div>
<div class="body2">
  <div class="main">
    <!-- content -->
    <section id="content">
      <div class="box1">
        <div class="wrapper">
          <article class="col1">
            <div class="pad_left1">
              <h2 class="pad_bot1">Activities</h2>
            </div>
            <form id="ContactForm" action ="m_action.php?login=<?php echo $username; ?>" method="post">
                <div  class="wrapper"> <strong>ID:</strong>
                    <div class="bg">
                     <select name ="ms_act">
            <?php $result = mysqli_query($conn, "call view_Activity($ssn)"); 
                if (!$result) { die("Query to show fields from table failed"); }
                while($row = mysqli_fetch_row($result)){
                      echo '<option>'.$row[0].'</option>';
                    } 
            ?>
                      </select>
                    </div>
                    <input type="submit" name ="ms_join" class="button" value = "Join"></input>
                  </div>
                  </form>
                
<?php
                include 'database.php';
                $result = mysqli_query($conn, "call view_Activity($ssn)"); 
                while($row = mysqli_fetch_row($result)){

			         	echo '<div class="wrapper pad_bot2">';
                echo '<p class="pad_bot1 pad_top2"><strong>Event: </strong>'.$row[5].'<br></p>';
                 echo '<p class="pad_bot1 pad_top2"><strong>Event ID: </strong>'.$row[0].'<br></p>';
                 echo '<p class="pad_bot1 pad_top2"><strong>Event Type: </strong>'.$row[1].'<br></p>';
                echo '<p class="pad_bot1 pad_top2"><strong>'.$row[4].'</strong></p>';
                echo '<p class="pad_bot1 pad_top2"><strong>When? : </strong>'.$row[2].'<br><strong>Where?: </strong>'.$row[3].'<br>'.'<strong>Teacher : </strong>'.$row[8].' '.$row[9].' '.$row[10].'</p></div>';
                echo '<p class="pad_bot1 pad_top2"><strong>--------------------------------------- </strong>';

                
                	// echo '<p id=m_courses><strong><a href="activity.php?act='.$row[0].'</p>';
                	// echo '<p id=m_courses><strong><a href="activity.php">'.$row[0].': '.'</strong>'.$row[5].'</p>';
                           		
               		

               }
      ?>

          </article>
         
      </div>
    </section>
  </div>
</div>
<script type="text/javascript">Cufon.now();</script>
</body>
</html>