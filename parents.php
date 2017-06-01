<?php  include 'database.php'; ?>
<?php  
      $username = htmlspecialchars($_GET['login']);
      // echo $username;
      //$username='yasmine.amr';
      // $temp = mysqli_query($conn, "select s.ssn from Students s where s.username = '$username' ");
      // $temp= mysqli_fetch_row($temp);
      // $ssn= $temp[0]; 
      // if (!$ssn) { die("Query to show fields from table failed"); } 
?>

<!DOCTYPE html>
<html lang="en">
            
          
<head>
<title>Learn Center | Parent Home</title>
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
      // $username = $_POST('login');
      // $username='mama';
      // $temp = mysqli_query($conn, "select s.ssn from Students s where s.username = '$username' ");
      // $temp= mysqli_fetch_row($temp);
      // $ssn= $temp[0]; 
      // if (!$ssn) { die("Query to show fields from table failed"); } 
?>
         <ul id="icons">
          <li><a href="parents.php"><?php echo $username ?></a></li></ul>
          <!-- <li><a href="#"><img src="images/icons2.jpg" alt=""></a></li> -->
         
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
              <h2 class="pad_bot1">We Scare Because We Care</h2>
            </div>
            <div class="wrapper pad_bot2">
              <figure class="left marg_right1"><img src="images/page3_img1.jpg" alt=""></figure>
              <p class="pad_bot1 pad_top2"><strong>The MORE the MERRIER</strong> <br>
                Too lazy to go through the governmental procedures to sign up your child? Finding yourself procrastinating over and over again? We made it simple for you! Just Click "Add child" and we will spare you this immense effort! Extra special service for each child named Mariem ;)</p>
                   <?php echo '<a href="signupChild.php?login='.$username.'" class="button marg_left1"><span><span>Add child</span></span></a>'; ?>
               <!--  '<li><a href="Clubs.php?login='. $username . '"><img src="images/banner3.jpg" alt=""></a></li>'
              <a href="addChild.php" class="button marg_left1"><span><span>Add child</span></span></a> </div>
 -->            <div class="wrapper pad_bot2">
              <figure class="left marg_right1"><img src="images/page3_img2.jpg" alt=""></figure>
              <p class="pad_bot1 pad_top2"><strong>Apply Now!</strong> <br>
              Feeling even lazier to apply for him/her at some school? Finding yourself favoring having an ignorant child rather than going the painstaking process of signing up? Well! click Apply child and we will do it for you!</p>
            <?php echo '<a href="applySchool.php?login='.$username.'" class="button marg_left1"><span><span>Apply for child</span></span></a>'; ?>
   
                      </article>
          <article class="col2 pad_left2">
            <div class="pad_left1">
              <h2>Services</h2>
            </div>
            <ul class="list1">
              <?php echo '<li><a href="acceptingSchools.php?login='.$username.'">View Accepting Schools</a></li>'; ?>
              <?php echo '<li><a href="childTeacher.php?login='.$username.'">View Child(ren)`s Teachers</a></li>'; ?>
              <?php echo '<li><a href="childSchools.php?login='.$username.'">View Child(ren)`s Schools</a></li>'; ?>
              <?php echo '<li><a href="viewReports.php?login='.$username.'">View Child(ren)`s Reports</a></li>'; ?>
              <?php echo '<li><a href="viewSchoolReviews.php?login='.$username.'">View your school`s reviews</a></li>'; ?>
              <?php echo '<li><a href="addPhoneNumber.php?login='.$username.'">Add Phone Numbers</a></li>'; ?>
            </ul>
            <div class="pad_left1">
              <h2>Testimonials</h2>
              <p class="quot"> <span><strong><a href="#">Mariem Hesham Kandil</a></strong></span> <span class="color1">Website Director</span> To all of the dismal children out there, wishing you a speedy and joyful educational phase, from your concerned teacher, Professor Mariem Kandil, Order of Merlin, Third Class, Honorary Member of the Dark Force Defence League and five-time winner of Witch Weekly's Most-Charming-Smile Award. </p>
            </div>
           </article>
        </div>
      </div>
    </section>
    <!-- content -->
    <!-- footer -->
    <footer>
      
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