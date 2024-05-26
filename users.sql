-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: May 26, 2024 at 09:01 PM
-- Server version: 10.4.32-MariaDB
-- PHP Version: 8.0.30

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `credit_system`
--

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` int(11) NOT NULL,
  `username` varchar(50) NOT NULL,
  `password` varchar(255) NOT NULL,
  `credits` decimal(10,2) DEFAULT 0.00,
  `expires_at` datetime DEFAULT NULL,
  `is_admin` tinyint(1) DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `username`, `password`, `credits`, `expires_at`, `is_admin`) VALUES
(1, '123', '$2y$10$DhevgBFZTQdNt5UzkLNM8eDZITcA1YvhEvyHulSGrfBgpufTqqNkm', 4.00, '2024-05-26 20:51:24', 0),
(2, '3211', '$2y$10$qQmgJOBWDOjBroJpeQa.O.Ppr1HAz345J.Me9rXIFP3eSksaOQGb6', 0.00, NULL, 0),
(3, '1231', '$2y$10$W2PBwADyPRuCVmbqAVxvUeVCCY7WEFNpj8fngEj.m97bC3mGoWnSG', 0.00, NULL, 1),
(4, '12333', '$2y$10$XvuJO0Kq.g.gBWBIo/Z2Pe0BbkB5S.GyFeTvoIgDTd06PiQRnVuT.', 0.00, NULL, 0),
(5, 'RED', '$2y$10$Y2r4tdbRd92G0ff5jLeyBeUp8dlZIoyZX73kEdogbqcqnk8O6FmhS', 0.00, NULL, 1),
(7, 'AAA', '$2y$10$EhQ4ltvrnVVWFnY4ERjn4ebs9NSACN0xLe78z53NzktjtYpMtIe0y', 0.00, NULL, 1);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `username` (`username`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
