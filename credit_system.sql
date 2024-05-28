-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: May 29, 2024 at 01:51 AM
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
-- Table structure for table `credit_history`
--

CREATE TABLE `credit_history` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `credits` decimal(10,2) NOT NULL,
  `operation` varchar(50) NOT NULL,
  `timestamp` datetime DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `credit_history`
--

INSERT INTO `credit_history` (`id`, `user_id`, `credits`, `operation`, `timestamp`) VALUES
(1, 17, 5.00, 'deduct', '2024-05-29 07:22:15'),
(2, 17, 6.50, 'deduct', '2024-05-29 07:22:41'),
(3, 17, 5.00, 'deduct', '2024-05-29 07:22:46'),
(4, 17, 5.00, 'deduct', '2024-05-29 07:22:55'),
(5, 20, 5.00, 'deduct', '2024-05-29 07:40:51'),
(6, 17, 5.00, 'deduct', '2024-05-29 07:41:50'),
(7, 17, 7.00, 'deduct', '2024-05-29 07:41:57'),
(8, 17, 7.00, 'deduct', '2024-05-29 07:46:58'),
(9, 17, 6.50, 'deduct', '2024-05-29 07:47:00');

-- --------------------------------------------------------

--
-- Table structure for table `food_items`
--

CREATE TABLE `food_items` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `price` decimal(10,2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `food_items`
--

INSERT INTO `food_items` (`id`, `name`, `price`) VALUES
(1, 'Sandwich', 5.00),
(2, 'Salad', 3.50),
(3, 'Pizza', 7.00),
(4, 'Burger', 6.50);

-- --------------------------------------------------------

--
-- Table structure for table `orders`
--

CREATE TABLE `orders` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `food_item_id` int(11) NOT NULL,
  `order_date` datetime DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `orders`
--

INSERT INTO `orders` (`id`, `user_id`, `food_item_id`, `order_date`) VALUES
(1, 17, 1, '2024-05-29 07:22:15'),
(2, 17, 4, '2024-05-29 07:22:41'),
(3, 17, 1, '2024-05-29 07:22:46'),
(4, 17, 1, '2024-05-29 07:22:55'),
(5, 20, 1, '2024-05-29 07:40:51'),
(6, 17, 1, '2024-05-29 07:41:50'),
(7, 17, 3, '2024-05-29 07:41:57'),
(8, 17, 3, '2024-05-29 07:46:58'),
(9, 17, 4, '2024-05-29 07:47:00');

-- --------------------------------------------------------

--
-- Table structure for table `sessions`
--

CREATE TABLE `sessions` (
  `session_id` varchar(255) NOT NULL,
  `username` varchar(255) NOT NULL,
  `is_admin` tinyint(1) NOT NULL,
  `expires_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `last_activity` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

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
(7, 'AAA', '$2y$10$EhQ4ltvrnVVWFnY4ERjn4ebs9NSACN0xLe78z53NzktjtYpMtIe0y', 0.00, NULL, 1),
(8, 'admin', '$2y$10$lA/6IIOz1ZQ60AG3pfG.PuT/hyN8EbfDzaNUQL.nQPg0PAdJ3o/pu', 0.00, NULL, 1),
(9, 'kenneth', '$2y$10$r4sTypEsugjD/Lz4BEfKsukm7dsivYRidS49lfgf34U31aGPTkWF2', 0.00, '2024-05-29 07:27:53', 0),
(10, 'test', '$2y$10$DBnFYuZ2n/cu0N8yqAS0mOpv06AEZmo2PMBdY/CFUPkZhdEyCq3tu', 1.00, '2024-05-29 06:48:32', 0),
(12, '222', '$2y$10$0GeMvlOkM0YZ9DYi1zPEjuO86njZKoipcL1vBJ8/mK8CXtbX7dek.', 0.00, NULL, 0),
(13, 'adminnew', '$2y$10$Eq75bHcN9AEy0IennYgG3uT6E/Ctdyf8wDuCRQeVHt/hPcp3L6sqm', 0.00, NULL, 1),
(14, 'thisisad', '$2y$10$du3lt9zUA8nVrsncpzw5d.dgkZo4jeWid.LVBTsBb..canejUtwvq', 0.00, NULL, 1),
(15, 'test1', '$2y$10$6Ajt/apLzXuZfkGy8d92DeOEkBghof.N9j9yvz/sJ4ozpU5YdPyAm', 1.00, '2024-05-29 06:52:53', 0),
(16, 'test2', '$2y$10$.pyFmvjDfz2lS1zB7GbB0eDI9y.tp16yHtIhKLuFlCvZwFE19Esx2', 1.00, '2024-05-29 00:56:40', 0),
(17, 'test3', '$2y$10$PbpFTNZK9gPQOvctEoaodODF3s2bXMhK/BXn34WPGXDhe044nTeQ.', 226.00, '2024-05-30 04:16:32', 0),
(18, 'newadmin', '$2y$10$fWuSA19FDmcqCik744BXGu/FlP1QJvLZU8fEbLAlrFdMRsutw48ca', 0.00, NULL, 1),
(19, 'admin1', '$2y$10$KsT.0THTo5hcrLX7x1QFnehwalvLKiuVHGqMrhuX9UgHED7s4Eao2', 0.00, NULL, 1),
(20, '4321', '$2y$10$1C307fBqsPG.bA.UDl/YR.I0wrsOvglATxDPBtbTT4mMjI12UefZS', 3.00, '2024-05-29 02:25:16', 0);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `credit_history`
--
ALTER TABLE `credit_history`
  ADD PRIMARY KEY (`id`),
  ADD KEY `user_id` (`user_id`);

--
-- Indexes for table `food_items`
--
ALTER TABLE `food_items`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `orders`
--
ALTER TABLE `orders`
  ADD PRIMARY KEY (`id`),
  ADD KEY `user_id` (`user_id`),
  ADD KEY `food_item_id` (`food_item_id`);

--
-- Indexes for table `sessions`
--
ALTER TABLE `sessions`
  ADD PRIMARY KEY (`session_id`);

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
-- AUTO_INCREMENT for table `credit_history`
--
ALTER TABLE `credit_history`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT for table `food_items`
--
ALTER TABLE `food_items`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `orders`
--
ALTER TABLE `orders`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=21;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `credit_history`
--
ALTER TABLE `credit_history`
  ADD CONSTRAINT `credit_history_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`);

--
-- Constraints for table `orders`
--
ALTER TABLE `orders`
  ADD CONSTRAINT `orders_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`),
  ADD CONSTRAINT `orders_ibfk_2` FOREIGN KEY (`food_item_id`) REFERENCES `food_items` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
