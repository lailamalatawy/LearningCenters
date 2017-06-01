<?php include 'database.php'; ?>
<?php  
      $username = htmlspecialchars($_GET['login']);
      $course = htmlspecialchars($_GET['course']);

      //$username='yasmine.amr';

      $temp = mysqli_query($conn, "select s.ssn from Students s where s.username = '$username' ");
      $temp= mysqli_fetch_row($temp);
      $ssn= $temp[0]; 
      if (!$ssn) { die("Query to show fields from table failed"); } 
?>
<html lang="en">
<head>
<title>Learn Center | Question</title>
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
              <h2 class="pad_bot1">Questions</h2>
            </div>
            <form id="ContactForm" action ="m_postQuestion.php?login=<?php echo $username.'&course='.$course; ?>" method="post">
                
                    
                    <div  class="wrapper"> <strong>Question:</strong>
                    <div class="bg">
                      <input type="text" name ="ms_question" class="input" maxlength="50">
                    </div>
                  </div>
                    <input type="submit" name ="ms_postQuestion" class="button" value = "Post"></input>
                  </div>
                  
                  </form>
                
<?php
                $result = mysqli_query($conn, "call view_Questions_And_Answers($course)"); 
                while($row = mysqli_fetch_row($result)){

                echo '<div class="wrapper pad_bot2">';
                echo '<p class="pad_bot1 pad_top2"><strong> '.$row[0].'</strong><br></p>';
                 echo '<p class="pad_bot1 pad_top2">'.$row[1].'<br></p></div>';
                
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