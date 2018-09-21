<?php 
// Including database connections
require_once 'database_connections.php';
// Fetching the updated data & storin in new variables
$data = json_decode(file_get_contents("php://input")); 
// Escaping special characters from updated data
$idProducto = mysqli_real_escape_string($con, $data->idProducto);
$nombre = mysqli_real_escape_string($con, $data->nombre);
$tipoProducto = mysqli_real_escape_string($con, $data->tipoProducto);
$referencia = mysqli_real_escape_string($con, $data->referencia);
$precio = mysqli_real_escape_string($con, $data->precio);
// mysqli query to insert the updated data
$query = "UPDATE emp_details SET nombre='$nombre',tipoProducto='$tipoProducto',referencia='$referencia',precio='$precio' WHERE idProducto=$id";
mysqli_query($con, $query);
echo true;
?>