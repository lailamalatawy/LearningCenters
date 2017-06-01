<?php include 'database.php';
$all = htmlspecialchars($_GET['login']);

$info = explode("@",$all);
      // echo $all;
      $username =$info[0];
      $schoolid =$info[1];
    
      define("page_title","Learn Center | ".$username);
      define("admin_name","Administrator : ".$username);
      define("link1", "admin_main.php?login=".$username);
      define("link2", "admin_postNewAnnouncement.php?login=".$username.'@'.$schoolid);
?>


<?php 

    function list_announcements() {

      $conn = mysqli_connect("localhost", "root", "", "Database_Project");
      if ($conn === false) {
    die("Could not connect:"  . mysqli_connect_error()); } 

      $output = "";
    $result = mysqli_query($conn, "SELECT announcement_ID, title, announcement_date FROM Announcements WHERE administrator_id = 17;") or die('cannot show tables'); // CHANGE THAT LATER      
    while ($row = mysqli_fetch_array($result)){
      $output .= '
      <tr>
      <td>' . $row['announcement_ID'] . '</td>
      <td>' . $row['title'] . '</td>  
      <td>' . $row['announcement_date'] . '</td>                                                                                  
      </tr>';
      }

      return $output;

     }

    $exec_func = list_announcements();
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
              <h2 class="pad_bot1">Announcements</h2>
            </div>
            <div class="pad_left1">
            <p class="pad_bot1 pad_top2"><strong> </strong>
            <p class="pad_bot1 pad_top2"><strong> </strong>

            </div>


               <div class="pad_left1">
              <div class="box2">
                <div class="wrapper">
                <table cellpadding="50" cellspacing="500" width="100%" class="sortable">
                    <thead>
                         <tr valign="middle">
                                <th>ID</th>
                                <th>Title</th>
                                <th>Date</th>
                                <td>&nbsp;</td>
                        </tr>
                    </thead>
                    <tbody>
                       <?php echo $exec_func; ?> 
                    </tbody>
                 </table>
                </div>
              </div>
              <!-- <p><strong>kalam bel bold </strong> kalam keteer </p> -->
            </div>
             <a href="admin_postNewAnnouncement.php?login=<?php echo $username.'@'.$schoolid; ?>" class="button"><span><span> Post New </span></span></a> 

            <!-- <a href=<?php //echo link2 ?> class="button"><span><span> Post New </span></span></a> 
 -->

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