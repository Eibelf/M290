create database Zeugnissystem;

-- Tabelle für Semester
CREATE TABLE Semester (
semester_id INT PRIMARY KEY,
semester_number INT NOT NULL
);

-- Tabelle für Noten
CREATE TABLE Noten (
note_id INT PRIMARY KEY,
note_value DECIMAL(3,1) NOT NULL
);

-- Tabelle für Schüler und Klassen
CREATE TABLE Schueler (
schueler_id INT PRIMARY KEY,
vorname VARCHAR(50) NOT NULL,
nachname VARCHAR(50) NOT NULL,
schulklasse VARCHAR(10) NOT NULL
);

-- Tabelle für Fächer
CREATE TABLE Faecher (
fach_id INT PRIMARY KEY,
fach_name VARCHAR(50) NOT NULL
);

-- Tabelle für das Zeugnis
CREATE TABLE Zeugnis (
zeugnis_id INT PRIMARY KEY,
schueler_id INT,
fach_id INT,
 semester_id INT,
note_id INT,
FOREIGN KEY (schueler_id) REFERENCES Schueler(schueler_id),
FOREIGN KEY (fach_id) REFERENCES Faecher(fach_id),
FOREIGN KEY (semester_id) REFERENCES Semester(semester_id),
FOREIGN KEY (note_id) REFERENCES Noten(note_id)
);

