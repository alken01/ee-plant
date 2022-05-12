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

$sql = "SELECT actuatorID AS id, actuatorName, actuatorImage, actuatorColor, actuatorValue, time FROM (SELECT actuatorID, actuatorValue, time FROM a21iot02.actuatorData AS b INNER JOIN (SELECT MAX(id) AS id FROM a21iot02.actuatorData GROUP BY actuatorID) a ON a.id = b.id) AS sd LEFT JOIN a21iot02.actuator AS s ON s.id = sd.actuatorID ORDER BY actuatorID;";
$result = $conn->query($sql);   

if ($result->num_rows > 0) {
    // output data of each row
    $array = array();
    while($row = mysqli_fetch_assoc($result)) 
    {
        //echo "id: " . $row["id"]. " - Name: " . $row["sensorName"]. " " . $row["sensorImage"]. "<br>";

        $id = $row["id"];
        $actuatorName = $row["actuatorName"];
        $actuatorImage = $row["actuatorImage"];
        $actuatorColor = $row["actuatorColor"];
        $actuatorValue = $row["actuatorValue"];
        $time = $row["time"];

        $myObj = new stdClass();
        $myObj->id = $id;
        $myObj->actuatorName = $actuatorName;
        $myObj->actuatorImage = $actuatorImage;
        $myObj->actuatorColor = $actuatorColor;
        $myObj->actuatorValue = $actuatorValue;
        $myObj->time = $time;

        $myJSON = json_encode($myObj);
        array_push($array, $myJSON);
    }
    echo "[ ";
    foreach ($array as $key => $value) {
        echo $value;
        if (next($array )) {
            echo ','; // Add comma for all elements instead of last
        }
    }
    echo " ]";

  } else {
    echo "0 results";
  }

$conn->close();
?>