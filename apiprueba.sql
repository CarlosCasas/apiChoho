-- phpMyAdmin SQL Dump
-- version 5.0.4
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 09-06-2022 a las 17:22:00
-- Versión del servidor: 10.4.16-MariaDB
-- Versión de PHP: 7.4.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `apiprueba`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `asesor`
--

CREATE TABLE `asesor` (
  `id_asesor` int(11) NOT NULL,
  `codigo_asesor` varchar(6) DEFAULT NULL,
  `name` varchar(100) DEFAULT NULL,
  `estado` int(11) DEFAULT 1,
  `fecha_reg` datetime DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `asesor`
--

INSERT INTO `asesor` (`id_asesor`, `codigo_asesor`, `name`, `estado`, `fecha_reg`) VALUES
(1, 'C001', 'asesor1', 1, '2022-06-08 16:38:58'),
(2, 'C002', 'asesor2', 1, '2022-06-08 16:38:58'),
(3, 'C003', 'asesor3', 1, '2022-06-08 16:38:58');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `cliente`
--

CREATE TABLE `cliente` (
  `id_cliente` int(11) NOT NULL,
  `codigo_cliente` varchar(6) DEFAULT NULL,
  `name` varchar(100) DEFAULT NULL,
  `estado` int(11) DEFAULT 1,
  `id_asesor` int(11) DEFAULT NULL,
  `fecha_reg` datetime DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `cliente`
--

INSERT INTO `cliente` (`id_cliente`, `codigo_cliente`, `name`, `estado`, `id_asesor`, `fecha_reg`) VALUES
(1, 'CL001', 'Cliente1', 1, 1, '2022-06-08 16:38:58'),
(2, 'CL002', 'Cliente2', 1, 1, '2022-06-08 16:38:58'),
(3, 'CL003', 'Cliente3', 1, 1, '2022-06-08 16:38:58'),
(4, 'CL004', 'Cliente4', 1, 2, '2022-06-08 16:38:58'),
(5, 'CL005', 'Cliente5', 1, 2, '2022-06-08 16:38:58'),
(6, 'CL006', 'Cliente6', 1, 2, '2022-06-08 16:38:58'),
(7, 'CL007', 'Cliente7', 1, 3, '2022-06-08 16:38:58'),
(8, 'CL008', 'Cliente8', 1, 3, '2022-06-08 16:38:58'),
(9, 'CL009', 'Cliente9', 1, 1, '2022-06-08 16:38:58'),
(10, 'CL010', 'Cliente10', 1, 1, '2022-06-08 16:38:58');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `pedido`
--

CREATE TABLE `pedido` (
  `id_pedido` int(11) NOT NULL,
  `estado` varchar(10) DEFAULT NULL,
  `fecha_pago` datetime DEFAULT NULL,
  `id_cliente` int(11) DEFAULT NULL,
  `fecha_reg` datetime DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `pedido`
--

INSERT INTO `pedido` (`id_pedido`, `estado`, `fecha_pago`, `id_cliente`, `fecha_reg`) VALUES
(1, 'Pendiente', '2022-06-08 16:38:58', 1, '2022-06-08 16:38:58'),
(2, 'Pagado', '2022-06-08 16:38:58', 1, '2022-06-08 16:38:58'),
(3, 'Pagado', '2022-06-08 16:38:58', 1, '2022-06-08 16:38:58'),
(4, 'Pagado', '2022-06-08 16:38:58', 4, '2022-06-08 16:38:58'),
(5, 'Pagado', '2022-06-08 16:38:58', 4, '2022-06-08 16:38:58');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `pedido_producto`
--

CREATE TABLE `pedido_producto` (
  `id_ped_prod` int(11) NOT NULL,
  `id_pedido` int(11) DEFAULT NULL,
  `id_producto` int(11) DEFAULT NULL,
  `cantidad` int(11) DEFAULT NULL,
  `fecha_reg` datetime DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `pedido_producto`
--

INSERT INTO `pedido_producto` (`id_ped_prod`, `id_pedido`, `id_producto`, `cantidad`, `fecha_reg`) VALUES
(1, 1, 1, 2, '2022-06-08 16:38:58'),
(2, 1, 2, 3, '2022-06-08 16:38:58'),
(3, 2, 2, 5, '2022-06-08 16:38:58'),
(4, 2, 3, 5, '2022-06-08 16:38:58'),
(5, 2, 4, 5, '2022-06-08 16:38:58'),
(6, 3, 2, 10, '2022-06-08 16:38:58'),
(7, 4, 4, 6, '2022-06-08 16:38:58'),
(8, 5, 1, 4, '2022-06-08 16:38:58');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `producto`
--

CREATE TABLE `producto` (
  `id_producto` int(11) NOT NULL,
  `tipo` varchar(20) DEFAULT NULL,
  `name` varchar(100) DEFAULT NULL,
  `stock` int(11) DEFAULT NULL,
  `valor_unitario` double(12,3) DEFAULT NULL,
  `estado` int(11) DEFAULT 1,
  `fecha_reg` datetime DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `producto`
--

INSERT INTO `producto` (`id_producto`, `tipo`, `name`, `stock`, `valor_unitario`, `estado`, `fecha_reg`) VALUES
(1, 'cadenas', 'productoC1', 50, 20.000, 1, '2022-06-08 16:38:58'),
(2, 'Espejos', 'productoE1', 100, 8.000, 1, '2022-06-08 16:38:58'),
(3, 'Bobinas', 'productoB1', 80, 150.000, 1, '2022-06-08 16:38:58'),
(4, 'Pitos', 'productoPi1', 50, 30.000, 1, '2022-06-08 16:38:58');

-- --------------------------------------------------------

--
-- Estructura Stand-in para la vista `vw_proyecion_ventas`
-- (Véase abajo para la vista actual)
--
CREATE TABLE `vw_proyecion_ventas` (
`codigo_asesor` varchar(6)
,`name_asesor` varchar(100)
,`cliente_asignados` bigint(21)
,`total_pedido_asesor` decimal(42,0)
,`id_cliente` int(11)
,`total_pedidos_cliente` bigint(21)
,`name_cliente` varchar(100)
,`id_pedido` int(11)
,`total_productos` bigint(21)
,`total_pedido` double(20,3)
,`estado` varchar(10)
,`fecha_pago` datetime
,`id_producto` int(11)
,`tipo` varchar(20)
,`cantidad` int(11)
,`valor_unitario` double(12,3)
,`total` double(20,3)
);

-- --------------------------------------------------------

--
-- Estructura Stand-in para la vista `vw_resumen_asesor`
-- (Véase abajo para la vista actual)
--
CREATE TABLE `vw_resumen_asesor` (
`codigo_asesor` varchar(6)
,`name_asesor` varchar(100)
,`cliente_asignados` bigint(21)
,`total_pedido` decimal(42,0)
,`id_asesor` int(11)
);

-- --------------------------------------------------------

--
-- Estructura Stand-in para la vista `vw_resumen_cliente`
-- (Véase abajo para la vista actual)
--
CREATE TABLE `vw_resumen_cliente` (
`id_cliente` int(11)
,`total_pedidos` bigint(21)
,`name_cliente` varchar(100)
,`id_asesor` int(11)
);

-- --------------------------------------------------------

--
-- Estructura Stand-in para la vista `vw_resumen_pedido`
-- (Véase abajo para la vista actual)
--
CREATE TABLE `vw_resumen_pedido` (
`id_pedido` int(11)
,`total_pedido` double(20,3)
,`total_productos` bigint(21)
,`estado` varchar(10)
,`fecha_pago` datetime
,`id_cliente` int(11)
,`id_asesor` int(11)
);

-- --------------------------------------------------------

--
-- Estructura Stand-in para la vista `vw_resumen_producto`
-- (Véase abajo para la vista actual)
--
CREATE TABLE `vw_resumen_producto` (
`id_pedido` int(11)
,`id_producto` int(11)
,`tipo` varchar(20)
,`cantidad` int(11)
,`valor_unitario` double(12,3)
,`total` double(20,3)
,`id_cliente` int(11)
,`id_asesor` int(11)
);

-- --------------------------------------------------------

--
-- Estructura para la vista `vw_proyecion_ventas`
--
DROP TABLE IF EXISTS `vw_proyecion_ventas`;

CREATE  VIEW `vw_proyecion_ventas`  AS SELECT `t5`.`codigo_asesor` AS `codigo_asesor`, `t5`.`name` AS `name_asesor`, `t6`.`cliente_asignados` AS `cliente_asignados`, `t6`.`total_pedido` AS `total_pedido_asesor`, `t4`.`id_cliente` AS `id_cliente`, `t8`.`total_pedidos` AS `total_pedidos_cliente`, `t4`.`name` AS `name_cliente`, `t2`.`id_pedido` AS `id_pedido`, `t7`.`total_productos` AS `total_productos`, `t7`.`total_pedido` AS `total_pedido`, `t2`.`estado` AS `estado`, `t2`.`fecha_pago` AS `fecha_pago`, `t1`.`id_producto` AS `id_producto`, `t3`.`tipo` AS `tipo`, `t1`.`cantidad` AS `cantidad`, `t3`.`valor_unitario` AS `valor_unitario`, `t1`.`cantidad`* `t3`.`valor_unitario` AS `total` FROM (((((((`pedido_producto` `t1` join `pedido` `t2` on(`t1`.`id_pedido` = `t2`.`id_pedido`)) join `producto` `t3` on(`t1`.`id_producto` = `t3`.`id_producto`)) join `cliente` `t4` on(`t2`.`id_cliente` = `t4`.`id_cliente`)) join `asesor` `t5` on(`t4`.`id_asesor` = `t5`.`id_asesor`)) left join (select `a1`.`id_asesor` AS `id_asesor`,count(1) AS `cliente_asignados`,sum(ifnull(`a2`.`total_pedido`,0)) AS `total_pedido` from (`cliente` `a1` left join (select `pedido`.`id_cliente` AS `id_cliente`,count(1) AS `total_pedido` from `pedido` group by `pedido`.`id_cliente`) `a2` on(`a1`.`id_cliente` = `a2`.`id_cliente`)) group by `a1`.`id_asesor`) `t6` on(`t5`.`id_asesor` = `t6`.`id_asesor`)) join `vw_resumen_pedido` `t7` on(`t2`.`id_pedido` = `t7`.`id_pedido`)) join `vw_resumen_cliente` `t8` on(`t4`.`id_cliente` = `t8`.`id_cliente`)) ;

-- --------------------------------------------------------

--
-- Estructura para la vista `vw_resumen_asesor`
--
DROP TABLE IF EXISTS `vw_resumen_asesor`;

CREATE  VIEW `vw_resumen_asesor`  AS SELECT `t1`.`codigo_asesor` AS `codigo_asesor`, `t1`.`name` AS `name_asesor`, `t2`.`cliente_asignados` AS `cliente_asignados`, `t2`.`total_pedido` AS `total_pedido`, `t1`.`id_asesor` AS `id_asesor` FROM (`asesor` `t1` left join (select `a1`.`id_asesor` AS `id_asesor`,count(1) AS `cliente_asignados`,sum(ifnull(`a2`.`total_pedido`,0)) AS `total_pedido` from (`cliente` `a1` left join (select `pedido`.`id_cliente` AS `id_cliente`,count(1) AS `total_pedido` from `pedido` group by `pedido`.`id_cliente`) `a2` on(`a1`.`id_cliente` = `a2`.`id_cliente`)) group by `a1`.`id_asesor`) `t2` on(`t1`.`id_asesor` = `t2`.`id_asesor`)) ;

-- --------------------------------------------------------

--
-- Estructura para la vista `vw_resumen_cliente`
--
DROP TABLE IF EXISTS `vw_resumen_cliente`;

CREATE  VIEW `vw_resumen_cliente`  AS SELECT `t1`.`id_cliente` AS `id_cliente`, ifnull(`t2`.`total_pedido`,0) AS `total_pedidos`, `t1`.`name` AS `name_cliente`, `t1`.`id_asesor` AS `id_asesor` FROM (`cliente` `t1` join (select `pedido`.`id_cliente` AS `id_cliente`,count(1) AS `total_pedido` from `pedido` group by `pedido`.`id_cliente`) `t2` on(`t1`.`id_cliente` = `t2`.`id_cliente`)) ;

-- --------------------------------------------------------

--
-- Estructura para la vista `vw_resumen_pedido`
--
DROP TABLE IF EXISTS `vw_resumen_pedido`;

CREATE  VIEW `vw_resumen_pedido`  AS SELECT `t1`.`id_pedido` AS `id_pedido`, (select sum(`b`.`valor_unitario` * `a`.`cantidad`) AS `total` from (`pedido_producto` `a` join `producto` `b` on(`a`.`id_producto` = `b`.`id_producto`)) where `a`.`id_pedido` = `t1`.`id_pedido` group by `a`.`id_pedido`) AS `total_pedido`, ifnull(`t2`.`total_productos`,0) AS `total_productos`, `t1`.`estado` AS `estado`, `t1`.`fecha_pago` AS `fecha_pago`, `t1`.`id_cliente` AS `id_cliente`, `t3`.`id_asesor` AS `id_asesor` FROM ((`pedido` `t1` join (select `pedido_producto`.`id_pedido` AS `id_pedido`,count(1) AS `total_productos` from `pedido_producto` group by `pedido_producto`.`id_pedido`) `t2` on(`t1`.`id_pedido` = `t2`.`id_pedido`)) join `cliente` `t3` on(`t1`.`id_cliente` = `t3`.`id_cliente`)) ;

-- --------------------------------------------------------

--
-- Estructura para la vista `vw_resumen_producto`
--
DROP TABLE IF EXISTS `vw_resumen_producto`;

CREATE  VIEW `vw_resumen_producto`  AS SELECT `t1`.`id_pedido` AS `id_pedido`, `t1`.`id_producto` AS `id_producto`, `t3`.`tipo` AS `tipo`, `t1`.`cantidad` AS `cantidad`, `t3`.`valor_unitario` AS `valor_unitario`, `t1`.`cantidad`* `t3`.`valor_unitario` AS `total`, `t2`.`id_cliente` AS `id_cliente`, `t4`.`id_asesor` AS `id_asesor` FROM (((`pedido_producto` `t1` join `pedido` `t2` on(`t1`.`id_pedido` = `t2`.`id_pedido`)) join `producto` `t3` on(`t1`.`id_producto` = `t3`.`id_producto`)) join `cliente` `t4` on(`t2`.`id_cliente` = `t4`.`id_cliente`)) ;

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `asesor`
--
ALTER TABLE `asesor`
  ADD PRIMARY KEY (`id_asesor`),
  ADD KEY `idx_asesor_id_asesor` (`id_asesor`);

--
-- Indices de la tabla `cliente`
--
ALTER TABLE `cliente`
  ADD PRIMARY KEY (`id_cliente`),
  ADD KEY `idx_asesor_id_cliente` (`id_asesor`),
  ADD KEY `idx_cliente_id_cliente` (`id_cliente`);

--
-- Indices de la tabla `pedido`
--
ALTER TABLE `pedido`
  ADD PRIMARY KEY (`id_pedido`),
  ADD KEY `idx_cliente_id_pedido` (`id_cliente`);

--
-- Indices de la tabla `pedido_producto`
--
ALTER TABLE `pedido_producto`
  ADD PRIMARY KEY (`id_ped_prod`),
  ADD KEY `id_pedido` (`id_pedido`),
  ADD KEY `id_producto` (`id_producto`);

--
-- Indices de la tabla `producto`
--
ALTER TABLE `producto`
  ADD PRIMARY KEY (`id_producto`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `asesor`
--
ALTER TABLE `asesor`
  MODIFY `id_asesor` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT de la tabla `cliente`
--
ALTER TABLE `cliente`
  MODIFY `id_cliente` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT de la tabla `pedido`
--
ALTER TABLE `pedido`
  MODIFY `id_pedido` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT de la tabla `pedido_producto`
--
ALTER TABLE `pedido_producto`
  MODIFY `id_ped_prod` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT de la tabla `producto`
--
ALTER TABLE `producto`
  MODIFY `id_producto` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `cliente`
--
ALTER TABLE `cliente`
  ADD CONSTRAINT `cliente_ibfk_1` FOREIGN KEY (`id_asesor`) REFERENCES `asesor` (`id_asesor`);

--
-- Filtros para la tabla `pedido`
--
ALTER TABLE `pedido`
  ADD CONSTRAINT `pedido_ibfk_1` FOREIGN KEY (`id_cliente`) REFERENCES `cliente` (`id_cliente`);

--
-- Filtros para la tabla `pedido_producto`
--
ALTER TABLE `pedido_producto`
  ADD CONSTRAINT `pedido_producto_ibfk_1` FOREIGN KEY (`id_pedido`) REFERENCES `pedido` (`id_pedido`),
  ADD CONSTRAINT `pedido_producto_ibfk_2` FOREIGN KEY (`id_producto`) REFERENCES `producto` (`id_producto`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
