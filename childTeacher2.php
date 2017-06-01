<?php include "database.php"; 
?>
<?php  
      $all = htmlspecialchars($_GET['login']);
      $all2 = explode(" ",$all);
     $username=$all2[0];
     $tID=$all2[1];
      // echo $username;
      //$username='yasmine.amr';
      // $temp = mysqli_query($conn, "select s.ssn from Students s where s.username = '$username' ");
      // $temp= mysqli_fetch_row($temp);
      // $ssn= $temp[0]; 
      // if (!$ssn) { die("Query to show fields from table failed"); } 
?>
 <?php 
              //   $result = mysqli_query($conn, "select * from Teachers"); 
              //   if (!$result) { die("1.Query to show fields from table failed"); }
              //   while($row = mysqli_fetch_row($result)){
              //   $val = $row[0];
              // if(isset($_POST[$val])){
              //   $rating=$_POST['rate:'];
              //   echo $val.' '.$username.' '.$rating;
              //   $result = mysqli_query($conn, "call rate_Teacher('$val','$username','$rating')"); 
              //   if (!$result) { die("2.Query to show fields from table failed"); }
              // }}

?>

<!DOCTYPE html>
<html lang="en">
<head>
<title>Learn Center | Teachers</title>
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
<body id="page4">
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
              <h2 class="pad_bot1">Teacher's current Rating</h2>
            </div>
            <?php 

              echo '<figure class="left marg_right1"><img src="images/page4_img2.jpg" alt=""></figure>';
                  echo '<p class="pad_bot1 pad_top2"><strong>'.$all2[2].' '.$all2[3].' '.$all2[4].'</strong> <br></p>';
                  $out=0;

                  $result4=mysqli_query($conn, "call calc_Overall_Rating('$tID')");
                   if (!$result4) { die("Query to show fields from table failed"); }
                while($row = mysqli_fetch_row($result4)){
                    $out=$row[0];
                  }
                  // echo $result4.'hello';
                  // if (!$result4) { die("Query to show fields from table failed"); }
                  // $row = mysqli_fetch_row($result4);
                  // $result2=$row[0];
                  if($out == 0 || $out == ''){
                    $out = 'no rating available';
                  }
                  echo '<strong>Average Rating: </strong>'.$out.'<br>';
               echo '<form action = "rateTeacher.php?login='.$all.'" method = "post">
               <strong> Set Rating: <input type="text" name="rate:" placeholder="On a scale from 1-10"/><br>
               <span><span><input class="button marg_left1" type="submit" name="rate" value="Rate Now!"/></span></span></div></form>';
              
      ?>


            <div class="wrapper">
              <article class="call"> <span class="call1"></span><span class="call2"></span> </article>
              <article class="col_4 pad_left2">Copyright &copy; <a href="#">Mariem Kandil Co.</a> All Rights Reserved<br>
                Design by <a target="_blank" href="http://www.templatemonster.com/">TemplateMonster.com</a></article>
            </div>
          </div>
        </div>
      </div>
    </footer>
    <!-- / footer -->
  </div>
</div>
<script type="text/javascript">Cufon.now();</script>
</body>
</html>