CREATE DATABASE Practicum;
USE Practicum;

CREATE TABLE IF NOT EXISTS provincias(
    codigoprov CHAR(2) NOT NULL,
    nombreprov VARCHAR(30) NOT NULL,
    PRIMARY KEY (codigoprov)
);
CREATE TABLE IF NOT EXISTS cantones(
    idcanton CHAR(4) NOT NULL,
    nombrecanton VARCHAR(30) NOT NULL,
    codigoprov CHAR(2) NOT NULL,
    PRIMARY KEY (idcanton)
);
CREATE TABLE IF NOT EXISTS condicion_actividad(
    idactividad INTEGER NOT NULL,
    nombreActividad VARCHAR(50) NOT NULL,
    PRIMARY KEY (idactividad)
);
CREATE TABLE IF NOT EXISTS etnia (
    idetnia INTEGER NOT NULL,
    nombreetnia VARCHAR(20) NOT NULL,
    PRIMARY KEY (idetnia)
);
CREATE TABLE IF NOT EXISTS grupo_ocupacion (
    idocupacion      CHAR(2) NOT NULL,
    nombreocupacion  VARCHAR(60) NOT NULL,
    PRIMARY KEY (idocupacion)
);
CREATE TABLE IF NOT EXISTS nivel_instruccion (
    id_nivel     CHAR(2) NOT NULL,
    nombrenivel  VARCHAR(30) NOT NULL,
    PRIMARY KEY (id_nivel)
);
CREATE TABLE IF NOT EXISTS  rama_actividad (
    idrama      CHAR(2) NOT NULL,
    nombrerama  VARCHAR(65) NOT NULL,
    PRIMARY KEY (idrama)
);
CREATE TABLE IF NOT EXISTS  sectorizacion (
    idsectorizacion  INTEGER NOT NULL,
    nombresector  VARCHAR(65) NOT NULL,
    PRIMARY KEY (idsectorizacion)
);
CREATE TABLE IF NOT EXISTS PERSONA(
    id_persona VARCHAR(27) NOT NULL,
    genero VARCHAR(20) NOT NULL,
    edad INTEGER NOT NULL,
    estado_civil VARCHAR(20) NOT NULL,
    ingreso_laboral DECIMAL,
    factor_expancion VARCHAR(20) NOT NULL,
    idcanton CHAR(4) NOT NULL,
	area VARCHAR(10) NOT NULL,
    id_nivel CHAR(2) NOT NULL,
	idetnia INTEGER NOT NULL,
    idactividad INTEGER NOT NULL,
	idsectorizacion  INTEGER NOT NULL,
    idocupacion CHAR(2),
    idrama CHAR(2),
    anio CHAR(4),
    mes CHAR(2),
    PRIMARY KEY (id_persona)
);

ALTER TABLE PERSONA ADD FOREIGN KEY(idactividad) REFERENCES condicion_actividad(idactividad);
ALTER TABLE PERSONA ADD FOREIGN KEY(idetnia) REFERENCES etnia(idetnia);
ALTER TABLE PERSONA ADD FOREIGN KEY(idocupacion) REFERENCES grupo_ocupacion(idocupacion);
ALTER TABLE PERSONA ADD FOREIGN KEY(idrama) REFERENCES rama_actividad(idrama);
ALTER TABLE PERSONA ADD FOREIGN KEY(id_nivel) REFERENCES nivel_instruccion(id_nivel);
ALTER TABLE PERSONA ADD FOREIGN KEY(idcanton) REFERENCES cantones(idcanton);
ALTER TABLE PERSONA ADD FOREIGN KEY(idsectorizacion) REFERENCES sectorizacion(idsectorizacion);
ALTER TABLE cantones ADD FOREIGN KEY(codigoprov) REFERENCES provincias(codigoprov);

ALTER TABLE PERSONA ADD CHECK (genero = 1 OR genero = 2);
ALTER TABLE PERSONA ADD CHECK (edad > 14 AND edad < 100 );
ALTER TABLE PERSONA ADD CHECK (estado_civil = 1 OR estado_civil = 2 OR estado_civil = 3 OR estado_civil = 4 OR estado_civil = 5 OR estado_civil = 6);
ALTER TABLE PERSONA ADD CHECK (area = 1 OR area = 2);

