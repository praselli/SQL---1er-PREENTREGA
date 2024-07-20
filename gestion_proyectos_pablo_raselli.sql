-- Eliminar la base de datos si ya existe
DROP DATABASE IF EXISTS GestionProyectos;

-- Crear la base de datos
CREATE DATABASE GestionProyectos;

-- Utilizar la base de datos creada
USE GestionProyectos;

CREATE TABLE Usuarios (
    id_usuario INT AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(50),
    apellido VARCHAR(50),
    email VARCHAR(50) UNIQUE,
    contraseña VARCHAR(20),
    rol ENUM('Administrador', 'Miembro')
);

CREATE TABLE Equipos (
    id_equipo INT AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(50)
);

CREATE TABLE MiembrosEquipo (
    id_miembro INT AUTO_INCREMENT PRIMARY KEY,
    id_usuario INT,
    id_equipo INT,
    FOREIGN KEY (id_usuario) REFERENCES Usuarios(id_usuario),
    FOREIGN KEY (id_equipo) REFERENCES Equipos(id_equipo)
);

CREATE TABLE Proyectos (
    id_proyecto INT AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(80),
    descripcion TEXT,
    fecha_inicio DATE,
    fecha_fin DATE,
    id_equipo INT,
    FOREIGN KEY (id_equipo) REFERENCES Equipos(id_equipo)
);

CREATE TABLE Tareas (
    id_tarea INT AUTO_INCREMENT PRIMARY KEY,
    id_proyecto INT,
    nombre VARCHAR(100),
    descripcion TEXT,
    estado ENUM('Pendiente', 'En Proceso', 'Completada'),
    fecha_inicio DATE,
    fecha_fin DATE,
    id_usuario_asignado INT,
    FOREIGN KEY (id_proyecto) REFERENCES Proyectos(id_proyecto),
    FOREIGN KEY (id_usuario_asignado) REFERENCES Usuarios(id_usuario)
);

CREATE TABLE Comentarios (
    id_comentario INT AUTO_INCREMENT PRIMARY KEY,
    id_tarea INT,
    id_usuario INT,
    contenido TEXT,
    fecha_comentario DATETIME,
    FOREIGN KEY (id_tarea) REFERENCES Tareas(id_tarea),
    FOREIGN KEY (id_usuario) REFERENCES Usuarios(id_usuario)
);