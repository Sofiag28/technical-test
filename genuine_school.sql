use Genuineschool;
CREATE TABLE cursos (
    id INT AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(100) NOT NULL,
    grado INT NOT NULL, -- Ejemplo: 1, 2, 3... hasta 11
    descripcion TEXT
);
INSERT INTO cursos (nombre, grado, descripcion) VALUES
('Curso 1', 1, 'Primer grado'),
('Curso 2', 2, 'Segundo grado'),
('Curso 3', 3, 'Tercer grado'),
('Curso 4', 4, 'Cuarto grado'),
('Curso 5', 5, 'Quinto grado'),
('Curso 6', 6, 'Sexto grado'),
('Curso 7', 7, 'Séptimo grado'),
('Curso 8', 8, 'Octavo grado'),
('Curso 9', 9, 'Noveno grado'),
('Curso 10', 10, 'Décimo grado'),
('Curso 11', 11, 'Once grado');
ALTER TABLE tareas MODIFY id_curso INT NOT NULL,
ADD CONSTRAINT fk_tarea_curso FOREIGN KEY (id_curso) REFERENCES cursos(id);

ALTER TABLE estudiantes
ADD COLUMN id_curso INT,
ADD CONSTRAINT fk_estudiante_curso FOREIGN KEY (id_curso) REFERENCES cursos(id);
UPDATE tareas SET id_curso = 1 WHERE id_curso IS NULL OR id_curso NOT IN (SELECT id FROM cursos);
ALTER TABLE tareas
ADD CONSTRAINT fk_tarea_curso
FOREIGN KEY (id_curso) REFERENCES cursos(id);
ALTER TABLE estudiantes
ADD COLUMN id_curso INT;

UPDATE estudiantes SET curso = 1 WHERE id_curso IS NULL;  -- Asigna curso por defecto

ALTER TABLE estudiantes
ADD CONSTRAINT fk_estudiante_curso
FOREIGN KEY (id_curso) REFERENCES cursos(id);

-- Deja la relación con estudiantes, pero hazla opcional
ALTER TABLE tareas MODIFY id_estudiante INT NULL;


ALTER TABLE tareas MODIFY id_estudiante INT NOT NULL;

ALTER TABLE tareas DROP FOREIGN KEY tareas_ibfk_1;
ALTER TABLE tareas MODIFY id_estudiante INT NULL;


ALTER TABLE estudiantes 
ADD COLUMN verificado BOOLEAN DEFAULT FALSE,
ADD COLUMN token VARCHAR(255);

ALTER TABLE estudiantes
ADD COLUMN password VARCHAR(255) NOT NULL;
-- Supongamos que el curso viejo era un número
UPDATE estudiantes SET id_curso = curso WHERE id_curso IS NULL;

ALTER TABLE estudiantes
ADD COLUMN rol VARCHAR(20) NOT NULL DEFAULT 'estudiante';
ALTER TABLE estudiantes
ADD COLUMN curso VARCHAR(100);
 ALTER TABLE estudiantes 
MODIFY COLUMN fecha_inscripcion DATETIME DEFAULT CURRENT_TIMESTAMP;

CREATE TABLE tareas (
  id INT AUTO_INCREMENT PRIMARY KEY,
  id_estudiante INT NOT NULL,
  titulo VARCHAR(100),
  descripcion TEXT,
  estado ENUM('pendiente', 'en_progreso', 'completada') DEFAULT 'pendiente',
  fecha_entrega DATE,
  FOREIGN KEY (id_estudiante) REFERENCES estudiantes(id)
);
INSERT INTO tareas (id_estudiante, titulo, descripcion, estado, fecha_entrega)
VALUES
(1, 'Lectura capítulo 3', 'Leer y resumir el capítulo 3 del libro de historia', 'pendiente', '2025-10-20'),
(1, 'Proyecto de ciencias', 'Preparar exposición sobre el sistema solar', 'en_progreso', '2025-10-25'),
(2, 'Ensayo de literatura', 'Escribir un ensayo sobre “Cien años de soledad”', 'pendiente', '2025-10-18');

