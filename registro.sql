-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 25-05-2023 a las 06:14:28
-- Versión del servidor: 10.4.24-MariaDB
-- Versión de PHP: 8.1.6

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `registro`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `libro`
--

CREATE TABLE `libro` (
  `Id` int(11) NOT NULL,
  `Titulo` varchar(35) NOT NULL,
  `Autor` varchar(25) NOT NULL,
  `Codigo` varchar(20) NOT NULL,
  `Fecha` date NOT NULL,
  `copias` int(11) NOT NULL,
  `prestados` int(11) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `libro`
--

INSERT INTO `libro` (`Id`, `Titulo`, `Autor`, `Codigo`, `Fecha`, `copias`, `prestados`) VALUES
(1, 'Summa Teologica', 'Santo Tomas de Aquino', '123456', '2023-05-02', 3, 0),
(2, 'Holi', 'Sasman', '53649', '2023-05-04', 3, 0);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `persona`
--

CREATE TABLE `persona` (
  `Id` int(11) NOT NULL,
  `Nombres` varchar(30) NOT NULL,
  `Correo` varchar(35) NOT NULL,
  `Password` varchar(64) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `persona`
--

INSERT INTO `persona` (`Id`, `Nombres`, `Correo`, `Password`) VALUES
(1, 'Brayan', 'brayanalexanderbc@ufps.edu.co', 'edf9cf90718610ee7de53c0dcc250739239044de9ba115bb0ca6026c3e4958a5'),
(3, 'Sergio', 'sergioandresdeba@ufps.edu.co', 'ac41a6bcf968a840b937c5e0a75e643c5b80bc7d2830375771314e3f4cc48273');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `reserva`
--

CREATE TABLE `reserva` (
  `id_libro` int(11) NOT NULL,
  `id_persona` int(11) NOT NULL,
  `fecha_vence` date NOT NULL,
  `estado` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `reserva`
--

INSERT INTO `reserva` (`id_libro`, `id_persona`, `fecha_vence`, `estado`) VALUES
(1, 3, '2023-05-26', 'Pendiente');

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `libro`
--
ALTER TABLE `libro`
  ADD PRIMARY KEY (`Id`),
  ADD UNIQUE KEY `Codigo` (`Codigo`);

--
-- Indices de la tabla `persona`
--
ALTER TABLE `persona`
  ADD PRIMARY KEY (`Id`),
  ADD UNIQUE KEY `Correo` (`Correo`);

--
-- Indices de la tabla `reserva`
--
ALTER TABLE `reserva`
  ADD KEY `id_libro` (`id_libro`),
  ADD KEY `id_persona` (`id_persona`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `libro`
--
ALTER TABLE `libro`
  MODIFY `Id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT de la tabla `persona`
--
ALTER TABLE `persona`
  MODIFY `Id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `reserva`
--
ALTER TABLE `reserva`
  ADD CONSTRAINT `reserva_ibfk_1` FOREIGN KEY (`id_persona`) REFERENCES `persona` (`Id`),
  ADD CONSTRAINT `reserva_ibfk_2` FOREIGN KEY (`id_libro`) REFERENCES `libro` (`Id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
