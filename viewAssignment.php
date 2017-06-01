

<?php include 'database.php'; 
      $out = explode("_",$_GET['login']);
      $username = $out[0];
      $temp = mysqli_query($conn, "select s.id from Employees s where s.username = '$username' ");
      $temp= mysqli_fetch_row($temp);
      $id = $temp[0]; 
      if (!$id) { die("Query to show fields from table failed"); } 
      $hw = $out[1];
?> 

<html lang="en">
<head>
<title>Learn Center | Assignments</title>
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
        <?php  
                  echo '<ul><a href="teacher.php?login='. $username.'"><li>'.$username.'</a></li></ul>';
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
              <h2 class="pad_bot1">Assignment # <?php echo $hw; ?></h2><br>
              <p>
                <?php
                  $result = mysqli_query($conn, "select * from Assignments where assignment_id = '$hw'"); 
                  $result = mysqli_fetch_row($result);
                  echo '<strong>Course Code: </strong>'.$result[1].'<br>';
                  echo '<strong>Posting Date: </strong>'.$result[2].'<br>';
                  echo '<strong>Due Date: </strong>'.$result[3].'<br><br>';
                  echo '<strong>Q: </strong>'.$result[4];
                ?>
              </p>
              <h2>Students' Solutions</h2>
            </div>
            <?php $count = 0;
                $result = mysqli_query($conn, "call view_Students_Solutions('$id','$hw')"); 
                if (!$result) { die("Query to show fields from table failed"); }
                while($row = mysqli_fetch_row($result)){
                  echo '<div class="wrapper pad_bot2">';
                  echo '<figure class="left marg_right1"></figure>';
                  echo '<p class="pad_bot1 pad_top2"><strong>SSN: </strong>'.$row[0].'</p>';
                  echo '<p class="pad_bot1 pad_top2"><strong>Solution: </strong>'.$row[3].'</p>';
                  echo '<p class="pad_bot1 pad_top2"><strong>Grade: </strong></p>';
                   echo '<form id = "ContactForm" action = "action.php?login='.$username.'_'.$hw.'_'.$row[0].'" method = "post">
                    <div class="h_wrapper"><div class="bg"> <input class = "h_input" type="text" name ="h_grade" required="" value = "'.$row[4].'"></input> </div> 
                    <input class="button right" name = "h_bgrade" type="submit" value="Grade Solution"></div></form>';
                  echo '----------------------------------------------<br>';
               }
      ?>
          </article>
          <article class="col2 pad_left2">
            <div class="pad_left1">
              <h2>Dashboard</h2>
            </div>
            <ul class="list1 pad_bot1">
              <li><a href="teacherCourses.php?login=<?php echo $username; ?>">View My Courses</a></li>
              <li><a href="viewAssignments.php?login=<?php echo $username; ?>">View Assignments</a></li>
              <li><a href="writeReport.php?login=<?php echo $username; ?>">Write Report</a></li>
              <li><a href="viewQuestions.php?login=<?php echo $username; ?>">View Questions</a></li>
              <li><a href="viewStudents.php?login=<?php echo $username; ?>">View My Students</a></li>              
            </ul>
            <!-- <a href="#" class="button"><span><span>Read More</span></span></a>
            <a href="#" class="button"><span><span>Read More</span></span></a>  -->
            </article>
      </div>
    </section>
  </div>
</div>
<script type="text/javascript">Cufon.now();</script>
</body>
</html>