CREATE USER 'one' @'localhost' IDENTIFIED BY 'one';
GRANT SELECT ON Practicum.* TO 'one' @'localhost';
FLUSH PRIVILEGES;
/*Conectar con el nuevo usuario
--SHOW TABLES;*/

INSERT INTO etnia VALUES(1,' Indígena');
INSERT INTO etnia VALUES(2,' Afroecuatoriano');
INSERT INTO etnia VALUES(3,' Negro');
INSERT INTO etnia VALUES(4,' Mulato');
INSERT INTO etnia VALUES(5,' Montubio');
INSERT INTO etnia VALUES(6,' Mestizo');
INSERT INTO etnia VALUES(7,' Blanco');
INSERT INTO etnia VALUES(8,' Otro');

INSERT INTO provincias VALUES('01','Azuay');
INSERT INTO provincias VALUES('02','Bolivar');
INSERT INTO provincias VALUES('03','Cañar');
INSERT INTO provincias VALUES('04','Carchi');
INSERT INTO provincias VALUES('05','Cotopaxi');
INSERT INTO provincias VALUES('06','Chimborazo');
INSERT INTO provincias VALUES('07','El Oro');
INSERT INTO provincias VALUES('08','Esmeraldas');
INSERT INTO provincias VALUES('09','Guayas');
INSERT INTO provincias VALUES('10','Imbabura');
INSERT INTO provincias VALUES('11','Loja');
INSERT INTO provincias VALUES('12','Los Ríos');
INSERT INTO provincias VALUES('13','Manabí');
INSERT INTO provincias VALUES('14','Morona Santiago');
INSERT INTO provincias VALUES('15','Napo');
INSERT INTO provincias VALUES('16','Pastaza');
INSERT INTO provincias VALUES('17','Pichincha');
INSERT INTO provincias VALUES('18','Tungurahua');
INSERT INTO provincias VALUES('19','Zamora Chinchipe');
INSERT INTO provincias VALUES('20','Galápagos');
INSERT INTO provincias VALUES('21','Sucumbios');
INSERT INTO provincias VALUES('22','Orellana');
INSERT INTO provincias VALUES('23','Santo Domingo de los Tsachilas');
INSERT INTO provincias VALUES('24','Santa Elena');

