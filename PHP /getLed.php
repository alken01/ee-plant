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

$sql = "SELECT 
actuatorValue
FROM
a21iot02.actuatorData AS b
INNER JOIN (SELECT 
MAX(id) AS id
FROM
a21iot02.actuatorData
GROUP BY actuatorID) a ON a.id = b.id
";
$result = $conn->query($sql);

if ($result->num_rows > 0) {
    // output data of each row
    while($row = mysqli_fetch_assoc($result)) 
    {
        echo $row["actuatorValue"];
    }
  } else {
    echo "0 results";
  }
        

$conn->close();
?>