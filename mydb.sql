-- phpMyAdmin SQL Dump
-- version 3.5.2.2
-- http://www.phpmyadmin.net
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 10-11-2016 a las 14:29:19
-- Versión del servidor: 5.5.27
-- Versión de PHP: 5.4.7

SET SQL_MODE="NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Base de datos: `mydb`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `cliente`
--

CREATE TABLE IF NOT EXISTS `cliente` (
  `idCliente` int(11) NOT NULL DEFAULT '0',
  `nombre` varchar(45) DEFAULT NULL,
  `apellido` varchar(45) DEFAULT NULL,
  `documento` varchar(45) DEFAULT NULL,
  `sexo` varchar(45) DEFAULT NULL,
  `telefono` varchar(45) DEFAULT NULL,
  `direccion` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`idCliente`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `factura`
--

CREATE TABLE IF NOT EXISTS `factura` (
  `idFactura` int(11) NOT NULL DEFAULT '0',
  `totalPagar` int(11) DEFAULT NULL,
  `fecha` varchar(45) DEFAULT NULL,
  `hora` varchar(45) DEFAULT NULL,
  `cliente_idCliente` int(11) NOT NULL,
  PRIMARY KEY (`idFactura`,`cliente_idCliente`),
  KEY `fk_Factura_cliente_idx` (`cliente_idCliente`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `producto`
--

CREATE TABLE IF NOT EXISTS `producto` (
  `idProducto` int(11) NOT NULL DEFAULT '0',
  `nombre` varchar(45) DEFAULT NULL,
  `tipoProducto` varchar(45) DEFAULT NULL,
  `referencia` varchar(45) DEFAULT NULL,
  `precio` int(11) DEFAULT NULL,
  PRIMARY KEY (`idProducto`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `producto`
--

INSERT INTO `producto` (`idProducto`, `nombre`, `tipoProducto`, `referencia`, `precio`) VALUES
(1, 'Capsulas Te Esbelt', 'Linea Belleza', '1043', 33000),
(2, 'Te Esbelt', 'Linea Belleza', '1', 15200),
(3, 'Vinagre de Manzana', 'Linea Belleza', '1047', 13000),
(4, 'Aceite de Naranja', 'Linea Belleza', '1191', 15900),
(5, 'Aloe vera + Vitamina E', 'Linea Belleza', '5759', 29700),
(6, 'Centella Asiatica 400 Mg', 'Linea Belleza', '2705', 19000),
(7, 'Jabon Intimo Liquido 280 ml', 'Linea Belleza', '3728', 17500),
(8, 'Shampoo Maria Salome 360 ml', 'Linea Belleza', '902', 17500),
(9, 'Rinse Maria Salome 360 ml', 'Linea Belleza', '2229', 13800),
(10, 'Shampoo Proteccion Maria Salome 360 ml', 'Linea Belleza', '3315', 17500),
(11, 'Lecitina de Soya Granulada 300gr', 'Linea Salud', '1045', 11500),
(12, 'Nopal 50 Softgels', 'Linea Salud', '5517', 24700),
(13, 'Bon Star 100 caps', 'Linea Salud', '1106', 21700),
(14, 'Esencia Buen Genio 25 ml', 'Linea Salud', '1149', 11500),
(15, 'Esencia St. John´s Wort 25 ml', 'Linea Salud', '1295', 11500),
(16, 'Estress Out 25 ml', 'Linea Salud', '1337', 11500),
(17, 'Bon Nervin 25 ml', 'Linea Salud', '1341', 11500),
(18, 'Adoff Calendula 360 ml', 'Linea Salud', '3330', 19900),
(19, 'Amecol 24 caps', 'Linea Salud', '232', 17200),
(20, 'Antisaure 360 ml', 'Linea Salud', '5463', 20800),
(21, 'Spirulina Earthrise x', 'Linea Nutricion', '1986', 49500),
(22, 'Hojuela de Quinua', 'Linea Nutricion', '70747', 13500),
(23, 'Semillas de Chia x 450 gr', 'Linea Nutricion', '71098', 22000),
(24, 'Aceite de Coco 250 ml ', 'Linea Nutricion', '71005', 22500),
(25, 'BCAA 2200 mg', 'Linea Nutricion', '5850', 98000),
(26, 'LGlutamine Powder 2.2LB', 'Linea Nutricion', '5851', 185000),
(27, 'METR x Protein Plus', 'Linea Nutricion', '5852', 130000),
(28, 'METR x Size UP', 'Linea Nutricion', '5853', 149000),
(29, 'Quinua en grano 500 gr', 'Linea Nutricion', '71048', 10800),
(30, 'Quinua en Harina 500 gr', 'Linea Nutricion', '71049', 12000);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `producto_has_factura`
--

CREATE TABLE IF NOT EXISTS `producto_has_factura` (
  `Producto_idProducto` int(11) NOT NULL,
  `Factura_idFactura` int(11) NOT NULL,
  `Factura_cliente_idCliente` int(11) NOT NULL,
  PRIMARY KEY (`Producto_idProducto`,`Factura_idFactura`,`Factura_cliente_idCliente`),
  KEY `fk_Producto_has_Factura_Factura1_idx` (`Factura_idFactura`,`Factura_cliente_idCliente`),
  KEY `fk_Producto_has_Factura_Producto1_idx` (`Producto_idProducto`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `factura`
--
ALTER TABLE `factura`
  ADD CONSTRAINT `fk_Factura_cliente` FOREIGN KEY (`cliente_idCliente`) REFERENCES `cliente` (`idCliente`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Filtros para la tabla `producto_has_factura`
--
ALTER TABLE `producto_has_factura`
  ADD CONSTRAINT `fk_Producto_has_Factura_Factura1` FOREIGN KEY (`Factura_idFactura`, `Factura_cliente_idCliente`) REFERENCES `factura` (`idFactura`, `cliente_idCliente`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_Producto_has_Factura_Producto1` FOREIGN KEY (`Producto_idProducto`) REFERENCES `producto` (`idProducto`) ON DELETE NO ACTION ON UPDATE NO ACTION;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
