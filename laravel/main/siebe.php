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
$i = 0;

$sql = "SELECT id, plantName, plantType FROM a21iot02.systemPlants where a21iot02.systemPlants.deleted != '1';";
$result = $conn->query($sql);

if ($result->num_rows > 0) {
    // output data of each row
    while($row = mysqli_fetch_assoc($result)) 
    {
        echo " - id : " . $row["id"]. " - Name : " . $row["plantName"]. " - plantType: " . $row["plantType"]. "<br>";
        $id = $row["id"];
        $plantName = $row["plantName"];
        $plantType = $row["plantType"];


        $id_array = array("id"=> $id);
        $plantName_array = array("plantName"=> $plantName);
        $plantType_array = array("plantType"=> $plantType);




    }
  } else {
    echo "0 results";
  }

        $request_id = json_encode($id_array);
        $request_plantName =json_encode($plantName_array);
        $request_plantType =json_encode($plantType_array);

        echo "$request_id";

$conn->close();
?>