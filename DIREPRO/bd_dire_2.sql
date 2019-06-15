-- phpMyAdmin SQL Dump
-- version 4.8.5
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1:3306
-- Tiempo de generación: 13-06-2019 a las 23:41:45
-- Versión del servidor: 5.7.26
-- Versión de PHP: 7.2.18

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `bd_dire_2`
--

DELIMITER $$
--
-- Procedimientos
--
DROP PROCEDURE IF EXISTS `sp_actualizar_empleado`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_actualizar_empleado` (IN `id_emplea_` INT, IN `emplea_nombre_` VARCHAR(20), IN `emplea_apellido_` VARCHAR(20), IN `emplea_celular_` VARCHAR(9), IN `emplea_correo_` VARCHAR(40), IN `emplea_DNI_` LONGTEXT, IN `id_area_` INT(11))  BEGIN
	update empleado set 
    emplea_nombre=emplea_nombre_,
    emplea_apellido=emplea_apellido_,
    emplea_celular=emplea_celular_,
    emplea_correo=emplea_correo_,
    emplea_DNI=emplea_DNI_,
    id_area=id_area_
    where id_emplea=id_emplea_;
END$$

DROP PROCEDURE IF EXISTS `sp_eliminar_empleado`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_eliminar_empleado` (IN `id_emplea_` INT)  BEGIN
	delete from empleado 
    where id_emplea=id_emplea_;
END$$

DROP PROCEDURE IF EXISTS `sp_insertar_empleado`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_insertar_empleado` (IN `emplea_nombre_` VARCHAR(20), IN `emplea_apellido_` VARCHAR(20), IN `emplea_celular_` VARCHAR(9), IN `emplea_correo_` VARCHAR(40), IN `emplea_DNI_` LONGTEXT, IN `id_area_` INT(11))  BEGIN
	insert into empleado (emplea_nombre,emplea_apellido,emplea_celular,emplea_correo,emplea_DNI,id_area)
    values (emplea_nombre_,emplea_apellido_,emplea_celular_,emplea_correo_,emplea_DNI_,id_area_);
END$$

DROP PROCEDURE IF EXISTS `sp_mostrar_empleado`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_mostrar_empleado` ()  BEGIN
	select * from empleado;
END$$

DELIMITER ;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `area`
--

DROP TABLE IF EXISTS `area`;
CREATE TABLE IF NOT EXISTS `area` (
  `id_area` int(11) NOT NULL AUTO_INCREMENT COMMENT 'Identificador de la tabla Area',
  `area_nombre` varchar(50) DEFAULT NULL COMMENT 'Nombre del Area',
  `area_ubicacion` varchar(255) DEFAULT NULL COMMENT 'Ubicacion del Area',
  `area_anexo` varchar(255) DEFAULT NULL COMMENT 'Numero de telefono del area del Empleado (DIREPRO)',
  `id_serv` int(11) NOT NULL COMMENT 'Identificador de la tabla Servicio conectado como clave foranea',
  `id_categ` int(11) NOT NULL COMMENT 'Identificador de la tabla Categoria conectado como clave foranea',
  PRIMARY KEY (`id_area`),
  KEY `idx_area_id_serv` (`id_serv`),
  KEY `idx_area_id_categ` (`id_categ`)
) ENGINE=MyISAM AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `area`
--

INSERT INTO `area` (`id_area`, `area_nombre`, `area_ubicacion`, `area_anexo`, `id_serv`, `id_categ`) VALUES
(1, 'Acuicultura', 'Chimbote', 'Empresa DIREPRO', 0, 0);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `categoria`
--

