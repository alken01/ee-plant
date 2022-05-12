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

$sql = "SELECT id, plantName, plantType FROM a21iot02.systemPlants where a21iot02.systemPlants.deleted ='0';";

$result = $conn->query($sql);   

if ($result->num_rows > 0) {
    // output data of each row
    $array = array();
    while($row = mysqli_fetch_assoc($result)) 
    {
        //echo "id: " . $row["id"]. " - Name: " . $row["sensorName"]. " " . $row["sensorImage"]. "<br>";

        $id = $row["id"];
        $plantName = $row["plantName"];
        $plantType = $row["plantType"];

        $myObj = new stdClass();
        $myObj->id = $id;
        $myObj->plantName = $plantName;
        $myObj->plantType = $plantType;

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