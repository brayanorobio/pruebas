<?php
// Including database connections
require 'database_connections.php'; 
// mysqli query to fetch all data from database
$sql = "SELECT * FROM producto";
$result = mysqli_query($con, $sql);
$arr = array();
if(mysqli_num_rows($result) != 0) {
	while($row = mysqli_fetch_assoc($result)) {
			$arr[] = $row;
	}
}
// Return json array containing data froson_info = json_encode($arr);m the database
echo $json_info=json_encode($arr);

?>