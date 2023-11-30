const mysql = require('mysql');
const connection = mysql.createConnection({
    host: 'localhost',
    user: 'root',
    password: 'DeTimo',
    database: 'notensystem'
});

// Verbindung zur Datenbank herstellen
connection.connect();

// Schüler hinzufügen (Create)
function addStudent(vorname, nachname) {
    const query = 'INSERT INTO Schueler (Vorname, Nachname) VALUES (?, ?)';
    connection.query(query, [vorname, nachname], (error, results) => {
        if (error) throw error;
        console.log('Schüler hinzugefügt:', results.insertId);
    });
}

// Schüler anzeigen (Read)
function getStudents() {
    const query = 'SELECT * FROM Schueler';
    connection.query(query, (error, results) => {
        if (error) throw error;
        console.log('Schüler:', results);
    });
}

// Schüler aktualisieren (Update)
function updateStudent(studentID, newVorname, newNachname) {
    const query = 'UPDATE Schueler SET Vorname=?, Nachname=? WHERE SchuelerID=?';
    connection.query(query, [newVorname, newNachname, studentID], (error, results) => {
        if (error) throw error;
        console.log('Schüler aktualisiert:', results.affectedRows);
    });
}

// Schüler löschen (Delete)
function deleteStudent(studentID) {
    const query = 'DELETE FROM Schueler WHERE SchuelerID=?';
    connection.query(query, [studentID], (error, results) => {
        if (error) throw error;
        console.log('Schüler gelöscht:', results.affectedRows);
    });
}

// Beispielaufrufe
addStudent('Max', 'Mustermann');
getStudents();
updateStudent(1, 'Maximilian', 'Muster');
deleteStudent(2);

// Verbindung schließen
connection.end();
