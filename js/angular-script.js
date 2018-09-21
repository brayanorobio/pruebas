// Application module
// Módulo de aplicación
var crudApp = angular.module('crudApp',[]);
crudApp.controller("DbController",['$scope','$http', function($scope,$http){

// Function to get employee details from the database
//Función para obtener detalles de los empleados de la base de datos
getInfo();
function getInfo(){
// Sending request to EmpDetails.php files 
//Envío de solicitud a archivos EmpDetails.php

$http.post('/ProyectoDisenio/databaseFiles/empDetails.php').success(function(data){
// Stored the returned data into scope 
//Almacenó los datos devueltos en el ámbito
$scope.details = data;
});
}

// Setting default value of gender 
//Sin conexión

// Enabling show_form variable to enable Add employee button
// Habilitar la variable show_form para habilitar el botón Agregar empleado
$scope.show_form = true;
// Function to add toggle behaviour to form
//Función para añadir el comportamiento de alternancia a la forma
$scope.formToggle =function(){
$('#empForm').slideToggle();
$('#editForm').css('display', 'none');
}
$scope.insertInfo = function(info){

$http.post('/ProyectoDisenio/databaseFiles/insertDetails.php',{"nombre":info.nombre,"tipoProducto":info.producto,"referencia":info.referencia,"precio":info.precio}).success(function(data){
if (data == true) {
getInfo();
$('#empForm').css('display', 'none');
}
});s
}
$scope.deleteInfo = function(info){
$http.post('/ProyectoDisenio/databaseFiles/deleteDetails.php',{"idProducto":info.idProducto}).success(function(data){
if (data == true) {
getInfo();
}
});
}
$scope.currentUser = {};
$scope.editInfo = function(info){
$scope.currentUser = info;
$('#empForm').slideUp();
$('#editForm').slideToggle();
}
$scope.UpdateInfo = function(info){
$http.post('/ProyectoDisenio/databaseFiles/updateDetails.php',{"id":info.idProducto,"name":info.nombre,"email":info.producto,"address":info.referencia,"Precio":info.precio}).success(function(data){
$scope.show_form = true;
if (data == true) {
getInfo();
}
});
}
$scope.updateMsg = function(emp_id){
$('#editForm').css('display', 'none');
}
}]);