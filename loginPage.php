<?php include 'database.php'; ?>

<html lang="en">
<head>
<title>Learn Center | Login</title>
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
              <h2 class="pad_bot1">Schools</h2>
            </div>
            
           <?php 
                $username = $_POST('login');

               $ssn = mysqli_query($conn, "select s.ssn from Students s where s.username = '$username' "); 
                if (!$ssn) { die("Query to show fields from table failed"); }
                


                while($row = mysqli_fetch_row($result)){
                $val = $row[5];
              if(isset($_POST[$val])){
                echo '<div class="wrapper pad_bot2">';
                  echo '<figure class="left marg_right1"><img src="images/school.jpg" alt=""></figure>';
                  echo '<p class="pad_bot1 pad_top2"><strong>'.$row[2].'</strong> <br>'.$row[6].'</p>';
                  echo '<strong>Type: </strong>'.$row[10].'<br>';
                  echo '<strong>Address: </strong>'.$row[3].'<br>';
                  echo '<strong>Email: </strong>'.$row[5].'<br>';
                  echo '<strong>Vision: </strong>'.$row[7].'<br>';
                  echo '<strong>Mission: </strong>'.$row[8].'<br>';
                  echo '<strong>Main Language: </strong>'.$row[9].'<br>';
                  echo '<strong>Fees: </strong>'.$row[11].'<br>';
                  echo '<strong>Phone Number: </strong>'.$row[4].'<br>'.'</div>';
                  break;
               }
               }
      ?>



          </article>
          <article class="col2 pad_left2">
            <div class="pad_left1">
              <h2>Search for a School</h2>
            </div>  
            <div id="input">
            <form method="post" action="schools2.php">
            <strong> School Name: <input type="text" name="name:" placeholder="School Name"  maxlength="40"/><br>
            <strong> Address: <input type="text" name="address:" placeholder="Address" maxlength="80"/><br>
            <strong> Type: <br> 
                    <input type="radio" name="type" value="national" checked> National<br>
                    <input type="radio" name="type" value="international"> International<br>
                    <input type="radio" name="type" value="both"> All<br>
                            <br />
            <input class="button marg_left1" type="submit" name="search:" value="SEARCH"/>
            </form>
            </div>
         </article>
      </div>
    </section>
  </div>
</div>
<script type="text/javascript">Cufon.now();</script>
</body>
</html>