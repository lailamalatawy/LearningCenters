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
<html lang="en">
<head>
<title>Learn Center | Apply School</title>
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
              <h2>Apply for your Child</h2>
              <form id="ContactForm" action="action2.php?login=<?php echo $username ?>" method="post">
                 
                   <div  class="wrapper"> <strong>Your Child:</strong> 
                    <div class="bg">
                      <select name="child_name">
                      <?php $tmp = mysqli_query($conn, " Select s.ssn,s.name FROM Students s inner join parent_has_student phs on s.ssn=phs.student_ssn and '$username' =phs.parent_username;
");
                         if (!$tmp) {
                          die("Query to show fields from table failed"); }  
                          while($row = mysqli_fetch_row($tmp)) {
                              echo "<option class= 'wrapper'>$row[0] $row[1]</option>";
                          }
                      ?>
                      </select>
                    </div>
                  </div>
                 
                 <div>
                  <div  class="wrapper"> <strong>School:</strong> 
                    <div class="bg">
                      <select name="child_Schools">

                      <?php 
                      $tmp = mysqli_query($conn, "select s.school_id, s.name from Schools s");
                        
                         if (!$tmp) {
                          die("Query to show fields from table failed"); }  
                          while($row = mysqli_fetch_row($tmp)) {
                              echo "<option class= 'wrapper'>$row[0] $row[1]</option>";
                          }
                      ?>
                      </select>
                    </div>
                  </div>
                  <span><span><input type="submit" name ="child_clear" class="button" value = "Clear"></input></span></span>
                  <span><span><input type="submit" name ="child_apply" class="button" value = "Apply" ></input> </span></span>
                  </div>
              </form>
<!--                    <?php echo '<a href="action2.php?login='.$username.'" class="button"><span><span>Sign Up</span></span></a>'; ?> -->

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