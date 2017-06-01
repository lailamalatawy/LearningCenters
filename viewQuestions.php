<?php include 'database.php'; 
      $username = $_GET['login'];
      $temp = mysqli_query($conn, "select s.id from Employees s where s.username = '$username' ");
      $temp= mysqli_fetch_row($temp);
      $id = $temp[0]; 
      if (!$id) { die("Query to show fields from table failed"); } 
      if(!array_key_exists('h_courseA', $_POST)){
     $tmp = mysqli_query($conn, "select distinct s.course_code,c.course_name from Course_Student_Teacher s inner join Courses c on s.course_code = c.course_code where s.teacher_id = '$id'");
      $tmp = mysqli_fetch_row($tmp);
      $_POST['h_courseA'] = $tmp[0].' '.$tmp[1];
    }
?> 

<html lang="en">
<head>
<title>Learn Center | Questions</title>
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
           <form action="viewQuestions.php?login=<?php echo $username; ?>" method= "post">

          <article class="col1">
            <div class="pad_left1">
              <h2 class="pad_bot1">Questions</h2><br>

                        <select name = "h_courseA" autofocus="">
                        <?php $tmp = mysqli_query($conn, "select distinct s.course_code,c.course_name from Course_Student_Teacher s inner join Courses c on s.course_code = c.course_code where s.teacher_id = '$id'");
                           if (!$tmp) {
                            die("Query to show fields from table failed"); }  
                            while($row = mysqli_fetch_row($tmp)) {
                              $str = "<option ";
                              if($_POST['h_courseA'] == $row[0].' '.$row[1])
                                $str = $str."selected";
                                echo $str." class= 'wrapper'>$row[0] $row[1]</option>";
                            }
                        ?>
                        </select>
                        <br>
                        <br>
                        <span><span><input type="submit" class="button" value = "View Questions"></input></span></span></form>
            </div>
            <?php
            include 'database.php';
             $res = explode(" ",$_POST['h_courseA']);
               $res = $res[0];
                $result = mysqli_query($conn, "call view_Questions('$id','$res')"); 
                if (!$result) { die("Query to show fields from table failed"); }
                while($row = mysqli_fetch_row($result)){
                  echo '<div class="wrapper pad_bot2">';
                  echo '<figure class="left marg_right1"></figure>';
                  echo '<p class="pad_bot1 pad_top2"><strong>Question: </strong>'.$row[0].'</p>';
                  echo '<p class="pad_bot1 pad_top2"><strong>By: </strong>'.$row[3].'</p>';
                  echo '<p class="pad_bot1 pad_top2"><strong>Answer: </strong></p>';
                   echo 
                   '<form id = "ContactForm" action = "action.php?login='.$username.'_'.$row[1].'" method = "post">
        
                    <div class="h_wrapper"><div class="bg"> <input class = "h_input" type="text" placeholder = "Write answer here" name ="h_ans" required="" value = "'.$row[2].'"></input> </div> 
                    <input class="button right" name = "h_qans" type="submit" value="Post Answer"></div></form>';
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