-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Oct 16, 2023 at 03:37 AM
-- Server version: 10.4.27-MariaDB
-- PHP Version: 8.2.0

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `cafe-kasir`
--

-- --------------------------------------------------------

--
-- Table structure for table `detail_transaksis`
--

CREATE TABLE `detail_transaksis` (
  `id` int(11) NOT NULL,
  `id_transaksi` int(11) NOT NULL,
  `id_menu` int(11) NOT NULL,
  `harga` int(11) DEFAULT NULL,
  `createdAt` datetime NOT NULL,
  `updatedAt` datetime NOT NULL,
  `qty` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `detail_transaksis`
--

INSERT INTO `detail_transaksis` (`id`, `id_transaksi`, `id_menu`, `harga`, `createdAt`, `updatedAt`, `qty`) VALUES
(63, 85, 19, 45000, '2023-10-11 03:39:44', '2023-10-11 03:39:44', NULL),
(64, 86, 16, 80000, '2023-10-11 03:41:45', '2023-10-11 03:41:45', NULL),
(65, 87, 19, 45000, '2023-10-11 03:44:03', '2023-10-11 03:44:03', NULL),
(66, 88, 17, 55000, '2023-10-11 03:54:07', '2023-10-11 03:54:07', 7),
(67, 89, 16, 30000, '2023-10-11 03:58:36', '2023-10-11 03:58:36', NULL),
(68, 90, 16, 30000, '2023-10-11 04:02:31', '2023-10-11 04:02:31', 3),
(69, 91, 19, 30000, '2023-10-11 04:30:53', '2023-10-11 04:30:53', 3),
(70, 92, 19, 45000, '2023-10-11 04:42:34', '2023-10-11 04:42:34', 3),
(71, 93, 19, 45000, '2023-10-11 04:42:59', '2023-10-11 04:42:59', 3),
(72, 94, 16, 50000, '2023-10-11 04:44:41', '2023-10-11 04:44:41', 5);

-- --------------------------------------------------------

--
-- Table structure for table `mejas`
--

CREATE TABLE `mejas` (
  `id` int(11) NOT NULL,
  `nomor_meja` varchar(255) DEFAULT NULL,
  `status` enum('tersedia','tidak_tersedia') NOT NULL,
  `createdAt` datetime NOT NULL,
  `updatedAt` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `mejas`
--

INSERT INTO `mejas` (`id`, `nomor_meja`, `status`, `createdAt`, `updatedAt`) VALUES
(1, '1', 'tersedia', '2023-05-16 05:54:28', '2023-10-05 04:25:31'),
(3, '2', 'tersedia', '2023-05-16 06:34:09', '2023-10-05 04:25:32'),
(4, '3', 'tidak_tersedia', '2023-05-16 06:35:15', '2023-05-24 01:49:06'),
(5, '4', 'tersedia', '2023-05-16 06:36:06', '2023-10-05 04:25:35'),
(7, '5', 'tersedia', '2023-05-22 13:09:55', '2023-10-05 04:25:34'),
(9, '9', 'tersedia', '2023-05-23 23:59:46', '2023-10-11 03:44:05'),
(12, '10', 'tidak_tersedia', '2023-05-24 04:10:48', '2023-05-24 04:48:31'),
(13, '6', 'tersedia', '2023-05-24 05:05:41', '2023-10-11 04:44:51'),
(14, '7', 'tersedia', '2023-05-24 05:05:45', '2023-10-11 04:43:18');

-- --------------------------------------------------------

--
-- Table structure for table `menus`
--

CREATE TABLE `menus` (
  `id` int(11) NOT NULL,
  `nama_menu` varchar(255) DEFAULT NULL,
  `jenis` enum('makanan','minuman') DEFAULT NULL,
  `deskripsi` varchar(255) DEFAULT NULL,
  `gambar` varchar(255) DEFAULT NULL,
  `harga` int(11) DEFAULT NULL,
  `createdAt` datetime NOT NULL,
  `updatedAt` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `menus`
--

INSERT INTO `menus` (`id`, `nama_menu`, `jenis`, `deskripsi`, `gambar`, `harga`, `createdAt`, `updatedAt`) VALUES
(16, 'bakso', 'makanan', 'makanan', 'foto-1696988229571.jpg', 10000, '2023-10-11 01:37:09', '2023-10-11 01:37:09'),
(17, 'jus', 'minuman', 'minuman', 'foto-1696988399743.jpg', 5000, '2023-10-11 01:39:35', '2023-10-11 01:39:59'),
(19, 'nasi goreng', 'makanan', 'rasa nasi goreng', 'foto-1696995537911.jpg', 15000, '2023-10-11 03:38:57', '2023-10-11 03:38:57'),
(20, 'soto', 'makanan', 'soto', 'foto-1697120560298.jpeg', 11000, '2023-10-12 14:22:08', '2023-10-12 14:22:40');

-- --------------------------------------------------------

--
-- Table structure for table `sequelizemeta`
--

CREATE TABLE `sequelizemeta` (
  `name` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `sequelizemeta`
--

INSERT INTO `sequelizemeta` (`name`) VALUES
('20230116135446-create-user.js'),
('20230116141307-create-menu.js'),
('20230116141550-create-meja.js'),
('20230116141627-create-transaksi.js'),
('20230116141745-create-detail-transaksi.js');

-- --------------------------------------------------------

--
-- Table structure for table `transaksis`
--

CREATE TABLE `transaksis` (
  `id` int(11) NOT NULL,
  `tgl_transaksi` datetime DEFAULT NULL,
  `id_user` int(11) NOT NULL,
  `id_meja` int(11) NOT NULL,
  `nama_pelanggan` varchar(255) DEFAULT NULL,
  `alamat` varchar(100) NOT NULL,
  `total` int(11) NOT NULL,
  `status` enum('belum_bayar','lunas') DEFAULT NULL,
  `createdAt` datetime NOT NULL,
  `updatedAt` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `transaksis`
--

INSERT INTO `transaksis` (`id`, `tgl_transaksi`, `id_user`, `id_meja`, `nama_pelanggan`, `alamat`, `total`, `status`, `createdAt`, `updatedAt`) VALUES
(81, '2023-10-05 05:31:08', 22, 14, 'pandu', 'malang', 35000, 'lunas', '2023-10-05 05:31:08', '2023-10-05 05:31:15'),
(82, '2023-10-05 08:44:35', 22, 13, 'edwn', 'malangh', 180000, 'lunas', '2023-10-05 08:44:35', '2023-10-10 14:49:03'),
(83, '2023-10-10 22:41:59', 22, 14, 'irsyad', 'mlg', 60000, 'lunas', '2023-10-10 22:41:59', '2023-10-10 22:42:09'),
(84, '2023-10-11 01:32:06', 22, 14, 'malanh', 'sa', 30000, 'lunas', '2023-10-11 01:32:06', '2023-10-11 01:32:21'),
(85, '2023-10-11 03:39:44', 22, 14, 'funy', 'surabaya', 45000, 'lunas', '2023-10-11 03:39:44', '2023-10-11 03:40:28'),
(86, '2023-10-11 03:41:45', 22, 13, 'malang', 'sas', 80000, 'lunas', '2023-10-11 03:41:45', '2023-10-11 03:41:47'),
(87, '2023-10-11 03:44:03', 22, 9, 'irsyad04', 'malang', 45000, 'lunas', '2023-10-11 03:44:03', '2023-10-11 03:44:05'),
(88, '2023-10-11 03:54:07', 22, 14, 'malang', 'irsyad', 55000, 'lunas', '2023-10-11 03:54:07', '2023-10-11 03:54:09'),
(89, '2023-10-11 03:58:36', 22, 13, 'irsyad', 'malang', 30000, 'lunas', '2023-10-11 03:58:36', '2023-10-11 03:58:38'),
(90, '2023-10-11 04:02:31', 22, 13, 'irsyad', 'malang', 30000, 'lunas', '2023-10-11 04:02:31', '2023-10-11 04:02:32'),
(91, '2023-10-11 04:30:53', 22, 13, 'irsyad', 'malang', 30000, 'lunas', '2023-10-11 04:30:53', '2023-10-11 04:31:04'),
(92, '2023-10-11 04:42:34', 22, 14, 'irsyad', 'malang', 45000, 'lunas', '2023-10-11 04:42:34', '2023-10-11 04:42:36'),
(93, '2023-10-11 04:42:59', 22, 14, 'mlh', 'mlg', 45000, 'lunas', '2023-10-11 04:42:59', '2023-10-11 04:43:18'),
(94, '2023-10-11 04:44:41', 22, 13, 'irsyad ', 'surabaya', 50000, 'lunas', '2023-10-11 04:44:41', '2023-10-11 04:44:51');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` int(11) NOT NULL,
  `nama_user` varchar(255) DEFAULT NULL,
  `role` enum('admin','kasir','manajer') DEFAULT NULL,
  `username` varchar(255) DEFAULT NULL,
  `password` varchar(255) DEFAULT NULL,
  `createdAt` datetime NOT NULL,
  `updatedAt` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `nama_user`, `role`, `username`, `password`, `createdAt`, `updatedAt`) VALUES
(11, 'gopal', 'kasir', 'gopal', '827ccb0eea8a706c4c34a16891f84e7b', '2023-05-19 07:07:38', '2023-05-22 16:11:22'),
(18, 'lintang', 'kasir', 'linta', '827ccb0eea8a706c4c34a16891f84e7b', '2023-05-24 03:35:31', '2023-10-11 06:02:29'),
(21, 'biru', 'admin', 'irsyad', '982c635385fdb709f53af0119b621ea1', '2023-10-04 02:24:20', '2023-10-04 02:24:20'),
(22, 'soyi', 'kasir', 'soyi', '982c635385fdb709f53af0119b621ea1', '2023-10-04 02:29:32', '2023-10-04 02:29:32'),
(23, 'soyi', 'admin', 'ok', '982c635385fdb709f53af0119b621ea1', '2023-10-04 21:46:20', '2023-10-04 21:46:20'),
(24, 'maor', 'manajer', 'mora', '315c0942284228d83fcbe79afe9ad914', '2023-10-04 21:48:04', '2023-10-15 12:12:35'),
(26, 'naufal', 'kasir', 'naufal', '827ccb0eea8a706c4c34a16891f84e7b', '2023-10-05 05:29:35', '2023-10-05 05:29:55'),
(28, 'lintang', 'kasir', 'lintang', '982c635385fdb709f53af0119b621ea1', '2023-10-11 04:48:39', '2023-10-11 08:32:40');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `detail_transaksis`
--
ALTER TABLE `detail_transaksis`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id_transaksi` (`id_transaksi`),
  ADD KEY `id_menu` (`id_menu`);

--
-- Indexes for table `mejas`
--
ALTER TABLE `mejas`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `menus`
--
ALTER TABLE `menus`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `sequelizemeta`
--
ALTER TABLE `sequelizemeta`
  ADD PRIMARY KEY (`name`),
  ADD UNIQUE KEY `name` (`name`);

--
-- Indexes for table `transaksis`
--
ALTER TABLE `transaksis`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id_meja` (`id_meja`),
  ADD KEY `id_user` (`id_user`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `detail_transaksis`
--
ALTER TABLE `detail_transaksis`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=73;

--
-- AUTO_INCREMENT for table `mejas`
--
ALTER TABLE `mejas`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

--
-- AUTO_INCREMENT for table `menus`
--
ALTER TABLE `menus`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=21;

--
-- AUTO_INCREMENT for table `transaksis`
--
ALTER TABLE `transaksis`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=95;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=29;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `detail_transaksis`
--
ALTER TABLE `detail_transaksis`
  ADD CONSTRAINT `detail_transaksis_ibfk_1` FOREIGN KEY (`id_transaksi`) REFERENCES `transaksis` (`id`);

--
-- Constraints for table `transaksis`
--
ALTER TABLE `transaksis`
  ADD CONSTRAINT `transaksis_ibfk_1` FOREIGN KEY (`id_user`) REFERENCES `users` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
