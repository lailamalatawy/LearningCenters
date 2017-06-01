<?php include 'database.php'; 
      $username = htmlspecialchars($_GET['login']);
?>
<!DOCTYPE html>
<html lang="en">
<head>
<title>Learn Center | Home</title>
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
<body id="page2">
<div class="body1">
  <div class="main">
    <!-- header -->
    <header>
      <div class="wrapper">
        <nav>
          <ul id="menu">
            <li><a href="index.html">About</a></li>
            <li><a href="courses.html">Courses</a></li>
            <li><a href="programs.html">Programs</a></li>
            <li><a href="teachers.html">Teachers</a></li>
            <li><a href="admissions.html">Admissions</a></li>
            <li class="end"><a href="contacts.html">Contacts</a></li>
          </ul>
        </nav>
         <?php  
                  echo '<ul><a href="teacher.php?login='. $username.'"><li>'.$username.'</a></li></ul>';
        ?>
        
      </div>
      <div class="wrapper">
        <h1><a href="index.html" id="logo">Learn Center</a></h1>
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
              <h2 class="pad_bot1">Wit beyond Measure is Man's greatest pleasure</h2>
            </div>
            <div class="wrapper pad_bot1">
              <figure class="left marg_right1"><img src="images/inside.jpg" alt=""></figure>
              <p class="pad_bot1 pad_top2"><strong></strong></p>
              <p> Ever felt like you have got the lousiest job in the world? Ever stopped yourself for a moment and thought "Six Years Of Drama School For This?"- (in the Inside Out clown mind voice). Well it might have escaped your notice, but life is not fair!(in Severus Snape's voice). No seriously everyone have their ups and downs everyday, the good news is Winter Break is almost here!</p>
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
      </div>
    </section>
    <!-- content -->
  </div>
</div>
<script type="text/javascript">Cufon.now();</script>
</body>
</html>