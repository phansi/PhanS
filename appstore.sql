-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Máy chủ: 127.0.0.1
-- Thời gian đã tạo: Th3 24, 2023 lúc 04:55 AM
-- Phiên bản máy phục vụ: 10.4.27-MariaDB
-- Phiên bản PHP: 8.2.0

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Cơ sở dữ liệu: `appstore`
--

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `account`
--

CREATE TABLE `account` (
  `firstname` varchar(64) NOT NULL,
  `lastname` varchar(64) NOT NULL,
  `email` varchar(64) NOT NULL,
  `password` varchar(255) NOT NULL,
  `activated` bit(1) DEFAULT b'0',
  `activate_token` varchar(255) DEFAULT NULL,
  `accounttype` int(11) NOT NULL DEFAULT 3,
  `wallet` int(255) NOT NULL DEFAULT 100000,
  `avatar` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `account`
--

INSERT INTO `account` (`firstname`, `lastname`, `email`, `password`, `activated`, `activate_token`, `accounttype`, `wallet`, `avatar`) VALUES
('Admin', 'Phansi', 'admin@siphan.com', 'e10adc3949ba59abbe56e057f20f883e', b'1', NULL, 1, 5560000, '126266482_705052906793590_2892243489761745875_n.jpg'),
('Phan', 'Sĩ', 'phansi864@gmail.com', 'e10adc3949ba59abbe56e057f20f883e', b'1', 'c7192d11411daa9b555f6cf47626ea7b9d132a353058e2a1018b3c6e3c6bcfaca03b6b0d9ffeb1f4644ed9d19d26550097b7', 3, 2200000, '221119.png'),
('Si', 'Phan', 'siphan864@gmail.com', 'e10adc3949ba59abbe56e057f20f883e', b'1', NULL, 2, 2147483647, '131929641_722702295028651_1023205781934907728_n.jpg');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `application`
--

CREATE TABLE `application` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `description` varchar(255) DEFAULT NULL,
  `author` varchar(50) NOT NULL,
  `version` varchar(50) NOT NULL,
  `category` varchar(50) NOT NULL,
  `size` int(255) NOT NULL,
  `acception` int(1) NOT NULL DEFAULT 0,
  `publish` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `icon` varchar(255) NOT NULL,
  `download` varchar(255) NOT NULL,
  `price` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `application`
--

INSERT INTO `application` (`id`, `name`, `description`, `author`, `version`, `category`, `size`, `acception`, `publish`, `icon`, `download`, `price`) VALUES
(105, 'Camera HD', 'Ứng dụng chụp ảnh', 'admin@siphan.com', '1.1', 'Camera', 2770063, 1, '2023-03-09 02:01:38', 'camera HD.png', 'camera HD.zip', 10000),
(106, 'Camera360', 'Ứng dụng chụp ảnh', 'admin@siphan.com', '1.2', 'Camera', 16289445, 1, '2021-05-19 14:44:31', 'camera360 lite.png', 'camera360 lite.zip', 5000),
(107, 'TimestamCam', 'Ứng dụng chụp ảnh', 'admin@siphan.com', '1.3', 'Camera', 4374994, 1, '2021-05-19 14:44:30', 'timestamp camera.png', 'timestamp camera.zip', 20000),
(108, 'Topping Tube', 'Ứng dụng công cụ', 'admin@siphan.com', '1.6', 'Tools ', 6128186, 1, '2021-05-19 15:35:29', 'Topping Tube.png', 'Topping Tube.zip', 10000),
(109, 'Flashlight', 'Ứng dụng công cụ', 'admin@siphan.com', '1.7', 'Tools ', 2054386, 1, '2021-05-19 15:37:48', 'Pure Flashlight Super Bright LED.png', 'Pure Flashlight Super Bright LED.zip', 10000),
(110, 'One Touch', 'Ứng dụng công cụ', 'admin@siphan.com', '1.8', 'Tools ', 1527822, 1, '2021-05-19 15:40:28', 'Screen Off And Lock Screen One Touch To Lock.png', 'Screen Off And Lock Screen One Touch To Lock.zip', 10000),
(111, 'APK Extractor', 'Ứng dụng cho developer', 'admin@siphan.com', '1.9', 'For developer', 3460233, 1, '2021-05-19 15:41:50', 'APK Extractor Pro.png', 'APK Extractor Pro.zip', 10000),
(112, 'Developer APK', 'Ứng dụng cho developer', 'admin@siphan.com', '2.0', 'For developer', 3735887, 1, '2021-05-19 15:42:43', 'Developer APK.png', 'Developer APK.zip', 10000),
(113, 'Dvlp Assistant', 'Ứng dụng cho developer', 'admin@siphan.com', '2.1', 'For developer', 3317544, 1, '2021-05-19 15:43:57', 'Developer Assistant.png', 'Developer Assistant.zip', 100000),
(114, 'GGMyBusiness', 'Ứng dụng doanh nghiệp', 'admin@siphan.com', '2.1', 'Enterprise ', 13860020, 1, '2021-05-19 15:46:16', 'Google My Business.png', 'Google My Business.zip', 20000),
(115, 'LANDLORD GO', 'Ứng dụng doanh nghiệp', 'admin@siphan.com', '2.2', 'Enterprise ', 12239851, 1, '2021-05-19 15:47:16', 'LANDLORD GO Business Simulator.png', 'LANDLORD GO Business Simulator.zip', 30000),
(116, 'Ý tưởng ', 'Ứng dụng doanh nghiệp', 'admin@siphan.com', '2.3', 'Enterprise ', 3843957, 1, '2021-05-19 15:48:21', 'Ý tưởng kinh doanh.png', 'Ý tưởng kinh doanh.zip', 40000),
(117, 'Đào Vàng', 'Ứng dụng trò chơi', 'admin@siphan.com', '2.3', 'Games', 13085814, 1, '2021-05-19 15:49:40', 'Đào vàng.png', 'Đào vàng.zip', 1),
(118, 'Hỏi ngu', 'Ứng dụng trò chơi', 'admin@siphan.com', '2.4', 'Games', 7431214, 1, '2021-05-19 15:50:27', 'Hỏi ngu.png', 'Hỏi ngu.zip', 10000),
(119, 'Qua sông IQ', 'Ứng dụng trò chơi', 'admin@siphan.com', '2.4', 'Games', 8651848, 1, '2021-05-19 15:51:24', 'Qua sông IQ.png', 'Qua sông IQ.zip', 1),
(120, 'Bucha', 'Ứng dụng học ngôn ngữ', 'admin@siphan.com', '2.5', 'Learn languages ', 45513781, 1, '2021-05-19 15:52:18', 'Bucha.png', 'Bucha.zip', 1),
(121, 'Cake', 'Ứng dụng học ngôn ngữ', 'admin@siphan.com', '2.6', 'Learn languages ', 10793875, 1, '2021-05-19 15:52:59', 'Cake.png', 'Cake.zip', 60000),
(122, 'Tiếng Nhật', 'Ứng dụng học ngôn ngữ', 'admin@siphan.com', '2.6', 'Learn languages ', 14806595, 1, '2021-05-19 15:54:04', 'Học tiếng Nhật & Luyện nói tiếng Nhật mỗi ngày.png', 'Học tiếng Nhật & Luyện nói tiếng Nhật mỗi ngày.zip', 70000),
(123, 'Kylimba', 'Ứng dụng nghe nhạc', 'admin@siphan.com', '2.7', 'Music', 10560018, 1, '2021-05-19 15:55:53', 'Kylimba.png', 'Kylimba.zip', 80000),
(124, 'NhacCuaTui', 'Ứng dụng nghe nhạc', 'admin@siphan.com', '2.8', 'Music', 26806275, 1, '2021-05-19 15:55:54', 'NhacCuaTui.png', 'NhacCuaTui.zip', 1),
(125, 'ZingMP3', 'Ứng dụng nghe nhạc', 'admin@siphan.com', '2.9', 'Music', 14172002, 1, '2021-05-19 15:55:54', 'ZingMP3.png', 'ZingMP3.zip', 1),
(126, 'HomeID Admin', 'Ứng dụng tiện ích', 'admin@siphan.com', '3.0', 'Utilities', 16114557, 0, '2021-05-19 15:56:39', 'HomeID Admin.png', 'HomeID Admin.zip', 1),
(127, 'Home ảo', 'Ứng dụng tiện ích', 'admin@siphan.com', '3.1', 'Utilities', 1578861, 0, '2021-05-19 15:57:17', 'Phím Home ảo APK.png', 'Phím Home ảo APK.zip', 1),
(128, 'Widget', 'Ứng dụng tiện ích', 'admin@siphan.com', '3.2', 'Utilities', 8207187, 0, '2021-05-19 15:57:59', 'Widget đồng hồ & thời tiết đơn giản.png', 'Widget đồng hồ & thời tiết đơn giản.zip', 1),
(143, 'Liên Quân Mobie', 'Ứng dụng chơi game', 'admin@siphan.com', ' 1.49.1.3', 'Music', 2647299, 1, '2023-03-09 07:47:10', 'LienQuan.png', 'Garena Liên Quân Mobile_v1.49.1.3_APKPure_Installer.zip', 1),
(144, 'Minecraft', 'Ứng dụng để chơi', 'admin@siphan.com', 'v1.19.62.01', 'Games', 164175331, 1, '2023-03-09 07:51:57', 'Minecraft.png', 'minecraft-mod-apk-1.19.60.24-apkmodget.com.zip', 10000);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `category`
--

CREATE TABLE `category` (
  `name` varchar(50) NOT NULL,
  `id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `category`
--

INSERT INTO `category` (`name`, `id`) VALUES
('Music', 74),
('Games', 75),
('Utilities', 76),
('Learn languages ', 77),
('Camera', 78),
('Tools ', 79),
('Enterprise ', 80),
('For developer', 83),
('Map', 85);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `recharge`
--

CREATE TABLE `recharge` (
  `serialnumber` int(10) NOT NULL,
  `money` int(255) NOT NULL,
  `status` varchar(255) NOT NULL DEFAULT 'Chưa nạp',
  `numberofcards` int(11) NOT NULL,
  `Data_expiration` datetime NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `recharge`
--

INSERT INTO `recharge` (`serialnumber`, `money`, `status`, `numberofcards`, `Data_expiration`) VALUES
(160930462, 1000000, 'Đã nạp', 1, '2023-03-24 09:47:10'),
(257854343, 1000000, 'Đã nạp', 1, '2023-03-24 09:47:10'),
(765475641, 100000, 'Đã nạp', 1, '2023-03-24 09:46:02'),
(1105110902, 100000, 'Chưa nạp', 1, '2023-03-24 09:46:02'),
(1340596131, 100000, 'Chưa nạp', 1, '2023-03-24 09:46:02'),
(1553390493, 100000, 'Chưa nạp', 1, '2023-03-24 09:46:02'),
(1794331427, 1000000, 'Chưa nạp', 1, '2023-03-24 09:47:10'),
(1814376980, 500000, 'Đã nạp', 1, '2023-03-10 09:31:13'),
(1825643278, 1000000, 'Chưa nạp', 1, '2023-03-24 09:47:10'),
(1855540667, 200000, 'Chưa nạp', 1, '2023-03-10 09:31:19'),
(1856580880, 100000, 'Chưa nạp', 1, '2023-03-24 09:46:02'),
(1876545909, 200000, 'Chưa nạp', 1, '2023-03-10 09:31:19'),
(1908961417, 50000, 'Chưa nạp', 1, '2023-03-10 09:31:01'),
(1914098496, 100000, 'Chưa nạp', 1, '2023-03-24 09:46:02'),
(1915144125, 500000, 'Chưa nạp', 1, '2023-03-10 09:31:13'),
(1977341555, 100000, 'Chưa nạp', 1, '2023-03-10 09:31:07'),
(1994916946, 100000, 'Chưa nạp', 1, '2023-03-10 09:31:07'),
(2000192660, 1000000, 'Chưa nạp', 1, '2023-03-24 09:47:10'),
(2012827589, 100000, 'Chưa nạp', 1, '2023-03-24 09:46:02'),
(2019000800, 200000, 'Chưa nạp', 1, '2023-03-10 09:31:19'),
(2036133076, 100000, 'Chưa nạp', 1, '2023-03-10 09:31:07'),
(2041887535, 50000, 'Chưa nạp', 1, '2023-03-10 09:31:01'),
(2057507135, 100000, 'Chưa nạp', 1, '2023-03-24 09:46:02'),
(2062487365, 20000, 'Chưa nạp', 1, '2023-03-10 09:30:54'),
(2071428854, 100000, 'Chưa nạp', 1, '2023-03-10 09:31:07'),
(2099518490, 20000, 'Chưa nạp', 1, '2023-03-10 09:30:54'),
(2112426588, 100000, 'Chưa nạp', 1, '2023-03-10 09:31:07');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `recharge_history`
--

CREATE TABLE `recharge_history` (
  `seri` int(10) NOT NULL,
  `value` int(255) NOT NULL,
  `date` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `emailnap` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `recharge_history`
--

INSERT INTO `recharge_history` (`seri`, `value`, `date`, `emailnap`) VALUES
(160930462, 1000000, '2023-03-24 02:47:25', 'admin@siphan.com'),
(257854343, 1000000, '2023-03-24 02:48:05', 'siphan864@gmail.com'),
(765475641, 100000, '2023-03-24 02:56:59', 'admin@siphan.com'),
(828504845, 500000, '2023-03-13 04:21:12', 'admin@siphan.com'),
(842327720, 500000, '2023-03-13 04:27:03', 'admin@siphan.com'),
(952694902, 50000, '2023-03-13 04:50:18', 'admin@siphan.com'),
(954030470, 500000, '2023-03-13 07:25:21', 'admin@siphan.com'),
(999655247, 50000, '2023-03-13 07:26:06', 'admin@siphan.com'),
(1013989308, 200000, '2023-03-13 07:28:02', 'admin@siphan.com'),
(1020050660, 500000, '2023-03-13 07:29:10', 'admin@siphan.com'),
(1071788894, 100000, '2023-03-13 07:31:23', 'admin@siphan.com'),
(1165851487, 200000, '2023-03-13 07:31:32', 'admin@siphan.com'),
(1174214491, 500000, '2023-03-13 07:41:35', 'admin@siphan.com'),
(1258409966, 20000, '2023-03-13 07:41:46', 'admin@siphan.com'),
(1293460265, 500000, '2023-03-13 07:44:01', 'admin@siphan.com'),
(1328349588, 500000, '2023-03-13 07:44:57', 'admin@siphan.com'),
(1359807122, 200000, '2023-03-13 07:46:17', 'admin@siphan.com'),
(1421482308, 20000, '2023-03-13 07:54:05', 'admin@siphan.com'),
(1453500811, 200000, '2023-03-13 07:57:06', 'admin@siphan.com'),
(1466733055, 50000, '2023-03-13 08:18:11', 'admin@siphan.com'),
(1498738131, 100000, '2023-03-13 08:19:29', 'admin@siphan.com'),
(1501969884, 50000, '2023-03-13 08:20:17', 'admin@siphan.com'),
(1505282897, 500000, '2023-03-13 08:20:30', 'admin@siphan.com'),
(1512052782, 100000, '2023-03-13 08:23:51', 'admin@siphan.com'),
(1616589843, 500000, '2023-03-13 08:24:20', 'admin@siphan.com'),
(1738075222, 20000, '2023-03-17 04:49:06', 'admin@siphan.com');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `reset_token`
--

CREATE TABLE `reset_token` (
  `id` int(255) NOT NULL,
  `email` varchar(64) NOT NULL,
  `token` varchar(255) NOT NULL,
  `expire_on` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `reset_token`
--

INSERT INTO `reset_token` (`id`, `email`, `token`, `expire_on`) VALUES
(21, 'siphan864@gmail.com', '22280f1fe2f173c830706b55a825fd9c3ce93f92f7f44f4172915dee70070a78a676f32a7c270619176d693bec3681dde225', 0),
(22, 'admin@siphan.com', '291dfd2a4ea46bab222e31f9e885c0bcde41f94bff1ffe360e08233ba2a3bd50de84c168d0a2add030978bc935229ed8cb13', 0),
(23, 'siphan864@gmail.com', '4062cfbf42affd74d1e4ced57fc2b366c0d0033a86e1f3135500cb35c379fdb1664eb6dfdb9925ec1ec7c0e41fce9b1078ac', 0),
(24, 'siphan864@gmail.com', '48f0d0b3d65f8ec6ab2fdc5e236557c71b5ed902fac5131e607ae57c9dfd41ea55b6769b32df20db168c532dfdfb998dc05e', 0),
(25, 'siphan864@gmail.com', 'c78525da8955494e22112e0979bb210f9d48cf647737a2f61115c20e3f1eb3e8001f2531a2b3bae8431d4bbba78d5155728b', 0),
(26, 'siphan864@gmail.com', '5f1968dc2525a20d0de150bd7000fc537c8020cc19dc99a6a15facae29af69b90e0431327698ed4faeb3ff1234546550ca85', 0),
(27, 'siphan864@gmail.com', 'eb544d4b78f4f788cf740c1cb03069af76fcc87534766ec3dfcb91c784e684bf312094639d1598f89b53dc0f1556cf4b5995', 0),
(28, 'siphan864@gmail.com', '4d4c32e9f8d2d8f4b9f51785dd04337ce82be7ac91c427a88276a325f1b2ebf3f21d6fcb8ac2387dd216f394c80ffa41e8ff', 0),
(29, 'siphan864@gmail.com', '8dedfb76eeb41dd2b5ad68bac7377e39cca2b98c3961ed059294af098a73d91f51415c6ae2ca8daa15492afff1721fda7bdb', 0),
(30, 'siphan864@gmail.com', '9c414756070beb5e932b690d69f51406fd5a2a7d8b44bb54dd01382fc11035a891f2d6eb36eb2409e3bce85e503e49e62ba0', 0),
(31, 'siphan864@gmail.com', '4e9a535b86b090fc17673be7b4f7b93e2b5b5f170696b55ca66ce7df5c8588dcd25e71a7e9c4cea7659f618750f25d6421fe', 0),
(32, 'phansi864@gmail.com', '709c98bbad947ee29fad8937b18213f86704246729332680203be891d7fd25fcffe328f2ac7ef047bfb850e569dc3f44a7d3', 1620929668),
(33, 'siphan864@gmail.com', 'bea863b60760e290aac70d38325c1ae2de9f815eb094352172e39b9a089f0c2d24c5c02e4bfe48b0e50a57732966fab6977c', 0),
(34, 'siphan864@gmail.com', '25dda667e6f249e27cb578036c5021541f51ce347e71477ce0367b96399679941687f130ab03919e9311cd032389abf9f925', 1620929950),
(35, '01659427370n@gmail.com', '515ed5153e76b6d4a3c243bf9154683e40c58a8586f346ad0afee65ff28ea28244b20603f09fa481fb66c8713219c3e758a0', 0),
(36, 'admin@siphan.com', '35a9687fdead5668910c7f9701b0494ae5c9b8c21695f59250945a12af7d10f44cc952dbfa9853701d9c4cab0738ca344ee8', 1620994425),
(37, '01659427370n@gmail.com', '40b3497f958c6d6432020d8e2fd23bbd4777f56e754c7b00c81df1eaa410cae2ed6d38bdc24951854afe40096bbf489a4e1e', 1621355647);

--
-- Chỉ mục cho các bảng đã đổ
--

--
-- Chỉ mục cho bảng `account`
--
ALTER TABLE `account`
  ADD PRIMARY KEY (`email`);

--
-- Chỉ mục cho bảng `application`
--
ALTER TABLE `application`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `category`
--
ALTER TABLE `category`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `recharge`
--
ALTER TABLE `recharge`
  ADD PRIMARY KEY (`serialnumber`);

--
-- Chỉ mục cho bảng `recharge_history`
--
ALTER TABLE `recharge_history`
  ADD PRIMARY KEY (`seri`);

--
-- Chỉ mục cho bảng `reset_token`
--
ALTER TABLE `reset_token`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT cho các bảng đã đổ
--

--
-- AUTO_INCREMENT cho bảng `application`
--
ALTER TABLE `application`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=145;

--
-- AUTO_INCREMENT cho bảng `category`
--
ALTER TABLE `category`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=86;

--
-- AUTO_INCREMENT cho bảng `reset_token`
--
ALTER TABLE `reset_token`
  MODIFY `id` int(255) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=38;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
