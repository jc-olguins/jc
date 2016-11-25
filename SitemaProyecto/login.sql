-- phpMyAdmin SQL Dump
-- version 4.1.12
-- http://www.phpmyadmin.net
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 24-11-2016 a las 09:54:28
-- Versión del servidor: 5.6.16
-- Versión de PHP: 5.5.11

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Base de datos: `login`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `administrador`
--

CREATE TABLE IF NOT EXISTS `administrador` (
  `id_admin` int(11) NOT NULL AUTO_INCREMENT,
  `usuario` varchar(128) NOT NULL,
  `contraseña` varchar(128) NOT NULL,
  PRIMARY KEY (`id_admin`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `calificar`
--

CREATE TABLE IF NOT EXISTS `calificar` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `idpregunta` int(11) NOT NULL,
  `idusuario` int(11) NOT NULL,
  `valor` int(11) NOT NULL,
  `idregistro` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `carreras`
--

CREATE TABLE IF NOT EXISTS `carreras` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `tipocarrera` varchar(128) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=3 ;

--
-- Volcado de datos para la tabla `carreras`
--

INSERT INTO `carreras` (`id`, `tipocarrera`) VALUES
(1, 'Sistemas Computacionales'),
(2, 'Electromecanica');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `categoria`
--

CREATE TABLE IF NOT EXISTS `categoria` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `Descricion` varchar(128) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=5 ;

--
-- Volcado de datos para la tabla `categoria`
--

INSERT INTO `categoria` (`id`, `Descricion`) VALUES
(1, 'FundamentosInv'),
(2, 'Hardware'),
(3, 'Redes'),
(4, 'Software');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `ejemplo`
--

CREATE TABLE IF NOT EXISTS `ejemplo` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(128) NOT NULL,
  `usuario` varchar(128) NOT NULL,
  `password` varchar(128) NOT NULL,
  `tipo_usuario` varchar(128) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `prefuntas`
--

CREATE TABLE IF NOT EXISTS `prefuntas` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `pregunta` text NOT NULL,
  `valor` int(11) NOT NULL,
  `idcategoria` int(11) NOT NULL,
  `face` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=16 ;

--
-- Volcado de datos para la tabla `prefuntas`
--

INSERT INTO `prefuntas` (`id`, `pregunta`, `valor`, `idcategoria`, `face`) VALUES
(1, 'El cartel es presentado bajo el formato establecido por la academia.  No presenta errores ortográficos o gramaticales. Evita que los elementos gráficos se vean pixeleados o no proporcionales a su tamaño original.', 10, 1, 1),
(2, 'El cartel incluye todas las secciones establecidas en la plantilla propuesta: resumen, antecedentes, objetivo general, metodología, resultados, conclusiones y referencias.', 10, 1, 1),
(3, 'El resumen expresar de forma precisa y abreviada el contenido del cartel bajo una redacción continua.', 5, 1, 1),
(4, 'Los antecedentes son una recopilación de la información que antecede a la investigación.', 10, 1, 1),
(5, 'Los objetivos, generales y específicos, son párrafos que responden implícitamente a las preguntas ¿qué se va a hacer? ¿para qué? Y ¿a través de qué?. El objetivo general es el enunciado de lo que se considera posible alcanzar. Los objetivos específicos son puntuales y contribuyen a lograr el objetivo central o general del proyecto.', 5, 1, 1),
(6, 'La metodología explica las técnicas, métodos y procedimientos utilizados para resolver el problema.', 10, 1, 1),
(7, 'Los resultados obtenidos de acorde al objetivo plateado, al procedimiento o método utilizado. Se presenta a través de la descripción o interpretación de los datos expresados en tablas, figuras, gráficos o esquemas.', 10, 1, 1),
(8, 'En las conclusiones se menciona en qué medida se cumplió con el objetivo, destacando la funcionalidad del prototipo generado.', 5, 1, 1),
(9, 'Las referencias bibliográficas o documentales se incluyen en formato APA.', 5, 1, 1),
(10, 'El equipo de trabajo se presenta con vestimenta formal, demostrando limpieza y esmero en su presentación. Inicia y termina puntualmente.', 5, 1, 1),
(11, 'La información que presenta es congruente con el cartel solicitado.', 5, 1, 1),
(12, 'Es claro que domina el tema, habla con seguridad.', 5, 1, 1),
(13, 'Trabaja positivamente en su expresión no verbal (gestos, miradas y lenguaje corporal).', 5, 1, 1),
(14, 'Modula su voz de manera que el grupo puede escuchar correctamente la exposición sin exceso de volumen.', 5, 1, 1),
(15, 'Demuestra trabajo en equipo. Soluciona imprevistos, demostrando profesionalismo.', 5, 1, 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `registro`
--

CREATE TABLE IF NOT EXISTS `registro` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `titulo` varchar(128) NOT NULL,
  `resumen` text NOT NULL,
  `autores` varchar(128) NOT NULL,
  `institucion` varchar(128) NOT NULL,
  `tipocarrera` varchar(128) NOT NULL,
  `semestre` varchar(11) NOT NULL,
  `email` varchar(128) NOT NULL,
  `idusuario` int(11) NOT NULL,
  `datos` int(11) NOT NULL,
  `pdf` int(11) NOT NULL,
  `calificacion` int(11) NOT NULL,
  `caleficacion2` int(11) NOT NULL,
  `idcategoria` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=7 ;

--
-- Volcado de datos para la tabla `registro`
--

INSERT INTO `registro` (`id`, `titulo`, `resumen`, `autores`, `institucion`, `tipocarrera`, `semestre`, `email`, `idusuario`, `datos`, `pdf`, `calificacion`, `caleficacion2`, `idcategoria`) VALUES
(6, 'titulo', 'rrrrrrrrrrrrr', 'autor', 'itsoeh', '1', '2', 'j.u.l.i.o_cesar@hotmail.com', 15, 1, 0, 0, 0, 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tipo_usuario`
--

CREATE TABLE IF NOT EXISTS `tipo_usuario` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `tipo` varchar(50) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=3 ;

--
-- Volcado de datos para la tabla `tipo_usuario`
--

INSERT INTO `tipo_usuario` (`id`, `tipo`) VALUES
(1, 'Participante'),
(2, 'Evaluador');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `usuarios`
--

CREATE TABLE IF NOT EXISTS `usuarios` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `usuario` varchar(30) NOT NULL,
  `password` varchar(50) NOT NULL,
  `id_tipo` varchar(11) NOT NULL,
  `idcarrera` int(11) NOT NULL,
  `idcategoria` int(11) NOT NULL,
  PRIMARY KEY (`id`,`usuario`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=17 ;

--
-- Volcado de datos para la tabla `usuarios`
--

INSERT INTO `usuarios` (`id`, `usuario`, `password`, `id_tipo`, `idcarrera`, `idcategoria`) VALUES
(14, 'julio', '123', '1', 0, 0),
(15, 'juan', '123', '2', 0, 0),
(16, 'hgj', '123', '2', 0, 0);

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
