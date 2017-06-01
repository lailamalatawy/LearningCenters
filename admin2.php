<?php include 'database.php'; 
      $username = htmlspecialchars($_GET['login']);
      define("page_title","Learn Center | ".$username);
      define("admin_name","Administrator : ".$username);
      define("link1", "admin_main.php?login=".$username);
      define("link2", "admin_schoolList.php?login=".$username);
?>


<?php 

    if(isset($_POST["la_enterSchoolID"]))
    { 
      $schoolid = $_POST["la_schoolid"];
      header('Location: admin_main.php?login='.$username);

    } 
?>


<!DOCTYPE html>
<html lang="en">
<head>

<title><?php echo page_title; ?></title>
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


<body id="page2">
<div class="body1">
  <div class="main">

    <!-- header -->
    <header>
      <div class="wrapper">
        <nav>
          <ul id="menu">
            <li><a href="index.html">About</a></li>
            <li><a href="courses.html">Courses</a></li>
            <li><a href="programs.html">Programs</a></li>
            <li><a href="teachers.html">Teachers</a></li>
            <li><a href="admissions.html">Admissions</a></li>
            <li class="end"><a href="contacts.html">Contacts</a></li>
          </ul>
        </nav>
         <?php echo '<ul><a href="teacher.php?login='. $username.'"><li>'.$username.'</a></li></ul>'; ?>
      </div>
      <div class="wrapper">
        <h1><a href="index.html" id="logo">Learn Center</a></h1>
      </div>
      <div id="slogan"> We Will Open The World<span>of knowledge for you!</span> </div>
    </header>
    <!-- / header -->

  </div>
</div>	 <!-- / body1 -->


<div class="body2">
  <div class="main">

    <section id="content">
      <div class="box1">
        <div class="wrapper">
          <article class="col1">
            <div class="pad_left1">
              <h2 class="pad_bot1"><?php echo admin_name ?></h2>
            </div>
            <div class="pad_left1">
            
             <!-- <figure class="left marg_right1"><img src="images/page2_img1.jpg" alt=""></figure> -->
              <p class="pad_bot1 pad_top2"><strong> </strong>
              <form  action ="admin_action.php?login=<?php echo $username; ?>" method="post">
              <p class="pad_bot1 pad_top2"><strong> Please enter the school ID :</strong>
              <input type="text" name ="la_schoolid" class="input" maxlength="10" style = "border:1px solid #000000; width: 50px; height: 20px"> </p>
            

        
              <span><span><input type="submit" name ="la_enterSchoolID"  class="button" value = "Enter"></input></span></span>
               <a href=<?php echo link2 ?> class="button"><span><span> View List of all schools </span></span></a> 
              </form>
              <!--<a href=<?php echo link1 ?> class="button"><span><span>Enter   </span></span></a> -->
              <p style="color:red;"><strong> Cannot proceed without a valid school ID! </strong>
              <p class="pad_bot1 pad_top2"><strong> </strong>
              
            </div>

          </article>

        </div>
      </div>	 <!-- / box1 -->
    </section>

  </div>  <!-- / main-->
</div>   <!-- / body2-->

<script type="text/javascript">Cufon.now();</script>
</body>
</html>