-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1:3307
-- Tiempo de generación: 27-07-2023 a las 03:14:45
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
-- Base de datos: `tpfinal`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `cuenta`
--

CREATE TABLE `cuenta` (
  `nro_cuenta` int(11) NOT NULL,
  `saldo` double NOT NULL DEFAULT 0,
  `tipo_cuenta` int(11) NOT NULL,
  `tipo_moneda` int(11) NOT NULL,
  `usuario` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `cuenta`
--

INSERT INTO `cuenta` (`nro_cuenta`, `saldo`, `tipo_cuenta`, `tipo_moneda`, `usuario`) VALUES
(1, 3301, 1, 1, 1),
(2, 85, 1, 2, 1),
(3, 1750, 2, 1, 2),
(4, 0, 1, 1, 3),
(5, 5, 2, 1, 1),
(6, 5, 1, 2, 1),
(7, 291.5, 2, 2, 2);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tipo_cuenta`
--

CREATE TABLE `tipo_cuenta` (
  `id` int(11) NOT NULL,
  `nombre` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `tipo_cuenta`
--

INSERT INTO `tipo_cuenta` (`id`, `nombre`) VALUES
(1, 'Caja Ahorro'),
(2, 'Cuenta Corriente');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tipo_moneda`
--

CREATE TABLE `tipo_moneda` (
  `id` int(11) NOT NULL,
  `nombre` varchar(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `tipo_moneda`
--

INSERT INTO `tipo_moneda` (`id`, `nombre`) VALUES
(1, 'ARS'),
(2, 'US');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tipo_transaccion`
--

CREATE TABLE `tipo_transaccion` (
  `id` int(11) NOT NULL,
  `nombre` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `tipo_transaccion`
--

INSERT INTO `tipo_transaccion` (`id`, `nombre`) VALUES
(1, 'Deposito'),
(2, 'Extraccion'),
(3, 'Transferencia');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `transaccion`
--

CREATE TABLE `transaccion` (
  `nro_transaccion` int(11) NOT NULL,
  `tipo_transaccion` int(11) NOT NULL,
  `fecha` date NOT NULL DEFAULT current_timestamp(),
  `monto` double NOT NULL,
  `nro_cuenta_origen` int(11) NOT NULL,
  `nro_cuenta_destino` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `transaccion`
--

INSERT INTO `transaccion` (`nro_transaccion`, `tipo_transaccion`, `fecha`, `monto`, `nro_cuenta_origen`, `nro_cuenta_destino`) VALUES
(13, 2, '2023-07-23', 90, 7, NULL),
(14, 2, '2023-07-23', 180, 7, NULL),
(15, 1, '2023-07-23', 1, 7, NULL),
(16, 3, '2023-07-23', 5, 1, 5),
(17, 1, '2023-07-23', 555.5, 1, NULL),
(18, 3, '2023-07-23', 50, 1, 3),
(19, 3, '2023-07-23', 500, 1, 3),
(20, 2, '2023-07-26', 20, 7, NULL),
(21, 1, '2023-07-26', 500, 7, NULL),
(22, 2, '2023-07-26', 21, 7, NULL),
(23, 1, '2023-07-26', 1.5, 7, NULL),
(24, 3, '2023-07-26', 20, 7, 2),
(25, 2, '2023-07-26', 1100.5, 1, NULL),
(26, 1, '2023-07-26', 2500, 1, NULL),
(27, 1, '2023-07-26', 1, 1, NULL),
(28, 3, '2023-07-26', 1000, 1, 3),
(29, 3, '2023-07-26', 200, 1, 3),
(30, 3, '2023-07-26', 50, 7, 2),
(31, 3, '2023-07-26', 10, 7, 2),
(32, 3, '2023-07-26', 5, 7, 2),
(33, 2, '2023-07-26', 20, 6, NULL),
(34, 1, '2023-07-26', 10, 6, NULL),
(35, 3, '2023-07-26', 5, 6, 7);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `usuario`
--

CREATE TABLE `usuario` (
  `id` int(11) NOT NULL,
  `nombre` varchar(45) NOT NULL,
  `apellido` varchar(45) NOT NULL,
  `fecha_nacimiento` date NOT NULL,
  `pin` varchar(4) NOT NULL
) ;

--
-- Volcado de datos para la tabla `usuario`
--

INSERT INTO `usuario` (`id`, `nombre`, `apellido`, `fecha_nacimiento`, `pin`) VALUES
(1, 'Facundo', 'Neiman', '2003-11-06', '0611'),
(2, 'Lucas', 'Emens', '2003-07-07', '0707'),
(3, 'Facundo', 'Preiss', '2000-05-18', '0202'),
(5, 'Kevin', 'Colina', '2023-07-22', '0586');

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `cuenta`
--
ALTER TABLE `cuenta`
  ADD PRIMARY KEY (`nro_cuenta`),
  ADD KEY `fk_cuenta_tipo_cuenta` (`tipo_cuenta`),
  ADD KEY `fk_cuenta_tipo_moneda` (`tipo_moneda`),
  ADD KEY `fk_cuenta_usuario` (`usuario`);

--
-- Indices de la tabla `tipo_cuenta`
--
ALTER TABLE `tipo_cuenta`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `tipo_moneda`
--
ALTER TABLE `tipo_moneda`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `tipo_transaccion`
--
ALTER TABLE `tipo_transaccion`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `transaccion`
--
ALTER TABLE `transaccion`
  ADD PRIMARY KEY (`nro_transaccion`),
  ADD KEY `fk_transaccion_tipo_transaccion` (`tipo_transaccion`),
  ADD KEY `fk_transaccion_cuenta_origen` (`nro_cuenta_origen`),
  ADD KEY `fk_transaccion_cuenta_destino` (`nro_cuenta_destino`);

--
-- Indices de la tabla `usuario`
--
ALTER TABLE `usuario`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `cuenta`
--
ALTER TABLE `cuenta`
  MODIFY `nro_cuenta` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT de la tabla `tipo_cuenta`
--
ALTER TABLE `tipo_cuenta`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT de la tabla `tipo_moneda`
--
ALTER TABLE `tipo_moneda`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT de la tabla `tipo_transaccion`
--
ALTER TABLE `tipo_transaccion`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT de la tabla `transaccion`
--
ALTER TABLE `transaccion`
  MODIFY `nro_transaccion` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=36;

--
-- AUTO_INCREMENT de la tabla `usuario`
--
ALTER TABLE `usuario`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `cuenta`
--
ALTER TABLE `cuenta`
  ADD CONSTRAINT `fk_cuenta_tipo_cuenta` FOREIGN KEY (`tipo_cuenta`) REFERENCES `tipo_cuenta` (`id`),
  ADD CONSTRAINT `fk_cuenta_tipo_moneda` FOREIGN KEY (`tipo_moneda`) REFERENCES `tipo_moneda` (`id`),
  ADD CONSTRAINT `fk_cuenta_usuario` FOREIGN KEY (`usuario`) REFERENCES `usuario` (`id`);

--
-- Filtros para la tabla `transaccion`
--
ALTER TABLE `transaccion`
  ADD CONSTRAINT `fk_transaccion_cuenta_destino` FOREIGN KEY (`nro_cuenta_destino`) REFERENCES `cuenta` (`nro_cuenta`),
  ADD CONSTRAINT `fk_transaccion_cuenta_origen` FOREIGN KEY (`nro_cuenta_origen`) REFERENCES `cuenta` (`nro_cuenta`),
  ADD CONSTRAINT `fk_transaccion_tipo_transaccion` FOREIGN KEY (`tipo_transaccion`) REFERENCES `tipo_transaccion` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