INSERT INTO cantones VALUES(0101,'Cuenca','01');
INSERT INTO cantones VALUES(0102,'Giron','01');
INSERT INTO cantones VALUES(0103,'Gualaceo','01');
INSERT INTO cantones VALUES(0104,'Nabon','01');
INSERT INTO cantones VALUES(0105,'Paute','01');
INSERT INTO cantones VALUES(0106,'Pucara','01');
INSERT INTO cantones VALUES(0107,'San Fernando','01');
INSERT INTO cantones VALUES(0108,'Santa Isabel','01');
INSERT INTO cantones VALUES(0109,'Sigsig','01');
INSERT INTO cantones VALUES(0110,'Oña','01');
INSERT INTO cantones VALUES(0111,'Chordelec','01');
INSERT INTO cantones VALUES(0112,'El Pan','01');
INSERT INTO cantones VALUES(0113,'Sevilla de Oro','01');
INSERT INTO cantones VALUES(0114,'Guachapala','01');
INSERT INTO cantones VALUES(0115,'Camilo Poce Enriquez','01');
INSERT INTO cantones VALUES(0201,'Guaranda','02');
INSERT INTO cantones VALUES(0202,'Chillanes','02');
INSERT INTO cantones VALUES(0203,'Chimbo','02');
INSERT INTO cantones VALUES(0204,'Echeandia','02');
INSERT INTO cantones VALUES(0205,'San Miguel','02');
INSERT INTO cantones VALUES(0206,'Caluma','02');
INSERT INTO cantones VALUES(0207,'Las Naves','02');
INSERT INTO cantones VALUES(0301,'Azoguez','03');
INSERT INTO cantones VALUES(0302,'Biblian','03');
INSERT INTO cantones VALUES(0303,'Cañar','03');
INSERT INTO cantones VALUES(0304,'La Troncal','03');
INSERT INTO cantones VALUES(0305,'El Tambo','03');
INSERT INTO cantones VALUES(0306,'Deleg','03');
INSERT INTO cantones VALUES(0307,'Suscal','03');
INSERT INTO cantones VALUES(0401,'Tulcan','04');
INSERT INTO cantones VALUES(0402,'Bolivar','04');
INSERT INTO cantones VALUES(0403,'Espejo','04');
INSERT INTO cantones VALUES(0404,'Mira','04');
INSERT INTO cantones VALUES(0405,'Montufar','04');
INSERT INTO cantones VALUES(0406,'San Padro de Huaca','04');
INSERT INTO cantones VALUES(0501,'Latacunga','05');
INSERT INTO cantones VALUES(0502,'La Mana','05');
INSERT INTO cantones VALUES(0503,'Pangua','05');
INSERT INTO cantones VALUES(0504,'Pujili','05');
INSERT INTO cantones VALUES(0505,'Salcedo','05');
INSERT INTO cantones VALUES(0506,'Saquisili','05');
INSERT INTO cantones VALUES(0507,'Sigchos','05');
INSERT INTO cantones VALUES(0601,'Riobamba','06');
INSERT INTO cantones VALUES(0602,'Alausi','06');
INSERT INTO cantones VALUES(0603,'Colta','06');
INSERT INTO cantones VALUES(0604,'Chambo','06');
INSERT INTO cantones VALUES(0605,'Chunchi','06');
INSERT INTO cantones VALUES(0606,'Guamote','06');
INSERT INTO cantones VALUES(0607,'Guano','06');
INSERT INTO cantones VALUES(0608,'Pallatanga','06');
INSERT INTO cantones VALUES(0609,'Penipe','06');
INSERT INTO cantones VALUES(0610,'Cumanda','06');
INSERT INTO cantones VALUES(0701,'Machala','07');
INSERT INTO cantones VALUES(0702,'Arenillas','07');
INSERT INTO cantones VALUES(0703,'Atahualpa','07');
INSERT INTO cantones VALUES(0704,'Balsas','07');
INSERT INTO cantones VALUES(0705,'Chilla','07');
INSERT INTO cantones VALUES(0706,'Guabo','07');
INSERT INTO cantones VALUES(0707,'Huaquillas','07');
INSERT INTO cantones VALUES(0708,'Marcabeli','07');
INSERT INTO cantones VALUES(0709,'Pasaje','07');
INSERT INTO cantones VALUES(0710,'Piñas','07');
INSERT INTO cantones VALUES(0711,'Portovelo','07');
INSERT INTO cantones VALUES(0712,'Santa Rosa','07');
INSERT INTO cantones VALUES(0713,'zaruma','07');
INSERT INTO cantones VALUES(0714,'Las Lajas','07');
INSERT INTO cantones VALUES(0801,'Esmeraldas','08');
INSERT INTO cantones VALUES(0802,'Eloy Alfaro','08');
INSERT INTO cantones VALUES(0803,'Muisne','08');
INSERT INTO cantones VALUES(0804,'Quininde','08');
INSERT INTO cantones VALUES(0805,'San Lorenzo','08');
INSERT INTO cantones VALUES(0806,'Atacames','08');
INSERT INTO cantones VALUES(0807,'Rioverde','08');
INSERT INTO cantones VALUES(0901,'Guayaquil','09');
INSERT INTO cantones VALUES(0902,'Alfredo Baquerizo Moreno','09');
INSERT INTO cantones VALUES(0903,'Balao','09');
INSERT INTO cantones VALUES(0904,'Balzar','09');
INSERT INTO cantones VALUES(0905,'Colimes','09');
INSERT INTO cantones VALUES(0906,'Daule','09');
INSERT INTO cantones VALUES(0907,'Duran','09');
INSERT INTO cantones VALUES(0908,'Empalme','09');
INSERT INTO cantones VALUES(0909,'El Triunfo','09');
INSERT INTO cantones VALUES(0910,'Milagro','09');
INSERT INTO cantones VALUES(0911,'Naranjal','09');
INSERT INTO cantones VALUES(0912,'Naranjito','09');
INSERT INTO cantones VALUES(0913,'Palestina','09');
INSERT INTO cantones VALUES(0914,'Pedro Carbo','09');
INSERT INTO cantones VALUES(0915,'Salinas','09');
INSERT INTO cantones VALUES(0916,'Samborondon','09');
INSERT INTO cantones VALUES(0917,'Santa Elena','09');
INSERT INTO cantones VALUES(0918,'Santa Lucia','09');
INSERT INTO cantones VALUES(0919,'Salitre','09');
INSERT INTO cantones VALUES(0920,'San Jacinto de Yaguachi','09');
INSERT INTO cantones VALUES(0921,'Playas','09');
INSERT INTO cantones VALUES(0922,'Simon Bolivar','09');
INSERT INTO cantones VALUES(0923,'Coronel Marcelino Maridueña','09');
INSERT INTO cantones VALUES(0924,'Lomas de Sargentillo','09');
INSERT INTO cantones VALUES(0925,'Nobol','09');
INSERT INTO cantones VALUES(0926,'La Libertad','09');
INSERT INTO cantones VALUES(0927,'General Antonio Elizalde','09');
INSERT INTO cantones VALUES(0928,'Isidro Ayora','09');
INSERT INTO cantones VALUES(1001,'Ibarra','10');
INSERT INTO cantones VALUES(1002,'Antonio Ante','10');
INSERT INTO cantones VALUES(1003,'Cotacachi','10');
INSERT INTO cantones VALUES(1004,'Otavalo','10');
INSERT INTO cantones VALUES(1005,'Pimampiro','10');
INSERT INTO cantones VALUES(1006,'San Miguel de Urcuqui','10');
INSERT INTO cantones VALUES(1101,'Loja','11');
INSERT INTO cantones VALUES(1102,'Calvas','11');
INSERT INTO cantones VALUES(1103,'Catamayo','11');
INSERT INTO cantones VALUES(1104,'Celica','11');
INSERT INTO cantones VALUES(1105,'Chaguarpamba','11');
INSERT INTO cantones VALUES(1106,'Espindola','11');
INSERT INTO cantones VALUES(1107,'Gonzanama','11');
INSERT INTO cantones VALUES(1108,'Macara','11');
INSERT INTO cantones VALUES(1109,'Paltas','11');
INSERT INTO cantones VALUES(1110,'Puyango','11');
INSERT INTO cantones VALUES(1111,'Saraguro','11');
INSERT INTO cantones VALUES(1112,'Sozoranga','11');
INSERT INTO cantones VALUES(1113,'Zapotillo','11');
INSERT INTO cantones VALUES(1114,'Pindal','11');
INSERT INTO cantones VALUES(1115,'Quilanga','11');
INSERT INTO cantones VALUES(1116,'Olmedo','11');
INSERT INTO cantones VALUES(1201,'Babahoyo','12');
INSERT INTO cantones VALUES(1202,'Baba ','12');
INSERT INTO cantones VALUES(1203,'Montalvo','12');
INSERT INTO cantones VALUES(1204,'Puebloviejo','12');
INSERT INTO cantones VALUES(1205,'Quevedo','12');
INSERT INTO cantones VALUES(1206,'Urdaneta','12');
INSERT INTO cantones VALUES(1207,'Ventanas','12');
INSERT INTO cantones VALUES(1208,'Vinces','12');
INSERT INTO cantones VALUES(1209,'Palenque','12');
INSERT INTO cantones VALUES(1210,'Buena Fe','12');
INSERT INTO cantones VALUES(1211,'Valencia','12');
INSERT INTO cantones VALUES(1212,'Mocache','12');
INSERT INTO cantones VALUES(1213,'Quisaloma','12');
INSERT INTO cantones VALUES(1301,'Portoviejo','13');
INSERT INTO cantones VALUES(1302,'Bolivar','13');
INSERT INTO cantones VALUES(1303,'Chone','13');
INSERT INTO cantones VALUES(1304,'El Carmen','13');
INSERT INTO cantones VALUES(1305,'Elavio Alfaro','13');
INSERT INTO cantones VALUES(1306,'Jipijapa','13');
INSERT INTO cantones VALUES(1307,'Junin','13');
INSERT INTO cantones VALUES(1308,'Manta','13');
INSERT INTO cantones VALUES(1309,'Montecristi','13');
INSERT INTO cantones VALUES(1310,'Pajan','13');
INSERT INTO cantones VALUES(1311,'Pichincha','13');
INSERT INTO cantones VALUES(1312,'Rocafuerte','13');
INSERT INTO cantones VALUES(1313,'Santa Ana','13');
INSERT INTO cantones VALUES(1314,'Sucre','13');
INSERT INTO cantones VALUES(1315,'Tosagua','13');
INSERT INTO cantones VALUES(1316,'24 de Mayo','13');
INSERT INTO cantones VALUES(1317,'Pedernales','13');
INSERT INTO cantones VALUES(1318,'Olmedo','13');
INSERT INTO cantones VALUES(1319,'Puerto Lopez','13');
INSERT INTO cantones VALUES(1320,'Jama','13');
INSERT INTO cantones VALUES(1321,'Jaramijo','13');
INSERT INTO cantones VALUES(1322,'San Vicente','13');
INSERT INTO cantones VALUES(1401,'Morona','14');
INSERT INTO cantones VALUES(1402,'Gualaquiza','14');
INSERT INTO cantones VALUES(1403,'Limon Indanza','14');
INSERT INTO cantones VALUES(1404,'Palora','14');
INSERT INTO cantones VALUES(1405,'Santiago','14');
INSERT INTO cantones VALUES(1406,'Sucua','14');
INSERT INTO cantones VALUES(1407,'Huamboya','14');
INSERT INTO cantones VALUES(1408,'San Juan Bosco','14');
INSERT INTO cantones VALUES(1409,'Taisha','14');
INSERT INTO cantones VALUES(1410,'Logroño','14');
INSERT INTO cantones VALUES(1411,'Pablo Sexto','14');
INSERT INTO cantones VALUES(1412,'Tiwintza','14');
INSERT INTO cantones VALUES(1501,'Tena','15');
INSERT INTO cantones VALUES(1502,'Aguarico','15');
INSERT INTO cantones VALUES(1503,'Archidona','15');
INSERT INTO cantones VALUES(1504,'El Chaco','15');
INSERT INTO cantones VALUES(1505,'La Joya de los Sachas','15');
INSERT INTO cantones VALUES(1506,'Orellana','15');
INSERT INTO cantones VALUES(1507,'Quijos','15');
INSERT INTO cantones VALUES(1508,'Loreto','15');
INSERT INTO cantones VALUES(1509,'Carlos Julio Arosemena Tola','15');
INSERT INTO cantones VALUES(1601,'Pastaza','16');
INSERT INTO cantones VALUES(1602,'Mera','16');
INSERT INTO cantones VALUES(1603,'Santa Clara','16');
INSERT INTO cantones VALUES(1604,'Arajuno','16');
INSERT INTO cantones VALUES(1701,'Quito','17');
INSERT INTO cantones VALUES(1702,'Cayambe','17');
INSERT INTO cantones VALUES(1703,'Mejia','17');
INSERT INTO cantones VALUES(1704,'Pedro Moncayo','17');
INSERT INTO cantones VALUES(1705,'Rumiñahui','17');
INSERT INTO cantones VALUES(1706,'Santo Domingo','17');
INSERT INTO cantones VALUES(1707,'San Miguel de los Bancos','17');
INSERT INTO cantones VALUES(1708,'Pedro Vicente Maldonado','17');
INSERT INTO cantones VALUES(1709,'Puerto Quito','17');
INSERT INTO cantones VALUES(1801,'Ambato','18');
INSERT INTO cantones VALUES(1802,'Baños de Agua Santa','18');
INSERT INTO cantones VALUES(1803,'Cevallos','18');
INSERT INTO cantones VALUES(1804,'Mocha','18');
INSERT INTO cantones VALUES(1805,'Patate','18');
INSERT INTO cantones VALUES(1806,'Quero','18');
INSERT INTO cantones VALUES(1807,'San Pedro de Pelileo','18');
INSERT INTO cantones VALUES(1808,'Santiago de Pillaro','18');
INSERT INTO cantones VALUES(1809,'Tisaleo','18');
INSERT INTO cantones VALUES(1901,'Zamora','19');
INSERT INTO cantones VALUES(1902,'Chinchipe','19');
INSERT INTO cantones VALUES(1903,'Nangaritza','19');
INSERT INTO cantones VALUES(1904,'Yacuambi','19');
INSERT INTO cantones VALUES(1905,'Yantzaza','19');
INSERT INTO cantones VALUES(1906,'El Pagui','19');
INSERT INTO cantones VALUES(1907,'Centinela del Condor','19');
INSERT INTO cantones VALUES(1908,'Palanda','19');
INSERT INTO cantones VALUES(1909,'Paquisha','19');
INSERT INTO cantones VALUES(2001,'San Cristobal','20');
INSERT INTO cantones VALUES(2002,'Isabela','20');
INSERT INTO cantones VALUES(2003,'Santa Cruz','20');
INSERT INTO cantones VALUES(2101,'Lago Agrio','21');
INSERT INTO cantones VALUES(2102,'Gonzalo Pizarro','21');
INSERT INTO cantones VALUES(2103,'Putumayo','21');
INSERT INTO cantones VALUES(2104,'Shushufindi','21');
INSERT INTO cantones VALUES(2105,'Sucumbios','21');
INSERT INTO cantones VALUES(2106,'Cascales','21');
INSERT INTO cantones VALUES(2107,'Cuyabeno','21');
INSERT INTO cantones VALUES(2201,'Orellana','22');
INSERT INTO cantones VALUES(2202,'Aguarico','22');
INSERT INTO cantones VALUES(2203,'La Joya de los Sachas','22');
INSERT INTO cantones VALUES(2204,'Loreto','22');
INSERT INTO cantones VALUES(2301,'Santo Domingo','23');
INSERT INTO cantones VALUES(2302,'La Concordia','23');
INSERT INTO cantones VALUES(2401,'Santa Elena','24');
INSERT INTO cantones VALUES(2402,'La Libertad','24');
INSERT INTO cantones VALUES(2403,'Salinas','24');