DROP TABLE IF EXISTS `categoria`;
CREATE TABLE IF NOT EXISTS `categoria` (
  `id_categ` int(11) NOT NULL AUTO_INCREMENT COMMENT 'Identificador de la tabla Categoria',
  `categ_nombre` varchar(50) DEFAULT NULL COMMENT 'Nombre de la Categoria',
  `categ_descrip` varchar(255) DEFAULT NULL COMMENT 'Descripcion de la Categoria',
  PRIMARY KEY (`id_categ`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `departamento`
--

DROP TABLE IF EXISTS `departamento`;
CREATE TABLE IF NOT EXISTS `departamento` (
  `id_depar` int(11) NOT NULL AUTO_INCREMENT COMMENT 'Identificador de la tabla Departamento',
  `depar_nombre` varchar(50) DEFAULT NULL COMMENT 'Nombre del Departamento',
  `depar_coord_utm` varchar(255) DEFAULT NULL COMMENT 'Coordenada UTM del Departamento',
  `id_prov` int(11) NOT NULL COMMENT 'Identificador de la tabla Provincia conectado como clave foranea',
  PRIMARY KEY (`id_depar`),
  KEY `idx_departamento_id_prov` (`id_prov`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `detallefactura`
--

DROP TABLE IF EXISTS `detallefactura`;
CREATE TABLE IF NOT EXISTS `detallefactura` (
  `id_detallefac` int(11) NOT NULL AUTO_INCREMENT COMMENT 'Identificador de la tabla DetalleFactura',
  `emplea_nombre` varchar(20) DEFAULT NULL COMMENT 'Nombre del empleado',
  `empre_razon_social` varchar(255) DEFAULT NULL COMMENT 'Nombre completo de la Empresa',
  `area_nombre` varchar(50) DEFAULT NULL COMMENT 'Nombre del Area',
  `serv_nombre` varchar(50) DEFAULT NULL COMMENT 'Nombre del Servicio',
  `categ_nombre` varchar(50) DEFAULT NULL COMMENT 'Nombre de la Categoria',
  `pag_tipo` varchar(30) DEFAULT NULL COMMENT 'Tipo de Pago (ejem. contado, cuotas)',
  `mone_tipo` varchar(20) DEFAULT NULL COMMENT 'Tipo de Moneda (ejem. soles)',
  `factu_pagototal` decimal(10,0) DEFAULT NULL COMMENT 'Pago total de la Factura',
  PRIMARY KEY (`id_detallefac`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `direccion`
--

DROP TABLE IF EXISTS `direccion`;
CREATE TABLE IF NOT EXISTS `direccion` (
  `id_direc` int(11) NOT NULL AUTO_INCREMENT COMMENT 'Identificador de la tabla Direccion',
  `direc_nombre` varchar(45) DEFAULT NULL COMMENT 'Nombre de la calle en la tabla Direccion',
  `direc_coord_utm` varchar(255) DEFAULT NULL COMMENT 'Coordenada UTM de la tabla Direccion',
  `id_depar` int(11) NOT NULL COMMENT 'Identificador de la tabla Departamento conectado como clave foranea',
  PRIMARY KEY (`id_direc`),
  KEY `idx_direccion_id_depar` (`id_depar`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `distrito`
--

DROP TABLE IF EXISTS `distrito`;
CREATE TABLE IF NOT EXISTS `distrito` (
  `id_distri` int(11) NOT NULL AUTO_INCREMENT COMMENT 'Identificador de la tabla Distrito',
  `distri_nombre` varchar(50) DEFAULT NULL COMMENT 'Nombre del Distrito',
  `distri_coord_utm` varchar(255) DEFAULT NULL COMMENT 'Coordenada UTM del Distrito',
  PRIMARY KEY (`id_distri`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `empleado`
--

DROP TABLE IF EXISTS `empleado`;
CREATE TABLE IF NOT EXISTS `empleado` (
  `id_emplea` int(11) NOT NULL AUTO_INCREMENT COMMENT 'Identificador de la tabla Empleado',
  `emplea_nombre` varchar(20) DEFAULT NULL COMMENT 'Nombre del empleado',
  `emplea_apellido` varchar(20) DEFAULT NULL COMMENT 'Apellido del empleado',
  `emplea_celular` varchar(9) DEFAULT NULL COMMENT 'Celular del empleado',
  `emplea_DNI` longtext COMMENT 'DNI del empleado',
  `id_area` int(11) NOT NULL COMMENT 'Identificador de la tabla Area conectado como clave foranea',
  PRIMARY KEY (`id_emplea`),
  KEY `idx_empleado_id_area` (`id_area`)
) ENGINE=MyISAM AUTO_INCREMENT=17 DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `empleado`
--

INSERT INTO `empleado` (`id_emplea`, `emplea_nombre`, `emplea_apellido`, `emplea_celular`, `emplea_DNI`, `id_area`) VALUES
(8, 'luis', 'lopez', '943234987', '32099876', 1),
(12, 'luis', 'lopez', '943234987', '32099876', 1),
(13, 'miguel', 'gonzales', '921818333', '32988544', 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `empresa`
--

DROP TABLE IF EXISTS `empresa`;
CREATE TABLE IF NOT EXISTS `empresa` (
  `id_empre` int(11) NOT NULL AUTO_INCREMENT COMMENT 'Identificador de la tabla Empresa',
  `empre_razon_social` varchar(255) DEFAULT NULL COMMENT 'Nombre completo de la Empresa',
  `empre_RUC` varchar(11) DEFAULT NULL COMMENT 'RUC de la Empresa',
  `empre_correo` varchar(255) DEFAULT NULL COMMENT 'Correo de la Empresa',
  `id_direc` int(11) NOT NULL COMMENT 'Identificador de la tabla Direccion conectado como clave foranea',
  `id_factu` int(11) NOT NULL COMMENT 'Identificador de la tabla Factura conectado como clave foranea',
  PRIMARY KEY (`id_empre`),
  KEY `idx_empresa_id_direc` (`id_direc`),
  KEY `idx_empresa_id_factu` (`id_factu`)
) ENGINE=MyISAM AUTO_INCREMENT=5 DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `factura`
--

DROP TABLE IF EXISTS `factura`;
CREATE TABLE IF NOT EXISTS `factura` (
  `id_factu` int(11) NOT NULL AUTO_INCREMENT COMMENT 'Identificador de la tabla Factura',
  `factu_pagototal` decimal(10,0) DEFAULT NULL COMMENT 'Pago total de la Factura',
  `factu_subtotal` decimal(10,0) DEFAULT NULL COMMENT 'Subtotal de la Factura',
  `factu_IGV` int(11) DEFAULT NULL COMMENT 'IGV de la Factura',
  `factu_fecha_pago` datetime DEFAULT NULL COMMENT 'Fecha de pago de la Factura',
  PRIMARY KEY (`id_factu`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `moneda`
--

DROP TABLE IF EXISTS `moneda`;
CREATE TABLE IF NOT EXISTS `moneda` (
  `id_mone` int(11) NOT NULL AUTO_INCREMENT COMMENT 'Identificador de la tabla Moneda',
  `mone_tipo` varchar(20) DEFAULT NULL COMMENT 'Tipo de Moneda (ejem. soles)',
  `mone_simbolo` varchar(3) DEFAULT NULL COMMENT 'Simbolo de la Moneda (ejem. S/.)',
  PRIMARY KEY (`id_mone`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `pago`
--

DROP TABLE IF EXISTS `pago`;
CREATE TABLE IF NOT EXISTS `pago` (
  `id_pag` int(11) NOT NULL AUTO_INCREMENT COMMENT 'Identificador de la tabla Pago',
  `pag_tipo` varchar(30) DEFAULT NULL COMMENT 'Tipo de Pago (ejem. contado, cuotas)',
  `id_mone` int(11) NOT NULL COMMENT 'Identificador de la tabla Moneda conectado como clave foranea',
  PRIMARY KEY (`id_pag`),
  KEY `idx_pago_id_mone` (`id_mone`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `provincia`
--

DROP TABLE IF EXISTS `provincia`;
CREATE TABLE IF NOT EXISTS `provincia` (
  `id_prov` int(11) NOT NULL AUTO_INCREMENT COMMENT 'Identificador de la tabla Provincia',
  `prov_nombre` varchar(50) DEFAULT NULL COMMENT 'Nombre de la Provincia',
  `prov_coord_utm` varchar(255) DEFAULT NULL COMMENT 'Coordenada UTM de la Provincia',
  `id_distri` int(11) NOT NULL COMMENT 'Identificador de la tabla Distrito conectado como clave foranea',
  PRIMARY KEY (`id_prov`),
  KEY `idx_provincia_id_distri` (`id_distri`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `servicio`
--

DROP TABLE IF EXISTS `servicio`;
CREATE TABLE IF NOT EXISTS `servicio` (
  `id_serv` int(11) NOT NULL AUTO_INCREMENT COMMENT 'Identificador de la tabla Servicio',
  `serv_nombre` varchar(50) DEFAULT NULL COMMENT 'Nombre del Servicio',
  `serv_descrip` varchar(255) DEFAULT NULL COMMENT 'Descripcion del Servicio',
  PRIMARY KEY (`id_serv`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tipo_usuario`
--

DROP TABLE IF EXISTS `tipo_usuario`;
CREATE TABLE IF NOT EXISTS `tipo_usuario` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `tipo` varchar(50) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `tipo_usuario`
--

INSERT INTO `tipo_usuario` (`id`, `tipo`) VALUES
(1, 'Administrador'),
(2, 'Usuario');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `usuarios`
--

DROP TABLE IF EXISTS `usuarios`;
CREATE TABLE IF NOT EXISTS `usuarios` (
  `id_usuario` int(11) NOT NULL AUTO_INCREMENT,
  `usuario` varchar(20) DEFAULT NULL,
  `password` varchar(20) DEFAULT NULL,
  `correo` varchar(35) DEFAULT NULL,
  `fechare` date DEFAULT NULL,
  `id_tipo` int(11) DEFAULT NULL,
  `id_emplea` int(11) DEFAULT NULL,
  PRIMARY KEY (`id_usuario`),
  KEY `id_tipo` (`id_tipo`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `usuarios`
--

INSERT INTO `usuarios` (`id_usuario`, `usuario`, `password`, `correo`, `fechare`, `id_tipo`, `id_emplea`) VALUES
(1, 'jj', 'jj', 'jomattaromualdo@gmail.com', '0000-00-00', 1, 1),
(2, 'tt', 'tt', 'pocofloro01@gmail.com', '2019-06-05', 2, 12),
(3, 'hh', 'hh', 'jessi@gmail.com', '2019-06-05', 2, 13),
(4, NULL, NULL, NULL, NULL, NULL, NULL),
(5, 'ff', 'ff', 'nando.1830@gmail.com ', '1995-05-21', 1, 13);

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `usuarios`
--
ALTER TABLE `usuarios`
  ADD CONSTRAINT `usuarios_ibfk_1` FOREIGN KEY (`id_tipo`) REFERENCES `tipo_usuario` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
