<?php include 'database.php'; 
      $all = htmlspecialchars($_GET['login']);
      $info = explode("@",$all);
      // echo $all;
      $username =$info[0];
      $schoolid =$info[1];
      // echo $username.' '.$schoolid;
      define("page_title","Learn Center | ".$username);
      define("admin_name","Administrator : ".$username);
      define("link1", "admin_main.php?login=".$username);
      define("link2", "admin_schoolList.php?login=".$username);
      
  // $schoolid = 3;  // REMOVE LATER
  $result = mysqli_query($conn, "SELECT s.name,s.address,s.phone_number, s.email, s.general_info, s.vision,s.mission,s.main_language, s.type,s.fees  FROM Schools s WHERE s.school_id = '$schoolid';");
  if (!$result) { die("Query to show fields from table failed"); }
                while($row = mysqli_fetch_row($result)){
                $schoolname=$row[0];
                 $schooladd =$row[1] ;
                  $schoolphone = $row[2];
                  $schoolemail = $row[3];
                  $schoolinfo = $row[4];
                  $schoolvision = $row[5];
                  $schoolmission = $row[6];
                  $schoollang = $row[7];
                  $schooltype = $row[8];
                  $schoolfees = $row[9];

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
              <h2 class="pad_bot1">School Info</h2>
            </div>
            <div class="pad_left1">
            <p class="pad_bot1 pad_top2"><strong> </strong>
            <p class="pad_bot1 pad_top2"><strong> </strong>

            </div>

            <div>

             <!-- <figure class="left marg_right1"><img src="images/page2_img1.jpg" alt=""></figure> -->
              <p class="pad_bot1 pad_top2"><strong> </strong>
              <form  action ="admin_action.php?login=<?php echo $username.'@'.$schoolid; ?>" method="post">

              <p class="pad_bot1 pad_top2"><strong> Name:</strong>
              <p class="pad_bot1 pad_top2"> <?php echo $schoolname; ?>
              <p>
              <input type="text" name ="la_schoolname" class="input" maxlength="40" style = "border:1px solid #000000; width: 100px; height: 20px" > </input>

              <span><span><input type="submit" name ="la_editname"  class="button" value = "Save Edit"></input></span></span></p>

              <p class="pad_bot1 pad_top2"><strong> Address:</strong>
              <p class="pad_bot1 pad_top2"><?php echo $schooladd; ?>
              <p>
              <input type="text" name ="la_schooladdress" class="input" maxlength="80" style = "border:1px solid #000000; width: 100px; height: 20px"  > </input>

              <span><span><input type="submit" name ="la_editaddress"  class="button" value = "Save Edit"></input></span></span></p>


              <p class="pad_bot1 pad_top2"><strong> Phone Number:</strong>
              <p class="pad_bot1 pad_top2"><?php echo $schoolphone; ?>
              <p>
              <input type="text" name ="la_schoolphone" class="input" maxlength="20" style = "border:1px solid #000000; width: 100px; height: 20px" > </input>

              <span><span><input type="submit" name ="la_editphone"  class="button" value = "Save Edit"></input></span></span></p>



              <p class="pad_bot1 pad_top2"><strong> E-mail:</strong>
              <p class="pad_bot1 pad_top2"><?php echo $schoolemail; ?>
              <p>
              <input type="text" name ="la_schoolemail" class="input" maxlength="40" style = "border:1px solid #000000; width: 100px; height: 20px"  > </input>

              <span><span><input type="submit" name ="la_editemail"  class="button" value = "Save Edit"></input></span></span></p>


              <p class="pad_bot1 pad_top2"><strong> General Info:</strong>
              <p class="pad_bot1 pad_top2"><?php echo $schoolinfo; ?>
              <p>
              <input type="text" name ="la_schoolinfo" class="input" maxlength="100" style = "border:1px solid #000000; width: 100px; height: 20px"  > </input>

              <span><span><input type="submit" name ="la_editinfo"  class="button" value = "Save Edit"></input></span></span></p>


              <p class="pad_bot1 pad_top2"><strong> Vision:</strong>
              <p class="pad_bot1 pad_top2"><?php echo $schoolvision; ?>
              <p>
              <input type="text" name ="la_schoolvision" class="input" maxlength="100" style = "border:1px solid #000000; width: 100px; height: 20px"  > </input>

              <span><span><input type="submit" name ="la_editvision"  class="button" value = "Save Edit"></input></span></span></p>


              <p class="pad_bot1 pad_top2"><strong> Mission:</strong>
              <p class="pad_bot1 pad_top2"><?php echo $schoolmission; ?>
              <p>
              <input type="text" name ="la_schoolmission" class="input" maxlength="100" style = "border:1px solid #000000; width: 100px; height: 20px"  > </input>

              <span><span><input type="submit" name ="la_editmission"  class="button" value = "Save Edit"></input></span></span></p>


              <p class="pad_bot1 pad_top2"><strong> Main Language:</strong>
              <p class="pad_bot1 pad_top2"><?php echo $schoollang; ?>
              <p>
              <input type="text" name ="la_schoolmainlang" class="input" maxlength="20" style = "border:1px solid #000000; width: 100px; height: 20px" > </input>

              <span><span><input type="submit" name ="la_editlang"  class="button" value = "Save Edit"></input></span></span></p>


              <p class="pad_bot1 pad_top2"><strong> Type:</strong>
              <p class="pad_bot1 pad_top2"><?php echo $schooltype; ?>
              <p>
              <input type="text" name ="la_schooltype" class="input" maxlength="20" style = "border:1px solid #000000; width: 100px; height: 20px"  > </input>

              <span><span><input type="submit" name ="la_edittype"  class="button" value = "Save Edit"></input></span></span></p>


              <p class="pad_bot1 pad_top2"><strong> Fees:</strong>
              <p class="pad_bot1 pad_top2"><?php echo $schoolfees; ?>
              <p>
              <input type="text" name ="la_schoolfees" class="input" maxlength="40" style = "border:1px solid #000000; width: 100px; height: 20px"  > </input>

              <span><span><input type="submit" name ="la_editfees"  class="button" value = "Save Edit"></input></span></span></p>
              </form>
              <!--<a href=<?php echo link1 ?> class="button"><span><span>Enter   </span></span></a> -->
              <p class="pad_bot1 pad_top2"><strong> </strong>
              <p class="pad_bot1 pad_top2"><strong> </strong>
              
            </div>


          </article>


           <article class="col2 pad_left2">
            <div class="pad_left1">
              <h2>Dashboard</h2>
            </div>
            <ul class="list1 pad_bot1">
              <li><a href="admin_verTeacher.php?login=<?php echo $username; ?>">Verify Teachers</a></li>
              <li><a href="admin_viewApplications.php?login=<?php echo $username; ?>">View Applications</a></li>
              <li><a href="admin_editSchoolInfo.php?login=<?php echo $username; ?>">Edit School Info</a></li>
              <li><a href="admin_postAnnouncement.php?login=<?php echo $username; ?>">Post Announcement</a></li> 
              <li><a href="admin_createActivity.php?login=<?php echo $username; ?>">Create Activity</a></li>
              <li><a href="admin_assignActivityTeacher.php?login=<?php echo $username; ?>">Assign Activities to Teachers</a></li> 
              <li><a href="admin_assignCourseTeacher.php?login=<?php echo $username; ?>">Assign Teachers to Courses</a></li>             
            </ul>
            <!-- <a href="#" class="button"><span><span>Read More</span></span></a>
            <a href="#" class="button"><span><span>Read More</span></span></a>  -->
            </article>

        </div>
      </div>	 <!-- / box1 -->
    </section>

  </div>  <!-- / main-->
</div>   <!-- / body2-->

<script type="text/javascript">Cufon.now();</script>
</body>
</html>