<?php 
require_once 'database_connections.php';
$data = json_decode(file_get_contents("php://input")); 
$query = "DELETE FROM producto WHERE idProducto=$data->idProducto";
mysqli_query($con, $query);
echo true;
?>