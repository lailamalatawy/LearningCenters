<?php 
$dbhost = "localhost";
$dbuser = "root";
$dbpass = "";
$dbname = "Database_Project";
$conn = mysqli_connect($dbhost, $dbuser, $dbpass, $dbname);
if ($conn === false) {
die("Could not connect:"  . mysqli_connect_error()); } 
?>