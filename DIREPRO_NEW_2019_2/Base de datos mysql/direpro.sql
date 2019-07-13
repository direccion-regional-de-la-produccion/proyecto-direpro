-- phpMyAdmin SQL Dump
-- version 4.8.5
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1:3306
-- Tiempo de generación: 27-06-2019 a las 15:26:51
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
-- Base de datos: `direpro`
--
CREATE DATABASE IF NOT EXISTS `direpro` DEFAULT CHARACTER SET latin1 COLLATE latin1_swedish_ci;
USE `direpro`;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `clientes`
--

DROP TABLE IF EXISTS `clientes`;
CREATE TABLE IF NOT EXISTS `clientes` (
  `id_cliente` int(11) NOT NULL AUTO_INCREMENT,
  `nombre_cliente` varchar(255) NOT NULL,
  `telefono_cliente` char(30) NOT NULL,
  `email_cliente` varchar(64) NOT NULL,
  `direccion_cliente` varchar(255) NOT NULL,
  `status_cliente` tinyint(4) NOT NULL,
  `date_added` datetime NOT NULL,
  PRIMARY KEY (`id_cliente`),
  UNIQUE KEY `codigo_producto` (`nombre_cliente`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `currencies`
--

DROP TABLE IF EXISTS `currencies`;
CREATE TABLE IF NOT EXISTS `currencies` (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `name` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `symbol` varchar(255) NOT NULL,
  `precision` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `thousand_separator` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `decimal_separator` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `code` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=33 DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `currencies`
--

INSERT INTO `currencies` (`id`, `name`, `symbol`, `precision`, `thousand_separator`, `decimal_separator`, `code`) VALUES
(1, 'US Dollar', '$', '2', ',', '.', 'USD'),
(2, 'Libra Esterlina', '&pound;', '2', ',', '.', 'GBP'),
(3, 'Euro', 'â‚¬', '2', '.', ',', 'EUR'),
(9, 'Soles', 'S/', '1', ',', '.', 'PE'),
(11, 'Indian Rupee', 'Rs. ', '2', ',', '.', 'INR'),
(13, 'Singapore Dollar', 'SGD ', '2', ',', '.', 'SGD'),
(14, 'Norske Kroner', 'kr ', '2', '.', ',', 'NOK'),
(16, 'Vietnamese Dong', 'VND ', '0', '.', ',', 'VND'),
(17, 'Swiss Franc', 'CHF ', '2', '\'', '.', 'CHF'),
(18, 'Quetzal Guatemalteco', 'Q', '2', ',', '.', 'GTQ'),
(19, 'Malaysian Ringgit', 'RM', '2', ',', '.', 'MYR'),
(20, 'Real Brasile&ntilde;o', 'R$', '2', '.', ',', 'BRL'),
(21, 'Thai Baht', 'THB ', '2', ',', '.', 'THB'),
(22, 'Nigerian Naira', 'NGN ', '2', ',', '.', 'NGN'),
(23, 'Peso Argentino', '$', '2', '.', ',', 'ARS'),
(24, 'Bangladeshi Taka', 'Tk', '2', ',', '.', 'BDT'),
(25, 'United Arab Emirates Dirham', 'DH ', '2', ',', '.', 'AED'),
(26, 'Hong Kong Dollar', '$', '2', ',', '.', 'HKD'),
(27, 'Indonesian Rupiah', 'Rp', '2', ',', '.', 'IDR'),
(28, 'Peso Mexicano', '$', '2', ',', '.', 'MXN'),
(29, 'Egyptian Pound', '&pound;', '2', ',', '.', 'EGP'),
(30, 'Peso Colombiano', '$', '2', '.', ',', 'COP'),
(31, 'West African Franc', 'CFA ', '2', ',', '.', 'XOF'),
(32, 'Chinese Renminbi', 'RMB ', '2', ',', '.', 'CNY');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `detalle_factura`
--

DROP TABLE IF EXISTS `detalle_factura`;
CREATE TABLE IF NOT EXISTS `detalle_factura` (
  `id_detalle` int(11) NOT NULL AUTO_INCREMENT,
  `numero_factura` int(11) NOT NULL,
  `id_producto` int(11) NOT NULL,
  `cantidad` int(11) NOT NULL,
  `precio_venta` double NOT NULL,
  PRIMARY KEY (`id_detalle`),
  KEY `numero_cotizacion` (`numero_factura`,`id_producto`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `facturas`
--

DROP TABLE IF EXISTS `facturas`;
CREATE TABLE IF NOT EXISTS `facturas` (
  `id_factura` int(11) NOT NULL AUTO_INCREMENT,
  `numero_factura` int(11) NOT NULL,
  `fecha_factura` datetime NOT NULL,
  `id_cliente` int(11) NOT NULL,
  `id_vendedor` int(11) NOT NULL,
  `condiciones` varchar(30) NOT NULL,
  `total_venta` varchar(20) NOT NULL,
  `estado_factura` tinyint(1) NOT NULL,
  PRIMARY KEY (`id_factura`),
  UNIQUE KEY `numero_cotizacion` (`numero_factura`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `perfil`
--

DROP TABLE IF EXISTS `perfil`;
CREATE TABLE IF NOT EXISTS `perfil` (
  `id_perfil` int(11) NOT NULL AUTO_INCREMENT,
  `nombre_empresa` varchar(150) NOT NULL,
  `direccion` varchar(255) NOT NULL,
  `ciudad` varchar(100) NOT NULL,
  `codigo_postal` varchar(100) NOT NULL,
  `estado` varchar(100) NOT NULL,
  `telefono` varchar(20) NOT NULL,
  `email` varchar(64) NOT NULL,
  `impuesto` int(2) NOT NULL,
  `moneda` varchar(6) NOT NULL,
  `logo_url` varchar(255) NOT NULL,
  PRIMARY KEY (`id_perfil`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `perfil`
--

INSERT INTO `perfil` (`id_perfil`, `nombre_empresa`, `direccion`, `ciudad`, `codigo_postal`, `estado`, `telefono`, `email`, `impuesto`, `moneda`, `logo_url`) VALUES
(1, 'SISTEMAS WEB LA', 'Colonias Los Andes  #250', 'Moncagua', '3301', 'San Miguel', '+(503) 2682-555', 'info@obedalvarado.pw', 13, 'S/', 'img/1561648770_1511361403_log_1.png');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `products`
--

DROP TABLE IF EXISTS `products`;
CREATE TABLE IF NOT EXISTS `products` (
  `id_producto` int(11) NOT NULL AUTO_INCREMENT,
  `codigo_producto` char(20) NOT NULL,
  `nombre_producto` char(255) NOT NULL,
  `status_producto` tinyint(4) NOT NULL,
  `date_added` datetime NOT NULL,
  `precio_producto` double NOT NULL,
  PRIMARY KEY (`id_producto`),
  UNIQUE KEY `codigo_producto` (`codigo_producto`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `products`
--

INSERT INTO `products` (`id_producto`, `codigo_producto`, `nombre_producto`, `status_producto`, `date_added`, `precio_producto`) VALUES
(1, 'C_01', 'll', 1, '2019-06-27 05:34:02', 32);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tipouser`
--

DROP TABLE IF EXISTS `tipouser`;
CREATE TABLE IF NOT EXISTS `tipouser` (
  `id_tipo` int(11) NOT NULL AUTO_INCREMENT,
  `tipo` varchar(25) NOT NULL,
  PRIMARY KEY (`id_tipo`)
) ENGINE=MyISAM AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `tipouser`
--

INSERT INTO `tipouser` (`id_tipo`, `tipo`) VALUES
(1, 'Administrador'),
(2, 'Usuario'),
(3, 'Usuario');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tmp`
--

DROP TABLE IF EXISTS `tmp`;
CREATE TABLE IF NOT EXISTS `tmp` (
  `id_tmp` int(11) NOT NULL AUTO_INCREMENT,
  `id_producto` int(11) NOT NULL,
  `cantidad_tmp` int(11) NOT NULL,
  `precio_tmp` double(8,2) DEFAULT NULL,
  `session_id` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`id_tmp`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `users`
--

DROP TABLE IF EXISTS `users`;
CREATE TABLE IF NOT EXISTS `users` (
  `user_id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'auto incrementing user_id of each user, unique index',
  `firstname` varchar(20) COLLATE utf8_unicode_ci NOT NULL,
  `lastname` varchar(20) COLLATE utf8_unicode_ci NOT NULL,
  `user_name` varchar(64) COLLATE utf8_unicode_ci NOT NULL COMMENT 'user''s name, unique',
  `user_password_hash` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `user_email` varchar(64) COLLATE utf8_unicode_ci NOT NULL COMMENT 'user''s email, unique',
  `date_added` datetime NOT NULL,
  `id_tipo` int(11) DEFAULT NULL,
  PRIMARY KEY (`user_id`),
  UNIQUE KEY `user_name` (`user_name`),
  UNIQUE KEY `user_email` (`user_email`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='user data';

--
-- Volcado de datos para la tabla `users`
--

INSERT INTO `users` (`user_id`, `firstname`, `lastname`, `user_name`, `user_password_hash`, `user_email`, `date_added`, `id_tipo`) VALUES
(1, 'ff', 'ffff', 'admin', '$2y$10$MPVHzZ2ZPOWmtUUGCq3RXu31OTB.jo7M9LZ7PmPQYmgETSNn19ejO', 'jomdo@gmail.com', '2019-06-27 00:00:00', 1),
(4, 'll', 'lllllllllll', 'ko', 'admin', 'jomattaromualdo@gmail.com', '2019-06-27 07:04:44', 2),
(5, 'jjjj', 'kkkk', 'oo', 'admin', 'f0f@gmail.com', '2019-06-27 07:07:31', 2),
(6, 'ggg', 'hhh', 'ggg', '123456', 'ggg@gmail.com', '2019-06-27 07:11:16', 2),
(7, 'tt', 'ttt', 'tt', '123456', 't@hotmail.com', '2019-06-27 12:24:47', 2);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
