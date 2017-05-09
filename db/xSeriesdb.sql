-- phpMyAdmin SQL Dump
-- version 3.5.1
-- http://www.phpmyadmin.net
--
-- Servidor: localhost
-- Tiempo de generación: 09-05-2017 a las 03:04:22
-- Versión del servidor: 5.5.24-log
-- Versión de PHP: 5.4.3

SET SQL_MODE="NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Base de datos: `xseriesdb`
--
CREATE DATABASE `xseriesdb` DEFAULT CHARACTER SET utf8 COLLATE utf8_spanish_ci;
USE `xseriesdb`;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `clientes`
--

DROP TABLE IF EXISTS `clientes`;
CREATE TABLE IF NOT EXISTS `clientes` (
  `id_cliente` int(11) NOT NULL AUTO_INCREMENT,
  `nombre_cliente` varchar(200) COLLATE utf8_spanish_ci NOT NULL,
  `contacto_cliente` varchar(200) COLLATE utf8_spanish_ci NOT NULL,
  `telefono_cliente` varchar(10) COLLATE utf8_spanish_ci NOT NULL,
  UNIQUE KEY `idcliente` (`id_cliente`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci AUTO_INCREMENT=3 ;

--
-- Volcado de datos para la tabla `clientes`
--

INSERT INTO `clientes` (`id_cliente`, `nombre_cliente`, `contacto_cliente`, `telefono_cliente`) VALUES
(1, 'Banco Agricola ', 'Pablo Meléndez', '2224-1234'),
(2, 'ScotiaBank', 'Rodrigo Reina', '2256-3421');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `equipos`
--

DROP TABLE IF EXISTS `equipos`;
CREATE TABLE IF NOT EXISTS `equipos` (
  `id_equipo` int(11) NOT NULL AUTO_INCREMENT,
  `id_partes` int(11) NOT NULL,
  `id_serie` int(11) NOT NULL,
  UNIQUE KEY `id_equipo` (`id_equipo`),
  KEY `id_partes` (`id_partes`),
  KEY `id_serie` (`id_serie`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `login`
--

DROP TABLE IF EXISTS `login`;
CREATE TABLE IF NOT EXISTS `login` (
  `id_usuario` int(11) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(200) COLLATE utf8_spanish_ci NOT NULL,
  `password` text COLLATE utf8_spanish_ci NOT NULL,
  UNIQUE KEY `id_user` (`id_usuario`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `modelo`
--

DROP TABLE IF EXISTS `modelo`;
CREATE TABLE IF NOT EXISTS `modelo` (
  `id_modelo` int(11) NOT NULL AUTO_INCREMENT,
  `tipo_modelo` varchar(50) COLLATE utf8_spanish_ci NOT NULL,
  `nombre_modelo` varchar(50) COLLATE utf8_spanish_ci NOT NULL,
  UNIQUE KEY `modeloid` (`id_modelo`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `partes`
--

DROP TABLE IF EXISTS `partes`;
CREATE TABLE IF NOT EXISTS `partes` (
  `id_partes` int(11) NOT NULL AUTO_INCREMENT,
  `fru_partes` varchar(100) COLLATE utf8_spanish_ci NOT NULL,
  `sustituto_partes` varchar(100) COLLATE utf8_spanish_ci NOT NULL,
  `desc_partes` varchar(200) COLLATE utf8_spanish_ci NOT NULL,
  `fotografia_parte` blob NOT NULL,
  UNIQUE KEY `id_partes` (`id_partes`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `proyecto`
--

DROP TABLE IF EXISTS `proyecto`;
CREATE TABLE IF NOT EXISTS `proyecto` (
  `id_proyecto` int(4) NOT NULL AUTO_INCREMENT,
  `descripcion` varchar(200) COLLATE utf8_spanish_ci NOT NULL,
  `attachment` text COLLATE utf8_spanish_ci NOT NULL,
  UNIQUE KEY `id_proy` (`id_proyecto`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `servers`
--

DROP TABLE IF EXISTS `servers`;
CREATE TABLE IF NOT EXISTS `servers` (
  `id_serie` int(11) NOT NULL AUTO_INCREMENT,
  `id_cliente` int(11) NOT NULL,
  `id_modelo` int(11) NOT NULL,
  `id_proyecto` int(11) NOT NULL,
  `contrato` varchar(50) COLLATE utf8_spanish_ci NOT NULL,
  `sitio` varchar(300) COLLATE utf8_spanish_ci NOT NULL,
  `fotografia_server` blob NOT NULL,
  UNIQUE KEY `id_serie` (`id_serie`),
  KEY `servers_idx_id_cliente01` (`id_cliente`),
  KEY `servers_idx_id_modelo01` (`id_modelo`),
  KEY `servers_idx_id_proyecto01` (`id_proyecto`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci AUTO_INCREMENT=1 ;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `equipos`
--
ALTER TABLE `equipos`
  ADD CONSTRAINT `equipos_ibfk_1` FOREIGN KEY (`id_partes`) REFERENCES `partes` (`id_partes`),
  ADD CONSTRAINT `equipos_ibfk_2` FOREIGN KEY (`id_serie`) REFERENCES `servers` (`id_serie`);

--
-- Filtros para la tabla `servers`
--
ALTER TABLE `servers`
  ADD CONSTRAINT `servers_ibfk_1` FOREIGN KEY (`id_cliente`) REFERENCES `clientes` (`id_cliente`),
  ADD CONSTRAINT `servers_ibfk_2` FOREIGN KEY (`id_modelo`) REFERENCES `modelo` (`id_modelo`),
  ADD CONSTRAINT `servers_ibfk_3` FOREIGN KEY (`id_proyecto`) REFERENCES `proyecto` (`id_proyecto`);

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
