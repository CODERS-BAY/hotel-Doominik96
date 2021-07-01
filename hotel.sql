-- phpMyAdmin SQL Dump
-- version 5.0.2
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Erstellungszeit: 01. Jul 2021 um 13:54
-- Server-Version: 10.4.14-MariaDB
-- PHP-Version: 7.4.9

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Datenbank: `hotel`
--

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `basicdesign`
--

CREATE TABLE `basicdesign` (
  `package_id` int(11) NOT NULL,
  `basicpackage_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `basicpackage`
--

CREATE TABLE `basicpackage` (
  `basicpackage_id` int(11) NOT NULL,
  `description` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `booking`
--

CREATE TABLE `booking` (
  `booking_id` int(11) NOT NULL,
  `booking_arrival` datetime DEFAULT NULL,
  `booking_departure` datetime DEFAULT NULL,
  `booking_room_number` int(11) NOT NULL,
  `guest_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `booking_has_package`
--

CREATE TABLE `booking_has_package` (
  `booking_id` int(11) NOT NULL,
  `package_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `caretaker`
--

CREATE TABLE `caretaker` (
  `caretaker_svnr` bigint(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `caretaker_has_package`
--

CREATE TABLE `caretaker_has_package` (
  `caretaker_svnr` bigint(20) NOT NULL,
  `subject_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `category`
--

CREATE TABLE `category` (
  `category_id` int(11) NOT NULL,
  `category_name` varchar(35) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `employee`
--

CREATE TABLE `employee` (
  `employee_svnr` bigint(20) NOT NULL,
  `employee_firstname` varchar(30) DEFAULT NULL,
  `employee_lastname` varchar(30) DEFAULT NULL,
  `employee_postalcode` int(11) DEFAULT NULL,
  `employee_street` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `guest`
--

CREATE TABLE `guest` (
  `guest_id` int(11) NOT NULL,
  `guest_firstname` varchar(50) DEFAULT NULL,
  `guest_lastname` varchar(50) DEFAULT NULL,
  `guest_postalcode` int(11) DEFAULT NULL,
  `guest_street` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `luxurydesign`
--

CREATE TABLE `luxurydesign` (
  `basicpackage_id` int(11) NOT NULL,
  `luxurypackage_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `luxurypackage`
--

CREATE TABLE `luxurypackage` (
  `luxurypackage_id` int(11) NOT NULL,
  `description` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `package`
--

CREATE TABLE `package` (
  `package_id` int(11) NOT NULL,
  `package_design` varchar(50) DEFAULT NULL,
  `package_price` varchar(50) DEFAULT NULL,
  `package_quantity` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `package_has_caretaker`
--

CREATE TABLE `package_has_caretaker` (
  `package_id` int(11) NOT NULL,
  `caretaker_svnr` bigint(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `roomattendant`
--

CREATE TABLE `roomattendant` (
  `roomattendant_svnr` bigint(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `rooms`
--

CREATE TABLE `rooms` (
  `room_number` int(11) NOT NULL,
  `room_persons` int(11) DEFAULT NULL,
  `category_id` int(11) NOT NULL,
  `roomattendant_svnr` bigint(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `subject`
--

CREATE TABLE `subject` (
  `subject_id` int(11) NOT NULL,
  `subject_area` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Indizes der exportierten Tabellen
--

--
-- Indizes für die Tabelle `basicdesign`
--
ALTER TABLE `basicdesign`
  ADD PRIMARY KEY (`package_id`,`basicpackage_id`),
  ADD KEY `basicpackage_id` (`basicpackage_id`);

--
-- Indizes für die Tabelle `basicpackage`
--
ALTER TABLE `basicpackage`
  ADD PRIMARY KEY (`basicpackage_id`);

--
-- Indizes für die Tabelle `booking`
--
ALTER TABLE `booking`
  ADD PRIMARY KEY (`booking_id`),
  ADD KEY `booking_room_number` (`booking_room_number`),
  ADD KEY `guest_id` (`guest_id`);

--
-- Indizes für die Tabelle `booking_has_package`
--
ALTER TABLE `booking_has_package`
  ADD PRIMARY KEY (`booking_id`,`package_id`),
  ADD KEY `package_id` (`package_id`);

--
-- Indizes für die Tabelle `caretaker`
--
ALTER TABLE `caretaker`
  ADD PRIMARY KEY (`caretaker_svnr`);

--
-- Indizes für die Tabelle `caretaker_has_package`
--
ALTER TABLE `caretaker_has_package`
  ADD PRIMARY KEY (`caretaker_svnr`,`subject_id`),
  ADD KEY `subject_id` (`subject_id`);

--
-- Indizes für die Tabelle `category`
--
ALTER TABLE `category`
  ADD PRIMARY KEY (`category_id`);

--
-- Indizes für die Tabelle `employee`
--
ALTER TABLE `employee`
  ADD PRIMARY KEY (`employee_svnr`);

--
-- Indizes für die Tabelle `guest`
--
ALTER TABLE `guest`
  ADD PRIMARY KEY (`guest_id`);

--
-- Indizes für die Tabelle `luxurydesign`
--
ALTER TABLE `luxurydesign`
  ADD PRIMARY KEY (`basicpackage_id`,`luxurypackage_id`),
  ADD KEY `luxurypackage_id` (`luxurypackage_id`);

--
-- Indizes für die Tabelle `luxurypackage`
--
ALTER TABLE `luxurypackage`
  ADD PRIMARY KEY (`luxurypackage_id`);

--
-- Indizes für die Tabelle `package`
--
ALTER TABLE `package`
  ADD PRIMARY KEY (`package_id`);

--
-- Indizes für die Tabelle `package_has_caretaker`
--
ALTER TABLE `package_has_caretaker`
  ADD PRIMARY KEY (`package_id`,`caretaker_svnr`),
  ADD KEY `caretaker_svnr` (`caretaker_svnr`);

--
-- Indizes für die Tabelle `roomattendant`
--
ALTER TABLE `roomattendant`
  ADD PRIMARY KEY (`roomattendant_svnr`);

--
-- Indizes für die Tabelle `rooms`
--
ALTER TABLE `rooms`
  ADD PRIMARY KEY (`room_number`),
  ADD KEY `category_id` (`category_id`),
  ADD KEY `roomattendant_svnr` (`roomattendant_svnr`);

--
-- Indizes für die Tabelle `subject`
--
ALTER TABLE `subject`
  ADD PRIMARY KEY (`subject_id`);

--
-- AUTO_INCREMENT für exportierte Tabellen
--

--
-- AUTO_INCREMENT für Tabelle `booking`
--
ALTER TABLE `booking`
  MODIFY `booking_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT für Tabelle `category`
--
ALTER TABLE `category`
  MODIFY `category_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT für Tabelle `guest`
--
ALTER TABLE `guest`
  MODIFY `guest_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT für Tabelle `package`
--
ALTER TABLE `package`
  MODIFY `package_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT für Tabelle `subject`
--
ALTER TABLE `subject`
  MODIFY `subject_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- Constraints der exportierten Tabellen
--

--
-- Constraints der Tabelle `basicdesign`
--
ALTER TABLE `basicdesign`
  ADD CONSTRAINT `basicdesign_ibfk_1` FOREIGN KEY (`package_id`) REFERENCES `package` (`package_id`),
  ADD CONSTRAINT `basicdesign_ibfk_2` FOREIGN KEY (`basicpackage_id`) REFERENCES `basicpackage` (`basicpackage_id`);

--
-- Constraints der Tabelle `booking`
--
ALTER TABLE `booking`
  ADD CONSTRAINT `booking_ibfk_1` FOREIGN KEY (`booking_room_number`) REFERENCES `rooms` (`room_number`),
  ADD CONSTRAINT `booking_ibfk_2` FOREIGN KEY (`guest_id`) REFERENCES `guest` (`guest_id`);

--
-- Constraints der Tabelle `booking_has_package`
--
ALTER TABLE `booking_has_package`
  ADD CONSTRAINT `booking_has_package_ibfk_1` FOREIGN KEY (`booking_id`) REFERENCES `booking` (`booking_id`),
  ADD CONSTRAINT `booking_has_package_ibfk_2` FOREIGN KEY (`package_id`) REFERENCES `package` (`package_id`);

--
-- Constraints der Tabelle `caretaker`
--
ALTER TABLE `caretaker`
  ADD CONSTRAINT `caretaker_ibfk_1` FOREIGN KEY (`caretaker_svnr`) REFERENCES `employee` (`employee_svnr`);

--
-- Constraints der Tabelle `caretaker_has_package`
--
ALTER TABLE `caretaker_has_package`
  ADD CONSTRAINT `caretaker_has_package_ibfk_1` FOREIGN KEY (`caretaker_svnr`) REFERENCES `caretaker` (`caretaker_svnr`),
  ADD CONSTRAINT `caretaker_has_package_ibfk_2` FOREIGN KEY (`subject_id`) REFERENCES `subject` (`subject_id`);

--
-- Constraints der Tabelle `luxurydesign`
--
ALTER TABLE `luxurydesign`
  ADD CONSTRAINT `luxurydesign_ibfk_1` FOREIGN KEY (`basicpackage_id`) REFERENCES `basicpackage` (`basicpackage_id`),
  ADD CONSTRAINT `luxurydesign_ibfk_2` FOREIGN KEY (`luxurypackage_id`) REFERENCES `luxurypackage` (`luxurypackage_id`);

--
-- Constraints der Tabelle `package_has_caretaker`
--
ALTER TABLE `package_has_caretaker`
  ADD CONSTRAINT `package_has_caretaker_ibfk_1` FOREIGN KEY (`package_id`) REFERENCES `package` (`package_id`),
  ADD CONSTRAINT `package_has_caretaker_ibfk_2` FOREIGN KEY (`caretaker_svnr`) REFERENCES `caretaker` (`caretaker_svnr`);

--
-- Constraints der Tabelle `roomattendant`
--
ALTER TABLE `roomattendant`
  ADD CONSTRAINT `roomattendant_ibfk_1` FOREIGN KEY (`roomattendant_svnr`) REFERENCES `employee` (`employee_svnr`);

--
-- Constraints der Tabelle `rooms`
--
ALTER TABLE `rooms`
  ADD CONSTRAINT `rooms_ibfk_1` FOREIGN KEY (`category_id`) REFERENCES `category` (`category_id`),
  ADD CONSTRAINT `rooms_ibfk_2` FOREIGN KEY (`roomattendant_svnr`) REFERENCES `roomattendant` (`roomattendant_svnr`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
