create database Zeugnissystem;

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Datenbank: `zeugnissystem`
--

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `fächer`
--

CREATE TABLE `fächer` (
                          `ID` int(255) NOT NULL,
                          `Fachbezeichnung` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Daten für Tabelle `fächer`
--

INSERT INTO `fächer` (`ID`, `Fachbezeichnung`) VALUES
                                                   (1, 'Englisch'),
                                                   (2, 'Marketingachsprache'),
                                                   (3, 'Sprache und Kommunikation'),
                                                   (4, 'Gesellschaft'),
                                                   (5, 'Sport');

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `klasse`
--

CREATE TABLE `klasse` (
                          `ID` int(255) NOT NULL,
                          `Klassenbezeichnung` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Daten für Tabelle `klasse`
--

INSERT INTO `klasse` (`ID`, `Klassenbezeichnung`) VALUES
    (1, 'AB21b');

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `noten`
--

CREATE TABLE `noten` (
                         `ID` int(255) NOT NULL,
                         `Note` decimal(2,1) NOT NULL,
                         `Semester` int(255) NOT NULL,
                         `Fach` int(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Daten für Tabelle `noten`
--

INSERT INTO `noten` (`ID`, `Note`, `Semester`, `Fach`) VALUES
                                                           (1, 6.0, 1, 1),
                                                           (2, 5.0, 1, 2),
                                                           (3, 5.5, 1, 2);

-- --------------------------------------------------------
--
-- Tabellenstruktur für Tabelle `schüler`
--

CREATE TABLE `schüler` (
                           `ID` int(255) NOT NULL,
                           `Name` varchar(255) NOT NULL,
                           `Klasse` int(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Daten für Tabelle `schüler`
--

INSERT INTO `schüler` (`ID`, `Name`, `Klasse`) VALUES
    (1, 'Florin Eibel', 1);

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `semester`
--

CREATE TABLE `semester` (
                            `ID` int(255) NOT NULL,
                            `Semester` int(1) NOT NULL,
                            `Schüler` int(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Daten für Tabelle `semester`
--

INSERT INTO `semester` (`ID`, `Semester`, `Schüler`) VALUES
    (1, 1, 1);

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `zeugnis`
--

CREATE TABLE `zeugnis` (
                           `ID` int(255) NOT NULL,
                           `Semester` int(255) NOT NULL,
                           `Ausstellungsdatum` date NOT NULL,
                           `Änderungsdatum` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Daten für Tabelle `zeugnis`
--

INSERT INTO `zeugnis` (`ID`, `Semester`, `Ausstellungsdatum`, `Änderungsdatum`) VALUES
                                                                                    (3, 1, '2024-01-02', NULL);
--
-- Indizes der exportierten Tabellen
--

--
-- Indizes für die Tabelle `fächer`
--
ALTER TABLE `fächer`
    ADD PRIMARY KEY (`ID`);

--
-- Indizes für die Tabelle `klasse`
--
ALTER TABLE `klasse`
    ADD PRIMARY KEY (`ID`);

--
-- Indizes für die Tabelle `noten`
--
ALTER TABLE `noten`
    ADD PRIMARY KEY (`ID`),
    ADD KEY `Semester` (`Semester`),
    ADD KEY `Fach` (`Fach`);

--
-- Indizes für die Tabelle `schüler`
--
ALTER TABLE `schüler`
    ADD PRIMARY KEY (`ID`),
    ADD KEY `Klasse` (`Klasse`);

--
-- Indizes für die Tabelle `semester`
--
ALTER TABLE `semester`
    ADD PRIMARY KEY (`ID`),
    ADD KEY `Schüler` (`Schüler`);

--
-- Indizes für die Tabelle `zeugnis`
--
ALTER TABLE `zeugnis`
    ADD PRIMARY KEY (`ID`),
    ADD KEY `Semester` (`Semester`);

--
-- AUTO_INCREMENT für exportierte Tabellen
--

--
-- AUTO_INCREMENT für Tabelle `fächer`
--
ALTER TABLE `fächer`
    MODIFY `ID` int(255) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT für Tabelle `klasse`
--
ALTER TABLE `klasse`
    MODIFY `ID` int(255) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT für Tabelle `noten`
--
ALTER TABLE `noten`
    MODIFY `ID` int(255) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT für Tabelle `schüler`
--
ALTER TABLE `schüler`
    MODIFY `ID` int(255) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT für Tabelle `semester`
--
ALTER TABLE `semester`
    MODIFY `ID` int(255) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT für Tabelle `zeugnis`
--
ALTER TABLE `zeugnis`
    MODIFY `ID` int(255) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- Constraints der exportierten Tabellen
--

--
-- Constraints der Tabelle `noten`
--
ALTER TABLE `noten`
    ADD CONSTRAINT `noten_ibfk_1` FOREIGN KEY (`Semester`) REFERENCES `semester` (`ID`),
    ADD CONSTRAINT `noten_ibfk_2` FOREIGN KEY (`Fach`) REFERENCES `fächer` (`ID`);

--
-- Constraints der Tabelle `schüler`
--
ALTER TABLE `schüler`
    ADD CONSTRAINT `schüler_ibfk_1` FOREIGN KEY (`Klasse`) REFERENCES `klasse` (`ID`);

--
-- Constraints der Tabelle `semester`
--
ALTER TABLE `semester`
    ADD CONSTRAINT `semester_ibfk_1` FOREIGN KEY (`Schüler`) REFERENCES `schüler` (`ID`);

--
-- Constraints der Tabelle `zeugnis`
--
ALTER TABLE `zeugnis`
    ADD CONSTRAINT `zeugnis_ibfk_1` FOREIGN KEY (`Semester`) REFERENCES `semester` (`ID`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
