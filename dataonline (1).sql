-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jan 03, 2023 at 03:11 PM
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
-- Database: `dataonline`
--

-- --------------------------------------------------------

--
-- Table structure for table `chitietdonhang`
--

CREATE TABLE `chitietdonhang` (
  `iddonhang` int(11) NOT NULL,
  `idsp` int(11) NOT NULL,
  `soluong` int(11) NOT NULL,
  `gia` varchar(255) COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `chitietdonhang`
--

INSERT INTO `chitietdonhang` (`iddonhang`, `idsp`, `soluong`, `gia`) VALUES
(35, 16, 1, '2520000'),
(35, 15, 2, '1960000'),
(35, 14, 1, '2390000'),
(36, 16, 1, '2520000'),
(36, 15, 1, '1960000'),
(37, 15, 1, '1960000'),
(38, 16, 2, '2520000'),
(39, 10, 2, '6590000'),
(39, 11, 1, '3490000'),
(40, 27, 1, '2300000'),
(41, 27, 1, '2300000'),
(42, 26, 1, '2300000'),
(43, 27, 1, '2300000'),
(44, 27, 1, '2300000'),
(45, 26, 1, '2300000'),
(46, 5, 1, '5100000'),
(46, 27, 1, '2300000'),
(47, 27, 1, '2300000'),
(47, 21, 1, '1400000'),
(47, 26, 1, '2300000'),
(48, 21, 1, '1400000'),
(49, 27, 1, '2300000'),
(49, 26, 1, '2300000'),
(50, 26, 1, '2300000'),
(51, 27, 1, '2300000'),
(52, 16, 1, '2520000'),
(53, 26, 1, '2300000'),
(54, 21, 2, '1400000'),
(55, 27, 7, '2300000'),
(55, 26, 1, '2300000'),
(56, 26, 5, '2300000'),
(56, 27, 1, '2300000'),
(57, 26, 1, '2300000'),
(58, 26, 1, '2300000');

-- --------------------------------------------------------

--
-- Table structure for table `donhang`
--

CREATE TABLE `donhang` (
  `id` int(11) NOT NULL,
  `iduser` int(11) NOT NULL,
  `diachi` text COLLATE utf8_unicode_ci NOT NULL,
  `sodienthoai` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `soluong` int(11) NOT NULL,
  `tongtien` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `trangthai` int(2) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `donhang`
--

INSERT INTO `donhang` (`id`, `iduser`, `diachi`, `sodienthoai`, `email`, `soluong`, `tongtien`, `trangthai`) VALUES
(35, 1, 'Phu Quoc', '0907703638', 'ttp15112001@gmail.com', 4, '8830000', 1),
(36, 1, 'KIEN GIANG', '0907703638', 'ttp15112001@gmail.com', 2, '4480000', 2),
(37, 1, 'Bien Hoa', '0907703638', 'ttp15112001@gmail.com', 1, '1960000', 3),
(38, 1, 'Bac Lieu', '0907703638', 'ttp15112001@gmail.com', 2, '5040000', 4),
(39, 1, 'Can Gio', '0907703638', 'ttp15112001@gmail.com', 3, '16670000', 0),
(40, 12, 'An Giang', '0907703638', 'user1@gmail.com', 1, '2300000', 0),
(41, 12, 'Ba Ria', '0907703638', 'user1@gmail.com', 1, '2300000', 0),
(42, 11, 'Dak Nong', '0907703638', 'tthanhphong15112001@gmail.com', 1, '2300000', 0),
(43, 12, 'Ha Giang', '0907703638', 'user1@gmail.com', 1, '2300000', 0),
(44, 12, 'Dien Bien', '0907703638', 'user1@gmail.com', 1, '2300000', 0),
(45, 12, 'Ha Tinh', '0907703638', 'user1@gmail.com', 1, '2300000', 0),
(46, 12, 'Ca Mau', '0907703638', 'user1@gmail.com', 2, '7400000', 0),
(47, 12, 'Ha Tien', '0907703638', 'user1@gmail.com', 3, '6000000', 3),
(48, 12, 'Vung Tau', '0907703638', 'user1@gmail.com', 1, '1400000', 2),
(49, 12, 'Ha Noi', '0907703638', 'user1@gmail.com', 2, '4600000', 0),
(50, 12, 'Ha Tinh', '0907703638', 'user1@gmail.com', 1, '2300000', 2),
(51, 13, 'Bac Can', '123456789', 'user2@gmail.com', 1, '2300000', 0),
(52, 13, 'Ba Ria', '123456789', 'user2@gmail.com', 1, '2520000', 3),
(53, 13, 'Dak Lak', '123456789', 'user2@gmail.com', 1, '2300000', 2),
(54, 13, 'Ha Giang', '123456789', 'user2@gmail.com', 2, '2800000', 2),
(55, 12, 'An Giang', '0907703638', 'user1@gmail.com', 8, '18400000', 4),
(56, 15, 'Can Tho', '0907703638', 'user4@gmail.com', 6, '13800000', 0),
(57, 15, 'qwe', '0907703638', 'user4@gmail.com', 1, '2300000', 0),
(58, 15, 'phong', '0907703638', 'user4@gmail.com', 1, '2300000', 0);

-- --------------------------------------------------------

--
-- Table structure for table `sanpham`
--

CREATE TABLE `sanpham` (
  `id` int(11) NOT NULL,
  `tensanpham` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `hinhanh` text COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `sanpham`
--

INSERT INTO `sanpham` (`id`, `tensanpham`, `hinhanh`) VALUES
(1, 'Trang Chủ', 'https://cdn-icons-png.flaticon.com/512/2920/2920665.png'),
(2, 'Adidas', 'https://upload.wikimedia.org/wikipedia/commons/thumb/2/20/Adidas_Logo.svg/2560px-Adidas_Logo.svg.png'),
(3, 'Nike', 'https://upload.wikimedia.org/wikipedia/commons/thumb/a/a6/Logo_NIKE.svg/1200px-Logo_NIKE.svg.png'),
(4, 'Liên Hệ', 'data:image/png;base64,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'),
(5, 'Thông Tin', 'https://thumbs.dreamstime.com/b/info-icon-information-sign-icon-info-speech-bubble-symbol-i-letter-vector-illustrator-info-icon-information-sign-icon-info-speech-123041187.jpg'),
(7, 'Đơn Hàng', 'https://t3.ftcdn.net/jpg/03/14/84/68/360_F_314846831_5jJsC7Us9obgwMjRDqFhs04dodzvnZvi.jpg');

-- --------------------------------------------------------

--
-- Table structure for table `sanphammoi`
--

CREATE TABLE `sanphammoi` (
  `id` int(11) NOT NULL,
  `tensp` varchar(250) COLLATE utf8_unicode_ci NOT NULL,
  `giasp` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `hinhanh` text COLLATE utf8_unicode_ci NOT NULL,
  `mota` text COLLATE utf8_unicode_ci NOT NULL,
  `loai` int(2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `sanphammoi`
--

INSERT INTO `sanphammoi` (`id`, `tensp`, `giasp`, `hinhanh`, `mota`, `loai`) VALUES
(1, 'Nike Air Max Terrascape 97', '5400000', 'https://static.nike.com/a/images/t_PDP_864_v1/f_auto,b_rgb:f5f5f5/bee0364a-908b-479c-a3de-0966148faa45/air-max-terrascape-97-shoes-3cGxRv.png', 'Looking to nature for inspiration, the Nike Air Max Terrascape 97 lets you push your style full speed ahead. Made from at least 20% recycled materials by weight, nearly every detail is thoughtfully crafted with some recycled content. Upping the ante, durable foam in the midsole and rubber on the outsole feature speckled Nike Grind for a playful, earthy look.', 3),
(2, 'Nike Blazer Mid \'77 Premium\r\n', '6590000', 'https://static.nike.com/a/images/t_PDP_864_v1/f_auto,b_rgb:f5f5f5/f75474b9-1b5a-4e90-bbf4-468706655042/blazer-mid-77-shoes-3Jpkm6.png', 'Styled for the \'70s. Loved in the \'80s. Classic in the \'90s. Ready for the future. The Nike Blazer Mid gets you ready for wintertime with a cosy collar that pairs perfectly with your favourite seasonal jumper.', 3),
(3, 'Air Jordan 1 Mid SE', '3490000', 'https://static.nike.com/a/images/t_PDP_864_v1/f_auto,b_rgb:f5f5f5/a5b25746-8542-44ef-afcc-39a77628fd9a/air-jordan-1-mid-se-shoes-pZbfP8.png', 'Get that Jordan energy on your feet this festive season. Rich grain leather with bright details make this pair shine like festive lights.', 3),
(4, 'Nike Air Force 1 Low Retro', '1990000', 'https://static.nike.com/a/images/t_PDP_864_v1/f_auto,b_rgb:f5f5f5/fbe2af03-4f91-4522-8b47-4fbd41323cd1/air-force-1-low-retro-shoes-FPRmPs.png', 'Original point maker turned streetwear king celebrates 40 years of turning heads. With everything you know best—stitched overlays, crisp leather and the perfect amount of hoops style—the Nike Air Force 1 Low delivers a near 1:1 remake of the original. Happy anniversary.', 3),
(5, 'NMD_R1 SHOES', '5100000', 'https://assets.adidas.com/images/h_840,f_auto,q_auto,fl_lossy,c_fill,g_auto/568b240742dc414b9794af510158329b_9366/NMD_R1_Shoes_Black_FZ5877_01_standard.jpg', 'This product is excluded from all promotional discounts and offers.', 2),
(6, 'CAMPUS 80S SHOES', '2390000', 'https://assets.adidas.com/images/h_840,f_auto,q_auto,fl_lossy,c_fill,g_auto/4e133aa0c062494eb865ae9900ccc177_9366/Campus_80s_Shoes_Blue_GY4588_01_standard.jpg', 'This product is excluded from all promotional discounts and offers.', 2),
(7, 'DISNEY FORUM 84 LOW SHOES', '1960000', 'https://assets.adidas.com/images/h_840,f_auto,q_auto,fl_lossy,c_fill,g_auto/6cb9e66ac95843e4a3ceae16010d28b8_9366/Disney_Forum_84_Low_Shoes_White_GV7929_01_standard.jpg', 'Styled for the \'70s. Loved in the \'80s. Classic in the \'90s. Ready for the future. The Nike Blazer Mid gets you ready for wintertime with a cosy collar that pairs perfectly with your favourite seasonal jumper.', 2),
(8, 'NMD_R1 SHOES', '2520000', 'https://assets.adidas.com/images/h_840,f_auto,q_auto,fl_lossy,c_fill,g_auto/07cf32fcb5a94272954baed3010d6cd2_9366/NMD_R1_Shoes_Green_GW9477_01_standard.jpg', 'Original point maker turned streetwear king celebrates 40 years of turning heads. With everything you know best—stitched overlays, crisp leather and the perfect amount of hoops style—the Nike Air Force 1 Low delivers a near 1:1 remake of the original. Happy anniversary.', 2),
(9, 'Nike Air Max Terrascape 97', '5400000', 'https://static.nike.com/a/images/t_PDP_864_v1/f_auto,b_rgb:f5f5f5/bee0364a-908b-479c-a3de-0966148faa45/air-max-terrascape-97-shoes-3cGxRv.png', 'Looking to nature for inspiration, the Nike Air Max Terrascape 97 lets you push your style full speed ahead. Made from at least 20% recycled materials by weight, nearly every detail is thoughtfully crafted with some recycled content. Upping the ante, durable foam in the midsole and rubber on the outsole feature speckled Nike Grind for a playful, earthy look.', 3),
(10, 'Nike Blazer Mid \'77 Premium\r\n', '6590000', 'https://static.nike.com/a/images/t_PDP_864_v1/f_auto,b_rgb:f5f5f5/f75474b9-1b5a-4e90-bbf4-468706655042/blazer-mid-77-shoes-3Jpkm6.png', 'Styled for the \'70s. Loved in the \'80s. Classic in the \'90s. Ready for the future. The Nike Blazer Mid gets you ready for wintertime with a cosy collar that pairs perfectly with your favourite seasonal jumper.', 3),
(11, 'Air Jordan 1 Mid SE', '3490000', 'https://static.nike.com/a/images/t_PDP_864_v1/f_auto,b_rgb:f5f5f5/a5b25746-8542-44ef-afcc-39a77628fd9a/air-jordan-1-mid-se-shoes-pZbfP8.png', 'Get that Jordan energy on your feet this festive season. Rich grain leather with bright details make this pair shine like festive lights.', 3),
(12, 'Nike Air Force 1 Low Retro', '1990000', 'https://static.nike.com/a/images/t_PDP_864_v1/f_auto,b_rgb:f5f5f5/fbe2af03-4f91-4522-8b47-4fbd41323cd1/air-force-1-low-retro-shoes-FPRmPs.png', 'Original point maker turned streetwear king celebrates 40 years of turning heads. With everything you know best—stitched overlays, crisp leather and the perfect amount of hoops style—the Nike Air Force 1 Low delivers a near 1:1 remake of the original. Happy anniversary.', 3),
(13, 'NMD_R1 SHOES', '5100000', 'https://assets.adidas.com/images/h_840,f_auto,q_auto,fl_lossy,c_fill,g_auto/568b240742dc414b9794af510158329b_9366/NMD_R1_Shoes_Black_FZ5877_01_standard.jpg', 'This product is excluded from all promotional discounts and offers.', 2),
(14, 'CAMPUS 80S SHOES', '2390000', 'https://assets.adidas.com/images/h_840,f_auto,q_auto,fl_lossy,c_fill,g_auto/4e133aa0c062494eb865ae9900ccc177_9366/Campus_80s_Shoes_Blue_GY4588_01_standard.jpg', 'This product is excluded from all promotional discounts and offers.', 2),
(15, 'DISNEY FORUM 84 LOW SHOES', '1960000', 'https://assets.adidas.com/images/h_840,f_auto,q_auto,fl_lossy,c_fill,g_auto/6cb9e66ac95843e4a3ceae16010d28b8_9366/Disney_Forum_84_Low_Shoes_White_GV7929_01_standard.jpg', 'Styled for the \'70s. Loved in the \'80s. Classic in the \'90s. Ready for the future. The Nike Blazer Mid gets you ready for wintertime with a cosy collar that pairs perfectly with your favourite seasonal jumper.', 2),
(16, 'NMD_R1 SHOES', '2520000', 'https://assets.adidas.com/images/h_840,f_auto,q_auto,fl_lossy,c_fill,g_auto/07cf32fcb5a94272954baed3010d6cd2_9366/NMD_R1_Shoes_Green_GW9477_01_standard.jpg', 'Original point maker turned streetwear king celebrates 40 years of turning heads. With everything you know best—stitched overlays, crisp leather and the perfect amount of hoops style—the Nike Air Force 1 Low delivers a near 1:1 remake of the original. Happy anniversary.', 2),
(20, 'Nike Jump', '1500000', 'https://static.nike.com/a/images/c_limit,w_592,f_auto/t_product_v1/0347d890-b837-475f-a1eb-850d09e7bd28/air-force-1-07-shoes-x9rqBh.png', 'Khong co mo ta san pham', 2),
(21, 'Nike', '1400000', 'https://static.nike.com/a/images/t_PDP_864_v1/f_auto,b_rgb:f5f5f5/fffcad8e-18ad-4ea3-9c18-bb2c819f38f0/free-metcon-4-training-shoes-hr4JbW.png', 'Khong co mo ta san pham', 2),
(25, 'NIke Air', '2300000', '25.jpg', 'Khong Co', 2),
(26, 'NIke Phong', '2300000', '26.jpg', 'Khong co mo ta sn pham', 2),
(27, 'Nike PQ', '2300000', '28.jpg', 'Khong Co Mo Ta', 1),
(28, 'Phong', '1500000', '28.jpg', 'khong co mo ta', 2),
(29, 'Phong', '1500000', '28.jpg', 'khong co mo ta', 2);

-- --------------------------------------------------------

--
-- Table structure for table `user`
--

CREATE TABLE `user` (
  `id` int(11) NOT NULL,
  `email` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `pass` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `username` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `mobile` varchar(15) COLLATE utf8_unicode_ci NOT NULL,
  `uid` text COLLATE utf8_unicode_ci NOT NULL,
  `token` text COLLATE utf8_unicode_ci NOT NULL,
  `status` int(2) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `user`
--

INSERT INTO `user` (`id`, `email`, `pass`, `username`, `mobile`, `uid`, `token`, `status`) VALUES
(11, 'tthanhphong15112001@gmail.com', '1231234', 'TThanh Phong', '0907703638', 'PvUAH3ymzDQqIUpbgZY0FROJn7G3', 'fA__mjb9RGSUIZDg4QedBF:APA91bHPlZhvLt7yw8tNvXYYwCfL4C49UiZAGCRma0GTgftiSFLfbkr5snWYP-wRWkj1RPO_89zFy6Cdzh9IEzm8rBncnrb3d44RVu7Y7EIhGsW5NEC5VNDvZfAmAYsajq5iSvY5NOe-', 1),
(12, 'user1@gmail.com', '123123', 'TRAN THANH A', '0907703638', 'qNAWWJyEnAPquwHncECZulRzKuB3', 'fj746tg-QeqffTJyNFYF2r:APA91bHXSGMFXehh6QOw2YOwB_EWzRPTUwOUgr3Z5c9iRUmfFBHC-BSRZMVMk7R_-IQLABYvHujDGpNIkmTTDhikLeSTv-rQ_3LNbnk8DcG8B8TtoUU4QybgL9eR5HK4Z8Ya2zNhx6sq', 0),
(13, 'user2@gmail.com', '123123', 'Tran Thanh Bao', '123456789', 'm3PoYpDCVrNo26F0Zo6BrA4cePw2', 'e4iwKR4kQ-yL8J5GYW5qZP:APA91bHnVnmZ_5GGa9fe3xzbQZDpvKSVCWRty-45-e-osHHGIc78I1f_OULixjwnxvbiB2jwEhsEjfHFqeKDZpRJgp_99SQe7Y_o0sdJ43phXrq9u0mFil2YL7tfcnT2jJgFQJPSgzpk', 0),
(14, 'user3@gmail.com', '123123', 'Thanh Bao', '1234567891', 'aszr8iUQ1aPI8Jdm7HKnWjYNjSi2', 'fj746tg-QeqffTJyNFYF2r:APA91bHXSGMFXehh6QOw2YOwB_EWzRPTUwOUgr3Z5c9iRUmfFBHC-BSRZMVMk7R_-IQLABYvHujDGpNIkmTTDhikLeSTv-rQ_3LNbnk8DcG8B8TtoUU4QybgL9eR5HK4Z8Ya2zNhx6sq', 0),
(15, 'user4@gmail.com', '123123', 'Group 247', '0907703638', 'XoA9QVLLCeZbtAvbwVN0zX5ny1l1', 'fj746tg-QeqffTJyNFYF2r:APA91bHXSGMFXehh6QOw2YOwB_EWzRPTUwOUgr3Z5c9iRUmfFBHC-BSRZMVMk7R_-IQLABYvHujDGpNIkmTTDhikLeSTv-rQ_3LNbnk8DcG8B8TtoUU4QybgL9eR5HK4Z8Ya2zNhx6sq', 0),
(16, 'user6@gmail.com', '123123', 'tthanh phong', '0907703537', '1IYJ7YMppTe5XhlnREFPH5JUGIU2', '', 0);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `donhang`
--
ALTER TABLE `donhang`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `sanpham`
--
ALTER TABLE `sanpham`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `sanphammoi`
--
ALTER TABLE `sanphammoi`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `donhang`
--
ALTER TABLE `donhang`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=59;

--
-- AUTO_INCREMENT for table `sanpham`
--
ALTER TABLE `sanpham`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `sanphammoi`
--
ALTER TABLE `sanphammoi`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=30;

--
-- AUTO_INCREMENT for table `user`
--
ALTER TABLE `user`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
