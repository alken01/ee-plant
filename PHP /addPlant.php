<?php
$servername = "mysql.studev.groept.be";
$username = "a21iot02";
$password = "GLKrddGI";

// Create connection
$conn = new mysqli($servername, $username, $password, "", 3306);
// Check connection
if ($conn->connect_error) {
  die("Connection failed: " . $conn->connect_error);
}

$name = $_GET['name'];
$type = $_GET['type'];

$sql = "INSERT INTO a21iot02.systemPlants (plantName, plantType) VALUES ($name, $type);";
if ($conn->query($sql) === TRUE) {
  echo "Data send succesfully";
} else {
  echo "Error: " . $conn->error;
}

$conn->close();
?>