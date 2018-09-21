<?php 
session_start();
$_SESSION['detalle'] = array();

require_once 'Config/conexion.php';
require_once 'Model/Producto.php';

$objProducto = new Producto();
$resultado_producto = $objProducto->get();
?>
<!DOCTYPE html>
<html ng-app="crudApp">
<head>
   <meta charset="utf-8">
    <title>Productos Naturales VAO</title>
    <meta name="description" content="Workshop Bootstrap 2.0">
    <meta name="author" content="Brian Orobio">
    <!-[if lt IE 9]>
      <script src="http://html5shim.googlecode.com/svn/trunk/html5.js"></script>
    <![endif]—>
    <link href="assets/css/bootstrap.min.css" rel="stylesheet" media="screen">
    <link href="assets/css/bootstrap-responsive.css" rel="stylesheet">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <style>
      body { padding-top: 60px; }
    </style>
    <link href="bootstrap/css/bootstrap-responsive.min.css" rel="stylesheet">
<meta name="viewport" content="width=device-width, initial-scale=1">
<!-- Include Bootstrap CSS -->
<link rel="stylesheet" type="text/css" href="css/bootstrap.min.css">
<!-- Include main CSS -->
<link rel="stylesheet" type="text/css" href="css/style.css">
<!-- Include jQuery library -->
<script src="js/jQuery/jquery.min.js"></script>
<!-- Include AngularJS library -->
<script src="lib/angular/angular.min.js"></script>
<!-- Include Bootstrap Javascript -->
<script src="js/bootstrap.min.js"></script>
</head>
<body>
    <div class="navbar navbar-fixed-top">
      <div class="navbar-inner">
        <div class="container">
          <a class="brand" href="index.html">Productos Naturales</a>
          <ul class="nav">
            <li><a href="index.html">Inicio</a></li>
            <li><a href="Producto.html">Producto</a></li>
            <li><a href="lineanutricion.html">Linea Nutricion</a></li>
            <li ><a href="lineabelleza.html">Linea Belleza</a></li>
            <li><a href="lineasalud.html">Linea Salud</a></li>
            <li class="active"><a href="#">Factura</a></li>
          </ul>
        </div>
      </div>
     </div>
  <div class="container">
    
    <div class="page-header">
      <h1>Carrito de Compras VAO</h1>
    </div>
    <div class="row">
      <div class="col-md-4">  
        <div>Producto:
        <select name="cbo_producto" id="cbo_producto" class="col-md-2 form-control">
          <option value="0">Seleccione un producto</option>
          <?php foreach($resultado_producto as $producto):?>
            <option value="<?php echo $producto['idProduto']?>"><?php echo $producto['nombre']?></option>
          <?php endforeach;?>
        </select>
        </div>
      </div>
      <div class="col-md-2">
        <div>Cantidad:
          <input id="txt_cantidad" name="txt_cantidad" type="text" class="col-md-2 form-control" placeholder="Ingrese cantidad" autocomplete="off" />
        </div>
      </div>
      <div class="col-md-2">
        <div style="margin-top: 19px;">
        <button type="button" class="btn btn-success btn-agregar-producto">Agregar</button>
        </div>
      </div>
    </div>
    
    <br>
    <div class="panel panel-info">
       <div class="panel-heading">
            <h3 class="panel-title">Productos</h3>
          </div>
      <div class="panel-body detalle-producto">
        <?php if(count($_SESSION['detalle'])>0){?>
          <table class="table">
              <thead>
                  <tr>
                      <th>Descripci&oacute;n</th>
                      <th>Cantidad</th>
                      <th>Precio</th>
                      <th>Subtotal</th>
                      <th></th>
                  </tr>
              </thead>
              <tbody>
                <?php 
                foreach($_SESSION['detalle'] as $k => $detalle){ 
                ?>
                  <tr>
                    <td><?php echo $detalle['producto'];?></td>
                      <td><?php echo $detalle['cantidad'];?></td>
                      <td><?php echo $detalle['precio'];?></td>
                      <td><?php echo $detalle['subtotal'];?></td>
                      <td><button type="button" class="btn btn-sm btn-danger eliminar-producto" id="<?php echo $detalle['idProducto'];?>">Eliminar</button></td>
                  </tr>
                  <?php }?>
              </tbody>
          </table>
        <?php }else{?>
        <div class="panel-body"> No hay productos agregados</div>
        <?php }?>
      </div>
    </div>
  </div>
  </body>
</html>
