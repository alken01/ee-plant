<?php
$servername = "mysql.studev.groept.be";
$username = "a21iot02";
$password = "GLKrddGI";
$array= array();

// Create connection
$conn = new mysqli($servername, $username, $password, "", 3306);
// Check connection
if ($conn->connect_error) {
  die("Connection failed: " . $conn->connect_error);
}

$sql = "SELECT id, plantName, plantType FROM a21iot02.systemPlants where a21iot02.systemPlants.deleted != '1';";
$result = $conn->query($sql);

if ($result->num_rows > 0) {
    // output data of each row
    while($row = mysqli_fetch_assoc($result)) 
    {
        echo $row["id"]. ",". $row["plantName"]. ",". $row["plantType"]. "<br>";
    }
  } else {
    echo "0 results";
  }
        
//IF YOU WANT TO TEST CLICK THIS LINK: https://a21iot02.studev.groept.be/Test/getPlantsString.php

$conn->close();
?>