<?php  include 'database.php'; ?>
<?php  
      $username = htmlspecialchars($_GET['login']);
      //$username='yasmine.amr';
      $Student = mysqli_query($conn, "select * from Students s where s.username = '$username' ");
      $Student= mysqli_fetch_row($Student);
      $ssn= $Student[0]; 
      if (!$ssn) { die("Query to show fields from table failed"); } 
?>
<html lang="en">
<head>
<title>Learn Center | Update Info</title>
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
              <h2>Update info</h2>
              <form id="ContactForm" action ="m_action.php?login=<?php  echo $username?>"  method="post">                              
                <div>
                  <div  class="wrapper"> <strong>Name:</strong>
                    <div class="bg">
                      <input type="text" name ="ms_name" class="input" maxlength="20" value= <?php  echo "$Student[1]"?> >
                    </div>
                  </div>

                  <div  class="wrapper"> <strong>Password:</strong>
                    <div class="bg">
                      <input type="text" name ="ms_pass" class="input" maxlength="20">
                    </div>
                  </div>
                 
                  <div  class="wrapper"> <strong>Gender:</strong>
                    <div class="bg">
                      <input type="text" name ="ms_gender" class="input" maxlength="1" value= <?php echo $Student[3] ?>>
                    </div>
                  </div>
                  
                  <div  class="wrapper"> <strong>Birth Date:</strong>
                    <div class="bg">
                      <input type="date" name ="ms_bdate" class="input" value= <?php echo $Student[4] ?>>
                    </div>
                  </div>
                  
                  <span><span><input type="submit" name ="ms_submit" class="button" value = "Submit"></input> </span></span>
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