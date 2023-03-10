-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Mar 10, 2023 at 11:21 AM
-- Server version: 10.4.24-MariaDB
-- PHP Version: 8.1.6

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `belajar-laravel`
--

-- --------------------------------------------------------

--
-- Table structure for table `categories`
--

CREATE TABLE `categories` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `slug` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `image` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `categories`
--

INSERT INTO `categories` (`id`, `name`, `slug`, `created_at`, `updated_at`, `image`) VALUES
(1, 'Web Programming', 'web-programming', '2023-03-02 19:42:58', '2023-03-02 19:42:58', NULL),
(2, 'Machine Learning', 'machine-learning', '2023-03-02 19:42:58', '2023-03-02 19:42:58', NULL),
(3, 'Personal', 'personal', '2023-03-02 19:42:58', '2023-03-02 19:42:58', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `failed_jobs`
--

CREATE TABLE `failed_jobs` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `uuid` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `connection` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `queue` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `payload` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `exception` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `kategori_lombas`
--

CREATE TABLE `kategori_lombas` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `nama_lomba` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `slug` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `jumlah_tim` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `kategori_lombas`
--

INSERT INTO `kategori_lombas` (`id`, `nama_lomba`, `slug`, `jumlah_tim`, `created_at`, `updated_at`) VALUES
(1, 'PUBG Mobile', 'pubgm', 25, '2023-03-03 00:45:28', '2023-03-03 00:45:28'),
(2, 'Mobile Legends', 'mlbb', 32, '2023-03-03 00:45:28', '2023-03-03 00:45:28'),
(3, 'Valorant', 'valo', 16, '2023-03-03 00:45:28', '2023-03-03 00:45:28'),
(4, 'Futsal', 'futsal', 16, '2023-03-03 00:45:28', '2023-03-03 00:45:28'),
(5, 'Band', 'band', 16, '2023-03-03 00:45:28', '2023-03-03 00:45:28');

-- --------------------------------------------------------

--
-- Table structure for table `migrations`
--

CREATE TABLE `migrations` (
  `id` int(10) UNSIGNED NOT NULL,
  `migration` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `migrations`
--

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(1, '2014_10_12_000000_create_users_table', 1),
(2, '2014_10_12_100000_create_password_resets_table', 1),
(3, '2019_08_19_000000_create_failed_jobs_table', 1),
(4, '2019_12_14_000001_create_personal_access_tokens_table', 1),
(5, '2023_02_05_125609_create_posts_table', 1),
(6, '2023_02_06_054837_create_categories_table', 1),
(7, '2023_02_19_043724_add_image_to_categories', 1),
(8, '2023_02_19_060804_add_is_admin_to_users', 1),
(9, '2023_02_27_132239_create_participants_table', 1),
(10, '2023_02_27_144058_add_bukti_bayar_to_participants_table', 1),
(11, '2023_03_02_145746_create_kategori_lombas_table', 1),
(12, '2023_03_02_151208_create_teams_table', 1),
(13, '2023_03_03_031224_drop_and_add_column_to_participants_table', 2),
(14, '2023_03_03_031404_drop_and_add_to_participants_table', 3),
(15, '2023_03_03_041455_change_column_jumlahtim_in_kategori_lombas_table', 4),
(16, '2023_03_03_071125_add_columns_to_teams_table', 4),
(18, '2023_03_03_072231_add_columns_to_participants_table', 5),
(22, '2023_03_03_140351_add_slug_to_kategori_lombas_table', 6),
(23, '2023_03_07_011515_change_column_status_in_participants', 6),
(25, '2023_03_07_012659_add_status_column_to_participants_table', 7),
(27, '2023_03_08_013212_change_verifikasi_status_column_in_teams_table', 8);

-- --------------------------------------------------------

--
-- Table structure for table `participants`
--

CREATE TABLE `participants` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `participant_name` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `status_partisipan` enum('ketua','anggota','cadangan') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'anggota',
  `team_id` bigint(20) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `participants`
--

INSERT INTO `participants` (`id`, `participant_name`, `status_partisipan`, `team_id`, `created_at`, `updated_at`) VALUES
(1, 'Michelle Purnawati M.M.', 'anggota', 24, '2023-03-06 19:41:26', '2023-03-06 19:41:26'),
(2, 'Maya Purwanti', 'anggota', 24, '2023-03-06 19:41:26', '2023-03-06 19:41:26'),
(3, 'Jasmani Nugroho', 'anggota', 24, '2023-03-06 19:41:26', '2023-03-06 19:41:26'),
(4, 'Rizki Warji Prasetyo', 'anggota', 24, '2023-03-06 19:41:26', '2023-03-06 19:41:26'),
(5, 'Olivia Purnawati', 'anggota', 24, '2023-03-06 19:41:26', '2023-03-06 19:41:26'),
(6, 'Jessica Puspita', 'anggota', 24, '2023-03-06 19:41:26', '2023-03-06 19:41:26'),
(7, 'Harsana Prasetya', 'anggota', 25, '2023-03-06 19:41:33', '2023-03-06 19:41:33'),
(8, 'Adikara Natsir', 'anggota', 25, '2023-03-06 19:41:33', '2023-03-06 19:41:33'),
(9, 'Maman Manullang', 'anggota', 25, '2023-03-06 19:41:33', '2023-03-06 19:41:33'),
(10, 'Kayla Hassanah M.Pd', 'anggota', 25, '2023-03-06 19:41:33', '2023-03-06 19:41:33'),
(11, 'Nabila Namaga', 'anggota', 25, '2023-03-06 19:41:33', '2023-03-06 19:41:33'),
(12, 'Mahesa Pratama', 'anggota', 25, '2023-03-06 19:41:33', '2023-03-06 19:41:33'),
(13, 'Zaenab Olivia Wulandari', 'anggota', 26, '2023-03-06 19:41:44', '2023-03-06 19:41:44'),
(14, 'Zaenab Hartati', 'anggota', 26, '2023-03-06 19:41:44', '2023-03-06 19:41:44'),
(15, 'Julia Usada S.Sos', 'anggota', 26, '2023-03-06 19:41:44', '2023-03-06 19:41:44'),
(16, 'Silvia Laksita', 'anggota', 26, '2023-03-06 19:41:44', '2023-03-06 19:41:44'),
(17, 'Kayla Fitria Pratiwi', 'anggota', 26, '2023-03-06 19:41:44', '2023-03-06 19:41:44'),
(18, 'Jail Nainggolan', 'anggota', 26, '2023-03-06 19:41:44', '2023-03-06 19:41:44'),
(19, 'Raditya Cemani Waskita', 'anggota', 27, '2023-03-06 19:41:50', '2023-03-06 19:41:50'),
(20, 'Hamima Laksita', 'anggota', 27, '2023-03-06 19:41:50', '2023-03-06 19:41:50'),
(21, 'Kartika Riyanti', 'anggota', 27, '2023-03-06 19:41:50', '2023-03-06 19:41:50'),
(22, 'Nugraha Okta Sinaga', 'anggota', 27, '2023-03-06 19:41:50', '2023-03-06 19:41:50'),
(23, 'Laras Padmasari', 'anggota', 27, '2023-03-06 19:41:50', '2023-03-06 19:41:50'),
(24, 'Ajiono Marbun', 'anggota', 27, '2023-03-06 19:41:50', '2023-03-06 19:41:50'),
(25, 'Halima Wijayanti', 'anggota', 28, '2023-03-06 19:41:55', '2023-03-06 19:41:55'),
(26, 'Elvin Niyaga Setiawan M.M.', 'anggota', 28, '2023-03-06 19:41:55', '2023-03-06 19:41:55'),
(27, 'Cornelia Belinda Aryani S.IP', 'anggota', 28, '2023-03-06 19:41:55', '2023-03-06 19:41:55'),
(28, 'Irsad Sihotang S.Farm', 'anggota', 28, '2023-03-06 19:41:55', '2023-03-06 19:41:55'),
(29, 'Hesti Wahyuni M.Kom.', 'anggota', 28, '2023-03-06 19:41:55', '2023-03-06 19:41:55'),
(30, 'Karya Hutagalung M.Ak', 'anggota', 28, '2023-03-06 19:41:55', '2023-03-06 19:41:55'),
(31, 'Yulia Najwa Haryanti S.E.', 'anggota', 29, '2023-03-06 19:42:00', '2023-03-06 19:42:00'),
(32, 'Latif Jailani', 'anggota', 29, '2023-03-06 19:42:00', '2023-03-06 19:42:00'),
(33, 'Shakila Purwanti S.Kom', 'anggota', 29, '2023-03-06 19:42:00', '2023-03-06 19:42:00'),
(34, 'Bakiman Pradipta', 'anggota', 29, '2023-03-06 19:42:00', '2023-03-06 19:42:00'),
(35, 'Indah Agustina', 'anggota', 29, '2023-03-06 19:42:00', '2023-03-06 19:42:00'),
(36, 'Cakrabuana Napitupulu', 'anggota', 29, '2023-03-06 19:42:00', '2023-03-06 19:42:00'),
(37, 'Umi Uli Puspita', 'anggota', 32, '2023-03-06 19:42:54', '2023-03-06 19:42:54'),
(38, 'Vera Bella Nasyiah S.E.I', 'anggota', 32, '2023-03-06 19:42:54', '2023-03-06 19:42:54'),
(39, 'Sarah Dalima Andriani S.E.', 'anggota', 32, '2023-03-06 19:42:54', '2023-03-06 19:42:54'),
(40, 'Jamalia Kamaria Pratiwi', 'anggota', 32, '2023-03-06 19:42:54', '2023-03-06 19:42:54'),
(41, 'Nilam Mayasari S.Sos', 'anggota', 32, '2023-03-06 19:42:54', '2023-03-06 19:42:54'),
(42, 'Rini Devi Lailasari', 'anggota', 32, '2023-03-06 19:42:54', '2023-03-06 19:42:54'),
(43, 'Maya Andriani S.Psi', 'anggota', 33, '2023-03-06 19:42:59', '2023-03-06 19:42:59'),
(44, 'Luwar Maulana', 'anggota', 33, '2023-03-06 19:42:59', '2023-03-06 19:42:59'),
(45, 'Warji Sihombing', 'anggota', 33, '2023-03-06 19:42:59', '2023-03-06 19:42:59'),
(46, 'Gangsar Maryadi', 'anggota', 33, '2023-03-06 19:42:59', '2023-03-06 19:42:59'),
(47, 'Tania Hariyah', 'anggota', 33, '2023-03-06 19:42:59', '2023-03-06 19:42:59'),
(48, 'Queen Citra Prastuti S.Gz', 'anggota', 33, '2023-03-06 19:42:59', '2023-03-06 19:42:59'),
(55, 'Maria Ina Mulyani', 'anggota', 34, '2023-03-06 19:47:22', '2023-03-06 19:47:22'),
(56, 'Rina Usamah', 'anggota', 34, '2023-03-06 19:47:22', '2023-03-06 19:47:22'),
(57, 'Joko Radit Habibi', 'anggota', 34, '2023-03-06 19:47:22', '2023-03-06 19:47:22'),
(58, 'Ian Gunarto', 'anggota', 34, '2023-03-06 19:47:22', '2023-03-06 19:47:22'),
(59, 'Salwa Fujiati', 'anggota', 34, '2023-03-06 19:47:22', '2023-03-06 19:47:22'),
(60, 'Zulfa Hani Novitasari', 'anggota', 34, '2023-03-06 19:47:22', '2023-03-06 19:47:22'),
(61, 'Silvia Laksita', 'anggota', 35, '2023-03-06 19:47:27', '2023-03-06 19:47:27'),
(62, 'Viktor Kurniawan', 'anggota', 35, '2023-03-06 19:47:27', '2023-03-06 19:47:27'),
(63, 'Samiah Mala Winarsih', 'anggota', 35, '2023-03-06 19:47:27', '2023-03-06 19:47:27'),
(64, 'Lembah Mandala', 'anggota', 35, '2023-03-06 19:47:27', '2023-03-06 19:47:27'),
(65, 'Keisha Intan Purnawati S.Pt', 'anggota', 35, '2023-03-06 19:47:27', '2023-03-06 19:47:27'),
(66, 'Marsito Budiyanto M.M.', 'anggota', 35, '2023-03-06 19:47:27', '2023-03-06 19:47:27'),
(67, 'Sadina Endah Yulianti', 'anggota', 36, '2023-03-06 19:48:25', '2023-03-06 19:48:25'),
(68, 'Ilsa Yani Mayasari', 'anggota', 36, '2023-03-06 19:48:25', '2023-03-06 19:48:25'),
(69, 'Ratih Nasyidah', 'anggota', 36, '2023-03-06 19:48:25', '2023-03-06 19:48:25'),
(70, 'Gandewa Gunarto', 'anggota', 36, '2023-03-06 19:48:25', '2023-03-06 19:48:25'),
(71, 'Okto Yusuf Budiman S.Psi', 'anggota', 36, '2023-03-06 19:48:25', '2023-03-06 19:48:25'),
(72, 'Silvia Siti Hastuti S.IP', 'anggota', 36, '2023-03-06 19:48:25', '2023-03-06 19:48:25'),
(73, 'Luluh Prakasa', 'anggota', 37, '2023-03-06 19:48:32', '2023-03-06 19:48:32'),
(74, 'Nilam Nuraini', 'anggota', 37, '2023-03-06 19:48:32', '2023-03-06 19:48:32'),
(75, 'Zulaikha Suci Hassanah S.H.', 'anggota', 37, '2023-03-06 19:48:32', '2023-03-06 19:48:32'),
(76, 'Dagel Asirwanda Utama S.Pd', 'anggota', 37, '2023-03-06 19:48:32', '2023-03-06 19:48:32'),
(77, 'Gasti Cornelia Mayasari S.Psi', 'anggota', 37, '2023-03-06 19:48:32', '2023-03-06 19:48:32'),
(78, 'Warta Pangestu', 'anggota', 37, '2023-03-06 19:48:32', '2023-03-06 19:48:32'),
(79, 'Galuh Endra Januar M.M.', 'anggota', 38, '2023-03-06 19:48:41', '2023-03-06 19:48:41'),
(80, 'Darman Januar', 'anggota', 38, '2023-03-06 19:48:41', '2023-03-06 19:48:41'),
(81, 'Ciaobella Hastuti', 'anggota', 38, '2023-03-06 19:48:41', '2023-03-06 19:48:41'),
(82, 'Dalima Aryani', 'anggota', 38, '2023-03-06 19:48:41', '2023-03-06 19:48:41'),
(83, 'Dinda Gina Rahmawati M.Ak', 'anggota', 38, '2023-03-06 19:48:41', '2023-03-06 19:48:41'),
(84, 'Garan Olga Nainggolan S.T.', 'anggota', 38, '2023-03-06 19:48:41', '2023-03-06 19:48:41'),
(85, 'Maida Prastuti', 'anggota', 39, '2023-03-06 19:48:53', '2023-03-06 19:48:53'),
(86, 'Cawisono Haryanto', 'anggota', 39, '2023-03-06 19:48:53', '2023-03-06 19:48:53'),
(87, 'Anastasia Yuliarti M.M.', 'anggota', 39, '2023-03-06 19:48:53', '2023-03-06 19:48:53'),
(88, 'Panca Marpaung', 'anggota', 39, '2023-03-06 19:48:53', '2023-03-06 19:48:53'),
(89, 'Ayu Zulaika', 'anggota', 39, '2023-03-06 19:48:53', '2023-03-06 19:48:53'),
(90, 'Balidin Napitupulu S.I.Kom', 'anggota', 39, '2023-03-06 19:48:53', '2023-03-06 19:48:53'),
(91, 'Chelsea Malika Riyanti', 'anggota', 40, '2023-03-06 20:04:00', '2023-03-06 20:04:00'),
(92, 'Syahrini Fujiati', 'anggota', 40, '2023-03-06 20:04:00', '2023-03-06 20:04:00'),
(93, 'Latika Safitri', 'anggota', 40, '2023-03-06 20:04:00', '2023-03-06 20:04:00'),
(94, 'Cindy Puji Hartati', 'anggota', 40, '2023-03-06 20:04:00', '2023-03-06 20:04:00'),
(95, 'Luwar Sitorus', 'anggota', 40, '2023-03-06 20:04:00', '2023-03-06 20:04:00'),
(96, 'Prabowo Napitupulu M.Ak', 'anggota', 40, '2023-03-06 20:04:00', '2023-03-06 20:04:00'),
(97, 'Kasusra Rajata', 'anggota', 41, '2023-03-06 20:04:46', '2023-03-06 20:04:46'),
(98, 'Paulin Purwanti', 'anggota', 41, '2023-03-06 20:04:46', '2023-03-06 20:04:46'),
(99, 'Umay Setiawan S.Pd', 'anggota', 41, '2023-03-06 20:04:46', '2023-03-06 20:04:46'),
(100, 'Sarah Suryatmi', 'anggota', 41, '2023-03-06 20:04:46', '2023-03-06 20:04:46'),
(101, 'Faizah Anggraini', 'anggota', 41, '2023-03-06 20:04:46', '2023-03-06 20:04:46'),
(102, 'Eva Laksita S.Psi', 'anggota', 41, '2023-03-06 20:04:46', '2023-03-06 20:04:46'),
(103, 'Tantri Zulfa Aryani S.Farm', 'anggota', 42, '2023-03-06 20:05:18', '2023-03-06 20:05:18'),
(104, 'Imam Wahyudin', 'anggota', 43, '2023-03-06 20:05:18', '2023-03-06 20:05:18'),
(105, 'Paulin Melani', 'anggota', 43, '2023-03-06 20:05:18', '2023-03-06 20:05:18'),
(106, 'Irwan Zulkarnain', 'anggota', 43, '2023-03-06 20:05:18', '2023-03-06 20:05:18'),
(107, 'Eli Prastuti', 'anggota', 43, '2023-03-06 20:05:18', '2023-03-06 20:05:18'),
(108, 'Citra Yuliana Andriani', 'anggota', 43, '2023-03-06 20:05:18', '2023-03-06 20:05:18'),
(109, 'Salsabila Kuswandari S.E.I', 'anggota', 46, '2023-03-06 20:05:32', '2023-03-06 20:05:32'),
(110, 'Anita Vanya Winarsih S.T.', 'anggota', 47, '2023-03-06 20:05:32', '2023-03-06 20:05:32'),
(111, 'Artawan Napitupulu', 'anggota', 45, '2023-03-06 20:05:32', '2023-03-06 20:05:32'),
(112, 'Titin Mila Mandasari', 'anggota', 47, '2023-03-06 20:05:32', '2023-03-06 20:05:32'),
(113, 'Tiara Intan Mandasari M.Pd', 'anggota', 46, '2023-03-06 20:05:32', '2023-03-06 20:05:32'),
(114, 'Bakiadi Sitompul S.H.', 'anggota', 47, '2023-03-06 20:05:32', '2023-03-06 20:05:32'),
(115, 'Nyoman Pranowo', 'anggota', 50, '2023-03-06 20:05:40', '2023-03-06 20:05:40'),
(116, 'Elisa Gina Andriani', 'anggota', 50, '2023-03-06 20:05:40', '2023-03-06 20:05:40'),
(117, 'Naradi Lamar Firgantoro', 'anggota', 50, '2023-03-06 20:05:40', '2023-03-06 20:05:40'),
(118, 'Prabawa Taufan Damanik M.Pd', 'anggota', 50, '2023-03-06 20:05:40', '2023-03-06 20:05:40'),
(119, 'Alika Wahyuni', 'anggota', 50, '2023-03-06 20:05:40', '2023-03-06 20:05:40'),
(120, 'Yunita Silvia Lailasari', 'anggota', 50, '2023-03-06 20:05:40', '2023-03-06 20:05:40'),
(121, 'Titin Eva Uyainah S.E.', 'anggota', 57, '2023-03-06 20:06:03', '2023-03-06 20:06:03'),
(122, 'Harsana Kala Mustofa', 'anggota', 56, '2023-03-06 20:06:03', '2023-03-06 20:06:03'),
(123, 'Kamaria Ida Uyainah', 'anggota', 55, '2023-03-06 20:06:03', '2023-03-06 20:06:03'),
(124, 'Ihsan Harjasa Dabukke S.Farm', 'anggota', 56, '2023-03-06 20:06:03', '2023-03-06 20:06:03'),
(125, 'Rahmi Maryati', 'anggota', 53, '2023-03-06 20:06:03', '2023-03-06 20:06:03'),
(126, 'Gara Cayadi Pangestu', 'anggota', 53, '2023-03-06 20:06:04', '2023-03-06 20:06:04'),
(127, 'Nasab Tirta Hutapea', 'anggota', 59, '2023-03-06 20:06:12', '2023-03-06 20:06:12'),
(128, 'Daliman Widodo', 'anggota', 59, '2023-03-06 20:06:12', '2023-03-06 20:06:12'),
(129, 'Bakda Winarno S.I.Kom', 'anggota', 59, '2023-03-06 20:06:12', '2023-03-06 20:06:12'),
(130, 'Diana Hariyah', 'anggota', 59, '2023-03-06 20:06:12', '2023-03-06 20:06:12'),
(131, 'Tira Ratih Handayani S.Pt', 'anggota', 59, '2023-03-06 20:06:12', '2023-03-06 20:06:12'),
(132, 'Lembah Indra Halim M.M.', 'anggota', 59, '2023-03-06 20:06:12', '2023-03-06 20:06:12'),
(133, 'Aris Nugroho', 'anggota', 63, '2023-03-06 20:06:39', '2023-03-06 20:06:39'),
(134, 'Oliva Suartini S.E.', 'anggota', 63, '2023-03-06 20:06:39', '2023-03-06 20:06:39'),
(135, 'Pangestu Firgantoro', 'anggota', 63, '2023-03-06 20:06:40', '2023-03-06 20:06:40'),
(136, 'Naradi Wahyudin', 'anggota', 63, '2023-03-06 20:06:40', '2023-03-06 20:06:40'),
(137, 'Drajat Sitorus', 'anggota', 63, '2023-03-06 20:06:40', '2023-03-06 20:06:40'),
(138, 'Raditya Lazuardi', 'anggota', 63, '2023-03-06 20:06:40', '2023-03-06 20:06:40');

-- --------------------------------------------------------

--
-- Table structure for table `password_resets`
--

CREATE TABLE `password_resets` (
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `personal_access_tokens`
--

CREATE TABLE `personal_access_tokens` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `tokenable_type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `tokenable_id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(64) COLLATE utf8mb4_unicode_ci NOT NULL,
  `abilities` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `last_used_at` timestamp NULL DEFAULT NULL,
  `expires_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `posts`
--

CREATE TABLE `posts` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `category_id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `title` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `slug` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `image` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `excerpt` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `body` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `published_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `posts`
--

INSERT INTO `posts` (`id`, `category_id`, `user_id`, `title`, `slug`, `image`, `excerpt`, `body`, `published_at`, `created_at`, `updated_at`) VALUES
(1, 1, 1, 'Ipsa sed blanditiis assumenda sit illo autem.', 'sed-tempora-id-consequuntur-quisquam-autem-voluptas-quo', NULL, 'Excepturi ut illo officia dolorem et. Doloremque est sit sequi vero neque et.', '<p>Eos explicabo error voluptatem asperiores ducimus nulla aut voluptatibus. Eum consectetur ea necessitatibus commodi quia. Iure sunt optio aliquid consequatur. Odit pariatur aliquid excepturi ex.</p><p>Pariatur fugit quidem voluptas minus officiis eos. Ex consequatur quisquam sunt molestias et. Eum cum et cum. Dolores nostrum rem est iure sed magni.</p><p>Ut occaecati ut quia laudantium non. Autem eos earum officiis nihil sit maiores. Itaque ipsam libero eum totam corrupti sapiente sit voluptatem.</p><p>Labore blanditiis rem dolor dolores. A excepturi itaque dignissimos nam eum. Atque modi ipsam rerum quas et repellat magni. Est odit ut atque rerum quam quibusdam.</p><p>Reprehenderit commodi quibusdam nisi laboriosam laborum fugiat. Quia voluptatem in consectetur. Aut deserunt deleniti est quasi et suscipit. Vel quo unde facilis corrupti fugiat quam dolorum. Non quia neque esse nulla.</p><p>Veritatis maiores culpa at libero blanditiis. Eveniet omnis asperiores impedit earum quo. Est necessitatibus iusto eos voluptatem nisi a.</p>', NULL, '2023-03-02 19:42:58', '2023-03-02 19:42:58'),
(2, 2, 2, 'Laudantium quas vitae et tempora eaque temporibus.', 'et-libero-quo-accusamus-odit-expedita-porro-et', NULL, 'Ea omnis sed totam qui non consequatur dolores. Sed nostrum sit inventore quis ut accusantium culpa. Non explicabo vel facilis suscipit eos nobis.', '<p>Deserunt impedit similique ut dolores autem. A harum neque doloremque. Suscipit reiciendis id aspernatur mollitia eveniet facere. Ex cupiditate debitis earum qui.</p><p>Aliquam accusantium qui in ut magni itaque. Veritatis omnis qui sit aut. Eos incidunt et dignissimos fuga id. Fuga commodi et sint exercitationem nisi eum velit corporis.</p><p>Accusantium ex consequatur veritatis et animi. Et blanditiis sit tempore dolor eius natus ut molestiae. Ex itaque repellat voluptatibus eveniet error qui in. Ex voluptas voluptatem qui reprehenderit rerum a voluptatem corrupti.</p><p>Et natus sunt animi recusandae est ab molestiae. Voluptatem itaque et quo accusantium. Et recusandae est qui voluptatum error ut ut velit.</p>', NULL, '2023-03-02 19:42:58', '2023-03-02 19:42:58'),
(3, 3, 3, 'Voluptatum unde est possimus nisi.', 'cupiditate-similique-veritatis-quidem-amet-sed-accusamus-iusto', NULL, 'Voluptatem sunt qui omnis.', '<p>Ad sed recusandae est earum id rerum hic. Officia doloribus modi aliquam veniam. Sit ipsa maxime qui fugiat harum.</p><p>Nam et sint suscipit. Illo eos incidunt ea laborum. Rem totam qui magnam ipsam vel ut.</p><p>Cumque temporibus hic laboriosam molestiae. Sunt quia autem provident fuga voluptatum eligendi voluptatum. Optio consequuntur veniam temporibus. Quam sit neque nam molestiae.</p><p>Doloribus dolores est alias reprehenderit molestiae. Fugit nulla maxime illum aut accusantium dolorum dolores. Exercitationem quo molestiae sit culpa. Nemo voluptatem eum excepturi.</p><p>Totam dolores consequatur ipsum cupiditate eius consequatur rerum. Rerum dolorem dolores voluptas sunt asperiores quisquam. Omnis culpa rem qui enim. Quaerat rerum accusantium asperiores dolorem.</p><p>Incidunt sint et voluptates quas eos natus. Veritatis est tempore nesciunt nemo eligendi. Et non consequatur molestiae quis.</p><p>Vel ut et odit distinctio nemo maxime. Et repudiandae repellat in optio dignissimos. Quam nam aut impedit nesciunt in.</p><p>Eaque sed nemo voluptates vitae. Fuga voluptas et ducimus id. Iusto cupiditate deleniti facilis nihil dolores libero fugiat.</p>', NULL, '2023-03-02 19:42:58', '2023-03-02 19:42:58'),
(4, 2, 3, 'Non eaque ipsam rerum qui.', 'sint-est-sit-dicta-nihil-expedita', NULL, 'Et eos animi porro iusto. Sequi numquam dolor animi ipsum aperiam non.', '<p>Qui labore aut aspernatur odit cumque officiis iste. Et quibusdam quaerat maiores et. Molestiae et sunt qui blanditiis alias et. Quia velit earum officiis molestiae.</p><p>Et voluptas laboriosam qui molestiae perferendis neque delectus. Provident iste laudantium aliquid molestias repudiandae rerum. Quam numquam laboriosam officia repudiandae. Quaerat quod repudiandae nemo debitis dolor.</p><p>Voluptatem ipsa ea accusantium. Sed est nisi nihil similique facere molestias. Voluptatem similique modi saepe cum ut sed adipisci.</p><p>Vel minima accusamus aut facere amet. Est vero blanditiis ullam aut officiis sapiente. Unde rem velit esse modi molestiae ut.</p><p>Et aut et laboriosam odit voluptatum ducimus. Quo omnis quod odit rerum itaque eaque distinctio impedit. Illo itaque aut quam ipsam. Consequatur doloremque quae expedita sunt tenetur occaecati minima.</p><p>Inventore minus voluptas voluptatum nulla cumque repellat voluptas qui. Sed adipisci perspiciatis officia facere aut voluptatibus a aperiam.</p><p>Omnis nobis consequatur distinctio et est est. Et cum nemo ipsam. Vero vero molestias fuga accusamus aut. Quos magnam nostrum velit id assumenda numquam.</p><p>Sint nobis vero tenetur qui. Sint autem enim vel atque. Libero aliquid aspernatur vel dolor maxime. Fuga ut incidunt sint quo possimus velit sint.</p>', NULL, '2023-03-02 19:42:58', '2023-03-02 19:42:58'),
(5, 1, 3, 'Laboriosam et repellat qui a eius.', 'et-optio-est-excepturi-laboriosam-atque-sed-consectetur-est', NULL, 'Iure illo quis nulla aut ipsum expedita delectus libero. Dolor consequatur error saepe placeat dicta omnis in autem.', '<p>Voluptatem numquam sit perspiciatis ex laborum qui eaque dolores. Nemo vero eveniet est asperiores quo. Consequuntur eius in dolorum ipsum accusamus sit. Nostrum dolores ut ut hic sint minima odio.</p><p>Soluta deserunt aspernatur quae excepturi dolores. Ut nobis labore repellendus id maiores vel voluptatibus accusantium.</p><p>Dignissimos reiciendis deserunt suscipit modi omnis dolorum similique. Sapiente quo aut perferendis qui ratione odio. Dolores ad est soluta et quo aut. Id facilis similique architecto amet reprehenderit iure.</p><p>Distinctio iusto quaerat magnam iure blanditiis dolorum ea. Dolorem perferendis illum aliquam maiores eos et. Aspernatur dolores earum delectus delectus soluta omnis quo. Architecto iste sit itaque at labore facere qui.</p><p>Id autem est occaecati atque. Doloribus placeat voluptas explicabo voluptas a accusamus ipsum ratione. Pariatur et aut explicabo velit.</p><p>Quia hic aut libero. Architecto alias est unde enim delectus delectus aliquid. Quis aliquid harum placeat. Saepe velit aut est. Vero molestias voluptatem expedita ut non qui vel.</p><p>Et officia aut culpa. Sit aut ea laborum quia non eligendi aperiam. Asperiores beatae porro voluptatem totam quidem quis aut. Eum earum eos qui et adipisci qui tenetur.</p><p>Consequatur exercitationem voluptatem culpa laudantium aut. Qui eos doloribus ea aut blanditiis qui. Eius ut nesciunt quibusdam blanditiis praesentium et pariatur. Libero voluptates eaque delectus est.</p>', NULL, '2023-03-02 19:42:58', '2023-03-02 19:42:58'),
(6, 2, 1, 'Rerum commodi officiis atque animi numquam ex.', 'sit-consequuntur-sed-voluptas-repellendus-qui-quaerat', NULL, 'Ullam reprehenderit animi tempora pariatur.', '<p>Ut voluptas accusamus aut eius similique et. Molestiae illum praesentium et repellat soluta aut.</p><p>Aspernatur quibusdam cumque itaque ea. Atque unde fugit neque sint neque fuga sequi soluta. Ut et aut possimus et excepturi et. Assumenda id neque ea odit sed accusamus nam.</p><p>Et sequi illum voluptatibus quibusdam dolor ratione fugiat. Modi quis voluptatem perferendis sed consectetur laborum at. Sit repellat pariatur vel.</p><p>Nisi temporibus aliquam quisquam illo dignissimos. Consequatur mollitia reprehenderit dolore quos. Rerum saepe unde est dolores beatae at corrupti. Est a voluptatem consectetur reiciendis ratione dolores.</p><p>Eius dolorum distinctio porro aut sint repudiandae asperiores. A reiciendis aut est est maiores. Commodi et molestiae dolores nihil.</p><p>In nulla iusto veniam dolorum non quis omnis. Quas aut rem deserunt porro ex. Quisquam in quaerat officiis nostrum voluptas voluptatem ut.</p>', NULL, '2023-03-02 19:42:58', '2023-03-02 19:42:58'),
(7, 1, 1, 'Deserunt quaerat vel saepe distinctio omnis non in.', 'quis-voluptas-dolores-perspiciatis-omnis-doloribus-velit', NULL, 'Fuga nisi et quam sit eum. Consequatur ab quia minus esse. Fuga itaque eveniet eveniet et voluptatibus magnam ratione.', '<p>Est cum odio sunt recusandae quis aut perferendis. Porro neque accusantium non eligendi cum nulla. Ad voluptas unde enim quisquam magnam ut et.</p><p>Rerum tenetur sint deserunt quisquam vel. Reprehenderit corrupti sequi a corrupti necessitatibus. Ipsa deleniti nobis eius doloribus cum. Accusantium odio adipisci et nihil sunt.</p><p>Error qui et dolorem reprehenderit. Totam cupiditate quos dolorem eius repudiandae temporibus. Ea est eligendi praesentium blanditiis optio mollitia quam. Aperiam consequatur mollitia quos cupiditate at ut.</p><p>Odio velit ut dolorem odit est est quibusdam eos. Nihil laudantium sequi quam iure voluptate pariatur. Consequatur quos qui nulla consequatur natus fugiat. Consequatur quibusdam incidunt quae. Consequuntur aspernatur cupiditate sed nihil.</p><p>Tenetur voluptate dolorem accusantium rerum. Ducimus quaerat consequatur soluta aperiam vitae deleniti et. Eum dolores ut quo vel ratione et.</p><p>Rem eligendi quidem sapiente veniam at quod et. Ad soluta exercitationem omnis. Et quasi dolores debitis modi accusamus soluta. Magni laborum sunt perspiciatis cum aut quidem. Quod neque cum porro cupiditate nesciunt.</p><p>Nam ducimus corporis pariatur. Ut adipisci provident vero omnis et quos. Velit ratione repudiandae sed quis.</p>', NULL, '2023-03-02 19:42:58', '2023-03-02 19:42:58'),
(8, 3, 1, 'Unde non pariatur qui illum molestiae deleniti.', 'quaerat-dolorem-explicabo-molestias-voluptas-ratione-molestiae-nemo-aut', NULL, 'Id impedit cum neque aut. Quos ullam qui porro provident ipsam quibusdam. Eius et totam voluptatum nam.', '<p>In ut velit quo rerum. Nam ratione sit vitae laborum. Non et dicta nostrum modi quo cum dolores. Minus beatae autem illum.</p><p>Deserunt voluptas libero et. Corrupti doloribus eius tempore iusto qui hic. Tempora quidem aspernatur aspernatur consectetur debitis aliquam. Sed ipsam voluptatem explicabo consequatur sapiente culpa.</p><p>Tenetur odit voluptatem et explicabo dolores qui. Ipsum debitis placeat exercitationem voluptatem eligendi non. Doloribus quos et repellendus qui eveniet. Ipsa illum ea recusandae consequatur aliquid. Rerum repellat et impedit rerum ut.</p><p>Laborum omnis quidem mollitia voluptatibus provident. Eos quis et quam. Asperiores asperiores quam qui voluptate sint deleniti est ipsa. Non consequuntur voluptatem corrupti nulla qui cupiditate porro.</p><p>Nisi tempore quis quibusdam et repellendus. Rerum doloribus sunt ut at. Modi impedit sapiente rerum sunt voluptas hic.</p><p>In accusantium sint pariatur quasi vel cumque. Sequi sit voluptate in qui. Qui aut qui tempore omnis sed autem ipsum eius. Quis ex quo id eius et.</p>', NULL, '2023-03-02 19:42:58', '2023-03-02 19:42:58'),
(9, 1, 3, 'Dignissimos officia inventore eius et unde.', 'a-recusandae-et-ratione-magni-minus-exercitationem', NULL, 'Sunt eos placeat harum voluptatem. Debitis qui distinctio sunt odio.', '<p>Unde et id quis in atque dolorem sit. Quos harum placeat omnis dolor consectetur quas rerum. Voluptatibus numquam voluptates consequatur repellat quis facere error rerum. Sunt omnis cumque ullam.</p><p>Dignissimos omnis earum vero in delectus harum dolores. Hic voluptatem sunt vero omnis aperiam quo. Commodi tempora quo totam ea.</p><p>Consectetur illo est unde ea qui quas omnis. Facilis ratione omnis velit aut recusandae autem. Illo consequatur voluptas non illum officiis adipisci. Sequi ut molestias sed deleniti illum et. Minus quia natus numquam sint.</p><p>Non voluptates doloremque laborum a sint in quia quisquam. Aut placeat est atque vel eveniet. Omnis enim excepturi quam sapiente. Sit ut accusantium sit nihil quibusdam sint. Sunt et sed hic nisi.</p><p>Ducimus eos voluptates assumenda est perferendis cumque alias. Quo id hic delectus soluta repudiandae fuga unde. Sint aliquid aut dicta quis.</p>', NULL, '2023-03-02 19:42:58', '2023-03-02 19:42:58'),
(10, 1, 3, 'Nemo sit quo quia dolorem consequatur vitae impedit.', 'asperiores-vero-a-ducimus-aut-nihil-autem-dolorem-vero', NULL, 'Quia voluptas occaecati ea reiciendis quod. Eos sit animi ut voluptatem ipsa voluptas omnis. Aspernatur neque tenetur est dolor eius harum.', '<p>Sunt fugiat velit reprehenderit aut modi explicabo. Quo nostrum nemo assumenda unde. Tempora dicta qui quod unde ipsum eos voluptas laudantium.</p><p>Neque est suscipit est facere porro molestias ipsam unde. Quis est voluptas nihil. Iusto autem laudantium delectus. Est velit autem omnis enim et. Doloremque est molestias quo adipisci.</p><p>Magnam unde quia qui quia vel fugit. Natus odit soluta quis. Est dignissimos adipisci perspiciatis. Minima ea autem officiis nemo voluptatem qui.</p>', NULL, '2023-03-02 19:42:58', '2023-03-02 19:42:58'),
(11, 2, 3, 'Animi esse quas et magni distinctio nostrum.', 'exercitationem-adipisci-perferendis-qui-aut-qui-dolores-eveniet', NULL, 'Dolorem repellat ab ab quaerat. Commodi consequuntur repellat minima dolore totam dignissimos voluptatem iusto. Laborum magnam eligendi qui.', '<p>Odio maxime qui inventore qui non quam. Totam rerum aliquam necessitatibus. Provident sed qui sunt.</p><p>Recusandae maiores dolore aut repudiandae et commodi omnis doloremque. Quis ut nostrum iure at rerum. Aut mollitia molestias in dignissimos.</p><p>Veritatis blanditiis vel voluptates. Facilis soluta dignissimos aut dolorem dicta neque nam. Qui ullam non saepe laborum perspiciatis. Ducimus consequatur et soluta.</p><p>Facere eaque porro eum ut. Doloremque aut et qui sed in. Qui nam voluptas sed ex quasi adipisci non.</p><p>Quo saepe ea qui. Incidunt sit eos eos iure est aut rem impedit. Ut commodi necessitatibus nobis.</p><p>Sunt sint corrupti dolores ut fuga nostrum ad necessitatibus. Tempora eos doloribus est delectus illum eligendi tempore. Eius sit hic ut dicta neque soluta.</p>', NULL, '2023-03-02 19:42:58', '2023-03-02 19:42:58'),
(12, 1, 1, 'Neque et minus atque dignissimos ut.', 'recusandae-ut-nemo-iusto-tempore-assumenda-praesentium-facere', NULL, 'Optio ab ab et est possimus distinctio. Esse vel alias fugit aut vero qui illo. Non odit est odit incidunt non.', '<p>Deleniti consectetur fuga sed est veritatis id nemo. Quia perferendis nemo ut mollitia esse enim facilis. Eveniet in voluptatem qui odio error reprehenderit.</p><p>Magni error voluptatem sit qui iste velit. Qui consequuntur rerum iusto quia tempora explicabo odit voluptas. Quis facere ducimus harum reiciendis consequatur accusantium et. Officiis porro sequi odit nobis.</p><p>Enim iure et commodi nesciunt harum voluptatem nihil. Nisi beatae alias ullam itaque ab quis. Earum enim architecto dolores in rerum assumenda distinctio animi. Optio nesciunt distinctio similique quisquam voluptatibus.</p><p>Minima eos at iure distinctio at sint. Cum aliquid quae expedita earum ut. Delectus necessitatibus ut non possimus. Error eveniet veniam deserunt. Voluptatem eaque id iusto voluptas et.</p><p>At enim nisi dicta perspiciatis. Eveniet quod veniam ab. Cum illum velit est est et ad tempora cum. Ipsa est harum corporis est ipsa.</p><p>Numquam ut molestiae autem aut commodi. Sint ut quisquam alias molestiae asperiores. Rem qui nesciunt vel et eum eum. Consequatur quaerat quae omnis rerum blanditiis animi.</p><p>Vitae occaecati et qui quidem mollitia. Cum aspernatur dolore est. Suscipit adipisci quas suscipit asperiores laudantium minima. Expedita nisi consequuntur voluptate facere aspernatur.</p>', NULL, '2023-03-02 19:42:58', '2023-03-02 19:42:58'),
(13, 1, 3, 'Quo qui iure velit architecto amet impedit nulla sit.', 'iste-nobis-ut-quo-quia-unde-corrupti', NULL, 'Doloremque dolores quos molestias ducimus nobis. Ullam magni aut aut et alias ut. Vero illo soluta commodi repellendus perspiciatis et et.', '<p>Aut qui dolorum voluptate magnam ipsa. Cumque officia natus sit sint. Est sint ipsum aut veniam. Et qui sequi perferendis nesciunt sint recusandae est.</p><p>Qui voluptatibus pariatur et cupiditate distinctio qui. Voluptatem velit recusandae facilis et nulla. Voluptatibus est eos aut et. Voluptatem esse provident est in facilis.</p><p>Impedit eius suscipit quod qui. Est nihil non itaque molestias similique aut reprehenderit distinctio. Ducimus at rerum laudantium suscipit ullam et fugiat. Maxime natus mollitia vero porro incidunt nemo.</p><p>Doloribus asperiores sed enim mollitia labore. Cumque omnis quos a. Quo voluptates nesciunt ullam aspernatur.</p>', NULL, '2023-03-02 19:42:58', '2023-03-02 19:42:58'),
(14, 2, 3, 'Omnis deserunt temporibus perspiciatis temporibus perspiciatis quia.', 'et-ut-modi-placeat-magnam-cumque', NULL, 'Corrupti perspiciatis alias corporis esse totam libero. Libero occaecati id veritatis cupiditate voluptatem sit molestiae. Beatae numquam qui cumque placeat iure eveniet.', '<p>Impedit ullam doloremque aut quidem commodi consequatur exercitationem. Enim aut et molestiae et fugit inventore.</p><p>Id commodi ipsa qui nihil iste. Et fuga nisi eos recusandae quis sit vero consequuntur. Omnis et reprehenderit itaque fuga perspiciatis quo.</p><p>Totam deleniti eum accusamus pariatur nihil. Commodi veritatis delectus dicta rerum aut aliquam quia recusandae. Exercitationem libero adipisci vitae et.</p><p>Alias cupiditate dolores in quidem non. Ipsa nam aliquid animi ut corrupti. Modi sint labore beatae corporis sed autem quibusdam. Voluptas dolor minus voluptas facilis.</p><p>Exercitationem consequatur velit ad. Ex dignissimos expedita iste molestiae rerum. Et debitis nihil accusamus sint beatae. Cum assumenda animi expedita voluptas.</p><p>Et aut rerum nihil alias sed enim. Earum consequatur in quidem sint beatae exercitationem neque maxime. Id odio aliquid dolor facere quod mollitia impedit ducimus.</p>', NULL, '2023-03-02 19:42:58', '2023-03-02 19:42:58'),
(15, 1, 3, 'Veritatis quasi earum quaerat quam magnam magni.', 'eveniet-ullam-voluptates-et-sunt-odit', NULL, 'Voluptatem molestiae qui illum libero sed id maiores.', '<p>Illum sunt omnis iusto et totam. Non ut eum cumque quia repellendus eaque. Dicta maxime sunt voluptas hic rerum sed. Placeat necessitatibus et in voluptatibus.</p><p>Repudiandae nisi aut sapiente qui libero est. Omnis vitae recusandae omnis similique. Tempora ea et corrupti ipsa laborum rerum id. Qui beatae et reiciendis omnis eos laborum voluptas officia.</p><p>Alias aliquam velit similique doloremque cumque dicta nemo. Dignissimos sequi non quis repellendus quaerat sint est nemo. Iusto aut optio a quo. Nam quibusdam a velit natus impedit praesentium nulla eligendi.</p><p>Quibusdam et praesentium sit nulla rerum nam. Aut eaque et quod sit culpa. Et eum ex consequatur.</p><p>Perferendis maxime similique molestiae quam. Ut ut neque ea officia saepe sint nemo rerum. Iste voluptatem occaecati est. Illum tempora autem eaque non.</p><p>Eum in pariatur dolor. Ut in ex ut delectus sed et. Et et dolorem quia nobis sapiente nihil enim.</p>', NULL, '2023-03-02 19:42:58', '2023-03-02 19:42:58'),
(16, 3, 2, 'Quo aut nobis dolore et dolor qui.', 'quae-eius-voluptatem-quia-porro', NULL, 'Dicta illo ex suscipit nobis sunt praesentium delectus. Ipsam voluptates fugiat quo voluptatem quis fugit. Magni sunt aut quod rem. Voluptatem hic aliquam voluptatem veniam.', '<p>Facere aut omnis sunt molestiae. Nobis inventore et alias ad in recusandae. Excepturi omnis excepturi pariatur praesentium harum et.</p><p>Et quis nam in in. Nihil rem aliquam unde dignissimos doloribus et. Itaque et aut est temporibus. Perspiciatis qui ratione nostrum facilis.</p><p>Distinctio itaque error culpa sit temporibus ut. Dolorem aspernatur eligendi quia enim placeat. Ad animi ab ratione natus rerum et soluta.</p><p>Harum alias corporis non aut ipsum magni. Optio placeat dignissimos nihil et facilis et. Debitis vero recusandae sapiente veniam.</p><p>Id tempore quisquam itaque. Saepe eos velit voluptatem dicta quasi. Consequuntur cupiditate repellendus et voluptates qui iste quia quia. Qui commodi voluptatum voluptatem qui quia. Quibusdam quia voluptatem veritatis.</p><p>Incidunt dolore ab aliquid doloremque. Nihil vitae illum voluptatem itaque. Incidunt nostrum cupiditate quia sed. Quidem accusamus quibusdam distinctio.</p><p>Sed tenetur hic vero et. Minus quos sed voluptatum quo. Earum pariatur sit assumenda vel.</p><p>Quaerat sit modi asperiores aspernatur quam. Nobis autem laudantium dolorum modi. Et nam velit ad qui rerum vitae. Beatae provident consectetur necessitatibus quos laboriosam illo.</p>', NULL, '2023-03-02 19:42:58', '2023-03-02 19:42:58'),
(17, 2, 3, 'Et quaerat ut ratione ipsa delectus.', 'et-iste-repellendus-nisi', NULL, 'Velit ab tempora error incidunt nisi laborum. Facere est totam enim aut qui dolor. Animi laboriosam magnam reiciendis et ipsa est id eius.', '<p>Autem consectetur ex tempora consequuntur nostrum natus illum. Dolor vero a quia qui repellat vero. Non veritatis sint officia officia quia iusto maiores accusamus.</p><p>Ratione id id aut a ut. Est qui nesciunt sit porro. Necessitatibus dolores blanditiis adipisci est animi sint.</p><p>Ut voluptate aut qui sapiente inventore numquam. Non rem ea repudiandae voluptatum occaecati qui alias non. Commodi ducimus pariatur occaecati dolores.</p><p>Facere corrupti aut reiciendis. Ut est aspernatur quia quia. Molestias voluptas qui architecto ut modi fuga.</p><p>Et cupiditate fuga impedit aut sunt et. Sed ullam suscipit dolores exercitationem recusandae. Voluptatem quod consequatur sint sed quia voluptatem.</p><p>Dolorem quibusdam est necessitatibus veritatis qui aut ex. Incidunt sed commodi officia repellendus ut placeat. Modi ratione corporis eveniet. Omnis ex nesciunt sint eos voluptatem neque quia similique.</p><p>Repellendus iure provident tempore repellat voluptatem qui. Necessitatibus iure facilis odio nam possimus et. Sunt repellendus magni magni esse et ut.</p>', NULL, '2023-03-02 19:42:58', '2023-03-02 19:42:58'),
(18, 3, 1, 'Soluta delectus quis quia quaerat et.', 'et-quaerat-rerum-quae-esse-consequatur-aspernatur-sed', NULL, 'Vitae dignissimos quas sit rerum quo. Qui et nam harum eos.', '<p>Asperiores eaque laboriosam quaerat eaque harum voluptates. Commodi accusamus quia corrupti omnis nemo quae laborum. Fugit veniam iure sed aliquid nihil et ipsum autem. Tenetur enim aut aut vel porro.</p><p>Corrupti consectetur qui et libero eveniet voluptas. Ipsam veritatis earum qui unde voluptatem ullam necessitatibus. Esse aliquid enim et officiis sed laborum vero labore.</p><p>Enim illum debitis dolorem est ut temporibus doloribus qui. Molestiae et et quos modi itaque ut. Soluta nemo error quo doloremque possimus officia quo. Accusamus dignissimos quas vel.</p><p>Odio iusto et sunt dolor veritatis neque ea eius. Distinctio neque qui vitae at. Culpa et quos qui in. Blanditiis temporibus eum quia sed perferendis. Ex ab doloremque voluptas doloremque.</p><p>Et deleniti explicabo error adipisci. Minus est voluptate modi accusamus. Et distinctio fugit quibusdam ab. Eum eum delectus quidem ducimus omnis consectetur esse ut.</p><p>Enim impedit qui voluptatem nihil provident distinctio quis quo. Quis deleniti aliquid velit quia quaerat impedit voluptate. Minima et facere eum illum laudantium possimus est.</p><p>Architecto nisi porro dicta. Iure vel sed sint non quo. Dolorem ut in ipsa rerum quam eveniet eligendi. Suscipit cum eos vero et vitae. Voluptatem est accusantium voluptate et saepe.</p><p>Mollitia aut nobis repellendus. Est nisi dolor delectus eius. Ut animi sit fuga distinctio perferendis.</p>', NULL, '2023-03-02 19:42:58', '2023-03-02 19:42:58'),
(19, 1, 2, 'Quo quidem necessitatibus at in quidem nostrum nesciunt.', 'laboriosam-et-maxime-minima-aut', NULL, 'Eum est veniam molestiae totam consectetur dolorem. Sint expedita magnam facere aut voluptatem ullam consequatur. Et consectetur necessitatibus quibusdam delectus quidem. Corrupti aut id distinctio sed ea aut consequuntur aut.', '<p>Quia qui recusandae omnis beatae. Explicabo optio eius hic modi ratione placeat earum. Rerum aut adipisci voluptatem velit.</p><p>Et aut voluptas veritatis voluptatem dolores. Ut aut expedita velit hic molestiae. At eveniet eos totam unde voluptas.</p><p>Ut laboriosam dignissimos unde delectus. Nihil eos consequatur omnis quae. Inventore odio sed debitis accusamus eum voluptates repellendus.</p><p>Et assumenda ipsum ut enim nisi. Est rerum perspiciatis dicta ea blanditiis dignissimos est. Quo molestiae molestiae fuga omnis et consequatur autem. Explicabo animi velit ipsam a.</p><p>Necessitatibus pariatur numquam vero magnam. Omnis sit asperiores quidem qui consequatur iure dolor. Deserunt ex et eaque ea.</p><p>Animi quis tempora asperiores voluptas et. Pariatur ex cumque vel omnis minus voluptas. Necessitatibus fugiat et quia rerum. Ea aut laborum necessitatibus eveniet unde illum eligendi quaerat.</p><p>Alias consequatur sint at dolore ut voluptate et. Maxime pariatur hic ut cupiditate eum nisi. Corporis explicabo veritatis dolorem voluptas ducimus. Aut eum laboriosam veniam eveniet asperiores eos tempora.</p><p>Omnis soluta doloremque placeat aut ut reprehenderit officia tempore. Rerum aliquid necessitatibus sit ut eos molestiae est.</p>', NULL, '2023-03-02 19:42:58', '2023-03-02 19:42:58'),
(20, 3, 1, 'Cupiditate sed ullam voluptatum a ea non.', 'ea-neque-a-eius-hic', NULL, 'Quo vero et perferendis sequi eaque at cupiditate minus. Totam voluptates voluptatibus aut. Dignissimos placeat aut illo nostrum. Laboriosam hic libero officia.', '<p>Harum molestiae porro at exercitationem dolorum. Est tempore unde quasi tempore porro omnis. Dolor recusandae rerum aut.</p><p>Veritatis nam qui dolore voluptate. Aperiam fuga est fuga aut doloremque aliquid et. Praesentium illo et illum sit iure. Totam numquam corrupti exercitationem enim.</p><p>Esse vel corporis eius. Incidunt esse voluptatem omnis ullam aspernatur. Quae provident pariatur ut quia exercitationem est consectetur dolorum.</p><p>Deleniti eligendi ut voluptatem fuga est. Inventore accusantium repudiandae quia facilis repellendus. Inventore corporis fugit nulla eum maxime. Est quod aliquid ut facere quidem aperiam qui. Quidem molestiae laboriosam distinctio repudiandae consequatur maxime aperiam.</p><p>Enim est at nesciunt quia voluptatum. Molestiae voluptas repellendus fuga rerum voluptas possimus culpa et.</p>', NULL, '2023-03-02 19:42:58', '2023-03-02 19:42:58');

-- --------------------------------------------------------

--
-- Table structure for table `teams`
--

CREATE TABLE `teams` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `nama_tim` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `verifikasi_status` enum('done','pending','rejected') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'pending',
  `id_lomba` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `bukti_bayar` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `gambar_identitas_tim` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `team_contact` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `teams`
--

INSERT INTO `teams` (`id`, `nama_tim`, `verifikasi_status`, `id_lomba`, `user_id`, `bukti_bayar`, `gambar_identitas_tim`, `team_contact`, `created_at`, `updated_at`) VALUES
(24, 'omnis', 'done', 1, 5, 'post_images\\bukti-bayar2.jpeg', 'post_images\\PLSQL_4_2_sg.pdf', '(+62) 241 0495 300', '2023-03-03 01:42:46', '2023-03-03 20:38:55'),
(25, 'facere', 'pending', 4, 6, 'post_images\\bukti-bayar3.jpg', 'post_images\\PLSQL_2_6_sg.pdf', '0510 6307 584', '2023-03-03 01:42:46', '2023-03-03 03:21:41'),
(26, 'cum', 'pending', 3, 5, 'post_images\\bukti-bayar2.jpeg', 'post_images\\PLSQL_4_5_sg.pdf', '027 2432 553', '2023-03-03 01:42:46', '2023-03-04 02:30:02'),
(27, 'numquam', 'pending', 4, 5, 'post_images\\bukti-bayar2.jpeg', 'post_images\\PLSQL_2_6_sg.pdf', '(+62) 886 7849 6078', '2023-03-03 01:42:46', '2023-03-03 07:10:49'),
(28, 'qui', 'done', 2, 5, 'post_images\\bukti-bayar3.jpg', 'post_images\\PLSQL_2_6_sg.pdf', '0768 9530 987', '2023-03-03 01:42:46', '2023-03-07 19:00:22'),
(29, 'enim', 'pending', 4, 6, 'post_images\\bukti-bayar2.jpeg', 'post_images\\PLSQL_4_2_sg.pdf', '(+62) 619 1961 7170', '2023-03-03 01:42:46', '2023-03-03 01:42:46'),
(32, 'exercitationem', 'pending', 3, 4, 'post_images\\bukti-bayar3.jpg', 'post_images\\PLSQL_4_2_sg.pdf', '0367 1225 571', '2023-03-03 01:42:46', '2023-03-04 02:30:41'),
(33, 'quis', 'pending', 4, 5, 'post_images\\bukti-bayar3.jpg', 'post_images\\PLSQL_4_5_sg.pdf', '(+62) 497 8204 501', '2023-03-03 01:42:46', '2023-03-03 01:42:46'),
(34, 'doloremque', 'pending', 3, 5, 'post_images\\bukti-bayar3.jpg', 'post_images\\PLSQL_4_2_sg.pdf', '(+62) 830 0588 1715', '2023-03-03 01:42:46', '2023-03-04 02:30:42'),
(35, 'quam', 'done', 2, 4, 'post_images\\bukti-bayar3.jpg', 'post_images\\PLSQL_4_5_sg.pdf', '0415 4836 758', '2023-03-03 01:42:46', '2023-03-09 21:12:18'),
(36, 'quibusdam', 'pending', 3, 4, 'post_images\\bukti-bayar1.jpg', 'post_images\\PLSQL_4_2_sg.pdf', '(+62) 410 3548 935', '2023-03-03 01:42:46', '2023-03-04 02:30:44'),
(37, 'praesentium', 'pending', 4, 5, 'post_images\\bukti-bayar2.jpeg', 'post_images\\PLSQL_4_5_sg.pdf', '0455 9137 5016', '2023-03-03 01:42:46', '2023-03-03 01:42:46'),
(38, 'aut', 'pending', 4, 5, 'post_images\\bukti-bayar2.jpeg', 'post_images\\PLSQL_2_6_sg.pdf', '0306 3702 2037', '2023-03-03 01:42:46', '2023-03-03 01:42:46'),
(39, 'sint', 'pending', 4, 5, 'post_images\\bukti-bayar1.jpg', 'post_images\\PLSQL_4_5_sg.pdf', '(+62) 542 4600 4034', '2023-03-03 01:42:46', '2023-03-03 01:42:46'),
(40, 'corporis', 'pending', 3, 6, 'post_images\\bukti-bayar2.jpeg', 'post_images\\PLSQL_4_2_sg.pdf', '0436 0808 6749', '2023-03-03 01:42:46', '2023-03-05 23:47:35'),
(41, 'quia', 'done', 2, 5, 'post_images\\bukti-bayar2.jpeg', 'post_images\\PLSQL_4_2_sg.pdf', '0247 6139 710', '2023-03-03 01:42:46', '2023-03-07 19:00:39'),
(42, 'perferendis', 'pending', 4, 4, 'post_images\\bukti-bayar2.jpeg', 'post_images\\PLSQL_4_2_sg.pdf', '0428 4450 798', '2023-03-03 01:42:46', '2023-03-03 01:42:46'),
(43, 'doloremque', 'pending', 4, 4, 'post_images\\bukti-bayar1.jpg', 'post_images\\PLSQL_4_5_sg.pdf', '(+62) 727 9445 601', '2023-03-03 01:42:46', '2023-03-03 01:42:46'),
(45, 'consequuntur', 'pending', 3, 6, 'post_images\\bukti-bayar2.jpeg', 'post_images\\PLSQL_4_2_sg.pdf', '(+62) 306 1387 2111', '2023-03-03 07:04:59', '2023-03-07 18:12:32'),
(46, 'dolor', 'pending', 4, 6, 'post_images\\bukti-bayar3.jpg', 'post_images\\PLSQL_2_6_sg.pdf', '0899 543 580', '2023-03-03 07:04:59', '2023-03-03 07:04:59'),
(47, 'quod', 'done', 2, 6, 'post_images\\bukti-bayar1.jpg', 'post_images\\PLSQL_4_2_sg.pdf', '0569 9931 067', '2023-03-03 07:04:59', '2023-03-10 02:06:44'),
(50, 'qui', 'pending', 4, 5, 'post_images\\bukti-bayar3.jpg', 'post_images\\PLSQL_2_6_sg.pdf', '0368 9264 7846', '2023-03-03 07:04:59', '2023-03-03 07:04:59'),
(53, 'est', 'pending', 3, 5, 'post_images\\bukti-bayar1.jpg', 'post_images\\PLSQL_4_5_sg.pdf', '0396 1673 437', '2023-03-03 07:04:59', '2023-03-03 07:04:59'),
(54, 'nobis', 'pending', 4, 6, 'post_images\\bukti-bayar3.jpg', 'post_images\\PLSQL_4_5_sg.pdf', '(+62) 29 4909 5084', '2023-03-03 07:04:59', '2023-03-03 07:04:59'),
(55, 'non', 'pending', 2, 5, 'post_images\\bukti-bayar3.jpg', 'post_images\\PLSQL_4_5_sg.pdf', '(+62) 888 9759 5526', '2023-03-03 07:04:59', '2023-03-03 22:00:48'),
(56, 'rerum', 'pending', 2, 4, 'post_images\\bukti-bayar2.jpeg', 'post_images\\PLSQL_4_5_sg.pdf', '0268 6208 788', '2023-03-03 07:04:59', '2023-03-04 01:43:19'),
(57, 'omnis', 'pending', 2, 5, 'post_images\\bukti-bayar1.jpg', 'post_images\\PLSQL_2_6_sg.pdf', '(+62) 574 2099 589', '2023-03-03 07:04:59', '2023-03-03 07:04:59'),
(59, 'minima', 'pending', 2, 5, 'post_images\\bukti-bayar1.jpg', 'post_images\\PLSQL_4_2_sg.pdf', '(+62) 353 6457 0302', '2023-03-03 07:04:59', '2023-03-03 07:04:59'),
(63, 'impedit', 'done', 1, 4, 'post_images\\bukti-bayar2.jpeg', 'post_images\\PLSQL_4_5_sg.pdf', '(+62) 374 2539 1047', '2023-03-03 07:04:59', '2023-03-08 18:14:12');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `username` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `password` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `is_admin` tinyint(1) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `name`, `username`, `email`, `password`, `remember_token`, `created_at`, `updated_at`, `is_admin`) VALUES
(1, 'Fares Ariandha', 'fares123', 'alfares.ariandha.nurdin.tik21@mhsw.pnj.ac.id', '$2y$10$Y3zEC2D6vRsSkYxns0FeF.5Ni6pgFB7G4iqkKb9Trjs/nGR/mxYqO', NULL, '2023-03-02 19:42:58', '2023-03-02 19:42:58', 1),
(2, 'Caraka Tarihoran', 'keisha.maulana', 'ella.anggraini@example.org', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'gyPi3hoccF', '2023-03-02 19:42:58', '2023-03-02 19:42:58', 0),
(3, 'Hilda Rina Wulandari', 'szulaika', 'hardiansyah.manah@example.com', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'nRqMAIhM7X', '2023-03-02 19:42:58', '2023-03-02 19:42:58', 0),
(4, 'Sandhi', 'sandiagaUno321', 'sandhi.karunia.sugihartana.tik21@mhsw.pnj.ac.id', '$2y$10$uGMAMSZh2O4GiQdMIgexoeqxQO8oUzsVqdGBeghsEhm5mhptdSJQC', 'gPq2iOT5Qf0dicVxFTV1XDKPexc0r4FcTkzz4kyoUp1HFAu9PJt0op8AScDB', '2023-03-03 01:00:14', '2023-03-03 01:00:14', 0),
(5, 'Heical', 'heical123', 'heical.chandra.syahputra.tik21@mhsw.pnj.ac.id', '$2y$10$MZ2vg47z.ljMf0h.LCy8n.nxxWYwiHuNue0M2.a2E6c6IvEiGU9o6', 'TxTIE8dBQRJGX2Hoj9LSMLbgdd1RzaLvQirxseagmA086irByq7Tu7ch0MNl', '2023-03-03 01:00:14', '2023-03-03 01:00:14', 0),
(6, 'Arya Kendra', 'arkengantenk321', 'fransiskus.xaverius.arya.kendra.pamrayoga.tik21@mhsw.pnj.ac.id', '$2y$10$jmkLnHU7V4NUV175HCzyye9G8eaNqS5tyh2aRQI2oBQvZ/yBcjfQa', 'sIIrAKbdXw', '2023-03-03 01:00:14', '2023-03-03 01:00:14', 0);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `categories`
--
ALTER TABLE `categories`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `categories_name_unique` (`name`),
  ADD UNIQUE KEY `categories_slug_unique` (`slug`);

--
-- Indexes for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `failed_jobs_uuid_unique` (`uuid`);

--
-- Indexes for table `kategori_lombas`
--
ALTER TABLE `kategori_lombas`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `participants`
--
ALTER TABLE `participants`
  ADD PRIMARY KEY (`id`),
  ADD KEY `participants_team_id_foreign` (`team_id`);

--
-- Indexes for table `password_resets`
--
ALTER TABLE `password_resets`
  ADD KEY `password_resets_email_index` (`email`);

--
-- Indexes for table `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `personal_access_tokens_token_unique` (`token`),
  ADD KEY `personal_access_tokens_tokenable_type_tokenable_id_index` (`tokenable_type`,`tokenable_id`);

--
-- Indexes for table `posts`
--
ALTER TABLE `posts`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `teams`
--
ALTER TABLE `teams`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `users_username_unique` (`username`),
  ADD UNIQUE KEY `users_email_unique` (`email`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `categories`
--
ALTER TABLE `categories`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `kategori_lombas`
--
ALTER TABLE `kategori_lombas`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=28;

--
-- AUTO_INCREMENT for table `participants`
--
ALTER TABLE `participants`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=139;

--
-- AUTO_INCREMENT for table `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `posts`
--
ALTER TABLE `posts`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=21;

--
-- AUTO_INCREMENT for table `teams`
--
ALTER TABLE `teams`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=64;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `participants`
--
ALTER TABLE `participants`
  ADD CONSTRAINT `participants_team_id_foreign` FOREIGN KEY (`team_id`) REFERENCES `teams` (`id`) ON DELETE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
