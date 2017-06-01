<?php  include 'database.php'; ?>
<html lang="en">
<head>
<title>Learn Center | Sign Up Parent</title>
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
              <h2>Sign Up As a Parent</h2>
              <form id="ContactForm" action="action.php" method="post">
                <div>
                 <div  class="wrapper"> <strong>Username:</strong>
                    <div class="bg">
                      <input type="text" name ="hp_user" class="input" maxlength="50" required="">
                    </div>
                  </div>
                   <div  class="wrapper"> <strong>Password:</strong>
                    <div class="bg">
                      <input type="password" name ="hp_pass" class="input" maxlength="20" required="">
                    </div>
                  </div>
                  <div  class="wrapper"> <strong>First Name:</strong>
                    <div class="bg">
                      <input type="text" name ="hp_fname" class="input" maxlength="20" required="">
                    </div>
                  </div>
                  <div  class="wrapper"> <strong>Last Name:</strong>
                    <div class="bg">
                      <input type="text" name ="hp_lname" class="input" maxlength="20" required="">
                    </div>
                  </div>
                  <div  class="wrapper"> <strong>Landline Number:</strong>
                    <div class="bg">
                      <input type="number" name ="hp_num" class="input" maxlength="10" required="">
                    </div>
                  </div>
                  <div  class="wrapper"> <strong>Address:</strong>
                    <div class="bg">
                      <input type="text" name ="hp_add" class="input" maxlength="80" required="">
                    </div>
                  </div>
                  <div  class="wrapper"> <strong>Email:</strong>
                    <div class="bg">
                      <input type="email" name ="hp_email" class="input" maxlength="40" required="">
                    </div>
                  </div>
                  <span><span><input type="submit" name ="hp_clear" class="button" value = "Clear"></input></span></span>
                  <span><span><input type="submit" name ="hp_signup" class="button" value = "Sign Up"></input> </span></span>
                  </div>
              </form>
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