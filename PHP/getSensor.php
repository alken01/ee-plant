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

$sql = "SELECT sd.sensorID AS id, s.sensorName, s.sensorImage, s.sensorColor, s.favorite, sd.sensorValue, s.dataType, UNIX_TIMESTAMP(sd.time) FROM (SELECT sensorID, sensorValue, time FROM a21iot02.sensorData AS b INNER JOIN (SELECT MAX(ID) AS id FROM a21iot02.sensorData WHERE sensorValue < 101 GROUP BY sensorID) a ON a.id = b.id) AS sd LEFT JOIN a21iot02.sensor AS s ON s.id = sd.sensorID WHERE s.deleted ='0';";

$result = $conn->query($sql);   

if ($result->num_rows > 0) {
    // output data of each row
    $array = array();
    while($row = mysqli_fetch_assoc($result)) 
    {
        //echo "id: " . $row["id"]. " - Name: " . $row["sensorName"]. " " . $row["sensorImage"]. "<br>";

        $id = $row["id"];
        $sensorName = $row["sensorName"];
        $sensorImage = $row["sensorImage"];
        $sensorColor = $row["sensorColor"];
        $favorite = $row["favorite"];
        $sensorValue = $row["sensorValue"];
        $dataType = $row["dataType"];
        $time = $row["UNIX_TIMESTAMP(sd.time)"];

        $myObj = new stdClass();
        $myObj->id = $id;
        $myObj->sensorName = $sensorName;
        $myObj->sensorImage = $sensorImage;
        $myObj->sensorColor = $sensorColor;
        $myObj->favorite = $favorite;
        $myObj->sensorValue = $sensorValue;
        $myObj->dataType = $dataType;
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