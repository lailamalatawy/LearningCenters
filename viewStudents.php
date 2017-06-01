<?php include 'database.php'; 
      $username = $_GET['login'];
      $temp = mysqli_query($conn, "select s.id from Employees s where s.username = '$username' ");
      $temp= mysqli_fetch_row($temp);
      $id = $temp[0]; 
      if (!$id) { die("Query to show fields from table failed"); } 
?> 

<html lang="en">
<head>
<title>Learn Center | My Students</title>
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
              <h2 class="pad_bot1">Students</h2><br>
            </div>
            <?php $count = 0;
                $result = mysqli_query($conn, "call view_My_Students('$id')"); 
                if (!$result) { die("Query to show fields from table failed"); }
                while($row = mysqli_fetch_row($result)){
                  if($row[7] != $count){
                    $count = $row[7];
                    echo '<div class="wrapper pad_bot2">';
                    echo '<div id="h_font1">Grade '.$row[7].'</div><br>';
                  }
                  echo '<div class="wrapper pad_bot2">';
                  echo '<figure class="left marg_right1"><img src="images/student.png" alt=""></figure>';
                  echo '<p class="pad_bot1 pad_top2"><strong>'.$row[1].'</strong></p>';
                  echo '<p class="pad_bot1 pad_top2">SSN: '.$row[0].'</p>';
                  echo '<p class="pad_bot1 pad_top2">'.$row[2].' years old</p>';
                  echo '<p class="pad_bot1 pad_top2">Born on '.$row[4].'</p>';

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