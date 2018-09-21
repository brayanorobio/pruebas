<?php
$manejador="mysql";
$servidor="localhost";
$usuario="root";
$pass="";
$base="mydb";
$cadena="$manejador:host=$servidor;dbname=$base";
$cnx = new PDO($cadena,$usuario,$pass);
?>