# Modelo Relacional

## Plataforma para la Gestión Académica de Unidades Educativas

### 1. Tabla: Estudiantes

| Atributo      | Tipo de dato | Clave |
| ------------- | ------------ | ----- |
| id_estudiante | INT          | PK    |
| nombre        | VARCHAR(100) |       |
| apellido      | VARCHAR(100) |       |
| curso         | VARCHAR(30)  |       |

### 2. Tabla: Docentes

| Atributo   | Tipo de dato | Clave |
| ---------- | ------------ | ----- |
| id_docente | INT          | PK    |
| nombre     | VARCHAR(100) |       |
| apellido   | VARCHAR(100) |       |

### 3. Tabla: Materias

| Atributo   | Tipo de dato | Clave |
| ---------- | ------------ | ----- |
| id_materia | INT          | PK    |
| nombre     | VARCHAR(100) |       |
| id_docente | INT          | FK    |

### 4. Tabla: Calificaciones

| Atributo        | Tipo de dato | Clave |
| --------------- | ------------ | ----- |
| id_calificacion | INT          | PK    |
| id_estudiante   | INT          | FK    |
| id_materia      | INT          | FK    |
| nota            | DECIMAL(5,2) |       |
| periodo         | VARCHAR(30)  |       |

### 5. Relaciones entre tablas

- Docentes (1) — (N) Materias.
- Estudiantes (1) — (N) Calificaciones.
- Materias (1) — (N) Calificaciones.

### 6. Claves foráneas

- `Materias.id_docente` → `Docentes.id_docente`
- `Calificaciones.id_estudiante` → `Estudiantes.id_estudiante`
- `Calificaciones.id_materia` → `Materias.id_materia`
