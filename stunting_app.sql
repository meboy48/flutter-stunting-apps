-- phpMyAdmin SQL Dump
-- version 4.8.5
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Oct 14, 2019 at 07:40 AM
-- Server version: 10.1.38-MariaDB
-- PHP Version: 7.3.4

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `stunting_app`
--

-- --------------------------------------------------------

--
-- Table structure for table `anak`
--

CREATE TABLE `anak` (
  `id_ortu` varchar(225) NOT NULL,
  `id_anak` varchar(225) NOT NULL,
  `hubungan` varchar(225) NOT NULL,
  `nama` varchar(225) NOT NULL,
  `jenis_kelamin` varchar(225) NOT NULL,
  `tanggal_lahir` date NOT NULL,
  `riwayat_kelahiran` varchar(225) NOT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `anak`
--

INSERT INTO `anak` (`id_ortu`, `id_anak`, `hubungan`, `nama`, `jenis_kelamin`, `tanggal_lahir`, `riwayat_kelahiran`, `updated_at`, `created_at`) VALUES
('f9799f08-b6b5-48a2-9d8b-f8d51e6ace94', 'ea2ed8be-ac23-4db2-a3d3-231f214c3c37', 'Ibu', 'e', 'Perempuan', '2019-09-03', 'Premature', '2019-09-30 09:14:40', '2019-09-30 09:14:40'),
('635b2335-9aa9-4d83-9c80-e8ae4328b8bb', '5741270e-5e88-478a-bbad-fc6393945fee', 'Nenek', 'Joko', 'Perempuan', '2019-10-01', 'Berat badan lahir rendah (BBLR)', '2019-10-01 11:00:25', '2019-10-01 11:00:25'),
('7f544fd2-dbd5-47bf-8bb8-2fadf203c784', '69b95a16-b7eb-47c4-bd92-d584b994e796', 'Paman', 'Ahmad HHHH', 'Laki-laki', '2019-08-10', 'Premature', '2019-10-07 20:18:17', '2019-10-02 02:14:27'),
('531eda1c-d270-46ca-9caa-0a1e2d714bcb', '0c7ec503-cff7-4e3f-bd2b-fe48e8d3ee71', 'Bibi', 'Waluyo', 'Laki-laki', '2019-10-11', 'Berat badan lahir rendah (BBLR)', '2019-10-07 20:23:02', '2019-10-07 20:23:02');

-- --------------------------------------------------------

--
-- Table structure for table `dtanak`
--

CREATE TABLE `dtanak` (
  `id_anak` varchar(225) NOT NULL,
  `berat` float NOT NULL,
  `bblr` varchar(225) NOT NULL,
  `prematur` varchar(225) NOT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `dtanak`
--

INSERT INTO `dtanak` (`id_anak`, `berat`, `bblr`, `prematur`, `updated_at`, `created_at`) VALUES
('0c7ec503-cff7-4e3f-bd2b-fe48e8d3ee71', 10, 'Ya', 'Tidak', '2019-10-07 23:09:26', '2019-10-07 23:09:26'),
('0c7ec503-cff7-4e3f-bd2b-fe48e8d3ee71', 9, 'Ya', 'Tidak', '2019-10-07 23:11:28', '2019-10-07 23:11:28'),
('0c7ec503-cff7-4e3f-bd2b-fe48e8d3ee71', 2, 'Ya', 'Ya', '2019-10-07 23:15:16', '2019-10-07 23:15:16'),
('0c7ec503-cff7-4e3f-bd2b-fe48e8d3ee71', 90, 'Tidak', 'Tidak', '2019-10-07 23:16:47', '2019-10-07 23:16:47'),
('69b95a16-b7eb-47c4-bd92-d584b994e796', 11, 'Ya', 'Tidak', '2019-10-08 08:37:12', '2019-10-08 08:37:12');

-- --------------------------------------------------------

--
-- Table structure for table `migrations`
--

CREATE TABLE `migrations` (
  `id` int(10) UNSIGNED NOT NULL,
  `migration` varchar(2000) COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `migrations`
--

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(1, '2019_10_01_103335_add_api_token_field_pengguna', 1);

-- --------------------------------------------------------

--
-- Table structure for table `pengguna`
--

CREATE TABLE `pengguna` (
  `id` int(255) NOT NULL,
  `id_user` varchar(767) NOT NULL,
  `nama` varchar(225) NOT NULL,
  `pekerjaan` varchar(225) NOT NULL,
  `domisili` varchar(225) NOT NULL,
  `username` varchar(225) NOT NULL,
  `password` varchar(225) NOT NULL,
  `api_token` char(60) DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `pengguna`
--

INSERT INTO `pengguna` (`id`, `id_user`, `nama`, `pekerjaan`, `domisili`, `username`, `password`, `api_token`, `updated_at`, `created_at`) VALUES
(1, '7f544fd2-dbd5-47bf-8bb8-2fadf203c784', 'Muhammad Nabil', 'Pelajar', 'Sleman', 'meboy', 'meboymeboy', NULL, '2019-10-02 02:13:59', '2019-10-02 02:13:59'),
(4, 'cac5934b-4ae6-4dec-be88-77185d47fe5d', 'Ghanny', 'Pelajar', 'Solo', 'ghannye', 'gh1234', NULL, '2019-10-02 02:57:08', '2019-10-02 02:57:08'),
(10, '938f52cc-bd0d-4c8a-acfa-3567ebc89210', 'geg', 'g', 'e', 'meboy123', 'nenene', NULL, '2019-10-02 03:19:58', '2019-10-02 03:19:58'),
(11, '86cb56a5-d46a-4d37-854c-205347dd38d6', 'meboy', 'jj', 'aa', 'meboy1234', 'rerere', NULL, '2019-10-02 03:22:19', '2019-10-02 03:22:19'),
(12, '531eda1c-d270-46ca-9caa-0a1e2d714bcb', 'Juminem', 'Petani', 'Desa', 'jmnem', 'jmnem123', NULL, '2019-10-07 20:22:11', '2019-10-07 20:22:11');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `pengguna`
--
ALTER TABLE `pengguna`
  ADD UNIQUE KEY `id` (`id`),
  ADD UNIQUE KEY `id_user` (`id_user`),
  ADD UNIQUE KEY `username` (`username`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `pengguna`
--
ALTER TABLE `pengguna`
  MODIFY `id` int(255) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
