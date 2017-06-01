<?php include 'database.php'; 
 $username = htmlspecialchars($_GET['login']);

       
?>



<html lang="en">
<head>
<title>Learn Center | Child(ren)'s School(s)</title>
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
                  echo '<ul id=m_icon><a href="Parents.php?login='. $username . '"><li>'.$username.'</a>'.'</li></ul>'; ?>
        
        <ul id="icons">
          <li><a href="#"><img src="images/icons1.jpg" alt=""></a></li>
          <li><a href="#"><img src="images/icons2.jpg" alt=""></a></li>
        </ul>
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
              <h2 class="pad_bot1">Your child(ren)'s school(s)</h2>
            </div>
            
          <?php $result = mysqli_query($conn, "call view_School2('$username')"); 
                if (!$result) { die("Query 2 to show fields from table failed"); }
                while($row = mysqli_fetch_row($result)){
                echo '<div class="wrapper pad_bot2">';
                  echo '<figure class="left marg_right1"><img src="images/school.jpg" alt=""></figure>';
                  echo '<p class="pad_bot1 pad_top2"><strong>'.$row[0].' </strong> is enrolled in  <br>'.$row[3].'</p>';
                  
               echo '<form action = "action3.php?login='.$username.'" method = "post">
               <div>
                  <strong>Write A Review:</strong>
                    <div class="bg">
                      <input type="text" name ="ch_review" class="input" maxlength="100"  placeholder="Write a review here!">
                   
                  </div> 
 <input class="button marg_left1" type="submit" name='.$row[2].' value="Add Review"/></div></form>';
               }
      ?>     </article>
          
      </div>
    </section>
  </div>
</div>
<script type="text/javascript">Cufon.now();</script>
</body>
</html>