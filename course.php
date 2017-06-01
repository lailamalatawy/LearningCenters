<?php include 'database.php'; ?>
<?php  
     $username = htmlspecialchars($_GET['login']);
      //$username='yasmine.amr';
     $course= htmlspecialchars($_GET['course']);
      $temp = mysqli_query($conn, "select s.ssn from Students s where s.username = '$username' ");
      $temp= mysqli_fetch_row($temp);
      $ssn= $temp[0]; 
      if (!$ssn) { die("Query to show fields from table failed"); } 
?>
<!DOCTYPE html>
<html lang="en">
<head>
<title>Learn Center</title>
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
<body id="page1">
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
       <?php  
                  echo '<ul id=m_icon><a href="Student.php?login='. $username . '"><li>'.$username.'</a>'.'</li></ul>';
                   echo '<ul id=m_icon><a href="Info.php?login='. $username . '"><li>'.'update my info'.'</a>'.'</li></ul>';
        ?>

      </div>
      <div class="wrapper">
        <h1><a href="index.php" id="logo">Learn Center</a></h1>
      </div>
      <div id="slogan"> Here is where<span>of knowledge for you!</span> </div>
      <ul class="banners">
        <!-- <li><a href="Courses.php"><img src="images/banner1.jpg" alt=""></a></li>
        <li><a href="Activities.php"><img src="images/banner2.jpg" alt=""></a></li> -->
        <?php 
          echo '<li><a href="Question.php?login='. $username . '&course='.$course.'"><img src="buttonsMona/questions.png" alt=""></a></li>';
          echo '<li><a href="Assignment.php?login='. $username .'&course='.$course. '"><img src="buttonsMona/assignments.png" alt=""></a></li>';


         ?>
        
      </ul>
    </header>
    <!-- / header -->
  </div>
</div>

<script type="text/javascript">Cufon.now();</script>
</body>
</html>