INSERT INTO grupo_ocupacion VALUES('0','NULL');
INSERT INTO grupo_ocupacion VALUES('01 ',' Personal direct./admin. pública y empresas');
INSERT INTO grupo_ocupacion VALUES('02 ',' Profesionales científicos e intelectuales');
INSERT INTO grupo_ocupacion VALUES('03 ',' Técnicos y profesionales de nivel medio');
INSERT INTO grupo_ocupacion VALUES('04 ',' Empleados de oficina');
INSERT INTO grupo_ocupacion VALUES('05 ',' Trabajad. de los servicios y comerciantes');
INSERT INTO grupo_ocupacion VALUES('06 ',' Trabajad. calificados agropecuarios y pesqueros');
INSERT INTO grupo_ocupacion VALUES('07 ',' Oficiales operarios y artesanos');
INSERT INTO grupo_ocupacion VALUES('08 ',' Operadores de instalac. máquinas y montad.');
INSERT INTO grupo_ocupacion VALUES('09 ',' Trabajadores no calificados, ocupaciones elementales');
INSERT INTO grupo_ocupacion VALUES('10 ',' Fuerzas Armadas');
INSERT INTO grupo_ocupacion VALUES('99 ',' No especificado');

INSERT INTO nivel_instruccion VALUES('01','Ninguno');
INSERT INTO nivel_instruccion VALUES('02','Centro de alfabetización');
INSERT INTO nivel_instruccion VALUES('04','Primaria');
INSERT INTO nivel_instruccion VALUES('05','Educación Básica');
INSERT INTO nivel_instruccion VALUES('06','Secundaria');
INSERT INTO nivel_instruccion VALUES('07','Educación  Media');
INSERT INTO nivel_instruccion VALUES('08','Superior no universitario');
INSERT INTO nivel_instruccion VALUES('09','Superior Universitario');
INSERT INTO nivel_instruccion VALUES('10','Post-grado');

