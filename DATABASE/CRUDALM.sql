-- phpMyAdmin SQL Dump
-- version 4.7.0
-- https://www.phpmyadmin.net/
--
-- Servidor: localhost
-- Tiempo de generación: 07-05-2017 a las 21:30:10
-- Versión del servidor: 10.1.21-MariaDB
-- Versión de PHP: 5.6.30

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `CRUDALM`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `KEYBOARD`
--

CREATE TABLE `KEYBOARD` (
  `ID` int(11) UNSIGNED NOT NULL,
  `BRAND` varchar(40) CHARACTER SET ucs2 COLLATE ucs2_spanish2_ci DEFAULT NULL,
  `MODEL` varchar(40) CHARACTER SET ucs2 COLLATE ucs2_spanish2_ci DEFAULT NULL,
  `TYPE` varchar(20) CHARACTER SET ucs2 COLLATE ucs2_spanish2_ci DEFAULT NULL,
  `STOCK` int(11) NOT NULL DEFAULT '0',
  `PRICE` double UNSIGNED DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

--
-- Volcado de datos para la tabla `KEYBOARD`
--

INSERT INTO `KEYBOARD` (`ID`, `BRAND`, `MODEL`, `TYPE`, `STOCK`, `PRICE`) VALUES
(6, 'Ozone', 'Strike Pro', 'Mechanical', 2, 120.25),
(7, 'Razer', 'Ornata', 'Hybrid', 0, 72.95),
(8, 'Razer', 'BlackWidow', 'Mechanical', 5, 189.95),
(9, 'Ozone', 'Strike Battle', 'Mechanical', 0, 70);

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `KEYBOARD`
--
ALTER TABLE `KEYBOARD`
  ADD PRIMARY KEY (`ID`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `KEYBOARD`
--
ALTER TABLE `KEYBOARD`
  MODIFY `ID` int(11) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
