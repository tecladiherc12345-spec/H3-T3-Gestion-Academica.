
CREATE DATABASE gestion_academica;
USE gestion_academica;

CREATE TABLE estudiantes (
    id_estudiante INT AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(100) NOT NULL,
    apellido VARCHAR(100) NOT NULL,
    curso VARCHAR(30) NOT NULL
);

CREATE TABLE docentes (
    id_docente INT AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(100) NOT NULL,
    apellido VARCHAR(100) NOT NULL
);

CREATE TABLE materias (
    id_materia INT AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(100) NOT NULL,
    id_docente INT NOT NULL,
    FOREIGN KEY (id_docente)
        REFERENCES docentes(id_docente)
);

CREATE TABLE calificaciones (
    id_calificacion INT AUTO_INCREMENT PRIMARY KEY,
    id_estudiante INT NOT NULL,
    id_materia INT NOT NULL,
    nota DECIMAL(5,2) NOT NULL,
    periodo VARCHAR(30) NOT NULL,
    FOREIGN KEY (id_estudiante)
        REFERENCES estudiantes(id_estudiante),
    FOREIGN KEY (id_materia)
        REFERENCES materias(id_materia)
);

-- Consulta 1: Mostrar las calificaciones de los estudiantes

SELECT
    e.nombre,
    e.apellido,
    m.nombre AS materia,
    c.nota,
    c.periodo
FROM calificaciones c
INNER JOIN estudiantes e
    ON c.id_estudiante = e.id_estudiante
INNER JOIN materias m
    ON c.id_materia = m.id_materia;

-- Consulta 2: Contar estudiantes aprobados por materia

SELECT
    m.nombre AS materia,
    c.periodo,
    COUNT(*) AS estudiantes_aprobados
FROM calificaciones c
INNER JOIN materias m
    ON c.id_materia = m.id_materia
WHERE c.nota >= 51
    AND c.periodo = 'Primer trimestre'
GROUP BY m.nombre, c.periodo;
