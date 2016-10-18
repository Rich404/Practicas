

/* CON FORANEAS */

CREATE DATABASE escuelaForaneas;
USE escuelaForaneas;

CREATE TABLE carreras(
IdCarrera INT PRIMARY KEY,
nombre_c VARCHAR(20)
);

CREATE TABLE profesores(
IdProfe INT PRIMARY KEY,
NombreProfe VARCHAR(20)
);
DESC profesores;

CREATE TABLE materias(
IdMateria INT PRIMARY KEY,
Materia VARCHAR(20)
);

CREATE TABLE alumnos(
IdAlum INT PRIMARY KEY,
NomAlu VARCHAR(20),
EdadAlu INT,
SemAlu INT,
IdCarrera INT,
IdMateria INT,
FOREIGN KEY (IdCarrera) REFERENCES carreras(IdCarrera),
FOREIGN KEY (IdMateria) REFERENCES materias(IdMateria)
);


CREATE TABLE alum_Mate_Profe (
IdAlum INT,
IdProfe INT,
IdMateria INT,
FOREIGN KEY (IdAlum) REFERENCES alumnos(IdAlum),
FOREIGN KEY (IdProfe) REFERENCES profesores(IdProfe),
FOREIGN KEY (IdMateria) REFERENCES materias(IdMateria)
);






INSERT INTO carreras VALUES
(123,'Sistemas'),
(145,'Derecho'),
(345,'Educacion');
INSERT INTO materias VALUES
(888,'Base de Dtos'),
(999,'Sistemas Operativos');

INSERT INTO profesores VALUES
(122,'Monica Fuentes'),
(133,'Esmeralda Rosales');

INSERT INTO alumnos VALUES 
(111,'Pedro Infante',18,3,123,999),
(222,'Maria Felix',20,5,345,888),
(333,'Luis Aguilar',25,3,123,999);

INSERT INTO alum_mate_profe VALUES
(111,122,888),
(222,133,999);



Scripts


SELECT A.NomAlu,P.NombreProfe,M.Materia FROM materias as M,profesores as P,alumnos as A WHERE alum_mate_profe.IdAlum = A.IdAlum ;

/********************/



SELECT A.NomAlu,P.NombreProfe,M.Materia FROM alumnos as A,materias as M,profesores as P,alum_Mate_Profe as AMP 
WHERE AMP.IdAlum = A.IdAlum AND AMP.IdProfe = P.IdProfe AND AMP.IdMateria = M.IdMateria;




/********************/
select A.IdAlum,A.NomAlu from alumnos as A;

Select A.IdAlum,A.NomAlu,C.nombre_c,M.Materia from alumnos as A, carreras as C , materias as M  WHERE A.IdCarrera = C.IdCarrera AND A.IdMateria = M.IdMateria;




