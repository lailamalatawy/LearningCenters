<?php include 'database.php'; ?>

<html lang="en">
<head>
<title>Learn Center</title>
<meta charset="utf-8">
<link rel="stylesheet" href="css/reset.css" type="text/css" media="all">
<link rel="stylesheet" href="css/layout.css" type="text/css" media="all">
<link rel="stylesheet" href="css/style.css" type="text/css" media="all">
<script type="text/javascript" src="js/jquery-1.5.2.js" ></script>
<script type="text/javascript" src="js/cufon-yui.js"></script>
<script type="text/javascript" src="js/cufon-replace.js"></script>
<script type="text/javascript" src="js/Molengo_400.font.js"></script>
<script type="text/javascript" src="js/Expletus_Sans_400.font.js"></script>
<!--[if lt IE 9]
<script type="text/javascript" src="js/html5.js"></script>
<style type="text/css">.bg, .box2{behavior:url("js/PIE.htc");}</style>
<![endif]-->
</head>
<body id="page1">
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
        <ul id="icon">
          <li><a href="#"><img src="images/icon1.jpg" alt=""></a></li>
          <li><a href="#"><img src="images/icon2.jpg" alt=""></a></li>
          <li><a href="#"><img src="images/icon3.jpg" alt=""></a></li>
        </ul>
      </div>
      <form id="ContactForm" method="post" action="action.php">
      <div class="wrapper">
        <h1><a href="index.php" id="logo">Learn Center</a></h1>
      </div>
      <div id="slogan"> We Will Open The World<span>of knowledge for you!<br><br>Log in:<br></span> </div>
      <span><br></span>
      <div  id="menu"> <strong>Username:</strong>
        <div class="bg">
        <input type="text" name ="h_logu" class="input" maxlength="50" required="">
        </div>
      </div>
      <div  id="menu"> <strong>Password:</strong>
        <div class="bg">
        <input type="password" name ="h_logp" class="input" maxlength="50" required="">
        </div>
      </div>
           <div  id="menu"> <strong>As a(n)</strong>
                    <input type="radio" name="h_logt" value="Student" checked> Student
                    <input type="radio" name="h_logt" value="Parent"> Parent
                    <input type="radio" name="h_logt" value="Teacher"> Teacher
                    <input type="radio" name="h_logt" value="Administrator"> Administrator
                            <br />
            <input class= "left" class= "button" type="submit" name="h_logb" value="Log In"/>
            </div>
      </form>
    </header>
    <!-- / header -->
  </div>
</div>

<script type="text/javascript">Cufon.now();</script>
</body>
</html>