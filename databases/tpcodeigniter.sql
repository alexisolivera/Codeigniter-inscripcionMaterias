-- phpMyAdmin SQL Dump
-- version 4.8.0.1
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 07-12-2018 a las 02:16:54
-- Versión del servidor: 10.1.32-MariaDB
-- Versión de PHP: 7.2.5

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `tpcodeigniter`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `alumnos`
--

CREATE TABLE `alumnos` (
  `id` int(10) UNSIGNED NOT NULL,
  `apellido` varchar(50) NOT NULL,
  `nombre` varchar(50) NOT NULL,
  `telefono` varchar(30) NOT NULL,
  `id_usuario` int(10) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `alumnos`
--

INSERT INTO `alumnos` (`id`, `apellido`, `nombre`, `telefono`, `id_usuario`) VALUES
(8, 'Olivera', 'Alexis', '', 3),
(352, 'Tomas', 'Yamir', '', 5);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `asistencia`
--

CREATE TABLE `asistencia` (
  `fecha` date NOT NULL,
  `id_materia` int(10) UNSIGNED NOT NULL,
  `id_alumno` int(10) UNSIGNED NOT NULL,
  `id_situacion` tinyint(3) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `carreras`
--

CREATE TABLE `carreras` (
  `id` tinyint(3) UNSIGNED NOT NULL,
  `descripcion` varchar(70) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `carreras`
--

INSERT INTO `carreras` (`id`, `descripcion`) VALUES
(1, 'Desarrollo de Software'),
(2, 'Analista Funcional');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `docentes`
--

CREATE TABLE `docentes` (
  `id` int(10) UNSIGNED NOT NULL,
  `apellido` varchar(50) NOT NULL,
  `nombre` varchar(50) NOT NULL,
  `telefono` varchar(30) NOT NULL,
  `es_preceptor` tinyint(1) NOT NULL DEFAULT '0',
  `es_directivo` tinyint(1) NOT NULL DEFAULT '0',
  `id_usuario` int(10) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `docentes`
--

INSERT INTO `docentes` (`id`, `apellido`, `nombre`, `telefono`, `es_preceptor`, `es_directivo`, `id_usuario`) VALUES
(1, 'Marquez', 'Juan', '156123123', 0, 0, 6),
(2, 'Perez', 'Gonzalo', '155789987', 0, 0, 4);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `inscripciones`
--

CREATE TABLE `inscripciones` (
  `id_alumno` int(10) UNSIGNED NOT NULL,
  `id_materia` int(10) UNSIGNED NOT NULL,
  `anio_cursado` year(4) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `materias`
--

CREATE TABLE `materias` (
  `id_materia` int(10) UNSIGNED NOT NULL,
  `curso` tinyint(3) UNSIGNED NOT NULL,
  `division` tinyint(3) UNSIGNED NOT NULL,
  `id_carrera` tinyint(3) UNSIGNED NOT NULL,
  `id_docente` int(10) UNSIGNED DEFAULT NULL,
  `descripcion` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `materias`
--

INSERT INTO `materias` (`id_materia`, `curso`, `division`, `id_carrera`, `id_docente`, `descripcion`) VALUES
(101, 1, 1, 1, 1, 'Tecnologia de la Informacion'),
(102, 1, 2, 1, 1, 'Tecnologia de la Informacion'),
(103, 1, 1, 1, 2, 'Ingenieria de Software 1'),
(104, 1, 2, 1, 2, 'Ingenieria de Software 1'),
(105, 1, 1, 1, 2, 'Sistemas Operativos'),
(106, 1, 2, 1, 1, 'Sistemas Operativos'),
(107, 2, 1, 1, 1, 'Ingenieria de Software 2'),
(108, 2, 2, 1, 2, 'Ingenieria de Software 2'),
(109, 2, 1, 1, 1, 'Programacion 1'),
(110, 2, 2, 1, 1, 'Programacion 1'),
(111, 1, 1, 2, 1, 'Ingles Tecnico 1'),
(112, 1, 2, 2, 2, 'Ingles Tecnico 1'),
(113, 1, 1, 2, 1, 'Arquitectura de las computadoras'),
(114, 1, 2, 2, 2, 'Arquitectura de las computadoras'),
(115, 2, 1, 2, 1, 'Estrategias de negocios'),
(116, 2, 2, 2, 2, 'Estrategias de negocios'),
(117, 2, 1, 2, 2, 'Gestion de Software'),
(118, 2, 2, 2, 1, 'Gestion de Software');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `roles`
--

CREATE TABLE `roles` (
  `id` tinyint(3) UNSIGNED NOT NULL,
  `descripcion` varchar(40) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `roles`
--

INSERT INTO `roles` (`id`, `descripcion`) VALUES
(1, 'maestro'),
(2, 'alumno');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `situaciones`
--

CREATE TABLE `situaciones` (
  `id` tinyint(3) UNSIGNED NOT NULL,
  `descripcion` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `usuarios`
--

CREATE TABLE `usuarios` (
  `id` int(10) UNSIGNED NOT NULL,
  `mail` varchar(60) NOT NULL,
  `clave` varchar(200) NOT NULL,
  `id_rol` tinyint(3) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `usuarios`
--

INSERT INTO `usuarios` (`id`, `mail`, `clave`, `id_rol`) VALUES
(3, 'haolivera92@gmail.com', 'e10adc3949ba59abbe56e057f20f883e', 2),
(4, 'alexisolivera92@gmail.com', 'e10adc3949ba59abbe56e057f20f883e', 1),
(5, 'alumno@escuela', 'e10adc3949ba59abbe56e057f20f883e', 2),
(6, 'maestro@escuela', 'e10adc3949ba59abbe56e057f20f883e', 1);

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `alumnos`
--
ALTER TABLE `alumnos`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id_usuario` (`id_usuario`);

--
-- Indices de la tabla `asistencia`
--
ALTER TABLE `asistencia`
  ADD PRIMARY KEY (`fecha`,`id_materia`,`id_alumno`),
  ADD KEY `id_situacion` (`id_situacion`),
  ADD KEY `fk_materia` (`id_materia`),
  ADD KEY `fk_alumno` (`id_alumno`);

--
-- Indices de la tabla `carreras`
--
ALTER TABLE `carreras`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `docentes`
--
ALTER TABLE `docentes`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id_usuario` (`id_usuario`);

--
-- Indices de la tabla `inscripciones`
--
ALTER TABLE `inscripciones`
  ADD PRIMARY KEY (`id_alumno`,`id_materia`,`anio_cursado`),
  ADD KEY `fk_inscripcion_materia` (`id_materia`);

--
-- Indices de la tabla `materias`
--
ALTER TABLE `materias`
  ADD PRIMARY KEY (`id_materia`),
  ADD KEY `id_carrera` (`id_carrera`),
  ADD KEY `id_docente` (`id_docente`);

--
-- Indices de la tabla `roles`
--
ALTER TABLE `roles`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `situaciones`
--
ALTER TABLE `situaciones`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `usuarios`
--
ALTER TABLE `usuarios`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `mail` (`mail`),
  ADD KEY `id_rol` (`id_rol`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `alumnos`
--
ALTER TABLE `alumnos`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=353;

--
-- AUTO_INCREMENT de la tabla `carreras`
--
ALTER TABLE `carreras`
  MODIFY `id` tinyint(3) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT de la tabla `docentes`
--
ALTER TABLE `docentes`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT de la tabla `roles`
--
ALTER TABLE `roles`
  MODIFY `id` tinyint(3) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT de la tabla `situaciones`
--
ALTER TABLE `situaciones`
  MODIFY `id` tinyint(3) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `usuarios`
--
ALTER TABLE `usuarios`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `alumnos`
--
ALTER TABLE `alumnos`
  ADD CONSTRAINT `fk_usuario` FOREIGN KEY (`id_usuario`) REFERENCES `usuarios` (`id`) ON UPDATE CASCADE;

--
-- Filtros para la tabla `asistencia`
--
ALTER TABLE `asistencia`
  ADD CONSTRAINT `fk_alumno` FOREIGN KEY (`id_alumno`) REFERENCES `alumnos` (`id`) ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_materia` FOREIGN KEY (`id_materia`) REFERENCES `materias` (`id_materia`) ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_situacion` FOREIGN KEY (`id_situacion`) REFERENCES `situaciones` (`id`) ON UPDATE CASCADE;

--
-- Filtros para la tabla `docentes`
--
ALTER TABLE `docentes`
  ADD CONSTRAINT `fk_docente_usuario` FOREIGN KEY (`id_usuario`) REFERENCES `usuarios` (`id`) ON UPDATE CASCADE;

--
-- Filtros para la tabla `inscripciones`
--
ALTER TABLE `inscripciones`
  ADD CONSTRAINT `fk_inscripcion_alumno` FOREIGN KEY (`id_alumno`) REFERENCES `alumnos` (`id`) ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_inscripcion_materia` FOREIGN KEY (`id_materia`) REFERENCES `materias` (`id_materia`) ON UPDATE CASCADE;

--
-- Filtros para la tabla `materias`
--
ALTER TABLE `materias`
  ADD CONSTRAINT `fk_materia_carrera` FOREIGN KEY (`id_carrera`) REFERENCES `carreras` (`id`) ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_materia_docente` FOREIGN KEY (`id_docente`) REFERENCES `docentes` (`id`) ON UPDATE CASCADE;

--
-- Filtros para la tabla `usuarios`
--
ALTER TABLE `usuarios`
  ADD CONSTRAINT `fk_usuario_rol` FOREIGN KEY (`id_rol`) REFERENCES `roles` (`id`) ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
