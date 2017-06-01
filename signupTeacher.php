<?php  include 'database.php'; ?>

<html lang="en">
<head>
<title>Learn Center | Sign Up Teacher</title>
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
<body id="page5">
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
              <h2>Sign Up As a Teacher</h2>
              <form id="ContactForm" action ="action.php" method="post">
                <div>
                  <div  class="wrapper"> <strong>First Name:</strong>
                    <div class="bg">
                      <input type="text" name ="ht_fname" class="input" maxlength="20" required="">
                    </div>
                  </div>
                  <div  class="wrapper"> <strong>Middle Name:</strong>
                    <div class="bg">
                      <input type="text" name ="ht_mname" class="input" maxlength="20" required="">
                    </div>
                  </div>
                  <div  class="wrapper"> <strong>Last Name:</strong>
                    <div class="bg">
                      <input type="text" name ="ht_lname" class="input" maxlength="20" required=""> 
                    </div>
                  </div>
                  <div  class="wrapper"> <strong>Gender:</strong>
                    <div class="bg">
                      <select name ="ht_gen" required=""> <option>M</option> <option>F</option></select>
                    </div>
                  </div>
                  <div  class="wrapper"> <strong>Address:</strong>
                    <div class="bg">
                      <input type="text" name ="ht_address" class="input" maxlength="50" required="">
                    </div>
                  </div>
                  <div  class="wrapper"> <strong>Email:</strong>
                    <div class="bg">
                      <input type="email" name ="ht_email" class="input" maxlength="50" required="">
                    </div>
                  </div>
                  <div  class="wrapper"> <strong>Birth Date:</strong>
                    <div class="bg">
                      <input type="date" name ="ht_bdate" class="input" required="">
                    </div>
                  </div>
                   <div  class="wrapper"> <strong>School:</strong> 
                    <div class="bg">
                      <select name="ht_schoolTeacher">
                      <?php $tmp = mysqli_query($conn, "select s.school_id, s.name from Schools s");
                         if (!$tmp) {
                          die("Query to show fields from table failed"); }  
                          while($row = mysqli_fetch_row($tmp)) {
                              echo "<option class= 'wrapper'>$row[0] $row[1]</option>";
                          }
                      ?>
                      </select>
                    </div>
                  </div>
                  
                  <span><span><input type="submit" name ="ht_clear"  class="button" value = "Clear"></input></span></span>
                  <span><span><input type="submit" name ="ht_signup" class="button" value = "Sign Up"></input> </span></span>
                  </form>
                  </div>
            </div>
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