CREATE TABLE tareas (
  id INT AUTO_INCREMENT PRIMARY KEY,
  id_estudiante INT NOT NULL,
  titulo VARCHAR(100) NOT NULL,
  descripcion TEXT,
  estado ENUM('pendiente', 'en_progreso', 'completada') DEFAULT 'pendiente',
  fecha_entrega DATE,
  FOREIGN KEY (id_estudiante) REFERENCES estudiantes(id)

);

ALTER TABLE tareas ADD COLUMN id_curso INT;

INSERT INTO tareas (id_estudiante, titulo, descripcion, estado, fecha_entrega)
VALUES
(16, 'Resolver ejercicios de matemáticas', 'Del 1 al 20 del cuaderno', 'pendiente', '2025-10-15'),
(16, 'Lectura de historia', 'Leer el capítulo 4 del libro', 'en_progreso', '2025-10-17'),
(16, 'Exposición de ciencias', 'Preparar presentación sobre los planetas', 'pendiente', '2025-10-20');

INSERT INTO personal (id, nombre, apellido, email, rol, genero) VALUES
(1, 'Laura', 'González', 'laura.gonzalez@edu.com', 'profesor', 'F'),
(2, 'Andrés', 'Mejía', 'andres.mejia@edu.com', 'profesor', 'M'),
(3, 'Valeria', 'Ríos', 'valeria.rios@edu.com', 'profesor', 'F'),
(4, 'Sebastián', 'Duarte', 'sebastian.duarte@edu.com', 'profesor', 'M'),
(5, 'Camila', 'Torres', 'camila.torres@empresa.com', 'comercial', 'F'),
(6, 'Nicolás', 'Herrera', 'nicolas.herrera@empresa.com', 'comercial', 'M'),
(7, 'Juliana', 'Peña', 'juliana.pena@empresa.com', 'comercial', 'F'),
(8, 'Daniela', 'Ramírez', 'daniela.ramirez@empresa.com', 'marketing', 'F'),
(9, 'Samuel', 'Rodríguez', 'samuel.rodriguez@empresa.com', 'marketing', 'M'),
(10, 'Natalia', 'Gómez', 'natalia.gomez@empresa.com', 'marketing', 'F');
ALTER TABLE personal ADD COLUMN password VARCHAR(255);
INSERT INTO personal (nombre, apellido, email, password, rol, genero) VALUES
('Laura', 'González', 'laura.gonzalez@edu.com', '$2b$12$R/CYAxYdPyqh60VUGxOsEucgJ.EB6C2oQepufQkHZ5OrWi2RC8BeS', 'profesor', 'Femenino'),
$2b$12$R/CYAxYdPyqh60VUGxOsEucgJ.EB6C2oQepufQkHZ5OrWi2RC8BeS
('Andrés', 'Mejía', 'andres.mejia@edu.com', '$2b$12$09ZrWO./EVU2BtK3d2mXdOeS2zKgWQpIulqmoC6EJvtPRuCB27g.a', 'profesor', 'Masculino'),
$2b$12$09ZrWO./EVU2BtK3d2mXdOeS2zKgWQpIulqmoC6EJvtPRuCB27g.a
('Valeria', 'Ríos', 'valeria.rios@edu.com', '$2b$12$88h7GTZcoM4wLU6KNTuHfevszl97Y4OqqmvXt9O.ibUjBR/cVzVOG', 'profesor', 'Femenino'),
$2b$12$88h7GTZcoM4wLU6KNTuHfevszl97Y4OqqmvXt9O.ibUjBR/cVzVOG
('Sebastián', 'Duarte', 'sebastian.duarte@edu.com', '$2b$12$fnC6Y1vUO4f.avHxKCOvyO36aHoKDKecf.VSshA3PlzVvuG4nVFeW', 'profesor', 'Masculino'),
$2b$12$fnC6Y1vUO4f.avHxKCOvyO36aHoKDKecf.VSshA3PlzVvuG4nVFeW
('Camila', 'Torres', 'camila.torres@empresa.com', '$2b$12$wueYcKsjigrfNLkkAWp8uu/cfnhzeb3cOdazUqi8LaHAXHYukcHwK', 'comercial', 'Femenino'),
$2b$12$wueYcKsjigrfNLkkAWp8uu/cfnhzeb3cOdazUqi8LaHAXHYukcHwK
('Nicolás', 'Herrera', 'nicolas.herrera@empresa.com', '$2b$12$aKnJdYGnZuawzZeaosW5ouNA7xvunNsMePZ0bvu2b4nOpvAhDz2jq', 'comercial', 'Masculino'),
$2b$12$aKnJdYGnZuawzZeaosW5ouNA7xvunNsMePZ0bvu2b4nOpvAhDz2jq
('Juliana', 'Peña', 'juliana.pena@empresa.com', '$2b$12$.nPc.PuWAjtjMwgfuOzWo.QH/stNgLc4CQ6U4WrSKJr.qK1RIuar2', 'comercial', 'Femenino'),
$2b$12$.nPc.PuWAjtjMwgfuOzWo.QH/stNgLc4CQ6U4WrSKJr.qK1RIuar2
('Daniela', 'Ramírez', 'daniela.ramirez@empresa.com', '$2b$12$sFP8gSvhaGvHootP2QjCtOM12FU8ga5SEWIJYlnHItISpKsmbhzGq', 'marketing', 'Femenino'),
$2b$12$sFP8gSvhaGvHootP2QjCtOM12FU8ga5SEWIJYlnHItISpKsmbhzGq
('Samuel', 'Rodríguez', 'samuel.rodriguez@empresa.com', '$2b$12$Nl4H4S26iZ56qu7yq6fP2es9wJP56kIO1KQwWgxSxL9pObiTbah1.', 'marketing', 'Masculino'),
$2b$12$Nl4H4S26iZ56qu7yq6fP2es9wJP56kIO1KQwWgxSxL9pObiTbah1.
('Natalia', 'Gómez', 'natalia.gomez@empresa.com', '$2b$12$PV3e6xYEYAHg.wzECOH2wu8ifrOJjQeF2gMBAURdx0R/Ip8zaJR4S', 'marketing', 'Femenino');
$2b$12$PV3e6xYEYAHg.wzECOH2wu8ifrOJjQeF2gMBAURdx0R/Ip8zaJR4S

UPDATE tareas t
JOIN estudiantes e ON t.id_estudiante = e.id
SET t.id_curso = e.id_curso
WHERE t.id_curso IS NULL;
-- Supongamos que el curso viejo era un número
UPDATE estudiantes SET id_curso = curso WHERE id_curso IS NULL;

ALTER TABLE estudiantes
ADD COLUMN id_curso INT;

ALTER TABLE estudiantes
ADD CONSTRAINT fk_estudiante_curso FOREIGN KEY (id_curso) REFERENCES cursos(id);

CREATE TABLE tareas_estudiantes (
    id INT AUTO_INCREMENT PRIMARY KEY,
    id_tarea INT NOT NULL,
    id_estudiante INT NOT NULL,
    estado ENUM('pendiente','completada') DEFAULT 'pendiente',
    fecha_actualizacion DATETIME DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    FOREIGN KEY (id_tarea) REFERENCES tareas(id),
    FOREIGN KEY (id_estudiante) REFERENCES estudiantes(id),
    UNIQUE KEY (id_tarea, id_estudiante)  -- evita duplicados
);
ALTER TABLE personal 
MODIFY rol ENUM('profesor', 'comercial', 'marketing', 'admin') NOT NULL;