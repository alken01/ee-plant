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

$sql = "SELECT id, migration, batch FROM a21iot02.migrations;";
$result = $conn->query($sql);

if ($result->num_rows > 0) {
    // output data of each row
    while($row = mysqli_fetch_assoc($result)) 
    {
        //echo "id: " . $row["id"]. " - Name: " . $row["migration"]. " " . $row["batch"]. "<br>";
        $id = $row["id"];
        $migration = $row["migration"];
        $batch = $row["batch"];
        $request_id = json_encode($id);
        $request_migration =json_encode($migration);
        $request_batch =json_encode($batch);

        $id = array("migration"=> $request_id);
        $migrations = array("migration"=> $request_migration);
        $batch = array("batch"=> $request_batch);
    }
  } else {
    echo "0 results";
  }
$conn->close();

?>