CREATE DATABASE notensystem;

-- Schüler-Tabelle
CREATE TABLE Schueler (
    SchuelerID INT AUTO_INCREMENT PRIMARY KEY,
    Vorname VARCHAR(255) NOT NULL,
    Nachname VARCHAR(255) NOT NULL
);

-- Fächer-Tabelle
CREATE TABLE Faecher (
    FachID INT AUTO_INCREMENT PRIMARY KEY,
    Fachname VARCHAR(255) NOT NULL
);

-- Semester-Tabelle
CREATE TABLE Semester (
    SemesterID INT AUTO_INCREMENT PRIMARY KEY,
    Semestername VARCHAR(255) NOT NULL
);

-- Noten-Tabelle
CREATE TABLE Noten (
    NoteID INT AUTO_INCREMENT PRIMARY KEY,
    SchuelerID INT,
    FachID INT,
    SemesterID INT,
    Note DECIMAL(3, 2) NOT NULL,
    FOREIGN KEY (SchuelerID) REFERENCES Schueler(SchuelerID),
    FOREIGN KEY (FachID) REFERENCES Faecher(FachID),
    FOREIGN KEY (SemesterID) REFERENCES Semester(SemesterID)
);

-- Zeugnisse-Tabelle (Verknüpfung von Schüler, Noten und Semester)
CREATE TABLE Zeugnisse (
    ZeugnisID INT AUTO_INCREMENT PRIMARY KEY,
    SchuelerID INT,
    SemesterID INT,
    FOREIGN KEY (SchuelerID) REFERENCES Schueler(SchuelerID),
    FOREIGN KEY (SemesterID) REFERENCES Semester(SemesterID)
);