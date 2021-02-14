-- phpMyAdmin SQL Dump
-- version 4.6.6deb4
-- https://www.phpmyadmin.net/
--
-- Хост: localhost
-- Время создания: Янв 20 2020 г., 12:22
-- Версия сервера: 10.1.41-MariaDB-0+deb9u1
-- Версия PHP: 7.0.33-0+deb9u6

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- База данных: `cottages`
--

-- --------------------------------------------------------

--
-- Структура таблицы `auth_groups`
--

CREATE TABLE `auth_groups` (
  `id` mediumint(8) UNSIGNED NOT NULL,
  `name` varchar(20) NOT NULL,
  `description` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `auth_groups`
--

INSERT INTO `auth_groups` (`id`, `name`, `description`) VALUES
(1, 'Admin', 'Администраторы сайта. Полный доступ ко всему содержимому.'),
(2, 'Manager', 'Группа с ограниченными правами для управления сайта менеджерами, сео-оптимизаторами.'),
(3, 'Members', 'Группа посетителей сайта. Доступ в админ-панель заблокирован.');

-- --------------------------------------------------------

--
-- Структура таблицы `auth_login_attempts`
--

CREATE TABLE `auth_login_attempts` (
  `id` int(11) UNSIGNED NOT NULL,
  `ip_address` varchar(15) NOT NULL,
  `login` varchar(100) NOT NULL,
  `time` int(11) UNSIGNED DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Структура таблицы `auth_users`
--

CREATE TABLE `auth_users` (
  `id` int(11) UNSIGNED NOT NULL,
  `ip_address` varchar(15) NOT NULL,
  `username` varchar(100) NOT NULL,
  `password` varchar(255) NOT NULL,
  `salt` varchar(255) DEFAULT NULL,
  `email` varchar(100) NOT NULL,
  `activation_code` varchar(40) DEFAULT NULL,
  `forgotten_password_code` varchar(40) DEFAULT NULL,
  `forgotten_password_time` int(11) UNSIGNED DEFAULT NULL,
  `remember_code` varchar(40) DEFAULT NULL,
  `created_on` int(11) UNSIGNED NOT NULL,
  `last_login` int(11) UNSIGNED DEFAULT NULL,
  `active` tinyint(1) UNSIGNED DEFAULT NULL,
  `first_name` varchar(50) DEFAULT NULL,
  `last_name` varchar(50) DEFAULT NULL,
  `company` varchar(100) DEFAULT NULL,
  `phone` varchar(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `auth_users`
--

INSERT INTO `auth_users` (`id`, `ip_address`, `username`, `password`, `salt`, `email`, `activation_code`, `forgotten_password_code`, `forgotten_password_time`, `remember_code`, `created_on`, `last_login`, `active`, `first_name`, `last_name`, `company`, `phone`) VALUES
(5, '127.0.0.1', 'Administrator', '$2a$08$ilO9y9QGi2K9wZlqWzAeouzO1YcdSv/jdi.jxFhbyOKC1YPgSBkli', NULL, 'info@vizitka.com', NULL, NULL, NULL, 'Lh3fZd49mOWbaIoyt.ZL9O', 1429787680, 1579508298, 1, 'Administrator', '', 'vizitka_admin', '');

-- --------------------------------------------------------

--
-- Структура таблицы `auth_users_groups`
--

CREATE TABLE `auth_users_groups` (
  `id` int(11) UNSIGNED NOT NULL,
  `user_id` int(11) UNSIGNED NOT NULL,
  `group_id` mediumint(8) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `auth_users_groups`
--

INSERT INTO `auth_users_groups` (`id`, `user_id`, `group_id`) VALUES
(18, 5, 1);

-- --------------------------------------------------------

--
-- Структура таблицы `booking`
--

CREATE TABLE `booking` (
  `id` int(11) NOT NULL,
  `cottage_id` int(11) DEFAULT NULL,
  `num_of_person` int(11) DEFAULT NULL,
  `nutrition` varchar(255) DEFAULT NULL,
  `total_price` int(11) DEFAULT NULL,
  `tel` varchar(255) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `start_date` int(11) DEFAULT NULL,
  `end_date` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `booking`
--

INSERT INTO `booking` (`id`, `cottage_id`, `num_of_person`, `nutrition`, `total_price`, `tel`, `name`, `email`, `start_date`, `end_date`) VALUES
(41, 6, 2, '0', 12500, '+7 (915) 021-91-09', 'Ольга', 'zagorodnoe47@inbox.ru', 1576886400, 1576972800),
(43, 22, 7, '0', 70000, '+7 (903) 676-41-33', 'Вера', 'veradoma@tandex.ru', 1577750400, 1577923200),
(46, 20, 7, '0', 61250, '+7 (903) 676-41-33', 'Вера  ', ' veradoma@yandex.ru', 1577750400, 1577923200),
(49, 26, 5, '0', 75000, '+7 (926) 144-66-99', 'Станислав', 'orlov.stvl@gmail.com', 1577923200, 1578182400),
(51, 20, 1, '0', 0, '+7 (977) 750-98-60', 'Дмитрий', 'aaaabrakadabrasukaaaa@gmail.com', 0, 0),
(53, 6, 1, '0', 0, '+7 (962) 270-55-61', 'Наталья ', 'Mishina_natalya@list.ru', 0, 0),
(55, 6, 4, '0', 25000, '+7 (962) 270-55-61', 'Наталья', 'Mishina_natalya@list.ru', 1579305600, 1579392000),
(57, 6, 3, '0', 18750, '+7 (920) 744-05-80', 'Елена', 'Elena.denisova.103@mail.ru', 1579910400, 1579996800);

-- --------------------------------------------------------

--
-- Структура таблицы `category`
--

CREATE TABLE `category` (
  `id` int(11) NOT NULL,
  `name` varchar(300) NOT NULL,
  `parent_id` int(11) DEFAULT NULL,
  `position` mediumint(5) DEFAULT NULL,
  `meta_title` varchar(300) DEFAULT NULL,
  `meta_h1` varchar(300) DEFAULT NULL,
  `meta_description` text,
  `meta_keywords` text,
  `meta_url` varchar(130) DEFAULT NULL,
  `content` text,
  `image` varchar(255) DEFAULT NULL,
  `template` varchar(50) DEFAULT NULL,
  `post_status` tinyint(1) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Структура таблицы `ci_sessions`
--

CREATE TABLE `ci_sessions` (
  `session_id` varchar(40) NOT NULL DEFAULT '0',
  `ip_address` varchar(16) NOT NULL DEFAULT '0',
  `user_agent` varchar(120) NOT NULL,
  `last_activity` int(10) UNSIGNED NOT NULL DEFAULT '0',
  `user_data` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `ci_sessions`
--

INSERT INTO `ci_sessions` (`session_id`, `ip_address`, `user_agent`, `last_activity`, `user_data`) VALUES
('0078689257c57bbf2aeb691c239a06ad', '213.87.153.198', 'Mozilla/5.0 (Linux; Android 9; FLA-LX1) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/79.0.3945.116 Mobile Safari/537.36', 1579432183, ''),
('08b7fe0cb6757b0841302b0f7d35bb74', '178.154.171.90', 'Mozilla/5.0 (compatible; YandexBot/3.0; +http://yandex.com/bots)', 1579441051, ''),
('097e16f2d20b23bee8bc0ea94438a1bb', '178.154.171.90', 'Mozilla/5.0 (compatible; YandexBot/3.0; +http://yandex.com/bots)', 1579453768, ''),
('09d102419d3705caed9b5ee57bd94741', '128.69.89.159', 'Mozilla/5.0 (Linux; Android 9; LLD-L31 Build/HONORLLD-L31) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/79.0.3945.116 M', 1579462884, ''),
('0a3d89b89855e90c4cd20347c5fe2331', '141.8.142.123', 'Mozilla/5.0 (compatible; YandexBot/3.0; +http://yandex.com/bots)', 1579464269, ''),
('0a9fe3a692d057fccf7d009b9190c522', '176.59.47.142', 'Mozilla/5.0 (iPhone; CPU iPhone OS 13_1_3 like Mac OS X) AppleWebKit/605.1.15 (KHTML, like Gecko) Version/13.0.1 Mobile/', 1579427752, ''),
('110344690aa23fb74711dbc1a3997ec4', '109.254.181.147', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/79.0.3945.130 Safari/537.36', 1579508291, 'a:6:{s:9:\"user_data\";s:0:\"\";s:8:\"identity\";s:16:\"info@vizitka.com\";s:8:\"username\";s:13:\"Administrator\";s:5:\"email\";s:16:\"info@vizitka.com\";s:7:\"user_id\";s:1:\"5\";s:14:\"old_last_login\";s:10:\"1579506576\";}'),
('114140a6840aed0ca958c4cb0b766873', '66.249.64.223', 'Mozilla/5.0 (Linux; Android 6.0.1; Nexus 5X Build/MMB29P) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/41.0.2272.96 Mob', 1579429810, ''),
('115c3643356036509f6ab464df7874de', '178.154.171.90', 'Mozilla/5.0 (compatible; YandexBot/3.0; +http://yandex.com/bots)', 1579459920, ''),
('11766902486971f2ab95c676b60b82df', '141.8.189.3', 'Mozilla/5.0 (compatible; YandexBot/3.0; +http://yandex.com/bots) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/51.0.2704', 1579459811, ''),
('143323e74091551fcb243ad892a860bb', '31.173.84.37', 'Mozilla/5.0 (iPhone; CPU iPhone OS 13_3 like Mac OS X) AppleWebKit/605.1.15 (KHTML, like Gecko) Version/13.0.4 Mobile/15', 1579444117, ''),
('14fc929ba289122a6cfed9ff34b3a99c', '178.154.171.90', 'Mozilla/5.0 (compatible; YandexBot/3.0; +http://yandex.com/bots)', 1579459964, ''),
('17671f2836da083febc00130b52370a8', '188.254.110.50', 'Mozilla/5.0 (iPhone; CPU iPhone OS 13_3 like Mac OS X) AppleWebKit/605.1.15 (KHTML, like Gecko) Version/13.0.4 Mobile/15', 1579499424, ''),
('1a3e2ad5b3f57cf94c168d52d0396584', '95.27.44.216', 'Mozilla/5.0 (iPhone; CPU iPhone OS 12_1_4 like Mac OS X) AppleWebKit/605.1.15 (KHTML, like Gecko) Version/12.0 Mobile/15', 1579454476, ''),
('1a888f4f8f33682e1bddf5fc57ad4387', '212.35.180.218', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/61.0.3163.125 Amigo/61.0.3163.125 MRCH', 1579494737, ''),
('24e232c17fb54cf29a726cb0286a22ff', '37.235.159.60', 'WhatsApp/2.19.360 A', 1579429575, ''),
('263dca919ff619c626b8f5aa6f86c3eb', '109.252.115.226', 'WhatsApp/2.19.341 A', 1579431494, ''),
('2a7e38eb31a433bc50cb706eca6e36ac', '66.249.64.193', 'Mozilla/5.0 (Linux; Android 6.0.1; Nexus 5X Build/MMB29P) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/41.0.2272.96 Mob', 1579429803, ''),
('2ae09a2c3e0bb66e475c7e035ff79ca8', '188.254.110.81', 'Mozilla/5.0 (iPhone; CPU iPhone OS 13_3 like Mac OS X) AppleWebKit/605.1.15 (KHTML, like Gecko) Version/13.0.4 Mobile/15', 1579510322, ''),
('2cdd6331afa30dc6886143846584c7f1', '141.8.142.123', 'Mozilla/5.0 (compatible; YandexBot/3.0; +http://yandex.com/bots)', 1579464054, ''),
('31ea8edd6b8e9e74afdb0ea1414dbf24', '213.87.153.137', 'Mozilla/5.0 (iPhone; CPU iPhone OS 13_3 like Mac OS X) AppleWebKit/605.1.15 (KHTML, like Gecko) Version/13.0.4 Mobile/15', 1579506123, ''),
('322e398a9f4db2b0eb99c560ceed116a', '91.193.176.149', 'Mozilla/5.0 (Linux; arm_64; Android 8.1.0; DUA-L22) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/78.0.3904.97 YaBrowser', 1579440931, ''),
('332d3cd7cfef4dfcd2ea9e8cf9690676', '66.249.64.223', 'Mozilla/5.0 (Linux; Android 6.0.1; Nexus 5X Build/MMB29P) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/41.0.2272.96 Mob', 1579429809, ''),
('3e3c2f8b688736eb0fd00ac5699c8f57', '176.212.193.105', 'Mozilla/5.0 (Linux; Android 9; SM-A705FN Build/PPR1.180610.011; wv) AppleWebKit/537.36 (KHTML, like Gecko) Version/4.0 C', 1579438952, ''),
('3e879c99805138af7ecd7950d3d7e1f0', '128.74.62.191', 'Mozilla/5.0 (iPhone; CPU iPhone OS 13_3 like Mac OS X) AppleWebKit/605.1.15 (KHTML, like Gecko) FxiOS/21.0 Mobile/15E148', 1579429504, ''),
('413ae67034d8ff58d56688462991f759', '89.101.121.161', 'Mozilla/5.0 (Linux; Android 9; HRY-LX1T) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/79.0.3945.116 Mobile Safari/537.3', 1579426270, ''),
('41d87b2883dc13d6d0db47248a4b5c51', '31.13.115.7', 'facebookexternalhit/1.1 (+http://www.facebook.com/externalhit_uatext.php)', 1579425386, ''),
('454717559300e6cf23b626c13942ea0f', '5.45.207.42', 'Mozilla/5.0 (compatible; YandexBot/3.0; +http://yandex.com/bots)', 1579441018, ''),
('4679daff6d56c7c4dd3a74858fa70dad', '66.249.64.223', 'Mozilla/5.0 (Linux; Android 6.0.1; Nexus 5X Build/MMB29P) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/41.0.2272.96 Mob', 1579429808, ''),
('47989d30abc2ac951ebf199087501120', '178.154.171.90', 'Mozilla/5.0 (compatible; YandexBot/3.0; +http://yandex.com/bots)', 1579446789, ''),
('49ae3d6566654692c5983496e27246b4', '212.12.4.69', 'Mozilla/5.0 (Windows NT 6.1) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/79.0.3945.117 Safari/537.36', 1579505915, ''),
('4a6e473a2775f73db2577f0e6a144b80', '185.140.160.105', 'Mozilla/5.0 (iPhone; CPU iPhone OS 13_3 like Mac OS X) AppleWebKit/605.1.15 (KHTML, like Gecko) Version/13.0.4 Mobile/15', 1579444026, ''),
('4ada2fae99edda52580da63773b1e3b1', '37.9.87.114', 'Mozilla/5.0 (compatible; YandexMetrika/2.0; +http://yandex.com/bots)', 1579501768, ''),
('4af3ba81de19c464c03df1a27832b578', '178.234.141.31', 'Mozilla/5.0 (Linux; arm_64; Android 9; PCT-AL10) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/78.0.3904.97 YaBrowser/19', 1579453640, ''),
('4baf17b7ff20a4d1218075634b2ede08', '178.154.171.90', 'Mozilla/5.0 (compatible; YandexBot/3.0; +http://yandex.com/bots)', 1579441106, ''),
('4c3eeba727e93e217463b371f3eed0ed', '128.74.37.84', 'Mozilla/5.0 (Windows; U; Windows NT 5.2; en-US) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/57.0.2987.108 Safari/537.3', 1579441723, ''),
('50eebb4d26bc5c81fb44461d2846aaf3', '178.154.171.90', 'Mozilla/5.0 (compatible; YandexBot/3.0; +http://yandex.com/bots)', 1579466426, ''),
('51e1d4eb565cf553c8714c93bc793c37', '94.28.211.35', 'Mozilla/5.0 (Linux; Android 7.0; BQ-5009L Build/NRD90M) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/79.0.3945.93 Mobil', 1579436990, ''),
('53420bf63ea3346d46e18175503c20e4', '178.154.171.90', 'Mozilla/5.0 (compatible; YandexBot/3.0; +http://yandex.com/bots)', 1579457976, ''),
('540d6649e0b364a20aed0a768386267d', '178.252.195.131', 'Mozilla/5.0 (Linux; Android 9; SM-A305FN Build/PPR1.180610.011) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/79.0.3945.', 1579468208, ''),
('5419e9e0d4a3fb42927c8b9bf630c5da', '185.12.124.78', 'Mozilla/5.0 (compatible; BackupLand/1.0; https://go.backupland.com/; Domain check for viruses;)', 1579510910, ''),
('542c4a20d229049a7764d8365f7b60d7', '176.59.38.42', 'Mozilla/5.0 (iPhone; CPU iPhone OS 13_2 like Mac OS X) AppleWebKit/605.1.15 (KHTML, like Gecko) Version/13.0 YaBrowser/1', 1579433875, ''),
('54f498b1263f397d50b76bb1c8cb575b', '178.154.171.90', 'Mozilla/5.0 (compatible; YandexBot/3.0; +http://yandex.com/bots)', 1579459943, ''),
('5535382e75a12f2cb1fa809e6bd4266f', '37.235.159.60', 'Mozilla/5.0 (Linux; Android 9; SM-G960F) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/79.0.3945.116 Mobile Safari/537.3', 1579429527, ''),
('56cdf8c3e9b1e451a76c0c4e433b36a7', '176.59.53.97', 'Mozilla/5.0 (Linux; Android 9; SAMSUNG SM-A505FN Build/PPR1.180610.011) AppleWebKit/537.36 (KHTML, like Gecko) SamsungBr', 1579463072, ''),
('57863e45266b3000504b5e3322afda73', '109.252.115.226', 'Mozilla/5.0 (Linux; Android 9; HRY-LX1T) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/74.0.3729.136 Mobile Safari/537.3', 1579451456, ''),
('59094a7bc06e0c8ce0ee0849845ec308', '178.154.171.90', 'Mozilla/5.0 (compatible; YandexBot/3.0; +http://yandex.com/bots)', 1579464177, ''),
('592a65e9282df3823fdda183ddcf9e2a', '91.132.107.65', 'Mozilla/5.0 (iPhone; CPU iPhone OS 13_3 like Mac OS X) AppleWebKit/605.1.15 (KHTML, like Gecko) Version/13.0.4 Mobile/15', 1579444226, ''),
('5af6e78fc92b75d5446384cc37fa2963', '141.8.189.3', 'Mozilla/5.0 (compatible; YandexBot/3.0; +http://yandex.com/bots) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/51.0.2704', 1579453679, ''),
('5b8a85d581c10f30d61170252065262c', '178.154.171.90', 'Mozilla/5.0 (compatible; YandexBot/3.0; +http://yandex.com/bots)', 1579459968, ''),
('5e9b125d2a17cda39256015fa925a213', '212.35.164.92', 'Mozilla/5.0 (Linux; Android 9; SAMSUNG SM-J730FM) AppleWebKit/537.36 (KHTML, like Gecko) SamsungBrowser/10.2 Chrome/71.0', 1579504362, ''),
('610d231570070e88d218a4d986a262bd', '83.149.44.242', 'Mozilla/5.0 (Linux; Android 9; SAMSUNG SM-G955F) AppleWebKit/537.36 (KHTML, like Gecko) SamsungBrowser/10.2 Chrome/71.0.', 1579444939, ''),
('6267477e384f410f9432266b3208f67d', '185.140.163.142', 'Mozilla/5.0 (iPhone; CPU iPhone OS 13_3 like Mac OS X) AppleWebKit/605.1.15 (KHTML, like Gecko) Version/13.0.4 Mobile/15', 1579466833, ''),
('639e0d3d9c75a34dd2c725fddb0bb960', '109.254.181.147', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/79.0.3945.117 Safari/537.36', 1579506573, 'a:6:{s:9:\"user_data\";s:0:\"\";s:8:\"identity\";s:16:\"info@vizitka.com\";s:8:\"username\";s:13:\"Administrator\";s:5:\"email\";s:16:\"info@vizitka.com\";s:7:\"user_id\";s:1:\"5\";s:14:\"old_last_login\";s:10:\"1579179613\";}'),
('6547afc7185bc0006508a2ce9a696015', '178.75.104.184', 'Mozilla/5.0 (iPhone; CPU iPhone OS 11_4_1 like Mac OS X) AppleWebKit/605.1.15 (KHTML, like Gecko) Mobile/15G77 Instagram', 1579428412, ''),
('65893bf5a0b67e01d30c70d26b4c8088', '188.32.65.55', 'Mozilla/5.0 (Linux; Android 5.1.1; SAMSUNG SM-J120F Build/LMY47X) AppleWebKit/537.36 (KHTML, like Gecko) SamsungBrowser/', 1579446181, ''),
('6747f33f899263d52599b314cdf6b3d1', '213.87.154.119', 'Mozilla/5.0 (Linux; Android 9; SM-A505FM Build/PPR1.180610.011) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/79.0.3945.', 1579499431, ''),
('67fd56ed59e3ab3e589160cf735c923f', '92.63.111.27', 'Mozilla/5.0 (Windows NT 6.0) AppleWebKit/535.1 (KHTML, like Gecko) Chrome/13.0.782.112 Safari/535.1', 1579451991, ''),
('741ae7ea4b7b6ade81890c7e9c0ffbd2', '178.154.171.90', 'Mozilla/5.0 (compatible; YandexBot/3.0; +http://yandex.com/bots)', 1579441087, ''),
('76107e6028c4e7faef092a69f880c9b5', '178.154.171.90', 'Mozilla/5.0 (compatible; YandexBot/3.0; +http://yandex.com/bots)', 1579481014, ''),
('78313b3dde0bc7a83e62d0eb9b06434b', '94.28.178.146', 'Mozilla/5.0 (Linux; Android 6.0.1; SM-T805) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/75.0.3770.101 Safari/537.36', 1579463519, ''),
('807ef4fd94d52e4e2933b97ca188530c', '213.87.158.12', 'Mozilla/5.0 (iPhone; CPU iPhone OS 13_3 like Mac OS X) AppleWebKit/605.1.15 (KHTML, like Gecko) Version/13.0.4 Mobile/15', 1579459656, ''),
('8351b4ec52dc2787cd299457baaa6738', '95.108.213.50', 'Mozilla/5.0 (compatible; YandexBot/3.0; +http://yandex.com/bots)', 1579499966, ''),
('8511b4b01ac75dcd8f5caf0e552594ed', '37.235.217.156', 'Mozilla/5.0 (iPhone; CPU iPhone OS 13_3 like Mac OS X) AppleWebKit/605.1.15 (KHTML, like Gecko) Version/13.0.4 Mobile/15', 1579444526, ''),
('86f38ac2a54b2c3c8f56f2f6b10876f1', '141.8.142.119', 'Mozilla/5.0 (compatible; YandexBot/3.0; +http://yandex.com/bots)', 1579441035, ''),
('8dc24f4d175ecb7ce2fce41b9d37816d', '176.59.32.233', 'Mozilla/5.0 (Linux; U; Android 9; ru-ru; Redmi 7 Build/PKQ1.181021.001) AppleWebKit/537.36 (KHTML, like Gecko) Version/4', 1579495997, ''),
('926fff962e8f88bbee6c22ba635b179b', '31.130.147.120', 'Mozilla/5.0 (Windows NT 6.3; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/78.0.3904.87 Safari/537.36', 1579461783, ''),
('92d31d975abd6919d6a3e970105a7bec', '212.12.15.197', 'Mozilla/5.0 (Windows NT 6.3; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/79.0.3945.130 Safari/537.36', 1579435725, ''),
('95c6542958347bdfb9620e78d63356a4', '178.154.171.90', 'Mozilla/5.0 (compatible; YandexBot/3.0; +http://yandex.com/bots)', 1579453755, ''),
('9651aeedb27eb2eae9a64df1ca2abe75', '178.154.171.90', 'Mozilla/5.0 (compatible; YandexBot/3.0; +http://yandex.com/bots)', 1579441070, ''),
('965bc2b217bafd06e341d9f23842b3be', '176.212.192.14', 'Mozilla/5.0 (iPhone; CPU iPhone OS 13_3 like Mac OS X) AppleWebKit/605.1.15 (KHTML, like Gecko) CriOS/79.0.3945.73 Mobil', 1579453674, ''),
('985142ce452f02d548077f4ee28f7543', '185.140.160.105', 'Mozilla/5.0 (iPhone; CPU iPhone OS 13_3 like Mac OS X) AppleWebKit/605.1.15 (KHTML, like Gecko) Version/13.0.4 Mobile/15', 1579444028, ''),
('99d704e78f6c07ef0f568146c413a8da', '128.69.89.159', 'Mozilla/5.0 (Linux; Android 7.0; Neffos X1 Lite) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/79.0.3945.116 Mobile Safa', 1579463116, ''),
('9a937801d509808426f47d1c7651b502', '128.69.89.159', 'WhatsApp/2.19.360 A', 1579462973, ''),
('9baacafca4513f10fc0400203a9f9f22', '178.154.171.90', 'Mozilla/5.0 (compatible; YandexBot/3.0; +http://yandex.com/bots)', 1579453737, ''),
('9ed8b223faccb7ccefe2ad9668149a91', '5.35.63.71', 'Mozilla/5.0 (Linux; Android 9; SM-G950F Build/PPR1.180610.011) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/79.0.3945.1', 1579463470, ''),
('9f7e1874d5476f44dec03c5364b48ae4', '213.87.153.2', 'Mozilla/5.0 (Linux; Android 9; BND-L21) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/79.0.3945.116 Mobile Safari/537.36', 1579510680, ''),
('a21ed72935df4d93bb88cf06dd8bbeb6', '141.8.142.185', 'Mozilla/5.0 (compatible; YandexBot/3.0; +http://yandex.com/bots) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/51.0.2704', 1579430122, ''),
('a45164ca701367eb2f5e81d36dadfebd', '91.193.177.131', 'Mozilla/5.0 (Linux; Android 8.0.0; G3412) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/78.0.3904.108 Mobile Safari/537.', 1579457617, ''),
('a936242881d6e306887d5a2147fa31ec', '213.87.163.172', 'Mozilla/5.0 (Linux; Android 9; KSA-LX9 Build/HONORKSA-LX9) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/79.0.3945.116 M', 1579436297, ''),
('aad3f876284f6c2e44a89856da89d482', '141.8.189.3', 'Mozilla/5.0 (compatible; YandexBot/3.0; +http://yandex.com/bots) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/51.0.2704', 1579464984, ''),
('ada633a039dc01e323cfc0c9436ccb09', '176.59.50.25', 'Mozilla/5.0 (Linux; U; Android 6.0.1; ru-ru; Redmi Note 3 Build/MMB29M) AppleWebKit/537.36 (KHTML, like Gecko) Version/4', 1579470332, ''),
('ae39c6d6f3d7dcc34382d5444c69ff44', '178.154.171.90', 'Mozilla/5.0 (compatible; YandexBot/3.0; +http://yandex.com/bots)', 1579453733, ''),
('ae59356d32c3a242214703d1a1ca77ba', '195.88.120.98', 'Mozilla/5.0 (Linux; Android 9; COL-L29 Build/HUAWEICOL-L29; wv) AppleWebKit/537.36 (KHTML, like Gecko) Version/4.0 Chrom', 1579425274, ''),
('afb5175c5a9c9a5d4add2df8e567b9a2', '178.154.171.90', 'Mozilla/5.0 (compatible; YandexBot/3.0; +http://yandex.com/bots)', 1579459971, ''),
('aff1fcae5f340a4a85bc62b7f42b9aec', '94.180.129.4', 'Mozilla/5.0 (Linux; Android 7.1.1; SAMSUNG SM-J510FN Build/NMF26X) AppleWebKit/537.36 (KHTML, like Gecko) SamsungBrowser', 1579479754, ''),
('b3cefe43f74bd95b182eeb9296d6f685', '66.249.64.223', 'Mozilla/5.0 (Linux; Android 6.0.1; Nexus 5X Build/MMB29P) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/41.0.2272.96 Mob', 1579429808, ''),
('b7c13fffe9975b7abcb8984668f1a836', '176.59.47.235', 'Mozilla/5.0 (Linux; Android 9; SM-A705FN Build/PPR1.180610.011; wv) AppleWebKit/537.36 (KHTML, like Gecko) Version/4.0 C', 1579461526, ''),
('baf3eed1e171da87f5120d69edff4f5d', '188.168.248.24', 'Mozilla/5.0 (Macintosh; U; Intel Mac OS X 10.4; en-US; rv:1.9.2.2) Gecko/20100316 Firefox/3.6.2', 1579449870, ''),
('bd45611c4d84495e6b479304f37529ac', '178.154.171.90', 'Mozilla/5.0 (compatible; YandexBot/3.0; +http://yandex.com/bots)', 1579441130, ''),
('bdf40bca65044d37c65e2e317becb8a4', '213.176.255.161', 'Mozilla/5.0 (iPhone; CPU iPhone OS 13_3 like Mac OS X) AppleWebKit/605.1.15 (KHTML, like Gecko) Version/13.0.4 Mobile/15', 1579454371, ''),
('beb858cdfdd77eaa51e0a9c5227b5614', '66.249.64.196', 'Mozilla/5.0 (compatible; Googlebot/2.1; +http://www.google.com/bot.html)', 1579480790, ''),
('bfc81fe98e6de2c3e5c40839779eddd1', '94.25.160.187', 'Mozilla/5.0 (Linux; arm_64; Android 9; PCT-L29) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/78.0.3904.97 YaBrowser/19.', 1579480982, ''),
('c0b0e67b87b3854f689514f75de1f7f9', '37.9.113.189', 'Mozilla/5.0 (compatible; YandexBot/3.0; +http://yandex.com/bots) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/51.0.2704', 1579440970, ''),
('c0f5e379e29145ea391c32d0e1981bc8', '217.107.106.245', 'Mozilla/5.0 (Linux; Android 9; STK-LX1 Build/HONORSTK-LX1; wv) AppleWebKit/537.36 (KHTML, like Gecko) Version/4.0 Chrome', 1579446272, ''),
('c36a8dcbb32bce8fc778afd454726bfd', '37.147.151.181', 'Mozilla/5.0 (iPad; CPU OS 13_3 like Mac OS X) AppleWebKit/605.1.15 (KHTML, like Gecko) Version/13.0.4 Mobile/15E148 Safa', 1579454455, ''),
('c43a06c40583fed721f2a96b12f97109', '188.168.248.24', 'Mozilla/5.0 (Linux; Android 5.1; 4Good S450m 4G Build/LMY47D; wv) AppleWebKit/537.36 (KHTML, like Gecko) Version/4.0 Chr', 1579443614, ''),
('c650f77cc43b01185aefbc3c9c2834cf', '178.154.171.90', 'Mozilla/5.0 (compatible; YandexBot/3.0; +http://yandex.com/bots)', 1579453749, ''),
('c6c1c7c84dba82498d3f20fcd483329f', '66.249.64.223', 'Mozilla/5.0 (compatible; Googlebot/2.1; +http://www.google.com/bot.html)', 1579429801, ''),
('c762f10eee53a0bbda0525b09536397c', '66.249.64.223', 'Mozilla/5.0 (Linux; Android 6.0.1; Nexus 5X Build/MMB29P) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/41.0.2272.96 Mob', 1579429807, ''),
('c8f02e0cea1e37aff1e0d161ac3fff5d', '176.59.37.239', 'Mozilla/5.0 (iPhone; CPU iPhone OS 12_4_3 like Mac OS X) AppleWebKit/605.1.15 (KHTML, like Gecko) Version/12.1.2 Mobile/', 1579465304, ''),
('cafa2e3bd6cc1c7b8d3ff4d3198975ec', '95.165.74.236', 'Mozilla/5.0 (iPhone; CPU iPhone OS 13_3 like Mac OS X) AppleWebKit/605.1.15 (KHTML, like Gecko) Version/13.0.4 Mobile/15', 1579444481, ''),
('cba3cd505a64de228305ca36a81b11c1', '46.38.44.126', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_2) AppleWebKit/605.1.15 (KHTML, like Gecko) Version/13.0.4 Safari/605.1.15', 1579459693, ''),
('ce9d9cb6517339170f287ed38c4952f9', '66.249.64.223', 'Mozilla/5.0 (Linux; Android 6.0.1; Nexus 5X Build/MMB29P) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/41.0.2272.96 Mob', 1579429809, ''),
('d7fcb113b1fc98722084f0c4f175876e', '178.35.233.229', 'Mozilla/5.0 (Windows NT 6.2; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/27.0.1453.93 Safari/537.36', 1579425841, ''),
('d81211ae58334eec28e187923edcf8b8', '91.245.133.41', 'Mozilla/5.0 (Linux; Android 8.0.0; SAMSUNG SM-A520F) AppleWebKit/537.36 (KHTML, like Gecko) SamsungBrowser/10.2 Chrome/7', 1579448495, ''),
('d85ba22a77cbdd7a494d5d1bea049f07', '31.173.80.232', 'Mozilla/5.0 (iPhone; CPU iPhone OS 13_2_3 like Mac OS X) AppleWebKit/605.1.15 (KHTML, like Gecko) Version/13.0.3 Mobile/', 1579467923, ''),
('e0b94fbc5562108ed9a6d84b280ddef4', '95.213.171.155', '0', 1579453227, ''),
('e373eeb9998faae03eef86b3d7a83866', '141.8.142.123', 'Mozilla/5.0 (compatible; YandexBot/3.0; +http://yandex.com/bots)', 1579463831, ''),
('e37ce16d3ca0271e9877a90764b97de0', '188.168.248.35', 'Mozilla/5.0 (Linux; arm_64; Android 9; COL-L29) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/78.0.3904.97 YaBrowser/19.', 1579459789, ''),
('e42fc965e7d41175a54791e1f0cca31a', '185.218.109.47', 'Mozilla/5.0 (iPhone; CPU iPhone OS 13_3 like Mac OS X) AppleWebKit/605.1.15 (KHTML, like Gecko) Version/13.0.4 Mobile/15', 1579429519, ''),
('e473f453d134531ef59c42ae782f4360', '176.36.21.189', 'Mozilla/5.0 (Windows NT 6.1; WOW64; rv:43.0) Gecko/20100101 Firefox/43.0', 1579452821, ''),
('e63fe213d8e1dc9fdb3bbf5eb3e7f8cc', '178.154.171.90', 'Mozilla/5.0 (compatible; YandexBot/3.0; +http://yandex.com/bots)', 1579453752, ''),
('e9b57cfe090f321829508d900bc65d9d', '94.28.178.146', 'Mozilla/5.0 (Linux; Android 5.1.1; CHM-U01 Build/HonorCHM-U01) AppleWebKit/537.36 (KHTML, like Gecko) Version/4.0 Chrome', 1579436434, ''),
('eb5dbad0e53358ca7a2bd3a07fff6cb5', '185.218.109.47', 'Mozilla/5.0 (iPhone; CPU iPhone OS 13_3 like Mac OS X) AppleWebKit/605.1.15 (KHTML, like Gecko) Version/13.0.4 Mobile/15', 1579426022, ''),
('ed36d5112800d8c1d82474ba791422c2', '37.9.113.192', 'Mozilla/5.0 (compatible; YandexBot/3.0; +http://yandex.com/bots) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/51.0.2704', 1579497308, ''),
('ef3a1027c43f176ce5d709f00b254635', '188.32.65.55', 'Mozilla/5.0 (Linux; Android 5.1.1; SAMSUNG SM-J120F Build/LMY47X) AppleWebKit/537.36 (KHTML, like Gecko) SamsungBrowser/', 1579446182, ''),
('ef7646d08763450b9b0a94cbd37afc60', '66.249.64.223', 'Mozilla/5.0 (Linux; Android 6.0.1; Nexus 5X Build/MMB29P) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/41.0.2272.96 Mob', 1579429807, ''),
('f2083d72489ea60ac04a2ea68031e3af', '213.87.158.58', 'Mozilla/5.0 (Linux; Android 9; CLT-L29) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/79.0.3945.116 Mobile Safari/537.36', 1579448774, ''),
('fb4942f3b72a4630a364e240435ceab6', '66.249.64.223', 'Mozilla/5.0 (Linux; Android 6.0.1; Nexus 5X Build/MMB29P) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/41.0.2272.96 Mob', 1579485528, ''),
('fc0e50aff20e59d4671d94fb8cb8abea', '213.87.136.152', 'Mozilla/5.0 (iPhone; CPU iPhone OS 13_3 like Mac OS X) AppleWebKit/605.1.15 (KHTML, like Gecko) Version/13.0.4 Mobile/15', 1579429809, ''),
('fc14a505edbf7a382bb2615af448d292', '95.108.213.50', 'Mozilla/5.0 (compatible; YandexBot/3.0; +http://yandex.com/bots) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/51.0.2704', 1579481010, ''),
('fd1554f3cfb2eaff393d0941115dea96', '95.163.255.246', 'Mozilla/5.0 (compatible; Linux x86_64; Mail.RU_Bot/2.0; +http://go.mail.ru/help/robots)', 1579510440, ''),
('ff74107e50a69e3b5088081979a44de3', '95.163.255.244', 'Mozilla/5.0 (compatible; Linux x86_64; Mail.RU_Bot/2.0; +http://go.mail.ru/help/robots)', 1579488002, '');

-- --------------------------------------------------------

--
-- Структура таблицы `comments`
--

CREATE TABLE `comments` (
  `id` int(11) NOT NULL,
  `article_id` int(11) DEFAULT NULL,
  `parent_id` int(11) DEFAULT NULL,
  `type` varchar(255) DEFAULT NULL,
  `name` varchar(60) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `message` varchar(3000) DEFAULT NULL,
  `created` datetime DEFAULT NULL,
  `public` int(1) DEFAULT NULL,
  `ip` varchar(30) DEFAULT NULL,
  `city` varchar(50) DEFAULT NULL,
  `image` varchar(255) DEFAULT NULL,
  `organization` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Структура таблицы `cottages`
--

CREATE TABLE `cottages` (
  `id` int(11) NOT NULL,
  `name` varchar(300) NOT NULL,
  `cat_id` int(11) DEFAULT NULL,
  `image` varchar(255) DEFAULT NULL,
  `content` text,
  `short_content` text,
  `meta_title` varchar(300) DEFAULT NULL,
  `meta_h1` varchar(300) DEFAULT NULL,
  `meta_description` text,
  `meta_keywords` text,
  `meta_url` varchar(130) DEFAULT NULL,
  `cat_url` varchar(255) DEFAULT NULL,
  `template` varchar(50) DEFAULT NULL,
  `created` datetime DEFAULT NULL,
  `edited` datetime DEFAULT NULL,
  `post_status` tinyint(1) DEFAULT NULL,
  `animals` varchar(255) DEFAULT NULL,
  `house_type` varchar(255) DEFAULT NULL,
  `sleeping_places` varchar(255) DEFAULT NULL,
  `total_area` varchar(255) DEFAULT NULL,
  `price` varchar(255) DEFAULT NULL,
  `breakfast_price` varchar(255) DEFAULT NULL,
  `half_board_price` varchar(255) DEFAULT NULL,
  `all_inclusive_price` varchar(255) DEFAULT NULL,
  `floors` varchar(255) DEFAULT NULL,
  `repair` varchar(255) DEFAULT NULL,
  `toilets` varchar(255) DEFAULT NULL,
  `wifi` varchar(255) DEFAULT NULL,
  `cleaning` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `cottages`
--

INSERT INTO `cottages` (`id`, `name`, `cat_id`, `image`, `content`, `short_content`, `meta_title`, `meta_h1`, `meta_description`, `meta_keywords`, `meta_url`, `cat_url`, `template`, `created`, `edited`, `post_status`, `animals`, `house_type`, `sleeping_places`, `total_area`, `price`, `breakfast_price`, `half_board_price`, `all_inclusive_price`, `floors`, `repair`, `toilets`, `wifi`, `cleaning`) VALUES
(6, 'Звездочет', 0, '', '<p style=\"text-align: justify;\">В коттедже есть 2 спальни, ванная комната с сауной, кухня, 2 гостиные с телевизорами.</p>\n<p><strong>Гость на время своего проживания получает:</strong></p>\n<ul>\n<li>просторную територию</li>\n<li>площадку для барбекю &nbsp;</li>\n<li>халат и предметы личной гигиены &nbsp;</li>\n<li>Wi-Fi</li>\n<li>самовар и всю необходимую посуду</li>\n</ul>', '', '', '', '', '', 'domik-zvezdochet', NULL, '', '2019-12-05 17:04:47', '2020-01-16 11:25:47', 1, 'да', 'Звездочет', '4', '108 м2', '2500', '0', '0', '0', '1', 'евро', '1', 'есть', 'ежедневно '),
(20, 'Удачный', 0, NULL, '<p>В коттедже есть 4 спальни, 2 ванные комната с сауной, кухня, 2 гостиные с телевизорами.</p>\n<p><strong>Гость на время своего проживания получает:</strong></p>\n<ul>\n<li>просторную територию</li>\n<li>площадку для барбекю</li>\n<li>халат и предметы личной гигиены</li>\n<li>Wi-Fi</li>\n<li>самовар и всю необходимую посуду</li>\n</ul>', '', '', '', '', '', 'domik-udachnyiy', NULL, '', '2019-12-14 19:34:46', '2020-01-16 11:28:31', 1, 'да', 'ТАЛДОМ', '6', '112 м2', '2125', '0', '0', '0', '1', 'евро', '1', 'есть', 'ежедневно'),
(22, 'Хижина', 0, NULL, '<p>В коттедже есть 4 спальни, 2 ванные комната с сауной, кухня, 2 гостиные с телевизорами.</p>\n<p><strong>Гость на время своего проживания получает:</strong></p>\n<ul>\n<li>просторную територию</li>\n<li>площадку для барбекю</li>\n<li>халат и предметы личной гигиены</li>\n<li>Wi-Fi</li>\n<li>самовар и всю необходимую посуду</li>\n</ul>', '', '', '', '', '', 'domik-hijina', NULL, '', '2019-12-16 12:36:04', '2020-01-16 11:27:59', 1, 'да', 'Хижина', '8', '160 м2', '2500', '0', '0', '0', '1', 'евро', '1', 'есть', 'ежедневно'),
(26, 'Талдом', 0, NULL, '<p>В коттедже есть 3 спальни, ванная комната с сауной, кухня, 2 гостиные с телевизорами.</p>\n<p><strong> Гость на время своего проживания получает:</strong></p>\n<ul>\n<li>просторную територию</li>\n<li>площадку для барбекю</li>\n<li>халат и предметы личной гигиены</li>\n<li>Wi-Fi</li>\n<li>самовар и всю необходимую посуду</li>\n</ul>', '', '', '', '', '', 'taldom', NULL, '', '2019-12-17 11:28:20', '2020-01-16 11:27:20', 1, 'да', 'Талдом', '6', '112', '2335', '0', '0', '0', '1', 'евро', '1', 'есть', 'ежедневно');

-- --------------------------------------------------------

--
-- Структура таблицы `cottages_data`
--

CREATE TABLE `cottages_data` (
  `id` int(11) NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `header` varchar(255) DEFAULT NULL,
  `content` text,
  `cottage_id` int(11) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Структура таблицы `cottages_slider`
--

CREATE TABLE `cottages_slider` (
  `id` int(6) UNSIGNED NOT NULL,
  `cottage_id` int(6) DEFAULT NULL,
  `url` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `cottages_slider`
--

INSERT INTO `cottages_slider` (`id`, `cottage_id`, `url`) VALUES
(506, 6, '/assets/cottages/Звездочёт1.jpeg'),
(507, 6, '/assets/cottages/Звездочёт.jpeg'),
(508, 6, '/assets/cottages/usadba-alexandrovo_1.jpeg'),
(509, 6, '/assets/cottages/usadba-alexandrovo_1.jpg'),
(510, 6, '/assets/cottages/usadba-alexandrovo_2.jpeg'),
(511, 6, '/assets/cottages/usadba-alexandrovo_3.jpeg'),
(512, 6, '/assets/cottages/usadba-alexandrovo_4.jpeg'),
(513, 6, '/assets/cottages/usadba-alexandrovo_5.jpeg'),
(533, 26, '/assets/cottages/Талдом1.jpeg'),
(534, 26, '/assets/cottages/Талдом2.jpeg'),
(535, 26, '/assets/cottages/Талдом3.jpeg'),
(536, 26, '/assets/cottages/Талдом.jpeg'),
(537, 26, '/assets/cottages/usadba-alexandrovo_13.jpeg'),
(538, 26, '/assets/cottages/usadba-alexandrovo_13.jpg'),
(539, 26, '/assets/cottages/usadba-alexandrovo_23.jpeg'),
(540, 26, '/assets/cottages/usadba-alexandrovo_33.jpeg'),
(541, 26, '/assets/cottages/usadba-alexandrovo_43.jpeg'),
(542, 26, '/assets/cottages/usadba-alexandrovo_53.jpeg'),
(543, 22, '/assets/cottages/Хижина1.jpeg'),
(544, 22, '/assets/cottages/Хижина2.jpeg'),
(545, 22, '/assets/cottages/Хижина.jpeg'),
(546, 22, '/assets/cottages/usadba-alexandrovo_12.jpeg'),
(547, 22, '/assets/cottages/usadba-alexandrovo_12.jpg'),
(548, 22, '/assets/cottages/usadba-alexandrovo_22.jpeg'),
(549, 22, '/assets/cottages/usadba-alexandrovo_32.jpeg'),
(550, 22, '/assets/cottages/usadba-alexandrovo_42.jpeg'),
(551, 22, '/assets/cottages/usadba-alexandrovo_52.jpeg'),
(552, 20, '/assets/cottages/Удачный1.jpeg'),
(553, 20, '/assets/cottages/Удачный2.jpeg'),
(554, 20, '/assets/cottages/Удачный3.jpg'),
(555, 20, '/assets/cottages/Удачный.jpeg'),
(556, 20, '/assets/cottages/usadba-alexandrovo_11.jpeg'),
(557, 20, '/assets/cottages/usadba-alexandrovo_11.jpg'),
(558, 20, '/assets/cottages/usadba-alexandrovo_21.jpeg'),
(559, 20, '/assets/cottages/usadba-alexandrovo_31.jpeg'),
(560, 20, '/assets/cottages/usadba-alexandrovo_41.jpeg'),
(561, 20, '/assets/cottages/usadba-alexandrovo_51.jpeg');

-- --------------------------------------------------------

--
-- Структура таблицы `forms`
--

CREATE TABLE `forms` (
  `id` int(11) NOT NULL,
  `form_id` int(11) NOT NULL,
  `status` int(2) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `tel` varchar(255) DEFAULT NULL,
  `message` text,
  `date` datetime DEFAULT NULL,
  `ip` varchar(30) DEFAULT NULL,
  `address` varchar(255) DEFAULT NULL,
  `time` varchar(255) DEFAULT NULL,
  `you_order` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `forms`
--

INSERT INTO `forms` (`id`, `form_id`, `status`, `name`, `tel`, `message`, `date`, `ip`, `address`, `time`, `you_order`) VALUES
(12, 3, 1, 'Тест', '+7 (999) 999-99-99', NULL, '2019-12-18 15:47:04', '109.254.181.147', NULL, NULL, NULL),
(13, 3, 1, 'Тест', '+7 (999) 999-99-99', NULL, '2019-12-18 15:47:10', '109.254.181.147', NULL, NULL, NULL),
(14, 3, 1, 'Елена', '+7 (916) 156-57-30', NULL, '2019-12-25 15:01:03', '217.107.126.88', NULL, NULL, NULL),
(15, 3, 1, 'Мария', '+7 (926) 159-70-66', NULL, '2019-12-26 19:25:30', '95.25.176.198', NULL, NULL, NULL),
(16, 3, 1, 'Мария', '+7 (926) 159-70-66', NULL, '2019-12-26 19:25:32', '95.25.176.198', NULL, NULL, NULL),
(17, 3, 3, 'Станислав', '+7 (926) 144-66-99', NULL, '2019-12-27 12:03:03', '109.252.19.150', NULL, NULL, NULL),
(18, 1, 1, 'Наталья', '+7 (977) 662-89-87', 'Ждём звонка , доп номер 89772704947 (номер не вбивается полностью 89776628987)', '2019-12-31 14:14:54', '176.59.51.230', NULL, NULL, NULL),
(19, 1, 3, 'Наталья', '+7 (977) 662-89-87', 'Ждём звонка , доп номер 89772704947 (номер не вбивается полностью 89776628987)', '2019-12-31 14:14:58', '176.59.51.230', NULL, NULL, NULL),
(20, 3, 1, 'Анна', '+7 (953) 441-95-52', NULL, '2020-01-13 16:48:16', '176.59.51.32', NULL, NULL, NULL),
(21, 3, 1, 'Анна', '+7 (953) 441-95-52', NULL, '2020-01-13 16:48:22', '176.59.51.32', NULL, NULL, NULL),
(22, 3, 1, 'Тест', '+7 (926) 911-20-56', NULL, '2020-01-16 12:16:37', '89.221.55.38', NULL, NULL, NULL),
(23, 1, 1, 'тест', '+7 (926) 911-20-56', 'тест тест тест ', '2020-01-16 12:21:23', '89.221.55.38', NULL, NULL, NULL),
(24, 1, 1, 'тест', '+7 (926) 911-20-56', 'тест тест ', '2020-01-16 12:21:34', '89.221.55.38', NULL, NULL, NULL),
(25, 3, 1, 'тест', '+7 (926) 911-20-56', NULL, '2020-01-16 12:21:45', '89.221.55.38', NULL, NULL, NULL),
(26, 3, 3, 'test', '+7 (111) 111-11-11', NULL, '2020-01-16 12:39:35', '109.254.181.147', NULL, NULL, NULL),
(27, 3, 3, 'Тест123', '+7 (111) 111-11-11', NULL, '2020-01-16 12:46:31', '109.254.181.147', NULL, NULL, NULL);

-- --------------------------------------------------------

--
-- Структура таблицы `forms_id`
--

CREATE TABLE `forms_id` (
  `id` int(11) UNSIGNED NOT NULL,
  `name` varchar(50) DEFAULT '',
  `fields` text,
  `validation` text
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `forms_id`
--

INSERT INTO `forms_id` (`id`, `name`, `fields`, `validation`) VALUES
(1, 'Опредились с выбором?', NULL, NULL),
(2, 'Оставить заявку', NULL, NULL),
(3, 'Заказать обратный звонок', NULL, NULL);

-- --------------------------------------------------------

--
-- Структура таблицы `forms_status`
--

CREATE TABLE `forms_status` (
  `id` int(11) UNSIGNED NOT NULL,
  `name` varchar(50) DEFAULT ''
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `forms_status`
--

INSERT INTO `forms_status` (`id`, `name`) VALUES
(1, 'Новая'),
(2, 'Одобрена'),
(3, 'На обработке'),
(4, 'Обработана'),
(5, 'Отклонена');

-- --------------------------------------------------------

--
-- Структура таблицы `fragments`
--

CREATE TABLE `fragments` (
  `id` int(11) NOT NULL,
  `name` varchar(300) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `cat_id` int(11) NOT NULL DEFAULT '0',
  `image` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `content_1_type` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `content_1` text CHARACTER SET utf8 COLLATE utf8_bin,
  `content_2_type` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `content_2` text CHARACTER SET utf8 COLLATE utf8_bin,
  `content_3_type` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `content_3` text CHARACTER SET utf8 COLLATE utf8_bin,
  `content_4_type` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `content_4` text CHARACTER SET utf8 COLLATE utf8_bin,
  `sort_index` int(11) NOT NULL DEFAULT '0',
  `post_status` tinyint(1) NOT NULL DEFAULT '0',
  `hit` tinyint(1) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `fragments`
--

INSERT INTO `fragments` (`id`, `name`, `cat_id`, `image`, `content_1_type`, `content_1`, `content_2_type`, `content_2`, `content_3_type`, `content_3`, `content_4_type`, `content_4`, `sort_index`, `post_status`, `hit`) VALUES
(1, 'Корпоративный отдых', 2, '/assets/fragments/briefcase.png', 'text', '<p>все условия для деловых <br /> встреч и конференций</p>', 'html', '', 'html', '', 'html', '', 400, 1, 0),
(2, '2 недели', 2, '/assets/fragments/2-nedeli.png', 'text', '<p>средний срок <br /> аренды коттеджа</p>', 'html', '', 'html', '', 'html', '', 300, 1, 0),
(3, 'Консультация ', 2, '/assets/fragments/like.png', 'text', '<p>предоставляем персонального<br /> менеджера по организации <br /> вашего отдыха</p>', 'html', '', 'html', '', 'html', '', 200, 1, 0),
(4, 'Безопасность', 2, '/assets/fragments/security.png', 'text', '<p>огражденная территория<br /> с постоянным контролем</p>', 'html', '', 'html', '', 'html', '', 100, 1, 0),
(5, 'Отдых', 3, '/assets/fragments/relax.jpeg', 'text', '<p class=\"a\">Шеф-повар усадьбы Александрово готов удивлять гостей необычными блюдами исконно русской кухни. Яства, достойные царей, и традиционные напитки придадут особого вкуса отдыху.</p>', 'html', '', 'html', '', 'html', '', 300, 1, 0),
(6, 'Развлечения ', 3, '/assets/fragments/entertaimant.jpg', 'text', '<p class=\"a\">Всех гостей мы встречаем на санях или повозках, зависит от времени года. А в свободное время найдется развлечение на любой вкус: бильярд, аэрохоккей или настольный теннис. Любителям спорта также не будет скучно, ведь на территории работает оборудованный спортивный зал.</p>', 'html', '', 'html', '', 'html', '', 200, 1, 0),
(7, 'СПА', 3, '/assets/fragments/spa.jpg', 'text', '<p class=\"a\">Сибирский чан или русская баня &ndash; наш народ издавна знал толк в спа-процедурах. Они помогут восстановить силы и придать организму энергии на год вперед. В любое время года гости могут прочувствовать живительные возможности русского СПА на себе.</p>', 'html', '', 'html', '', 'html', '', 100, 1, 0),
(8, 'Александров Андрей', 4, '/assets/fragments/11.png', 'html', 'Администратор', 'html', '', 'html', '', 'html', '', 0, 1, 0),
(9, 'Брагунец Александр', 4, '/assets/fragments/21.png', 'html', 'Дворецкий', 'html', '', 'html', '', 'html', '', 0, 1, 0),
(10, 'Чудновцева Марина', 4, '/assets/fragments/31.png', 'html', 'Клиент менеджер', 'html', '', 'html', '', 'html', '', 0, 1, 0),
(11, 'Александров Владимир', 4, '/assets/fragments/41.png', 'html', 'Садовник', 'html', '', 'html', '', 'html', '', 0, 1, 0),
(12, 'Александров Андрей', 4, '/assets/fragments/12.png', 'html', 'Администратор', 'html', '', 'html', '', 'html', '', 0, 1, 0),
(13, 'Брагунец Александр', 4, '/assets/fragments/22.png', 'html', 'Дворецкий', 'html', '', 'html', '', 'html', '', 0, 1, 0),
(14, 'Чудновцева Марина', 4, '/assets/fragments/32.png', 'html', 'Клиент менеджер', 'html', '', 'html', '', 'html', '', 0, 1, 0),
(15, 'Александров Владимир', 4, '/assets/fragments/42.png', 'html', 'Садовник', 'html', '', 'html', '', 'html', '', 0, 1, 0);

-- --------------------------------------------------------

--
-- Структура таблицы `fragment_category`
--

CREATE TABLE `fragment_category` (
  `id` int(11) NOT NULL,
  `name` varchar(300) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `parent_id` int(11) NOT NULL DEFAULT '0',
  `image` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `content_1_type` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `content_1` text CHARACTER SET utf8 COLLATE utf8_bin,
  `content_2_type` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `content_2` text CHARACTER SET utf8 COLLATE utf8_bin,
  `content_3_type` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `content_3` text CHARACTER SET utf8 COLLATE utf8_bin,
  `sort_index` int(11) NOT NULL DEFAULT '0',
  `post_status` tinyint(1) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `fragment_category`
--

INSERT INTO `fragment_category` (`id`, `name`, `parent_id`, `image`, `content_1_type`, `content_1`, `content_2_type`, `content_2`, `content_3_type`, `content_3`, `sort_index`, `post_status`) VALUES
(1, 'Коротко о компании', 0, '/assets/catalogs/Главная.jpg', 'text', '<div style=\"align-self: flex-start;\">\n<p class=\"a\">Традиционные русские дома &ndash; это уют и тепло. В них происходит единение человека и природы, предков и ныне живущих. Расположенная в живописной Тульской области усадьба Александрово &ndash; место, где каждый получает возможность вернуться к истокам.</p>\n<p class=\"a\">&nbsp;</p>\n<p class=\"a\">Комфортные домики для отдыха, выполненные в традиционном стиле, станут отличным вариантом как для отпуска, так и для торжественных мероприятий. При этом нет необходимости далеко выезжать, ведь усадьба расположилась на территории лесного хозяйства в городской черте.</p>\n<p class=\"a\">&nbsp;</p>\n<p class=\"a\">Гостей, которые остановились в Александрово, утром встречает пение птиц и ослепительные солнечные лучи. Воздух пропитан ароматами дерева и свежих растений, а великолепные блюда от нашего шеф-повара дополнять атмосферу прекрасного начала дня.</p>\n</div>', 'html', '', 'html', '', 0, 1),
(2, 'Наши преимущества', 0, '', 'html', '', 'html', '', 'html', '', 0, 1),
(3, 'Услуги компании', 0, '', 'html', '', 'html', '', 'html', '', 0, 1),
(4, 'Наши сотрудники', 0, '', 'html', '', 'html', '', 'html', '', 0, 1);

-- --------------------------------------------------------

--
-- Структура таблицы `log`
--

CREATE TABLE `log` (
  `id` int(11) NOT NULL,
  `user_id` int(11) DEFAULT NULL,
  `user_name` varchar(64) NOT NULL DEFAULT '',
  `message` varchar(255) NOT NULL DEFAULT '',
  `date` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `log`
--

INSERT INTO `log` (`id`, `user_id`, `user_name`, `message`, `date`) VALUES
(1, 5, 'Administrator', 'Страница сохранена: Услуги ', '2018-10-22 15:16:59'),
(2, 5, 'Administrator', 'Слайдер \"Теперь будущее <br>еще доступней!\" сохранен', '2018-10-22 15:17:20'),
(3, 5, 'Administrator', 'Слайдер \"Теперь будущее <br>еще доступней!\" сохранен', '2018-10-22 15:17:26'),
(4, 5, 'Administrator', 'Страница сохранена: Услуги ', '2018-10-22 15:20:20'),
(5, 5, 'Administrator', 'Фрагмент сохранен: Подбор запчастей и ремонт <br>на нашем СТО ', '2018-10-23 10:43:21'),
(6, 5, 'Administrator', 'Фрагмент сохранен: Подбор запчастей и ремонт <br>на нашем СТО ', '2018-10-23 10:49:11'),
(7, 5, 'Administrator', 'Фрагмент сохранен: Подбор запчастей и ремонт <br>на нашем СТО ', '2018-10-23 10:53:51'),
(8, 5, 'Administrator', 'Данные пользователя: Administrator сохранены', '2019-01-31 12:59:37'),
(9, 5, 'Administrator', 'Данные пользователя: Administrator сохранены', '2019-01-31 13:09:17'),
(10, 5, 'Administrator', 'Конфигурация сайта сохранена', '2019-11-18 15:22:23'),
(11, 5, 'Administrator', 'Слайдер \"Сдаем в аренду <br> коттеджи от <br> 10т. руб. в сутки\" сохранен', '2019-11-18 16:08:32'),
(12, 5, 'Administrator', 'Слайдер \"Сдаем в аренду <br> коттеджи от <br> 10т. руб. в сутки\" сохранен', '2019-11-18 16:11:12'),
(13, 5, 'Administrator', 'Слайдер \"Сдаем в аренду <br> коттеджи от <br> 10т. руб. в сутки\" сохранен', '2019-11-18 16:20:33'),
(14, 5, 'Administrator', 'Слайдер \"Сдаем в аренду <br> коттеджи от <br> 10т. руб. в сутки\" сохранен', '2019-11-18 16:21:55'),
(15, 5, 'Administrator', 'Фрагмент сохранен: Корпоративный отдых ', '2019-11-18 17:06:30'),
(16, 5, 'Administrator', 'Фрагмент сохранен: 2 недели ', '2019-11-18 17:07:37'),
(17, 5, 'Administrator', 'Фрагмент сохранен: Консультация  ', '2019-11-18 17:08:30'),
(18, 5, 'Administrator', 'Фрагмент сохранен: Безопасность ', '2019-11-18 17:09:24'),
(19, 5, 'Administrator', 'Категория сохранена: Коротко о компании ', '2019-11-18 17:13:37'),
(20, 5, 'Administrator', 'Категория сохранена: Коротко о компании ', '2019-11-18 17:14:23'),
(21, 5, 'Administrator', 'Категория сохранена: Коротко о компании ', '2019-11-18 17:14:40'),
(22, 5, 'Administrator', 'Страница сохранена: О нас ', '2019-11-19 09:20:06'),
(23, 5, 'Administrator', 'Фрагмент сохранен: Александров Андрей ', '2019-11-19 09:21:55'),
(24, 5, 'Administrator', 'Фрагмент сохранен: Брагунец Александр ', '2019-11-19 09:22:06'),
(25, 5, 'Administrator', 'Фрагмент сохранен: Чудновцева Марина ', '2019-11-19 09:22:16'),
(26, 5, 'Administrator', 'Фрагмент сохранен: Александров Владимир ', '2019-11-19 09:22:33'),
(27, 5, 'Administrator', 'Фрагмент сохранен: Александров Андрей ', '2019-11-19 09:22:48'),
(28, 5, 'Administrator', 'Фрагмент сохранен: Брагунец Александр ', '2019-11-19 09:27:06'),
(29, 5, 'Administrator', 'Фрагмент сохранен: Чудновцева Марина ', '2019-11-19 09:27:10'),
(30, 5, 'Administrator', 'Фрагмент сохранен: Александров Владимир ', '2019-11-19 09:27:20'),
(31, 5, 'Administrator', 'Страница сохранена: Услуги ', '2019-11-19 09:33:12'),
(32, 5, 'Administrator', 'Страница сохранена: Услуги ', '2019-11-19 09:34:15'),
(33, 5, 'Administrator', 'Галлерея сохранена: Галерея коттеджей ', '2019-11-19 10:01:02'),
(34, 5, 'Administrator', 'Галлерея сохранена: Галерея коттеджей ', '2019-11-19 10:01:13'),
(35, 5, 'Administrator', 'Пункт меню ID#4 сохранен', '2019-11-19 10:02:54'),
(36, 5, 'Administrator', 'Слайдер \"Сдаем в аренду <br> коттеджи от <br> 10т. руб. в сутки\" сохранен', '2019-11-19 10:04:23'),
(37, 5, 'Administrator', 'Слайдер \"Сдаем в аренду <br> коттеджи от <br> 10т. руб. в сутки\" сохранен', '2019-11-19 10:04:30'),
(38, 5, 'Administrator', 'Страница сохранена: Главная ', '2019-11-19 10:45:20'),
(39, 5, 'Administrator', 'Страница сохранена: Главная ', '2019-11-19 10:45:52'),
(40, 5, 'Administrator', 'Страница сохранена: Главная ', '2019-11-19 10:46:53'),
(41, 5, 'Administrator', 'Страница сохранена: Главная ', '2019-11-19 10:49:28'),
(42, 5, 'Administrator', 'Блок \"Галерея авто\" сохранен', '2019-11-19 10:53:28'),
(43, 5, 'Administrator', 'Фрагмент сохранен: Отдых ', '2019-11-19 10:56:03'),
(44, 5, 'Administrator', 'Фрагмент сохранен: Развлечения  ', '2019-11-19 10:58:39'),
(45, 5, 'Administrator', 'Фрагмент сохранен: СПА ', '2019-11-19 11:18:53'),
(46, 5, 'Administrator', 'Конфигурация сайта сохранена', '2019-11-19 11:25:44'),
(47, 5, 'Administrator', 'Конфигурация сайта сохранена', '2019-11-19 11:26:00'),
(48, 5, 'Administrator', 'Конфигурация сайта сохранена', '2019-11-19 11:36:12'),
(49, 5, 'Administrator', 'Фрагмент сохранен: Отдых ', '2019-11-21 14:43:38'),
(50, 5, 'Administrator', 'Фрагмент сохранен: Развлечения  ', '2019-11-21 14:43:53'),
(51, 5, 'Administrator', 'Фрагмент сохранен: СПА ', '2019-11-21 14:44:04'),
(52, 5, 'Administrator', 'Категория сохранена: Коротко о компании ', '2019-11-21 14:47:25'),
(53, 5, 'Administrator', 'Галлерея сохранена: Галерея коттеджей ', '2019-11-25 09:45:07'),
(54, 5, 'Administrator', 'Галлерея сохранена: Галерея коттеджей ', '2019-11-25 09:48:26'),
(55, 5, 'Administrator', 'Конфигурация сайта сохранена', '2019-11-25 14:44:11'),
(56, 5, 'Administrator', 'Страница сохранена: Главная ', '2019-11-26 12:34:23'),
(57, 5, 'Administrator', 'Фрагмент сохранен: СПА ', '2019-11-26 12:35:26'),
(58, 5, 'Administrator', 'Фрагмент сохранен: Развлечения  ', '2019-11-26 12:36:01'),
(59, 5, 'Administrator', 'Фрагмент сохранен: Отдых ', '2019-11-26 12:36:30'),
(60, 5, 'Administrator', 'Категория сохранена: Коротко о компании ', '2019-11-26 12:39:52'),
(61, 5, 'Administrator', 'Категория сохранена: Коротко о компании ', '2019-11-26 12:40:25'),
(62, 5, 'Administrator', 'Категория сохранена: Коротко о компании ', '2019-11-26 12:41:02'),
(63, 5, 'Administrator', 'Категория сохранена: Коротко о компании ', '2019-11-26 12:42:03'),
(64, 5, 'Administrator', 'Страница сохранена: О нас ', '2019-11-26 12:44:16'),
(65, 5, 'Administrator', 'Страница сохранена: Услуги ', '2019-11-26 12:51:52'),
(66, 5, 'Administrator', 'Страница сохранена: Услуги ', '2019-11-26 12:54:44'),
(67, 5, 'Administrator', 'Страница сохранена: Услуги ', '2019-11-26 16:12:15'),
(68, 5, 'Administrator', 'Страница сохранена: Услуги ', '2019-11-26 16:13:19'),
(69, 5, 'Administrator', 'Страница сохранена: Услуги ', '2019-11-26 16:15:13'),
(70, 5, 'Administrator', 'Страница сохранена: Услуги ', '2019-11-26 16:17:42'),
(71, 5, 'Administrator', 'Страница сохранена: Услуги ', '2019-11-26 16:19:01'),
(72, 5, 'Administrator', 'Страница сохранена: Услуги ', '2019-11-26 16:20:46'),
(73, 5, 'Administrator', 'Страница сохранена: Услуги ', '2019-11-26 16:21:38'),
(74, 5, 'Administrator', 'Страница сохранена: Услуги ', '2019-11-26 16:22:53'),
(75, 5, 'Administrator', 'Страница сохранена: Услуги ', '2019-11-26 16:23:41'),
(76, 5, 'Administrator', 'Страница сохранена: Услуги ', '2019-11-26 16:24:44'),
(77, 5, 'Administrator', 'Страница сохранена: Услуги ', '2019-11-26 16:30:10'),
(78, 5, 'Administrator', 'Страница сохранена: Услуги ', '2019-11-26 16:31:40'),
(79, 5, 'Administrator', 'Страница сохранена: Услуги ', '2019-11-26 16:40:04'),
(80, 5, 'Administrator', 'Страница сохранена: Услуги ', '2019-11-26 16:41:09'),
(81, 5, 'Administrator', 'Страница сохранена: Услуги ', '2019-11-26 16:42:21'),
(82, 5, 'Administrator', 'Страница сохранена: Услуги ', '2019-11-26 16:50:11'),
(83, 5, 'Administrator', 'Страница сохранена: Услуги ', '2019-11-26 16:54:46'),
(84, 5, 'Administrator', 'Страница сохранена: Услуги ', '2019-11-26 16:58:37'),
(85, 5, 'Administrator', 'Страница сохранена: Услуги ', '2019-11-26 16:59:22'),
(86, 5, 'Administrator', 'Страница сохранена: Услуги ', '2019-11-26 17:01:03'),
(87, 5, 'Administrator', 'Страница сохранена: Услуги ', '2019-11-26 17:15:53'),
(88, 5, 'Administrator', 'Страница сохранена: Услуги ', '2019-11-26 17:18:50'),
(89, 5, 'Administrator', 'Страница сохранена: Услуги ', '2019-11-26 17:23:18'),
(90, 5, 'Administrator', 'Страница сохранена: Услуги ', '2019-11-26 17:33:07'),
(91, 5, 'Administrator', 'Страница сохранена: Услуги ', '2019-11-26 17:36:07'),
(92, 5, 'Administrator', 'Страница сохранена: Услуги ', '2019-11-26 17:38:12'),
(93, 5, 'Administrator', 'Страница сохранена: Услуги ', '2019-11-26 17:41:28'),
(94, 5, 'Administrator', 'Страница сохранена: Услуги ', '2019-11-26 17:42:07'),
(95, 5, 'Administrator', 'Страница сохранена: Услуги ', '2019-11-26 17:43:12'),
(96, 5, 'Administrator', 'Страница сохранена: Услуги ', '2019-11-26 18:00:13'),
(97, 5, 'Administrator', 'Конфигурация сайта сохранена', '2019-11-27 09:26:28'),
(98, 5, 'Administrator', 'Конфигурация сайта сохранена', '2019-11-27 09:42:23'),
(99, 5, 'Administrator', 'Страница сохранена: Услуги ', '2019-12-04 13:02:28'),
(100, 5, 'Administrator', 'Страница сохранена: Услуги ', '2019-12-04 13:03:41'),
(101, 5, 'Administrator', 'Слайдер \"Новый год в<br>русских<br>традициях\" сохранен', '2019-12-06 10:31:15'),
(102, 5, 'Administrator', 'Слайдер \"Сдаем в аренду <br> коттеджи от <br> 10т. руб. в сутки\" сохранен', '2019-12-06 10:33:02'),
(103, 5, 'Administrator', 'Слайдер \"отдых для всей семьи\" сохранен', '2019-12-06 10:34:13'),
(104, 5, 'Administrator', 'Слайдер \"согрей душу и тело <br>холодной зимой<br> в настоящем<br>сибирском чане\" сохранен', '2019-12-06 10:36:53'),
(105, 5, 'Administrator', 'Слайдер \"отдых, покоривший<br>сердца всей семьи\" сохранен', '2019-12-06 10:40:02'),
(106, 5, 'Administrator', 'Страница сохранена: Услуги ', '2019-12-06 11:22:59'),
(107, 5, 'Administrator', 'Страница сохранена: Услуги ', '2019-12-06 12:19:04'),
(108, 5, 'Administrator', 'Страница сохранена: Услуги ', '2019-12-06 12:19:47'),
(109, 5, 'Administrator', 'Страница сохранена: Услуги ', '2019-12-06 12:20:03'),
(110, 5, 'Administrator', 'Страница сохранена: Услуги ', '2019-12-06 12:21:06'),
(111, 5, 'Administrator', 'Пункт меню ID# сохранен', '2019-12-16 11:53:33'),
(112, 5, 'Administrator', 'Пункт меню ID#11 сохранен', '2019-12-16 11:54:50'),
(113, 5, 'Administrator', 'Пункт меню ID#11 сохранен', '2019-12-16 11:55:00'),
(114, 5, 'Administrator', 'Страница сохранена: Домик &quot;Хижина&quot; ', '2019-12-16 12:01:09'),
(115, 5, 'Administrator', 'Страница сохранена: Коттедж 2 ', '2019-12-16 12:19:13'),
(116, 5, 'Administrator', 'Страница сохранена: Котеджи ', '2019-12-16 12:28:51'),
(117, 5, 'Administrator', 'Страницы удалены 1 шт.', '2019-12-16 12:32:55'),
(118, 5, 'Administrator', 'Страница сохранена: Домик &quot;Хижина&quot; ', '2019-12-16 12:36:04'),
(119, 5, 'Administrator', 'Страница сохранена: Домик &quot;Хижина&quot; ', '2019-12-16 12:36:16'),
(120, 5, 'Administrator', 'Страница сохранена: Домик &quot;Хижина&quot; ', '2019-12-16 12:43:08'),
(121, 5, 'Administrator', 'Страница сохранена: Домик &quot;Хижина&quot; ', '2019-12-16 12:44:44'),
(122, 5, 'Administrator', 'Страница сохранена: test2 ', '2019-12-16 12:49:03'),
(123, 5, 'Administrator', 'Страницы удалены 1 шт.', '2019-12-16 12:55:52'),
(124, 5, 'Administrator', 'Страница сохранена: test2 ', '2019-12-16 12:56:31'),
(125, 5, 'Administrator', 'Страница сохранена: test2 ', '2019-12-16 12:56:41'),
(126, 5, 'Administrator', 'Страница сохранена: test2 ', '2019-12-16 12:57:16'),
(127, 5, 'Administrator', 'Страница сохранена: test2 ', '2019-12-16 12:57:26'),
(128, 5, 'Administrator', 'Страницы удалены 1 шт.', '2019-12-16 13:01:45'),
(129, 5, 'Administrator', 'Страница сохранена: test2 ', '2019-12-16 14:16:20'),
(130, 5, 'Administrator', 'Страницы удалены 1 шт.', '2019-12-16 14:26:21'),
(131, 5, 'Administrator', 'Страница сохранена: Домик &quot;Звездочет&quot; ', '2019-12-16 14:27:22'),
(132, 5, 'Administrator', 'Страница сохранена: Домик &quot;Удачный&quot; ', '2019-12-16 14:27:35'),
(133, 5, 'Administrator', 'Страница сохранена: Домик &quot;Звездочет&quot; ', '2019-12-16 14:30:54'),
(134, 5, 'Administrator', 'Страница сохранена: Домик &quot;Удачный&quot; ', '2019-12-16 14:31:02'),
(135, 5, 'Administrator', 'Страница сохранена: Домик &quot;Звездочет&quot;1 ', '2019-12-17 11:18:16'),
(136, 5, 'Administrator', 'Страница сохранена: Домик &quot;Звездочет&quot;1 ', '2019-12-17 11:18:34'),
(137, 5, 'Administrator', 'Страница сохранена: Домик &quot;Звездочет&quot; ', '2019-12-17 11:21:42'),
(138, 5, 'Administrator', 'Страница сохранена: Домик &quot;Удачный&quot; ', '2019-12-17 11:24:50'),
(139, 5, 'Administrator', 'Страница сохранена: Домик &quot;Удачный&quot; ', '2019-12-17 11:25:15'),
(140, 5, 'Administrator', 'Страница сохранена: Домик &quot;Хижина&quot; ', '2019-12-17 11:27:15'),
(141, 5, 'Administrator', 'Страница сохранена: Талдом ', '2019-12-17 11:28:21'),
(142, 5, 'Administrator', 'Страница сохранена: Хижина ', '2019-12-17 11:28:32'),
(143, 5, 'Administrator', 'Страница сохранена: Удачный ', '2019-12-17 11:28:41'),
(144, 5, 'Administrator', 'Страница сохранена: Звездочет ', '2019-12-17 11:28:49'),
(145, 5, 'Administrator', 'Страница сохранена: Талдом ', '2019-12-17 11:32:13'),
(146, 5, 'Administrator', 'Страница сохранена: Звездочет ', '2019-12-17 11:38:16'),
(147, 5, 'Administrator', 'Страница сохранена: Домик &quot;Хижина&quot; ', '2019-12-17 11:38:59'),
(148, 5, 'Administrator', 'Страница сохранена: Удачный ', '2019-12-17 11:41:27'),
(149, 5, 'Administrator', 'Страница сохранена: Удачный ', '2019-12-17 11:41:48'),
(150, 5, 'Administrator', 'Страница сохранена: Звездочет ', '2019-12-17 11:42:01'),
(151, 5, 'Administrator', 'Страница сохранена: Звездочет ', '2019-12-17 11:42:59'),
(152, 5, 'Administrator', 'Страница сохранена: Звездочет ', '2019-12-17 11:43:42'),
(153, 5, 'Administrator', 'Страница сохранена: Звездочет ', '2019-12-17 11:48:05'),
(154, 5, 'Administrator', 'Страница сохранена: Звездочет ', '2019-12-17 11:57:01'),
(155, 5, 'Administrator', 'Страница сохранена: Звездочет ', '2019-12-17 11:57:35'),
(156, 5, 'Administrator', 'Страница сохранена: Звездочет ', '2019-12-17 11:59:19'),
(157, 5, 'Administrator', 'Страница сохранена: Звездочет ', '2019-12-17 12:00:51'),
(158, 5, 'Administrator', 'Страница сохранена: Звездочет ', '2019-12-17 12:02:07'),
(159, 5, 'Administrator', 'Страница сохранена: Удачный ', '2019-12-17 12:05:45'),
(160, 5, 'Administrator', 'Страница сохранена: Хижина ', '2019-12-17 12:05:57'),
(161, 5, 'Administrator', 'Страница сохранена: Хижина ', '2019-12-17 12:12:43'),
(162, 5, 'Administrator', 'Страница сохранена: Звездочет ', '2019-12-17 12:12:58'),
(163, 5, 'Administrator', 'Страница сохранена: Удачный ', '2019-12-17 12:15:51'),
(164, 5, 'Administrator', 'Страница сохранена: Хижина ', '2019-12-17 12:17:36'),
(165, 5, 'Administrator', 'Страница сохранена: Хижина ', '2019-12-17 12:19:53'),
(166, 5, 'Administrator', 'Страница сохранена: Талдом ', '2019-12-17 12:21:02'),
(167, 5, 'Administrator', 'Страница сохранена: Талдом ', '2019-12-17 12:26:13'),
(168, 5, 'Administrator', 'Страница сохранена: Звездочет ', '2019-12-17 12:27:02'),
(169, 5, 'Administrator', 'Страница сохранена: Звездочет ', '2019-12-17 12:27:17'),
(170, 5, 'Administrator', 'Страница сохранена: Удачный ', '2019-12-17 12:27:31'),
(171, 5, 'Administrator', 'Страница сохранена: Хижина ', '2019-12-17 12:27:53'),
(172, 5, 'Administrator', 'Страница сохранена: Хижина ', '2019-12-17 12:28:09'),
(173, 5, 'Administrator', 'Страница сохранена: Хижина ', '2019-12-17 12:28:20'),
(174, 5, 'Administrator', 'Страница сохранена: Талдом ', '2019-12-17 12:28:34'),
(175, 5, 'Administrator', 'Страница сохранена: Удачный ', '2019-12-17 12:29:35'),
(176, 5, 'Administrator', 'Страница сохранена: Удачный ', '2019-12-17 12:32:05'),
(177, 5, 'Administrator', 'Пункт меню ID#9 сохранен', '2019-12-17 14:27:39'),
(178, 5, 'Administrator', 'Фрагмент сохранен: Безопасность ', '2019-12-17 14:29:02'),
(179, 5, 'Administrator', 'Конфигурация сайта сохранена', '2019-12-17 15:20:31'),
(180, 5, 'Administrator', 'Конфигурация сайта сохранена', '2019-12-17 15:50:37'),
(181, 5, 'Administrator', 'Страница сохранена: Звездочет ', '2019-12-17 16:42:07'),
(182, 5, 'Administrator', 'Страница сохранена: Звездочет ', '2019-12-17 16:42:52'),
(183, 5, 'Administrator', 'Страница сохранена: Удачный ', '2019-12-17 16:43:49'),
(184, 5, 'Administrator', 'Страница сохранена: Хижина ', '2019-12-17 16:44:08'),
(185, 5, 'Administrator', 'Страница сохранена: Талдом ', '2019-12-17 16:44:26'),
(186, 5, 'Administrator', 'Страница сохранена: Талдом ', '2019-12-17 16:45:20'),
(187, 5, 'Administrator', 'Галлерея сохранена: Галерея домов ', '2019-12-18 10:18:55'),
(188, 5, 'Administrator', 'Страница сохранена: Главная ', '2019-12-18 10:21:26'),
(189, 5, 'Administrator', 'Галлерея сохранена: Галерея ', '2019-12-18 10:21:34'),
(190, 5, 'Administrator', 'Блок \"Галерея авто\" сохранен', '2019-12-18 10:36:08'),
(191, 5, 'Administrator', 'Заявки удалены 10 шт.', '2019-12-18 14:32:49'),
(192, 5, 'Administrator', 'Заявки удалены 1 шт.', '2019-12-18 14:55:59'),
(193, 5, 'Administrator', 'Конфигурация сайта сохранена', '2019-12-18 15:00:52'),
(194, 5, 'Administrator', 'Галлерея сохранена: Праздничная программа ', '2019-12-26 17:15:03'),
(195, 5, 'Administrator', 'Галлерея сохранена: Праздничная программа ', '2019-12-26 17:32:01'),
(196, 5, 'Administrator', 'Галлерея сохранена: Праздничная программа ', '2019-12-26 17:33:26'),
(197, 5, 'Administrator', 'Галлерея сохранена: Праздничная программа ', '2019-12-26 17:34:30'),
(198, 5, 'Administrator', 'Галлерея сохранена: Праздничная программа ', '2019-12-26 17:35:10'),
(199, 5, 'Administrator', 'Галлерея сохранена: Праздничная программа ', '2019-12-26 17:49:16'),
(200, 5, 'Administrator', 'Слайдер \"Программа новогодних праздников в Усадьбе\" сохранен', '2019-12-27 11:50:56'),
(201, 5, 'Administrator', 'Слайдер \"Программа новогодних<br>праздников в Усадьбе\" сохранен', '2019-12-27 11:55:56'),
(202, 5, 'Administrator', 'Конфигурация сайта сохранена', '2020-01-13 12:43:37'),
(203, 5, 'Administrator', 'Конфигурация сайта сохранена', '2020-01-14 14:17:25'),
(204, 5, 'Administrator', 'Виджет соц.сети сохранен', '2020-01-14 14:27:56'),
(205, 5, 'Administrator', 'Страница сохранена: Звездочет ', '2020-01-16 11:24:27'),
(206, 5, 'Administrator', 'Страница сохранена: Звездочет ', '2020-01-16 11:25:56'),
(207, 5, 'Administrator', 'Страница сохранена: Удачный ', '2020-01-16 11:26:45'),
(208, 5, 'Administrator', 'Страница сохранена: Хижина ', '2020-01-16 11:27:18'),
(209, 5, 'Administrator', 'Страница сохранена: Талдом ', '2020-01-16 11:27:57'),
(210, 5, 'Administrator', 'Страница сохранена: Хижина ', '2020-01-16 11:28:28'),
(211, 5, 'Administrator', 'Страница сохранена: Удачный ', '2020-01-16 11:28:45'),
(212, 5, 'Administrator', 'Конфигурация сайта сохранена', '2020-01-16 12:28:48'),
(213, 5, 'Administrator', 'Конфигурация сайта сохранена', '2020-01-16 14:31:38'),
(214, 5, 'Administrator', 'Конфигурация сайта сохранена', '2020-01-16 15:29:56');

-- --------------------------------------------------------

--
-- Структура таблицы `menus`
--

CREATE TABLE `menus` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `menu_name` varchar(50) NOT NULL,
  `description` text
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `menus`
--

INSERT INTO `menus` (`id`, `name`, `menu_name`, `description`) VALUES
(7, 'Главное меню', 'main_menu', ''),
(8, 'Меню в подвале', 'footer_menu', '');

-- --------------------------------------------------------

--
-- Структура таблицы `menus_data`
--

CREATE TABLE `menus_data` (
  `id` int(11) NOT NULL,
  `menu_id` int(11) NOT NULL,
  `name` varchar(64) NOT NULL,
  `parent_id` varchar(10) DEFAULT NULL,
  `url` varchar(255) DEFAULT NULL,
  `order` int(10) DEFAULT NULL,
  `visible` tinyint(4) DEFAULT NULL,
  `menu_type` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `menus_data`
--

INSERT INTO `menus_data` (`id`, `menu_id`, `name`, `parent_id`, `url`, `order`, `visible`, `menu_type`) VALUES
(1, 7, 'Главная', '0', '/', 1, 1, 'url'),
(2, 7, 'О нас', '0', '/page/o-nas', 2, 1, 'page'),
(3, 7, 'Услуги', '0', '/page/uslugi', 3, 1, 'page'),
(4, 7, 'Галерея', '0', '/gallery/galereya-kottedjey', 4, 1, 'url'),
(5, 7, 'Контакты', '0', '/page/kontaktyi', 5, 1, 'page'),
(6, 8, 'Главная', '0', '/', 1, 1, 'url'),
(7, 8, 'О нас', '0', '/page/o-nas', 2, 1, 'page'),
(8, 8, 'Услуги', '0', '/page/uslugi', 3, 1, 'page'),
(9, 8, 'Галерея', '0', '/gallery/galereya-kottedjey', 4, 1, 'url'),
(10, 8, 'Контакты', '0', '/page/kontaktyi', 5, 1, 'page'),
(11, 7, 'Бронирование', '0', '/cottages/cottages', 1, 1, 'url');

-- --------------------------------------------------------

--
-- Структура таблицы `modules`
--

CREATE TABLE `modules` (
  `id` int(11) UNSIGNED NOT NULL,
  `name` varchar(50) NOT NULL DEFAULT '',
  `title` varchar(50) NOT NULL,
  `sub_menu` varchar(255) DEFAULT NULL,
  `description` text,
  `ordering` int(4) DEFAULT '0',
  `in_menu` int(1) DEFAULT NULL,
  `icon` varchar(50) DEFAULT NULL,
  `type` varchar(10) NOT NULL,
  `author` varchar(255) DEFAULT NULL,
  `version` varchar(10) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `modules`
--

INSERT INTO `modules` (`id`, `name`, `title`, `sub_menu`, `description`, `ordering`, `in_menu`, `icon`, `type`, `author`, `version`) VALUES
(1, 'modules', 'Модули', 'Массив модулей-modules/show_array', NULL, 1, 1, 'cubes', 'system', 'http://csska.com', '2.1'),
(2, 'admin', 'Панель управления', '', 'Основной модуль панели администрирования.', 2, 1, 'cog', 'system', 'http://csska.com', '2.0'),
(3, 'search', 'Поиск', 'Поиск по сайту-index', 'Позволяет проводить поиск в админ-панели или на сайте', 3, 1, 'search', 'system', 'http://polyakov.co.ua', '1.0'),
(4, 'forms', 'Заявки', 'Просмотр всех заявок-index', 'Заявки', 4, 1, 'send', '', 'csska.com / polyakov.co.ua', '1.2'),
(5, 'category', 'Категории', 'Все категории-index|Редактирование категории-edit|Создание категории-add', 'Модуль позволяет создавать неограниченное колличество и любой уровень вложенности категорий.', 5, 1, 'folder-open', '', 'http://polyakov.co.ua', '2'),
(6, 'menu', 'Меню', 'Меню-index|Редактирование пункта меню-edit|Создание пункта меню-add', 'Меню сайта', 7, 1, 'tasks', '', 'http://polyakov.co.ua', '1.8'),
(7, 'page', 'Страницы', 'Все страницы-index|Редактирование страницы-edit|Создание страницы-add', 'Модуль позволяет создавать и управлять содержимым сайта.', 6, 1, 'file', '', 'http://polyakov.co.ua', '1.8'),
(8, 'settings', 'Настройки', 'Все настройки сайта-index', 'Модуль позволяет задавать настройки сайта.', 8, 1, 'gears', '', 'http://csska.com', '1.1'),
(10, 'breadcrumbs', 'Хлебные крошки', '', 'Хлебные крошки', 10, 0, 'language', 'system', 'http://polyakov.co.ua', '0.1'),
(11, 'auth', 'Пользователи', 'Управление пользователями-index|Редактирование пользователя-edit_user|Создание пользователя-create_user|Управление группами и права-groups|Редактирование группы-edit_group|Создание группы-create_group', 'Управление пользователями', 11, 1, 'group', 'system', 'http://polyakov.co.ua', '1.0'),
(12, 'common', 'Общие библиотеки для сайта', '', 'Библиотеки сайта', 12, 1, 'folder-o', 'system', 'http://polyakov.co.ua', '0.1'),
(18, 'block', 'Блоки', '', 'Блоки для сайта', 111, 1, 'th-large', 'widget', 'http://polyakov.co.ua', '1.0'),
(19, 'slider', 'Слайдер', '', 'Слайдер', 111, 1, 'slideshare', 'widget', 'http://polyakov.co.ua', '2.0'),
(20, 'share', 'Соц. сети', 'Соц.сети-modules/share', 'Социальные сети', 111, 1, 'twitter', 'widget', 'http://polyakov.co.ua', '1.0'),
(21, 'gallery', 'Галерея', '', 'Галерея', 111, 1, 'image', 'widget', 'http://polyakov.co.ua', '1.0'),
(22, 'payment', 'Системы оплаты', '', 'Модуль позволяет оплачивать товары с помощью платежных систем.', 111, 1, 'bank', '', 'http://polyakov.co.ua', '1.0'),
(28, 'fragments', 'Фрагменты', '', 'Модуль текстовых фрагментов', 111, 1, 'puzzle-piece', '', 'http://slogenitsin.av.com', '1.0'),
(29, 'cottages', 'Коттеджи', NULL, 'Модуль бронирования коттеджей', 222, 1, NULL, '', 'SOlidMike', '1.0');

-- --------------------------------------------------------

--
-- Структура таблицы `pages`
--

CREATE TABLE `pages` (
  `id` int(11) NOT NULL,
  `name` varchar(300) NOT NULL,
  `cat_id` int(11) DEFAULT NULL,
  `image` varchar(255) DEFAULT NULL,
  `content` text,
  `short_content` text,
  `meta_title` varchar(300) DEFAULT NULL,
  `meta_h1` varchar(300) DEFAULT NULL,
  `meta_description` text,
  `meta_keywords` text,
  `meta_url` varchar(130) DEFAULT NULL,
  `cat_url` varchar(255) DEFAULT NULL,
  `template` varchar(50) DEFAULT NULL,
  `created` datetime DEFAULT NULL,
  `edited` datetime DEFAULT NULL,
  `post_status` tinyint(1) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `pages`
--

INSERT INTO `pages` (`id`, `name`, `cat_id`, `image`, `content`, `short_content`, `meta_title`, `meta_h1`, `meta_description`, `meta_keywords`, `meta_url`, `cat_url`, `template`, `created`, `edited`, `post_status`) VALUES
(1, 'Главная', 0, '', '<p>Традиционное русское жилье &ndash; это не дом, лишенный удобств.</p>\n<p>Наши усадьбы строились из экологически чистых материалов, которые благотворно влияют на общее состояние организма.</p>\n<p>При этом не обязательно отказываться от благ современности, ведь все они прямо под рукой у каждого гостя Александрово.</p>', '', '', 'Удобство наших домов', '', '', 'homepage', NULL, 'page_homepage.tpl', '2017-10-27 03:10:15', '2019-12-18 10:21:04', 1),
(2, 'О нас', 0, '', '<p class=\"a\"><img style=\"float: left;\" src=\"../../../assets/widget/gallery/kottedji_(22)1.jpeg\" width=\"600\" height=\"450\" />Усадьба &laquo;Александрово&raquo; - уникальное место, где слились исконно русские традиции и современные требования к отдыху. В этих краях творил Лев Толстой, родилась святая Матрона, а неподалеку гремели сражения на Куликовом поле. Эта земля стала приютом для голубых озер и живописных лесов. Среди природного великолепия Тульской области расположились уютные домики Александрово, которые уже ждут гостей. Чтобы наше знакомство стало приятным, мы встречаем гостей на санях и телегах, а при въезде угостим настоящей медовухой.</p>\n<p class=\"a\">Следование традициям и все возможности для современного отдыха &ndash; это те качества, которые выделяют нашу усадьбу. В распоряжении гостей комнаты на 1 и 2 человека, расположенные в экологически чистых коттеджах. Уютные беседки по всей территории усадьбы ждут всех желающих провести время с близкими или очутиться наедине с природой.</p>\n<p class=\"a\">На территории усадьбы находится ресторан, где посетителям предлагаются исконно русские блюда от высококлассного шеф-повара. Традиционные яства и напитки сделают отдых в Александрово насыщенным и полным незабываемых эмоций.</p>', '', '', '', '', '', 'o-nas', NULL, '', '2018-10-17 12:15:41', '2019-11-26 12:42:39', 1),
(3, 'Услуги', 0, '', '<div style=\"margin-bottom: 20%;\">\n<p class=\"a\" style=\"text-align: justify;\">Вниманию гостей усадьбы &laquo;Александрово&raquo; предлагаются различные услуги на любой вкус.</p>\n<p class=\"a\" style=\"text-align: justify;\">&nbsp;</p>\n<h2 class=\"a\" style=\"text-align: justify;\"><img src=\"../../../assets/widget/gallery/kottedji_(5).jpeg\" alt=\"\" width=\"400\" /></h2>\n<h2 class=\"a\" style=\"text-align: justify;\">Ресторан</h2>\n<p class=\"a\" style=\"text-align: justify;\">Традиционная русская кухня в исполнении великолепного шеф-повара не оставит равнодушным никого. Блюда и напитки, рецепты которых пришли из тех времен, когда творил Лев Толстой, наполнены истинно русским характером и подарят яркие вкусовые впечатления.</p>\n<p style=\"clear: both;\">&nbsp;</p>\n<p class=\"a\" style=\"text-align: justify;\"><img src=\"../../../assets/fragments/entertaimant.jpg\" width=\"400\" height=\"300\" /></p>\n<h2 class=\"a\" style=\"text-align: justify;\">Развлечения</h2>\n<p class=\"a\" style=\"text-align: justify;\">Катание на санях и телегах, партия в бильярд и аэрохоккей &ndash; все это объединила усадьба &laquo;Александрово&raquo;. Современный человек не готов отказываться от благ общества, а потому мы сделали все, чтобы каждый нашел развлечение себе по духу. Тренажерный зал и столы для настольного тенниса также готовы к встрече гостей.</p>\n<p style=\"clear: both;\">&nbsp;</p>\n<p class=\"a\" style=\"text-align: justify;\"><img src=\"../../../assets/fragments/spa.jpg\" alt=\"\" width=\"400\" /></p>\n<h2 class=\"a\" style=\"text-align: justify;\">Спа</h2>\n<p class=\"a\" style=\"text-align: justify;\">Парная &ndash; это место очищения и придания организму сил. В усадьбе &laquo;Александрово&raquo; все желающие могут заглянуть в ароматную баньку. Также здесь расположен первый в Тульской области Сибирский чан, в котором особенно приятно проводить время зимой. Снег и холод вокруг, а в лицо летит приятный пар от горячей воды. Настоящее сибирское здоровье и прилив энергии гарантированы.</p>\n</div>\n<p>&nbsp;</p>\n<h2 style=\"text-align: center;\">Цены буднего и выходного дня!</h2>\n<div style=\"overflow: auto;\">\n<p>&nbsp;</p>\n<table style=\"width: 90%; margin: auto;\" cellspacing=\"0\" cellpadding=\"5\" align=\"center\"><colgroup> <col style=\"text-align: center;\" /> <col style=\"text-align: center;\" span=\"2\" /> <col style=\"text-align: center;\" /> <col style=\"text-align: center;\" span=\"2\" /> <col style=\"text-align: center;\" /> <col style=\"text-align: center;\" span=\"5\" /> <col style=\"text-align: center;\" /> <col style=\"text-align: center;\" /> <col style=\"text-align: center;\" /> <col style=\"text-align: center;\" /> <col style=\"text-align: center;\" /> <col style=\"text-align: center;\" /> </colgroup>\n<tbody>\n<tr style=\"background: #EAEAEA;\">\n<td style=\"border: 1px solid #ffffff; height: 66px; width: 104px; text-align: center;\" rowspan=\"2\" height=\"66\"><span style=\"font-size: 11px;\">Дом</span></td>\n<td style=\"border: 1px solid #ffffff; width: 87px; text-align: center;\" rowspan=\"2\"><span style=\"font-size: 11px;\">Площадь, м<sup>2</sup></span></td>\n<td style=\"border: 1px solid #ffffff; width: 87px; text-align: center;\" rowspan=\"2\"><span style=\"font-size: 11px;\">Количество спален</span></td>\n<td style=\"border: 1px solid #ffffff; width: 95px; text-align: center;\" rowspan=\"2\"><span style=\"font-size: 11px;\">Количество гостей</span></td>\n<td style=\"border: 1px solid #ffffff; width: 87px; text-align: center;\" rowspan=\"2\"><span style=\"font-size: 11px;\">Доп места</span></td>\n<td style=\"border: 1px solid #ffffff; width: 87px; text-align: center;\" rowspan=\"2\"><span style=\"font-size: 11px;\">Наличие сауны</span></td>\n<td style=\"border: 1px solid #ffffff; width: 85px; text-align: center;\" rowspan=\"2\"><span style=\"font-size: 11px;\">Самовар и чайный набор</span></td>\n<td style=\"border: 1px solid #ffffff; width: 87px; text-align: center;\" rowspan=\"2\"><span style=\"font-size: 11px;\">Посуда</span></td>\n<td style=\"border: 1px solid #ffffff; width: 87px; text-align: center;\" rowspan=\"2\"><span style=\"font-size: 11px;\">Микроволновая печь</span></td>\n<td style=\"border: 1px solid #ffffff; width: 87px; text-align: center;\" rowspan=\"2\"><span style=\"font-size: 11px;\">Телевизор</span></td>\n<td style=\"border: 1px solid #ffffff; width: 87px; text-align: center;\" rowspan=\"2\"><span style=\"font-size: 11px;\">Wi-Fi</span></td>\n<td style=\"border: 1px solid #ffffff; width: 87px; text-align: center;\" rowspan=\"2\"><span style=\"font-size: 11px;\">Халаты, Тапочки</span></td>\n<td style=\"border: 1px solid #ffffff; width: 295px; text-align: center;\" colspan=\"3\"><span style=\"font-size: 11px;\">Цена в будние дни (пн-чт)</span></td>\n<td style=\"border: 1px solid #ffffff; width: 276px; text-align: center;\" colspan=\"3\"><span style=\"font-size: 11px;\">Цена в выходные дни<br /> (пн-чт)</span></td>\n</tr>\n<tr style=\"background: #EAEAEA;\">\n<td style=\"border: 1px solid #ffffff; height: 21px; width: 101px; text-align: center;\" height=\"21\"><span style=\"font-size: 11px;\">Дом</span></td>\n<td style=\"border: 1px solid #ffffff; width: 107px; text-align: center;\"><span style=\"font-size: 11px;\">На человека</span></td>\n<td style=\"border: 1px solid #ffffff; width: 87px; text-align: center;\"><span style=\"font-size: 11px;\">Доп место</span></td>\n<td style=\"border: 1px solid #ffffff; width: 93px; text-align: center;\"><span style=\"font-size: 11px;\">Дом</span></td>\n<td style=\"border: 1px solid #ffffff; width: 96px; text-align: center;\"><span style=\"font-size: 11px;\">На человека</span></td>\n<td style=\"border: 1px solid #ffffff; width: 87px; text-align: center;\"><span style=\"font-size: 11px;\">Доп место</span></td>\n</tr>\n<tr style=\"background: #EAEAEA;\">\n<td style=\"border: 1px solid #ffffff; height: 33px; width: 104px; text-align: center;\" height=\"33\"><span style=\"font-size: 11px;\">ЗВЕЗДОЧЕТ</span></td>\n<td style=\"border: 1px solid #ffffff; width: 87px; text-align: center;\"><span style=\"font-size: 11px;\">108</span></td>\n<td style=\"border: 1px solid #ffffff; width: 87px; text-align: center;\"><span style=\"font-size: 11px;\">2</span></td>\n<td style=\"border: 1px solid #ffffff; width: 95px; text-align: center;\"><span style=\"font-size: 11px;\">4</span></td>\n<td style=\"border: 1px solid #ffffff; width: 87px; text-align: center;\"><span style=\"font-size: 11px;\">2</span></td>\n<td style=\"border: 1px solid #ffffff; width: 87px; text-align: center;\"><span style=\"font-size: 11px;\">ДА</span></td>\n<td style=\"border: 1px solid #ffffff; width: 85px; text-align: center;\"><span style=\"font-size: 11px;\">ДА</span></td>\n<td style=\"border: 1px solid #ffffff; width: 87px; text-align: center;\"><span style=\"font-size: 11px;\">ДА</span></td>\n<td style=\"border: 1px solid #ffffff; width: 87px; text-align: center;\"><span style=\"font-size: 11px;\">ДА</span></td>\n<td style=\"border: 1px solid #ffffff; width: 87px; text-align: center;\"><span style=\"font-size: 11px;\">ДА</span></td>\n<td style=\"border: 1px solid #ffffff; width: 87px; text-align: center;\"><span style=\"font-size: 11px;\">ДА</span></td>\n<td style=\"border: 1px solid #ffffff; width: 87px; text-align: center;\"><span style=\"font-size: 11px;\">ДА</span></td>\n<td style=\"border: 1px solid #ffffff; width: 101px; text-align: center;\"><span style=\"font-size: 11px;\">8 000 ₽</span></td>\n<td style=\"border: 1px solid #ffffff; width: 107px; text-align: center;\"><span style=\"font-size: 11px;\">2 000 ₽</span></td>\n<td style=\"border: 1px solid #ffffff; width: 87px; text-align: center;\"><span style=\"font-size: 11px;\">&nbsp;1 500 ₽</span></td>\n<td style=\"border: 1px solid #ffffff; width: 93px; text-align: center;\"><span style=\"font-size: 11px;\">10 000 ₽</span></td>\n<td style=\"border: 1px solid #ffffff; width: 96px; text-align: center;\"><span style=\"font-size: 11px;\">2 500 ₽</span></td>\n<td style=\"border: 1px solid #ffffff; width: 87px; text-align: center;\"><span style=\"font-size: 11px;\">2 000 ₽</span></td>\n</tr>\n<tr style=\"background: #EAEAEA;\">\n<td style=\"border: 1px solid #ffffff; height: 33px; width: 104px; text-align: center;\" height=\"33\"><span style=\"font-size: 11px;\">ТАЛДОМ</span></td>\n<td style=\"border: 1px solid #ffffff; width: 87px; text-align: center;\"><span style=\"font-size: 11px;\">112</span></td>\n<td style=\"border: 1px solid #ffffff; width: 87px; text-align: center;\"><span style=\"font-size: 11px;\">3</span></td>\n<td style=\"border: 1px solid #ffffff; width: 95px; text-align: center;\"><span style=\"font-size: 11px;\">6</span></td>\n<td style=\"border: 1px solid #ffffff; width: 87px; text-align: center;\"><span style=\"font-size: 11px;\">3</span></td>\n<td style=\"border: 1px solid #ffffff; width: 87px; text-align: center;\"><span style=\"font-size: 11px;\">ДА</span></td>\n<td style=\"border: 1px solid #ffffff; width: 85px; text-align: center;\"><span style=\"font-size: 11px;\">ДА</span></td>\n<td style=\"border: 1px solid #ffffff; width: 87px; text-align: center;\"><span style=\"font-size: 11px;\">ДА</span></td>\n<td style=\"border: 1px solid #ffffff; width: 87px; text-align: center;\"><span style=\"font-size: 11px;\">ДА</span></td>\n<td style=\"border: 1px solid #ffffff; width: 87px; text-align: center;\"><span style=\"font-size: 11px;\">ДА</span></td>\n<td style=\"border: 1px solid #ffffff; width: 87px; text-align: center;\"><span style=\"font-size: 11px;\">ДА</span></td>\n<td style=\"border: 1px solid #ffffff; width: 87px; text-align: center;\"><span style=\"font-size: 11px;\">ДА</span></td>\n<td style=\"border: 1px solid #ffffff; width: 101px; text-align: center;\"><span style=\"font-size: 11px;\">11 200 ₽</span></td>\n<td style=\"border: 1px solid #ffffff; width: 107px; text-align: center;\"><span style=\"font-size: 11px;\">1 867 ₽</span></td>\n<td style=\"border: 1px solid #ffffff; width: 87px; text-align: center;\"><span style=\"font-size: 11px;\">1 500 ₽</span></td>\n<td style=\"border: 1px solid #ffffff; width: 93px; text-align: center;\"><span style=\"font-size: 11px;\">14 000 ₽</span></td>\n<td style=\"border: 1px solid #ffffff; width: 96px; text-align: center;\"><span style=\"font-size: 11px;\">2 333 ₽</span></td>\n<td style=\"border: 1px solid #ffffff; width: 87px; text-align: center;\"><span style=\"font-size: 11px;\">2 000 ₽</span></td>\n</tr>\n<tr style=\"background: #EAEAEA;\">\n<td style=\"border: 1px solid #ffffff; height: 33px; width: 104px; text-align: center;\" height=\"33\"><span style=\"font-size: 11px;\">УДАЧНЫЙ</span></td>\n<td style=\"border: 1px solid #ffffff; width: 87px; text-align: center;\"><span style=\"font-size: 11px;\">132</span></td>\n<td style=\"border: 1px solid #ffffff; width: 87px; text-align: center;\"><span style=\"font-size: 11px;\">4</span></td>\n<td style=\"border: 1px solid #ffffff; width: 95px; text-align: center;\"><span style=\"font-size: 11px;\">8</span></td>\n<td style=\"border: 1px solid #ffffff; width: 87px; text-align: center;\"><span style=\"font-size: 11px;\">4</span></td>\n<td style=\"border: 1px solid #ffffff; width: 87px; text-align: center;\"><span style=\"font-size: 11px;\">ДА</span></td>\n<td style=\"border: 1px solid #ffffff; width: 85px; text-align: center;\"><span style=\"font-size: 11px;\">ДА</span></td>\n<td style=\"border: 1px solid #ffffff; width: 87px; text-align: center;\"><span style=\"font-size: 11px;\">ДА</span></td>\n<td style=\"border: 1px solid #ffffff; width: 87px; text-align: center;\"><span style=\"font-size: 11px;\">ДА</span></td>\n<td style=\"border: 1px solid #ffffff; width: 87px; text-align: center;\"><span style=\"font-size: 11px;\">ДА</span></td>\n<td style=\"border: 1px solid #ffffff; width: 87px; text-align: center;\"><span style=\"font-size: 11px;\">ДА</span></td>\n<td style=\"border: 1px solid #ffffff; width: 87px; text-align: center;\"><span style=\"font-size: 11px;\">ДА</span></td>\n<td style=\"border: 1px solid #ffffff; width: 101px; text-align: center;\"><span style=\"font-size: 11px;\">13 600 ₽</span></td>\n<td style=\"border: 1px solid #ffffff; width: 107px; text-align: center;\"><span style=\"font-size: 11px;\">1 700 ₽</span></td>\n<td style=\"border: 1px solid #ffffff; width: 87px; text-align: center;\"><span style=\"font-size: 11px;\">1 500 ₽</span></td>\n<td style=\"border: 1px solid #ffffff; width: 93px; text-align: center;\"><span style=\"font-size: 11px;\">17 000 ₽</span></td>\n<td style=\"border: 1px solid #ffffff; width: 96px; text-align: center;\"><span style=\"font-size: 11px;\">2 125 ₽</span></td>\n<td style=\"border: 1px solid #ffffff; width: 87px; text-align: center;\"><span style=\"font-size: 11px;\">2 000 ₽</span></td>\n</tr>\n<tr style=\"background: #EAEAEA;\">\n<td style=\"border: 1px solid #ffffff; height: 33px; width: 104px; text-align: center;\" height=\"33\"><span style=\"font-size: 11px;\">ХИЖИНА</span></td>\n<td style=\"border: 1px solid #ffffff; width: 87px; text-align: center;\"><span style=\"font-size: 11px;\">160</span></td>\n<td style=\"border: 1px solid #ffffff; width: 87px; text-align: center;\"><span style=\"font-size: 11px;\">4</span></td>\n<td style=\"border: 1px solid #ffffff; width: 95px; text-align: center;\"><span style=\"font-size: 11px;\">8</span></td>\n<td style=\"border: 1px solid #ffffff; width: 87px; text-align: center;\"><span style=\"font-size: 11px;\">4</span></td>\n<td style=\"border: 1px solid #ffffff; width: 87px; text-align: center;\"><span style=\"font-size: 11px;\">ДА</span></td>\n<td style=\"border: 1px solid #ffffff; width: 85px; text-align: center;\"><span style=\"font-size: 11px;\">ДА</span></td>\n<td style=\"border: 1px solid #ffffff; width: 87px; text-align: center;\"><span style=\"font-size: 11px;\">ДА</span></td>\n<td style=\"border: 1px solid #ffffff; width: 87px; text-align: center;\"><span style=\"font-size: 11px;\">ДА</span></td>\n<td style=\"border: 1px solid #ffffff; width: 87px; text-align: center;\"><span style=\"font-size: 11px;\">ДА</span></td>\n<td style=\"border: 1px solid #ffffff; width: 87px; text-align: center;\"><span style=\"font-size: 11px;\">ДА</span></td>\n<td style=\"border: 1px solid #ffffff; width: 87px; text-align: center;\"><span style=\"font-size: 11px;\">ДА</span></td>\n<td style=\"border: 1px solid #ffffff; width: 101px; text-align: center;\"><span style=\"font-size: 11px;\">16 000 ₽</span></td>\n<td style=\"border: 1px solid #ffffff; width: 107px; text-align: center;\"><span style=\"font-size: 11px;\">2 000 ₽</span></td>\n<td style=\"border: 1px solid #ffffff; width: 87px; text-align: center;\"><span style=\"font-size: 11px;\">1 500 ₽</span></td>\n<td style=\"border: 1px solid #ffffff; width: 93px; text-align: center;\"><span style=\"font-size: 11px;\">20 000 ₽</span></td>\n<td style=\"border: 1px solid #ffffff; width: 96px; text-align: center;\"><span style=\"font-size: 11px;\">2 500 ₽</span></td>\n<td style=\"border: 1px solid #ffffff; width: 87px; text-align: center;\"><span style=\"font-size: 11px;\">2 000 ₽</span></td>\n</tr>\n</tbody>\n</table>\n</div>\n<p>&nbsp;</p>\n<p><em><strong>Банкет в доме наш , после&nbsp; 23:00 в доме остается кол-во человек в соответствии со спальными местами&nbsp;</strong></em></p>\n<p><em><strong>Также можем предоставить дополнительное спальное место стоимость 1000 рублей</strong></em></p>\n<p><em><strong> Дети до 7 лет, без предоставления спального места проживают бесплатно</strong></em></p>\n<p>&nbsp;</p>\n<p>При поселении обязательно взимается депозит в размере 10 000 рублей</p>\n<p>&nbsp;</p>\n<p>&nbsp;</p>\n<p>&nbsp;</p>\n<h2 style=\"text-align: center;\">Условия бронирования 2-х дней на Новый год</h2>\n<p>&nbsp;</p>\n<div style=\"overflow: auto;\">\n<table style=\"width: 90%; margin: auto;\" cellspacing=\"0\" cellpadding=\"5\" align=\"center\"><colgroup> <col style=\"text-align: center;\" /> <col style=\"text-align: center;\" span=\"2\" /> <col style=\"text-align: center;\" /> <col style=\"text-align: center;\" span=\"2\" /> <col style=\"text-align: center;\" /> <col style=\"text-align: center;\" span=\"5\" /> <col style=\"text-align: center;\" /> <col style=\"text-align: center;\" /> <col style=\"text-align: center;\" /> </colgroup>\n<tbody>\n<tr style=\"background: #EAEAEA;\">\n<td style=\"border: 1px solid #ffffff; height: 66px; width: 104px; text-align: center;\" rowspan=\"2\" height=\"66\"><span style=\"font-size: 11px;\">Дом</span></td>\n<td style=\"border: 1px solid #ffffff; width: 87px; text-align: center;\" rowspan=\"2\"><span style=\"font-size: 11px;\">Площадь, м2</span></td>\n<td style=\"border: 1px solid #ffffff; width: 87px; text-align: center;\" rowspan=\"2\"><span style=\"font-size: 11px;\">Количество спален</span></td>\n<td style=\"border: 1px solid #ffffff; width: 95px; text-align: center;\" rowspan=\"2\"><span style=\"font-size: 11px;\">Количество гостей</span></td>\n<td style=\"border: 1px solid #ffffff; width: 87px; text-align: center;\" rowspan=\"2\"><span style=\"font-size: 11px;\">Доп места</span></td>\n<td style=\"border: 1px solid #ffffff; width: 87px; text-align: center;\" rowspan=\"2\"><span style=\"font-size: 11px;\">Наличие сауны</span></td>\n<td style=\"border: 1px solid #ffffff; width: 85px; text-align: center;\" rowspan=\"2\"><span style=\"font-size: 11px;\">Самовар и чайный набор</span></td>\n<td style=\"border: 1px solid #ffffff; width: 87px; text-align: center;\" rowspan=\"2\"><span style=\"font-size: 11px;\">Посуда</span></td>\n<td style=\"border: 1px solid #ffffff; width: 87px; text-align: center;\" rowspan=\"2\"><span style=\"font-size: 11px;\">Микроволновая печь</span></td>\n<td style=\"border: 1px solid #ffffff; width: 87px; text-align: center;\" rowspan=\"2\"><span style=\"font-size: 11px;\">Телевизор</span></td>\n<td style=\"border: 1px solid #ffffff; width: 87px; text-align: center;\" rowspan=\"2\"><span style=\"font-size: 11px;\">Wi-Fi</span></td>\n<td style=\"border: 1px solid #ffffff; width: 87px; text-align: center;\" rowspan=\"2\"><span style=\"font-size: 11px;\">Халаты, Тапочки</span></td>\n<td style=\"border: 1px solid #ffffff; width: 281px; text-align: center;\" colspan=\"3\"><span style=\"font-size: 11px;\">Цена в Новый Год и Рождество&nbsp; <br />(31-02 и 06-08)</span></td>\n</tr>\n<tr style=\"background: #EAEAEA;\">\n<td style=\"border: 1px solid #ffffff; height: 21px; width: 93px; text-align: center;\" height=\"21\"><span style=\"font-size: 11px;\">Дом</span></td>\n<td style=\"border: 1px solid #ffffff; width: 101px; text-align: center;\"><span style=\"font-size: 11px;\">На человека</span></td>\n<td style=\"border: 1px solid #ffffff; width: 87px; text-align: center;\"><span style=\"font-size: 11px;\">Доп место</span></td>\n</tr>\n<tr style=\"background: #EAEAEA;\">\n<td style=\"border: 1px solid #ffffff; height: 33px; width: 104px; text-align: center;\" height=\"33\"><span style=\"font-size: 11px;\">ЗВЕЗДОЧЕТ</span></td>\n<td style=\"border: 1px solid #ffffff; width: 87px; text-align: center;\"><span style=\"font-size: 11px;\">108</span></td>\n<td style=\"border: 1px solid #ffffff; width: 87px; text-align: center;\"><span style=\"font-size: 11px;\">2</span></td>\n<td style=\"border: 1px solid #ffffff; width: 95px; text-align: center;\"><span style=\"font-size: 11px;\">4</span></td>\n<td style=\"border: 1px solid #ffffff; width: 87px; text-align: center;\"><span style=\"font-size: 11px;\">2</span></td>\n<td style=\"border: 1px solid #ffffff; width: 87px; text-align: center;\"><span style=\"font-size: 11px;\">ДА</span></td>\n<td style=\"border: 1px solid #ffffff; width: 85px; text-align: center;\"><span style=\"font-size: 11px;\">ДА</span></td>\n<td style=\"border: 1px solid #ffffff; width: 87px; text-align: center;\"><span style=\"font-size: 11px;\">ДА</span></td>\n<td style=\"border: 1px solid #ffffff; width: 87px; text-align: center;\"><span style=\"font-size: 11px;\">ДА</span></td>\n<td style=\"border: 1px solid #ffffff; width: 87px; text-align: center;\"><span style=\"font-size: 11px;\">ДА</span></td>\n<td style=\"border: 1px solid #ffffff; width: 87px; text-align: center;\"><span style=\"font-size: 11px;\">ДА</span></td>\n<td style=\"border: 1px solid #ffffff; width: 87px; text-align: center;\"><span style=\"font-size: 11px;\">ДА</span></td>\n<td style=\"border: 1px solid #ffffff; width: 93px; text-align: center;\"><span style=\"font-size: 11px;\">25 000 ₽</span></td>\n<td style=\"border: 1px solid #ffffff; width: 101px; text-align: center;\"><span style=\"font-size: 11px;\">6 250 ₽</span></td>\n<td style=\"border: 1px solid #ffffff; width: 87px; text-align: center;\"><span style=\"font-size: 11px;\">2 500 ₽</span></td>\n</tr>\n<tr style=\"background: #EAEAEA;\">\n<td style=\"border: 1px solid #ffffff; height: 33px; width: 104px; text-align: center;\" height=\"33\"><span style=\"font-size: 11px;\">ТАЛДОМ</span></td>\n<td style=\"border: 1px solid #ffffff; width: 87px; text-align: center;\"><span style=\"font-size: 11px;\">112</span></td>\n<td style=\"border: 1px solid #ffffff; width: 87px; text-align: center;\"><span style=\"font-size: 11px;\">3</span></td>\n<td style=\"border: 1px solid #ffffff; width: 95px; text-align: center;\"><span style=\"font-size: 11px;\">6</span></td>\n<td style=\"border: 1px solid #ffffff; width: 87px; text-align: center;\"><span style=\"font-size: 11px;\">3</span></td>\n<td style=\"border: 1px solid #ffffff; width: 87px; text-align: center;\"><span style=\"font-size: 11px;\">ДА</span></td>\n<td style=\"border: 1px solid #ffffff; width: 85px; text-align: center;\"><span style=\"font-size: 11px;\">ДА</span></td>\n<td style=\"border: 1px solid #ffffff; width: 87px; text-align: center;\"><span style=\"font-size: 11px;\">ДА</span></td>\n<td style=\"border: 1px solid #ffffff; width: 87px; text-align: center;\"><span style=\"font-size: 11px;\">ДА</span></td>\n<td style=\"border: 1px solid #ffffff; width: 87px; text-align: center;\"><span style=\"font-size: 11px;\">ДА</span></td>\n<td style=\"border: 1px solid #ffffff; width: 87px; text-align: center;\"><span style=\"font-size: 11px;\">ДА</span></td>\n<td style=\"border: 1px solid #ffffff; width: 87px; text-align: center;\"><span style=\"font-size: 11px;\">ДА</span></td>\n<td style=\"border: 1px solid #ffffff; width: 93px; text-align: center;\"><span style=\"font-size: 11px;\">30 000 ₽</span></td>\n<td style=\"border: 1px solid #ffffff; width: 101px; text-align: center;\"><span style=\"font-size: 11px;\">5 000 ₽</span></td>\n<td style=\"border: 1px solid #ffffff; width: 87px; text-align: center;\"><span style=\"font-size: 11px;\">2 500 ₽</span></td>\n</tr>\n<tr style=\"background: #EAEAEA;\">\n<td style=\"border: 1px solid #ffffff; height: 33px; width: 104px; text-align: center;\" height=\"33\"><span style=\"font-size: 11px;\">УДАЧНЫЙ</span></td>\n<td style=\"border: 1px solid #ffffff; width: 87px; text-align: center;\"><span style=\"font-size: 11px;\">132</span></td>\n<td style=\"border: 1px solid #ffffff; width: 87px; text-align: center;\"><span style=\"font-size: 11px;\">4</span></td>\n<td style=\"border: 1px solid #ffffff; width: 95px; text-align: center;\"><span style=\"font-size: 11px;\">8</span></td>\n<td style=\"border: 1px solid #ffffff; width: 87px; text-align: center;\"><span style=\"font-size: 11px;\">4</span></td>\n<td style=\"border: 1px solid #ffffff; width: 87px; text-align: center;\"><span style=\"font-size: 11px;\">ДА</span></td>\n<td style=\"border: 1px solid #ffffff; width: 85px; text-align: center;\"><span style=\"font-size: 11px;\">ДА</span></td>\n<td style=\"border: 1px solid #ffffff; width: 87px; text-align: center;\"><span style=\"font-size: 11px;\">ДА</span></td>\n<td style=\"border: 1px solid #ffffff; width: 87px; text-align: center;\"><span style=\"font-size: 11px;\">ДА</span></td>\n<td style=\"border: 1px solid #ffffff; width: 87px; text-align: center;\"><span style=\"font-size: 11px;\">ДА</span></td>\n<td style=\"border: 1px solid #ffffff; width: 87px; text-align: center;\"><span style=\"font-size: 11px;\">ДА</span></td>\n<td style=\"border: 1px solid #ffffff; width: 87px; text-align: center;\"><span style=\"font-size: 11px;\">ДА</span></td>\n<td style=\"border: 1px solid #ffffff; width: 93px; text-align: center;\"><span style=\"font-size: 11px;\">35 000 ₽</span></td>\n<td style=\"border: 1px solid #ffffff; width: 101px; text-align: center;\"><span style=\"font-size: 11px;\">4 375 ₽</span></td>\n<td style=\"border: 1px solid #ffffff; width: 87px; text-align: center;\"><span style=\"font-size: 11px;\">2 500 ₽</span></td>\n</tr>\n<tr style=\"background: #EAEAEA;\">\n<td style=\"border: 1px solid #ffffff; height: 33px; width: 104px; text-align: center;\" height=\"33\"><span style=\"font-size: 11px;\">ХИЖИНА</span></td>\n<td style=\"border: 1px solid #ffffff; width: 87px; text-align: center;\"><span style=\"font-size: 11px;\">160</span></td>\n<td style=\"border: 1px solid #ffffff; width: 87px; text-align: center;\"><span style=\"font-size: 11px;\">4</span></td>\n<td style=\"border: 1px solid #ffffff; width: 95px; text-align: center;\"><span style=\"font-size: 11px;\">8</span></td>\n<td style=\"border: 1px solid #ffffff; width: 87px; text-align: center;\"><span style=\"font-size: 11px;\">4</span></td>\n<td style=\"border: 1px solid #ffffff; width: 87px; text-align: center;\"><span style=\"font-size: 11px;\">ДА</span></td>\n<td style=\"border: 1px solid #ffffff; width: 85px; text-align: center;\"><span style=\"font-size: 11px;\">ДА</span></td>\n<td style=\"border: 1px solid #ffffff; width: 87px; text-align: center;\"><span style=\"font-size: 11px;\">ДА</span></td>\n<td style=\"border: 1px solid #ffffff; width: 87px; text-align: center;\"><span style=\"font-size: 11px;\">ДА</span></td>\n<td style=\"border: 1px solid #ffffff; width: 87px; text-align: center;\"><span style=\"font-size: 11px;\">ДА</span></td>\n<td style=\"border: 1px solid #ffffff; width: 87px; text-align: center;\"><span style=\"font-size: 11px;\">ДА</span></td>\n<td style=\"border: 1px solid #ffffff; width: 87px; text-align: center;\"><span style=\"font-size: 11px;\">ДА</span></td>\n<td style=\"border: 1px solid #ffffff; width: 93px; text-align: center;\"><span style=\"font-size: 11px;\">40 000 ₽</span></td>\n<td style=\"border: 1px solid #ffffff; width: 101px; text-align: center;\"><span style=\"font-size: 11px;\">5 000 ₽</span></td>\n<td style=\"border: 1px solid #ffffff; width: 87px; text-align: center;\"><span style=\"font-size: 11px;\">2 500 ₽</span></td>\n</tr>\n</tbody>\n</table>\n</div>\n<p style=\"text-align: justify;\">&nbsp;</p>\n<p style=\"text-align: justify;\">&nbsp;</p>\n<p style=\"text-align: justify;\"><em><strong>Цены включают в себя проживание и праздничную программу&nbsp;</strong></em></p>\n<p style=\"text-align: justify;\"><em><strong>Новогдняя цена действует до 02 января включительно, со 02 января до 06 января цена выходного дня, 07 января по08 января цена Новогодней ночи!!!</strong></em></p>\n<p style=\"text-align: justify;\"><em><strong>с 08 января по 12 января включительно цена выходного дня&nbsp; с 13 января обычный тариф!!!</strong></em></p>', '', '', '', '', '', 'uslugi', NULL, '', '2018-10-17 12:15:49', '2019-12-06 12:20:29', 1),
(5, 'Контакты', 0, '', '', '', '', '', '', '', 'kontaktyi', NULL, 'page_contacts.tpl', '2018-10-17 12:16:08', '2018-10-18 17:44:59', 1),
(6, 'Котеджи', 0, '', '', '', '', '', '', '', 'cottages', NULL, '', '2019-12-16 12:28:51', '2019-12-16 12:28:51', 1);

-- --------------------------------------------------------

--
-- Структура таблицы `pages_data`
--

CREATE TABLE `pages_data` (
  `id` int(11) NOT NULL,
  `page_id` int(11) NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `header` varchar(255) DEFAULT NULL,
  `content` text
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Структура таблицы `settings`
--

CREATE TABLE `settings` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(64) NOT NULL DEFAULT '',
  `value` text NOT NULL,
  `type` varchar(100) NOT NULL,
  `description` tinytext NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `settings`
--

INSERT INTO `settings` (`id`, `name`, `value`, `type`, `description`) VALUES
(1, 'sitename', 'Усадьба Александрово', 'main', 'Название сайта'),
(2, 'email', 'usadba.alexandrovo@gmail.com <br> usadba.alexandrovo@yandex.ru', 'main', 'Email'),
(3, 'email_sender', 'usadba.alexandrovo@yandex.ru', 'main', 'Email отправителя'),
(5, 'tel', '8 (985) 140-40-40', 'main', 'Телефон'),
(7, 'adress', '301720, Тульская область,<br>  г. Кимовск, Усадьба Александрово', 'main', 'Адресс'),
(8, 'yandex_metrika', '<!-- Yandex.Metrika informer -->', 'main', 'Код Yandex.Metrika'),
(9, 'google_analytics', '<!-- google-analytics    -->', 'main', 'Код google-analytics'),
(4, 'email_order', 'usadba.alexandrovo@gmail.com, usadba.alexandrovo@yandex.ru', 'main', 'Email для заявок'),
(10, 'captcha', '0', 'main', 'Защита форм от ботов'),
(12, 'send_mail', '1', 'forms', 'Отправлять на почту'),
(13, 'forms_final_template', '<h3 class=\"font-black\" style=\"text-align: center;\">Заявка номер {id} оформлена</h3>\r\n<p class=\"font-black\" align=\"center\">Наши менеджеры свяжутся с вами в ближайшее время.</p>\r\n<p style=\"text-align: center;\">Телефон для связи: {tel1}</p>\r\n<p style=\"text-align: center;\">Телефон для связи: {email}</p>', 'forms', 'Шаблон'),
(14, 'forms_parser', '0', 'forms', 'Использовать парсер форм'),
(11, 'title_suffix', '', 'main', 'Суффикс к title'),
(25, 'title_product', '%NAME%', 'main', 'Маска для title товара %NAME%'),
(26, 'description_product', '%NAME%', 'main', 'Маска для description товара %NAME%'),
(27, 'keywords_product', '%NAME%', 'main', 'Маска для keywords товара %NAME%'),
(28, 'title_catalog', '%NAME%', 'main', 'Маска для title категорий %NAME%'),
(29, 'description_catalog', '%NAME%', 'main', 'Маска для description категорий %NAME%'),
(30, 'keywords_catalog', '%NAME%', 'main', 'Маска для keywords категорий %NAME%'),
(38, 'time_work', 'Круглосуточно', 'main', 'Время работы'),
(41, 'time_work_contact', 'Круглосуточно', 'main', 'Время работы для страницы контактов'),
(40, 'text_logo', '', 'main', 'Текст возле логотипа');

-- --------------------------------------------------------

--
-- Структура таблицы `widget_block`
--

CREATE TABLE `widget_block` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `block_name` varchar(50) NOT NULL,
  `header` varchar(255) DEFAULT NULL,
  `description` text,
  `block_type` varchar(50) DEFAULT NULL,
  `content` text,
  `template` varchar(50) DEFAULT NULL,
  `active` tinyint(1) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `widget_block`
--

INSERT INTO `widget_block` (`id`, `name`, `block_name`, `header`, `description`, `block_type`, `content`, `template`, `active`) VALUES
(1, 'Политика конфиденциальности', 'block_politika_konfidentsialnosti', 'Политика конфиденциальности', 'Здесь можно изменить текст политики конфиденциальности, выводимой на сайте.', 'text', '<p style=\"text-align: justify;\">Данная политика конфиденциальности относится к сайту с доменным именем site.com и его поддоменам. Страница содержит сведения о том, какую информацию администрация сайта или третьи лица могут получать, когда пользователь (вы) посещаете его.</p>\r\n<p style=\"text-align: justify;\"><strong>Данные, которые собираются при посещении</strong></p>\r\n<p style=\"text-align: justify;\"><strong>Персональные данные</strong></p>\r\n<p style=\"text-align: justify;\">Персональные данные при посещении сайта передаются пользователем добровольно, к ним могут относиться: имя, фамилия, отчество, номера телефонов, адреса электронной почты, адреса для доставки товаров или оказания услуг, реквизиты компании, которую представляет пользователь, должность в компании, которую представляет пользователь, аккаунты в социальных сетях, а также &mdash; прочие, заполняемые поля форм.</p>\r\n<p style=\"text-align: justify;\">Эти данные собираются в целях оказания услуг или продажи товаров, возможности связи с пользователем или иной активности пользователя на сайте, а также, чтобы отправлять пользователю информацию, которую он согласился получать.</p>\r\n<p style=\"text-align: justify;\">Мы не проверяем достоверность оставляемых данных и не гарантируем качественного исполнения заказов, оказания услуг или обратной связи с нами при предоставлении некорректных сведений.</p>\r\n<p style=\"text-align: justify;\">Данные собираются имеющимися на сайте формами для заполнения (например, регистрации, оформления заказа, подписки, оставления отзыва, вопроса, обратной связи и иными).</p>\r\n<p style=\"text-align: justify;\">Формы, установленные на сайте, могут передавать данные как напрямую на сайт, так и на сайты сторонних организаций (скрипты сервисов сторонних организаций).</p>\r\n<p style=\"text-align: justify;\">Данные могут собираться через технологию cookies (куки) как непосредственно сайтом, так и скриптами сервисов сторонних организаций. Эти данные собираются автоматически, отправку этих данных можно запретить, отключив cookies (куки) в браузере, в котором открывается сайт.</p>\r\n<p style=\"text-align: justify;\"><strong>Не персональные данные</strong></p>\r\n<p style=\"text-align: justify;\">Кроме персональных данных при посещении сайта собираются не персональные данные, их сбор происходит автоматически веб-сервером, на котором расположен сайт, средствами CMS (системы управления сайтом), скриптами сторонних организаций, установленными на сайте. К данным, собираемым автоматически, относятся: IP адрес и страна его регистрации, имя домена, с которого вы к нам пришли, переходы посетителей с одной страницы сайта на другую, информация, которую ваш браузер предоставляет добровольно при посещении сайта, cookies (куки), фиксируются посещения, иные данные, собираемые счетчиками аналитики сторонних организаций, установленными на сайте.</p>\r\n<p style=\"text-align: justify;\">Эти данные носят неперсонифицированный характер и направлены на улучшение обслуживания клиентов, улучшения удобства использования сайта, анализа статистики посещаемости.</p>\r\n<p style=\"text-align: justify;\"><strong>Предоставление данных третьим лицам</strong></p>\r\n<p style=\"text-align: justify;\">Мы не раскрываем личную информацию пользователей компаниям, организациям и частным лицам, не связанным с нами. Исключение составляют случаи, перечисленные ниже.</p>\r\n<p style=\"text-align: justify;\"><strong>Данные пользователей в общем доступе</strong></p>\r\n<p style=\"text-align: justify;\">Персональные данные пользователя могут публиковаться в общем доступе в соответствии с функционалом сайта, например, при оставлении отзывов / вопросов, может публиковаться указанное пользователем имя, такая активность на сайте является добровольной, и пользователь своими действиями дает согласие на такую публикацию.</p>\r\n<p style=\"text-align: justify;\"><strong>По требованию закона</strong></p>\r\n<p style=\"text-align: justify;\">Информация может быть раскрыта в целях воспрепятствования мошенничеству или иным противоправным действиям; по требованию законодательства и в иных случаях, предусмотренных законами РФ.</p>\r\n<p style=\"text-align: justify;\"><strong>Для оказания услуг, выполнения обязательств</strong></p>\r\n<p style=\"text-align: justify;\">Пользователь соглашается с тем, что персональная информация может быть передана третьим лицам в целях оказания заказанных на сайте услуг, выполнении иных обязательств перед пользователем. К таким лицам, например, относятся курьерская служба, почтовые службы, службы грузоперевозок и иные.</p>\r\n<p style=\"text-align: justify;\"><strong>Сервисам сторонних организаций, установленным на сайте</strong></p>\r\n<p style=\"text-align: justify;\">На сайте могут быть установлены формы, собирающие персональную информацию других организаций, в этом случае сбор, хранение и защита персональной информации пользователя осуществляется сторонними организациями в соответствии с их политикой конфиденциальности.</p>\r\n<p style=\"text-align: justify;\">Сбор, хранение и защита полученной от сторонней организации информации осуществляется в соответствии с настоящей политикой конфиденциальности.</p>\r\n<p style=\"text-align: justify;\"><strong>Как мы защищаем вашу информацию</strong></p>\r\n<p style=\"text-align: justify;\">Мы принимаем соответствующие меры безопасности по сбору, хранению и обработке собранных данных для защиты их от несанкционированного доступа, изменения, раскрытия или уничтожения, ограничиваем нашим сотрудникам, подрядчикам и агентам доступ к персональным данным, постоянно совершенствуем способы сбора, хранения и обработки данных, включая физические меры безопасности, для противодействия несанкционированному доступу к нашим системам.</p>\r\n<p style=\"text-align: justify;\"><strong>Ваше согласие с этими условиями</strong></p>\r\n<p style=\"text-align: justify;\">Используя сайт, вы выражаете свое согласие с этой политикой конфиденциальности. Если вы не согласны с этой политикой, пожалуйста, не используйте его. Ваше дальнейшее использование сайта после внесения изменений в настоящую политику будет рассматриваться как ваше согласие с этими изменениями.</p>\r\n<p style=\"text-align: justify;\"><strong>Отказ от ответственности</strong></p>\r\n<p style=\"text-align: justify;\">Политика конфиденциальности не распространяется ни на какие другие сайты и не применима к веб-сайтам третьих лиц, которые могут содержать упоминание о нашем сайте и с которых могут делаться ссылки на сайт, а также ссылки с этого сайта на другие сайты сети интернет. Мы не несем ответственности за действия других веб-сайтов.</p>\r\n<p style=\"text-align: justify;\"><strong>Изменения в политике конфиденциальности</strong></p>\r\n<p style=\"text-align: justify;\">Мы имеем право по своему усмотрению обновлять данную политику конфиденциальности в любое время. Используя сайт, вы соглашаетесь с принятием на себя ответственности за периодическое ознакомление с политикой конфиденциальности и изменениями в ней.</p>', 'block_policy_popup.tpl', 1),
(15, 'Коротко о компании', 'block_about_company', 'Коротко о компании', 'Второй блок на главной', 'fragments', '{\"category_id\":\"1\",\"order\":\"desc\",\"number\":\"0\"}', 'block_about_company.tpl', 1),
(16, 'Наши преимущества', 'block_our_advantages', 'Наши преимущества', 'Третий блок на главной', 'fragments', '{\"category_id\":\"2\",\"order\":\"desc\",\"number\":\"4\"}', 'block_our_advantages.tpl', 1),
(17, 'Услуги компании', 'block_company_services', 'Услуги компании', 'Четвертый блок на главной', 'fragments', '{\"category_id\":\"3\",\"order\":\"desc\",\"number\":\"3\"}', 'block_company_services.tpl', 1),
(18, 'Галерея авто', 'block_car_gallery', 'Галерея домов', 'Пятый блок на главной', 'gallery', '{\"gallery_id\":\"1\",\"order\":\"desc\",\"number\":\"6\"}', 'block_car_gallery.tpl', 1),
(19, 'Наши сотрудники', 'block_our_employees', 'Наши сотрудники', '', 'fragments', '{\"category_id\":\"4\",\"order\":\"desc\",\"number\":\"10\"}', 'block_our_employees.tpl', 0);

-- --------------------------------------------------------

--
-- Структура таблицы `widget_gallery`
--

CREATE TABLE `widget_gallery` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `parent_id` int(11) DEFAULT NULL,
  `image` varchar(255) NOT NULL,
  `content` text,
  `meta_title` varchar(300) DEFAULT NULL,
  `meta_h1` varchar(300) DEFAULT NULL,
  `meta_description` text,
  `meta_keywords` text,
  `meta_url` varchar(130) DEFAULT NULL,
  `template` varchar(50) DEFAULT NULL,
  `created` datetime DEFAULT NULL,
  `post_status` tinyint(1) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `widget_gallery`
--

INSERT INTO `widget_gallery` (`id`, `name`, `parent_id`, `image`, `content`, `meta_title`, `meta_h1`, `meta_description`, `meta_keywords`, `meta_url`, `template`, `created`, `post_status`) VALUES
(1, 'Галерея', 0, '', '', '', '', '', '', 'galereya-kottedjey', '', '2019-12-18 10:21:34', 1),
(2, 'Праздничная программа', 0, '', '<p><strong>Дорогие друзья!</strong>&nbsp;Приглашаем вас вместе с семьей и друзьями встретить Новый 2020 год и провести новогодние праздники вдали от суеты, в спокойном месте на территории лесного хозяйства, где вас ждут не только комфортные коттеджи и &nbsp;активный отдых на территории, но и масштабная развлекательная программа, с который вы можете ознакомиться у нас на сайте:</p>\n<p><strong>31.12-01.01</strong></p>\n<p>&laquo;Встреча Нового 2020 года&raquo;</p>\n<p><strong>22:00</strong>&nbsp;Встреча гостей.</p>\n<p><strong>22:15</strong>&nbsp;Открытие торжественного ужина.</p>\n<p><strong>22:25</strong>&nbsp;Развлекательная программа: игры и конкурсы от ведущей, выступление танцевального коллектива, живой вокал.</p>\n<p><strong>23:40</strong>&nbsp;Выход Дед Мороза и Снегурочки.</p>\n<p><strong>23:55</strong>&nbsp;Поздравление Президента РФ.</p>\n<p><strong>00:02</strong>&nbsp;Продолжение праздничной программы.</p>\n<p><strong>00:30</strong>&nbsp;Праздничный салют.</p>\n<p><strong>00:40</strong>&nbsp;Развлекательная программа: игры и конкурсы с ведущей, живой вокал.</p>\n<p><strong>01:25</strong>&nbsp;&nbsp;Танцевальная дискотека.</p>\n<p><strong>01:55</strong>&nbsp;&nbsp;Интерактив с залом.</p>\n<p><strong>02:15</strong>&nbsp;Танцевальная дискотека.</p>\n<p><strong>02:45</strong>&nbsp;Тосты и игры от ведущей.</p>\n<p><strong>03:05</strong>&nbsp;Танцевальная дискотека.</p>\n<p><strong>03:25</strong>&nbsp;Танцевальный флеш-моб.</p>\n<p><strong>03:40</strong>&nbsp;Дискотека от DJ</p>\n<p><strong>04:00</strong>&nbsp;Окончание работы ведущей и диджея.</p>\n<p><strong>1 января</strong></p>\n<p>Вокальное выступление Виктории Кузнецовой, дискотека с DJ и зажигательная Снегурочка.</p>\n<p><strong>2 января</strong></p>\n<p>Выступление &nbsp;саксофониста Артёма Бубнова, &nbsp;дискотека с DJ, вечер с ведущей.</p>\n<p><strong>6 января</strong></p>\n<p>Рождество с саксофонистом, живой вокал, выступление DJ, конкурсы и поздравления от ведущей.</p>', '', '', '', '', 'prazdnichnaya-programma', '', '2019-12-26 17:49:16', 1);

-- --------------------------------------------------------

--
-- Структура таблицы `widget_gallery_data`
--

CREATE TABLE `widget_gallery_data` (
  `id` int(11) NOT NULL,
  `gallery_id` int(11) NOT NULL,
  `image_url` varchar(255) DEFAULT NULL,
  `image_thumb_url` varchar(255) DEFAULT NULL,
  `image_title` varchar(255) DEFAULT NULL,
  `image_alt` varchar(255) DEFAULT NULL,
  `image_position` int(11) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `widget_gallery_data`
--

INSERT INTO `widget_gallery_data` (`id`, `gallery_id`, `image_url`, `image_thumb_url`, `image_title`, `image_alt`, `image_position`) VALUES
(45, 1, '/assets/widget/gallery/kottedji_(11)1.jpg', '/assets/widget/gallery/thumbs/kottedji_(11)1.jpg', '', '', 0),
(46, 1, '/assets/widget/gallery/kottedji_(13)1.jpeg', '/assets/widget/gallery/thumbs/kottedji_(13)1.jpeg', '', '', 0),
(47, 1, '/assets/widget/gallery/kottedji_(14)1.jpeg', '/assets/widget/gallery/thumbs/kottedji_(14)1.jpeg', '', '', 0),
(39, 1, '/assets/widget/gallery/kottedji_(5).jpeg', '/assets/widget/gallery/thumbs/kottedji_(5).jpeg', '', '', 0),
(40, 1, '/assets/widget/gallery/kottedji_(6)1.jpeg', '/assets/widget/gallery/thumbs/kottedji_(6)1.jpeg', '', '', 0),
(41, 1, '/assets/widget/gallery/kottedji_(8)1.jpeg', '/assets/widget/gallery/thumbs/kottedji_(8)1.jpeg', '', '', 0),
(43, 1, '/assets/widget/gallery/kottedji_(10)1.jpeg', '/assets/widget/gallery/thumbs/kottedji_(10)1.jpeg', '', '', 0),
(44, 1, '/assets/widget/gallery/kottedji_(11)1.jpeg', '/assets/widget/gallery/thumbs/kottedji_(11)1.jpeg', '', '', 0),
(129, 2, '/assets/widget/gallery/268_content1.jpg', '/assets/widget/gallery/thumbs/268_content1.jpg', '', '', 5),
(49, 1, '/assets/widget/gallery/kottedji_(15)1.jpg', '/assets/widget/gallery/thumbs/kottedji_(15)1.jpg', '', '', 0),
(50, 1, '/assets/widget/gallery/kottedji_(16)1.jpeg', '/assets/widget/gallery/thumbs/kottedji_(16)1.jpeg', '', '', 0),
(51, 1, '/assets/widget/gallery/kottedji_(19)1.jpg', '/assets/widget/gallery/thumbs/kottedji_(19)1.jpg', '', '', 0),
(52, 1, '/assets/widget/gallery/kottedji_(20)1.jpeg', '/assets/widget/gallery/thumbs/kottedji_(20)1.jpeg', '', '', 0),
(53, 1, '/assets/widget/gallery/kottedji_(22)1.jpeg', '/assets/widget/gallery/thumbs/kottedji_(22)1.jpeg', '', '', 1),
(54, 1, '/assets/widget/gallery/kottedji_(21)1.jpg', '/assets/widget/gallery/thumbs/kottedji_(21)1.jpg', '', '', 0),
(55, 1, '/assets/widget/gallery/kottedji_(22)1.jpg', '/assets/widget/gallery/thumbs/kottedji_(22)1.jpg', '', '', 0),
(56, 1, '/assets/widget/gallery/kottedji_(23)1.jpg', '/assets/widget/gallery/thumbs/kottedji_(23)1.jpg', '', '', 0),
(57, 1, '/assets/widget/gallery/kottedji_(24)1.jpg', '/assets/widget/gallery/thumbs/kottedji_(24)1.jpg', '', '', 0),
(59, 1, '/assets/widget/gallery/kottedji_(20).png', '/assets/widget/gallery/thumbs/kottedji_(20).png', '', '', 0),
(128, 2, '/assets/widget/gallery/kak-vstrechat-gostei-v-novogodnie-prazdniki-v2.orig_2.jpg', '/assets/widget/gallery/thumbs/kak-vstrechat-gostei-v-novogodnie-prazdniki-v2.orig_2.jpg', '', '', 6),
(61, 1, '/assets/widget/gallery/kottedji_(18)-1.png', '/assets/widget/gallery/thumbs/kottedji_(18)-1.png', '', '', 0),
(63, 1, '/assets/widget/gallery/kottedji_(17)-1.png', '/assets/widget/gallery/thumbs/kottedji_(17)-1.png', '', '', 0),
(64, 1, '/assets/widget/gallery/kottedji_(17).png', '/assets/widget/gallery/thumbs/kottedji_(17).png', '', '', 0),
(65, 1, '/assets/widget/gallery/kottedji_(16).png', '/assets/widget/gallery/thumbs/kottedji_(16).png', '', '', 0),
(66, 1, '/assets/widget/gallery/kottedji_(14).png', '/assets/widget/gallery/thumbs/kottedji_(14).png', '', '', 0),
(67, 1, '/assets/widget/gallery/kottedji_(13).png', '/assets/widget/gallery/thumbs/kottedji_(13).png', '', '', 0),
(68, 1, '/assets/widget/gallery/kottedji_(12)-1.png', '/assets/widget/gallery/thumbs/kottedji_(12)-1.png', '', '', 0),
(69, 1, '/assets/widget/gallery/kottedji_(12).png', '/assets/widget/gallery/thumbs/kottedji_(12).png', '', '', 0),
(70, 1, '/assets/widget/gallery/kottedji_(10).png', '/assets/widget/gallery/thumbs/kottedji_(10).png', '', '', 0),
(71, 1, '/assets/widget/gallery/kottedji_(9).png', '/assets/widget/gallery/thumbs/kottedji_(9).png', '', '', 0),
(72, 1, '/assets/widget/gallery/kottedji_(8).png', '/assets/widget/gallery/thumbs/kottedji_(8).png', '', '', 0),
(73, 1, '/assets/widget/gallery/kottedji_(7)-1.png', '/assets/widget/gallery/thumbs/kottedji_(7)-1.png', '', '', 0),
(74, 1, '/assets/widget/gallery/kottedji_(7).png', '/assets/widget/gallery/thumbs/kottedji_(7).png', '', '', 0),
(75, 1, '/assets/widget/gallery/kottedji_(6).png', '/assets/widget/gallery/thumbs/kottedji_(6).png', '', '', 0),
(76, 1, '/assets/widget/gallery/kottedji_(5).png', '/assets/widget/gallery/thumbs/kottedji_(5).png', '', '', 0),
(77, 1, '/assets/widget/gallery/kottedji_(4)-1.png', '/assets/widget/gallery/thumbs/kottedji_(4)-1.png', '', '', 0),
(131, 2, '/assets/widget/gallery/Father_Frost_001-1024x6852.jpg', '/assets/widget/gallery/thumbs/Father_Frost_001-1024x6852.jpg', '', '', 3),
(79, 1, '/assets/widget/gallery/kottedji_(3)-1.png', '/assets/widget/gallery/thumbs/kottedji_(3)-1.png', '', '', 0),
(81, 1, '/assets/widget/gallery/kottedji_(2)-1.png', '/assets/widget/gallery/thumbs/kottedji_(2)-1.png', '', '', 0),
(82, 1, '/assets/widget/gallery/kottedji_(2).png', '/assets/widget/gallery/thumbs/kottedji_(2).png', '', '', 0),
(83, 1, '/assets/widget/gallery/kottedji_(1)-1.png', '/assets/widget/gallery/thumbs/kottedji_(1)-1.png', '', '', 0),
(84, 1, '/assets/widget/gallery/kottedji_(1).png', '/assets/widget/gallery/thumbs/kottedji_(1).png', '', '', 0),
(86, 1, '/assets/widget/gallery/WhatsApp_Image_2019-12-13_at_15.32_.20_.jpeg', '/assets/widget/gallery/thumbs/WhatsApp_Image_2019-12-13_at_15.32_.20_.jpeg', '', '', 0),
(87, 1, '/assets/widget/gallery/WhatsApp_Image_2019-12-13_at_15.16_.47_.jpeg', '/assets/widget/gallery/thumbs/WhatsApp_Image_2019-12-13_at_15.16_.47_.jpeg', '', '', 0),
(88, 1, '/assets/widget/gallery/WhatsApp_Image_2019-12-13_at_15.16_.46_.jpeg', '/assets/widget/gallery/thumbs/WhatsApp_Image_2019-12-13_at_15.16_.46_.jpeg', '', '', 0),
(89, 1, '/assets/widget/gallery/WhatsApp_Image_2019-12-13_at_15.16_.45_.jpeg', '/assets/widget/gallery/thumbs/WhatsApp_Image_2019-12-13_at_15.16_.45_.jpeg', '', '', 0),
(90, 1, '/assets/widget/gallery/WhatsApp_Image_2019-12-13_at_15.16_.45(1)_.jpeg', '/assets/widget/gallery/thumbs/WhatsApp_Image_2019-12-13_at_15.16_.45(1)_.jpeg', '', '', 0),
(91, 1, '/assets/widget/gallery/WhatsApp_Image_2019-12-13_at_15.16_.44_.jpeg', '/assets/widget/gallery/thumbs/WhatsApp_Image_2019-12-13_at_15.16_.44_.jpeg', '', '', 0),
(92, 1, '/assets/widget/gallery/WhatsApp_Image_2019-12-13_at_15.16_.44(1)_.jpeg', '/assets/widget/gallery/thumbs/WhatsApp_Image_2019-12-13_at_15.16_.44(1)_.jpeg', '', '', 0),
(132, 2, '/assets/widget/gallery/glad-father-frost-smiling-in-the-foreground-and-snow-maiden-playing-in-background_selc5tk-g_thumbnail-full012.png', '/assets/widget/gallery/thumbs/glad-father-frost-smiling-in-the-foreground-and-snow-maiden-playing-in-background_selc5tk-g_thumbnail-full012.png', '', '', 2),
(94, 1, '/assets/widget/gallery/WhatsApp_Image_2019-12-13_at_15.16_.43(2)_.jpeg', '/assets/widget/gallery/thumbs/WhatsApp_Image_2019-12-13_at_15.16_.43(2)_.jpeg', '', '', 0),
(95, 1, '/assets/widget/gallery/WhatsApp_Image_2019-12-13_at_15.16_.43(1)_1.jpeg', '/assets/widget/gallery/thumbs/WhatsApp_Image_2019-12-13_at_15.16_.43(1)_1.jpeg', '', '', 0),
(133, 2, '/assets/widget/gallery/Fotolia_58473903_L-1350x5702.jpg', '/assets/widget/gallery/thumbs/Fotolia_58473903_L-1350x5702.jpg', '', '', 1),
(97, 1, '/assets/widget/gallery/WhatsApp_Image_2019-12-13_at_15.16_.42(1)_1.jpeg', '/assets/widget/gallery/thumbs/WhatsApp_Image_2019-12-13_at_15.16_.42(1)_1.jpeg', '', '', 0),
(98, 1, '/assets/widget/gallery/WhatsApp_Image_2019-12-13_at_15.16_.41_1.jpeg', '/assets/widget/gallery/thumbs/WhatsApp_Image_2019-12-13_at_15.16_.41_1.jpeg', '', '', 0),
(99, 1, '/assets/widget/gallery/WhatsApp_Image_2019-12-13_at_15.16_.41(1)_1.jpeg', '/assets/widget/gallery/thumbs/WhatsApp_Image_2019-12-13_at_15.16_.41(1)_1.jpeg', '', '', 0),
(100, 1, '/assets/widget/gallery/WhatsApp_Image_2019-12-13_at_15.16_.40_1.jpeg', '/assets/widget/gallery/thumbs/WhatsApp_Image_2019-12-13_at_15.16_.40_1.jpeg', '', '', 0),
(101, 1, '/assets/widget/gallery/WhatsApp_Image_2019-12-13_at_15.16_.40(1)_1.jpeg', '/assets/widget/gallery/thumbs/WhatsApp_Image_2019-12-13_at_15.16_.40(1)_1.jpeg', '', '', 0),
(102, 1, '/assets/widget/gallery/WhatsApp_Image_2019-12-13_at_15.16_.38_2.jpeg', '/assets/widget/gallery/thumbs/WhatsApp_Image_2019-12-13_at_15.16_.38_2.jpeg', '', '', 0),
(103, 1, '/assets/widget/gallery/WhatsApp_Image_2019-12-13_at_15.13_.28_.jpeg', '/assets/widget/gallery/thumbs/WhatsApp_Image_2019-12-13_at_15.13_.28_.jpeg', '', '', 0),
(104, 1, '/assets/widget/gallery/WhatsApp_Image_2019-12-13_at_15.13_.28(1)_1.jpeg', '/assets/widget/gallery/thumbs/WhatsApp_Image_2019-12-13_at_15.13_.28(1)_1.jpeg', '', '', 0),
(105, 1, '/assets/widget/gallery/WhatsApp_Image_2019-12-13_at_15.13_.27_1.jpeg', '/assets/widget/gallery/thumbs/WhatsApp_Image_2019-12-13_at_15.13_.27_1.jpeg', '', '', 0),
(106, 1, '/assets/widget/gallery/WhatsApp_Image_2019-12-13_at_15.13_.26_1.jpeg', '/assets/widget/gallery/thumbs/WhatsApp_Image_2019-12-13_at_15.13_.26_1.jpeg', '', '', 0),
(107, 1, '/assets/widget/gallery/WhatsApp_Image_2019-12-13_at_15.13_.26(1)_1.jpeg', '/assets/widget/gallery/thumbs/WhatsApp_Image_2019-12-13_at_15.13_.26(1)_1.jpeg', '', '', 0),
(108, 1, '/assets/widget/gallery/WhatsApp_Image_2019-12-13_at_15.13_.25_1.jpeg', '/assets/widget/gallery/thumbs/WhatsApp_Image_2019-12-13_at_15.13_.25_1.jpeg', '', '', 0),
(109, 1, '/assets/widget/gallery/WhatsApp_Image_2019-12-13_at_15.13_.25(1)_1.jpeg', '/assets/widget/gallery/thumbs/WhatsApp_Image_2019-12-13_at_15.13_.25(1)_1.jpeg', '', '', 0),
(110, 1, '/assets/widget/gallery/WhatsApp_Image_2019-12-13_at_15.13_.24_1.jpeg', '/assets/widget/gallery/thumbs/WhatsApp_Image_2019-12-13_at_15.13_.24_1.jpeg', '', '', 0),
(111, 1, '/assets/widget/gallery/WhatsApp_Image_2019-12-13_at_15.13_.23_1.jpeg', '/assets/widget/gallery/thumbs/WhatsApp_Image_2019-12-13_at_15.13_.23_1.jpeg', '', '', 0),
(112, 1, '/assets/widget/gallery/WhatsApp_Image_2019-12-13_at_15.11_.23_1.jpeg', '/assets/widget/gallery/thumbs/WhatsApp_Image_2019-12-13_at_15.11_.23_1.jpeg', '', '', 0),
(113, 1, '/assets/widget/gallery/WhatsApp_Image_2019-12-13_at_15.11_.23(1)_1.jpeg', '/assets/widget/gallery/thumbs/WhatsApp_Image_2019-12-13_at_15.11_.23(1)_1.jpeg', '', '', 0),
(114, 1, '/assets/widget/gallery/WhatsApp_Image_2019-12-13_at_15.11_.22_1.jpeg', NULL, '', '', 0),
(115, 1, '/assets/widget/gallery/WhatsApp_Image_2019-12-13_at_15.11_.22(1)_1.jpeg', NULL, '', '', 0),
(116, 1, '/assets/widget/gallery/WhatsApp_Image_2019-12-13_at_15.11_.21_1.jpeg', NULL, '', '', 0),
(117, 1, '/assets/widget/gallery/WhatsApp_Image_2019-12-13_at_15.11_.21(1)_1.jpeg', NULL, '', '', 0),
(130, 2, '/assets/widget/gallery/1479906273_22.jpg', '/assets/widget/gallery/thumbs/1479906273_22.jpg', '', '', 4),
(118, 1, '/assets/widget/gallery/WhatsApp_Image_2019-12-13_at_15.11_.20_1.jpeg', NULL, '', '', 0),
(119, 1, '/assets/widget/gallery/WhatsApp_Image_2019-12-13_at_15.11_.20(1)_1.jpeg', NULL, '', '', 0),
(120, 1, '/assets/widget/gallery/WhatsApp_Image_2019-12-13_at_15.11_.19_1.jpeg', NULL, '', '', 0);

-- --------------------------------------------------------

--
-- Структура таблицы `widget_share`
--

CREATE TABLE `widget_share` (
  `id` int(11) NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `url` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `widget_share`
--

INSERT INTO `widget_share` (`id`, `name`, `url`) VALUES
(1, 'facebook', 'https://www.facebook.com/alexandrovo.tula'),
(2, 'vk', 'https://vk.com/usadba_alexandrovo'),
(10, 'youtube', 'https://www.youtube.com/channel/UCtUFASNajesyKguulHTQIjg'),
(11, 'instagram', 'https://www.instagram.com/alexsandrovo_tl/');

-- --------------------------------------------------------

--
-- Структура таблицы `widget_slider`
--

CREATE TABLE `widget_slider` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `slider_name` varchar(50) NOT NULL,
  `description` text
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `widget_slider`
--

INSERT INTO `widget_slider` (`id`, `name`, `slider_name`, `description`) VALUES
(1, 'Слайдер на главной', 'slider_main', '');

-- --------------------------------------------------------

--
-- Структура таблицы `widget_slider_data`
--

CREATE TABLE `widget_slider_data` (
  `id` int(11) NOT NULL,
  `slider_id` int(11) NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `url` varchar(255) DEFAULT NULL,
  `picture` varchar(255) DEFAULT NULL,
  `text` text,
  `button_name` varchar(255) DEFAULT NULL,
  `status` tinyint(4) DEFAULT NULL,
  `sort_index` int(11) NOT NULL DEFAULT '100'
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `widget_slider_data`
--

INSERT INTO `widget_slider_data` (`id`, `slider_id`, `name`, `url`, `picture`, `text`, `button_name`, `status`, `sort_index`) VALUES
(14, 1, 'Новый год в<br>русских<br>традициях', '/gallery/galereya-kottedjey', '/assets/widget/slider/2_(12).png', '<p>Бронируйте домики заранее</p>', 'Посмотреть галерею', 0, 100),
(16, 1, 'отдых, покоривший<br>сердца всей семьи', '', '/assets/widget/slider/1_(14).png', '<p>Приятная атмосфера в усадьбе Александрово</p>', '', 1, 100),
(15, 1, 'согрей душу и тело <br>холодной зимой<br> в настоящем<br>сибирском чане', '/gallery/galereya-kottedjey', '/assets/widget/slider/3_(14).png', '', 'Посмотреть галерею', 1, 100),
(17, 1, 'Программа новогодних<br>праздников в Усадьбе', '/gallery/prazdnichnaya-programma', '/assets/widget/slider/123321.png', '<p><span>Отдых для всей семьи</span></p>', 'Подробнее...', 0, 110);

--
-- Индексы сохранённых таблиц
--

--
-- Индексы таблицы `auth_groups`
--
ALTER TABLE `auth_groups`
  ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `auth_login_attempts`
--
ALTER TABLE `auth_login_attempts`
  ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `auth_users`
--
ALTER TABLE `auth_users`
  ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `auth_users_groups`
--
ALTER TABLE `auth_users_groups`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `uc_users_groups` (`user_id`,`group_id`),
  ADD UNIQUE KEY `id` (`id`),
  ADD KEY `fk_users_groups_users1_idx` (`user_id`),
  ADD KEY `fk_users_groups_groups1_idx` (`group_id`);

--
-- Индексы таблицы `booking`
--
ALTER TABLE `booking`
  ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `category`
--
ALTER TABLE `category`
  ADD PRIMARY KEY (`id`),
  ADD KEY `parent_id` (`parent_id`);

--
-- Индексы таблицы `ci_sessions`
--
ALTER TABLE `ci_sessions`
  ADD PRIMARY KEY (`session_id`),
  ADD KEY `last_activity_idx` (`last_activity`);

--
-- Индексы таблицы `comments`
--
ALTER TABLE `comments`
  ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `cottages`
--
ALTER TABLE `cottages`
  ADD PRIMARY KEY (`id`),
  ADD KEY `cat_id` (`cat_id`);

--
-- Индексы таблицы `cottages_data`
--
ALTER TABLE `cottages_data`
  ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `cottages_slider`
--
ALTER TABLE `cottages_slider`
  ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `forms`
--
ALTER TABLE `forms`
  ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `forms_id`
--
ALTER TABLE `forms_id`
  ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `forms_status`
--
ALTER TABLE `forms_status`
  ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `fragments`
--
ALTER TABLE `fragments`
  ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `fragment_category`
--
ALTER TABLE `fragment_category`
  ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `log`
--
ALTER TABLE `log`
  ADD PRIMARY KEY (`id`),
  ADD KEY `user` (`user_name`,`date`);

--
-- Индексы таблицы `menus`
--
ALTER TABLE `menus`
  ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `menus_data`
--
ALTER TABLE `menus_data`
  ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `modules`
--
ALTER TABLE `modules`
  ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `pages`
--
ALTER TABLE `pages`
  ADD PRIMARY KEY (`id`),
  ADD KEY `cat_id` (`cat_id`);

--
-- Индексы таблицы `pages_data`
--
ALTER TABLE `pages_data`
  ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `settings`
--
ALTER TABLE `settings`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `name` (`name`);

--
-- Индексы таблицы `widget_block`
--
ALTER TABLE `widget_block`
  ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `widget_gallery`
--
ALTER TABLE `widget_gallery`
  ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `widget_gallery_data`
--
ALTER TABLE `widget_gallery_data`
  ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `widget_share`
--
ALTER TABLE `widget_share`
  ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `widget_slider`
--
ALTER TABLE `widget_slider`
  ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `widget_slider_data`
--
ALTER TABLE `widget_slider_data`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT для сохранённых таблиц
--

--
-- AUTO_INCREMENT для таблицы `auth_groups`
--
ALTER TABLE `auth_groups`
  MODIFY `id` mediumint(8) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;
--
-- AUTO_INCREMENT для таблицы `auth_login_attempts`
--
ALTER TABLE `auth_login_attempts`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT для таблицы `auth_users`
--
ALTER TABLE `auth_users`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;
--
-- AUTO_INCREMENT для таблицы `auth_users_groups`
--
ALTER TABLE `auth_users_groups`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=19;
--
-- AUTO_INCREMENT для таблицы `booking`
--
ALTER TABLE `booking`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=101;
--
-- AUTO_INCREMENT для таблицы `category`
--
ALTER TABLE `category`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT для таблицы `comments`
--
ALTER TABLE `comments`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT для таблицы `cottages`
--
ALTER TABLE `cottages`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=27;
--
-- AUTO_INCREMENT для таблицы `cottages_data`
--
ALTER TABLE `cottages_data`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT для таблицы `cottages_slider`
--
ALTER TABLE `cottages_slider`
  MODIFY `id` int(6) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=562;
--
-- AUTO_INCREMENT для таблицы `forms`
--
ALTER TABLE `forms`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=28;
--
-- AUTO_INCREMENT для таблицы `forms_id`
--
ALTER TABLE `forms_id`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;
--
-- AUTO_INCREMENT для таблицы `forms_status`
--
ALTER TABLE `forms_status`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;
--
-- AUTO_INCREMENT для таблицы `fragments`
--
ALTER TABLE `fragments`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;
--
-- AUTO_INCREMENT для таблицы `fragment_category`
--
ALTER TABLE `fragment_category`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;
--
-- AUTO_INCREMENT для таблицы `log`
--
ALTER TABLE `log`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=215;
--
-- AUTO_INCREMENT для таблицы `menus`
--
ALTER TABLE `menus`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;
--
-- AUTO_INCREMENT для таблицы `menus_data`
--
ALTER TABLE `menus_data`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;
--
-- AUTO_INCREMENT для таблицы `modules`
--
ALTER TABLE `modules`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=30;
--
-- AUTO_INCREMENT для таблицы `pages`
--
ALTER TABLE `pages`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;
--
-- AUTO_INCREMENT для таблицы `pages_data`
--
ALTER TABLE `pages_data`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT для таблицы `settings`
--
ALTER TABLE `settings`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=42;
--
-- AUTO_INCREMENT для таблицы `widget_block`
--
ALTER TABLE `widget_block`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=20;
--
-- AUTO_INCREMENT для таблицы `widget_gallery`
--
ALTER TABLE `widget_gallery`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
--
-- AUTO_INCREMENT для таблицы `widget_gallery_data`
--
ALTER TABLE `widget_gallery_data`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=134;
--
-- AUTO_INCREMENT для таблицы `widget_share`
--
ALTER TABLE `widget_share`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;
--
-- AUTO_INCREMENT для таблицы `widget_slider`
--
ALTER TABLE `widget_slider`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT для таблицы `widget_slider_data`
--
ALTER TABLE `widget_slider_data`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=18;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