INSERT INTO sectorizacion VALUES(0,'NULL');
INSERT INTO sectorizacion VALUES(1,' Sector Formal');
INSERT INTO sectorizacion VALUES(2,' Sector Informal');
INSERT INTO sectorizacion VALUES(3,' Empleo Doméstico');
INSERT INTO sectorizacion VALUES(4,' No Clasificados por Sector');

INSERT INTO rama_actividad VALUES('0','NULL');
INSERT INTO rama_actividad VALUES('01 ',' A. Agricultura, ganadería caza y silvicultura y pesca');
INSERT INTO rama_actividad VALUES('02 ',' B. Explotación de minas y canteras');
INSERT INTO rama_actividad VALUES('03 ',' C. Industrias manufactureras');
INSERT INTO rama_actividad VALUES('04 ',' D. Suministros de electricidad, gas, aire acondicionado');
INSERT INTO rama_actividad VALUES('05 ',' E. Distribución de agua, alcantarillado');
INSERT INTO rama_actividad VALUES('06 ',' F. Construcción');
INSERT INTO rama_actividad VALUES('07 ',' G. Comercio, reparación vehículos');
INSERT INTO rama_actividad VALUES('08 ',' H. Transporte y almacenamiento');
INSERT INTO rama_actividad VALUES('09 ',' I. Actividades de alojamiento y servicios de comida');
INSERT INTO rama_actividad VALUES('10 ',' J. Información y comunicación');
INSERT INTO rama_actividad VALUES('11 ',' K. Actividades financieras y de seguros');
INSERT INTO rama_actividad VALUES('12 ',' L. Actividades inmobiliarias');
INSERT INTO rama_actividad VALUES('13 ',' M. Actividades profesionales, científicas y técnicas');
INSERT INTO rama_actividad VALUES('14 ',' N. Actividades y servicios administrativos y de apoyo');
INSERT INTO rama_actividad VALUES('15 ',' O .Administración pública, defensa y seguridad social');
INSERT INTO rama_actividad VALUES('16 ',' P. Enseñanza');
INSERT INTO rama_actividad VALUES('17 ',' Q. Actividades, servicios sociales y de salud');
INSERT INTO rama_actividad VALUES('18 ',' R. Artes, entretenimiento y recreación');
INSERT INTO rama_actividad VALUES('19 ',' S. Otras actividades de servicios');
INSERT INTO rama_actividad VALUES('20 ',' T  Actividades en hogares privados con servicio doméstico');
INSERT INTO rama_actividad VALUES('21 ',' U  Actividades de organizaciones extraterritoriales');
INSERT INTO rama_actividad VALUES('22 ',' No especificado');

INSERT INTO condicion_actividad VALUES(1,' Empleo Adecuado/Pleno');
INSERT INTO condicion_actividad VALUES(2,' Subempleo por insuficiencia de tiempo de trabajo');
INSERT INTO condicion_actividad VALUES(3,' Subempleo por insuficiencia de ingresos');
INSERT INTO condicion_actividad VALUES(4,' Otro empleo no pleno');
INSERT INTO condicion_actividad VALUES(5,' Empleo no remunerado');
INSERT INTO condicion_actividad VALUES(6,' Empleo no clasificado');
INSERT INTO condicion_actividad VALUES(7,' Desempleo abierto');
INSERT INTO condicion_actividad VALUES(8,' Desempleo oculto');