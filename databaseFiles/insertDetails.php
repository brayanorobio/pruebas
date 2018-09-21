<?php 
// Including database connections
require_once 'database_connections.php';
// Fetching and decoding the inserted data
$data = json_decode(file_get_contents("php://input")); 
// Escaping special characters from submitting data & storing in new variables.
$nombre = mysqli_real_escape_string($con, $data->nombre);
$tipoProducto = mysqli_real_escape_string($con, $data->tipoProducto);
$referencia = mysqli_real_escape_string($con, $data->referencia);
$precio = mysqli_real_escape_string($con, $data->precio);

// mysqli insert query
$query = "INSERT into producto (nombre,tipoProducto,referencia,precio) VALUES ('$nombre',
'$tipoProducto','$referencia','$precio')";
// Inserting data into database
mysqli_query($con, $query);
echo true;
?>