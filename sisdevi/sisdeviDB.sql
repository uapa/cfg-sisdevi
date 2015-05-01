/*
Navicat MySQL Data Transfer

Source Server         : MySql
Source Server Version : 50532
Source Host           : localhost:3306
Source Database       : sisdevi

Target Server Type    : MYSQL
Target Server Version : 50532
File Encoding         : 65001

Date: 2015-05-01 00:29:23
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for `agresor`
-- ----------------------------
DROP TABLE IF EXISTS `agresor`;
CREATE TABLE `agresor` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(77) COLLATE utf8_spanish_ci DEFAULT NULL,
  `apellido` varchar(77) COLLATE utf8_spanish_ci DEFAULT NULL,
  `genero_id` int(11) DEFAULT NULL,
  `direccion` varchar(200) COLLATE utf8_spanish_ci DEFAULT NULL,
  `provincia_id` int(11) DEFAULT NULL,
  `telefono` varchar(14) COLLATE utf8_spanish_ci DEFAULT NULL,
  `celular` varchar(14) COLLATE utf8_spanish_ci DEFAULT NULL,
  `estadocivil_id` int(11) DEFAULT NULL,
  `fecha_nacimiento` date DEFAULT NULL,
  `cedula` varchar(20) COLLATE utf8_spanish_ci DEFAULT NULL,
  `reporte_id` int(11) DEFAULT NULL,
  `fecha_creacion` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  KEY `agresor_genero_fk` (`genero_id`),
  KEY `agresor_provincia_fk` (`provincia_id`),
  KEY `agresor_estadocivil_fk` (`estadocivil_id`),
  KEY `agresor_reporte_fk` (`reporte_id`),
  CONSTRAINT `agresor_reporte_fk` FOREIGN KEY (`reporte_id`) REFERENCES `reporte` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `agresor_estadocivil_fk` FOREIGN KEY (`estadocivil_id`) REFERENCES `estadocivil` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `agresor_genero_fk` FOREIGN KEY (`genero_id`) REFERENCES `genero` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `agresor_provincia_fk` FOREIGN KEY (`provincia_id`) REFERENCES `provincias` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

-- ----------------------------
-- Records of agresor
-- ----------------------------

-- ----------------------------
-- Table structure for `agresortestigo`
-- ----------------------------
DROP TABLE IF EXISTS `agresortestigo`;
CREATE TABLE `agresortestigo` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(77) COLLATE utf8_spanish_ci DEFAULT NULL,
  `apellido` varchar(77) COLLATE utf8_spanish_ci DEFAULT NULL,
  `genero_id` int(11) DEFAULT NULL,
  `direccion` varchar(200) COLLATE utf8_spanish_ci DEFAULT NULL,
  `provincia_id` int(11) DEFAULT NULL,
  `telefono` varchar(14) COLLATE utf8_spanish_ci DEFAULT NULL,
  `celular` varchar(14) COLLATE utf8_spanish_ci DEFAULT NULL,
  `estadocivil_id` int(11) DEFAULT NULL,
  `fecha_nacimiento` date DEFAULT NULL,
  `cedula` varchar(20) COLLATE utf8_spanish_ci DEFAULT NULL,
  `reporte_id` int(11) DEFAULT NULL,
  `fecha_creacion` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  KEY `agresortestigo_genero_fk` (`genero_id`),
  KEY `agresortestigo_provincia_fk` (`provincia_id`),
  KEY `agresortestigo_estadocivil_fk` (`estadocivil_id`),
  KEY `agresortestigo_reporte_fk` (`reporte_id`),
  CONSTRAINT `agresortestigo_reporte_fk` FOREIGN KEY (`reporte_id`) REFERENCES `reporte` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `agresortestigo_estadocivil_fk` FOREIGN KEY (`estadocivil_id`) REFERENCES `estadocivil` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `agresortestigo_genero_fk` FOREIGN KEY (`genero_id`) REFERENCES `genero` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `agresortestigo_provincia_fk` FOREIGN KEY (`provincia_id`) REFERENCES `provincias` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

-- ----------------------------
-- Records of agresortestigo
-- ----------------------------

-- ----------------------------
-- Table structure for `detallesreporte`
-- ----------------------------
DROP TABLE IF EXISTS `detallesreporte`;
CREATE TABLE `detallesreporte` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `genero_id` int(11) DEFAULT NULL,
  `estadocivil_id` int(11) DEFAULT NULL,
  `fecha_nacimiento` date DEFAULT NULL,
  `cedula` varchar(14) COLLATE utf8_spanish_ci DEFAULT NULL,
  `tipodeviolencia_id` int(11) DEFAULT NULL,
  `vinculo_id` int(11) DEFAULT NULL,
  `notas` text COLLATE utf8_spanish_ci,
  `reporte_id` int(11) DEFAULT NULL,
  `gradoacademico` varchar(77) COLLATE utf8_spanish_ci DEFAULT NULL,
  `cantidadhijos` varchar(7) COLLATE utf8_spanish_ci DEFAULT NULL,
  `ocupacion` varchar(77) COLLATE utf8_spanish_ci DEFAULT NULL,
  `ingresos` varchar(77) COLLATE utf8_spanish_ci DEFAULT NULL,
  `fecha_creacion` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  KEY `detalles_genero_fk` (`genero_id`),
  KEY `detalles_estadocivil_fk` (`estadocivil_id`),
  KEY `detalles_vinculo_fk` (`vinculo_id`),
  KEY `tipodeviolencia_detalle_fk` (`tipodeviolencia_id`) USING BTREE,
  KEY `detalles_reporte_fk` (`reporte_id`),
  CONSTRAINT `detalles_estadocivil_fk` FOREIGN KEY (`estadocivil_id`) REFERENCES `estadocivil` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `detalles_genero_fk` FOREIGN KEY (`genero_id`) REFERENCES `genero` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `detalles_reporte_fk` FOREIGN KEY (`reporte_id`) REFERENCES `reporte` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `detalles_tipodeviolencia_fk` FOREIGN KEY (`tipodeviolencia_id`) REFERENCES `tipodeviolencia` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `detalles_vinculo_fk` FOREIGN KEY (`vinculo_id`) REFERENCES `vinculo` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

-- ----------------------------
-- Records of detallesreporte
-- ----------------------------
INSERT INTO `detallesreporte` VALUES ('1', '1', '2', '2015-04-29', '03100011', '4', '7', 'okok', '1', 'Educación Superior', '88', 'Ama', 'De 7,000 a 15,000', '2015-04-30 19:09:19');
INSERT INTO `detallesreporte` VALUES ('2', '1', '2', '2015-04-29', '031455566666', '5', '7', 'Me golpeo', '3', 'Educación Secundaria', '2', 'Estudiante', 'De 3,000 a 7,000', '2015-04-29 20:20:28');
INSERT INTO `detallesreporte` VALUES ('3', '1', '1', '2015-04-29', '031455566666', '1', '1', 'Todo Bien', '4', 'Educación Superior', '7', 'Estudiante', 'De 15,000 a 25,000', '2015-04-30 23:31:19');
INSERT INTO `detallesreporte` VALUES ('4', '1', '1', '2015-04-29', '031455566666', '1', '1', 'Todo Bien', '4', 'Educación Superior', '7', 'Estudiante', 'De 15,000 a 25,000', '2015-04-30 23:32:23');

-- ----------------------------
-- Table structure for `detallesreportetestigo`
-- ----------------------------
DROP TABLE IF EXISTS `detallesreportetestigo`;
CREATE TABLE `detallesreportetestigo` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `genero_id` int(11) DEFAULT NULL,
  `estadocivil_id` int(11) DEFAULT NULL,
  `fecha_nacimiento` date DEFAULT NULL,
  `cedula` varchar(14) COLLATE utf8_spanish_ci DEFAULT NULL,
  `tipodeviolencia_id` int(11) DEFAULT NULL,
  `vinculo_id` int(11) DEFAULT NULL,
  `notas` text COLLATE utf8_spanish_ci,
  `reporte_id` int(11) DEFAULT NULL,
  `gradoacademico` varchar(77) COLLATE utf8_spanish_ci DEFAULT NULL,
  `cantidadhijos` varchar(7) COLLATE utf8_spanish_ci DEFAULT NULL,
  `ocupacion` varchar(77) COLLATE utf8_spanish_ci DEFAULT NULL,
  `ingresos` varchar(77) COLLATE utf8_spanish_ci DEFAULT NULL,
  `fecha_creacion` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  KEY `detallestestigo_genero_fk` (`genero_id`),
  KEY `detallestestigo_estadocivil_fk` (`estadocivil_id`),
  KEY `detallestestigo_vinculo_fk` (`vinculo_id`),
  KEY `tipodeviolencia_detalletestigo_fk` (`tipodeviolencia_id`) USING BTREE,
  KEY `detallestestigo_reporte_fk` (`reporte_id`),
  CONSTRAINT `detallestestigo_estadocivil_fk` FOREIGN KEY (`estadocivil_id`) REFERENCES `estadocivil` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `detallestestigo_genero_fk` FOREIGN KEY (`genero_id`) REFERENCES `genero` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `detallestestigo_reporte_fk` FOREIGN KEY (`reporte_id`) REFERENCES `reporte` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `detallestestigo_tipodeviolencia_fk` FOREIGN KEY (`tipodeviolencia_id`) REFERENCES `tipodeviolencia` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `detallestestigo_vinculo_fk` FOREIGN KEY (`vinculo_id`) REFERENCES `vinculo` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

-- ----------------------------
-- Records of detallesreportetestigo
-- ----------------------------

-- ----------------------------
-- Table structure for `episodios`
-- ----------------------------
DROP TABLE IF EXISTS `episodios`;
CREATE TABLE `episodios` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `fecha_episodio` date DEFAULT NULL,
  `tipodeviolencia_id` int(11) DEFAULT NULL,
  `descripcion` text COLLATE utf8_spanish_ci,
  `reporte_id` int(11) DEFAULT NULL,
  `fecha_creacion` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  KEY `episodios_tipodeviolencia_fk` (`tipodeviolencia_id`),
  KEY `episodios_reporte_fk` (`reporte_id`),
  CONSTRAINT `episodios_reporte_fk` FOREIGN KEY (`reporte_id`) REFERENCES `reporte` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `episodios_tipodeviolencia_fk` FOREIGN KEY (`tipodeviolencia_id`) REFERENCES `tipodeviolencia` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

-- ----------------------------
-- Records of episodios
-- ----------------------------

-- ----------------------------
-- Table structure for `episodiostesdigo`
-- ----------------------------
DROP TABLE IF EXISTS `episodiostesdigo`;
CREATE TABLE `episodiostesdigo` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `fecha_episodio` date DEFAULT NULL,
  `tipodeviolencia_id` int(11) DEFAULT NULL,
  `descripcion` text COLLATE utf8_spanish_ci,
  `reporte_id` int(11) DEFAULT NULL,
  `fecha_creacion` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  KEY `episodiostesdigo_tipodeviolencia_fk` (`tipodeviolencia_id`),
  KEY `episodiostesdigo_reporte_fk` (`reporte_id`),
  CONSTRAINT `episodiostesdigo_reporte_fk` FOREIGN KEY (`reporte_id`) REFERENCES `reporte` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `episodiostesdigo_tipodeviolencia_fk` FOREIGN KEY (`tipodeviolencia_id`) REFERENCES `tipodeviolencia` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

-- ----------------------------
-- Records of episodiostesdigo
-- ----------------------------

-- ----------------------------
-- Table structure for `estado`
-- ----------------------------
DROP TABLE IF EXISTS `estado`;
CREATE TABLE `estado` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(77) COLLATE utf8_spanish_ci DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

-- ----------------------------
-- Records of estado
-- ----------------------------
INSERT INTO `estado` VALUES ('1', 'En Investigacion');
INSERT INTO `estado` VALUES ('2', 'Activo');
INSERT INTO `estado` VALUES ('3', 'Inactivo');
INSERT INTO `estado` VALUES ('4', 'Descartado');

-- ----------------------------
-- Table structure for `estadocivil`
-- ----------------------------
DROP TABLE IF EXISTS `estadocivil`;
CREATE TABLE `estadocivil` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(77) COLLATE utf8_spanish_ci DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

-- ----------------------------
-- Records of estadocivil
-- ----------------------------
INSERT INTO `estadocivil` VALUES ('1', 'Soltera');
INSERT INTO `estadocivil` VALUES ('2', 'Casada');

-- ----------------------------
-- Table structure for `genero`
-- ----------------------------
DROP TABLE IF EXISTS `genero`;
CREATE TABLE `genero` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(77) COLLATE utf8_spanish_ci DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

-- ----------------------------
-- Records of genero
-- ----------------------------
INSERT INTO `genero` VALUES ('1', 'F');
INSERT INTO `genero` VALUES ('2', 'M');
INSERT INTO `genero` VALUES ('3', 'I');

-- ----------------------------
-- Table structure for `provincias`
-- ----------------------------
DROP TABLE IF EXISTS `provincias`;
CREATE TABLE `provincias` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(77) COLLATE utf8_spanish_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=33 DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

-- ----------------------------
-- Records of provincias
-- ----------------------------
INSERT INTO `provincias` VALUES ('1', 'Distrito Nacional');
INSERT INTO `provincias` VALUES ('2', 'Altagracia');
INSERT INTO `provincias` VALUES ('3', 'Azua');
INSERT INTO `provincias` VALUES ('4', 'Bahoruco');
INSERT INTO `provincias` VALUES ('5', 'Barahona');
INSERT INTO `provincias` VALUES ('6', 'Dajabon');
INSERT INTO `provincias` VALUES ('7', 'Duarte');
INSERT INTO `provincias` VALUES ('8', 'El Seybo');
INSERT INTO `provincias` VALUES ('9', 'Elias Piña');
INSERT INTO `provincias` VALUES ('10', 'Espaillat');
INSERT INTO `provincias` VALUES ('11', 'Hato Mayor');
INSERT INTO `provincias` VALUES ('12', 'Independencia');
INSERT INTO `provincias` VALUES ('13', 'La Romana');
INSERT INTO `provincias` VALUES ('14', 'La Vega');
INSERT INTO `provincias` VALUES ('15', 'Maria Trinidad Sanchez');
INSERT INTO `provincias` VALUES ('16', 'Monseñor Nouel');
INSERT INTO `provincias` VALUES ('17', 'Montecristi');
INSERT INTO `provincias` VALUES ('18', 'Monte Plata');
INSERT INTO `provincias` VALUES ('19', 'Pedernales');
INSERT INTO `provincias` VALUES ('20', 'Peravia');
INSERT INTO `provincias` VALUES ('21', 'Puerto Plata');
INSERT INTO `provincias` VALUES ('22', 'Hermanas Mirabal');
INSERT INTO `provincias` VALUES ('23', 'Samana');
INSERT INTO `provincias` VALUES ('24', 'San Cristobal');
INSERT INTO `provincias` VALUES ('25', 'San juan');
INSERT INTO `provincias` VALUES ('26', 'San Pedro de Macoris');
INSERT INTO `provincias` VALUES ('27', 'Sanchez Ramirez');
INSERT INTO `provincias` VALUES ('28', 'Santiago de los Caballeros');
INSERT INTO `provincias` VALUES ('29', 'Santiago Rodriguez');
INSERT INTO `provincias` VALUES ('30', 'Valverde');
INSERT INTO `provincias` VALUES ('31', 'San Jose de Ocoa');
INSERT INTO `provincias` VALUES ('32', 'Santo Domingo');

-- ----------------------------
-- Table structure for `reporte`
-- ----------------------------
DROP TABLE IF EXISTS `reporte`;
CREATE TABLE `reporte` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(77) COLLATE utf8_spanish_ci DEFAULT NULL,
  `apellido` varchar(77) COLLATE utf8_spanish_ci DEFAULT NULL,
  `direccion` varchar(200) COLLATE utf8_spanish_ci DEFAULT NULL,
  `telefono` varchar(17) COLLATE utf8_spanish_ci DEFAULT NULL,
  `celular` varchar(17) COLLATE utf8_spanish_ci DEFAULT NULL,
  `provincia_id` int(11) DEFAULT NULL,
  `correo` varchar(255) COLLATE utf8_spanish_ci DEFAULT NULL,
  `fecha_reporte` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `estado_id` int(11) DEFAULT '1',
  PRIMARY KEY (`id`),
  KEY `reporte_provincia_fk` (`provincia_id`),
  KEY `reporte_estado_fk` (`estado_id`),
  CONSTRAINT `reporte_estado_fk` FOREIGN KEY (`estado_id`) REFERENCES `estado` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `reporte_provincia_fk` FOREIGN KEY (`provincia_id`) REFERENCES `provincias` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

-- ----------------------------
-- Records of reporte
-- ----------------------------
INSERT INTO `reporte` VALUES ('1', 'Josefina', 'Perez', 'Urb Los Prados c/14 #9', '8093178156', '809999999', '13', 'juan@gmail.com', '2015-04-30 21:59:40', '2');
INSERT INTO `reporte` VALUES ('2', 'Persa', 'Almonte', 'Urb Los Prados c/14 #9', '8093178156', '809999999', '3', 'juan@gmail.com', '2015-04-28 20:43:58', '1');
INSERT INTO `reporte` VALUES ('3', 'prueba2', 'prueba2', 'Urb Los Prados c/14 #9', '8093178156', '809999999', '9', 'juan@gmail.com', '2015-04-29 12:38:08', '1');
INSERT INTO `reporte` VALUES ('4', 'Gris', 'Mercado', 'La Zursa', '809999999', '8099999999', '14', 'gris@hotmail.com', '2015-04-30 23:29:02', '2');

-- ----------------------------
-- Table structure for `reportetestigo`
-- ----------------------------
DROP TABLE IF EXISTS `reportetestigo`;
CREATE TABLE `reportetestigo` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(77) COLLATE utf8_spanish_ci DEFAULT NULL,
  `apellido` varchar(77) COLLATE utf8_spanish_ci DEFAULT NULL,
  `telefono` varchar(17) COLLATE utf8_spanish_ci DEFAULT NULL,
  `celular` varchar(17) COLLATE utf8_spanish_ci DEFAULT NULL,
  `correo` varchar(77) COLLATE utf8_spanish_ci DEFAULT NULL,
  `vinculo_id` int(11) DEFAULT NULL,
  `nombre_victima` varchar(77) COLLATE utf8_spanish_ci DEFAULT NULL,
  `apellido_victima` varchar(77) COLLATE utf8_spanish_ci DEFAULT NULL,
  `direccion_victima` varchar(77) COLLATE utf8_spanish_ci DEFAULT NULL,
  `provincia_id` int(11) DEFAULT NULL,
  `telefono_victima` varchar(17) COLLATE utf8_spanish_ci DEFAULT NULL,
  `celular_victima` varchar(17) COLLATE utf8_spanish_ci DEFAULT NULL,
  `notas` text COLLATE utf8_spanish_ci,
  `fecha_reporte` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `estado_id` int(11) DEFAULT '1',
  PRIMARY KEY (`id`),
  KEY `reporte_vinculo_fk` (`vinculo_id`),
  KEY `reporte_provincias_fk` (`provincia_id`),
  KEY `reportetestigo_estado_fk` (`estado_id`),
  CONSTRAINT `reportetestigo_estado_fk` FOREIGN KEY (`estado_id`) REFERENCES `estado` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `reporte_provincias_fk` FOREIGN KEY (`provincia_id`) REFERENCES `provincias` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `reporte_vinculo_fk` FOREIGN KEY (`vinculo_id`) REFERENCES `vinculo` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

-- ----------------------------
-- Records of reportetestigo
-- ----------------------------
INSERT INTO `reportetestigo` VALUES ('1', 'ok', 'ok', '898989', '898989', 'adasdas', '5', 'OK', 'ok', 'yhyhy', '4', '8093178156', '80989999', 'okoo', '2015-04-25 19:58:20', '1');
INSERT INTO `reportetestigo` VALUES ('2', 'Azul', 'Guzman', '8093178156', '809999999', 'juan@gmail.com', '7', 'Juana', 'Martinez', 'Av. 77', '28', '999999999', '0999999999', 'okoko', '2015-04-25 21:43:44', '1');

-- ----------------------------
-- Table structure for `tipodeviolencia`
-- ----------------------------
DROP TABLE IF EXISTS `tipodeviolencia`;
CREATE TABLE `tipodeviolencia` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(77) COLLATE utf8_spanish_ci DEFAULT NULL,
  `descripcion` text COLLATE utf8_spanish_ci,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

-- ----------------------------
-- Records of tipodeviolencia
-- ----------------------------
INSERT INTO `tipodeviolencia` VALUES ('1', 'Fisica', null);
INSERT INTO `tipodeviolencia` VALUES ('2', 'Psicologica', null);
INSERT INTO `tipodeviolencia` VALUES ('3', 'Sexual', null);
INSERT INTO `tipodeviolencia` VALUES ('4', 'Economica', null);
INSERT INTO `tipodeviolencia` VALUES ('5', 'Institucional', null);

-- ----------------------------
-- Table structure for `usuarios`
-- ----------------------------
DROP TABLE IF EXISTS `usuarios`;
CREATE TABLE `usuarios` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(77) COLLATE utf8_spanish_ci DEFAULT NULL,
  `apellido` varchar(77) COLLATE utf8_spanish_ci DEFAULT NULL,
  `correo` varchar(255) COLLATE utf8_spanish_ci DEFAULT NULL,
  `usuario` varchar(77) COLLATE utf8_spanish_ci DEFAULT NULL,
  `clave` varchar(77) COLLATE utf8_spanish_ci DEFAULT NULL,
  `fecha_creacion` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

-- ----------------------------
-- Records of usuarios
-- ----------------------------

-- ----------------------------
-- Table structure for `vinculo`
-- ----------------------------
DROP TABLE IF EXISTS `vinculo`;
CREATE TABLE `vinculo` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(77) COLLATE utf8_spanish_ci DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

-- ----------------------------
-- Records of vinculo
-- ----------------------------
INSERT INTO `vinculo` VALUES ('1', 'Esposo(a)');
INSERT INTO `vinculo` VALUES ('2', 'Novio(a)');
INSERT INTO `vinculo` VALUES ('3', 'Vecino(a)');
INSERT INTO `vinculo` VALUES ('4', 'Familiar');
INSERT INTO `vinculo` VALUES ('5', 'Amigo(a)');
INSERT INTO `vinculo` VALUES ('6', 'Amante');
INSERT INTO `vinculo` VALUES ('7', 'Conocido(a)');

-- ----------------------------
-- Table structure for `vinculotestigo`
-- ----------------------------
DROP TABLE IF EXISTS `vinculotestigo`;
CREATE TABLE `vinculotestigo` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(77) COLLATE utf8_spanish_ci DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

-- ----------------------------
-- Records of vinculotestigo
-- ----------------------------
