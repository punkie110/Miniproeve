-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Gegenereerd op: 29 aug 2024 om 13:54
-- Serverversie: 10.4.28-MariaDB
-- PHP-versie: 8.2.4

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `miniproef2`
--

-- --------------------------------------------------------

--
-- Tabelstructuur voor tabel `concerten`
--

CREATE TABLE `concerten` (
  `concert_id` int(11) NOT NULL,
  `concert_data` date NOT NULL,
  `concert_artiest` text NOT NULL,
  `concert_locatie_id` int(11) NOT NULL,
  `concert_genre` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Gegevens worden geëxporteerd voor tabel `concerten`
--

INSERT INTO `concerten` (`concert_id`, `concert_data`, `concert_artiest`, `concert_locatie_id`, `concert_genre`) VALUES
(0, '0000-00-00', '', 0, '');

-- --------------------------------------------------------

--
-- Tabelstructuur voor tabel `gebruikers`
--

CREATE TABLE `gebruikers` (
  `gebruiker_id` int(11) NOT NULL,
  `gebruiker_voornaam` varchar(100) NOT NULL,
  `gebruiker_achternaam` varchar(100) NOT NULL,
  `gebruiker_email` varchar(150) NOT NULL,
  `gebruiker_username` varchar(50) NOT NULL,
  `gebruiker_wachtwoord` varchar(255) NOT NULL,
  `gebruiker_admin` tinyint(1) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Tabelstructuur voor tabel `locaties`
--

CREATE TABLE `locaties` (
  `locatie_id` tinyint(4) NOT NULL,
  `locatie_naam` varchar(100) NOT NULL,
  `locatie_stad` varchar(100) NOT NULL,
  `locatie_capaciteit` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Tabelstructuur voor tabel `sessions`
--

CREATE TABLE `sessions` (
  `session_ID` int(11) NOT NULL,
  `session_user_ID` int(11) NOT NULL,
  `session_key` varchar(255) NOT NULL,
  `session_start` datetime NOT NULL,
  `session_eind` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Indexen voor geëxporteerde tabellen
--

--
-- Indexen voor tabel `gebruikers`
--
ALTER TABLE `gebruikers`
  ADD PRIMARY KEY (`gebruiker_id`),
  ADD UNIQUE KEY `Gebruiker_email` (`gebruiker_email`),
  ADD UNIQUE KEY `Gebruiker_username` (`gebruiker_username`);

--
-- Indexen voor tabel `locaties`
--
ALTER TABLE `locaties`
  ADD PRIMARY KEY (`locatie_id`);

--
-- Indexen voor tabel `sessions`
--
ALTER TABLE `sessions`
  ADD PRIMARY KEY (`session_ID`),
  ADD KEY `session_user_ID` (`session_user_ID`);

--
-- AUTO_INCREMENT voor geëxporteerde tabellen
--

--
-- AUTO_INCREMENT voor een tabel `gebruikers`
--
ALTER TABLE `gebruikers`
  MODIFY `gebruiker_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT voor een tabel `locaties`
--
ALTER TABLE `locaties`
  MODIFY `locatie_id` tinyint(4) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT voor een tabel `sessions`
--
ALTER TABLE `sessions`
  MODIFY `session_ID` int(11) NOT NULL AUTO_INCREMENT;

--
-- Beperkingen voor geëxporteerde tabellen
--

--
-- Beperkingen voor tabel `sessions`
--
ALTER TABLE `sessions`
  ADD CONSTRAINT `sessions_ibfk_1` FOREIGN KEY (`session_user_ID`) REFERENCES `gebruikers` (`Gebruiker_ID`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
