-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: May 21, 2025 at 07:14 PM
-- Server version: 10.4.32-MariaDB
-- PHP Version: 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `thoitrangnam`
--

-- --------------------------------------------------------

--
-- Table structure for table `brands`
--

CREATE TABLE `brands` (
  `id` int(11) NOT NULL,
  `name` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `mota` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `carts`
--

CREATE TABLE `carts` (
  `id` int(11) NOT NULL,
  `product_name` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `product_id` int(11) NOT NULL,
  `product_price` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `product_image` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `product_quantity` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `categories`
--

CREATE TABLE `categories` (
  `id` int(11) NOT NULL,
  `name` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `parent_id` int(11) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `categories`
--

INSERT INTO `categories` (`id`, `name`, `parent_id`) VALUES
(1, 'Áo Polo', 1),
(2, 'Áo Thun', 1),
(3, 'Áo Sơ Mi', 1),
(4, 'Áo Blazer', 1),
(5, 'Áo Khoác', 1),
(6, 'Áo Len', 1),
(7, 'Áo Nỉ', 1),
(8, 'Quần Short', 2),
(9, 'Quần Jeans', 2),
(10, 'Quần Âu', 2),
(11, 'Quần Dài Kaki', 2),
(12, 'Quần Nỉ', 2);

-- --------------------------------------------------------

--
-- Table structure for table `feedback`
--

CREATE TABLE `feedback` (
  `id` int(11) NOT NULL,
  `fname` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `phone_number` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `address` varchar(250) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `subject_name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `note` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `status` int(11) DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `gallery`
--

CREATE TABLE `gallery` (
  `id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL,
  `thumbnail` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `orders`
--

CREATE TABLE `orders` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `fullname` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `phone_number` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `address` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `note` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `order_date` datetime NOT NULL,
  `status` int(11) NOT NULL,
  `total_money` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `order_details`
--

CREATE TABLE `order_details` (
  `id` int(11) NOT NULL,
  `order_id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL,
  `price` int(11) NOT NULL,
  `num` int(11) NOT NULL,
  `total_money` int(11) NOT NULL,
  `size` varchar(10) NOT NULL,
  `color` varchar(30) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `products`
--

CREATE TABLE `products` (
  `id` int(11) NOT NULL,
  `category_id` int(11) NOT NULL,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `price` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `discount` int(11) DEFAULT NULL,
  `image` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `brand` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `description` text DEFAULT NULL,
  `quantity` int(11) NOT NULL,
  `active` int(11) NOT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `deleted` int(11) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `products`
--

INSERT INTO `products` (`id`, `category_id`, `name`, `price`, `discount`, `image`, `brand`, `description`, `quantity`, `active`, `created_at`, `updated_at`, `deleted`) VALUES
(1, 1, 'Áo Polo trơn bo kẻ thêu logo ngực TRN FSTP055', '420000', 420000, 'assets/photos/polo1.jpg', '', '<p><strong>&Aacute;o Polo trơn bo kẻ th&ecirc;u logo ngực FSTP055 ch&iacute;nh h&atilde;ng Torano</strong>&nbsp;với chất vải cho độ d&agrave;y dặn,co gi&atilde;n tốt v&agrave; quan trọng độ bền m&agrave;u cao. Giặt kh&ocirc;ng đổ l&ocirc;ng hay bay m&agrave;u, thấm h&uacute;t mồ h&ocirc;i v&agrave; thoải m&aacute;i kh&ocirc;ng g&ograve; b&oacute; khi vận động. Đ&acirc;y l&agrave; mẫu &aacute;o polo nam chất lượng ch&iacute;nh h&atilde;ng m&agrave; gi&aacute; tốt nhất tại&nbsp;<strong>Torano</strong>.</p>\r\n\r\n<p><img src=\"https://file.hstatic.net/200000690725/file/481304594_1050568410450073_5630066486174957142_n_grande.jpg\" /></p>\r\n\r\n<p><img src=\"https://file.hstatic.net/200000690725/file/481275253_1050568370450077_4759594673763870994_n_grande.jpg\" /></p>\r\n\r\n<p><img src=\"https://file.hstatic.net/200000690725/file/481654440_1050568393783408_5547724036658028157_n_grande.jpg\" /></p>\r\n\r\n<p><img src=\"https://file.hstatic.net/200000690725/file/z6418141669370_e60e4e085bb73f5613c655d714cfcbc3_grande.jpg\" /></p>\r\n\r\n<p>????CH&Iacute;NH S&Aacute;CH ĐỔI:</p>\r\n\r\n<p>&bull; Torano hỗ trợ đổi h&agrave;ng trong trường hợp: sản phẩm&nbsp;mặc kh&ocirc;ng vừa, kh&aacute;ch kh&ocirc;ng ưng sản phẩm đ&atilde; đặt, sản phẩm c&oacute; lỗi của nh&agrave; sản xuất. &nbsp;<br />\r\n&bull; Sản phẩm đổi phải đạt điều kiện: c&ograve;n nguy&ecirc;n tem m&aacute;c, chưa qua sử dụng, kh&ocirc;ng c&oacute; vết bẩn, r&aacute;ch&hellip; &nbsp;<br />\r\n&bull; Thời gian đổi: trong v&ograve;ng 7 NG&Agrave;Y kể từ ng&agrave;y kh&aacute;ch nhận h&agrave;ng. &nbsp;<br />\r\n&bull; LƯU &Yacute;: &nbsp;&nbsp; &nbsp;<br />\r\n- Nếu c&oacute; khiếu nại cần hỗ trợ, qu&yacute; kh&aacute;ch CẦN C&Oacute; VIDEO QUAY LẠI QU&Aacute; TR&Igrave;NH MỞ H&Agrave;NG để đảm bảo vấn đề sẽ được giải quyết 100%.</p>', 1000, 1, '2025-05-21 15:12:27', '2025-05-21 15:12:27', 0),
(2, 1, 'Áo polo can phối thêu logo đại bàng GSTP047', '480000', 299000, 'assets/photos/polo2.jpg', '', '<p><strong>EAGLEMAN POLO</strong>&nbsp;mang tinh thần mạnh mẽ của đại b&agrave;ng, l&agrave; tuy&ecirc;n ng&ocirc;n cho những người đ&agrave;n &ocirc;ng bản lĩnh - kh&ocirc;ng chấp nhận giới hạn m&agrave; lu&ocirc;n tung c&aacute;nh bay xa, chinh phục mọi thử th&aacute;ch với phong th&aacute;i tự tin v&agrave; tinh thần tự do.</p>\r\n\r\n<p>L&agrave; d&ograve;ng Polo Coolmax được&nbsp;<strong>TORANO</strong>&nbsp;nghi&ecirc;n cứu &amp; ph&aacute;t triển trong 10 năm;&nbsp;<strong>&Aacute;o polo can phối th&ecirc;u logo ngực GSTP047</strong>&nbsp;l&agrave; phi&ecirc;n bản mới nhất với c&ocirc;ng nghệ v&agrave; gi&aacute; th&agrave;nh ph&ugrave; hợp với kh&aacute;ch h&agrave;ng Việt.</p>\r\n\r\n<p><img src=\"https://file.hstatic.net/200000690725/file/2._cong_nghe_moi_1.1_grande.jpg\" /></p>\r\n\r\n<p><img alt=\"✔\" height=\"16\" src=\"https://static.xx.fbcdn.net/images/emoji.php/v9/t51/1/16/2714.png\" width=\"16\" />&nbsp;Vải Coolmax hiệu suất cao kết hợp sợi Microfiber si&ecirc;u mảnh tăng khả năng h&uacute;t ẩm &amp; tho&aacute;t ẩm gấp 3 lần</p>\r\n\r\n<p><img alt=\"✔\" height=\"16\" src=\"https://static.xx.fbcdn.net/images/emoji.php/v9/t51/1/16/2714.png\" width=\"16\" />&nbsp;C&ocirc;ng nghệ lớp phủ ARCTIC COOL tạo cảm gi&aacute;c m&aacute;t lạnh trong 3s đầu ti&ecirc;n chạm</p>\r\n\r\n<p><img alt=\"✔\" height=\"16\" src=\"https://static.xx.fbcdn.net/images/emoji.php/v9/t51/1/16/2714.png\" width=\"16\" />&nbsp;Logo th&ecirc;u họa tiết đại b&agrave;ng c&aacute;ch điệu thể hiện sự mạnh mẽ, bản lĩnh đ&agrave;n &ocirc;ng</p>\r\n\r\n<p><img alt=\"✔\" height=\"16\" src=\"https://static.xx.fbcdn.net/images/emoji.php/v9/t51/1/16/2714.png\" width=\"16\" />&nbsp;Chất &aacute;o nhẹ, mềm mịn, kh&ocirc;ng nhăn nh&agrave;u, nhanh kh&ocirc;</p>\r\n\r\n<p><img alt=\"✔\" height=\"16\" src=\"https://static.xx.fbcdn.net/images/emoji.php/v9/t51/1/16/2714.png\" width=\"16\" />&nbsp;Form slimfit vừa vặn, khỏe khoắn, co gi&atilde;n, vận động thoải m&aacute;i</p>\r\n\r\n<p><img alt=\"✔\" height=\"16\" src=\"https://static.xx.fbcdn.net/images/emoji.php/v9/t51/1/16/2714.png\" width=\"16\" />&nbsp;Sản phẩm tuyệt vời để mặc hoặc l&agrave;m qu&agrave; tặng cho người th&acirc;n y&ecirc;u</p>\r\n\r\n<p><img src=\"https://file.hstatic.net/200000690725/file/3._lop_lam_mat_grande.jpg\" /></p>\r\n\r\n<p><img src=\"https://file.hstatic.net/200000690725/file/4._cau_truc_soi_microfiber_grande.jpg\" /></p>\r\n\r\n<p><img src=\"https://file.hstatic.net/200000690725/file/482298455_1070485545109669_8970420544339377501_n_grande.jpg\" /></p>\r\n\r\n<p>???? Mix:</p>\r\n\r\n<p>+ Quần vải (Đen/ Xanh t&iacute;m than) + Gi&agrave;y lười/Gi&agrave;y thể thao.</p>\r\n\r\n<p>+ Quần kaki (Đen/ Trắng/ Xanh t&iacute;m than) + Gi&agrave;y lười/Gi&agrave;y thể thao.</p>\r\n\r\n<p>+ Jeans + Gi&agrave;y lười/Gi&agrave;y thể thao</p>\r\n\r\n<p><img src=\"https://file.hstatic.net/200000690725/file/img_5625_54397278617_o_grande.jpg\" /></p>\r\n\r\n<p><img src=\"https://file.hstatic.net/200000690725/file/img_6081_54397278587_o_grande.jpg\" /></p>\r\n\r\n<p>????Hướng dẫn sử dụng:</p>\r\n\r\n<p>+ Giặt m&aacute;y với chu kỳ trung b&igrave;nh v&agrave; v&ograve;ng quay ngắn</p>\r\n\r\n<p>+ Giặt với nhiệt độ tối đa 30 độ C</p>\r\n\r\n<p>+ Sấy nhẹ ở nhiệt độ thường</p>\r\n\r\n<p>+ L&agrave; ủi kh&ocirc;ng qu&aacute; 110 độ C</p>\r\n\r\n<p>+ Phơi bằng m&oacute;c dưới b&oacute;ng r&acirc;m</p>\r\n\r\n<p>+ Kh&ocirc;ng sử dụng chất tẩy</p>\r\n\r\n<p>???? Lưu &yacute; nhỏ:</p>\r\n\r\n<p>+ Kh&ocirc;ng giặt chung với đồ dễ xước</p>\r\n\r\n<p>+ Cẩn thận vướng mắc khi phơi</p>\r\n\r\n<p><img src=\"https://file.hstatic.net/200000690725/file/z6418141669370_e60e4e085bb73f5613c655d714cfcbc3_grande.jpg\" /></p>\r\n\r\n<p>????CH&Iacute;NH S&Aacute;CH ĐỔI:</p>\r\n\r\n<p>&bull; Torano hỗ trợ đổi h&agrave;ng trong trường hợp: sản phẩm&nbsp;mặc kh&ocirc;ng vừa, kh&aacute;ch kh&ocirc;ng ưng sản phẩm đ&atilde; đặt, sản phẩm c&oacute; lỗi của nh&agrave; sản xuất. &nbsp;<br />\r\n&bull; Sản phẩm đổi phải đạt điều kiện: c&ograve;n nguy&ecirc;n tem m&aacute;c, chưa qua sử dụng, kh&ocirc;ng c&oacute; vết bẩn, r&aacute;ch&hellip; &nbsp;<br />\r\n&bull; Thời gian đổi: trong v&ograve;ng 7 NG&Agrave;Y kể từ ng&agrave;y kh&aacute;ch nhận h&agrave;ng. &nbsp;<br />\r\n&bull; LƯU &Yacute;: &nbsp;&nbsp; &nbsp;<br />\r\n- Nếu c&oacute; khiếu nại cần hỗ trợ, qu&yacute; kh&aacute;ch CẦN C&Oacute; VIDEO QUAY LẠI QU&Aacute; TR&Igrave;NH MỞ H&Agrave;NG để đảm bảo vấn đề sẽ được giải quyết 100%.</p>', 1000, 1, '2025-05-21 16:36:01', '2025-05-21 16:47:06', 0),
(3, 1, 'Áo Polo thể thao can vai FSTP001', '400000', 229000, 'assets/photos/polo3.png', '', '<p>????Th&ocirc;ng tin sản phẩm</p>\r\n\r\n<p>????T&ecirc;n sản phẩm:&nbsp;<strong>&Aacute;o Polo thể thao TORANO&nbsp;can vai ngắn tay&nbsp;FSTP001</strong></p>\r\n\r\n<p>????Size: S-M-L-XL</p>\r\n\r\n<p>????M&agrave;u sắc: Trắng, Đen, X&aacute;m, Dark Navy</p>\r\n\r\n<p>????Xuất xứ: Việt Nam</p>\r\n\r\n<p>????T&iacute;nh năng nổi bật:</p>\r\n\r\n<p>+ Chất vải c&oacute; độ co gi&atilde;n tốt, tho&aacute;ng kh&iacute; v&agrave; kh&ocirc;ng phai m&agrave;u</p>\r\n\r\n<p>+ Thấm h&uacute;t mồ h&ocirc;i tối đa v&agrave; thoải m&aacute;i khi vận động</p>\r\n\r\n<p>+ Thiết kế Slimfit vừa vặn t&ocirc;n d&aacute;ng</p>\r\n\r\n<p>+ Ph&ugrave; hợp với đi l&agrave;m, đi học, đi chơi, hẹn h&ograve;, du lịch,...</p>\r\n\r\n<p><img height=\"invalid-value\" src=\"https://down-vn.img.susercontent.com/file/vn-11134208-7r98o-ltyq8pw6a2vz32\" width=\"invalid-value\" /></p>\r\n\r\n<p><img src=\"https://file.hstatic.net/200000690725/file/53597409594_0b6ef88e00_k_0cd5a635799040468b055e283be06b0e_grande.jpg\" /></p>\r\n\r\n<p>???? Mix:</p>\r\n\r\n<p>+ Quần vải (Đen/ Xanh t&iacute;m than) + Gi&agrave;y lười/ Gi&agrave;y thể thao.</p>\r\n\r\n<p>+ Quần kaki ( Đen/ Trắng/ Xanh t&iacute;m than) + Gi&agrave;y lười/ Gi&agrave;y thể thao.</p>\r\n\r\n<p>+ Jeans + Gi&agrave;y lười/ Gi&agrave;y thể thao</p>\r\n\r\n<p><img height=\"invalid-value\" src=\"https://down-vn.img.susercontent.com/file/vn-11134208-7r98o-ltyq8pw6bhgf12\" width=\"invalid-value\" /></p>\r\n\r\n<p>????Hướng dẫn sử dụng:</p>\r\n\r\n<p>+ Giặt m&aacute;y với chu kỳ trung b&igrave;nh v&agrave; v&ograve;ng quay ngắn</p>\r\n\r\n<p>+ Giặt với nhiệt độ tối đa 30 độ C</p>\r\n\r\n<p>+ Sấy nhẹ ở nhiệt độ thường</p>\r\n\r\n<p>+ L&agrave; ủi kh&ocirc;ng qu&aacute; 110 độ C</p>\r\n\r\n<p>+ Phơi bằng m&oacute;c dưới b&oacute;ng r&acirc;m</p>\r\n\r\n<p>+ Kh&ocirc;ng sử dụng chất tẩy</p>\r\n\r\n<p>???? Lưu &yacute; nhỏ:</p>\r\n\r\n<p>+ Kh&ocirc;ng giặt chung với đồ dễ xước</p>\r\n\r\n<p>+ Cẩn thận vướng mắc khi phơi</p>\r\n\r\n<p><img src=\"https://file.hstatic.net/200000690725/file/z5882351416802_b800a4fafec9d9688a23339ca09db735_grande.jpg\" /></p>\r\n\r\n<p>????CH&Iacute;NH S&Aacute;CH ĐỔI:</p>\r\n\r\n<p>&bull; Torano hỗ trợ đổi h&agrave;ng trong trường hợp: sản phẩm&nbsp;mặc kh&ocirc;ng vừa, kh&aacute;ch kh&ocirc;ng ưng sản phẩm đ&atilde; đặt, sản phẩm c&oacute; lỗi của nh&agrave; sản xuất. &nbsp;<br />\r\n&bull; Sản phẩm đổi phải đạt điều kiện: c&ograve;n nguy&ecirc;n tem m&aacute;c, chưa qua sử dụng, kh&ocirc;ng c&oacute; vết bẩn, r&aacute;ch&hellip; &nbsp;<br />\r\n&bull; Thời gian đổi: trong v&ograve;ng 7 NG&Agrave;Y kể từ ng&agrave;y kh&aacute;ch nhận h&agrave;ng. &nbsp;<br />\r\n&bull; LƯU &Yacute;: &nbsp;&nbsp; &nbsp;<br />\r\n- Nếu c&oacute; khiếu nại cần hỗ trợ, qu&yacute; kh&aacute;ch CẦN C&Oacute; VIDEO QUAY LẠI QU&Aacute; TR&Igrave;NH MỞ H&Agrave;NG để đảm bảo vấn đề sẽ được giải quyết 100%</p>', 1000, 1, '2025-05-21 16:37:03', '2025-05-21 16:37:03', 0),
(4, 1, 'Áo polo can phối tay FSTP002', '450000', 450000, 'assets/photos/polo4.png', '', '<p><strong>&Aacute;o polo can phối tay FSTP002&nbsp;ch&iacute;nh h&atilde;ng Torano</strong>&nbsp;với chất vải co gi&atilde;n tốt v&agrave; quan trọng độ bền m&agrave;u cao. Giặt ko đổ l&ocirc;ng hay bay m&agrave;u, thấm h&uacute;t mồ h&ocirc;i v&agrave; thoải m&aacute;i kh&ocirc;ng g&ograve; b&oacute; khi vận động. Đ&acirc;y l&agrave; mẫu &aacute;o polo nam chất lượng ch&iacute;nh h&atilde;ng m&agrave; gi&aacute; tốt nhất tại Torano.</p>\r\n\r\n<p><img alt=\"FSTP002\" src=\"https://file.hstatic.net/200000690725/file/53611957951_8b4a4cbb5f_c_ebc280bd27ab4ab4923430d9f592e831_grande.jpg\" /></p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p><img alt=\"FSTP002\" src=\"https://file.hstatic.net/200000690725/file/53612409075_4691b1659d_c_56e9b6f8e4ed48f386dc722b44e893ed_grande.jpg\" /></p>\r\n\r\n<p><img alt=\"FSTP002\" src=\"https://file.hstatic.net/200000690725/file/53611086337_4975b38d61_c_e7091748dbb348f6b3343b1437020d47_grande.jpg\" /></p>\r\n\r\n<p><img alt=\"FSTP002\" src=\"https://file.hstatic.net/200000690725/file/53612298364_cd7288f4b2_c_8aaea58c4e7c456eba8b9c0c57695af9_grande.jpg\" /></p>\r\n\r\n<p><img src=\"https://file.hstatic.net/200000690725/file/z5882351416802_b800a4fafec9d9688a23339ca09db735_grande.jpg\" /></p>\r\n\r\n<p>????CH&Iacute;NH S&Aacute;CH ĐỔI:</p>\r\n\r\n<p>&bull; Torano hỗ trợ đổi h&agrave;ng trong trường hợp: sp mặc kh&ocirc;ng vừa, kh&aacute;ch kh&ocirc;ng ưng sp đ&atilde; đặt, sp c&oacute; lỗi của nh&agrave; sản xuất. &nbsp;<br />\r\n&bull; Sản phẩm đổi phải đạt điều kiện: c&ograve;n nguy&ecirc;n tem m&aacute;c, chưa qua sử dụng, kh&ocirc;ng c&oacute; vết bẩn, r&aacute;ch&hellip; &nbsp;<br />\r\n&bull; Thời gian đổi: trong v&ograve;ng 7 NG&Agrave;Y kể từ ng&agrave;y kh&aacute;ch nhận h&agrave;ng. &nbsp;<br />\r\n&bull; LƯU &Yacute;: &nbsp; - Kh&aacute;ch h&agrave;ng KH&Ocirc;NG BẤM NHẬN H&Agrave;NG khi c&oacute; nhu cầu đổi h&agrave;ng.</p>\r\n\r\n<p>- Nếu kh&aacute;ch h&agrave;ng bấm &ldquo;Đ&Atilde; NHẬN H&Agrave;NG&rdquo; kh&aacute;ch h&agrave;ng THANH TO&Aacute;N 2 CHIỀU PH&Iacute; SHIP khi đổi h&agrave;ng. &nbsp; &nbsp;<br />\r\n- Nếu c&oacute; khiếu nại cần hỗ trợ, qu&yacute; kh&aacute;ch CẦN C&Oacute; VIDEO QUAY LẠI QU&Aacute; TR&Igrave;NH MỞ H&Agrave;NG để đảm bảo vấn đề sẽ được giải quyết 100%.</p>', 1000, 1, '2025-05-21 16:38:36', '2025-05-21 16:38:36', 0),
(5, 1, 'Áo Polo trơn bo kẻ FSTP003', '420000', 299000, 'assets/photos/polo5.png', '', '<p><strong>&Aacute;o Polo trơn bo kẻ FSTP003 ch&iacute;nh h&atilde;ng Torano</strong>&nbsp;với chất vải cho độ d&agrave;y dặn, co gi&atilde;n tốt v&agrave; quan trọng độ bền m&agrave;u cao. Giặt kh&ocirc;ng đổ l&ocirc;ng hay bay m&agrave;u, thấm h&uacute;t mồ h&ocirc;i v&agrave; thoải m&aacute;i kh&ocirc;ng g&ograve; b&oacute; khi vận động. Đ&acirc;y l&agrave; mẫu &aacute;o polo nam chất lượng ch&iacute;nh h&atilde;ng m&agrave; gi&aacute; tốt nhất tại&nbsp;<strong>Torano</strong>.</p>\r\n\r\n<p><img src=\"https://file.hstatic.net/200000690725/file/53611097392_ef14057ea1_c_93af8c75886f4766af9228de62bdab34_grande.jpg\" /></p>\r\n\r\n<p><img src=\"https://file.hstatic.net/200000690725/file/53612420070_f8875aab60_c_b22d31f48c294e55b3109b92cfd985bb_grande.jpg\" /></p>\r\n\r\n<p><img src=\"https://file.hstatic.net/200000690725/file/53612420065_4aa836e7cc_c_25e7c06a1c2e452881538cc10edd4eff_grande.jpg\" /></p>\r\n\r\n<p><img src=\"https://file.hstatic.net/200000690725/file/53612309399_90cd8c666b_c_2757894911dc4a07836dc26f3ef12ffe_grande.jpg\" /></p>\r\n\r\n<p><img src=\"https://file.hstatic.net/200000690725/file/z6418141669370_e60e4e085bb73f5613c655d714cfcbc3_grande.jpg\" /></p>\r\n\r\n<p>????CH&Iacute;NH S&Aacute;CH ĐỔI:</p>\r\n\r\n<p>&bull; Torano hỗ trợ đổi h&agrave;ng trong trường hợp: sản phẩm&nbsp;mặc kh&ocirc;ng vừa, kh&aacute;ch kh&ocirc;ng ưng sản phẩm đ&atilde; đặt, sản phẩm c&oacute; lỗi của nh&agrave; sản xuất. &nbsp;<br />\r\n&bull; Sản phẩm đổi phải đạt điều kiện: c&ograve;n nguy&ecirc;n tem m&aacute;c, chưa qua sử dụng, kh&ocirc;ng c&oacute; vết bẩn, r&aacute;ch&hellip; &nbsp;<br />\r\n&bull; Thời gian đổi: trong v&ograve;ng 7 NG&Agrave;Y kể từ ng&agrave;y kh&aacute;ch nhận h&agrave;ng. &nbsp;<br />\r\n&bull; LƯU &Yacute;: &nbsp;&nbsp; &nbsp;<br />\r\n- Nếu c&oacute; khiếu nại cần hỗ trợ, qu&yacute; kh&aacute;ch CẦN C&Oacute; VIDEO QUAY LẠI QU&Aacute; TR&Igrave;NH MỞ H&Agrave;NG để đảm bảo vấn đề sẽ được giải quyết 100%.</p>', 1000, 1, '2025-05-21 16:39:29', '2025-05-21 16:39:29', 0),
(6, 1, 'Áo Polo can phối thân FSTP004', '450000', 299000, 'assets/photos/polo6.png', '', '<p><strong>&Aacute;o Polo nam can phối th&acirc;n FSTP004</strong>&nbsp;l&agrave; mẫu &aacute;o nam ch&iacute;nh h&atilde;ng&nbsp;<strong>Torano&nbsp;</strong>được sản xuất dựa tr&ecirc;n c&ocirc;ng nghệ hiện đại.&nbsp;Chất vải cho độ d&agrave;y dặn, co gi&atilde;n tốt v&agrave; quan trọng độ bền m&agrave;u cao. Giặt kh&ocirc;ng đổ l&ocirc;ng hay bay m&agrave;u, thấm h&uacute;t mồ h&ocirc;i v&agrave; thoải m&aacute;i kh&ocirc;ng g&ograve; b&oacute; khi vận động.</p>\r\n\r\n<p>???? Chất liệu: 65% Polyester + 35% Cotton</p>\r\n\r\n<p>???? Phom d&aacute;ng: Slimfit hơi &ocirc;m</p>\r\n\r\n<p>???? Size: S-M-L-XL</p>\r\n\r\n<p>???? Xuất xứ: Việt Nam</p>\r\n\r\n<p><img src=\"https://file.hstatic.net/200000690725/file/53612398940_548dde3745_c_6f6f44561ade412499e6b2105dfcee6f_grande.jpg\" /></p>\r\n\r\n<p><img src=\"https://file.hstatic.net/200000690725/file/53612398890_f9e517b400_c_f3101008c69644a78510c584e7060b7c_grande.jpg\" /></p>\r\n\r\n<p>???? Mix:</p>\r\n\r\n<p>+ Quần vải (Đen/ Xanh t&iacute;m than) + Gi&agrave;y lười/ Gi&agrave;y thể thao.</p>\r\n\r\n<p>+ Quần kaki (Đen/ Trắng/ Xanh t&iacute;m than) + Gi&agrave;y lười/ Gi&agrave;y thể thao.</p>\r\n\r\n<p>+ Jeans + Gi&agrave;y lười/ Gi&agrave;y thể thao</p>\r\n\r\n<p><img src=\"https://file.hstatic.net/200000690725/file/53612398885_2ab73469b9_c_7dd2270a74e04c50bdb648068d58b3b6_grande.jpg\" /></p>\r\n\r\n<p>????Hướng dẫn sử dụng:</p>\r\n\r\n<p>+ Giặt m&aacute;y với chu kỳ trung b&igrave;nh v&agrave; v&ograve;ng quay ngắn</p>\r\n\r\n<p>+ Giặt với nhiệt độ tối đa 30 độ C</p>\r\n\r\n<p>+ Sấy nhẹ ở nhiệt độ thường</p>\r\n\r\n<p>+ L&agrave; ủi kh&ocirc;ng qu&aacute; 110 độ C</p>\r\n\r\n<p>+ Phơi bằng m&oacute;c dưới b&oacute;ng r&acirc;m</p>\r\n\r\n<p>+ Kh&ocirc;ng sử dụng chất tẩy</p>\r\n\r\n<p>???? Lưu &yacute; nhỏ:</p>\r\n\r\n<p>+ Kh&ocirc;ng giặt chung với đồ dễ xước</p>\r\n\r\n<p>+ Cẩn thận vướng mắc khi phơi</p>\r\n\r\n<p><img src=\"https://file.hstatic.net/200000690725/file/z5882351416802_b800a4fafec9d9688a23339ca09db735_grande.jpg\" /></p>\r\n\r\n<p>????CH&Iacute;NH S&Aacute;CH ĐỔI:</p>\r\n\r\n<p>&bull; Torano hỗ trợ đổi h&agrave;ng trong trường hợp: sản phẩm&nbsp;mặc kh&ocirc;ng vừa, kh&aacute;ch kh&ocirc;ng ưng sản phẩm&nbsp;đ&atilde; đặt, sản phảm&nbsp;c&oacute; lỗi của nh&agrave; sản xuất. &nbsp;<br />\r\n&bull; Sản phẩm đổi phải đạt điều kiện: c&ograve;n nguy&ecirc;n tem m&aacute;c, chưa qua sử dụng, kh&ocirc;ng c&oacute; vết bẩn, r&aacute;ch&hellip; &nbsp;<br />\r\n&bull; Thời gian đổi: trong v&ograve;ng 7 NG&Agrave;Y kể từ ng&agrave;y kh&aacute;ch nhận h&agrave;ng. &nbsp;<br />\r\n&bull; LƯU &Yacute;: &nbsp;<br />\r\n- Nếu c&oacute; khiếu nại cần hỗ trợ, qu&yacute; kh&aacute;ch CẦN C&Oacute; VIDEO QUAY LẠI QU&Aacute; TR&Igrave;NH MỞ H&Agrave;NG để đảm bảo vấn đề sẽ được giải quyết 100%.</p>', 1000, 1, '2025-05-21 16:41:46', '2025-05-21 16:41:46', 0),
(7, 1, 'Áo Polo trơn bo kẻ logo ngực FSTP052', '380000', 380000, 'assets/photos/polo7.png', '', '<p><strong>&Aacute;o Polo trơn bo kẻ logo ngực FSTP052 ch&iacute;nh h&atilde;ng Torano</strong>&nbsp;với chất vải cho độ d&agrave;y dặn,co gi&atilde;n tốt v&agrave; quan trọng độ bền m&agrave;u cao. Giặt kh&ocirc;ng đổ l&ocirc;ng hay bay m&agrave;u, thấm h&uacute;t mồ h&ocirc;i v&agrave; thoải m&aacute;i kh&ocirc;ng g&ograve; b&oacute; khi vận động. Đ&acirc;y l&agrave; mẫu &aacute;o polo nam chất lượng ch&iacute;nh h&atilde;ng m&agrave; gi&aacute; tốt nhất tại&nbsp;<strong>Torano</strong>.</p>\r\n\r\n<p><img src=\"https://file.hstatic.net/200000690725/file/481250974_1049691150537799_6412707932323439584_n_grande.jpg\" /></p>\r\n\r\n<p><img src=\"https://file.hstatic.net/200000690725/file/481121414_1049691217204459_658170740850063914_n_grande.jpg\" /></p>\r\n\r\n<p><img src=\"https://file.hstatic.net/200000690725/file/481506419_1049691220537792_5823433956333108482_n_grande.jpg\" /></p>\r\n\r\n<p><img src=\"https://file.hstatic.net/200000690725/file/482080779_1049691180537796_1660381733183608384_n_grande.jpg\" /></p>\r\n\r\n<p><img src=\"https://file.hstatic.net/200000690725/file/z6418141669370_e60e4e085bb73f5613c655d714cfcbc3_grande.jpg\" /></p>\r\n\r\n<p>????CH&Iacute;NH S&Aacute;CH ĐỔI:</p>\r\n\r\n<p>&bull; Torano hỗ trợ đổi h&agrave;ng trong trường hợp: sản phẩm&nbsp;mặc kh&ocirc;ng vừa, kh&aacute;ch kh&ocirc;ng ưng sản phẩm đ&atilde; đặt, sản phẩm c&oacute; lỗi của nh&agrave; sản xuất. &nbsp;<br />\r\n&bull; Sản phẩm đổi phải đạt điều kiện: c&ograve;n nguy&ecirc;n tem m&aacute;c, chưa qua sử dụng, kh&ocirc;ng c&oacute; vết bẩn, r&aacute;ch&hellip; &nbsp;<br />\r\n&bull; Thời gian đổi: trong v&ograve;ng 7 NG&Agrave;Y kể từ ng&agrave;y kh&aacute;ch nhận h&agrave;ng. &nbsp;<br />\r\n&bull; LƯU &Yacute;: &nbsp;&nbsp; &nbsp;<br />\r\n- Nếu c&oacute; khiếu nại cần hỗ trợ, qu&yacute; kh&aacute;ch CẦN C&Oacute; VIDEO QUAY LẠI QU&Aacute; TR&Igrave;NH MỞ H&Agrave;NG để đảm bảo vấn đề sẽ được giải quyết 100%.</p>', 1000, 1, '2025-05-21 16:43:16', '2025-05-21 16:43:16', 0),
(8, 1, 'Áo Polo can phối FSTP031', '420000', 420000, 'assets/photos/polo8.png', '', '<p><strong>&Aacute;o Polo can phối FSTP031 ch&iacute;nh h&atilde;ng Torano</strong>&nbsp;với chất vải cho độ d&agrave;y dặn, co gi&atilde;n tốt v&agrave; quan trọng độ bền m&agrave;u cao. Giặt kh&ocirc;ng đổ l&ocirc;ng hay bay m&agrave;u, thấm h&uacute;t mồ h&ocirc;i v&agrave; thoải m&aacute;i kh&ocirc;ng g&ograve; b&oacute; khi vận động. Đ&acirc;y l&agrave; mẫu &aacute;o polo nam chất lượng ch&iacute;nh h&atilde;ng m&agrave; gi&aacute; tốt nhất tại&nbsp;<strong>Torano</strong>.</p>\r\n\r\n<p><img src=\"https://file.hstatic.net/200000690725/file/484996204_1061678012672446_3122526590964766424_n_grande.jpg\" /></p>\r\n\r\n<p><img src=\"https://file.hstatic.net/200000690725/file/485302957_1061678009339113_353688965396440512_n_grande.jpg\" /></p>\r\n\r\n<p><img src=\"https://file.hstatic.net/200000690725/file/485089174_1061677979339116_1237958101897312438_n_grande.jpg\" /></p>\r\n\r\n<p><img src=\"https://file.hstatic.net/200000690725/file/z6418141669370_e60e4e085bb73f5613c655d714cfcbc3_grande.jpg\" /></p>\r\n\r\n<p>????CH&Iacute;NH S&Aacute;CH ĐỔI:</p>\r\n\r\n<p>&bull; Torano hỗ trợ đổi h&agrave;ng trong trường hợp: sản phẩm&nbsp;mặc kh&ocirc;ng vừa, kh&aacute;ch kh&ocirc;ng ưng sản phẩm đ&atilde; đặt, sản phẩm c&oacute; lỗi của nh&agrave; sản xuất. &nbsp;<br />\r\n&bull; Sản phẩm đổi phải đạt điều kiện: c&ograve;n nguy&ecirc;n tem m&aacute;c, chưa qua sử dụng, kh&ocirc;ng c&oacute; vết bẩn, r&aacute;ch&hellip; &nbsp;<br />\r\n&bull; Thời gian đổi: trong v&ograve;ng 7 NG&Agrave;Y kể từ ng&agrave;y kh&aacute;ch nhận h&agrave;ng. &nbsp;<br />\r\n&bull; LƯU &Yacute;: &nbsp;&nbsp; &nbsp;<br />\r\n- Nếu c&oacute; khiếu nại cần hỗ trợ, qu&yacute; kh&aacute;ch CẦN C&Oacute; VIDEO QUAY LẠI QU&Aacute; TR&Igrave;NH MỞ H&Agrave;NG để đảm bảo vấn đề sẽ được giải quyết 100%.</p>', 1000, 1, '2025-05-21 16:44:10', '2025-05-21 16:44:10', 0),
(9, 1, 'Áo Polo trơn bo kẻ thêu logo ngực FSTP045', '380000', 380000, 'assets/photos/polo9.png', '', '<p><strong>&Aacute;o Polo trơn bo kẻ th&ecirc;u logo ngực FSTP045 ch&iacute;nh h&atilde;ng Torano</strong>&nbsp;với chất vải cho độ d&agrave;y dặn, co gi&atilde;n tốt v&agrave; quan trọng độ bền m&agrave;u cao. Giặt kh&ocirc;ng đổ l&ocirc;ng hay bay m&agrave;u, thấm h&uacute;t mồ h&ocirc;i v&agrave; thoải m&aacute;i kh&ocirc;ng g&ograve; b&oacute; khi vận động. Đ&acirc;y l&agrave; mẫu &aacute;o polo nam chất lượng ch&iacute;nh h&atilde;ng m&agrave; gi&aacute; tốt nhất tại&nbsp;<strong>Torano</strong>.</p>\r\n\r\n<p><img src=\"https://file.hstatic.net/200000690725/file/484774093_1060916189415295_4016338568272001691_n_grande.jpg\" /></p>\r\n\r\n<p><img src=\"https://file.hstatic.net/200000690725/file/485116106_1060916192748628_1840106580018858307_n_grande.jpg\" /></p>\r\n\r\n<p><img src=\"https://file.hstatic.net/200000690725/file/484826105_1060916139415300_3579699935428711422_n_grande.jpg\" /></p>\r\n\r\n<p><img src=\"https://file.hstatic.net/200000690725/file/z6418141669370_e60e4e085bb73f5613c655d714cfcbc3_grande.jpg\" /></p>\r\n\r\n<p>????CH&Iacute;NH S&Aacute;CH ĐỔI:</p>\r\n\r\n<p>&bull; Torano hỗ trợ đổi h&agrave;ng trong trường hợp: sản phẩm&nbsp;mặc kh&ocirc;ng vừa, kh&aacute;ch kh&ocirc;ng ưng sản phẩm đ&atilde; đặt, sản phẩm c&oacute; lỗi của nh&agrave; sản xuất. &nbsp;<br />\r\n&bull; Sản phẩm đổi phải đạt điều kiện: c&ograve;n nguy&ecirc;n tem m&aacute;c, chưa qua sử dụng, kh&ocirc;ng c&oacute; vết bẩn, r&aacute;ch&hellip; &nbsp;<br />\r\n&bull; Thời gian đổi: trong v&ograve;ng 7 NG&Agrave;Y kể từ ng&agrave;y kh&aacute;ch nhận h&agrave;ng. &nbsp;<br />\r\n&bull; LƯU &Yacute;: &nbsp;&nbsp; &nbsp;<br />\r\n- Nếu c&oacute; khiếu nại cần hỗ trợ, qu&yacute; kh&aacute;ch CẦN C&Oacute; VIDEO QUAY LẠI QU&Aacute; TR&Igrave;NH MỞ H&Agrave;NG để đảm bảo vấn đề sẽ được giải quyết 100%.</p>', 1000, 1, '2025-05-21 16:47:55', '2025-05-21 16:47:55', 0),
(10, 1, 'Áo Polo can phối FSTP043', '420000', 420000, 'assets/photos/polo10.png', '', '<p><strong>&Aacute;o Polo can phối FSTP043 ch&iacute;nh h&atilde;ng Torano</strong>&nbsp;với chất vải cho độ d&agrave;y dặn,co gi&atilde;n tốt v&agrave; quan trọng độ bền m&agrave;u cao. Giặt kh&ocirc;ng đổ l&ocirc;ng hay bay m&agrave;u, thấm h&uacute;t mồ h&ocirc;i v&agrave; thoải m&aacute;i kh&ocirc;ng g&ograve; b&oacute; khi vận động. Đ&acirc;y l&agrave; mẫu &aacute;o polo nam chất lượng ch&iacute;nh h&atilde;ng m&agrave; gi&aacute; tốt nhất tại&nbsp;<strong>Torano</strong>.</p>\r\n\r\n<p><img src=\"https://file.hstatic.net/200000690725/file/fstp043-2_53860239635_o_grande.jpg\" /></p>\r\n\r\n<p><img src=\"https://file.hstatic.net/200000690725/file/fstp043-7_53858927942_o_grande.jpg\" /></p>\r\n\r\n<p><img src=\"https://file.hstatic.net/200000690725/file/fstp043-2_54161661172_o_grande.jpg\" /></p>\r\n\r\n<p><img src=\"https://file.hstatic.net/200000690725/file/z6418141669370_e60e4e085bb73f5613c655d714cfcbc3_grande.jpg\" /></p>\r\n\r\n<p>????CH&Iacute;NH S&Aacute;CH ĐỔI:</p>\r\n\r\n<p>&bull; Torano hỗ trợ đổi h&agrave;ng trong trường hợp: sản phẩm&nbsp;mặc kh&ocirc;ng vừa, kh&aacute;ch kh&ocirc;ng ưng sản phẩm đ&atilde; đặt, sản phẩm c&oacute; lỗi của nh&agrave; sản xuất. &nbsp;<br />\r\n&bull; Sản phẩm đổi phải đạt điều kiện: c&ograve;n nguy&ecirc;n tem m&aacute;c, chưa qua sử dụng, kh&ocirc;ng c&oacute; vết bẩn, r&aacute;ch&hellip; &nbsp;<br />\r\n&bull; Thời gian đổi: trong v&ograve;ng 7 NG&Agrave;Y kể từ ng&agrave;y kh&aacute;ch nhận h&agrave;ng. &nbsp;<br />\r\n&bull; LƯU &Yacute;: &nbsp;&nbsp; &nbsp;<br />\r\n- Nếu c&oacute; khiếu nại cần hỗ trợ, qu&yacute; kh&aacute;ch CẦN C&Oacute; VIDEO QUAY LẠI QU&Aacute; TR&Igrave;NH MỞ H&Agrave;NG để đảm bảo vấn đề sẽ được giải quyết 100%.</p>', 1000, 1, '2025-05-21 16:49:03', '2025-05-21 16:49:03', 0),
(11, 2, 'Áo T shirt họa tiết in ngực TRN FSTS014', '300000', 300000, 'assets/photos/aothun1.png', '', '<p><strong>&Aacute;o T shirt họa tiết in ngực TRN FSTS014 ch&iacute;nh h&atilde;ng Torano&nbsp;</strong>l&agrave; mẫu &aacute;o thun nam với chất vải cho độ d&agrave;y dặn, co gi&atilde;n tốt v&agrave; quan trọng độ bền m&agrave;u cao. Giặt kh&ocirc;ng đổ l&ocirc;ng hay bay m&agrave;u, thấm h&uacute;t mồ h&ocirc;i v&agrave; thoải m&aacute;i kh&ocirc;ng g&ograve; b&oacute; khi vận động.</p>\r\n\r\n<p><img src=\"https://file.hstatic.net/200000690725/file/485086734_1061678836005697_727865669522866006_n_grande.jpg\" /></p>\r\n\r\n<p><img src=\"https://file.hstatic.net/200000690725/file/fsts014-3_53826991906_o_grande.jpg\" /></p>\r\n\r\n<p><img src=\"https://file.hstatic.net/200000690725/file/fsts014-5_53827428750_o_grande.jpg\" /></p>\r\n\r\n<p>????Hướng dẫn sử dụng:</p>\r\n\r\n<p>+ Giặt m&aacute;y với chu kỳ trung b&igrave;nh v&agrave; v&ograve;ng quay ngắn</p>\r\n\r\n<p>+ Giặt với nhiệt độ tối đa 30 độ C</p>\r\n\r\n<p>+ Sấy nhẹ ở nhiệt độ thường</p>\r\n\r\n<p>+ L&agrave; ủi kh&ocirc;ng qu&aacute; 110 độ C</p>\r\n\r\n<p>+ Phơi bằng m&oacute;c dưới b&oacute;ng r&acirc;m</p>\r\n\r\n<p>+ Kh&ocirc;ng sử dụng chất tẩy</p>\r\n\r\n<p>???? Lưu &yacute; nhỏ:</p>\r\n\r\n<p>+ Kh&ocirc;ng giặt chung với đồ dễ xước</p>\r\n\r\n<p>+ Cẩn thận vướng mắc khi phơi</p>\r\n\r\n<p><img src=\"https://file.hstatic.net/200000690725/file/z4302376489686_ddcd3100f0718a9c51ff0413fd0abad8_4dd72d5ac71c45ff9b38d02558dee786_grande.jpg\" /></p>\r\n\r\n<p>????CH&Iacute;NH S&Aacute;CH ĐỔI:</p>\r\n\r\n<p>&bull; Torano hỗ trợ đổi h&agrave;ng trong trường hợp: sản phẩm&nbsp;mặc kh&ocirc;ng vừa, kh&aacute;ch kh&ocirc;ng ưng sản phẩm đ&atilde; đặt, sản phẩm c&oacute; lỗi của nh&agrave; sản xuất. &nbsp;<br />\r\n&bull; Sản phẩm đổi phải đạt điều kiện: c&ograve;n nguy&ecirc;n tem m&aacute;c, chưa qua sử dụng, kh&ocirc;ng c&oacute; vết bẩn, r&aacute;ch&hellip; &nbsp;<br />\r\n&bull; Thời gian đổi: trong v&ograve;ng 7 NG&Agrave;Y kể từ ng&agrave;y kh&aacute;ch nhận h&agrave;ng. &nbsp;<br />\r\n&bull; LƯU &Yacute;: &nbsp;&nbsp; &nbsp;<br />\r\n- Nếu c&oacute; khiếu nại cần hỗ trợ, qu&yacute; kh&aacute;ch CẦN C&Oacute; VIDEO QUAY LẠI QU&Aacute; TR&Igrave;NH MỞ H&Agrave;NG để đảm bảo vấn đề sẽ được giải quyết 100%.</p>', 1000, 1, '2025-05-21 16:55:55', '2025-05-21 16:55:55', 0),
(12, 2, 'Áo T shirt họa tiết thêu ngực FSTS027', '300000', 300000, 'assets/photos/aothun2.png', '', '<p><strong>&Aacute;o T shirt họa tiết th&ecirc;u ngực FSTS027 ch&iacute;nh h&atilde;ng Torano&nbsp;</strong>l&agrave; mẫu &aacute;o thun nam với chất vải cho độ d&agrave;y dặn, co gi&atilde;n tốt v&agrave; quan trọng độ bền m&agrave;u cao. Giặt kh&ocirc;ng đổ l&ocirc;ng hay bay m&agrave;u, thấm h&uacute;t mồ h&ocirc;i v&agrave; thoải m&aacute;i kh&ocirc;ng g&ograve; b&oacute; khi vận động.</p>\r\n\r\n<p><img src=\"https://file.hstatic.net/200000690725/file/487079865_1068025968704317_6105427933347211104_n_grande.jpg\" /></p>\r\n\r\n<p><img src=\"https://file.hstatic.net/200000690725/file/487298487_1068026012037646_1287642970539874090_n_grande.jpg\" /></p>\r\n\r\n<p><img src=\"https://file.hstatic.net/200000690725/file/486676778_1068026018704312_6317145600592581528_n_grande.jpg\" /></p>\r\n\r\n<p>????Hướng dẫn sử dụng:</p>\r\n\r\n<p>+ Giặt m&aacute;y với chu kỳ trung b&igrave;nh v&agrave; v&ograve;ng quay ngắn</p>\r\n\r\n<p>+ Giặt với nhiệt độ tối đa 30 độ C</p>\r\n\r\n<p>+ Sấy nhẹ ở nhiệt độ thường</p>\r\n\r\n<p>+ L&agrave; ủi kh&ocirc;ng qu&aacute; 110 độ C</p>\r\n\r\n<p>+ Phơi bằng m&oacute;c dưới b&oacute;ng r&acirc;m</p>\r\n\r\n<p>+ Kh&ocirc;ng sử dụng chất tẩy</p>\r\n\r\n<p>???? Lưu &yacute; nhỏ:</p>\r\n\r\n<p>+ Kh&ocirc;ng giặt chung với đồ dễ xước</p>\r\n\r\n<p>+ Cẩn thận vướng mắc khi phơi</p>\r\n\r\n<p><img src=\"https://file.hstatic.net/200000690725/file/z4302376489686_ddcd3100f0718a9c51ff0413fd0abad8_4dd72d5ac71c45ff9b38d02558dee786_grande.jpg\" /></p>\r\n\r\n<p>????CH&Iacute;NH S&Aacute;CH ĐỔI:</p>\r\n\r\n<p>&bull; Torano hỗ trợ đổi h&agrave;ng trong trường hợp: sản phẩm&nbsp;mặc kh&ocirc;ng vừa, kh&aacute;ch kh&ocirc;ng ưng sản phẩm đ&atilde; đặt, sản phẩm c&oacute; lỗi của nh&agrave; sản xuất. &nbsp;<br />\r\n&bull; Sản phẩm đổi phải đạt điều kiện: c&ograve;n nguy&ecirc;n tem m&aacute;c, chưa qua sử dụng, kh&ocirc;ng c&oacute; vết bẩn, r&aacute;ch&hellip; &nbsp;<br />\r\n&bull; Thời gian đổi: trong v&ograve;ng 7 NG&Agrave;Y kể từ ng&agrave;y kh&aacute;ch nhận h&agrave;ng. &nbsp;<br />\r\n&bull; LƯU &Yacute;: &nbsp;&nbsp; &nbsp;<br />\r\n- Nếu c&oacute; khiếu nại cần hỗ trợ, qu&yacute; kh&aacute;ch CẦN C&Oacute; VIDEO QUAY LẠI QU&Aacute; TR&Igrave;NH MỞ H&Agrave;NG để đảm bảo vấn đề sẽ được giải quyết 100%.</p>', 1000, 1, '2025-05-21 16:59:15', '2025-05-21 16:59:15', 0),
(13, 2, 'Áo T shirt họa tiết thêu logo Mountain Texture FSTS016', '300000', 300000, 'assets/photos/aothun3.jpg', '', '<p><strong>&Aacute;o T shirt họa tiết th&ecirc;u logo Mountain Texture FSTS016&nbsp;</strong>l&agrave;&nbsp;mẫu &aacute;o thun nam với chất vải cho độ d&agrave;y dặn, co gi&atilde;n tốt v&agrave; quan trọng độ bền m&agrave;u cao. Giặt kh&ocirc;ng đổ l&ocirc;ng hay bay m&agrave;u, thấm h&uacute;t mồ h&ocirc;i v&agrave; thoải m&aacute;i kh&ocirc;ng g&ograve; b&oacute; khi vận động.</p>\r\n\r\n<p><img src=\"https://file.hstatic.net/200000690725/file/fsts016-2_53708612606_o_cadebb19c0cc4a28bd955dbe2afaa90d_grande.jpg\" /></p>\r\n\r\n<p><img src=\"https://file.hstatic.net/200000690725/file/fsts016-3_53708823773_o_856313e1595e41d883d7e4ccda323e13_grande.jpg\" /></p>\r\n\r\n<p><img src=\"https://file.hstatic.net/200000690725/file/fsts016-5_53657296893_o_8ab4f2da4815489eb239e7fded92dc5a_grande.jpg\" /></p>\r\n\r\n<p>????Hướng dẫn sử dụng:</p>\r\n\r\n<p>+ Giặt m&aacute;y với chu kỳ trung b&igrave;nh v&agrave; v&ograve;ng quay ngắn</p>\r\n\r\n<p>+ Giặt với nhiệt độ tối đa 30 độ C</p>\r\n\r\n<p>+ Sấy nhẹ ở nhiệt độ thường</p>\r\n\r\n<p>+ L&agrave; ủi kh&ocirc;ng qu&aacute; 110 độ C</p>\r\n\r\n<p>+ Phơi bằng m&oacute;c dưới b&oacute;ng r&acirc;m</p>\r\n\r\n<p>+ Kh&ocirc;ng sử dụng chất tẩy</p>\r\n\r\n<p>???? Lưu &yacute; nhỏ:</p>\r\n\r\n<p>+ Kh&ocirc;ng giặt chung với đồ dễ xước</p>\r\n\r\n<p>+ Cẩn thận vướng mắc khi phơi</p>\r\n\r\n<p><img src=\"https://file.hstatic.net/200000690725/file/z4302376489686_ddcd3100f0718a9c51ff0413fd0abad8_4dd72d5ac71c45ff9b38d02558dee786_grande.jpg\" /></p>\r\n\r\n<p>????CH&Iacute;NH S&Aacute;CH ĐỔI:</p>\r\n\r\n<p>&bull; Torano hỗ trợ đổi h&agrave;ng trong trường hợp: sp mặc kh&ocirc;ng vừa, kh&aacute;ch kh&ocirc;ng ưng sp đ&atilde; đặt, sp c&oacute; lỗi của nh&agrave; sản xuất. &nbsp;<br />\r\n&bull; Sản phẩm đổi phải đạt điều kiện: c&ograve;n nguy&ecirc;n tem m&aacute;c, chưa qua sử dụng, kh&ocirc;ng c&oacute; vết bẩn, r&aacute;ch&hellip; &nbsp;<br />\r\n&bull; Thời gian đổi: trong v&ograve;ng 7 NG&Agrave;Y kể từ ng&agrave;y kh&aacute;ch nhận h&agrave;ng. &nbsp;<br />\r\n&bull; LƯU &Yacute;: &nbsp; - Kh&aacute;ch h&agrave;ng KH&Ocirc;NG BẤM NHẬN H&Agrave;NG khi c&oacute; nhu cầu đổi h&agrave;ng.</p>\r\n\r\n<p>- Nếu kh&aacute;ch h&agrave;ng bấm &ldquo;Đ&Atilde; NHẬN H&Agrave;NG&rdquo; kh&aacute;ch h&agrave;ng THANH TO&Aacute;N 2 CHIỀU PH&Iacute; SHIP khi đổi h&agrave;ng. &nbsp; &nbsp;<br />\r\n- Nếu c&oacute; khiếu nại cần hỗ trợ, qu&yacute; kh&aacute;ch CẦN C&Oacute; VIDEO QUAY LẠI QU&Aacute; TR&Igrave;NH MỞ H&Agrave;NG để đảm bảo vấn đề sẽ được giải quyết 100%.</p>', 1000, 1, '2025-05-21 17:01:19', '2025-05-21 17:01:19', 0),
(14, 2, 'Áo T shirt họa tiết in Water Nests FSTS020', '300000', 300000, 'assets/photos/aothun4.png', '', '<p><strong>&Aacute;o T shirt họa tiết in Water Nests FSTS020 ch&iacute;nh h&atilde;ng Torano&nbsp;</strong>l&agrave; mẫu &aacute;o thun nam với chất vải cho độ d&agrave;y dặn, co gi&atilde;n tốt v&agrave; quan trọng độ bền m&agrave;u cao. Giặt kh&ocirc;ng đổ l&ocirc;ng hay bay m&agrave;u, thấm h&uacute;t mồ h&ocirc;i v&agrave; thoải m&aacute;i kh&ocirc;ng g&ograve; b&oacute; khi vận động.</p>\r\n\r\n<p><img src=\"https://file.hstatic.net/200000690725/file/486836270_1516840009229469_897210599261847649_n_grande.jpg\" /></p>\r\n\r\n<p><img src=\"https://file.hstatic.net/200000690725/file/486676973_1516839912562812_6581107360957899374_n_grande.jpg\" /></p>\r\n\r\n<p><img src=\"https://file.hstatic.net/200000690725/file/486841536_1516839992562804_5213481777790284849_n_grande.jpg\" /></p>\r\n\r\n<p>????Hướng dẫn sử dụng:</p>\r\n\r\n<p>+ Giặt m&aacute;y với chu kỳ trung b&igrave;nh v&agrave; v&ograve;ng quay ngắn</p>\r\n\r\n<p>+ Giặt với nhiệt độ tối đa 30 độ C</p>\r\n\r\n<p>+ Sấy nhẹ ở nhiệt độ thường</p>\r\n\r\n<p>+ L&agrave; ủi kh&ocirc;ng qu&aacute; 110 độ C</p>\r\n\r\n<p>+ Phơi bằng m&oacute;c dưới b&oacute;ng r&acirc;m</p>\r\n\r\n<p>+ Kh&ocirc;ng sử dụng chất tẩy</p>\r\n\r\n<p>???? Lưu &yacute; nhỏ:</p>\r\n\r\n<p>+ Kh&ocirc;ng giặt chung với đồ dễ xước</p>\r\n\r\n<p>+ Cẩn thận vướng mắc khi phơi</p>\r\n\r\n<p><img src=\"https://file.hstatic.net/200000690725/file/z4302376489686_ddcd3100f0718a9c51ff0413fd0abad8_4dd72d5ac71c45ff9b38d02558dee786_grande.jpg\" /></p>\r\n\r\n<p>????CH&Iacute;NH S&Aacute;CH ĐỔI:</p>\r\n\r\n<p>&bull; Torano hỗ trợ đổi h&agrave;ng trong trường hợp: sản phẩm&nbsp;mặc kh&ocirc;ng vừa, kh&aacute;ch kh&ocirc;ng ưng sản phẩm đ&atilde; đặt, sản phẩm c&oacute; lỗi của nh&agrave; sản xuất. &nbsp;<br />\r\n&bull; Sản phẩm đổi phải đạt điều kiện: c&ograve;n nguy&ecirc;n tem m&aacute;c, chưa qua sử dụng, kh&ocirc;ng c&oacute; vết bẩn, r&aacute;ch&hellip; &nbsp;<br />\r\n&bull; Thời gian đổi: trong v&ograve;ng 7 NG&Agrave;Y kể từ ng&agrave;y kh&aacute;ch nhận h&agrave;ng. &nbsp;<br />\r\n&bull; LƯU &Yacute;: &nbsp;&nbsp; &nbsp;<br />\r\n- Nếu c&oacute; khiếu nại cần hỗ trợ, qu&yacute; kh&aacute;ch CẦN C&Oacute; VIDEO QUAY LẠI QU&Aacute; TR&Igrave;NH MỞ H&Agrave;NG để đảm bảo vấn đề sẽ được giải quyết 100%.</p>', 1000, 1, '2025-05-21 17:02:20', '2025-05-21 17:02:20', 0),
(15, 2, 'Áo T shirt họa tiết in Coast FSTS021', '300000', 300000, 'assets/photos/aothun5.png', '', '<p><strong>&Aacute;o T shirt họa tiết in Coast FSTS021 ch&iacute;nh h&atilde;ng Torano&nbsp;</strong>l&agrave; mẫu &aacute;o thun nam với chất vải cho độ d&agrave;y dặn, co gi&atilde;n tốt v&agrave; quan trọng độ bền m&agrave;u cao. Giặt kh&ocirc;ng đổ l&ocirc;ng hay bay m&agrave;u, thấm h&uacute;t mồ h&ocirc;i v&agrave; thoải m&aacute;i kh&ocirc;ng g&ograve; b&oacute; khi vận động.</p>\r\n\r\n<p><img src=\"https://file.hstatic.net/200000690725/file/486766974_1067265438780370_1385253358498211137_n_grande.jpg\" /></p>\r\n\r\n<p><img src=\"https://file.hstatic.net/200000690725/file/486155017_1067265442113703_18507498428122989_n_grande.jpg\" /></p>\r\n\r\n<p><img src=\"https://file.hstatic.net/200000690725/file/486639367_1067265445447036_1392925017315482048_n_grande.jpg\" /></p>\r\n\r\n<p>????Hướng dẫn sử dụng:</p>\r\n\r\n<p>+ Giặt m&aacute;y với chu kỳ trung b&igrave;nh v&agrave; v&ograve;ng quay ngắn</p>\r\n\r\n<p>+ Giặt với nhiệt độ tối đa 30 độ C</p>\r\n\r\n<p>+ Sấy nhẹ ở nhiệt độ thường</p>\r\n\r\n<p>+ L&agrave; ủi kh&ocirc;ng qu&aacute; 110 độ C</p>\r\n\r\n<p>+ Phơi bằng m&oacute;c dưới b&oacute;ng r&acirc;m</p>\r\n\r\n<p>+ Kh&ocirc;ng sử dụng chất tẩy</p>\r\n\r\n<p>???? Lưu &yacute; nhỏ:</p>\r\n\r\n<p>+ Kh&ocirc;ng giặt chung với đồ dễ xước</p>\r\n\r\n<p>+ Cẩn thận vướng mắc khi phơi</p>\r\n\r\n<p><img src=\"https://file.hstatic.net/200000690725/file/z4302376489686_ddcd3100f0718a9c51ff0413fd0abad8_4dd72d5ac71c45ff9b38d02558dee786_grande.jpg\" /></p>\r\n\r\n<p>????CH&Iacute;NH S&Aacute;CH ĐỔI:</p>\r\n\r\n<p>&bull; Torano hỗ trợ đổi h&agrave;ng trong trường hợp: sản phẩm&nbsp;mặc kh&ocirc;ng vừa, kh&aacute;ch kh&ocirc;ng ưng sản phẩm đ&atilde; đặt, sản phẩm c&oacute; lỗi của nh&agrave; sản xuất. &nbsp;<br />\r\n&bull; Sản phẩm đổi phải đạt điều kiện: c&ograve;n nguy&ecirc;n tem m&aacute;c, chưa qua sử dụng, kh&ocirc;ng c&oacute; vết bẩn, r&aacute;ch&hellip; &nbsp;<br />\r\n&bull; Thời gian đổi: trong v&ograve;ng 7 NG&Agrave;Y kể từ ng&agrave;y kh&aacute;ch nhận h&agrave;ng. &nbsp;<br />\r\n&bull; LƯU &Yacute;: &nbsp;&nbsp; &nbsp;<br />\r\n- Nếu c&oacute; khiếu nại cần hỗ trợ, qu&yacute; kh&aacute;ch CẦN C&Oacute; VIDEO QUAY LẠI QU&Aacute; TR&Igrave;NH MỞ H&Agrave;NG để đảm bảo vấn đề sẽ được giải quyết 100%.</p>', 1000, 1, '2025-05-21 17:03:02', '2025-05-21 17:03:02', 0),
(16, 2, 'Áo T shirt họa tiết in Human FSTS012', '300000', 300000, 'assets/photos/aothun6.png', '', '<p><strong>&Aacute;o T shirt họa tiết in Human FSTS012</strong>&nbsp;nằm trong BST xu&acirc;n h&egrave; 2024 mới nhất của Torano. Mẫu &aacute;o thun nam cao cấp sử dụng chất vải cotton mềm mịn, hạn chế nhăn nh&agrave;u v&agrave; c&oacute; độ co gi&atilde;n tốt kh&ocirc;ng bai d&atilde;o. Họa tiết in chắc chắn kh&ocirc;ng sợ bong tr&oacute;c sau khi giặt.</p>\r\n\r\n<p><img src=\"https://file.hstatic.net/200000690725/file/53663782219_146ca287ed_c_0807f867621b4c4eb36eca513ac3db3d_grande.jpg\" /></p>\r\n\r\n<p><img src=\"https://file.hstatic.net/200000690725/file/53663782224_15cffcb2e3_c_de696cfb7583421394b0bf6ec258c7b1_grande.jpg\" /></p>\r\n\r\n<p><img src=\"https://file.hstatic.net/200000690725/file/53663642218_e97ed952fa_c_1a3a73cbab5d41fb974696121028f1ec_grande.jpg\" /></p>\r\n\r\n<p>????Hướng dẫn sử dụng:</p>\r\n\r\n<p>+ Giặt m&aacute;y với chu kỳ trung b&igrave;nh v&agrave; v&ograve;ng quay ngắn</p>\r\n\r\n<p>+ Giặt với nhiệt độ tối đa 30 độ C</p>\r\n\r\n<p>+ Sấy nhẹ ở nhiệt độ thường</p>\r\n\r\n<p>+ L&agrave; ủi kh&ocirc;ng qu&aacute; 110 độ C</p>\r\n\r\n<p>+ Phơi bằng m&oacute;c dưới b&oacute;ng r&acirc;m</p>\r\n\r\n<p>+ Kh&ocirc;ng sử dụng chất tẩy</p>\r\n\r\n<p>???? Lưu &yacute; nhỏ:</p>\r\n\r\n<p>+ Kh&ocirc;ng giặt chung với đồ dễ xước</p>\r\n\r\n<p>+ Cẩn thận vướng mắc khi phơi</p>\r\n\r\n<p><img src=\"https://file.hstatic.net/200000690725/file/z4302376489686_ddcd3100f0718a9c51ff0413fd0abad8_4dd72d5ac71c45ff9b38d02558dee786_grande.jpg\" /></p>\r\n\r\n<p>????CH&Iacute;NH S&Aacute;CH ĐỔI:</p>\r\n\r\n<p>&bull; Torano hỗ trợ đổi h&agrave;ng trong trường hợp: sp mặc kh&ocirc;ng vừa, kh&aacute;ch kh&ocirc;ng ưng sp đ&atilde; đặt, sp c&oacute; lỗi của nh&agrave; sản xuất. &nbsp;<br />\r\n&bull; Sản phẩm đổi phải đạt điều kiện: c&ograve;n nguy&ecirc;n tem m&aacute;c, chưa qua sử dụng, kh&ocirc;ng c&oacute; vết bẩn, r&aacute;ch&hellip; &nbsp;<br />\r\n&bull; Thời gian đổi: trong v&ograve;ng 7 NG&Agrave;Y kể từ ng&agrave;y kh&aacute;ch nhận h&agrave;ng. &nbsp;<br />\r\n&bull; LƯU &Yacute;: &nbsp; - Kh&aacute;ch h&agrave;ng KH&Ocirc;NG BẤM NHẬN H&Agrave;NG khi c&oacute; nhu cầu đổi h&agrave;ng.</p>\r\n\r\n<p>- Nếu kh&aacute;ch h&agrave;ng bấm &ldquo;Đ&Atilde; NHẬN H&Agrave;NG&rdquo; kh&aacute;ch h&agrave;ng THANH TO&Aacute;N 2 CHIỀU PH&Iacute; SHIP khi đổi h&agrave;ng. &nbsp; &nbsp;<br />\r\n- Nếu c&oacute; khiếu nại cần hỗ trợ, qu&yacute; kh&aacute;ch CẦN C&Oacute; VIDEO QUAY LẠI QU&Aacute; TR&Igrave;NH MỞ H&Agrave;NG để đảm bảo vấn đề sẽ được giải quyết 100%.</p>\r\n\r\n<p>&nbsp;</p>', 1000, 1, '2025-05-21 17:03:37', '2025-05-21 17:03:37', 0),
(17, 2, 'Áo T shirt họa tiết in tràn Jumbly FSTS011', '300000', 300000, 'assets/photos/aothun7.png', '', '<p><strong>&Aacute;o T shirt nam họa tiết in tr&agrave;n Jumbly FSTS011</strong>&nbsp;nằm trong BST xu&acirc;n h&egrave; 2024 mới nhất của Torano. Mẫu &aacute;o thun nam cao cấp sử dụng chất vải cotton mềm mịn, hạn chế nhăn nh&agrave;u v&agrave; c&oacute; độ co gi&atilde;n tốt kh&ocirc;ng bai d&atilde;o. Họa tiết in chắc chắn kh&ocirc;ng sợ bong tr&oacute;c sau khi giặt.</p>\r\n\r\n<p><img src=\"https://file.hstatic.net/200000690725/file/53656195082_d5a04975d7_c_ae7aa0e870994c2daedc6a7f639bca5e_grande.jpg\" /></p>\r\n\r\n<p><img src=\"https://file.hstatic.net/200000690725/file/53656194722_7326904cb6_c_514911b6a2ad4344b3152298fcef7e85_grande.jpg\" /></p>\r\n\r\n<p><img src=\"https://file.hstatic.net/200000690725/file/53656194767_397aa31c58_c_bc2aea74e4d44d8681dcc81f5d57b0c0_grande.jpg\" /></p>\r\n\r\n<p><img src=\"https://file.hstatic.net/200000690725/file/53657068986_5b6ae7ea4e_c_303394ee76c2445482a5237347c684ea_grande.jpg\" /></p>\r\n\r\n<p>????Hướng dẫn sử dụng:</p>\r\n\r\n<p>+ Giặt m&aacute;y với chu kỳ trung b&igrave;nh v&agrave; v&ograve;ng quay ngắn</p>\r\n\r\n<p>+ Giặt với nhiệt độ tối đa 30 độ C</p>\r\n\r\n<p>+ Sấy nhẹ ở nhiệt độ thường</p>\r\n\r\n<p>+ L&agrave; ủi kh&ocirc;ng qu&aacute; 110 độ C</p>\r\n\r\n<p>+ Phơi bằng m&oacute;c dưới b&oacute;ng r&acirc;m</p>\r\n\r\n<p>+ Kh&ocirc;ng sử dụng chất tẩy</p>\r\n\r\n<p>???? Lưu &yacute; nhỏ:</p>\r\n\r\n<p>+ Kh&ocirc;ng giặt chung với đồ dễ xước</p>\r\n\r\n<p>+ Cẩn thận vướng mắc khi phơi</p>\r\n\r\n<p><img src=\"https://file.hstatic.net/200000690725/file/z4302376489686_ddcd3100f0718a9c51ff0413fd0abad8_4dd72d5ac71c45ff9b38d02558dee786_grande.jpg\" /></p>\r\n\r\n<p>????CH&Iacute;NH S&Aacute;CH ĐỔI:</p>\r\n\r\n<p>&bull; Torano hỗ trợ đổi h&agrave;ng trong trường hợp: sp mặc kh&ocirc;ng vừa, kh&aacute;ch kh&ocirc;ng ưng sp đ&atilde; đặt, sp c&oacute; lỗi của nh&agrave; sản xuất. &nbsp;<br />\r\n&bull; Sản phẩm đổi phải đạt điều kiện: c&ograve;n nguy&ecirc;n tem m&aacute;c, chưa qua sử dụng, kh&ocirc;ng c&oacute; vết bẩn, r&aacute;ch&hellip; &nbsp;<br />\r\n&bull; Thời gian đổi: trong v&ograve;ng 7 NG&Agrave;Y kể từ ng&agrave;y kh&aacute;ch nhận h&agrave;ng. &nbsp;<br />\r\n&bull; LƯU &Yacute;: &nbsp; - Kh&aacute;ch h&agrave;ng KH&Ocirc;NG BẤM NHẬN H&Agrave;NG khi c&oacute; nhu cầu đổi h&agrave;ng.</p>\r\n\r\n<p>- Nếu kh&aacute;ch h&agrave;ng bấm &ldquo;Đ&Atilde; NHẬN H&Agrave;NG&rdquo; kh&aacute;ch h&agrave;ng THANH TO&Aacute;N 2 CHIỀU PH&Iacute; SHIP khi đổi h&agrave;ng. &nbsp; &nbsp;<br />\r\n- Nếu c&oacute; khiếu nại cần hỗ trợ, qu&yacute; kh&aacute;ch CẦN C&Oacute; VIDEO QUAY LẠI QU&Aacute; TR&Igrave;NH MỞ H&Agrave;NG để đảm bảo vấn đề sẽ được giải quyết 100%.</p>', 1000, 1, '2025-05-21 17:04:30', '2025-05-21 17:04:30', 0),
(18, 2, 'Áo T shirt trơn in logo ngực FSTS001', '200000', 149000, 'assets/photos/aothun8.png', '', '<p><strong>&Aacute;o T shirt trơn in logo ngực FSTS001 ch&iacute;nh h&atilde;ng Torano&nbsp;</strong>l&agrave; mẫu &aacute;o thun nam với chất vải cho độ d&agrave;y dặn, co gi&atilde;n tốt v&agrave; quan trọng độ bền m&agrave;u cao. Giặt kh&ocirc;ng đổ l&ocirc;ng hay bay m&agrave;u, thấm h&uacute;t mồ h&ocirc;i v&agrave; thoải m&aacute;i kh&ocirc;ng g&ograve; b&oacute; khi vận động.</p>\r\n\r\n<p><img src=\"https://file.hstatic.net/200000690725/file/vn-11134208-7r98o-lsw6yqjfwouc88_ab765f6842184b9a9cbd7247442aebab_grande.jpg\" /></p>\r\n\r\n<p><img src=\"https://file.hstatic.net/200000690725/file/vn-11134208-7r98o-lsw6yqjfy3esd9_42f5b782546e4aa6a961c186819b9766_grande.jpg\" /></p>\r\n\r\n<p><img src=\"https://file.hstatic.net/200000690725/file/vn-11134208-7r98o-lsw6yqjfzhz844_9da0ef074f5e40b6ad4aca990952e4fb_grande.jpg\" /></p>\r\n\r\n<p><img src=\"https://file.hstatic.net/200000690725/file/vn-11134208-7r98o-lsw6yqjg2b44a6_ce77cefae0ec472e8d355a3b4fcf011f_grande.jpg\" /></p>\r\n\r\n<p><img src=\"https://file.hstatic.net/200000690725/file/vn-11134208-7r98o-lsw6yqjg3pok94_95405b578d3a44d4acf08434223af163_grande.jpg\" /></p>\r\n\r\n<p><img src=\"https://file.hstatic.net/200000690725/file/vn-11134208-7r98o-lsw6yqjg54901d_70c4b742f9a84a11814a2580414c1e7c_grande.jpg\" /></p>\r\n\r\n<p>????Hướng dẫn sử dụng:</p>\r\n\r\n<p>+ Giặt m&aacute;y với chu kỳ trung b&igrave;nh v&agrave; v&ograve;ng quay ngắn</p>\r\n\r\n<p>+ Giặt với nhiệt độ tối đa 30 độ C</p>\r\n\r\n<p>+ Sấy nhẹ ở nhiệt độ thường</p>\r\n\r\n<p>+ L&agrave; ủi kh&ocirc;ng qu&aacute; 110 độ C</p>\r\n\r\n<p>+ Phơi bằng m&oacute;c dưới b&oacute;ng r&acirc;m</p>\r\n\r\n<p>+ Kh&ocirc;ng sử dụng chất tẩy</p>\r\n\r\n<p>???? Lưu &yacute; nhỏ:</p>\r\n\r\n<p>+ Kh&ocirc;ng giặt chung với đồ dễ xước</p>\r\n\r\n<p>+ Cẩn thận vướng mắc khi phơi</p>\r\n\r\n<p><img src=\"https://file.hstatic.net/200000690725/file/z4302376489686_ddcd3100f0718a9c51ff0413fd0abad8_4dd72d5ac71c45ff9b38d02558dee786_grande.jpg\" /></p>\r\n\r\n<p>????CH&Iacute;NH S&Aacute;CH ĐỔI:</p>\r\n\r\n<p>&bull; Torano hỗ trợ đổi h&agrave;ng trong trường hợp: sản phẩm&nbsp;mặc kh&ocirc;ng vừa, kh&aacute;ch kh&ocirc;ng ưng sản phẩm đ&atilde; đặt, sản phẩm c&oacute; lỗi của nh&agrave; sản xuất. &nbsp;<br />\r\n&bull; Sản phẩm đổi phải đạt điều kiện: c&ograve;n nguy&ecirc;n tem m&aacute;c, chưa qua sử dụng, kh&ocirc;ng c&oacute; vết bẩn, r&aacute;ch&hellip; &nbsp;<br />\r\n&bull; Thời gian đổi: trong v&ograve;ng 7 NG&Agrave;Y kể từ ng&agrave;y kh&aacute;ch nhận h&agrave;ng. &nbsp;<br />\r\n&bull; LƯU &Yacute;: &nbsp;&nbsp; &nbsp;<br />\r\n- Nếu c&oacute; khiếu nại cần hỗ trợ, qu&yacute; kh&aacute;ch CẦN C&Oacute; VIDEO QUAY LẠI QU&Aacute; TR&Igrave;NH MỞ H&Agrave;NG để đảm bảo vấn đề sẽ được giải quyết 100%.</p>', 1000, 1, '2025-05-21 17:05:14', '2025-05-21 17:05:14', 0),
(19, 2, 'Áo T shirt họa tiết thêu logo Motorbike FSTS006', '300000', 300000, 'assets/photos/aothun9.jpg', '', '<p><strong>&Aacute;o T shirt họa tiết th&ecirc;u logo Motorbike FSTS006 ch&iacute;nh h&atilde;ng Torano&nbsp;</strong>l&agrave;&nbsp;mẫu &aacute;o thun nam với chất vải cho độ d&agrave;y dặn, co gi&atilde;n tốt v&agrave; quan trọng độ bền m&agrave;u cao. Giặt kh&ocirc;ng đổ l&ocirc;ng hay bay m&agrave;u, thấm h&uacute;t mồ h&ocirc;i v&agrave; thoải m&aacute;i kh&ocirc;ng g&ograve; b&oacute; khi vận động.</p>\r\n\r\n<p><img src=\"https://file.hstatic.net/200000690725/file/fsts006-5_53708606111_o_2f77ba0849434cbe8cd882344086ace5_grande.jpg\" />\\</p>\r\n\r\n<p><img src=\"https://file.hstatic.net/200000690725/file/fsts006-3_53657410769_o_c9e4f5a07445485db30d3674994ddfd7_grande.jpg\" /></p>\r\n\r\n<p><img src=\"https://file.hstatic.net/200000690725/file/fsts006-3_53709037370_o_e1fe77e464d94a939c98adc509391ff5_grande.jpg\" /></p>\r\n\r\n<p><img src=\"https://file.hstatic.net/200000690725/file/fsts006-1_53656181977_o_2555630e9abc4b2497931aefcdc14e2f_grande.jpg\" /></p>\r\n\r\n<p>????Hướng dẫn sử dụng:</p>\r\n\r\n<p>+ Giặt m&aacute;y với chu kỳ trung b&igrave;nh v&agrave; v&ograve;ng quay ngắn</p>\r\n\r\n<p>+ Giặt với nhiệt độ tối đa 30 độ C</p>\r\n\r\n<p>+ Sấy nhẹ ở nhiệt độ thường</p>\r\n\r\n<p>+ L&agrave; ủi kh&ocirc;ng qu&aacute; 110 độ C</p>\r\n\r\n<p>+ Phơi bằng m&oacute;c dưới b&oacute;ng r&acirc;m</p>\r\n\r\n<p>+ Kh&ocirc;ng sử dụng chất tẩy</p>\r\n\r\n<p>???? Lưu &yacute; nhỏ:</p>\r\n\r\n<p>+ Kh&ocirc;ng giặt chung với đồ dễ xước</p>\r\n\r\n<p>+ Cẩn thận vướng mắc khi phơi</p>\r\n\r\n<p><img src=\"https://file.hstatic.net/200000690725/file/z4302376489686_ddcd3100f0718a9c51ff0413fd0abad8_4dd72d5ac71c45ff9b38d02558dee786_grande.jpg\" /></p>\r\n\r\n<p>????CH&Iacute;NH S&Aacute;CH ĐỔI:</p>\r\n\r\n<p>&bull; Torano hỗ trợ đổi h&agrave;ng trong trường hợp: sp mặc kh&ocirc;ng vừa, kh&aacute;ch kh&ocirc;ng ưng sp đ&atilde; đặt, sp c&oacute; lỗi của nh&agrave; sản xuất. &nbsp;<br />\r\n&bull; Sản phẩm đổi phải đạt điều kiện: c&ograve;n nguy&ecirc;n tem m&aacute;c, chưa qua sử dụng, kh&ocirc;ng c&oacute; vết bẩn, r&aacute;ch&hellip; &nbsp;<br />\r\n&bull; Thời gian đổi: trong v&ograve;ng 7 NG&Agrave;Y kể từ ng&agrave;y kh&aacute;ch nhận h&agrave;ng. &nbsp;<br />\r\n&bull; LƯU &Yacute;: &nbsp; - Kh&aacute;ch h&agrave;ng KH&Ocirc;NG BẤM NHẬN H&Agrave;NG khi c&oacute; nhu cầu đổi h&agrave;ng.</p>\r\n\r\n<p>- Nếu kh&aacute;ch h&agrave;ng bấm &ldquo;Đ&Atilde; NHẬN H&Agrave;NG&rdquo; kh&aacute;ch h&agrave;ng THANH TO&Aacute;N 2 CHIỀU PH&Iacute; SHIP khi đổi h&agrave;ng. &nbsp; &nbsp;<br />\r\n- Nếu c&oacute; khiếu nại cần hỗ trợ, qu&yacute; kh&aacute;ch CẦN C&Oacute; VIDEO QUAY LẠI QU&Aacute; TR&Igrave;NH MỞ H&Agrave;NG để đảm bảo vấn đề sẽ được giải quyết 100%.</p>', 1000, 1, '2025-05-21 17:06:03', '2025-05-21 17:06:03', 0);
INSERT INTO `products` (`id`, `category_id`, `name`, `price`, `discount`, `image`, `brand`, `description`, `quantity`, `active`, `created_at`, `updated_at`, `deleted`) VALUES
(20, 2, 'Áo T shirt họa tiết in Brave FSTS004', '300000', 300000, 'assets/photos/aothun10.png', '', '<p><strong>&Aacute;o T shirt nam họa tiết in Brave FSTS004 ch&iacute;nh h&atilde;ng Torano&nbsp;</strong>l&agrave; mẫu &aacute;o thun nam với chất vải cho độ d&agrave;y dặn, co gi&atilde;n tốt v&agrave; quan trọng độ bền m&agrave;u cao. Giặt kh&ocirc;ng đổ l&ocirc;ng hay bay m&agrave;u, thấm h&uacute;t mồ h&ocirc;i v&agrave; thoải m&aacute;i kh&ocirc;ng g&ograve; b&oacute; khi vận động.</p>\r\n\r\n<p><img src=\"https://file.hstatic.net/200000690725/file/53630960536_ddd9bd22eb_c_5e7727f1037c4237add919ee0ce512da_grande.jpg\" /></p>\r\n\r\n<p><img src=\"https://file.hstatic.net/200000690725/file/53630960561_2808f8f7f6_c_8c2e4e5d49c541ce89a3dd265256905a_grande.jpg\" /></p>\r\n\r\n<p><img src=\"https://file.hstatic.net/200000690725/file/53630960501_6e9d198444_c_e8cb5fa333c3419ab0aa6d849c30cd15_grande.jpg\" /></p>\r\n\r\n<p>????Hướng dẫn sử dụng:</p>\r\n\r\n<p>+ Giặt m&aacute;y với chu kỳ trung b&igrave;nh v&agrave; v&ograve;ng quay ngắn</p>\r\n\r\n<p>+ Giặt với nhiệt độ tối đa 30 độ C</p>\r\n\r\n<p>+ Sấy nhẹ ở nhiệt độ thường</p>\r\n\r\n<p>+ L&agrave; ủi kh&ocirc;ng qu&aacute; 110 độ C</p>\r\n\r\n<p>+ Phơi bằng m&oacute;c dưới b&oacute;ng r&acirc;m</p>\r\n\r\n<p>+ Kh&ocirc;ng sử dụng chất tẩy</p>\r\n\r\n<p>???? Lưu &yacute; nhỏ:</p>\r\n\r\n<p>+ Kh&ocirc;ng giặt chung với đồ dễ xước</p>\r\n\r\n<p>+ Cẩn thận vướng mắc khi phơi</p>\r\n\r\n<p><img src=\"https://file.hstatic.net/200000690725/file/z4302376489686_ddcd3100f0718a9c51ff0413fd0abad8_4dd72d5ac71c45ff9b38d02558dee786_grande.jpg\" /></p>\r\n\r\n<p>????CH&Iacute;NH S&Aacute;CH ĐỔI:</p>\r\n\r\n<p>&bull; Torano hỗ trợ đổi h&agrave;ng trong trường hợp: sp mặc kh&ocirc;ng vừa, kh&aacute;ch kh&ocirc;ng ưng sp đ&atilde; đặt, sp c&oacute; lỗi của nh&agrave; sản xuất. &nbsp;<br />\r\n&bull; Sản phẩm đổi phải đạt điều kiện: c&ograve;n nguy&ecirc;n tem m&aacute;c, chưa qua sử dụng, kh&ocirc;ng c&oacute; vết bẩn, r&aacute;ch&hellip; &nbsp;<br />\r\n&bull; Thời gian đổi: trong v&ograve;ng 7 NG&Agrave;Y kể từ ng&agrave;y kh&aacute;ch nhận h&agrave;ng. &nbsp;<br />\r\n&bull; LƯU &Yacute;: &nbsp; - Kh&aacute;ch h&agrave;ng KH&Ocirc;NG BẤM NHẬN H&Agrave;NG khi c&oacute; nhu cầu đổi h&agrave;ng.</p>\r\n\r\n<p>- Nếu kh&aacute;ch h&agrave;ng bấm &ldquo;Đ&Atilde; NHẬN H&Agrave;NG&rdquo; kh&aacute;ch h&agrave;ng THANH TO&Aacute;N 2 CHIỀU PH&Iacute; SHIP khi đổi h&agrave;ng. &nbsp; &nbsp;<br />\r\n- Nếu c&oacute; khiếu nại cần hỗ trợ, qu&yacute; kh&aacute;ch CẦN C&Oacute; VIDEO QUAY LẠI QU&Aacute; TR&Igrave;NH MỞ H&Agrave;NG để đảm bảo vấn đề sẽ được giải quyết 100%.</p>', 1000, 1, '2025-05-21 17:06:40', '2025-05-21 17:06:40', 0),
(21, 3, 'Áo sơ mi dài tay trơn GATB010', '550000', 550000, 'assets/photos/somi1.png', '', '<p>????TH&Ocirc;NG TIN SẢN PHẨM:</p>\r\n\r\n<p>????T&ecirc;n sản phẩm:&nbsp;<strong>&Aacute;o sơ mi d&agrave;i tay trơn GATB010</strong></p>\r\n\r\n<p>????Chất liệu: Bamboo</p>\r\n\r\n<p>???? Size: 38-39-40-41-42</p>\r\n\r\n<p>???? Xuất xứ: Việt Nam</p>\r\n\r\n<p><img src=\"https://file.hstatic.net/200000690725/file/486636533_1066541452186102_6038089579555855623_n_grande.jpg\" /></p>\r\n\r\n<p>???? T&iacute;nh năng nổi bật:</p>\r\n\r\n<p>+ Giặt kh&ocirc;ng&nbsp;đổ l&ocirc;ng hay bay m&agrave;u, thấm h&uacute;t mồ h&ocirc;i v&agrave; thoải m&aacute;i kh&ocirc;ng g&ograve; b&oacute; khi vận động</p>\r\n\r\n<p>+ Thiết kế cấu tr&uacute;c lỗ tho&aacute;ng, mắt vải to tạo sự tho&aacute;ng m&aacute;t cho người mặc</p>\r\n\r\n<p><img src=\"https://file.hstatic.net/200000690725/file/_dsc9780_54324716525_o_grande.jpg\" /></p>\r\n\r\n<p>???? Mix:</p>\r\n\r\n<p>+ Quần vải (Đen/ Xanh t&iacute;m than) + Gi&agrave;y lười/ Gi&agrave;y thể thao.</p>\r\n\r\n<p>+ Quần kaki ( Đen/ Trắng/ Xanh t&iacute;m than) + Gi&agrave;y lười/ Gi&agrave;y thể thao.</p>\r\n\r\n<p>+ Jeans + Gi&agrave;y lười/ Gi&agrave;y thể thao</p>\r\n\r\n<p><img src=\"https://file.hstatic.net/200000690725/file/_dsc9778_54324536709_o_grande.jpg\" /></p>\r\n\r\n<p>????Hướng dẫn sử dụng:</p>\r\n\r\n<p>+ Giặt m&aacute;y với chu kỳ trung b&igrave;nh v&agrave; v&ograve;ng quay ngắn</p>\r\n\r\n<p>+ Giặt với nhiệt độ tối đa 30 độ C</p>\r\n\r\n<p>+ Sấy nhẹ ở nhiệt độ thường</p>\r\n\r\n<p>+ L&agrave; ủi kh&ocirc;ng qu&aacute; 110 độ C</p>\r\n\r\n<p>+ Phơi bằng m&oacute;c dưới b&oacute;ng r&acirc;m</p>\r\n\r\n<p>+ Kh&ocirc;ng sử dụng chất tẩy</p>\r\n\r\n<p>???? Lưu &yacute; nhỏ:</p>\r\n\r\n<p>+ Kh&ocirc;ng giặt chung với đồ dễ xước</p>\r\n\r\n<p>+ Cẩn thận vướng mắc khi phơi</p>\r\n\r\n<p><img src=\"https://file.hstatic.net/200000690725/file/z4341084428964_6bcba3cca07c771573358b745683b763_c311a7db83914ef09dfbb7592641adce_grande.jpg\" /></p>\r\n\r\n<p>????CH&Iacute;NH S&Aacute;CH ĐỔI:</p>\r\n\r\n<p>&bull; Torano hỗ trợ đổi h&agrave;ng trong trường hợp: sản phẩm&nbsp;mặc kh&ocirc;ng vừa, kh&aacute;ch kh&ocirc;ng ưng sản phẩm đ&atilde; đặt, sản phẩm c&oacute; lỗi của nh&agrave; sản xuất. &nbsp;<br />\r\n&bull; Sản phẩm đổi phải đạt điều kiện: c&ograve;n nguy&ecirc;n tem m&aacute;c, chưa qua sử dụng, kh&ocirc;ng c&oacute; vết bẩn, r&aacute;ch&hellip; &nbsp;<br />\r\n&bull; Thời gian đổi: trong v&ograve;ng 7 NG&Agrave;Y kể từ ng&agrave;y kh&aacute;ch nhận h&agrave;ng. &nbsp;<br />\r\n&bull; LƯU &Yacute;: &nbsp;&nbsp; &nbsp;<br />\r\n- Nếu c&oacute; khiếu nại cần hỗ trợ, qu&yacute; kh&aacute;ch CẦN C&Oacute; VIDEO QUAY LẠI QU&Aacute; TR&Igrave;NH MỞ H&Agrave;NG để đảm bảo vấn đề sẽ được giải quyết 100%</p>', 1000, 1, '2025-05-21 17:07:40', '2025-05-21 17:07:40', 0),
(22, 3, 'Áo sơ mi dài tay trơn GATB011', '550000', 550000, 'assets/photos/somi2.png', '', '<p>????TH&Ocirc;NG TIN SẢN PHẨM:</p>\r\n\r\n<p>????T&ecirc;n sản phẩm:&nbsp;<strong>&Aacute;o sơ mi d&agrave;i tay trơn GATB011</strong></p>\r\n\r\n<p>????Chất liệu: Bamboo</p>\r\n\r\n<p>???? Size: 38-39-40-41-42</p>\r\n\r\n<p>???? Xuất xứ: Việt Nam</p>\r\n\r\n<p><img src=\"https://file.hstatic.net/200000690725/file/481684714_1051320190374895_951652142632866916_n_grande.jpg\" /></p>\r\n\r\n<p>???? T&iacute;nh năng nổi bật:</p>\r\n\r\n<p>+ Giặt kh&ocirc;ng&nbsp;đổ l&ocirc;ng hay bay m&agrave;u, thấm h&uacute;t mồ h&ocirc;i v&agrave; thoải m&aacute;i kh&ocirc;ng g&ograve; b&oacute; khi vận động</p>\r\n\r\n<p>+ Thiết kế cấu tr&uacute;c lỗ tho&aacute;ng, mắt vải to tạo sự tho&aacute;ng m&aacute;t cho người mặc</p>\r\n\r\n<p><img src=\"https://file.hstatic.net/200000690725/file/_dsc9772_54324536769_o_grande.jpg\" /></p>\r\n\r\n<p>???? Mix:</p>\r\n\r\n<p>+ Quần vải (Đen/ Xanh t&iacute;m than) + Gi&agrave;y lười/ Gi&agrave;y thể thao.</p>\r\n\r\n<p>+ Quần kaki ( Đen/ Trắng/ Xanh t&iacute;m than) + Gi&agrave;y lười/ Gi&agrave;y thể thao.</p>\r\n\r\n<p>+ Jeans + Gi&agrave;y lười/ Gi&agrave;y thể thao</p>\r\n\r\n<p><img src=\"https://file.hstatic.net/200000690725/file/_dsc9775_54324536744_o_grande.jpg\" /></p>\r\n\r\n<p>????Hướng dẫn sử dụng:</p>\r\n\r\n<p>+ Giặt m&aacute;y với chu kỳ trung b&igrave;nh v&agrave; v&ograve;ng quay ngắn</p>\r\n\r\n<p>+ Giặt với nhiệt độ tối đa 30 độ C</p>\r\n\r\n<p>+ Sấy nhẹ ở nhiệt độ thường</p>\r\n\r\n<p>+ L&agrave; ủi kh&ocirc;ng qu&aacute; 110 độ C</p>\r\n\r\n<p>+ Phơi bằng m&oacute;c dưới b&oacute;ng r&acirc;m</p>\r\n\r\n<p>+ Kh&ocirc;ng sử dụng chất tẩy</p>\r\n\r\n<p>???? Lưu &yacute; nhỏ:</p>\r\n\r\n<p>+ Kh&ocirc;ng giặt chung với đồ dễ xước</p>\r\n\r\n<p>+ Cẩn thận vướng mắc khi phơi</p>\r\n\r\n<p><img src=\"https://file.hstatic.net/200000690725/file/z4341084428964_6bcba3cca07c771573358b745683b763_c311a7db83914ef09dfbb7592641adce_grande.jpg\" /></p>\r\n\r\n<p>????CH&Iacute;NH S&Aacute;CH ĐỔI:</p>\r\n\r\n<p>&bull; Torano hỗ trợ đổi h&agrave;ng trong trường hợp: sản phẩm&nbsp;mặc kh&ocirc;ng vừa, kh&aacute;ch kh&ocirc;ng ưng sản phẩm đ&atilde; đặt, sản phẩm c&oacute; lỗi của nh&agrave; sản xuất. &nbsp;<br />\r\n&bull; Sản phẩm đổi phải đạt điều kiện: c&ograve;n nguy&ecirc;n tem m&aacute;c, chưa qua sử dụng, kh&ocirc;ng c&oacute; vết bẩn, r&aacute;ch&hellip; &nbsp;<br />\r\n&bull; Thời gian đổi: trong v&ograve;ng 7 NG&Agrave;Y kể từ ng&agrave;y kh&aacute;ch nhận h&agrave;ng. &nbsp;<br />\r\n&bull; LƯU &Yacute;: &nbsp;&nbsp; &nbsp;<br />\r\n- Nếu c&oacute; khiếu nại cần hỗ trợ, qu&yacute; kh&aacute;ch CẦN C&Oacute; VIDEO QUAY LẠI QU&Aacute; TR&Igrave;NH MỞ H&Agrave;NG để đảm bảo vấn đề sẽ được giải quyết 100%</p>', 1000, 1, '2025-05-21 17:08:12', '2025-05-21 17:08:12', 0),
(23, 3, 'Sơ mi dài tay kẻ Oxford FATB035', '500000', 500000, 'assets/photos/somi3.png', '', '<p><strong>TH&Ocirc;NG TIN SẢN PHẨM:</strong></p>\r\n\r\n<p>- T&ecirc;n sản phẩm:&nbsp;<strong>Sơ mi d&agrave;i tay kẻ Oxford FATB035</strong></p>\r\n\r\n<p>- Phom d&aacute;ng: Smart-fit su&ocirc;ng rộng hơn Slim-fit</p>\r\n\r\n<p>- Size: S-M-L</p>\r\n\r\n<p>- Xuất xứ: Việt Nam</p>\r\n\r\n<p><img src=\"https://file.hstatic.net/200000690725/file/fatb035-7_54108797800_o_grande.jpg\" /></p>\r\n\r\n<p><img src=\"https://file.hstatic.net/200000690725/file/fatb035-6_54108601358_o_grande.jpg\" /></p>\r\n\r\n<p><img src=\"https://file.hstatic.net/200000690725/file/fatb035-9_54108797795_o_grande.jpg\" /></p>\r\n\r\n<p><strong>T&Iacute;NH NĂNG NỔI BẬT:</strong></p>\r\n\r\n<p>+ Giặt kh&ocirc;ng&nbsp;đổ l&ocirc;ng hay bay m&agrave;u, thấm h&uacute;t mồ h&ocirc;i v&agrave; thoải m&aacute;i kh&ocirc;ng g&ograve; b&oacute; khi vận động</p>\r\n\r\n<p>+ Thiết kế cấu tr&uacute;c lỗ tho&aacute;ng, mắt vải to tạo sự tho&aacute;ng m&aacute;t cho người mặc</p>\r\n\r\n<p><img src=\"https://file.hstatic.net/200000690725/file/z4341084428964_6bcba3cca07c771573358b745683b763_c311a7db83914ef09dfbb7592641adce_grande.jpg\" /></p>\r\n\r\n<p>????CH&Iacute;NH S&Aacute;CH ĐỔI:</p>\r\n\r\n<p>&bull; Torano hỗ trợ đổi h&agrave;ng trong trường hợp: sản phẩm&nbsp;mặc kh&ocirc;ng vừa, kh&aacute;ch kh&ocirc;ng ưng sản phẩm đ&atilde; đặt, sản phẩm c&oacute; lỗi của nh&agrave; sản xuất. &nbsp;<br />\r\n&bull; Sản phẩm đổi phải đạt điều kiện: c&ograve;n nguy&ecirc;n tem m&aacute;c, chưa qua sử dụng, kh&ocirc;ng c&oacute; vết bẩn, r&aacute;ch&hellip; &nbsp;<br />\r\n&bull; Thời gian đổi: trong v&ograve;ng 7 NG&Agrave;Y kể từ ng&agrave;y kh&aacute;ch nhận h&agrave;ng. &nbsp;<br />\r\n&bull; LƯU &Yacute;: &nbsp;&nbsp; &nbsp;<br />\r\n- Nếu c&oacute; khiếu nại cần hỗ trợ, qu&yacute; kh&aacute;ch CẦN C&Oacute; VIDEO QUAY LẠI QU&Aacute; TR&Igrave;NH MỞ H&Agrave;NG để đảm bảo vấn đề sẽ được giải quyết 100%</p>', 1000, 1, '2025-05-21 17:08:48', '2025-05-21 17:08:48', 0),
(24, 3, 'Sơ mi dài tay kẻ dọc FATB052', '500000', 500000, 'assets/photos/somi4.jpg', '', '<p><strong>TH&Ocirc;NG TIN SẢN PHẨM:</strong></p>\r\n\r\n<p>- T&ecirc;n sản phẩm:&nbsp;<strong>Sơ mi d&agrave;i tay kẻ dọc FATB052</strong></p>\r\n\r\n<p>- Phom d&aacute;ng: Smart-fit su&ocirc;ng rộng hơn Slim-fit</p>\r\n\r\n<p>- Size: S-M-L-XL</p>\r\n\r\n<p>- Xuất xứ: Việt Nam</p>\r\n\r\n<p><img src=\"https://file.hstatic.net/200000690725/file/465068130_959624986211083_2887576778973725659_n_grande.jpg\" /></p>\r\n\r\n<p><strong>T&Iacute;NH NĂNG NỔI BẬT:</strong></p>\r\n\r\n<p>+ Giặt kh&ocirc;ng&nbsp;đổ l&ocirc;ng hay bay m&agrave;u, thấm h&uacute;t mồ h&ocirc;i v&agrave; thoải m&aacute;i kh&ocirc;ng g&ograve; b&oacute; khi vận động</p>\r\n\r\n<p>+ Thiết kế cấu tr&uacute;c lỗ tho&aacute;ng, mắt vải to tạo sự tho&aacute;ng m&aacute;t cho người mặc</p>\r\n\r\n<p><img src=\"https://file.hstatic.net/200000690725/file/fatb052-3_54089785754_o_grande.jpg\" /></p>\r\n\r\n<p><img src=\"https://file.hstatic.net/200000690725/file/fatb052-9_54089702963_o_grande.jpg\" /></p>\r\n\r\n<p><img src=\"https://file.hstatic.net/200000690725/file/z4341084428964_6bcba3cca07c771573358b745683b763_c311a7db83914ef09dfbb7592641adce_grande.jpg\" /></p>\r\n\r\n<p>????CH&Iacute;NH S&Aacute;CH ĐỔI:</p>\r\n\r\n<p>&bull; Torano hỗ trợ đổi h&agrave;ng trong trường hợp: sản phẩm&nbsp;mặc kh&ocirc;ng vừa, kh&aacute;ch kh&ocirc;ng ưng sản phẩm đ&atilde; đặt, sản phẩm c&oacute; lỗi của nh&agrave; sản xuất. &nbsp;<br />\r\n&bull; Sản phẩm đổi phải đạt điều kiện: c&ograve;n nguy&ecirc;n tem m&aacute;c, chưa qua sử dụng, kh&ocirc;ng c&oacute; vết bẩn, r&aacute;ch&hellip; &nbsp;<br />\r\n&bull; Thời gian đổi: trong v&ograve;ng 7 NG&Agrave;Y kể từ ng&agrave;y kh&aacute;ch nhận h&agrave;ng. &nbsp;<br />\r\n&bull; LƯU &Yacute;: &nbsp;&nbsp; &nbsp;<br />\r\n- Nếu c&oacute; khiếu nại cần hỗ trợ, qu&yacute; kh&aacute;ch CẦN C&Oacute; VIDEO QUAY LẠI QU&Aacute; TR&Igrave;NH MỞ H&Agrave;NG để đảm bảo vấn đề sẽ được giải quyết 100%</p>', 1000, 1, '2025-05-21 17:09:23', '2025-05-21 17:09:23', 0),
(25, 3, 'Sơ mi dài tay kẻ dọc FATB050', '480000', 480000, 'assets/photos/somi5.png', '', '<p><strong>TH&Ocirc;NG TIN SẢN PHẨM:</strong></p>\r\n\r\n<p>- T&ecirc;n sản phẩm:&nbsp;<strong>Sơ mi d&agrave;i tay kẻ dọc FATB050</strong></p>\r\n\r\n<p>- Phom d&aacute;ng: Smart-fit su&ocirc;ng rộng hơn Slim-fit</p>\r\n\r\n<p>- Size: S-M-L-XL</p>\r\n\r\n<p>- Xuất xứ: Việt Nam</p>\r\n\r\n<p><img src=\"https://file.hstatic.net/200000690725/file/fatb050-3_54088578507_o_grande.jpg\" /></p>\r\n\r\n<p><strong>T&Iacute;NH NĂNG NỔI BẬT:</strong></p>\r\n\r\n<p>+ Giặt kh&ocirc;ng&nbsp;đổ l&ocirc;ng hay bay m&agrave;u, thấm h&uacute;t mồ h&ocirc;i v&agrave; thoải m&aacute;i kh&ocirc;ng g&ograve; b&oacute; khi vận động</p>\r\n\r\n<p>+ Thiết kế cấu tr&uacute;c lỗ tho&aacute;ng, mắt vải to tạo sự tho&aacute;ng m&aacute;t cho người mặc</p>\r\n\r\n<p><img src=\"https://file.hstatic.net/200000690725/file/fatb050-9_54089907115_o_grande.jpg\" /></p>\r\n\r\n<p><img src=\"https://file.hstatic.net/200000690725/file/fatb050-1_54088578522_o_grande.jpg\" /></p>\r\n\r\n<p><img src=\"https://file.hstatic.net/200000690725/file/z4341084428964_6bcba3cca07c771573358b745683b763_c311a7db83914ef09dfbb7592641adce_grande.jpg\" /></p>\r\n\r\n<p>????CH&Iacute;NH S&Aacute;CH ĐỔI:</p>\r\n\r\n<p>&bull; Torano hỗ trợ đổi h&agrave;ng trong trường hợp: sản phẩm&nbsp;mặc kh&ocirc;ng vừa, kh&aacute;ch kh&ocirc;ng ưng sản phẩm đ&atilde; đặt, sản phẩm c&oacute; lỗi của nh&agrave; sản xuất. &nbsp;<br />\r\n&bull; Sản phẩm đổi phải đạt điều kiện: c&ograve;n nguy&ecirc;n tem m&aacute;c, chưa qua sử dụng, kh&ocirc;ng c&oacute; vết bẩn, r&aacute;ch&hellip; &nbsp;<br />\r\n&bull; Thời gian đổi: trong v&ograve;ng 7 NG&Agrave;Y kể từ ng&agrave;y kh&aacute;ch nhận h&agrave;ng. &nbsp;<br />\r\n&bull; LƯU &Yacute;: &nbsp;&nbsp; &nbsp;<br />\r\n- Nếu c&oacute; khiếu nại cần hỗ trợ, qu&yacute; kh&aacute;ch CẦN C&Oacute; VIDEO QUAY LẠI QU&Aacute; TR&Igrave;NH MỞ H&Agrave;NG để đảm bảo vấn đề sẽ được giải quyết 100%</p>', 1000, 1, '2025-05-21 17:10:08', '2025-05-21 17:10:08', 0),
(26, 3, 'Sơ mi dài tay kẻ caro FATB045', '480000', 480000, 'assets/photos/somi6.png', '', '<p><strong>TH&Ocirc;NG TIN SẢN PHẨM:</strong></p>\r\n\r\n<p>- T&ecirc;n sản phẩm:&nbsp;<strong>Sơ mi d&agrave;i tay kẻ caro FATB045</strong></p>\r\n\r\n<p>- Phom d&aacute;ng: Smart-fit su&ocirc;ng rộng hơn Slim-fit</p>\r\n\r\n<p>- Size: S-M-L-XL</p>\r\n\r\n<p>- Xuất xứ: Việt Nam</p>\r\n\r\n<p><img src=\"https://file.hstatic.net/200000690725/file/fatb045-1_54089910470_o_grande.jpg\" /></p>\r\n\r\n<p><strong>T&Iacute;NH NĂNG NỔI BẬT:</strong></p>\r\n\r\n<p>+ Giặt kh&ocirc;ng&nbsp;đổ l&ocirc;ng hay bay m&agrave;u, thấm h&uacute;t mồ h&ocirc;i v&agrave; thoải m&aacute;i kh&ocirc;ng g&ograve; b&oacute; khi vận động</p>\r\n\r\n<p>+ Thiết kế cấu tr&uacute;c lỗ tho&aacute;ng, mắt vải to tạo sự tho&aacute;ng m&aacute;t cho người mặc</p>\r\n\r\n<p><img src=\"https://file.hstatic.net/200000690725/file/fatb045-2_54089787454_o_grande.jpg\" /></p>\r\n\r\n<p><img src=\"https://file.hstatic.net/200000690725/file/fatb045-3_54088582222_o_grande.jpg\" /></p>\r\n\r\n<p><img src=\"https://file.hstatic.net/200000690725/file/z4341084428964_6bcba3cca07c771573358b745683b763_c311a7db83914ef09dfbb7592641adce_grande.jpg\" /></p>\r\n\r\n<p>????CH&Iacute;NH S&Aacute;CH ĐỔI:</p>\r\n\r\n<p>&bull; Torano hỗ trợ đổi h&agrave;ng trong trường hợp: sản phẩm&nbsp;mặc kh&ocirc;ng vừa, kh&aacute;ch kh&ocirc;ng ưng sản phẩm đ&atilde; đặt, sản phẩm c&oacute; lỗi của nh&agrave; sản xuất. &nbsp;<br />\r\n&bull; Sản phẩm đổi phải đạt điều kiện: c&ograve;n nguy&ecirc;n tem m&aacute;c, chưa qua sử dụng, kh&ocirc;ng c&oacute; vết bẩn, r&aacute;ch&hellip; &nbsp;<br />\r\n&bull; Thời gian đổi: trong v&ograve;ng 7 NG&Agrave;Y kể từ ng&agrave;y kh&aacute;ch nhận h&agrave;ng. &nbsp;<br />\r\n&bull; LƯU &Yacute;: &nbsp;&nbsp; &nbsp;<br />\r\n- Nếu c&oacute; khiếu nại cần hỗ trợ, qu&yacute; kh&aacute;ch CẦN C&Oacute; VIDEO QUAY LẠI QU&Aacute; TR&Igrave;NH MỞ H&Agrave;NG để đảm bảo vấn đề sẽ được giải quyết 100%</p>', 1000, 1, '2025-05-21 17:10:47', '2025-05-21 17:10:47', 0),
(27, 4, 'Áo blazer túi cơi ngực FWTV002', '1499000', 1499000, 'assets/photos/aobla1.png', '', '<p><strong>&Aacute;o blazer FWTV002&nbsp;</strong>l&agrave; mẫu blazer&nbsp;nam cao cấp ch&iacute;nh h&atilde;ng Torano. Chất vải d&agrave;y dặn, mềm mịn v&agrave; kh&ocirc;ng nhăn nh&agrave;u lại cực th&igrave; tho&aacute;ng m&aacute;t. Sản phẩm khi kết hợp c&ugrave;ng quần &acirc;u đen&nbsp;sẽ tạo th&agrave;nh 1 set đồ lịch l&atilde;m, trẻ trung, t&ocirc;n l&ecirc;n vẻ nam t&iacute;nh cho anh em.</p>\r\n\r\n<p><img src=\"https://file.hstatic.net/200000690725/file/sp02_17.12-01_grande.jpg\" /></p>\r\n\r\n<p><img src=\"https://file.hstatic.net/200000690725/file/54206806107_ea44979770_c_grande.jpg\" /></p>\r\n\r\n<p><img src=\"https://file.hstatic.net/200000690725/file/54208114435_5d682e69e2_c_grande.jpg\" /></p>\r\n\r\n<p>????CH&Iacute;NH S&Aacute;CH ĐỔI:</p>\r\n\r\n<p>&bull; Torano hỗ trợ đổi h&agrave;ng trong trường hợp: sp mặc kh&ocirc;ng vừa, kh&aacute;ch kh&ocirc;ng ưng sp đ&atilde; đặt, sp c&oacute; lỗi của nh&agrave; sản xuất. &nbsp;<br />\r\n&bull; Sản phẩm đổi phải đạt điều kiện: c&ograve;n nguy&ecirc;n tem m&aacute;c, chưa qua sử dụng, kh&ocirc;ng c&oacute; vết bẩn, r&aacute;ch&hellip; &nbsp;<br />\r\n&bull; Thời gian đổi: trong v&ograve;ng 7 NG&Agrave;Y kể từ ng&agrave;y kh&aacute;ch nhận h&agrave;ng. &nbsp;<br />\r\n&bull; LƯU &Yacute;: &nbsp; - Kh&aacute;ch h&agrave;ng KH&Ocirc;NG BẤM NHẬN H&Agrave;NG khi c&oacute; nhu cầu đổi h&agrave;ng.</p>\r\n\r\n<p>- Nếu kh&aacute;ch h&agrave;ng bấm &ldquo;Đ&Atilde; NHẬN H&Agrave;NG&rdquo; kh&aacute;ch h&agrave;ng THANH TO&Aacute;N 2 CHIỀU PH&Iacute; SHIP khi đổi h&agrave;ng. &nbsp; &nbsp;<br />\r\n- Nếu c&oacute; khiếu nại cần hỗ trợ, qu&yacute; kh&aacute;ch CẦN C&Oacute; VIDEO QUAY LẠI QU&Aacute; TR&Igrave;NH MỞ H&Agrave;NG để đảm bảo vấn đề sẽ được giải quyết 100%.</p>', 1000, 1, '2025-05-21 17:11:58', '2025-05-21 17:11:58', 0),
(28, 4, 'Áo blazer túi cơi viền có nắp FWTV001', '1499000', 1499000, 'assets/photos/aobla2.png', '', '<p><strong>&Aacute;o blazer FWTV001&nbsp;</strong>l&agrave; mẫu blazer&nbsp;nam cao cấp ch&iacute;nh h&atilde;ng Torano. Chất vải d&agrave;y dặn, mềm mịn v&agrave; kh&ocirc;ng nhăn nh&agrave;u lại cực th&igrave; tho&aacute;ng m&aacute;t. Sản phẩm khi kết hợp c&ugrave;ng quần &acirc;u&nbsp;Torano FABT010&nbsp;sẽ tạo th&agrave;nh 1 set đồ lịch l&atilde;m, trẻ trung, t&ocirc;n l&ecirc;n vẻ nam t&iacute;nh cho anh em.</p>\r\n\r\n<p><img src=\"https://file.hstatic.net/200000690725/file/466407263_969854811854767_2056460342409471579_n_grande.jpg\" /></p>\r\n\r\n<p><img src=\"https://file.hstatic.net/200000690725/file/fwtv001-fstp073-fabt010_54064898317_o_grande.jpg\" /></p>\r\n\r\n<p><img src=\"https://file.hstatic.net/200000690725/file/fwtv001-2_54066026358_o_grande.jpg\" /></p>\r\n\r\n<p><img src=\"https://file.hstatic.net/200000690725/file/fwtv001-4_54066026373_o_grande.jpg\" /></p>\r\n\r\n<p>????CH&Iacute;NH S&Aacute;CH ĐỔI:</p>\r\n\r\n<p>&bull; Torano hỗ trợ đổi h&agrave;ng trong trường hợp: sp mặc kh&ocirc;ng vừa, kh&aacute;ch kh&ocirc;ng ưng sp đ&atilde; đặt, sp c&oacute; lỗi của nh&agrave; sản xuất. &nbsp;<br />\r\n&bull; Sản phẩm đổi phải đạt điều kiện: c&ograve;n nguy&ecirc;n tem m&aacute;c, chưa qua sử dụng, kh&ocirc;ng c&oacute; vết bẩn, r&aacute;ch&hellip; &nbsp;<br />\r\n&bull; Thời gian đổi: trong v&ograve;ng 7 NG&Agrave;Y kể từ ng&agrave;y kh&aacute;ch nhận h&agrave;ng. &nbsp;<br />\r\n&bull; LƯU &Yacute;: &nbsp; - Kh&aacute;ch h&agrave;ng KH&Ocirc;NG BẤM NHẬN H&Agrave;NG khi c&oacute; nhu cầu đổi h&agrave;ng.</p>\r\n\r\n<p>- Nếu kh&aacute;ch h&agrave;ng bấm &ldquo;Đ&Atilde; NHẬN H&Agrave;NG&rdquo; kh&aacute;ch h&agrave;ng THANH TO&Aacute;N 2 CHIỀU PH&Iacute; SHIP khi đổi h&agrave;ng. &nbsp; &nbsp;<br />\r\n- Nếu c&oacute; khiếu nại cần hỗ trợ, qu&yacute; kh&aacute;ch CẦN C&Oacute; VIDEO QUAY LẠI QU&Aacute; TR&Igrave;NH MỞ H&Agrave;NG để đảm bảo vấn đề sẽ được giải quyết 100%.</p>', 1000, 1, '2025-05-21 17:12:37', '2025-05-21 17:12:37', 0),
(29, 5, 'Áo khoác 3 lớp lót bông mũ liền FWCP002', '890000', 890000, 'assets/photos/aokhoac2.png', '', '<p>Miền Bắc chuyển r&eacute;t, anh em đ&atilde; tự tin đ&oacute;n gi&oacute; Đ&ocirc;ng với phao 3 lớp&nbsp;vừa ấm &aacute;p, vừa trẻ trung v&agrave; nổi bật từ TORANO chưa? Thiết kế ph&oacute;ng kho&aacute;ng với bề mặt chống nước cải tiến gấp 2 lần v&agrave; chần b&ocirc;ng 3 lớp giữ nhiệt sẽ khiến anh em kh&ocirc;ng thể bỏ lỡ.</p>\r\n\r\n<p><img src=\"https://file.hstatic.net/200000690725/file/468977801_983403613833220_7476730551031588383_n_grande.jpg\" /></p>\r\n\r\n<p><strong>&Aacute;o kho&aacute;c 3 lớp l&oacute;t b&ocirc;ng mũ liền FWCP002</strong><br />\r\n▪️ Được thiết kế theo đ&uacute;ng form chuẩn của nam giới Việt Nam</p>\r\n\r\n<p>▪️ Sản phẩm thuộc d&ograve;ng &Aacute;o kho&aacute;c 3 lớp&nbsp;cao cấp do TORANO sản xuất</p>\r\n\r\n<p><img src=\"https://file.hstatic.net/200000690725/file/fwcp002-10_54158422421_o_grande.jpg\" /></p>\r\n\r\n<p><img src=\"https://file.hstatic.net/200000690725/file/fwcp002-9_54158422441_o_grande.jpg\" /></p>\r\n\r\n<p><img src=\"https://file.hstatic.net/200000690725/file/fwcp002-4_54158876980_o_grande.jpg\" /></p>\r\n\r\n<p><strong>Đặc t&iacute;nh:</strong></p>\r\n\r\n<p>▪️ Thiết kế chần b&ocirc;ng 3 lớp nhẹ hơn, ấm hơn</p>\r\n\r\n<p>▪️ Kiểu d&aacute;ng ph&oacute;ng kho&aacute;ng, trẻ trung</p>\r\n\r\n<p>▪️&nbsp;Chống nước bền bỉ x2 nhờ c&ocirc;ng nghệ Hyper-tex cải tiến</p>\r\n\r\n<p><img src=\"https://file.hstatic.net/200000690725/file/fwcp002-11_54158701578_o_grande.jpg\" /></p>\r\n\r\n<p><img src=\"https://file.hstatic.net/200000690725/file/92657dfd1f6e44b29d4a84fdc5bdc2bd_tplv-o3syd03w52-resize-jpeg_800_800_943239088c9942f2963651549ff02ff6_grande.jpeg\" /></p>\r\n\r\n<p>???? HƯỚNG DẪN SỬ DỤNG<br />\r\n▪️ Giặt m&aacute;y chế độ nhẹ ở điều kiện thường<br />\r\n▪️ L&agrave; ủi kh&ocirc;ng qu&aacute; 110 độ C<br />\r\n▪️ Kh&ocirc;ng ng&acirc;m l&acirc;u với bột giặt c&aacute;c sản phẩm c&oacute; t&iacute;nh tẩy rửa<br />\r\n▪️ Khi giặt n&ecirc;n lộn mặt tr&aacute;i ra để đảm bảo độ bền của lớp kh&aacute;ng nước Hyper Tex<br />\r\n▪️ Kh&ocirc;ng giặt chung với vật sắc nhọn<br />\r\n<br />\r\n???? CH&Iacute;NH S&Aacute;CH ĐỔI:<br />\r\n▪️ Torano hỗ trợ đổi h&agrave;ng trong trường hợp: sản phẩm nhầm size, nhầm m&agrave;u; sản phẩm c&oacute; lỗi của nh&agrave; sản xuất.<br />\r\n▪️ Sản phẩm đổi phải đạt điều kiện:<br />\r\n- C&ograve;n nguy&ecirc;n tem m&aacute;c<br />\r\n- Chưa qua sử dụng, giặt tẩy<br />\r\n- Kh&ocirc;ng c&oacute; vết bẩn, r&aacute;ch<br />\r\n▪️ Thời gian đổi trả: trong v&ograve;ng 30 NG&Agrave;Y kể từ ng&agrave;y kh&aacute;ch nhận h&agrave;ng</p>', 1000, 1, '2025-05-21 17:13:30', '2025-05-21 17:14:07', 0),
(30, 5, 'Áo khoác phao 3 lớp lót bông cổ cao FWCF005', '990000', 990000, 'assets/photos/aokhoac1.png', '', '<p>Miền Bắc chuyển r&eacute;t, anh em đ&atilde; tự tin đ&oacute;n gi&oacute; Đ&ocirc;ng với phao b&eacute;o vừa ấm &aacute;p, vừa trẻ trung v&agrave; nổi bật từ TORANO chưa? Thiết kế ph&oacute;ng kho&aacute;ng với bề mặt chống nước cải tiến gấp 2 lần v&agrave; chần b&ocirc;ng 3 lớp giữ nhiệt sẽ khiến anh em kh&ocirc;ng thể bỏ lỡ.</p>\r\n\r\n<p><img src=\"https://file.hstatic.net/200000690725/file/470237452_993294479510800_2018067950392880246_n_grande.jpg\" /></p>\r\n\r\n<p><strong>&Aacute;o kho&aacute;c Puffer cổ cao FWCF005</strong><br />\r\n▪️ Được thiết kế theo đ&uacute;ng form chuẩn của nam giới Việt Nam</p>\r\n\r\n<p>▪️ Sản phẩm thuộc d&ograve;ng &Aacute;o kho&aacute;c 3 lớp&nbsp;chần&nbsp;b&ocirc;ng cao cấp do TORANO sản xuất</p>\r\n\r\n<p><img src=\"https://file.hstatic.net/200000690725/file/470213051_993289769511271_9196994905276710635_n_grande.jpg\" /></p>\r\n\r\n<p><img src=\"https://file.hstatic.net/200000690725/file/470235274_993289792844602_2217258900085943542_n_grande.jpg\" /></p>\r\n\r\n<p><strong>Đặc t&iacute;nh:</strong></p>\r\n\r\n<p>▪️ Thiết kế chần b&ocirc;ng 3 lớp nhẹ hơn, ấm hơn</p>\r\n\r\n<p>▪️ Kiểu d&aacute;ng phao b&eacute;o ph&oacute;ng kho&aacute;ng, trẻ trung</p>\r\n\r\n<p>▪️&nbsp;Chống nước bền bỉ x2 nhờ c&ocirc;ng nghệ Hyper-tex cải tiến</p>\r\n\r\n<p><img src=\"https://file.hstatic.net/200000690725/file/470210540_993289772844604_2698055481786318647_n_grande.jpg\" /></p>\r\n\r\n<p><img src=\"https://file.hstatic.net/200000690725/file/92657dfd1f6e44b29d4a84fdc5bdc2bd_tplv-o3syd03w52-resize-jpeg_800_800_943239088c9942f2963651549ff02ff6_grande.jpeg\" /></p>\r\n\r\n<p>???? HƯỚNG DẪN SỬ DỤNG<br />\r\n▪️ Giặt m&aacute;y chế độ nhẹ ở điều kiện thường<br />\r\n▪️ L&agrave; ủi kh&ocirc;ng qu&aacute; 110 độ C<br />\r\n▪️ Kh&ocirc;ng ng&acirc;m l&acirc;u với bột giặt c&aacute;c sản phẩm c&oacute; t&iacute;nh tẩy rửa<br />\r\n▪️ Khi giặt n&ecirc;n lộn mặt tr&aacute;i ra để đảm bảo độ bền của lớp kh&aacute;ng nước Hyper Tex<br />\r\n▪️ Kh&ocirc;ng giặt chung với vật sắc nhọn<br />\r\n<br />\r\n???? CH&Iacute;NH S&Aacute;CH ĐỔI:<br />\r\n▪️ Torano hỗ trợ đổi h&agrave;ng trong trường hợp: sản phẩm nhầm size, nhầm m&agrave;u; sản phẩm c&oacute; lỗi của nh&agrave; sản xuất.<br />\r\n▪️ Sản phẩm đổi phải đạt điều kiện:<br />\r\n- C&ograve;n nguy&ecirc;n tem m&aacute;c<br />\r\n- Chưa qua sử dụng, giặt tẩy<br />\r\n- Kh&ocirc;ng c&oacute; vết bẩn, r&aacute;ch<br />\r\n▪️ Thời gian đổi trả: trong v&ograve;ng 30 NG&Agrave;Y kể từ ng&agrave;y kh&aacute;ch nhận h&agrave;ng</p>', 1000, 1, '2025-05-21 17:14:49', '2025-05-21 17:14:49', 0),
(31, 5, 'Áo khoác cardigan nỉ basic FWCS006', '590000', 590000, 'assets/photos/aokhoac3.png', '', '<p><strong>&Aacute;o kho&aacute;c cardigan nỉ basic FWCS006</strong><br />\r\n▪️ Được thiết kế theo đ&uacute;ng form chuẩn của nam giới Việt Nam<br />\r\n▪️ Sản phẩm thuộc d&ograve;ng &Aacute;o cardigan nỉ cao cấp do TORANO sản xuất</p>\r\n\r\n<p><img src=\"https://file.hstatic.net/200000690725/file/465168898_960354939471421_5147411277036347581_n_grande.jpg\" /></p>\r\n\r\n<p>???? TH&Ocirc;NG TIN CHI TIẾT<br />\r\n* Chất liệu: Nỉ<br />\r\n* Phom: Regular Fit<br />\r\n* Xuất xứ: Việt Nam<br />\r\n* Size: S - M - L - XL</p>\r\n\r\n<p><img src=\"https://file.hstatic.net/200000690725/file/fwcs006-3_54041587953_o_grande.jpg\" /></p>\r\n\r\n<p><img src=\"https://file.hstatic.net/200000690725/file/fwcs006-5_54041338891_o_grande.jpg\" /></p>\r\n\r\n<p><img src=\"https://file.hstatic.net/200000690725/file/fwcs006-6_54040473777_o_grande.jpg\" /></p>\r\n\r\n<p><img src=\"https://file.hstatic.net/200000690725/file/92657dfd1f6e44b29d4a84fdc5bdc2bd_tplv-o3syd03w52-resize-jpeg_800_800_943239088c9942f2963651549ff02ff6_grande.jpeg\" /></p>\r\n\r\n<p>???? HƯỚNG DẪN SỬ DỤNG<br />\r\n▪️ Giặt m&aacute;y chế độ nhẹ ở điều kiện thường<br />\r\n▪️ L&agrave; ủi kh&ocirc;ng qu&aacute; 110 độ C<br />\r\n▪️ Kh&ocirc;ng ng&acirc;m l&acirc;u với bột giặt c&aacute;c sản phẩm c&oacute; t&iacute;nh tẩy rửa<br />\r\n▪️ Khi giặt n&ecirc;n lộn mặt tr&aacute;i ra để đảm bảo độ bền của lớp kh&aacute;ng nước Hyper Tex<br />\r\n▪️ Kh&ocirc;ng giặt chung với vật sắc nhọn</p>\r\n\r\n<p><br />\r\n???? CH&Iacute;NH S&Aacute;CH ĐỔI:<br />\r\n▪️ Torano hỗ trợ đổi h&agrave;ng trong trường hợp: sản phẩm nhầm size, nhầm m&agrave;u; sản phẩm c&oacute; lỗi của nh&agrave; sản xuất.<br />\r\n▪️ Sản phẩm đổi phải đạt điều kiện:<br />\r\n- C&ograve;n nguy&ecirc;n tem m&aacute;c<br />\r\n- Chưa qua sử dụng, giặt tẩy<br />\r\n- Kh&ocirc;ng c&oacute; vết bẩn, r&aacute;ch<br />\r\n▪️ Thời gian đổi trả: trong v&ograve;ng 30 NG&Agrave;Y kể từ ng&agrave;y kh&aacute;ch nhận h&agrave;ng</p>', 1000, 1, '2025-05-21 17:15:17', '2025-05-21 17:15:17', 0),
(32, 5, 'Áo khoác nhung tăm cổ bẻ phối lông FWCV001', '990000', 990000, 'assets/photos/aokhoac4.png', '', '<p><strong>&Aacute;o kho&aacute;c nhung tăm cổ bẻ phối l&ocirc;ng FWCV001</strong><br />\r\n▪️ Được thiết kế theo đ&uacute;ng form chuẩn của nam giới Việt Nam<br />\r\n▪️ Sản phẩm thuộc d&ograve;ng &Aacute;o kho&aacute;c nhung tăm cao cấp do TORANO sản xuất</p>\r\n\r\n<p><img src=\"https://file.hstatic.net/200000690725/file/469423759_986340913539490_2939407661336700445_n_grande.jpg\" /></p>\r\n\r\n<p>???? TH&Ocirc;NG TIN CHI TIẾT<br />\r\n* Chất liệu: Nhung tăm l&oacute;t l&ocirc;ng<br />\r\n* Phom: Regular Fit&nbsp;<br />\r\n* Xuất xứ: Việt Nam<br />\r\n* Size: S - M - L - XL</p>\r\n\r\n<p><img src=\"https://file.hstatic.net/200000690725/file/fwcv001-7_54167865158_o_grande.jpg\" /></p>\r\n\r\n<p><img src=\"https://file.hstatic.net/200000690725/file/fwcv001-2_54167900029_o_grande.jpg\" /></p>\r\n\r\n<p><img src=\"https://file.hstatic.net/200000690725/file/fwcv001-10_54167592701_o_grande.jpg\" /></p>\r\n\r\n<p><img src=\"https://file.hstatic.net/200000690725/file/92657dfd1f6e44b29d4a84fdc5bdc2bd_tplv-o3syd03w52-resize-jpeg_800_800_943239088c9942f2963651549ff02ff6_grande.jpeg\" /></p>\r\n\r\n<p><br />\r\n???? CH&Iacute;NH S&Aacute;CH ĐỔI:<br />\r\n▪️ Torano hỗ trợ đổi h&agrave;ng trong trường hợp: sản phẩm nhầm size, nhầm m&agrave;u; sản phẩm c&oacute; lỗi của nh&agrave; sản xuất.<br />\r\n▪️ Sản phẩm đổi phải đạt điều kiện:<br />\r\n- C&ograve;n nguy&ecirc;n tem m&aacute;c<br />\r\n- Chưa qua sử dụng, giặt tẩy<br />\r\n- Kh&ocirc;ng c&oacute; vết bẩn, r&aacute;ch<br />\r\n▪️ Thời gian đổi trả: trong v&ograve;ng 30 NG&Agrave;Y kể từ ng&agrave;y kh&aacute;ch nhận h&agrave;ng</p>', 1000, 1, '2025-05-21 17:15:46', '2025-05-21 17:15:46', 0),
(33, 5, 'Áo khoác da lộn chần bông, cổ phối lông FWCL005', '990000', 990000, 'assets/photos/aokhoac5.png', '', '<p><strong>&Aacute;o kho&aacute;c da lộn chần b&ocirc;ng, cổ phối l&ocirc;ng FWCL005</strong><br />\r\n▪️ Được thiết kế theo đ&uacute;ng form chuẩn của nam giới Việt Nam<br />\r\n▪️ Sản phẩm thuộc d&ograve;ng &Aacute;o kho&aacute;c da lộn chần b&ocirc;ng cao cấp do TORANO sản xuất</p>\r\n\r\n<p><img src=\"https://file.hstatic.net/200000690725/file/fwcl005-1_54148139145_o_grande.jpg\" /></p>\r\n\r\n<p>???? TH&Ocirc;NG TIN CHI TIẾT<br />\r\n* Chất liệu: Da lộn cao cấp chần b&ocirc;ng<br />\r\n* Phom: Regular Fit<br />\r\n* Xuất xứ: Việt Nam<br />\r\n* Size: S - M - L - XL</p>\r\n\r\n<p><img src=\"https://file.hstatic.net/200000690725/file/fwcl005-10_54148001009_o_grande.jpg\" /></p>\r\n\r\n<p><img src=\"https://file.hstatic.net/200000690725/file/fwcl005-11_54146826287_o_grande.jpg\" /></p>\r\n\r\n<p><img src=\"https://file.hstatic.net/200000690725/file/fwcl005-13_54146826232_o_grande.jpg\" /></p>\r\n\r\n<p><strong>T&Iacute;NH NĂNG NỔI BẬT</strong><br />\r\n* Chất da lộn mềm mại,&nbsp;l&ecirc;n phom chuẩn, KH&Ocirc;NG tạo cảm gi&aacute;c cộm hay kh&oacute; chịu khi sử dụng. Dễ d&agrave;ng layer với c&aacute;c trang phục kh&aacute;c b&ecirc;n trong.<br />\r\n* Mặt trong được chần b&ocirc;ng&nbsp;d&agrave;y dặn, giữ ấm tốt<br />\r\n* Thiết kế cổ bẻ phối l&ocirc;ng ấm &aacute;p<br />\r\n* Bản lề &aacute;o thiết kế đặc biệt &amp; gia c&ocirc;ng tỉ mỉ, gi&uacute;p chặn gi&oacute; l&ugrave;a tối đa<br />\r\nLưu &yacute; nhỏ: Chất liệu da lộn mang lại sự sang trọng v&agrave; c&oacute; t&iacute;nh thời trang bền vững, kh&ocirc;ng lỗi mốt sau nhiều năm sử dụng</p>\r\n\r\n<p><img src=\"https://file.hstatic.net/200000690725/file/92657dfd1f6e44b29d4a84fdc5bdc2bd_tplv-o3syd03w52-resize-jpeg_800_800_943239088c9942f2963651549ff02ff6_grande.jpeg\" /></p>\r\n\r\n<p><br />\r\n???? CH&Iacute;NH S&Aacute;CH ĐỔI:<br />\r\n▪️ Torano hỗ trợ đổi h&agrave;ng trong trường hợp: sản phẩm nhầm size, nhầm m&agrave;u; sản phẩm c&oacute; lỗi của nh&agrave; sản xuất.<br />\r\n▪️ Sản phẩm đổi phải đạt điều kiện:<br />\r\n- C&ograve;n nguy&ecirc;n tem m&aacute;c<br />\r\n- Chưa qua sử dụng, giặt tẩy<br />\r\n- Kh&ocirc;ng c&oacute; vết bẩn, r&aacute;ch<br />\r\n▪️ Thời gian đổi trả: trong v&ograve;ng 30 NG&Agrave;Y kể từ ng&agrave;y kh&aacute;ch nhận h&agrave;ng</p>', 1000, 1, '2025-05-21 17:16:13', '2025-05-21 17:16:13', 0),
(34, 5, 'Áo khoác Puffer cổ cao FWCF004', '990000', 699000, 'assets/photos/aokhoac6.png', '', '<p>Miền Bắc chuyển r&eacute;t, anh em đ&atilde; tự tin đ&oacute;n gi&oacute; Đ&ocirc;ng với phao b&eacute;o vừa ấm &aacute;p, vừa trẻ trung v&agrave; nổi bật từ TORANO chưa? Thiết kế ph&oacute;ng kho&aacute;ng với bề mặt chống nước cải tiến gấp 2 lần v&agrave; chần b&ocirc;ng 3 lớp giữ nhiệt sẽ khiến anh em kh&ocirc;ng thể bỏ lỡ.</p>\r\n\r\n<p><img src=\"https://file.hstatic.net/200000690725/file/54127018964_cd767a85fd_k_grande.jpg\" /></p>\r\n\r\n<p><strong>&Aacute;o kho&aacute;c Puffer cổ cao FWCF004</strong><br />\r\n▪️ Được thiết kế theo đ&uacute;ng form chuẩn của nam giới Việt Nam</p>\r\n\r\n<p>▪️ Sản phẩm thuộc d&ograve;ng &Aacute;o kho&aacute;c 3 lớp chần b&ocirc;ng cao cấp do TORANO sản xuất</p>\r\n\r\n<p><img src=\"https://file.hstatic.net/200000690725/file/fwcf004-4_54150691323_o_grande.jpg\" /></p>\r\n\r\n<p><strong>Đặc t&iacute;nh:</strong></p>\r\n\r\n<p>▪️ Thiết kế chần b&ocirc;ng 3 lớp nhẹ hơn, ấm hơn</p>\r\n\r\n<p>▪️ Kiểu d&aacute;ng phao b&eacute;o ph&oacute;ng kho&aacute;ng, trẻ trung</p>\r\n\r\n<p>▪️&nbsp;Chống nước bền bỉ x2 nhờ c&ocirc;ng nghệ Hyper-tex cải tiến</p>\r\n\r\n<p><img src=\"https://file.hstatic.net/200000690725/file/fwcf004-7_54150860135_o_grande.jpg\" /></p>\r\n\r\n<p><img src=\"https://file.hstatic.net/200000690725/file/fwcf004-1_54150398421_o_grande.jpg\" /></p>\r\n\r\n<p><img src=\"https://file.hstatic.net/200000690725/file/fwcf004-12_54120969995_o_grande.jpg\" /></p>\r\n\r\n<p><img src=\"https://file.hstatic.net/200000690725/file/92657dfd1f6e44b29d4a84fdc5bdc2bd_tplv-o3syd03w52-resize-jpeg_800_800_943239088c9942f2963651549ff02ff6_grande.jpeg\" /></p>\r\n\r\n<p>???? HƯỚNG DẪN SỬ DỤNG<br />\r\n▪️ Giặt m&aacute;y chế độ nhẹ ở điều kiện thường<br />\r\n▪️ L&agrave; ủi kh&ocirc;ng qu&aacute; 110 độ C<br />\r\n▪️ Kh&ocirc;ng ng&acirc;m l&acirc;u với bột giặt c&aacute;c sản phẩm c&oacute; t&iacute;nh tẩy rửa<br />\r\n▪️ Khi giặt n&ecirc;n lộn mặt tr&aacute;i ra để đảm bảo độ bền của lớp kh&aacute;ng nước Hyper Tex<br />\r\n▪️ Kh&ocirc;ng giặt chung với vật sắc nhọn<br />\r\n<br />\r\n???? CH&Iacute;NH S&Aacute;CH ĐỔI:<br />\r\n▪️ Torano hỗ trợ đổi h&agrave;ng trong trường hợp: sản phẩm nhầm size, nhầm m&agrave;u; sản phẩm c&oacute; lỗi của nh&agrave; sản xuất.<br />\r\n▪️ Sản phẩm đổi phải đạt điều kiện:<br />\r\n- C&ograve;n nguy&ecirc;n tem m&aacute;c<br />\r\n- Chưa qua sử dụng, giặt tẩy<br />\r\n- Kh&ocirc;ng c&oacute; vết bẩn, r&aacute;ch<br />\r\n▪️ Thời gian đổi trả: trong v&ograve;ng 30 NG&Agrave;Y kể từ ng&agrave;y kh&aacute;ch nhận h&agrave;ng</p>', 1000, 1, '2025-05-21 17:16:46', '2025-05-21 17:16:46', 0),
(35, 6, 'Áo len trơn cổ tròn thêu logo FWTE001', '420000', 420000, 'assets/photos/aolen1.jpg', '', '<p>????TH&Ocirc;NG TIN SẢN PHẨM:</p>\r\n\r\n<p>????T&ecirc;n sản phẩm:&nbsp;<strong>&Aacute;o len trơn cổ tr&ograve;n th&ecirc;u logo FWTE001</strong></p>\r\n\r\n<p>????Chất liệu: Len</p>\r\n\r\n<p>????Phom d&aacute;ng: Regular</p>\r\n\r\n<p>????Size: S, M, L, XL</p>\r\n\r\n<p>????Xuất xứ: Việt Nam</p>\r\n\r\n<p><img src=\"https://file.hstatic.net/200000690725/file/fwte001-1_54147966128_o_grande.jpg\" /></p>\r\n\r\n<p>????T&iacute;nh năng nổi bật:</p>\r\n\r\n<p>- Chất liệu len&nbsp;d&agrave;y vừa phải, vải được dệt từ những sợi b&ocirc;ng nhập khẩu cao cấp lu&ocirc;n tạo cho người d&ugrave;ng cảm gi&aacute;c v&ocirc; c&ugrave;ng mềm mại, thoải m&aacute;i, &aacute;o c&oacute; độ co gi&atilde;n tuyệt đối. Đặc biệt l&agrave; giữ ấm tốt</p>\r\n\r\n<p>- Cổ &aacute;o c&aacute;ch điệu theo d&aacute;ng cổ tr&ograve;n độc đ&aacute;o</p>\r\n\r\n<p>- Chất lượng tốt, gi&aacute; cả hợp l&yacute;</p>\r\n\r\n<p>- Kh&ocirc;ng x&ugrave;, kh&ocirc;ng phai m&agrave;u, kh&ocirc;ng bai</p>\r\n\r\n<p><img src=\"https://file.hstatic.net/200000690725/file/fwte001-5_54146828057_o_grande.jpg\" /></p>\r\n\r\n<p><img src=\"https://file.hstatic.net/200000690725/file/fwte001-6_54148002919_o_grande.jpg\" /></p>\r\n\r\n<p><img src=\"https://file.hstatic.net/200000690725/file/fwte001-3_54148002799_o_grande.jpg\" /></p>\r\n\r\n<p><img src=\"https://file.hstatic.net/200000690725/file/size_ao_dai_tay_grande.jpg\" /></p>\r\n\r\n<p>???? HƯỚNG DẪN SỬ DỤNG<br />\r\n▪️ Giặt m&aacute;y chế độ nhẹ ở điều kiện thường<br />\r\n▪️ L&agrave; ủi kh&ocirc;ng qu&aacute; 110 độ C<br />\r\n▪️ Kh&ocirc;ng ng&acirc;m l&acirc;u với bột giặt c&aacute;c sản phẩm c&oacute; t&iacute;nh tẩy rửa<br />\r\n▪️ Kh&ocirc;ng giặt chung với vật sắc nhọn</p>\r\n\r\n<p><br />\r\n???? CH&Iacute;NH S&Aacute;CH ĐỔI:<br />\r\n▪️ Torano hỗ trợ đổi h&agrave;ng trong trường hợp: sản phẩm nhầm size, nhầm m&agrave;u; sản phẩm c&oacute; lỗi của nh&agrave; sản xuất.<br />\r\n▪️ Sản phẩm đổi phải đạt điều kiện:<br />\r\n- C&ograve;n nguy&ecirc;n tem m&aacute;c<br />\r\n- Chưa qua sử dụng, giặt tẩy<br />\r\n- Kh&ocirc;ng c&oacute; vết bẩn, r&aacute;ch<br />\r\n▪️ Thời gian đổi trả: trong v&ograve;ng 30 NG&Agrave;Y kể từ ng&agrave;y kh&aacute;ch nhận h&agrave;ng</p>', 1000, 1, '2025-05-21 17:17:33', '2025-05-21 17:17:33', 0),
(36, 7, 'Áo nỉ Hoodie trơn thêu logo ngực Dog FWTW017', '590000', 590000, 'assets/photos/ni1.png', '', '<p>????TH&Ocirc;NG TIN SẢN PHẨM:</p>\r\n\r\n<p>????T&ecirc;n sản phẩm:&nbsp;<strong>&Aacute;o nỉ Hoodie trơn th&ecirc;u logo ngực Dog FWTW017</strong></p>\r\n\r\n<p>????Chất liệu: Nỉ</p>\r\n\r\n<p>????Phom d&aacute;ng: Regular</p>\r\n\r\n<p>????Size: M, L, XL</p>\r\n\r\n<p>????Xuất xứ: Việt Nam</p>\r\n\r\n<p><img src=\"https://file.hstatic.net/200000690725/file/465692455_963464129160502_4737093958312117598_n_grande.jpg\" /></p>\r\n\r\n<p>????T&iacute;nh năng nổi bật:</p>\r\n\r\n<p>- Chất liệu nỉ d&agrave;y vừa phải, vải được dệt từ những sợi b&ocirc;ng nhập khẩu cao cấp lu&ocirc;n tạo cho người d&ugrave;ng cảm gi&aacute;c v&ocirc; c&ugrave;ng mềm mại, thoải m&aacute;i, &aacute;o c&oacute; độ co gi&atilde;n tuyệt đối. Đặc biệt l&agrave; giữ ấm tốt</p>\r\n\r\n<p>- Chất lượng tốt, gi&aacute; cả hợp l&yacute;</p>\r\n\r\n<p>- Kh&ocirc;ng x&ugrave;, kh&ocirc;ng phai m&agrave;u, kh&ocirc;ng bai</p>\r\n\r\n<p>- &Aacute;o nỉ thiết kế phối bo tay v&agrave; gấu &aacute;o đơn giản, tinh tế mang đến phong c&aacute;ch trẻ trung, thanh lich</p>\r\n\r\n<p><img src=\"https://file.hstatic.net/200000690725/file/fwtw017-5_54038029567_o_grande.jpg\" /></p>\r\n\r\n<p><img src=\"https://file.hstatic.net/200000690725/file/fwtw017-9_54039149758_o_grande.jpg\" /></p>\r\n\r\n<p><img src=\"https://file.hstatic.net/200000690725/file/fwtw017-10_54038892576_o_grande.jpg\" /></p>\r\n\r\n<p><img src=\"https://file.hstatic.net/200000690725/file/size_ao_dai_tay_grande.jpg\" /></p>\r\n\r\n<p>???? HƯỚNG DẪN SỬ DỤNG<br />\r\n▪️ Giặt m&aacute;y chế độ nhẹ ở điều kiện thường<br />\r\n▪️ L&agrave; ủi kh&ocirc;ng qu&aacute; 110 độ C<br />\r\n▪️ Kh&ocirc;ng ng&acirc;m l&acirc;u với bột giặt c&aacute;c sản phẩm c&oacute; t&iacute;nh tẩy rửa<br />\r\n▪️ Kh&ocirc;ng giặt chung với vật sắc nhọn</p>\r\n\r\n<p><br />\r\n???? CH&Iacute;NH S&Aacute;CH ĐỔI:<br />\r\n▪️ Torano hỗ trợ đổi h&agrave;ng trong trường hợp: sản phẩm nhầm size, nhầm m&agrave;u; sản phẩm c&oacute; lỗi của nh&agrave; sản xuất.<br />\r\n▪️ Sản phẩm đổi phải đạt điều kiện:<br />\r\n- C&ograve;n nguy&ecirc;n tem m&aacute;c<br />\r\n- Chưa qua sử dụng, giặt tẩy<br />\r\n- Kh&ocirc;ng c&oacute; vết bẩn, r&aacute;ch<br />\r\n▪️ Thời gian đổi trả: trong v&ograve;ng 30 NG&Agrave;Y kể từ ng&agrave;y kh&aacute;ch nhận h&agrave;ng</p>', 1000, 1, '2025-05-21 17:18:52', '2025-05-21 17:18:52', 0),
(37, 7, 'Áo nỉ Hoodie in tràn họa tiết TRN FWTW002', '650000', 650000, 'assets/photos/ni2.png', '', '<p>????TH&Ocirc;NG TIN SẢN PHẨM:</p>\r\n\r\n<p>????T&ecirc;n sản phẩm:&nbsp;<strong>&Aacute;o nỉ Hoodie in tr&agrave;n họa tiết TRN FWTW002</strong></p>\r\n\r\n<p>????Chất liệu: Nỉ</p>\r\n\r\n<p>????Phom d&aacute;ng: Regular</p>\r\n\r\n<p>????Size: M, L, XL</p>\r\n\r\n<p>????Xuất xứ: Việt Nam</p>\r\n\r\n<p><img src=\"https://file.hstatic.net/200000690725/file/465591839_963437182496530_1867898573255758791_n_grande.jpg\" /></p>\r\n\r\n<p>????T&iacute;nh năng nổi bật:</p>\r\n\r\n<p>- Chất liệu nỉ d&agrave;y vừa phải, vải được dệt từ những sợi b&ocirc;ng nhập khẩu cao cấp lu&ocirc;n tạo cho người d&ugrave;ng cảm gi&aacute;c v&ocirc; c&ugrave;ng mềm mại, thoải m&aacute;i, &aacute;o c&oacute; độ co gi&atilde;n tuyệt đối. Đặc biệt l&agrave; giữ ấm tốt</p>\r\n\r\n<p>- Chất lượng tốt, gi&aacute; cả hợp l&yacute;</p>\r\n\r\n<p>- Kh&ocirc;ng x&ugrave;, kh&ocirc;ng phai m&agrave;u, kh&ocirc;ng bai</p>\r\n\r\n<p>- &Aacute;o nỉ thiết kế phối bo tay v&agrave; gấu &aacute;o đơn giản, tinh tế mang đến phong c&aacute;ch trẻ trung, thanh lich</p>\r\n\r\n<p><img src=\"https://file.hstatic.net/200000690725/file/fwtw002-4_54038033307_o_grande.jpg\" /></p>\r\n\r\n<p><img src=\"https://file.hstatic.net/200000690725/file/fwtw002-1_54039227059_o_grande.jpg\" /></p>\r\n\r\n<p><img src=\"https://file.hstatic.net/200000690725/file/fwtw002-3_54038033292_o_grande.jpg\" /></p>\r\n\r\n<p><img src=\"https://file.hstatic.net/200000690725/file/size_ao_dai_tay_grande.jpg\" /></p>\r\n\r\n<p>???? HƯỚNG DẪN SỬ DỤNG<br />\r\n▪️ Giặt m&aacute;y chế độ nhẹ ở điều kiện thường<br />\r\n▪️ L&agrave; ủi kh&ocirc;ng qu&aacute; 110 độ C<br />\r\n▪️ Kh&ocirc;ng ng&acirc;m l&acirc;u với bột giặt c&aacute;c sản phẩm c&oacute; t&iacute;nh tẩy rửa<br />\r\n▪️ Kh&ocirc;ng giặt chung với vật sắc nhọn</p>\r\n\r\n<p><br />\r\n???? CH&Iacute;NH S&Aacute;CH ĐỔI:<br />\r\n▪️ Torano hỗ trợ đổi h&agrave;ng trong trường hợp: sản phẩm nhầm size, nhầm m&agrave;u; sản phẩm c&oacute; lỗi của nh&agrave; sản xuất.<br />\r\n▪️ Sản phẩm đổi phải đạt điều kiện:<br />\r\n- C&ograve;n nguy&ecirc;n tem m&aacute;c<br />\r\n- Chưa qua sử dụng, giặt tẩy<br />\r\n- Kh&ocirc;ng c&oacute; vết bẩn, r&aacute;ch<br />\r\n▪️ Thời gian đổi trả: trong v&ograve;ng 30 NG&Agrave;Y kể từ ng&agrave;y kh&aacute;ch nhận h&agrave;ng</p>', 1000, 1, '2025-05-21 17:19:24', '2025-05-21 17:19:24', 0),
(38, 7, 'Áo nỉ họa tiết in logo Glory FWTW012', '450000', 450000, 'assets/photos/ni3.png', '', '<p>????TH&Ocirc;NG TIN SẢN PHẨM:</p>\r\n\r\n<p>????T&ecirc;n sản phẩm:&nbsp;<strong>&Aacute;o nỉ họa tiết in logo Glory FWTW012</strong></p>\r\n\r\n<p>????Chất liệu: Nỉ</p>\r\n\r\n<p>????Phom d&aacute;ng: Regular</p>\r\n\r\n<p>????Size: S,&nbsp;M, L, XL</p>\r\n\r\n<p>????Xuất xứ: Việt Nam</p>\r\n\r\n<p><img src=\"https://file.hstatic.net/200000690725/file/fwtw012-11_54150413356_o_grande.jpg\" /></p>\r\n\r\n<p>????T&iacute;nh năng nổi bật:</p>\r\n\r\n<p>- Chất liệu nỉ d&agrave;y vừa phải, vải được dệt từ những sợi b&ocirc;ng nhập khẩu cao cấp lu&ocirc;n tạo cho người d&ugrave;ng cảm gi&aacute;c v&ocirc; c&ugrave;ng mềm mại, thoải m&aacute;i, &aacute;o c&oacute; độ co gi&atilde;n tuyệt đối. Đặc biệt l&agrave; giữ ấm tốt</p>\r\n\r\n<p>- Cổ &aacute;o c&aacute;ch điệu theo d&aacute;ng cổ tr&ograve;n độc đ&aacute;o</p>\r\n\r\n<p>- Chất lượng tốt, gi&aacute; cả hợp l&yacute;</p>\r\n\r\n<p>- Kh&ocirc;ng x&ugrave;, kh&ocirc;ng phai m&agrave;u, kh&ocirc;ng bai</p>\r\n\r\n<p>- &Aacute;o nỉ thiết kế phối bo tay v&agrave; gấu &aacute;o đơn giản, tinh tế mang đến phong c&aacute;ch trẻ trung, thanh lich</p>\r\n\r\n<p><img src=\"https://file.hstatic.net/200000690725/file/fwtw012-8_54150706078_o_grande.jpg\" /></p>\r\n\r\n<p><img src=\"https://file.hstatic.net/200000690725/file/fwtw012-9_54150740229_o_grande.jpg\" /></p>\r\n\r\n<p><img src=\"https://file.hstatic.net/200000690725/file/fwtw012-1_54150413336_o_grande.jpg\" /></p>\r\n\r\n<p><img src=\"https://file.hstatic.net/200000690725/file/size_ao_dai_tay_grande.jpg\" /></p>\r\n\r\n<p>???? HƯỚNG DẪN SỬ DỤNG<br />\r\n▪️ Giặt m&aacute;y chế độ nhẹ ở điều kiện thường<br />\r\n▪️ L&agrave; ủi kh&ocirc;ng qu&aacute; 110 độ C<br />\r\n▪️ Kh&ocirc;ng ng&acirc;m l&acirc;u với bột giặt c&aacute;c sản phẩm c&oacute; t&iacute;nh tẩy rửa<br />\r\n▪️ Kh&ocirc;ng giặt chung với vật sắc nhọn</p>\r\n\r\n<p><br />\r\n???? CH&Iacute;NH S&Aacute;CH ĐỔI:<br />\r\n▪️ Torano hỗ trợ đổi h&agrave;ng trong trường hợp: sản phẩm nhầm size, nhầm m&agrave;u; sản phẩm c&oacute; lỗi của nh&agrave; sản xuất.<br />\r\n▪️ Sản phẩm đổi phải đạt điều kiện:<br />\r\n- C&ograve;n nguy&ecirc;n tem m&aacute;c<br />\r\n- Chưa qua sử dụng, giặt tẩy<br />\r\n- Kh&ocirc;ng c&oacute; vết bẩn, r&aacute;ch<br />\r\n▪️ Thời gian đổi trả: trong v&ograve;ng 30 NG&Agrave;Y kể từ ng&agrave;y kh&aacute;ch nhận h&agrave;ng</p>', 1000, 1, '2025-05-21 17:19:53', '2025-05-21 17:19:53', 0),
(39, 7, 'Áo nỉ họa tiết thêu logo ngực Read and Grow FWTW008', '450000', 450000, 'assets/photos/ni4.png', '', '<p>????TH&Ocirc;NG TIN SẢN PHẨM:</p>\r\n\r\n<p>????T&ecirc;n sản phẩm:&nbsp;<strong>&Aacute;o nỉ họa tiết th&ecirc;u logo ngực Read and Grow FWTW008</strong></p>\r\n\r\n<p>????Chất liệu: Nỉ</p>\r\n\r\n<p>????Phom d&aacute;ng: Regular</p>\r\n\r\n<p>????Size: S, M, L, XL</p>\r\n\r\n<p>????Xuất xứ: Việt Nam</p>\r\n\r\n<p><img src=\"https://file.hstatic.net/200000690725/file/465145016_960363242803924_4787827409404814398_n_grande.jpg\" /></p>\r\n\r\n<p>????T&iacute;nh năng nổi bật:</p>\r\n\r\n<p>- Chất liệu nỉ d&agrave;y vừa phải, vải được dệt từ những sợi b&ocirc;ng nhập khẩu cao cấp lu&ocirc;n tạo cho người d&ugrave;ng cảm gi&aacute;c v&ocirc; c&ugrave;ng mềm mại, thoải m&aacute;i, &aacute;o c&oacute; độ co gi&atilde;n tuyệt đối. Đặc biệt l&agrave; giữ ấm tốt</p>\r\n\r\n<p>- Cổ &aacute;o c&aacute;ch điệu theo d&aacute;ng cổ tr&ograve;n độc đ&aacute;o</p>\r\n\r\n<p>- Chất lượng tốt, gi&aacute; cả hợp l&yacute;</p>\r\n\r\n<p>- Kh&ocirc;ng x&ugrave;, kh&ocirc;ng phai m&agrave;u, kh&ocirc;ng bai</p>\r\n\r\n<p>- &Aacute;o nỉ thiết kế phối bo tay v&agrave; gấu &aacute;o đơn giản, tinh tế mang đến phong c&aacute;ch trẻ trung, thanh lich</p>\r\n\r\n<p><img src=\"https://file.hstatic.net/200000690725/file/fwtw008-4_54102315110_o_grande.jpg\" /></p>\r\n\r\n<p><img src=\"https://file.hstatic.net/200000690725/file/fwtw008-9_54100998007_o_grande.jpg\" /></p>\r\n\r\n<p><img src=\"https://file.hstatic.net/200000690725/file/fwtw008-5_54102113968_o_grande.jpg\" /></p>\r\n\r\n<p><img src=\"https://file.hstatic.net/200000690725/file/size_ao_dai_tay_grande.jpg\" /></p>\r\n\r\n<p>???? HƯỚNG DẪN SỬ DỤNG<br />\r\n▪️ Giặt m&aacute;y chế độ nhẹ ở điều kiện thường<br />\r\n▪️ L&agrave; ủi kh&ocirc;ng qu&aacute; 110 độ C<br />\r\n▪️ Kh&ocirc;ng ng&acirc;m l&acirc;u với bột giặt c&aacute;c sản phẩm c&oacute; t&iacute;nh tẩy rửa<br />\r\n▪️ Kh&ocirc;ng giặt chung với vật sắc nhọn</p>\r\n\r\n<p><br />\r\n???? CH&Iacute;NH S&Aacute;CH ĐỔI:<br />\r\n▪️ Torano hỗ trợ đổi h&agrave;ng trong trường hợp: sản phẩm nhầm size, nhầm m&agrave;u; sản phẩm c&oacute; lỗi của nh&agrave; sản xuất.<br />\r\n▪️ Sản phẩm đổi phải đạt điều kiện:<br />\r\n- C&ograve;n nguy&ecirc;n tem m&aacute;c<br />\r\n- Chưa qua sử dụng, giặt tẩy<br />\r\n- Kh&ocirc;ng c&oacute; vết bẩn, r&aacute;ch<br />\r\n▪️ Thời gian đổi trả: trong v&ograve;ng 30 NG&Agrave;Y kể từ ng&agrave;y kh&aacute;ch nhận h&agrave;ng</p>', 1000, 1, '2025-05-21 17:20:20', '2025-05-21 17:20:20', 0);
INSERT INTO `products` (`id`, `category_id`, `name`, `price`, `discount`, `image`, `brand`, `description`, `quantity`, `active`, `created_at`, `updated_at`, `deleted`) VALUES
(40, 7, 'Áo nỉ họa tiết thêu logo Voyage FWTW010', '450000', 450000, 'assets/photos/ni5.png', '', '<p>????TH&Ocirc;NG TIN SẢN PHẨM:</p>\r\n\r\n<p>????T&ecirc;n sản phẩm:&nbsp;<strong>&Aacute;o nỉ họa tiết th&ecirc;u logo Voyage FWTW010</strong></p>\r\n\r\n<p>????Chất liệu: Nỉ</p>\r\n\r\n<p>????Phom d&aacute;ng: Regular</p>\r\n\r\n<p>????Size: S,&nbsp;M, L, XL</p>\r\n\r\n<p>????Xuất xứ: Việt Nam</p>\r\n\r\n<p><img src=\"https://file.hstatic.net/200000690725/file/465139806_960421336131448_7826178269046403007_n_grande.jpg\" /></p>\r\n\r\n<p>????T&iacute;nh năng nổi bật:</p>\r\n\r\n<p>- Chất liệu nỉ d&agrave;y vừa phải, vải được dệt từ những sợi b&ocirc;ng nhập khẩu cao cấp lu&ocirc;n tạo cho người d&ugrave;ng cảm gi&aacute;c v&ocirc; c&ugrave;ng mềm mại, thoải m&aacute;i, &aacute;o c&oacute; độ co gi&atilde;n tuyệt đối. Đặc biệt l&agrave; giữ ấm tốt</p>\r\n\r\n<p>- Cổ &aacute;o c&aacute;ch điệu theo d&aacute;ng cổ tr&ograve;n độc đ&aacute;o</p>\r\n\r\n<p>- Chất lượng tốt, gi&aacute; cả hợp l&yacute;</p>\r\n\r\n<p>- Kh&ocirc;ng x&ugrave;, kh&ocirc;ng phai m&agrave;u, kh&ocirc;ng bai</p>\r\n\r\n<p>- &Aacute;o nỉ thiết kế phối bo tay v&agrave; gấu &aacute;o đơn giản, tinh tế mang đến phong c&aacute;ch trẻ trung, thanh lich</p>\r\n\r\n<p><img src=\"https://file.hstatic.net/200000690725/file/fwtw010-9_54102318630_o_grande.jpg\" /></p>\r\n\r\n<p><img src=\"https://file.hstatic.net/200000690725/file/fwtw010-3_54102117743_o_grande.jpg\" /></p>\r\n\r\n<p><img src=\"https://file.hstatic.net/200000690725/file/fwtw010-8_54101860641_o_grande.jpg\" /></p>\r\n\r\n<p><img src=\"https://file.hstatic.net/200000690725/file/size_ao_dai_tay_grande.jpg\" /></p>\r\n\r\n<p>???? HƯỚNG DẪN SỬ DỤNG<br />\r\n▪️ Giặt m&aacute;y chế độ nhẹ ở điều kiện thường<br />\r\n▪️ L&agrave; ủi kh&ocirc;ng qu&aacute; 110 độ C<br />\r\n▪️ Kh&ocirc;ng ng&acirc;m l&acirc;u với bột giặt c&aacute;c sản phẩm c&oacute; t&iacute;nh tẩy rửa<br />\r\n▪️ Kh&ocirc;ng giặt chung với vật sắc nhọn</p>\r\n\r\n<p><br />\r\n???? CH&Iacute;NH S&Aacute;CH ĐỔI:<br />\r\n▪️ Torano hỗ trợ đổi h&agrave;ng trong trường hợp: sản phẩm nhầm size, nhầm m&agrave;u; sản phẩm c&oacute; lỗi của nh&agrave; sản xuất.<br />\r\n▪️ Sản phẩm đổi phải đạt điều kiện:<br />\r\n- C&ograve;n nguy&ecirc;n tem m&aacute;c<br />\r\n- Chưa qua sử dụng, giặt tẩy<br />\r\n- Kh&ocirc;ng c&oacute; vết bẩn, r&aacute;ch<br />\r\n▪️ Thời gian đổi trả: trong v&ograve;ng 30 NG&Agrave;Y kể từ ng&agrave;y kh&aacute;ch nhận h&agrave;ng</p>', 1000, 1, '2025-05-21 17:20:42', '2025-05-21 17:20:42', 0),
(41, 7, 'Áo nỉ can phối màu tay, in logo Horse ngực FWTW005', '450000', 450000, 'assets/photos/ni6.png', '', '<p>????TH&Ocirc;NG TIN SẢN PHẨM:</p>\r\n\r\n<p>????T&ecirc;n sản phẩm:&nbsp;<strong>&Aacute;o nỉ can phối m&agrave;u tay, in logo Horse ngực FWTW005</strong></p>\r\n\r\n<p>????Chất liệu: Nỉ</p>\r\n\r\n<p>????Phom d&aacute;ng: Regular</p>\r\n\r\n<p>????Size: S, M, L, XL</p>\r\n\r\n<p>????Xuất xứ: Việt Nam</p>\r\n\r\n<p><img src=\"https://file.hstatic.net/200000690725/file/fwtw005-8_54101861796_o_grande.jpg\" /></p>\r\n\r\n<p>????T&iacute;nh năng nổi bật:</p>\r\n\r\n<p>- Chất liệu nỉ d&agrave;y vừa phải, vải được dệt từ những sợi b&ocirc;ng nhập khẩu cao cấp lu&ocirc;n tạo cho người d&ugrave;ng cảm gi&aacute;c v&ocirc; c&ugrave;ng mềm mại, thoải m&aacute;i, &aacute;o c&oacute; độ co gi&atilde;n tuyệt đối. Đặc biệt l&agrave; giữ ấm tốt</p>\r\n\r\n<p>- Cổ &aacute;o c&aacute;ch điệu theo d&aacute;ng cổ tr&ograve;n độc đ&aacute;o</p>\r\n\r\n<p>- Chất lượng tốt, gi&aacute; cả hợp l&yacute;</p>\r\n\r\n<p>- Kh&ocirc;ng x&ugrave;, kh&ocirc;ng phai m&agrave;u, kh&ocirc;ng bai</p>\r\n\r\n<p>- &Aacute;o nỉ thiết kế phối bo tay v&agrave; gấu &aacute;o đơn giản, tinh tế mang đến phong c&aacute;ch trẻ trung, thanh lich</p>\r\n\r\n<p><img src=\"https://file.hstatic.net/200000690725/file/fwtw005-6_54101002922_o_grande.jpg\" /></p>\r\n\r\n<p><img src=\"https://file.hstatic.net/200000690725/file/fwtw005-3_54102319965_o_grande.jpg\" /></p>\r\n\r\n<p><img src=\"https://file.hstatic.net/200000690725/file/size_ao_dai_tay_grande.jpg\" /></p>\r\n\r\n<p>???? HƯỚNG DẪN SỬ DỤNG<br />\r\n▪️ Giặt m&aacute;y chế độ nhẹ ở điều kiện thường<br />\r\n▪️ L&agrave; ủi kh&ocirc;ng qu&aacute; 110 độ C<br />\r\n▪️ Kh&ocirc;ng ng&acirc;m l&acirc;u với bột giặt c&aacute;c sản phẩm c&oacute; t&iacute;nh tẩy rửa<br />\r\n▪️ Kh&ocirc;ng giặt chung với vật sắc nhọn</p>\r\n\r\n<p><br />\r\n???? CH&Iacute;NH S&Aacute;CH ĐỔI:<br />\r\n▪️ Torano hỗ trợ đổi h&agrave;ng trong trường hợp: sản phẩm nhầm size, nhầm m&agrave;u; sản phẩm c&oacute; lỗi của nh&agrave; sản xuất.<br />\r\n▪️ Sản phẩm đổi phải đạt điều kiện:<br />\r\n- C&ograve;n nguy&ecirc;n tem m&aacute;c<br />\r\n- Chưa qua sử dụng, giặt tẩy<br />\r\n- Kh&ocirc;ng c&oacute; vết bẩn, r&aacute;ch<br />\r\n▪️ Thời gian đổi trả: trong v&ograve;ng 30 NG&Agrave;Y kể từ ng&agrave;y kh&aacute;ch nhận h&agrave;ng</p>', 1000, 1, '2025-05-21 17:21:07', '2025-05-21 17:21:07', 0),
(42, 7, 'Áo nỉ trơn vải hiệu ứng FWTW006', '420000', 420000, 'assets/photos/ni7.png', '', '<p>????TH&Ocirc;NG TIN SẢN PHẨM:</p>\r\n\r\n<p>????T&ecirc;n sản phẩm:&nbsp;<strong>&Aacute;o nỉ trơn vải hiệu ứng FWTW006</strong></p>\r\n\r\n<p>????Chất liệu: Nỉ</p>\r\n\r\n<p>????Phom d&aacute;ng: Regular</p>\r\n\r\n<p>????Size: S, M, L, XL</p>\r\n\r\n<p>????Xuất xứ: Việt Nam</p>\r\n\r\n<p><img src=\"https://file.hstatic.net/200000690725/file/466068534_966198772220371_3393043288364991042_n_grande.jpg\" /></p>\r\n\r\n<p>????T&iacute;nh năng nổi bật:</p>\r\n\r\n<p>- Chất liệu nỉ d&agrave;y vừa phải, vải được dệt từ những sợi b&ocirc;ng nhập khẩu cao cấp lu&ocirc;n tạo cho người d&ugrave;ng cảm gi&aacute;c v&ocirc; c&ugrave;ng mềm mại, thoải m&aacute;i, &aacute;o c&oacute; độ co gi&atilde;n tuyệt đối. Đặc biệt l&agrave; giữ ấm tốt</p>\r\n\r\n<p>- Cổ &aacute;o c&aacute;ch điệu theo d&aacute;ng cổ tr&ograve;n độc đ&aacute;o</p>\r\n\r\n<p>- Chất lượng tốt, gi&aacute; cả hợp l&yacute;</p>\r\n\r\n<p>- Kh&ocirc;ng x&ugrave;, kh&ocirc;ng phai m&agrave;u, kh&ocirc;ng bai</p>\r\n\r\n<p>- &Aacute;o nỉ thiết kế phối bo tay v&agrave; gấu &aacute;o đơn giản, tinh tế mang đến phong c&aacute;ch trẻ trung, thanh lich</p>\r\n\r\n<p><img src=\"https://file.hstatic.net/200000690725/file/fwtw006-10_54039219969_o_grande.jpg\" /></p>\r\n\r\n<p><img src=\"https://file.hstatic.net/200000690725/file/fwtw006-5_54038026042_o_grande.jpg\" /></p>\r\n\r\n<p><img src=\"https://file.hstatic.net/200000690725/file/fwtw006-11_54038026017_o_grande.jpg\" /></p>\r\n\r\n<p><img src=\"https://file.hstatic.net/200000690725/file/size_ao_dai_tay_grande.jpg\" /></p>\r\n\r\n<p>???? HƯỚNG DẪN SỬ DỤNG<br />\r\n▪️ Giặt m&aacute;y chế độ nhẹ ở điều kiện thường<br />\r\n▪️ L&agrave; ủi kh&ocirc;ng qu&aacute; 110 độ C<br />\r\n▪️ Kh&ocirc;ng ng&acirc;m l&acirc;u với bột giặt c&aacute;c sản phẩm c&oacute; t&iacute;nh tẩy rửa<br />\r\n▪️ Kh&ocirc;ng giặt chung với vật sắc nhọn</p>\r\n\r\n<p><br />\r\n???? CH&Iacute;NH S&Aacute;CH ĐỔI:<br />\r\n▪️ Torano hỗ trợ đổi h&agrave;ng trong trường hợp: sản phẩm nhầm size, nhầm m&agrave;u; sản phẩm c&oacute; lỗi của nh&agrave; sản xuất.<br />\r\n▪️ Sản phẩm đổi phải đạt điều kiện:<br />\r\n- C&ograve;n nguy&ecirc;n tem m&aacute;c<br />\r\n- Chưa qua sử dụng, giặt tẩy<br />\r\n- Kh&ocirc;ng c&oacute; vết bẩn, r&aacute;ch<br />\r\n▪️ Thời gian đổi trả: trong v&ograve;ng 30 NG&Agrave;Y kể từ ng&agrave;y kh&aacute;ch nhận h&agrave;ng</p>', 1000, 1, '2025-05-21 17:21:40', '2025-05-21 17:21:40', 0),
(43, 7, 'Áo nỉ bộ can phối tay FWTW001', '420000', 319000, 'assets/photos/ni8.jpg', '', '<p>????TH&Ocirc;NG TIN SẢN PHẨM:</p>\r\n\r\n<p>????T&ecirc;n sản phẩm:&nbsp;<strong>&Aacute;o nỉ nam d&agrave;i tay thương hiệu&nbsp;Torano, can phối tay. Chất nỉ đẹp kh&ocirc;ng bai x&ugrave; FWTW001 - FWBS001</strong></p>\r\n\r\n<p>????Chất liệu: Nỉ</p>\r\n\r\n<p>????Phom d&aacute;ng: Slimfit hơi &ocirc;m</p>\r\n\r\n<p>????Size: S, M, L, XL</p>\r\n\r\n<p>????Xuất xứ: Việt Nam</p>\r\n\r\n<p><img src=\"https://file.hstatic.net/200000690725/file/fwtw001-fsbs001-gr_53997458992_o_grande.jpg\" /></p>\r\n\r\n<p><img src=\"https://file.hstatic.net/200000690725/file/fwtw001-fsbs001-gr_53998782090_o_grande.jpg\" /></p>\r\n\r\n<p>????T&iacute;nh năng nổi bật:</p>\r\n\r\n<p>- Chất liệu nỉ d&agrave;y vừa phải, vải được dệt từ những sợi b&ocirc;ng nhập khẩu cao cấp lu&ocirc;n tạo cho người d&ugrave;ng cảm gi&aacute;c v&ocirc; c&ugrave;ng mềm mại, thoải m&aacute;i, &aacute;o c&oacute; độ co gi&atilde;n tuyệt đối. Đặc biệt l&agrave; giữ ấm tốt</p>\r\n\r\n<p>- M&agrave;u sắc đa dạng, trẻ trung</p>\r\n\r\n<p>- Cổ &aacute;o c&aacute;ch điệu theo d&aacute;ng cổ tr&ograve;n độc đ&aacute;o</p>\r\n\r\n<p>- Chất lượng tốt, gi&aacute; cả hợp l&yacute;</p>\r\n\r\n<p>- Kh&ocirc;ng x&ugrave;, kh&ocirc;ng phai m&agrave;u, kh&ocirc;ng bai</p>\r\n\r\n<p>- &Aacute;o nỉ thiết kế phối bo tay v&agrave; gấu &aacute;o đơn giản, tinh tế mang đến phong c&aacute;ch trẻ trung, thanh lich</p>\r\n\r\n<p><img src=\"https://file.hstatic.net/200000690725/file/fwtw001-fsbs001-gr_53998589753_o_grande.jpg\" /></p>\r\n\r\n<p><img src=\"https://file.hstatic.net/200000690725/file/fwtw001-fsbs001-gr_53998351136_o_grande.jpg\" /></p>\r\n\r\n<p><img src=\"https://file.hstatic.net/200000690725/file/size_ao_dai_tay_grande.jpg\" /></p>\r\n\r\n<p>???? HƯỚNG DẪN SỬ DỤNG<br />\r\n▪️ Giặt m&aacute;y chế độ nhẹ ở điều kiện thường<br />\r\n▪️ L&agrave; ủi kh&ocirc;ng qu&aacute; 110 độ C<br />\r\n▪️ Kh&ocirc;ng ng&acirc;m l&acirc;u với bột giặt c&aacute;c sản phẩm c&oacute; t&iacute;nh tẩy rửa<br />\r\n▪️ Khi giặt n&ecirc;n lộn mặt tr&aacute;i ra để đảm bảo độ bền của lớp kh&aacute;ng nước Hyper Tex<br />\r\n▪️ Kh&ocirc;ng giặt chung với vật sắc nhọn<br />\r\n*Lưu &yacute; nhỏ: &Aacute;o gi&oacute; l&agrave; sản phẩm th&ocirc;ng dụng, mức&nbsp;độ sử dụng cao. Chăm s&oacute;c theo hướng dẫn l&agrave; c&aacute;ch gia tăng tuổi thọ sản phẩm tốt nhất.</p>\r\n\r\n<p><br />\r\n???? CH&Iacute;NH S&Aacute;CH ĐỔI:<br />\r\n▪️ Torano hỗ trợ đổi h&agrave;ng trong trường hợp: sản phẩm nhầm size, nhầm m&agrave;u; sản phẩm c&oacute; lỗi của nh&agrave; sản xuất.<br />\r\n▪️ Sản phẩm đổi phải đạt điều kiện:<br />\r\n- C&ograve;n nguy&ecirc;n tem m&aacute;c<br />\r\n- Chưa qua sử dụng, giặt tẩy<br />\r\n- Kh&ocirc;ng c&oacute; vết bẩn, r&aacute;ch<br />\r\n▪️ Thời gian đổi trả: trong v&ograve;ng 30 NG&Agrave;Y kể từ ng&agrave;y kh&aacute;ch nhận h&agrave;ng</p>', 1000, 1, '2025-05-21 17:22:15', '2025-05-21 17:22:15', 0),
(44, 7, 'Áo nỉ bộ trơn basic FWTW024', '420000', 299000, 'assets/photos/ni9.jpg', '', '<p>????TH&Ocirc;NG TIN SẢN PHẨM:</p>\r\n\r\n<p>????T&ecirc;n sản phẩm: &Aacute;o Nỉ Nam D&agrave;i Tay Thương Hiệu Torano,&nbsp;Chất Nỉ Đẹp Kh&ocirc;ng Bai X&ugrave; FWTW024&nbsp;- FWBS024</p>\r\n\r\n<p>????Chất liệu: Nỉ</p>\r\n\r\n<p>????Phom d&aacute;ng: Slimfit hơi &ocirc;m</p>\r\n\r\n<p>????Size: S, M, L, XL</p>\r\n\r\n<p>????Xuất xứ: Việt Nam</p>\r\n\r\n<p><img src=\"https://file.hstatic.net/200000690725/file/img_3208_53969221507_o_grande.jpg\" /></p>\r\n\r\n<p><img src=\"https://file.hstatic.net/200000690725/file/img_3216_53970441654_o_grande.jpg\" /></p>\r\n\r\n<p>????T&iacute;nh năng nổi bật:</p>\r\n\r\n<p>- Chất liệu nỉ d&agrave;y vừa phải, vải được dệt từ những sợi b&ocirc;ng nhập khẩu cao cấp lu&ocirc;n tạo cho người d&ugrave;ng cảm gi&aacute;c v&ocirc; c&ugrave;ng mềm mại, thoải m&aacute;i, &aacute;o c&oacute; độ co gi&atilde;n tuyệt đối. Đặc biệt l&agrave; giữ ấm tốt</p>\r\n\r\n<p>- M&agrave;u sắc đa dạng, trẻ trung</p>\r\n\r\n<p>- Cổ &aacute;o c&aacute;ch điệu theo d&aacute;ng cổ tr&ograve;n độc đ&aacute;o</p>\r\n\r\n<p>- Chất lượng tốt, gi&aacute; cả hợp l&yacute;</p>\r\n\r\n<p>- Kh&ocirc;ng x&ugrave;, kh&ocirc;ng phai m&agrave;u, kh&ocirc;ng bai</p>\r\n\r\n<p>- &Aacute;o nỉ thiết kế phối bo tay v&agrave; gấu &aacute;o đơn giản, tinh tế mang đến phong c&aacute;ch trẻ trung, thanh lich</p>\r\n\r\n<p><img src=\"https://file.hstatic.net/200000690725/file/img_3267_53970556835_o_grande.jpg\" /></p>\r\n\r\n<p><img src=\"https://file.hstatic.net/200000690725/file/img_3317_53970111841_o_grande.jpg\" /></p>\r\n\r\n<p><img src=\"https://file.hstatic.net/200000690725/file/size_ao_dai_tay_grande.jpg\" /></p>\r\n\r\n<p>???? HƯỚNG DẪN SỬ DỤNG<br />\r\n▪️ Giặt m&aacute;y chế độ nhẹ ở điều kiện thường<br />\r\n▪️ L&agrave; ủi kh&ocirc;ng qu&aacute; 110 độ C<br />\r\n▪️ Kh&ocirc;ng ng&acirc;m l&acirc;u với bột giặt c&aacute;c sản phẩm c&oacute; t&iacute;nh tẩy rửa<br />\r\n▪️ Khi giặt n&ecirc;n lộn mặt tr&aacute;i ra để đảm bảo độ bền của lớp kh&aacute;ng nước Hyper Tex<br />\r\n▪️ Kh&ocirc;ng giặt chung với vật sắc nhọn<br />\r\n*Lưu &yacute; nhỏ: &Aacute;o gi&oacute; l&agrave; sản phẩm th&ocirc;ng dụng, mức&nbsp;độ sử dụng cao. Chăm s&oacute;c theo hướng dẫn l&agrave; c&aacute;ch gia tăng tuổi thọ sản phẩm tốt nhất.</p>\r\n\r\n<p><br />\r\n???? CH&Iacute;NH S&Aacute;CH ĐỔI:<br />\r\n▪️ Torano hỗ trợ đổi h&agrave;ng trong trường hợp: sản phẩm nhầm size, nhầm m&agrave;u; sản phẩm c&oacute; lỗi của nh&agrave; sản xuất.<br />\r\n▪️ Sản phẩm đổi phải đạt điều kiện:<br />\r\n- C&ograve;n nguy&ecirc;n tem m&aacute;c<br />\r\n- Chưa qua sử dụng, giặt tẩy<br />\r\n- Kh&ocirc;ng c&oacute; vết bẩn, r&aacute;ch<br />\r\n▪️ Thời gian đổi trả: trong v&ograve;ng 30 NG&Agrave;Y kể từ ng&agrave;y kh&aacute;ch nhận h&agrave;ng.</p>', 1000, 1, '2025-05-21 17:22:46', '2025-05-21 17:22:46', 0),
(45, 8, 'Quần short gió cạp lót chun GSBW005', '380000', 380000, 'assets/photos/quanshort1.png', '', '<p><strong>Quần short gi&oacute; cạp l&oacute;t chun GSBW005</strong>&nbsp;HOT HIT cả về chất lượng lẫn thiết kế. Đ&acirc;y l&agrave; một trong những mẫu short nam được ưa chuộng nhất hiện nay.&nbsp;<strong>TORANO&nbsp;</strong>lu&ocirc;n mong muốn mang đến sản phẩm tốt nhất tới kh&aacute;ch h&agrave;ng.</p>\r\n\r\n<p><img src=\"https://file.hstatic.net/200000690725/file/487936255_1071766621663585_2642592546184660492_n_grande.jpg\" /></p>\r\n\r\n<p>????TH&Ocirc;NG TIN SẢN PHẨM:</p>\r\n\r\n<p>????T&ecirc;n sản phẩm: Quần short gi&oacute; cạp l&oacute;t chun GSBW005</p>\r\n\r\n<p>????Chất liệu: Gi&oacute;</p>\r\n\r\n<p>????M&agrave;u sắc: X&aacute;m nhạt, Dark Navy, Đen</p>\r\n\r\n<p>????Phom d&aacute;ng: Slimfit hơi &ocirc;m</p>\r\n\r\n<p>????Size: S-M-L-XL</p>\r\n\r\n<p>????Xuất xứ: Việt Nam</p>\r\n\r\n<p>????T&iacute;nh năng nổi bật:</p>\r\n\r\n<p>- Quần short nam TORANO được may từ chất liệu vải cao cấp, thấm h&uacute;t mồ h&ocirc;i cực tốt v&agrave; co gi&atilde;n vừa phải, kh&ocirc;ng bai kh&ocirc;ng x&ugrave; sau một thời gian d&agrave;i sử dụng.</p>\r\n\r\n<p><img src=\"https://file.hstatic.net/200000690725/file/488259182_1071767064996874_417258471381866177_n_grande.jpg\" /></p>\r\n\r\n<p><img src=\"https://file.hstatic.net/200000690725/file/487331127_1071768851663362_7462900806068965898_n_grande.jpg\" /></p>\r\n\r\n<p>????Hướng dẫn sử dụng:</p>\r\n\r\n<p>+ Giặt m&aacute;y với chu kỳ trung b&igrave;nh v&agrave; v&ograve;ng quay ngắn</p>\r\n\r\n<p>+ Giặt với nhiệt độ tối đa 30 độ C</p>\r\n\r\n<p>+ Sấy nhẹ ở nhiệt độ thường</p>\r\n\r\n<p>+ L&agrave; ủi kh&ocirc;ng qu&aacute; 110 độ C</p>\r\n\r\n<p>+ Phơi bằng m&oacute;c dưới b&oacute;ng r&acirc;m</p>\r\n\r\n<p>+ Kh&ocirc;ng sử dụng chất tẩy</p>\r\n\r\n<p>???? Lưu &yacute; nhỏ:</p>\r\n\r\n<p>+ Kh&ocirc;ng giặt chung với đồ dễ xước</p>\r\n\r\n<p>+ Cẩn thận vướng mắc khi phơi</p>\r\n\r\n<p><img src=\"https://file.hstatic.net/200000690725/file/z4341084626055_5d4aed283f7664853511343c6e455e25_8bd8a638280341e5a6a57ae4c5a99849_grande.jpg\" /></p>\r\n\r\n<p>????CH&Iacute;NH S&Aacute;CH ĐỔI:</p>\r\n\r\n<p>&bull; Torano hỗ trợ đổi h&agrave;ng trong trường hợp: sản phẩm&nbsp;mặc kh&ocirc;ng vừa, kh&aacute;ch kh&ocirc;ng ưng sản phẩm&nbsp;đ&atilde; đặt, sản phẩm&nbsp;c&oacute; lỗi của nh&agrave; sản xuất. &nbsp;<br />\r\n&bull; Sản phẩm đổi phải đạt điều kiện: c&ograve;n nguy&ecirc;n tem m&aacute;c, chưa qua sử dụng, kh&ocirc;ng c&oacute; vết bẩn, r&aacute;ch&hellip; &nbsp;<br />\r\n&bull; Thời gian đổi: trong v&ograve;ng 7 NG&Agrave;Y kể từ ng&agrave;y kh&aacute;ch nhận h&agrave;ng. &nbsp;<br />\r\n&bull; LƯU &Yacute;:&nbsp;<br />\r\n- Nếu c&oacute; khiếu nại cần hỗ trợ, qu&yacute; kh&aacute;ch CẦN C&Oacute; VIDEO QUAY LẠI QU&Aacute; TR&Igrave;NH MỞ H&Agrave;NG để đảm bảo vấn đề sẽ được giải quyết 100%</p>', 1000, 1, '2025-05-21 17:25:10', '2025-05-21 17:25:10', 0),
(46, 8, 'Quần short Khaki chiết eo gấu LV FSBK015', '350000', 350000, 'assets/photos/quanshort2.jpg', '', '<p><strong>Quần short Khaki chiết eo gấu LV FSBK015</strong>&nbsp;HOT HIT cả về chất lượng lẫn thiết kế. Đ&acirc;y l&agrave; một trong những mẫu short nam được ưa chuộng nhất hiện nay.&nbsp;<strong>TORANO&nbsp;</strong>lu&ocirc;n mong muốn mang đến sản phẩm tốt nhất tới kh&aacute;ch h&agrave;ng.</p>\r\n\r\n<p><img src=\"https://file.hstatic.net/200000690725/file/482243463_1506044476975689_2565749193337079229_n_grande.jpg\" /></p>\r\n\r\n<p>????TH&Ocirc;NG TIN SẢN PHẨM:</p>\r\n\r\n<p>????T&ecirc;n sản phẩm: Quần short Khaki chiết eo gấu LV FSBK015</p>\r\n\r\n<p>????Chất liệu: Kaki</p>\r\n\r\n<p>????M&agrave;u sắc: Đen, Trắng kem</p>\r\n\r\n<p>????Phom d&aacute;ng: Slimfit hơi &ocirc;m</p>\r\n\r\n<p>????Size: 29-30-31-32-33</p>\r\n\r\n<p>????Xuất xứ: Việt Nam</p>\r\n\r\n<p>????T&iacute;nh năng nổi bật:</p>\r\n\r\n<p>- Quần short nam TORANO được may từ chất liệu vải cao cấp, thấm h&uacute;t mồ h&ocirc;i cực tốt v&agrave; co gi&atilde;n vừa phải, kh&ocirc;ng bai kh&ocirc;ng x&ugrave; sau một thời gian d&agrave;i sử dụng.</p>\r\n\r\n<p><img src=\"https://file.hstatic.net/200000690725/file/482251378_1506044516975685_4182280055608358650_n_grande.jpg\" /></p>\r\n\r\n<p><img src=\"https://file.hstatic.net/200000690725/file/482243039_1506044530309017_6124779680569406449_n_grande.jpg\" /></p>\r\n\r\n<p>????Hướng dẫn sử dụng:</p>\r\n\r\n<p>+ Giặt m&aacute;y với chu kỳ trung b&igrave;nh v&agrave; v&ograve;ng quay ngắn</p>\r\n\r\n<p>+ Giặt với nhiệt độ tối đa 30 độ C</p>\r\n\r\n<p>+ Sấy nhẹ ở nhiệt độ thường</p>\r\n\r\n<p>+ L&agrave; ủi kh&ocirc;ng qu&aacute; 110 độ C</p>\r\n\r\n<p>+ Phơi bằng m&oacute;c dưới b&oacute;ng r&acirc;m</p>\r\n\r\n<p>+ Kh&ocirc;ng sử dụng chất tẩy</p>\r\n\r\n<p>???? Lưu &yacute; nhỏ:</p>\r\n\r\n<p>+ Kh&ocirc;ng giặt chung với đồ dễ xước</p>\r\n\r\n<p>+ Cẩn thận vướng mắc khi phơi</p>\r\n\r\n<p><img src=\"https://file.hstatic.net/200000690725/file/bang-size-kaki_0574be498aac491eaac4ba8209755b6f_grande.jpg\" /></p>\r\n\r\n<p>????CH&Iacute;NH S&Aacute;CH ĐỔI:</p>\r\n\r\n<p>&bull; Torano hỗ trợ đổi h&agrave;ng trong trường hợp: sản phẩm&nbsp;mặc kh&ocirc;ng vừa, kh&aacute;ch kh&ocirc;ng ưng sản phẩm&nbsp;đ&atilde; đặt, sản phẩm&nbsp;c&oacute; lỗi của nh&agrave; sản xuất. &nbsp;<br />\r\n&bull; Sản phẩm đổi phải đạt điều kiện: c&ograve;n nguy&ecirc;n tem m&aacute;c, chưa qua sử dụng, kh&ocirc;ng c&oacute; vết bẩn, r&aacute;ch&hellip; &nbsp;<br />\r\n&bull; Thời gian đổi: trong v&ograve;ng 7 NG&Agrave;Y kể từ ng&agrave;y kh&aacute;ch nhận h&agrave;ng. &nbsp;<br />\r\n&bull; LƯU &Yacute;:&nbsp;<br />\r\n- Nếu c&oacute; khiếu nại cần hỗ trợ, qu&yacute; kh&aacute;ch CẦN C&Oacute; VIDEO QUAY LẠI QU&Aacute; TR&Igrave;NH MỞ H&Agrave;NG để đảm bảo vấn đề sẽ được giải quyết 100%.</p>', 1000, 1, '2025-05-21 17:25:43', '2025-05-21 17:25:43', 0),
(47, 8, 'Short gió basic in phản quang FSBW002', '150000', 150000, 'assets/photos/quanshort3.png', '', '<p><strong>Short gi&oacute; basic in phản quang FSBW002</strong>&nbsp;HOT HIT cả về chất lượng lẫn thiết kế. Đ&acirc;y l&agrave; một trong những mẫu short nam được ưa chuộng nhất hiện nay.&nbsp;<strong>TORANO&nbsp;</strong>lu&ocirc;n mong muốn mang đến sản phẩm tốt nhất tới kh&aacute;ch h&agrave;ng.</p>\r\n\r\n<p><img src=\"https://file.hstatic.net/200000690725/file/53841409252_119e7a7d04_k_grande.jpg\" /></p>\r\n\r\n<p>????TH&Ocirc;NG TIN SẢN PHẨM:</p>\r\n\r\n<p>????T&ecirc;n sản phẩm: Quần short gi&oacute; basic phối chun cạp FSBW001</p>\r\n\r\n<p>????Chất liệu: Gi&oacute;</p>\r\n\r\n<p>????M&agrave;u sắc: Xanh đ&aacute; đậm, X&aacute;m, Dark Navy, Đen</p>\r\n\r\n<p>????Phom d&aacute;ng: Slimfit hơi &ocirc;m</p>\r\n\r\n<p>????Size: S-M-L-XL</p>\r\n\r\n<p>????Xuất xứ: Việt Nam</p>\r\n\r\n<p>????T&iacute;nh năng nổi bật:</p>\r\n\r\n<p>- Quần short nam TORANO được may từ chất liệu vải cao cấp, thấm h&uacute;t mồ h&ocirc;i cực tốt v&agrave; co gi&atilde;n vừa phải, kh&ocirc;ng bai kh&ocirc;ng x&ugrave; sau một thời gian d&agrave;i sử dụng.</p>\r\n\r\n<p>- Thiết kế lưng chun mang đến sự thoải m&aacute;i khi sử dụng</p>\r\n\r\n<p><img src=\"https://file.hstatic.net/200000690725/file/53842302676_b91b657641_k_grande.jpg\" /></p>\r\n\r\n<p><img src=\"https://file.hstatic.net/200000690725/file/53842302611_b64e84da14_k_grande.jpg\" /></p>\r\n\r\n<p>????Hướng dẫn sử dụng:</p>\r\n\r\n<p>+ Giặt m&aacute;y với chu kỳ trung b&igrave;nh v&agrave; v&ograve;ng quay ngắn</p>\r\n\r\n<p>+ Giặt với nhiệt độ tối đa 30 độ C</p>\r\n\r\n<p>+ Sấy nhẹ ở nhiệt độ thường</p>\r\n\r\n<p>+ L&agrave; ủi kh&ocirc;ng qu&aacute; 110 độ C</p>\r\n\r\n<p>+ Phơi bằng m&oacute;c dưới b&oacute;ng r&acirc;m</p>\r\n\r\n<p>+ Kh&ocirc;ng sử dụng chất tẩy</p>\r\n\r\n<p>???? Lưu &yacute; nhỏ:</p>\r\n\r\n<p>+ Kh&ocirc;ng giặt chung với đồ dễ xước</p>\r\n\r\n<p>+ Cẩn thận vướng mắc khi phơi</p>\r\n\r\n<p><img src=\"https://file.hstatic.net/200000690725/file/z4341084626055_5d4aed283f7664853511343c6e455e25_8bd8a638280341e5a6a57ae4c5a99849_grande.jpg\" /></p>\r\n\r\n<p>????CH&Iacute;NH S&Aacute;CH ĐỔI:</p>\r\n\r\n<p>&bull; Torano hỗ trợ đổi h&agrave;ng trong trường hợp: sản phẩm&nbsp;mặc kh&ocirc;ng vừa, kh&aacute;ch kh&ocirc;ng ưng sản phẩm&nbsp;đ&atilde; đặt, sản phẩm&nbsp;c&oacute; lỗi của nh&agrave; sản xuất. &nbsp;<br />\r\n&bull; Sản phẩm đổi phải đạt điều kiện: c&ograve;n nguy&ecirc;n tem m&aacute;c, chưa qua sử dụng, kh&ocirc;ng c&oacute; vết bẩn, r&aacute;ch&hellip; &nbsp;<br />\r\n&bull; Thời gian đổi: trong v&ograve;ng 7 NG&Agrave;Y kể từ ng&agrave;y kh&aacute;ch nhận h&agrave;ng. &nbsp;<br />\r\n&bull; LƯU &Yacute;:&nbsp;<br />\r\n- Nếu c&oacute; khiếu nại cần hỗ trợ, qu&yacute; kh&aacute;ch CẦN C&Oacute; VIDEO QUAY LẠI QU&Aacute; TR&Igrave;NH MỞ H&Agrave;NG để đảm bảo vấn đề sẽ được giải quyết 100%.</p>', 1000, 1, '2025-05-21 17:26:12', '2025-05-21 17:26:12', 0),
(48, 8, 'Quần short nỉ basic FSBS004', '320000', 320000, 'assets/photos/quanshort4.png', '', '<p><strong>Quần short nỉ basic FSBS004&nbsp;</strong>l&agrave; mẫu quần short nam cao cấp mới nhất được sản xuất với c&ocirc;ng nghệ hiện đại nhất hiện nay. Quần short nam TORANO được may từ chất liệu vải cao cấp, thấm h&uacute;t mồ h&ocirc;i cực tốt v&agrave; co gi&atilde;n vừa phải, kh&ocirc;ng bai kh&ocirc;ng x&ugrave; sau một thời gian d&agrave;i sử dụng.</p>\r\n\r\n<p><img src=\"https://file.hstatic.net/200000690725/file/481989032_1051318073708440_4385535179869915424_n_grande.jpg\" /></p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p>????TH&Ocirc;NG TIN SẢN PHẨM:</p>\r\n\r\n<p>????T&ecirc;n sản phẩm: Quần short nỉ basic FSBS004</p>\r\n\r\n<p>????Chất liệu: Nỉ</p>\r\n\r\n<p>????M&agrave;u sắc: Xanh navy, Be nhạt, Đen</p>\r\n\r\n<p>????Phom d&aacute;ng: Slimfit hơi &ocirc;m</p>\r\n\r\n<p>????Size: 29-30-31-32-33</p>\r\n\r\n<p>????Xuất xứ: Việt Nam</p>\r\n\r\n<p>????T&iacute;nh năng nổi bật:</p>\r\n\r\n<p>- Quần short nam TORANO được may từ chất liệu vải cao cấp, thấm h&uacute;t mồ h&ocirc;i cực tốt v&agrave; co gi&atilde;n vừa phải, kh&ocirc;ng bai kh&ocirc;ng x&ugrave; sau một thời gian d&agrave;i sử dụng.</p>\r\n\r\n<p><img src=\"https://file.hstatic.net/200000690725/file/482023751_1052026453637602_2737469466593148416_n_grande.jpg\" /></p>\r\n\r\n<p><img src=\"https://file.hstatic.net/200000690725/file/482114723_1052026466970934_9194007517249081760_n_grande.jpg\" /></p>\r\n\r\n<p>????Hướng dẫn sử dụng:</p>\r\n\r\n<p>+ Giặt m&aacute;y với chu kỳ trung b&igrave;nh v&agrave; v&ograve;ng quay ngắn</p>\r\n\r\n<p>+ Giặt với nhiệt độ tối đa 30 độ C</p>\r\n\r\n<p>+ Sấy nhẹ ở nhiệt độ thường</p>\r\n\r\n<p>+ L&agrave; ủi kh&ocirc;ng qu&aacute; 110 độ C</p>\r\n\r\n<p>+ Phơi bằng m&oacute;c dưới b&oacute;ng r&acirc;m</p>\r\n\r\n<p>+ Kh&ocirc;ng sử dụng chất tẩy</p>\r\n\r\n<p>???? Lưu &yacute; nhỏ:</p>\r\n\r\n<p>+ Kh&ocirc;ng giặt chung với đồ dễ xước</p>\r\n\r\n<p>+ Cẩn thận vướng mắc khi phơi</p>\r\n\r\n<p><img src=\"https://file.hstatic.net/200000690725/file/z5882448484506_281a951ead3ab58c9dd693a430d534e2_grande.jpg\" /></p>\r\n\r\n<p>????CH&Iacute;NH S&Aacute;CH ĐỔI:</p>\r\n\r\n<p>&bull; Torano hỗ trợ đổi h&agrave;ng trong trường hợp: sản phẩm&nbsp;mặc kh&ocirc;ng vừa, kh&aacute;ch kh&ocirc;ng ưng sản phẩm&nbsp;đ&atilde; đặt, sản phẩm&nbsp;c&oacute; lỗi của nh&agrave; sản xuất. &nbsp;<br />\r\n&bull; Sản phẩm đổi phải đạt điều kiện: c&ograve;n nguy&ecirc;n tem m&aacute;c, chưa qua sử dụng, kh&ocirc;ng c&oacute; vết bẩn, r&aacute;ch&hellip; &nbsp;<br />\r\n&bull; Thời gian đổi: trong v&ograve;ng 7 NG&Agrave;Y kể từ ng&agrave;y kh&aacute;ch nhận h&agrave;ng. &nbsp;<br />\r\n&bull; LƯU &Yacute;:&nbsp;<br />\r\n- Nếu c&oacute; khiếu nại cần hỗ trợ, qu&yacute; kh&aacute;ch CẦN C&Oacute; VIDEO QUAY LẠI QU&Aacute; TR&Igrave;NH MỞ H&Agrave;NG để đảm bảo vấn đề sẽ được giải quyết 100%.</p>', 1000, 1, '2025-05-21 17:26:46', '2025-05-21 17:26:46', 0),
(49, 8, 'Quần short đũi basic, có quai nhê FSBI004', '400000', 400000, 'assets/photos/quanshort5.png', '', '<p><strong>Quần short đũi basic, c&oacute; quai nh&ecirc; FSBI004</strong>&nbsp;HOT HIT cả về chất lượng lẫn thiết kế. Đ&acirc;y l&agrave; một trong những mẫu short nam được ưa chuộng nhất hiện nay.&nbsp;<strong>TORANO&nbsp;</strong>lu&ocirc;n mong muốn mang đến sản phẩm tốt nhất tới kh&aacute;ch h&agrave;ng.</p>\r\n\r\n<p><img src=\"https://file.hstatic.net/200000690725/file/481988648_1051319423708305_2892226002660044381_n_grande.jpg\" /></p>\r\n\r\n<p>????TH&Ocirc;NG TIN SẢN PHẨM:</p>\r\n\r\n<p>????T&ecirc;n sản phẩm: Quần short đũi basic, c&oacute; quai nh&ecirc; FSBI004</p>\r\n\r\n<p>????Chất liệu: Đũi</p>\r\n\r\n<p>????M&agrave;u sắc: Be, Đen,&nbsp;Trắng kem</p>\r\n\r\n<p>????Phom d&aacute;ng: Slimfit hơi &ocirc;m</p>\r\n\r\n<p>????Size: 29-30-31-32-33</p>\r\n\r\n<p>????Xuất xứ: Việt Nam</p>\r\n\r\n<p>????T&iacute;nh năng nổi bật:</p>\r\n\r\n<p>- Quần short nam TORANO được may từ chất liệu vải cao cấp, thấm h&uacute;t mồ h&ocirc;i cực tốt v&agrave; co gi&atilde;n vừa phải, kh&ocirc;ng bai kh&ocirc;ng x&ugrave; sau một thời gian d&agrave;i sử dụng.</p>\r\n\r\n<p>- Thiết kế quai nh&ecirc; dễ d&agrave;ng điều chỉnh độ rộng cạp</p>\r\n\r\n<p><img src=\"https://file.hstatic.net/200000690725/file/481503955_1051319447041636_6105472641769147576_n_grande.jpg\" /></p>\r\n\r\n<p><img src=\"https://file.hstatic.net/200000690725/file/481462464_1051319410374973_7288946366188931770_n_grande.jpg\" /></p>\r\n\r\n<p>????Hướng dẫn sử dụng:</p>\r\n\r\n<p>+ Giặt m&aacute;y với chu kỳ trung b&igrave;nh v&agrave; v&ograve;ng quay ngắn</p>\r\n\r\n<p>+ Giặt với nhiệt độ tối đa 30 độ C</p>\r\n\r\n<p>+ Sấy nhẹ ở nhiệt độ thường</p>\r\n\r\n<p>+ L&agrave; ủi kh&ocirc;ng qu&aacute; 110 độ C</p>\r\n\r\n<p>+ Phơi bằng m&oacute;c dưới b&oacute;ng r&acirc;m</p>\r\n\r\n<p>+ Kh&ocirc;ng sử dụng chất tẩy</p>\r\n\r\n<p>???? Lưu &yacute; nhỏ:</p>\r\n\r\n<p>+ Kh&ocirc;ng giặt chung với đồ dễ xước</p>\r\n\r\n<p>+ Cẩn thận vướng mắc khi phơi</p>\r\n\r\n<p><img src=\"https://file.hstatic.net/200000690725/file/size-short_0c6182ae76a1497daae9b91c937da91c_grande.jpg\" /></p>\r\n\r\n<p>????CH&Iacute;NH S&Aacute;CH ĐỔI:</p>\r\n\r\n<p>&bull; Torano hỗ trợ đổi h&agrave;ng trong trường hợp: sản phẩm&nbsp;mặc kh&ocirc;ng vừa, kh&aacute;ch kh&ocirc;ng ưng sản phẩm&nbsp;đ&atilde; đặt, sản phẩm&nbsp;c&oacute; lỗi của nh&agrave; sản xuất. &nbsp;<br />\r\n&bull; Sản phẩm đổi phải đạt điều kiện: c&ograve;n nguy&ecirc;n tem m&aacute;c, chưa qua sử dụng, kh&ocirc;ng c&oacute; vết bẩn, r&aacute;ch&hellip; &nbsp;<br />\r\n&bull; Thời gian đổi: trong v&ograve;ng 7 NG&Agrave;Y kể từ ng&agrave;y kh&aacute;ch nhận h&agrave;ng. &nbsp;<br />\r\n&bull; LƯU &Yacute;:&nbsp;<br />\r\n- Nếu c&oacute; khiếu nại cần hỗ trợ, qu&yacute; kh&aacute;ch CẦN C&Oacute; VIDEO QUAY LẠI QU&Aacute; TR&Igrave;NH MỞ H&Agrave;NG để đảm bảo vấn đề sẽ được giải quyết 100%.</p>', 1000, 1, '2025-05-21 17:27:46', '2025-05-21 17:27:46', 0),
(50, 8, 'Short khaki ngắn basic chiết ly FSBK017', '350000', 350000, 'assets/photos/quanshort6.png', '', '<p><strong>Short khaki ngắn basic chiết ly FSBK017</strong>&nbsp;l&agrave; mẫu quần short nam cao cấp mới nhất được sản xuất với c&ocirc;ng nghệ hiện đại nhất hiện nay. Quần short nam&nbsp;<strong>TORANO&nbsp;</strong>được may từ chất liệu vải cao cấp, &nbsp;thấm h&uacute;t mồ h&ocirc;i cực tốt v&agrave; co gi&atilde;n vừa phải, kh&ocirc;ng bai kh&ocirc;ng x&ugrave; sau một thời gian d&agrave;i sử dụng.&nbsp;</p>\r\n\r\n<p>????TH&Ocirc;NG TIN SẢN PHẨM:</p>\r\n\r\n<p>????T&ecirc;n sản phẩm: Short khaki ngắn basic chiết ly FSBK017</p>\r\n\r\n<p>????Chất liệu: Kaki</p>\r\n\r\n<p>????M&agrave;u sắc: Đen, Trắng kem đậm</p>\r\n\r\n<p>????Phom d&aacute;ng: Slimfit hơi &ocirc;m</p>\r\n\r\n<p>????Size: 29-30-31-32-33</p>\r\n\r\n<p>????Xuất xứ: Việt Nam</p>\r\n\r\n<p>????T&iacute;nh năng nổi bật:</p>\r\n\r\n<p>- Quần short nam TORANO được may từ chất liệu vải cao cấp, thấm h&uacute;t mồ h&ocirc;i cực tốt v&agrave; co gi&atilde;n vừa phải, kh&ocirc;ng bai kh&ocirc;ng x&ugrave; sau một thời gian d&agrave;i sử dụng.</p>\r\n\r\n<p>- Thiết kế lưng chun mang đến sự thoải m&aacute;i khi sử dụng</p>\r\n\r\n<p>????Hướng dẫn sử dụng:</p>\r\n\r\n<p>+ Giặt m&aacute;y với chu kỳ trung b&igrave;nh v&agrave; v&ograve;ng quay ngắn</p>\r\n\r\n<p>+ Giặt với nhiệt độ tối đa 30 độ C</p>\r\n\r\n<p>+ Sấy nhẹ ở nhiệt độ thường</p>\r\n\r\n<p>+ L&agrave; ủi kh&ocirc;ng qu&aacute; 110 độ C</p>\r\n\r\n<p>+ Phơi bằng m&oacute;c dưới b&oacute;ng r&acirc;m</p>\r\n\r\n<p>+ Kh&ocirc;ng sử dụng chất tẩy</p>\r\n\r\n<p>???? Lưu &yacute; nhỏ:</p>\r\n\r\n<p>+ Kh&ocirc;ng giặt chung với đồ dễ xước</p>\r\n\r\n<p>+ Cẩn thận vướng mắc khi phơi</p>\r\n\r\n<p><img src=\"https://file.hstatic.net/200000690725/file/z5882443444574_c0ca5b2b3bbf1055915a4aad9b7f35ed_grande.jpg\" /></p>\r\n\r\n<p>????CH&Iacute;NH S&Aacute;CH ĐỔI:</p>\r\n\r\n<p>&bull; Torano hỗ trợ đổi h&agrave;ng trong trường hợp: sp mặc kh&ocirc;ng vừa, kh&aacute;ch kh&ocirc;ng ưng sp đ&atilde; đặt, sp c&oacute; lỗi của nh&agrave; sản xuất. &nbsp;<br />\r\n&bull; Sản phẩm đổi phải đạt điều kiện: c&ograve;n nguy&ecirc;n tem m&aacute;c, chưa qua sử dụng, kh&ocirc;ng c&oacute; vết bẩn, r&aacute;ch&hellip; &nbsp;<br />\r\n&bull; Thời gian đổi: trong v&ograve;ng 7 NG&Agrave;Y kể từ ng&agrave;y kh&aacute;ch nhận h&agrave;ng. &nbsp;<br />\r\n&bull; LƯU &Yacute;: &nbsp; - Kh&aacute;ch h&agrave;ng KH&Ocirc;NG BẤM NHẬN H&Agrave;NG khi c&oacute; nhu cầu đổi h&agrave;ng.</p>\r\n\r\n<p>- Nếu kh&aacute;ch h&agrave;ng bấm &ldquo;Đ&Atilde; NHẬN H&Agrave;NG&rdquo; kh&aacute;ch h&agrave;ng THANH TO&Aacute;N 2 CHIỀU PH&Iacute; SHIP khi đổi h&agrave;ng. &nbsp; &nbsp;<br />\r\n- Nếu c&oacute; khiếu nại cần hỗ trợ, qu&yacute; kh&aacute;ch CẦN C&Oacute; VIDEO QUAY LẠI QU&Aacute; TR&Igrave;NH MỞ H&Agrave;NG để đảm bảo vấn đề sẽ được giải quyết 100%.</p>', 1000, 1, '2025-05-21 17:28:20', '2025-05-21 17:28:20', 0),
(51, 9, 'Quần Jeans basic slim EABJ012', '500000', 399000, 'assets/photos/jean2.jpeg', '', '<p>????TH&Ocirc;NG TIN SẢN PHẨM:</p>\r\n\r\n<p>????T&ecirc;n sản phẩm:&nbsp;<strong>Quần Jeans basic slim EABJ012</strong></p>\r\n\r\n<p>???? Chất liệu: Jeans d&agrave;y dặn, si&ecirc;u bền, kh&ocirc;ng phai m&agrave;u</p>\r\n\r\n<p>???? M&agrave;u sắc: X&aacute;m nhạt, Đen nhạt, Dark navy, X&aacute;m đậm, Xanh da trời đậm, Xanh da trời, Đen</p>\r\n\r\n<p>???? Phom d&aacute;ng: basic hơi &ocirc;m</p>\r\n\r\n<p>???? Size: 29-30-31-32-33</p>\r\n\r\n<p>???? Xuất xứ: Việt Nam</p>\r\n\r\n<p><img src=\"https://file.hstatic.net/200000690725/file/shopee_bj012_1_ad6c3ab8abbc4cd2acc303a523b8772b_grande.jpg\" /></p>\r\n\r\n<p><img src=\"https://file.hstatic.net/200000690725/file/shopee_bj012_3_759bb9d5d4f14cc9ad5fd4ea2f284f99_grande.jpg\" /></p>\r\n\r\n<p><img src=\"https://file.hstatic.net/200000690725/file/shopee_bj012_4_c9683a8053dd4dcc8c3ae186a108677c_grande.jpg\" /></p>\r\n\r\n<p>????T&iacute;nh năng nổi bật:</p>\r\n\r\n<p>+ Thấm h&uacute;t tốt</p>\r\n\r\n<p>+ Co gi&atilde;n, mềm mại, đ&agrave;n hồi tốt</p>\r\n\r\n<p>+ Bền m&agrave;u, kh&ocirc;ng bai x&ugrave; sau nhiều lần giặt</p>\r\n\r\n<p>+ Phom d&aacute;ng trẻ trung, năng động</p>\r\n\r\n<p>+ T&uacute;i trước s&acirc;u rộng, th&ecirc;m hai t&uacute;i hậu thời trang, tiện lợi để được nhiều đồ như v&iacute;, điện thoại,...</p>\r\n\r\n<p>+ Đường may nổi chắc chắn, tinh tế</p>\r\n\r\n<p><img src=\"https://file.hstatic.net/200000690725/file/phake_b6146f84d8f44f259796e5f9c797f5a9_grande.jpg\" /></p>\r\n\r\n<p><img src=\"https://file.hstatic.net/200000690725/file/shopee_bj012_2_39841860da4c4931b4ebb2b17f41b6b7_grande.jpg\" /></p>\r\n\r\n<p>???? Hướng dẫn bảo quản quần jean:</p>\r\n\r\n<p>+ Sau khi mua về bạn n&ecirc;n ng&acirc;m chiếc quần jean của m&igrave;nh với nước lạnh pha muối đậm, giấm ăn hoặc ph&egrave;n chua &iacute;t nhất 12 tiếng đồng hồ. Sau đ&oacute;, đem xả lại bằng nước sạch. Bạn ch&uacute; &yacute; l&agrave; kh&ocirc;ng sử dụng x&agrave; ph&ograve;ng để giặt quần trong lần đầu ti&ecirc;n.</p>\r\n\r\n<p>+ N&ecirc;n phơi quần jean trong b&oacute;ng r&acirc;m</p>\r\n\r\n<p>+ Giặt bằng nước lạnh</p>\r\n\r\n<p>+ Kh&ocirc;ng ng&acirc;m quần jean qu&aacute; l&acirc;u, chỉ ng&acirc;m 3-5 ph&uacute;t</p>\r\n\r\n<p>+ N&ecirc;n giặt tay để quần bền m&agrave;u l&acirc;u hơn.</p>\r\n\r\n<p>????Hướng dẫn sử dụng:</p>\r\n\r\n<p>+ Giặt m&aacute;y với chu kỳ trung b&igrave;nh v&agrave; v&ograve;ng quay ngắn</p>\r\n\r\n<p>+ Giặt với nhiệt độ tối đa 30 độ C</p>\r\n\r\n<p>+ Sấy nhẹ ở nhiệt độ thường</p>\r\n\r\n<p>+ L&agrave; ủi kh&ocirc;ng qu&aacute; 110 độ C</p>\r\n\r\n<p>+ Phơi bằng m&oacute;c dưới b&oacute;ng r&acirc;m</p>\r\n\r\n<p>+ Kh&ocirc;ng sử dụng chất tẩy</p>\r\n\r\n<p>???? Lưu &yacute; nhỏ:</p>\r\n\r\n<p>+ Kh&ocirc;ng giặt chung với đồ dễ xước</p>\r\n\r\n<p>+ Cẩn thận vướng mắc khi phơi</p>\r\n\r\n<p><img src=\"https://file.hstatic.net/200000690725/file/z4341084465414_77637bd4774bb3737ac75a89d6f910fc_6377124e60f64961b8ff69220360848c_grande.jpg\" /></p>\r\n\r\n<p>????CH&Iacute;NH S&Aacute;CH ĐỔI:</p>\r\n\r\n<p>&bull; Torano hỗ trợ đổi h&agrave;ng trong trường hợp: sản phẩm&nbsp;mặc kh&ocirc;ng vừa, kh&aacute;ch kh&ocirc;ng ưng sản phẩm đ&atilde; đặt, sản phẩm c&oacute; lỗi của nh&agrave; sản xuất. &nbsp;<br />\r\n&bull; Sản phẩm đổi phải đạt điều kiện: c&ograve;n nguy&ecirc;n tem m&aacute;c, chưa qua sử dụng, kh&ocirc;ng c&oacute; vết bẩn, r&aacute;ch&hellip; &nbsp;<br />\r\n&bull; Thời gian đổi: trong v&ograve;ng 7 NG&Agrave;Y kể từ ng&agrave;y kh&aacute;ch nhận h&agrave;ng. &nbsp;<br />\r\n&bull; LƯU &Yacute;: &nbsp;&nbsp; &nbsp;<br />\r\n- Nếu c&oacute; khiếu nại cần hỗ trợ, qu&yacute; kh&aacute;ch CẦN C&Oacute; VIDEO QUAY LẠI QU&Aacute; TR&Igrave;NH MỞ H&Agrave;NG để đảm bảo vấn đề sẽ được giải quyết 100%.</p>', 1000, 1, '2025-05-21 17:30:17', '2025-05-21 17:30:45', 0),
(52, 9, 'Quần jeans basic slim GABJ844', '650000', 650000, 'assets/photos/jean1.png', '', '<p>????TH&Ocirc;NG TIN SẢN PHẨM:</p>\r\n\r\n<p>????T&ecirc;n sản phẩm:&nbsp;<strong>Quần jeans basic slim GABJ844</strong></p>\r\n\r\n<p>???? Chất liệu: Jeans d&agrave;y dặn, si&ecirc;u bền, kh&ocirc;ng phai m&agrave;u</p>\r\n\r\n<p>???? Form d&aacute;ng: basic hơi &ocirc;m</p>\r\n\r\n<p>???? Size: 29-30-31-32-33</p>\r\n\r\n<p>???? Xuất xứ: Việt Nam</p>\r\n\r\n<p><img src=\"https://file.hstatic.net/200000690725/file/gabj844_54481466076_o_grande.jpg\" /></p>\r\n\r\n<p>????T&iacute;nh năng nổi bật:</p>\r\n\r\n<p>+ Thấm h&uacute;t tốt</p>\r\n\r\n<p>+ Co gi&atilde;n, mềm mại, đ&agrave;n hồi tốt</p>\r\n\r\n<p>+ Bền m&agrave;u, kh&ocirc;ng bai x&ugrave; sau nhiều lần giặt</p>\r\n\r\n<p>+ Phom d&aacute;ng trẻ trung, năng động</p>\r\n\r\n<p>+ T&uacute;i trước s&acirc;u rộng, th&ecirc;m hai t&uacute;i hậu thời trang, tiện lợi để được nhiều đồ như v&iacute;, điện thoại,...</p>\r\n\r\n<p>+ Đường may nổi chắc chắn, tinh tế</p>\r\n\r\n<p><img src=\"https://file.hstatic.net/200000690725/file/gabj844_54481830450_o_grande.jpg\" /></p>\r\n\r\n<p><img src=\"https://file.hstatic.net/200000690725/file/495460781_1102503358589911_4780096489034947256_n_grande.jpg\" /></p>\r\n\r\n<p>???? Hướng dẫn bảo quản quần jean:</p>\r\n\r\n<p>+ Sau khi mua về bạn n&ecirc;n ng&acirc;m chiếc quần jean của m&igrave;nh với nước lạnh pha muối đậm, giấm ăn hoặc ph&egrave;n chua &iacute;t nhất 12 tiếng đồng hồ. Sau đ&oacute;, đem xả lại bằng nước sạch. Bạn ch&uacute; &yacute; l&agrave; kh&ocirc;ng sử dụng x&agrave; ph&ograve;ng để giặt quần trong lần đầu ti&ecirc;n.</p>\r\n\r\n<p>+ N&ecirc;n phơi quần jean trong b&oacute;ng r&acirc;m</p>\r\n\r\n<p>+ Giặt bằng nước lạnh</p>\r\n\r\n<p>+ Kh&ocirc;ng ng&acirc;m quần jean qu&aacute; l&acirc;u, chỉ ng&acirc;m 3-5 ph&uacute;t</p>\r\n\r\n<p>+ N&ecirc;n giặt tay để quần bền m&agrave;u l&acirc;u hơn.</p>\r\n\r\n<p>????Hướng dẫn sử dụng:</p>\r\n\r\n<p>+ Giặt m&aacute;y với chu kỳ trung b&igrave;nh v&agrave; v&ograve;ng quay ngắn</p>\r\n\r\n<p>+ Giặt với nhiệt độ tối đa 30 độ C</p>\r\n\r\n<p>+ Sấy nhẹ ở nhiệt độ thường</p>\r\n\r\n<p>+ L&agrave; ủi kh&ocirc;ng qu&aacute; 110 độ C</p>\r\n\r\n<p>+ Phơi bằng m&oacute;c dưới b&oacute;ng r&acirc;m</p>\r\n\r\n<p>+ Kh&ocirc;ng sử dụng chất tẩy</p>\r\n\r\n<p>???? Lưu &yacute; nhỏ:</p>\r\n\r\n<p>+ Kh&ocirc;ng giặt chung với đồ dễ xước</p>\r\n\r\n<p>+ Cẩn thận vướng mắc khi phơi</p>\r\n\r\n<p><img src=\"https://file.hstatic.net/200000690725/file/z4341084465414_77637bd4774bb3737ac75a89d6f910fc_6377124e60f64961b8ff69220360848c_grande.jpg\" /></p>\r\n\r\n<p>????CH&Iacute;NH S&Aacute;CH ĐỔI:</p>\r\n\r\n<p>&bull; Torano hỗ trợ đổi h&agrave;ng trong trường hợp: sản phẩm&nbsp;mặc kh&ocirc;ng vừa, kh&aacute;ch kh&ocirc;ng ưng sản phẩm đ&atilde; đặt, sản phẩm c&oacute; lỗi của nh&agrave; sản xuất. &nbsp;<br />\r\n&bull; Sản phẩm đổi phải đạt điều kiện: c&ograve;n nguy&ecirc;n tem m&aacute;c, chưa qua sử dụng, kh&ocirc;ng c&oacute; vết bẩn, r&aacute;ch&hellip; &nbsp;<br />\r\n&bull; Thời gian đổi: trong v&ograve;ng 7 NG&Agrave;Y kể từ ng&agrave;y kh&aacute;ch nhận h&agrave;ng. &nbsp;<br />\r\n&bull; LƯU &Yacute;: &nbsp;&nbsp; &nbsp;<br />\r\n- Nếu c&oacute; khiếu nại cần hỗ trợ, qu&yacute; kh&aacute;ch CẦN C&Oacute; VIDEO QUAY LẠI QU&Aacute; TR&Igrave;NH MỞ H&Agrave;NG để đảm bảo vấn đề sẽ được giải quyết 100%.</p>', 1000, 1, '2025-05-21 17:32:45', '2025-05-21 17:32:45', 0),
(53, 9, 'Quần jeans basic slim GABJ845', '650000', 650000, 'assets/photos/jean3.png', '', '<p>????TH&Ocirc;NG TIN SẢN PHẨM:</p>\r\n\r\n<p>????T&ecirc;n sản phẩm:&nbsp;<strong>Quần jeans basic slim GABJ845</strong></p>\r\n\r\n<p>???? Chất liệu: Jeans d&agrave;y dặn, si&ecirc;u bền, kh&ocirc;ng phai m&agrave;u</p>\r\n\r\n<p>???? Form d&aacute;ng: basic hơi &ocirc;m</p>\r\n\r\n<p>???? Size: 29-30-31-32-33</p>\r\n\r\n<p>???? Xuất xứ: Việt Nam</p>\r\n\r\n<p><img src=\"https://file.hstatic.net/200000690725/file/gabj845_54481831940_o_grande.jpg\" /></p>\r\n\r\n<p>????T&iacute;nh năng nổi bật:</p>\r\n\r\n<p>+ Thấm h&uacute;t tốt</p>\r\n\r\n<p>+ Co gi&atilde;n, mềm mại, đ&agrave;n hồi tốt</p>\r\n\r\n<p>+ Bền m&agrave;u, kh&ocirc;ng bai x&ugrave; sau nhiều lần giặt</p>\r\n\r\n<p>+ Phom d&aacute;ng trẻ trung, năng động</p>\r\n\r\n<p>+ T&uacute;i trước s&acirc;u rộng, th&ecirc;m hai t&uacute;i hậu thời trang, tiện lợi để được nhiều đồ như v&iacute;, điện thoại,...</p>\r\n\r\n<p>+ Đường may nổi chắc chắn, tinh tế</p>\r\n\r\n<p><img src=\"https://file.hstatic.net/200000690725/file/gabj845_54480624532_o_grande.jpg\" /></p>\r\n\r\n<p><img src=\"https://file.hstatic.net/200000690725/file/gabj845_54480624542_o_grande.jpg\" /></p>\r\n\r\n<p>???? Hướng dẫn bảo quản quần jean:</p>\r\n\r\n<p>+ Sau khi mua về bạn n&ecirc;n ng&acirc;m chiếc quần jean của m&igrave;nh với nước lạnh pha muối đậm, giấm ăn hoặc ph&egrave;n chua &iacute;t nhất 12 tiếng đồng hồ. Sau đ&oacute;, đem xả lại bằng nước sạch. Bạn ch&uacute; &yacute; l&agrave; kh&ocirc;ng sử dụng x&agrave; ph&ograve;ng để giặt quần trong lần đầu ti&ecirc;n.</p>\r\n\r\n<p>+ N&ecirc;n phơi quần jean trong b&oacute;ng r&acirc;m</p>\r\n\r\n<p>+ Giặt bằng nước lạnh</p>\r\n\r\n<p>+ Kh&ocirc;ng ng&acirc;m quần jean qu&aacute; l&acirc;u, chỉ ng&acirc;m 3-5 ph&uacute;t</p>\r\n\r\n<p>+ N&ecirc;n giặt tay để quần bền m&agrave;u l&acirc;u hơn.</p>\r\n\r\n<p>????Hướng dẫn sử dụng:</p>\r\n\r\n<p>+ Giặt m&aacute;y với chu kỳ trung b&igrave;nh v&agrave; v&ograve;ng quay ngắn</p>\r\n\r\n<p>+ Giặt với nhiệt độ tối đa 30 độ C</p>\r\n\r\n<p>+ Sấy nhẹ ở nhiệt độ thường</p>\r\n\r\n<p>+ L&agrave; ủi kh&ocirc;ng qu&aacute; 110 độ C</p>\r\n\r\n<p>+ Phơi bằng m&oacute;c dưới b&oacute;ng r&acirc;m</p>\r\n\r\n<p>+ Kh&ocirc;ng sử dụng chất tẩy</p>\r\n\r\n<p>???? Lưu &yacute; nhỏ:</p>\r\n\r\n<p>+ Kh&ocirc;ng giặt chung với đồ dễ xước</p>\r\n\r\n<p>+ Cẩn thận vướng mắc khi phơi</p>\r\n\r\n<p><img src=\"https://file.hstatic.net/200000690725/file/z4341084465414_77637bd4774bb3737ac75a89d6f910fc_6377124e60f64961b8ff69220360848c_grande.jpg\" /></p>\r\n\r\n<p>????CH&Iacute;NH S&Aacute;CH ĐỔI:</p>\r\n\r\n<p>&bull; Torano hỗ trợ đổi h&agrave;ng trong trường hợp: sản phẩm&nbsp;mặc kh&ocirc;ng vừa, kh&aacute;ch kh&ocirc;ng ưng sản phẩm đ&atilde; đặt, sản phẩm c&oacute; lỗi của nh&agrave; sản xuất. &nbsp;<br />\r\n&bull; Sản phẩm đổi phải đạt điều kiện: c&ograve;n nguy&ecirc;n tem m&aacute;c, chưa qua sử dụng, kh&ocirc;ng c&oacute; vết bẩn, r&aacute;ch&hellip; &nbsp;<br />\r\n&bull; Thời gian đổi: trong v&ograve;ng 7 NG&Agrave;Y kể từ ng&agrave;y kh&aacute;ch nhận h&agrave;ng. &nbsp;<br />\r\n&bull; LƯU &Yacute;: &nbsp;&nbsp; &nbsp;<br />\r\n- Nếu c&oacute; khiếu nại cần hỗ trợ, qu&yacute; kh&aacute;ch CẦN C&Oacute; VIDEO QUAY LẠI QU&Aacute; TR&Igrave;NH MỞ H&Agrave;NG để đảm bảo vấn đề sẽ được giải quyết 100%.</p>', 1000, 1, '2025-05-21 17:33:39', '2025-05-21 17:33:39', 0),
(54, 9, 'Quần jeans rách slim GABJ862', '650000', 650000, 'assets/photos/jean4.png', '', '<p>????TH&Ocirc;NG TIN SẢN PHẨM:</p>\r\n\r\n<p>????T&ecirc;n sản phẩm:&nbsp;<strong>Quần jeans r&aacute;ch slim GABJ862</strong></p>\r\n\r\n<p>???? Chất liệu: Jeans d&agrave;y dặn, si&ecirc;u bền, kh&ocirc;ng phai m&agrave;u</p>\r\n\r\n<p>???? Form d&aacute;ng: basic hơi &ocirc;m</p>\r\n\r\n<p>???? Size: 29-30-31-32-33</p>\r\n\r\n<p>???? Xuất xứ: Việt Nam</p>\r\n\r\n<p><img src=\"https://file.hstatic.net/200000690725/file/thi_t_k__ch_a_c__t_n_f2107f693c5348aabc54a83804b0ec07_grande.png\" /></p>\r\n\r\n<p>????T&iacute;nh năng nổi bật:</p>\r\n\r\n<p>+ Thấm h&uacute;t tốt</p>\r\n\r\n<p>+ Co gi&atilde;n, mềm mại, đ&agrave;n hồi tốt</p>\r\n\r\n<p>+ Bền m&agrave;u, kh&ocirc;ng bai x&ugrave; sau nhiều lần giặt</p>\r\n\r\n<p>+ Phom d&aacute;ng trẻ trung, năng động</p>\r\n\r\n<p>+ T&uacute;i trước s&acirc;u rộng, th&ecirc;m hai t&uacute;i hậu thời trang, tiện lợi để được nhiều đồ như v&iacute;, điện thoại,...</p>\r\n\r\n<p>+ Đường may nổi chắc chắn, tinh tế</p>\r\n\r\n<p><img src=\"https://file.hstatic.net/200000690725/file/495620786_1105400238300223_2271182535179268584_n_grande.jpg\" /></p>\r\n\r\n<p><img src=\"https://file.hstatic.net/200000690725/file/496930730_1105400221633558_1299710394724939166_n_grande.jpg\" /></p>\r\n\r\n<p>???? Hướng dẫn bảo quản quần jean:</p>\r\n\r\n<p>+ Sau khi mua về bạn n&ecirc;n ng&acirc;m chiếc quần jean của m&igrave;nh với nước lạnh pha muối đậm, giấm ăn hoặc ph&egrave;n chua &iacute;t nhất 12 tiếng đồng hồ. Sau đ&oacute;, đem xả lại bằng nước sạch. Bạn ch&uacute; &yacute; l&agrave; kh&ocirc;ng sử dụng x&agrave; ph&ograve;ng để giặt quần trong lần đầu ti&ecirc;n.</p>\r\n\r\n<p>+ N&ecirc;n phơi quần jean trong b&oacute;ng r&acirc;m</p>\r\n\r\n<p>+ Giặt bằng nước lạnh</p>\r\n\r\n<p>+ Kh&ocirc;ng ng&acirc;m quần jean qu&aacute; l&acirc;u, chỉ ng&acirc;m 3-5 ph&uacute;t</p>\r\n\r\n<p>+ N&ecirc;n giặt tay để quần bền m&agrave;u l&acirc;u hơn.</p>\r\n\r\n<p>????Hướng dẫn sử dụng:</p>\r\n\r\n<p>+ Giặt m&aacute;y với chu kỳ trung b&igrave;nh v&agrave; v&ograve;ng quay ngắn</p>\r\n\r\n<p>+ Giặt với nhiệt độ tối đa 30 độ C</p>\r\n\r\n<p>+ Sấy nhẹ ở nhiệt độ thường</p>\r\n\r\n<p>+ L&agrave; ủi kh&ocirc;ng qu&aacute; 110 độ C</p>\r\n\r\n<p>+ Phơi bằng m&oacute;c dưới b&oacute;ng r&acirc;m</p>\r\n\r\n<p>+ Kh&ocirc;ng sử dụng chất tẩy</p>\r\n\r\n<p>???? Lưu &yacute; nhỏ:</p>\r\n\r\n<p>+ Kh&ocirc;ng giặt chung với đồ dễ xước</p>\r\n\r\n<p>+ Cẩn thận vướng mắc khi phơi</p>\r\n\r\n<p><img src=\"https://file.hstatic.net/200000690725/file/z4341084465414_77637bd4774bb3737ac75a89d6f910fc_6377124e60f64961b8ff69220360848c_grande.jpg\" /></p>\r\n\r\n<p>????CH&Iacute;NH S&Aacute;CH ĐỔI:</p>\r\n\r\n<p>&bull; Torano hỗ trợ đổi h&agrave;ng trong trường hợp: sản phẩm&nbsp;mặc kh&ocirc;ng vừa, kh&aacute;ch kh&ocirc;ng ưng sản phẩm đ&atilde; đặt, sản phẩm c&oacute; lỗi của nh&agrave; sản xuất. &nbsp;<br />\r\n&bull; Sản phẩm đổi phải đạt điều kiện: c&ograve;n nguy&ecirc;n tem m&aacute;c, chưa qua sử dụng, kh&ocirc;ng c&oacute; vết bẩn, r&aacute;ch&hellip; &nbsp;<br />\r\n&bull; Thời gian đổi: trong v&ograve;ng 7 NG&Agrave;Y kể từ ng&agrave;y kh&aacute;ch nhận h&agrave;ng. &nbsp;<br />\r\n&bull; LƯU &Yacute;: &nbsp;&nbsp; &nbsp;<br />\r\n- Nếu c&oacute; khiếu nại cần hỗ trợ, qu&yacute; kh&aacute;ch CẦN C&Oacute; VIDEO QUAY LẠI QU&Aacute; TR&Igrave;NH MỞ H&Agrave;NG để đảm bảo vấn đề sẽ được giải quyết 100%.</p>', 1000, 1, '2025-05-21 17:34:14', '2025-05-21 17:34:14', 0),
(55, 10, 'Quần âu side tab FABT008', '500000', 500000, 'assets/photos/au1.png', '', '<p><strong>Quần &acirc;u side tab FABT008&nbsp;</strong>l&agrave; mẫu quần &acirc;u nam cao cấp ch&iacute;nh h&atilde;ng Torano. Chất vải d&agrave;y dặn, mềm mịn v&agrave; kh&ocirc;ng nhăn nh&agrave;u lại cực th&igrave; tho&aacute;ng m&aacute;t.</p>\r\n\r\n<p><img src=\"https://file.hstatic.net/200000690725/file/465868483_966200425553539_8747074232339376129_n_grande.jpg\" /></p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p><img src=\"https://file.hstatic.net/200000690725/file/fabt008-4_53673299868_o_grande.jpg\" /></p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p><img src=\"https://file.hstatic.net/200000690725/file/fabt008-3_53673083396_o_grande.jpg\" /></p>\r\n\r\n<p><img src=\"https://file.hstatic.net/200000690725/file/z5882108777617_9e40b6407b3a5ca0ef792678f20d8291_grande.jpg\" /></p>\r\n\r\n<p>????CH&Iacute;NH S&Aacute;CH ĐỔI:</p>\r\n\r\n<p>&bull; Torano hỗ trợ đổi h&agrave;ng trong trường hợp: sản phẩm&nbsp;mặc kh&ocirc;ng vừa, kh&aacute;ch kh&ocirc;ng ưng sản phẩm&nbsp;đ&atilde; đặt, sản phẩm&nbsp;c&oacute; lỗi của nh&agrave; sản xuất. &nbsp;<br />\r\n&bull; Sản phẩm đổi phải đạt điều kiện: c&ograve;n nguy&ecirc;n tem m&aacute;c, chưa qua sử dụng, kh&ocirc;ng c&oacute; vết bẩn, r&aacute;ch&hellip; &nbsp;<br />\r\n&bull; Thời gian đổi: trong v&ograve;ng 7 NG&Agrave;Y kể từ ng&agrave;y kh&aacute;ch nhận h&agrave;ng. &nbsp;<br />\r\n&bull; LƯU &Yacute;: &nbsp; - Kh&aacute;ch h&agrave;ng KH&Ocirc;NG BẤM NHẬN H&Agrave;NG khi c&oacute; nhu cầu đổi h&agrave;ng.</p>\r\n\r\n<p>- Nếu kh&aacute;ch h&agrave;ng bấm &ldquo;Đ&Atilde; NHẬN H&Agrave;NG&rdquo; kh&aacute;ch h&agrave;ng THANH TO&Aacute;N 2 CHIỀU PH&Iacute; SHIP khi đổi h&agrave;ng. &nbsp; &nbsp;<br />\r\n- Nếu c&oacute; khiếu nại cần hỗ trợ, qu&yacute; kh&aacute;ch CẦN C&Oacute; VIDEO QUAY LẠI QU&Aacute; TR&Igrave;NH MỞ H&Agrave;NG để đảm bảo vấn đề sẽ được giải quyết 100%.</p>', 1000, 1, '2025-05-21 17:35:35', '2025-05-21 17:35:35', 0),
(56, 10, 'Quần âu slim fit cạp lót họa tiết FABT002', '500000', 500000, 'assets/photos/au2.jpg', '', '<p><strong>Quần &acirc;u slim fit cạp l&oacute;t họa tiết FABT002&nbsp;</strong>l&agrave; mẫu quần &acirc;u nam cao cấp ch&iacute;nh h&atilde;ng Torano. Chất vải d&agrave;y dặn, mềm mịn v&agrave; kh&ocirc;ng nhăn nh&agrave;u lại cực th&igrave; tho&aacute;ng m&aacute;t.</p>\r\n\r\n<p><img src=\"https://file.hstatic.net/200000690725/file/53639742033_1b79a88380_c_0d6f672578a74c0883f0a43707efeed8_grande.jpg\" /></p>\r\n\r\n<p><img src=\"https://file.hstatic.net/200000690725/file/53639860719_f44244136b_c_c61488b5446040968a77502e609f8b8e_grande.jpg\" /></p>\r\n\r\n<p><img src=\"https://file.hstatic.net/200000690725/file/53639982590_a4b97f8293_c_47110cbc359849d2bc280709a0737cfe_grande.jpg\" /></p>\r\n\r\n<p><img src=\"https://file.hstatic.net/200000690725/file/53639742483_3d421dd977_c_765e5cc783c8465dbc8d957a3d47874f_grande.jpg\" /></p>\r\n\r\n<p><img src=\"https://file.hstatic.net/200000690725/file/z5882108777617_9e40b6407b3a5ca0ef792678f20d8291_grande.jpg\" /></p>\r\n\r\n<p>????CH&Iacute;NH S&Aacute;CH ĐỔI:</p>\r\n\r\n<p>&bull; Torano hỗ trợ đổi h&agrave;ng trong trường hợp: sản phẩm&nbsp;mặc kh&ocirc;ng vừa, kh&aacute;ch kh&ocirc;ng ưng sản phẩm&nbsp;đ&atilde; đặt, sản phẩm&nbsp;c&oacute; lỗi của nh&agrave; sản xuất. &nbsp;<br />\r\n&bull; Sản phẩm đổi phải đạt điều kiện: c&ograve;n nguy&ecirc;n tem m&aacute;c, chưa qua sử dụng, kh&ocirc;ng c&oacute; vết bẩn, r&aacute;ch&hellip; &nbsp;<br />\r\n&bull; Thời gian đổi: trong v&ograve;ng 7 NG&Agrave;Y kể từ ng&agrave;y kh&aacute;ch nhận h&agrave;ng. &nbsp;<br />\r\n&bull; LƯU &Yacute;: &nbsp; - Kh&aacute;ch h&agrave;ng KH&Ocirc;NG BẤM NHẬN H&Agrave;NG khi c&oacute; nhu cầu đổi h&agrave;ng.</p>\r\n\r\n<p>- Nếu kh&aacute;ch h&agrave;ng bấm &ldquo;Đ&Atilde; NHẬN H&Agrave;NG&rdquo; kh&aacute;ch h&agrave;ng THANH TO&Aacute;N 2 CHIỀU PH&Iacute; SHIP khi đổi h&agrave;ng. &nbsp; &nbsp;<br />\r\n- Nếu c&oacute; khiếu nại cần hỗ trợ, qu&yacute; kh&aacute;ch CẦN C&Oacute; VIDEO QUAY LẠI QU&Aacute; TR&Igrave;NH MỞ H&Agrave;NG để đảm bảo vấn đề sẽ được giải quyết 100%.</p>', 1000, 1, '2025-05-21 17:36:39', '2025-05-21 17:36:39', 0);
INSERT INTO `products` (`id`, `category_id`, `name`, `price`, `discount`, `image`, `brand`, `description`, `quantity`, `active`, `created_at`, `updated_at`, `deleted`) VALUES
(57, 10, 'Quần âu slim fit điều chỉnh cạp trơn EABT016', '500000', 500000, 'assets/photos/au3.png', '', '<p><strong>Quần &acirc;u slim fit điều chỉnh cạp trơn EABT016&nbsp;</strong>l&agrave; mẫu quần &acirc;u nam cao cấp ch&iacute;nh h&atilde;ng Torano. Chất vải d&agrave;y dặn, mềm mịn v&agrave; kh&ocirc;ng nhăn nh&agrave;u lại cực th&igrave; tho&aacute;ng m&aacute;t.</p>\r\n\r\n<p><img src=\"https://file.hstatic.net/200000690725/file/52866342582_759229d9b6_c_b0dc2c9b2dd243febab62e5c2c2204ff_grande.jpg\" /></p>\r\n\r\n<p><img src=\"https://file.hstatic.net/200000690725/file/52867083004_38fc0fd605_w_05070d5dc94b4fd9a00892f3900a6be9_grande.jpg\" /></p>\r\n\r\n<p><img src=\"https://file.hstatic.net/200000690725/file/52866918791_2cb486fe13_c_af96fccf200e4075b923941b4e10fbe6_grande.jpg\" /></p>\r\n\r\n<p><img src=\"https://file.hstatic.net/200000690725/file/52867361188_289f5c306b_c_8a09c0d58b8d443e8e7ac1bf807b2a35_grande.jpg\" /></p>\r\n\r\n<p><img src=\"https://file.hstatic.net/200000690725/file/z4341084595764_9b48247b08e34892d83d34c17fc54821_bb5d24ff2784474ea4ac8bb6aa0cb56a_grande.jpg\" /></p>\r\n\r\n<p>????CH&Iacute;NH S&Aacute;CH ĐỔI:</p>\r\n\r\n<p>&bull; Torano hỗ trợ đổi h&agrave;ng trong trường hợp: sp mặc kh&ocirc;ng vừa, kh&aacute;ch kh&ocirc;ng ưng sp đ&atilde; đặt, sp c&oacute; lỗi của nh&agrave; sản xuất. &nbsp;<br />\r\n&bull; Sản phẩm đổi phải đạt điều kiện: c&ograve;n nguy&ecirc;n tem m&aacute;c, chưa qua sử dụng, kh&ocirc;ng c&oacute; vết bẩn, r&aacute;ch&hellip; &nbsp;<br />\r\n&bull; Thời gian đổi: trong v&ograve;ng 7 NG&Agrave;Y kể từ ng&agrave;y kh&aacute;ch nhận h&agrave;ng. &nbsp;<br />\r\n&bull; LƯU &Yacute;: &nbsp; - Kh&aacute;ch h&agrave;ng KH&Ocirc;NG BẤM NHẬN H&Agrave;NG khi c&oacute; nhu cầu đổi h&agrave;ng.</p>\r\n\r\n<p>- Nếu kh&aacute;ch h&agrave;ng bấm &ldquo;Đ&Atilde; NHẬN H&Agrave;NG&rdquo; kh&aacute;ch h&agrave;ng THANH TO&Aacute;N 2 CHIỀU PH&Iacute; SHIP khi đổi h&agrave;ng. &nbsp; &nbsp;<br />\r\n- Nếu c&oacute; khiếu nại cần hỗ trợ, qu&yacute; kh&aacute;ch CẦN C&Oacute; VIDEO QUAY LẠI QU&Aacute; TR&Igrave;NH MỞ H&Agrave;NG để đảm bảo vấn đề sẽ được giải quyết 100%.</p>', 1000, 1, '2025-05-21 17:37:14', '2025-05-21 17:37:14', 0),
(58, 10, 'Quần âu slim-fit cạp trơn - DABT900', '500000', 399000, 'assets/photos/au4.png', '', '<p><strong>Quần &acirc;u nam slim-fit cạp trơn - DABT900&nbsp;</strong>với form d&aacute;ng slimfit cạp l&oacute;t họa tiết chuẩn chỉnh, kết hợp điểm nhấn tinh tế v&agrave; hack d&aacute;ng một c&aacute;ch tự nhi&ecirc;n. Quần &acirc;u mới nh&agrave; TORANO mang lại một vẻ ngo&agrave;i lịch thiệp, bảnh bao cho những anh ch&agrave;ng c&ocirc;ng sở.</p>\r\n\r\n<p><img src=\"https://file.hstatic.net/200000690725/file/52678218148_f0df198844_c_28009cfea9364b74b9a393b405a2cc0e_grande.jpg\" /></p>\r\n\r\n<p><img src=\"https://file.hstatic.net/200000690725/file/52678008874_3c81efa5aa_c_a88b534f5e584adcb315f0a3d78c72ff_grande.jpg\" /></p>\r\n\r\n<p><img src=\"https://file.hstatic.net/200000690725/file/52678008579_06c9e12dd8_c_3bf498e979f04413bc36ec61a842c38f_grande.jpg\" /></p>\r\n\r\n<p><img src=\"https://file.hstatic.net/200000690725/file/52678218493_502f1cb34a_c_ce520801cd4545938ff07cb80adbc48f_grande.jpg\" /></p>\r\n\r\n<p><img src=\"https://file.hstatic.net/200000690725/file/52678008419_7d922803e1_c_42c10ed123a7490d856795c5c9358f1f_grande.jpg\" /></p>\r\n\r\n<p><img src=\"https://file.hstatic.net/200000690725/file/52678008384_0afcb45374_c_bdb7b78313334780850a27255e61c748_grande.jpg\" /></p>\r\n\r\n<p><img src=\"https://file.hstatic.net/200000690725/file/z5882108777617_9e40b6407b3a5ca0ef792678f20d8291_grande.jpg\" /></p>\r\n\r\n<p>????CH&Iacute;NH S&Aacute;CH ĐỔI:</p>\r\n\r\n<p>&bull; Torano hỗ trợ đổi h&agrave;ng trong trường hợp: sp mặc kh&ocirc;ng vừa, kh&aacute;ch kh&ocirc;ng ưng sp đ&atilde; đặt, sp c&oacute; lỗi của nh&agrave; sản xuất. &nbsp;<br />\r\n&bull; Sản phẩm đổi phải đạt điều kiện: c&ograve;n nguy&ecirc;n tem m&aacute;c, chưa qua sử dụng, kh&ocirc;ng c&oacute; vết bẩn, r&aacute;ch&hellip; &nbsp;<br />\r\n&bull; Thời gian đổi: trong v&ograve;ng 7 NG&Agrave;Y kể từ ng&agrave;y kh&aacute;ch nhận h&agrave;ng. &nbsp;<br />\r\n&bull; LƯU &Yacute;: &nbsp; - Kh&aacute;ch h&agrave;ng KH&Ocirc;NG BẤM NHẬN H&Agrave;NG khi c&oacute; nhu cầu đổi h&agrave;ng.</p>\r\n\r\n<p>- Nếu kh&aacute;ch h&agrave;ng bấm &ldquo;Đ&Atilde; NHẬN H&Agrave;NG&rdquo; kh&aacute;ch h&agrave;ng THANH TO&Aacute;N 2 CHIỀU PH&Iacute; SHIP khi đổi h&agrave;ng. &nbsp; &nbsp;<br />\r\n- Nếu c&oacute; khiếu nại cần hỗ trợ, qu&yacute; kh&aacute;ch CẦN C&Oacute; VIDEO QUAY LẠI QU&Aacute; TR&Igrave;NH MỞ H&Agrave;NG để đảm bảo vấn đề sẽ được giải quyết 100%.</p>', 1000, 1, '2025-05-21 17:38:12', '2025-05-21 17:38:12', 0),
(59, 10, 'Quần âu slim-fit cạp trơn FABT003', '500000', 500000, 'assets/photos/au5.jpg', '', '<p><strong>Quần &acirc;u nam slim-fit cạp trơn - FABT003&nbsp;</strong>với form d&aacute;ng slimfit cạp l&oacute;t họa tiết chuẩn chỉnh, kết hợp điểm nhấn tinh tế v&agrave; hack d&aacute;ng một c&aacute;ch tự nhi&ecirc;n. Quần &acirc;u mới nh&agrave; TORANO mang lại một vẻ ngo&agrave;i lịch thiệp, bảnh bao cho những anh ch&agrave;ng c&ocirc;ng sở.</p>\r\n\r\n<p><img src=\"https://file.hstatic.net/200000690725/file/465062242_961158792724369_8765552248500872546_n_grande.jpg\" /></p>\r\n\r\n<p><img src=\"https://file.hstatic.net/200000690725/file/fabt003-1_54064889297_o_grande.jpg\" /></p>\r\n\r\n<p><img src=\"https://file.hstatic.net/200000690725/file/fabt003-6_54066219325_o_grande.jpg\" /></p>\r\n\r\n<p><img src=\"https://file.hstatic.net/200000690725/file/fabt003-2_54066017143_o_grande.jpg\" /></p>\r\n\r\n<p><img src=\"https://file.hstatic.net/200000690725/file/z5882108777617_9e40b6407b3a5ca0ef792678f20d8291_grande.jpg\" /></p>\r\n\r\n<p>????CH&Iacute;NH S&Aacute;CH ĐỔI:</p>\r\n\r\n<p>&bull; Torano hỗ trợ đổi h&agrave;ng trong trường hợp: sản phẩm&nbsp;mặc kh&ocirc;ng vừa, kh&aacute;ch kh&ocirc;ng ưng sản phẩm đ&atilde; đặt, sản phẩm c&oacute; lỗi của nh&agrave; sản xuất. &nbsp;<br />\r\n&bull; Sản phẩm đổi phải đạt điều kiện: c&ograve;n nguy&ecirc;n tem m&aacute;c, chưa qua sử dụng, kh&ocirc;ng c&oacute; vết bẩn, r&aacute;ch&hellip; &nbsp;<br />\r\n&bull; Thời gian đổi: trong v&ograve;ng 7 NG&Agrave;Y kể từ ng&agrave;y kh&aacute;ch nhận h&agrave;ng. &nbsp;<br />\r\n&bull; LƯU &Yacute;: &nbsp;&nbsp; &nbsp;<br />\r\n- Nếu c&oacute; khiếu nại cần hỗ trợ, qu&yacute; kh&aacute;ch CẦN C&Oacute; VIDEO QUAY LẠI QU&Aacute; TR&Igrave;NH MỞ H&Agrave;NG để đảm bảo vấn đề sẽ được giải quyết 100%.</p>', 1000, 1, '2025-05-21 17:38:44', '2025-05-21 17:38:44', 0),
(60, 10, 'Quần âu slim-fit cạp trơn FABT007', '500000', 500000, 'assets/photos/au6.jpg', '', '<p><strong>Quần &acirc;u nam slim-fit cạp trơn - FABT007&nbsp;</strong>với form d&aacute;ng slimfit cạp l&oacute;t họa tiết chuẩn chỉnh, kết hợp điểm nhấn tinh tế v&agrave; hack d&aacute;ng một c&aacute;ch tự nhi&ecirc;n. Quần &acirc;u mới nh&agrave; TORANO mang lại một vẻ ngo&agrave;i lịch thiệp, bảnh bao cho những anh ch&agrave;ng c&ocirc;ng sở.</p>\r\n\r\n<p><img src=\"https://file.hstatic.net/200000690725/file/485933037_1066547732185474_8013790444617236976_n_grande.jpg\" /></p>\r\n\r\n<p><img src=\"https://file.hstatic.net/200000690725/file/486510081_1066547942185453_5355033514931943119_n_grande.jpg\" /></p>\r\n\r\n<p><img src=\"https://file.hstatic.net/200000690725/file/486334448_1066547905518790_4682602859781764558_n_grande.jpg\" /></p>\r\n\r\n<p><img src=\"https://file.hstatic.net/200000690725/file/z5882108777617_9e40b6407b3a5ca0ef792678f20d8291_grande.jpg\" /></p>\r\n\r\n<p>????CH&Iacute;NH S&Aacute;CH ĐỔI:</p>\r\n\r\n<p>&bull; Torano hỗ trợ đổi h&agrave;ng trong trường hợp: sản phẩm&nbsp;mặc kh&ocirc;ng vừa, kh&aacute;ch kh&ocirc;ng ưng sản phẩm đ&atilde; đặt, sản phẩm c&oacute; lỗi của nh&agrave; sản xuất. &nbsp;<br />\r\n&bull; Sản phẩm đổi phải đạt điều kiện: c&ograve;n nguy&ecirc;n tem m&aacute;c, chưa qua sử dụng, kh&ocirc;ng c&oacute; vết bẩn, r&aacute;ch&hellip; &nbsp;<br />\r\n&bull; Thời gian đổi: trong v&ograve;ng 7 NG&Agrave;Y kể từ ng&agrave;y kh&aacute;ch nhận h&agrave;ng. &nbsp;<br />\r\n&bull; LƯU &Yacute;: &nbsp;&nbsp; &nbsp;<br />\r\n- Nếu c&oacute; khiếu nại cần hỗ trợ, qu&yacute; kh&aacute;ch CẦN C&Oacute; VIDEO QUAY LẠI QU&Aacute; TR&Igrave;NH MỞ H&Agrave;NG để đảm bảo vấn đề sẽ được giải quyết 100%.</p>', 1000, 1, '2025-05-21 17:39:10', '2025-05-21 17:39:10', 0),
(61, 10, 'Quần âu slimfit cạp điều chỉnh, gấu LV FABT005', '500000', 500000, 'assets/photos/au7.png', '', '<p><strong>Quần &acirc;u slimfit cạp điều chỉnh, gấu LV FABT005&nbsp;</strong>l&agrave; mẫu quần &acirc;u nam cao cấp ch&iacute;nh h&atilde;ng Torano. Chất vải d&agrave;y dặn, mềm mịn v&agrave; kh&ocirc;ng nhăn nh&agrave;u lại cực th&igrave; tho&aacute;ng m&aacute;t.</p>\r\n\r\n<p><img src=\"https://file.hstatic.net/200000690725/file/53663660923_0f25dd7e46_h_004060733d604c2797fb01f9e7e354bf_grande.jpg\" /></p>\r\n\r\n<p><img src=\"https://file.hstatic.net/200000690725/file/53663660748_6a45b1f81b_c_b9fbaca7311a4c4cb0bd84feeaa01bd6_grande.jpg\" /></p>\r\n\r\n<p><img src=\"https://file.hstatic.net/200000690725/file/53663660948_a0514e4f7b_c_81015c60a9494a489ac5bb4fdc5886b3_grande.jpg\" /></p>\r\n\r\n<p><img src=\"https://file.hstatic.net/200000690725/file/53663660953_dc92e52f21_c_7fb9775a856b4841bf73e11a699630ee_grande.jpg\" /></p>\r\n\r\n<p><img src=\"https://file.hstatic.net/200000690725/file/53663446166_f4069b508b_c_ef528e0e42574ac4bc01e7c92de46312_grande.jpg\" /></p>\r\n\r\n<p><img src=\"https://file.hstatic.net/200000690725/file/z5882108777617_9e40b6407b3a5ca0ef792678f20d8291_grande.jpg\" /></p>\r\n\r\n<p>????CH&Iacute;NH S&Aacute;CH ĐỔI:</p>\r\n\r\n<p>&bull; Torano hỗ trợ đổi h&agrave;ng trong trường hợp: sp mặc kh&ocirc;ng vừa, kh&aacute;ch kh&ocirc;ng ưng sp đ&atilde; đặt, sp c&oacute; lỗi của nh&agrave; sản xuất. &nbsp;<br />\r\n&bull; Sản phẩm đổi phải đạt điều kiện: c&ograve;n nguy&ecirc;n tem m&aacute;c, chưa qua sử dụng, kh&ocirc;ng c&oacute; vết bẩn, r&aacute;ch&hellip; &nbsp;<br />\r\n&bull; Thời gian đổi: trong v&ograve;ng 7 NG&Agrave;Y kể từ ng&agrave;y kh&aacute;ch nhận h&agrave;ng. &nbsp;<br />\r\n&bull; LƯU &Yacute;: &nbsp; - Kh&aacute;ch h&agrave;ng KH&Ocirc;NG BẤM NHẬN H&Agrave;NG khi c&oacute; nhu cầu đổi h&agrave;ng.</p>\r\n\r\n<p>- Nếu kh&aacute;ch h&agrave;ng bấm &ldquo;Đ&Atilde; NHẬN H&Agrave;NG&rdquo; kh&aacute;ch h&agrave;ng THANH TO&Aacute;N 2 CHIỀU PH&Iacute; SHIP khi đổi h&agrave;ng. &nbsp; &nbsp;<br />\r\n- Nếu c&oacute; khiếu nại cần hỗ trợ, qu&yacute; kh&aacute;ch CẦN C&Oacute; VIDEO QUAY LẠI QU&Aacute; TR&Igrave;NH MỞ H&Agrave;NG để đảm bảo vấn đề sẽ được giải quyết 100%.</p>', 1000, 1, '2025-05-21 17:39:43', '2025-05-21 17:39:43', 0),
(62, 10, 'Quần âu slimfit trơn cạp điều chỉnh FABT016', '500000', 500000, 'assets/photos/au8.png', '', '<p><strong>Quần &acirc;u slimfit trơn cạp điều chỉnh FABT016&nbsp;</strong>l&agrave; mẫu quần &acirc;u nam cao cấp ch&iacute;nh h&atilde;ng Torano. Chất vải d&agrave;y dặn, mềm mịn v&agrave; kh&ocirc;ng nhăn nh&agrave;u lại cực th&igrave; tho&aacute;ng m&aacute;t.</p>\r\n\r\n<p><img src=\"https://file.hstatic.net/200000690725/file/486629360_1067254732114774_6617143606659075275_n_grande.jpg\" /></p>\r\n\r\n<p><img src=\"https://file.hstatic.net/200000690725/file/486678357_1067252852114962_7766061979572337955_n_grande.jpg\" /></p>\r\n\r\n<p><img src=\"https://file.hstatic.net/200000690725/file/486382035_1067252608781653_6319166306351579850_n_grande.jpg\" /></p>\r\n\r\n<p><img src=\"https://file.hstatic.net/200000690725/file/z5882108777617_9e40b6407b3a5ca0ef792678f20d8291_grande.jpg\" /></p>\r\n\r\n<p>????CH&Iacute;NH S&Aacute;CH ĐỔI:</p>\r\n\r\n<p>&bull; Torano hỗ trợ đổi h&agrave;ng trong trường hợp: sản phẩm&nbsp;mặc kh&ocirc;ng vừa, kh&aacute;ch kh&ocirc;ng ưng sản phẩm&nbsp;đ&atilde; đặt, sản phẩm&nbsp;c&oacute; lỗi của nh&agrave; sản xuất. &nbsp;<br />\r\n&bull; Sản phẩm đổi phải đạt điều kiện: c&ograve;n nguy&ecirc;n tem m&aacute;c, chưa qua sử dụng, kh&ocirc;ng c&oacute; vết bẩn, r&aacute;ch&hellip; &nbsp;<br />\r\n&bull; Thời gian đổi: trong v&ograve;ng 7 NG&Agrave;Y kể từ ng&agrave;y kh&aacute;ch nhận h&agrave;ng. &nbsp;<br />\r\n&bull; LƯU &Yacute;:&nbsp;<br />\r\n- Nếu c&oacute; khiếu nại cần hỗ trợ, qu&yacute; kh&aacute;ch CẦN C&Oacute; VIDEO QUAY LẠI QU&Aacute; TR&Igrave;NH MỞ H&Agrave;NG để đảm bảo vấn đề sẽ được giải quyết 100%.</p>', 1000, 1, '2025-05-21 17:40:13', '2025-05-21 17:40:13', 0),
(63, 10, 'Quần âu vải kẻ dọc cạp tender FABT011', '550000', 450000, 'assets/photos/au9.jpg', '', '<p><strong>Quần &acirc;u vải kẻ dọc cạp tender FABT011&nbsp;</strong>l&agrave; mẫu quần &acirc;u nam cao cấp ch&iacute;nh h&atilde;ng Torano. Chất vải d&agrave;y dặn, mềm mịn v&agrave; kh&ocirc;ng nhăn nh&agrave;u lại cực th&igrave; tho&aacute;ng m&aacute;t.</p>\r\n\r\n<p><img src=\"https://file.hstatic.net/200000690725/file/464388572_955313683308880_4298684578339661548_n_grande.jpg\" /></p>\r\n\r\n<p><img src=\"https://file.hstatic.net/200000690725/file/fabt011-2_54066212740_o_grande.jpg\" /></p>\r\n\r\n<p><img src=\"https://file.hstatic.net/200000690725/file/fabt011-5_54064882637_o_grande.jpg\" /></p>\r\n\r\n<p><img src=\"https://file.hstatic.net/200000690725/file/fabt011-3_54066078234_o_grande.jpg\" /></p>\r\n\r\n<p><img src=\"https://file.hstatic.net/200000690725/file/z5882108777617_9e40b6407b3a5ca0ef792678f20d8291_grande.jpg\" /></p>\r\n\r\n<p>????CH&Iacute;NH S&Aacute;CH ĐỔI:</p>\r\n\r\n<p>&bull; Torano hỗ trợ đổi h&agrave;ng trong trường hợp: sản phẩm&nbsp;mặc kh&ocirc;ng vừa, kh&aacute;ch kh&ocirc;ng ưng sản phẩm&nbsp;đ&atilde; đặt, sản phẩm&nbsp;c&oacute; lỗi của nh&agrave; sản xuất. &nbsp;<br />\r\n&bull; Sản phẩm đổi phải đạt điều kiện: c&ograve;n nguy&ecirc;n tem m&aacute;c, chưa qua sử dụng, kh&ocirc;ng c&oacute; vết bẩn, r&aacute;ch&hellip; &nbsp;<br />\r\n&bull; Thời gian đổi: trong v&ograve;ng 7 NG&Agrave;Y kể từ ng&agrave;y kh&aacute;ch nhận h&agrave;ng. &nbsp;<br />\r\n&bull; LƯU &Yacute;:&nbsp;<br />\r\n- Nếu c&oacute; khiếu nại cần hỗ trợ, qu&yacute; kh&aacute;ch CẦN C&Oacute; VIDEO QUAY LẠI QU&Aacute; TR&Igrave;NH MỞ H&Agrave;NG để đảm bảo vấn đề sẽ được giải quyết 100%.</p>', 1000, 1, '2025-05-21 17:40:47', '2025-05-21 17:40:47', 0),
(64, 11, 'Quần kaki basic cạp tender GABK020', '580000', 580000, 'assets/photos/quankk1.jpg', '', '<p>TH&Ocirc;NG TIN SẢN PHẨM:</p>\r\n\r\n<p>- T&ecirc;n sản phẩm:&nbsp;<strong>Quần kaki basic cạp tender GABK020</strong></p>\r\n\r\n<p>- Chất liệu: Kaki d&agrave;y dặn, si&ecirc;u bền, kh&ocirc;ng phai m&agrave;u</p>\r\n\r\n<p>- M&agrave;u sắc: X&aacute;m nhạt, Đen, Xanh navy, Xanh cổ vịt</p>\r\n\r\n<p>- Form d&aacute;ng: Basic hơi &ocirc;m</p>\r\n\r\n<p>- Size: 29-30-31-32-33</p>\r\n\r\n<p>- Xuất xứ: Việt Nam</p>\r\n\r\n<p><img src=\"https://file.hstatic.net/200000690725/file/486621875_1068029058704008_6114407198264189355_n_grande.jpg\" /></p>\r\n\r\n<p><strong>T&Iacute;NH NĂNG NỔI BẬT</strong></p>\r\n\r\n<p>+ Quần kaki nam được may từ chất liệu vải Kaki</p>\r\n\r\n<p>+ Sản phẩm được thiết kế đơn giản, dễ d&agrave;ng phối c&ugrave;ng &aacute;o thun hoặc &aacute;o sơ mi để mang đến cho ph&aacute;i mạnh n&eacute;t trẻ trung, nam t&iacute;nh.</p>\r\n\r\n<p>+ Cạp tender chun ẩn co gi&atilde;n linh hoạt th&ecirc;m 5-7cm, kh&ocirc;ng lo chật bụng</p>\r\n\r\n<p>+ Bền m&agrave;u, kh&ocirc;ng bai x&ugrave; sau nhiều lần giặt</p>\r\n\r\n<p>+ Form d&aacute;ng trẻ trung, năng động</p>\r\n\r\n<p>+ Đường may nổi chắc chắn, tinh tế</p>\r\n\r\n<p><img src=\"https://file.hstatic.net/200000690725/file/487456677_1068029005370680_8284448404826999009_n_grande.jpg\" /></p>\r\n\r\n<p><img src=\"https://file.hstatic.net/200000690725/file/486675915_1068029025370678_420673181520669210_n_grande.jpg\" /></p>\r\n\r\n<p><img src=\"https://file.hstatic.net/200000690725/file/486704540_1068029055370675_4333475301808091144_n_grande.jpg\" /></p>\r\n\r\n<p><img height=\"invalid-value\" src=\"https://down-vn.img.susercontent.com/file/vn-11134208-7r98o-luu56ztfoavmab\" width=\"invalid-value\" /></p>\r\n\r\n<p>????CH&Iacute;NH S&Aacute;CH ĐỔI:</p>\r\n\r\n<p>&bull; Torano hỗ trợ đổi h&agrave;ng trong trường hợp: sản phẩm&nbsp;mặc kh&ocirc;ng vừa, kh&aacute;ch kh&ocirc;ng ưng sản phẩm đ&atilde; đặt, sản phẩm c&oacute; lỗi của nh&agrave; sản xuất. &nbsp;<br />\r\n&bull; Sản phẩm đổi phải đạt điều kiện: c&ograve;n nguy&ecirc;n tem m&aacute;c, chưa qua sử dụng, kh&ocirc;ng c&oacute; vết bẩn, r&aacute;ch&hellip; &nbsp;<br />\r\n&bull; Thời gian đổi: trong v&ograve;ng 7 NG&Agrave;Y kể từ ng&agrave;y kh&aacute;ch nhận h&agrave;ng. &nbsp;<br />\r\n&bull; LƯU &Yacute;: &nbsp;&nbsp; &nbsp;<br />\r\n- Nếu c&oacute; khiếu nại cần hỗ trợ, qu&yacute; kh&aacute;ch CẦN C&Oacute; VIDEO QUAY LẠI QU&Aacute; TR&Igrave;NH MỞ H&Agrave;NG để đảm bảo vấn đề sẽ được giải quyết 100%.</p>', 1000, 1, '2025-05-21 17:41:23', '2025-05-21 17:41:23', 0),
(65, 11, 'Quần kaki dài basic cạp tender FABK001', '500000', 349000, 'assets/photos/quankk2.jpg', '', '<p>TH&Ocirc;NG TIN SẢN PHẨM:</p>\r\n\r\n<p>- T&ecirc;n sản phẩm:&nbsp;<strong>Quần kaki&nbsp;d&agrave;i TORANO&nbsp;basic cạp tender FABK001&nbsp;</strong></p>\r\n\r\n<p>- Chất liệu: Kaki d&agrave;y dặn, si&ecirc;u bền, kh&ocirc;ng phai m&agrave;u</p>\r\n\r\n<p>- M&agrave;u sắc: Be, X&aacute;m nhạt, Đen, Xanh navy, Xanh cổ vịt</p>\r\n\r\n<p>- Phom d&aacute;ng: basic hơi &ocirc;m</p>\r\n\r\n<p>- Size: 29-30-31-32-33</p>\r\n\r\n<p>- Xuất xứ: Việt Nam</p>\r\n\r\n<p><img height=\"invalid-value\" src=\"https://down-vn.img.susercontent.com/file/vn-11134208-7r98o-lsdnvlj2q01wba\" width=\"invalid-value\" /></p>\r\n\r\n<p><img height=\"invalid-value\" src=\"https://down-vn.img.susercontent.com/file/vn-11134208-7r98o-luu56ztflhqqb6\" width=\"invalid-value\" /></p>\r\n\r\n<p><img height=\"invalid-value\" src=\"https://down-vn.img.susercontent.com/file/vn-11134208-7r98o-luu56ztfmwb69e\" width=\"invalid-value\" /></p>\r\n\r\n<p><strong>T&Iacute;NH NĂNG NỔI BẬT</strong></p>\r\n\r\n<p>+ Quần kaki nam được may từ chất liệu vải Kaki</p>\r\n\r\n<p>+ Sản phẩm được thiết kế đơn giản, dễ d&agrave;ng phối c&ugrave;ng &aacute;o thun hoặc &aacute;o sơ mi để mang đến cho ph&aacute;i mạnh n&eacute;t trẻ trung, nam t&iacute;nh.</p>\r\n\r\n<p>+ Thấm h&uacute;t tốt</p>\r\n\r\n<p>+ Bền m&agrave;u, kh&ocirc;ng bai x&ugrave; sau nhiều lần giặt</p>\r\n\r\n<p>+ Phom d&aacute;ng trẻ trung, năng động</p>\r\n\r\n<p>+ Đường may nổi chắc chắn, tinh tế</p>\r\n\r\n<p><img height=\"invalid-value\" src=\"https://down-vn.img.susercontent.com/file/vn-11134208-7r98o-luu56ztfk36a4e\" width=\"invalid-value\" /></p>\r\n\r\n<p><img height=\"invalid-value\" src=\"https://down-vn.img.susercontent.com/file/vn-11134208-7r98o-luu56ztfiolua7\" width=\"invalid-value\" /></p>\r\n\r\n<p>???? HƯỚNG DẪN SỬ DỤNG V&Agrave; BẢO QUẢN:</p>\r\n\r\n<p>+ Giặt quần bằng nước lạnh để quần giữ được m&agrave;u m&agrave;u tốt v&agrave; chất vải cũng bền hơn.</p>\r\n\r\n<p>+ Khi quần bị bẩn, nấm mốc c&oacute; thể sử dụng dấm để giặt quần. B&ocirc;i dấm v&agrave;o vết bẩn, để ng&acirc;m khoảng 1- 2 tiếng đồng hồ, sau đ&oacute; giặt sạch lại với nước.</p>\r\n\r\n<p>+ Lộn tr&aacute;i quần khi giặt v&agrave; phơi. Phơi quần ở nơi r&acirc;m m&aacute;t, tr&aacute;nh &aacute;nh nắng trực tiếp.</p>\r\n\r\n<p>+ Giặt m&aacute;y với chu kỳ trung b&igrave;nh v&agrave; v&ograve;ng quay ngắn</p>\r\n\r\n<p>+ Giặt với nhiệt độ tối đa 30 độ C</p>\r\n\r\n<p>+ Sấy nhẹ ở nhiệt độ thường</p>\r\n\r\n<p>+ L&agrave; ủi kh&ocirc;ng qu&aacute; 110 độ C</p>\r\n\r\n<p>+ Phơi bằng m&oacute;c dưới b&oacute;ng r&acirc;m</p>\r\n\r\n<p>+ Kh&ocirc;ng sử dụng chất tẩy</p>\r\n\r\n<p>Lưu &yacute; nhỏ:</p>\r\n\r\n<p>+ Kh&ocirc;ng giặt chung với đồ dễ xước</p>\r\n\r\n<p>+ Cẩn thận vướng mắc khi phơi</p>\r\n\r\n<p><img height=\"invalid-value\" src=\"https://down-vn.img.susercontent.com/file/vn-11134208-7r98o-luu56ztfoavmab\" width=\"invalid-value\" /></p>\r\n\r\n<p>????CH&Iacute;NH S&Aacute;CH ĐỔI:</p>\r\n\r\n<p>&bull; Torano hỗ trợ đổi h&agrave;ng trong trường hợp: sp mặc kh&ocirc;ng vừa, kh&aacute;ch kh&ocirc;ng ưng sp đ&atilde; đặt, sp c&oacute; lỗi của nh&agrave; sản xuất. &nbsp;<br />\r\n&bull; Sản phẩm đổi phải đạt điều kiện: c&ograve;n nguy&ecirc;n tem m&aacute;c, chưa qua sử dụng, kh&ocirc;ng c&oacute; vết bẩn, r&aacute;ch&hellip; &nbsp;<br />\r\n&bull; Thời gian đổi: trong v&ograve;ng 7 NG&Agrave;Y kể từ ng&agrave;y kh&aacute;ch nhận h&agrave;ng. &nbsp;<br />\r\n&bull; LƯU &Yacute;: &nbsp; - Kh&aacute;ch h&agrave;ng KH&Ocirc;NG BẤM NHẬN H&Agrave;NG khi c&oacute; nhu cầu đổi h&agrave;ng.</p>\r\n\r\n<p>- Nếu kh&aacute;ch h&agrave;ng bấm &ldquo;Đ&Atilde; NHẬN H&Agrave;NG&rdquo; kh&aacute;ch h&agrave;ng THANH TO&Aacute;N 2 CHIỀU PH&Iacute; SHIP khi đổi h&agrave;ng. &nbsp; &nbsp;<br />\r\n- Nếu c&oacute; khiếu nại cần hỗ trợ, qu&yacute; kh&aacute;ch CẦN C&Oacute; VIDEO QUAY LẠI QU&Aacute; TR&Igrave;NH MỞ H&Agrave;NG để đảm bảo vấn đề sẽ được giải quyết 100%.</p>', 1000, 1, '2025-05-21 17:42:10', '2025-05-21 17:42:10', 0),
(66, 11, 'Quần kaki dài basic FABK908', '500000', 500000, 'assets/photos/quankk4.png', '', '<p>TH&Ocirc;NG TIN SẢN PHẨM:</p>\r\n\r\n<p>- T&ecirc;n sản phẩm:&nbsp;<strong>Quần kaki d&agrave;i TORANO&nbsp;basic FABK908</strong></p>\r\n\r\n<p>- Chất liệu: Kaki d&agrave;y dặn, si&ecirc;u bền, kh&ocirc;ng phai m&agrave;u</p>\r\n\r\n<p>- M&agrave;u sắc: X&aacute;m nhạt, Đen, Xanh navy</p>\r\n\r\n<p>- Form d&aacute;ng: Basic hơi &ocirc;m</p>\r\n\r\n<p>- Size: 29-30-31-32-33</p>\r\n\r\n<p>- Xuất xứ: Việt Nam</p>\r\n\r\n<p><img src=\"https://file.hstatic.net/200000690725/file/fabk908-6_54049339689_o_grande.jpg\" /></p>\r\n\r\n<p><img src=\"https://file.hstatic.net/200000690725/file/fabk908-13_54049260903_o_grande.jpg\" /></p>\r\n\r\n<p><strong>T&Iacute;NH NĂNG NỔI BẬT</strong></p>\r\n\r\n<p>+ Quần kaki nam được may từ chất liệu vải Kaki</p>\r\n\r\n<p>+ Sản phẩm được thiết kế đơn giản, dễ d&agrave;ng phối c&ugrave;ng &aacute;o thun hoặc &aacute;o sơ mi để mang đến cho ph&aacute;i mạnh n&eacute;t trẻ trung, nam t&iacute;nh.</p>\r\n\r\n<p>+ Thấm h&uacute;t tốt</p>\r\n\r\n<p>+ Bền m&agrave;u, kh&ocirc;ng bai x&ugrave; sau nhiều lần giặt</p>\r\n\r\n<p>+ Form d&aacute;ng trẻ trung, năng động</p>\r\n\r\n<p>+ Đường may nổi chắc chắn, tinh tế</p>\r\n\r\n<p><img height=\"invalid-value\" src=\"https://down-vn.img.susercontent.com/file/vn-11134208-7r98o-luu56ztfiolua7\" width=\"invalid-value\" /></p>\r\n\r\n<p><img height=\"invalid-value\" src=\"https://down-vn.img.susercontent.com/file/vn-11134208-7r98o-luu56ztfoavmab\" width=\"invalid-value\" /></p>\r\n\r\n<p>????CH&Iacute;NH S&Aacute;CH ĐỔI:</p>\r\n\r\n<p>&bull; Torano hỗ trợ đổi h&agrave;ng trong trường hợp: sản phẩm&nbsp;mặc kh&ocirc;ng vừa, kh&aacute;ch kh&ocirc;ng ưng sản phẩm đ&atilde; đặt, sản phẩm c&oacute; lỗi của nh&agrave; sản xuất. &nbsp;<br />\r\n&bull; Sản phẩm đổi phải đạt điều kiện: c&ograve;n nguy&ecirc;n tem m&aacute;c, chưa qua sử dụng, kh&ocirc;ng c&oacute; vết bẩn, r&aacute;ch&hellip; &nbsp;<br />\r\n&bull; Thời gian đổi: trong v&ograve;ng 7 NG&Agrave;Y kể từ ng&agrave;y kh&aacute;ch nhận h&agrave;ng. &nbsp;<br />\r\n&bull; LƯU &Yacute;: &nbsp;&nbsp; &nbsp;<br />\r\n- Nếu c&oacute; khiếu nại cần hỗ trợ, qu&yacute; kh&aacute;ch CẦN C&Oacute; VIDEO QUAY LẠI QU&Aacute; TR&Igrave;NH MỞ H&Agrave;NG để đảm bảo vấn đề sẽ được giải quyết 100%.</p>\r\n\r\n<p>&nbsp;</p>', 1000, 1, '2025-05-21 17:43:04', '2025-05-21 17:43:42', 0),
(67, 11, 'Quần kaki dài basic vải vân bổ sườn DABK603', '480000', 480000, 'assets/photos/quankk5.png', '', '<p>???? TH&Ocirc;NG TIN SẢN PHẨM:</p>\r\n\r\n<p>- T&ecirc;n sản phẩm:&nbsp;<strong>Quần kaki d&agrave;i basic vải v&acirc;n bổ sườn DABK603</strong></p>\r\n\r\n<p>- Chất liệu: Kaki d&agrave;y dặn, si&ecirc;u bền, kh&ocirc;ng phai m&agrave;u</p>\r\n\r\n<p>- M&agrave;u sắc: Be, X&aacute;m nhạt, Đen, Xanh navy, Xanh cổ vịt</p>\r\n\r\n<p>- Phom d&aacute;ng: basic hơi &ocirc;m</p>\r\n\r\n<p>- Size: 29-30-31-32</p>\r\n\r\n<p>- Xuất xứ: Việt Nam</p>\r\n\r\n<p>???? T&Iacute;NH NĂNG NỔI BẬT</p>\r\n\r\n<p>+ Quần kaki nam được may từ chất liệu vải Kaki</p>\r\n\r\n<p>+ Sản phẩm được thiết kế đơn giản, dễ d&agrave;ng phối c&ugrave;ng &aacute;o thun hoặc &aacute;o sơ mi để mang đến cho ph&aacute;i mạnh n&eacute;t trẻ trung, nam t&iacute;nh.</p>\r\n\r\n<p>+ Thấm h&uacute;t tốt</p>\r\n\r\n<p>+ Bền m&agrave;u, kh&ocirc;ng bai x&ugrave; sau nhiều lần giặt</p>\r\n\r\n<p>+ Phom d&aacute;ng trẻ trung, năng động</p>\r\n\r\n<p>+ Đường may nổi chắc chắn, tinh tế</p>\r\n\r\n<p>???? HƯỚNG DẪN SỬ DỤNG V&Agrave; BẢO QUẢN:</p>\r\n\r\n<p>+ Giặt quần bằng nước lạnh để quần giữ được m&agrave;u m&agrave;u tốt v&agrave; chất vải cũng bền hơn.</p>\r\n\r\n<p>+ Khi quần bị bẩn, nấm mốc c&oacute; thể sử dụng dấm để giặt quần. B&ocirc;i dấm v&agrave;o vết bẩn, để ng&acirc;m khoảng 1- 2 tiếng đồng hồ, sau đ&oacute; giặt sạch lại với nước.</p>\r\n\r\n<p>+ Lộn tr&aacute;i quần khi giặt v&agrave; phơi. Phơi quần ở nơi r&acirc;m m&aacute;t, tr&aacute;nh &aacute;nh nắng trực tiếp.</p>\r\n\r\n<p>+ Giặt m&aacute;y với chu kỳ trung b&igrave;nh v&agrave; v&ograve;ng quay ngắn</p>\r\n\r\n<p>+ Giặt với nhiệt độ tối đa 30 độ C</p>\r\n\r\n<p>+ Sấy nhẹ ở nhiệt độ thường</p>\r\n\r\n<p>+ L&agrave; ủi kh&ocirc;ng qu&aacute; 110 độ C</p>\r\n\r\n<p>+ Phơi bằng m&oacute;c dưới b&oacute;ng r&acirc;m</p>\r\n\r\n<p>+ Kh&ocirc;ng sử dụng chất tẩy</p>\r\n\r\n<p>Lưu &yacute; nhỏ:</p>\r\n\r\n<p>+ Kh&ocirc;ng giặt chung với đồ dễ xước</p>\r\n\r\n<p>+ Cẩn thận vướng mắc khi phơi</p>\r\n\r\n<p><img height=\"invalid-value\" src=\"https://down-vn.img.susercontent.com/file/vn-11134208-7r98o-luu56ztfoavmab\" width=\"invalid-value\" /></p>\r\n\r\n<p>????CH&Iacute;NH S&Aacute;CH ĐỔI:</p>\r\n\r\n<p>&bull; Torano hỗ trợ đổi h&agrave;ng trong trường hợp: sp mặc kh&ocirc;ng vừa, kh&aacute;ch kh&ocirc;ng ưng sp đ&atilde; đặt, sp c&oacute; lỗi của nh&agrave; sản xuất. &nbsp;<br />\r\n&bull; Sản phẩm đổi phải đạt điều kiện: c&ograve;n nguy&ecirc;n tem m&aacute;c, chưa qua sử dụng, kh&ocirc;ng c&oacute; vết bẩn, r&aacute;ch&hellip; &nbsp;<br />\r\n&bull; Thời gian đổi: trong v&ograve;ng 7 NG&Agrave;Y kể từ ng&agrave;y kh&aacute;ch nhận h&agrave;ng. &nbsp;<br />\r\n&bull; LƯU &Yacute;: &nbsp; - Kh&aacute;ch h&agrave;ng KH&Ocirc;NG BẤM NHẬN H&Agrave;NG khi c&oacute; nhu cầu đổi h&agrave;ng.</p>\r\n\r\n<p>- Nếu kh&aacute;ch h&agrave;ng bấm &ldquo;Đ&Atilde; NHẬN H&Agrave;NG&rdquo; kh&aacute;ch h&agrave;ng THANH TO&Aacute;N 2 CHIỀU PH&Iacute; SHIP khi đổi h&agrave;ng. &nbsp; &nbsp;<br />\r\n- Nếu c&oacute; khiếu nại cần hỗ trợ, qu&yacute; kh&aacute;ch CẦN C&Oacute; VIDEO QUAY LẠI QU&Aacute; TR&Igrave;NH MỞ H&Agrave;NG để đảm bảo vấn đề sẽ được giải quyết 100%.</p>', 1000, 1, '2025-05-21 17:44:24', '2025-05-21 17:44:24', 0),
(68, 11, 'Quần kaki dài basic GABK021', '550000', 550000, 'assets/photos/quankk3.png', '', '<p>TH&Ocirc;NG TIN SẢN PHẨM:</p>\r\n\r\n<p>- T&ecirc;n sản phẩm:&nbsp;<strong>Quần kaki d&agrave;i basic GABK021</strong></p>\r\n\r\n<p>- Chất liệu: Kaki d&agrave;y dặn, si&ecirc;u bền, kh&ocirc;ng phai m&agrave;u</p>\r\n\r\n<p>- M&agrave;u sắc: Be đậm, X&aacute;m nhạt, X&aacute;m, X&aacute;m đậm, Xanh navy, Đen</p>\r\n\r\n<p>- Form d&aacute;ng: Basic hơi &ocirc;m</p>\r\n\r\n<p>- Size: 29-30-31-32-33</p>\r\n\r\n<p>- Xuất xứ: Việt Nam</p>\r\n\r\n<p><img src=\"https://file.hstatic.net/200000690725/file/495462530_1102607905246123_8541455520094667040_n_grande.jpg\" /></p>\r\n\r\n<p><img src=\"https://file.hstatic.net/200000690725/file/495357053_1102608031912777_6370381422873975700_n_grande.jpg\" /></p>\r\n\r\n<p><strong>T&Iacute;NH NĂNG NỔI BẬT</strong></p>\r\n\r\n<p>+ Quần kaki nam được may từ chất liệu vải Kaki v&acirc;n ch&eacute;o độc đ&aacute;o</p>\r\n\r\n<p>+ Sản phẩm được thiết kế đơn giản, dễ d&agrave;ng phối c&ugrave;ng &aacute;o thun hoặc &aacute;o sơ mi để mang đến cho ph&aacute;i mạnh n&eacute;t trẻ trung, nam t&iacute;nh.</p>\r\n\r\n<p>+ Bền m&agrave;u, kh&ocirc;ng bai x&ugrave; sau nhiều lần giặt</p>\r\n\r\n<p>+ Form d&aacute;ng trẻ trung, năng động</p>\r\n\r\n<p>+ Đường may nổi chắc chắn, tinh tế</p>\r\n\r\n<p><img src=\"https://file.hstatic.net/200000690725/file/494987231_1102608191912761_6903762264853964588_n_grande.jpg\" /></p>\r\n\r\n<p><img src=\"https://file.hstatic.net/200000690725/file/496146035_1102607921912788_6556726654215392324_n_grande.jpg\" /></p>\r\n\r\n<p><img src=\"https://file.hstatic.net/200000690725/file/gabk021_54469979166_o_grande.jpg\" /></p>\r\n\r\n<p>????CH&Iacute;NH S&Aacute;CH ĐỔI:</p>\r\n\r\n<p>&bull; Torano hỗ trợ đổi h&agrave;ng trong trường hợp: sản phẩm&nbsp;mặc kh&ocirc;ng vừa, kh&aacute;ch kh&ocirc;ng ưng sản phẩm đ&atilde; đặt, sản phẩm c&oacute; lỗi của nh&agrave; sản xuất. &nbsp;<br />\r\n&bull; Sản phẩm đổi phải đạt điều kiện: c&ograve;n nguy&ecirc;n tem m&aacute;c, chưa qua sử dụng, kh&ocirc;ng c&oacute; vết bẩn, r&aacute;ch&hellip; &nbsp;<br />\r\n&bull; Thời gian đổi: trong v&ograve;ng 7 NG&Agrave;Y kể từ ng&agrave;y kh&aacute;ch nhận h&agrave;ng. &nbsp;<br />\r\n&bull; LƯU &Yacute;: &nbsp;&nbsp; &nbsp;<br />\r\n- Nếu c&oacute; khiếu nại cần hỗ trợ, qu&yacute; kh&aacute;ch CẦN C&Oacute; VIDEO QUAY LẠI QU&Aacute; TR&Igrave;NH MỞ H&Agrave;NG để đảm bảo vấn đề sẽ được giải quyết 100%.</p>', 1000, 1, '2025-05-21 17:45:29', '2025-05-21 17:45:29', 0),
(69, 11, 'Quần kaki dài basic vải hiệu ứng EABK022', '500000', 500000, 'assets/photos/quankk6.png', '', '<p><strong>Quần kaki d&agrave;i basic vải hiệu ứng EABK022&nbsp;</strong>&nbsp;từ Torano c&oacute; thiết kế basic, co gi&atilde;n thoải m&aacute;i vừa tiện lợi lại chỉnh chu xuống phố. Nắng n&oacute;ng sẽ dễ chịu đi rất nhiều khi anh em diện quần kaki mềm mại, tho&aacute;ng kh&iacute; m&agrave; vẫn giữ nguy&ecirc;n vẻ lịch l&atilde;m.</p>\r\n\r\n<p><img src=\"https://file.hstatic.net/200000690725/file/eabk022-14_60c781ea7134463383fa338837f08270_grande.jpg\" /></p>\r\n\r\n<p><img src=\"https://file.hstatic.net/200000690725/file/eabk022-12_3e60fadd9c0d4956aacda5e2faa463aa_grande.jpg\" /></p>\r\n\r\n<p><img src=\"https://file.hstatic.net/200000690725/file/eabk022-11_221b7689e42b43bc87ec1c2624e62ff5_grande.jpg\" /></p>\r\n\r\n<p><img src=\"https://file.hstatic.net/200000690725/file/eabk022-9_593207defb7044cfa246803059c91560_grande.jpg\" /></p>\r\n\r\n<p><img src=\"https://file.hstatic.net/200000690725/file/eabk022-10_da004a7568ef4417b3a94ea2f2255a12_grande.jpg\" /></p>\r\n\r\n<p><img src=\"https://file.hstatic.net/200000690725/file/bang-size-kaki_0574be498aac491eaac4ba8209755b6f_grande.jpg\" /></p>\r\n\r\n<p>????CH&Iacute;NH S&Aacute;CH ĐỔI:</p>\r\n\r\n<p>&bull; Torano hỗ trợ đổi h&agrave;ng trong trường hợp: sp mặc kh&ocirc;ng vừa, kh&aacute;ch kh&ocirc;ng ưng sp đ&atilde; đặt, sp c&oacute; lỗi của nh&agrave; sản xuất. &nbsp;<br />\r\n&bull; Sản phẩm đổi phải đạt điều kiện: c&ograve;n nguy&ecirc;n tem m&aacute;c, chưa qua sử dụng, kh&ocirc;ng c&oacute; vết bẩn, r&aacute;ch&hellip; &nbsp;<br />\r\n&bull; Thời gian đổi: trong v&ograve;ng 7 NG&Agrave;Y kể từ ng&agrave;y kh&aacute;ch nhận h&agrave;ng. &nbsp;<br />\r\n&bull; LƯU &Yacute;: &nbsp; - Kh&aacute;ch h&agrave;ng KH&Ocirc;NG BẤM NHẬN H&Agrave;NG khi c&oacute; nhu cầu đổi h&agrave;ng.</p>\r\n\r\n<p>- Nếu kh&aacute;ch h&agrave;ng bấm &ldquo;Đ&Atilde; NHẬN H&Agrave;NG&rdquo; kh&aacute;ch h&agrave;ng THANH TO&Aacute;N 2 CHIỀU PH&Iacute; SHIP khi đổi h&agrave;ng. &nbsp; &nbsp;<br />\r\n- Nếu c&oacute; khiếu nại cần hỗ trợ, qu&yacute; kh&aacute;ch CẦN C&Oacute; VIDEO QUAY LẠI QU&Aacute; TR&Igrave;NH MỞ H&Agrave;NG để đảm bảo vấn đề sẽ được giải quyết 100%.</p>', 1000, 1, '2025-05-21 17:46:26', '2025-05-21 17:46:26', 0),
(70, 12, 'Quần nỉ bộ can phối FWBS001', '349000', 349000, 'assets/photos/quanni1.jpg', '', '<p>????TH&Ocirc;NG TIN SẢN PHẨM:</p>\r\n\r\n<p>????T&ecirc;n sản phẩm:&nbsp;<strong>Quần&nbsp;nỉ nam&nbsp;thương hiệu Torano. Chất nỉ đẹp kh&ocirc;ng bai x&ugrave; FWTW001 - FWBS001</strong></p>\r\n\r\n<p>???? Chất liệu: Nỉ</p>\r\n\r\n<p>????Phom d&aacute;ng: Slimfit hơi &ocirc;m</p>\r\n\r\n<p>????Size: S, M, L, XL</p>\r\n\r\n<p>????Xuất xứ: Việt Nam</p>\r\n\r\n<p><img src=\"https://file.hstatic.net/200000690725/file/fwtw001-fsbs001-gr_53998782090_o_grande.jpg\" /></p>\r\n\r\n<p><img src=\"https://file.hstatic.net/200000690725/file/fwtw001-fsbs001-gr_53998589778_o_grande.jpg\" /></p>\r\n\r\n<p>????T&iacute;nh năng nổi bật:</p>\r\n\r\n<p>- Chất liệu nỉ d&agrave;y vừa phải, vải được dệt từ những sợi b&ocirc;ng nhập khẩu cao cấp lu&ocirc;n tạo cho người d&ugrave;ng cảm gi&aacute;c v&ocirc; c&ugrave;ng mềm mại, thoải m&aacute;i, quần&nbsp;c&oacute; độ co gi&atilde;n tuyệt đối. Đặc biệt l&agrave; giữ ấm tốt</p>\r\n\r\n<p>- M&agrave;u sắc đa dạng, trẻ trung</p>\r\n\r\n<p>- Chất lượng tốt, gi&aacute; cả hợp l&yacute;</p>\r\n\r\n<p>- Kh&ocirc;ng x&ugrave;, kh&ocirc;ng phai m&agrave;u, kh&ocirc;ng bai</p>\r\n\r\n<p>- Thiết kế can phối đơn giản nhưng v&ocirc; c&ugrave;ng tinh tế mang đến phong c&aacute;ch trẻ trung, thanh lich</p>\r\n\r\n<p><img src=\"https://file.hstatic.net/200000690725/file/fwtw001-fsbs001-gr_53998351136_o_grande.jpg\" /></p>\r\n\r\n<p><img src=\"https://file.hstatic.net/200000690725/file/fwtw001-fsbs001-gr_53998589753_o_grande.jpg\" /></p>\r\n\r\n<p>???? HƯỚNG DẪN SỬ DỤNG<br />\r\n▪️ Giặt m&aacute;y chế độ nhẹ ở điều kiện thường<br />\r\n▪️ L&agrave; ủi kh&ocirc;ng qu&aacute; 110 độ C<br />\r\n▪️ Kh&ocirc;ng ng&acirc;m l&acirc;u với bột giặt c&aacute;c sản phẩm c&oacute; t&iacute;nh tẩy rửa<br />\r\n▪️ Khi giặt n&ecirc;n lộn mặt tr&aacute;i ra để đảm bảo độ bền của lớp kh&aacute;ng nước Hyper Tex<br />\r\n▪️ Kh&ocirc;ng giặt chung với vật sắc nhọn<br />\r\n*Lưu &yacute; nhỏ: &Aacute;o gi&oacute; l&agrave; sản phẩm th&ocirc;ng dụng, mức&nbsp;độ sử dụng cao. Chăm s&oacute;c theo hướng dẫn l&agrave; c&aacute;ch gia tăng tuổi thọ sản phẩm tốt nhất.</p>\r\n\r\n<p><br />\r\n???? CH&Iacute;NH S&Aacute;CH ĐỔI:<br />\r\n▪️ Torano hỗ trợ đổi h&agrave;ng trong trường hợp: sản phẩm nhầm size, nhầm m&agrave;u; sản phẩm c&oacute; lỗi của nh&agrave; sản xuất.<br />\r\n▪️ Sản phẩm đổi phải đạt điều kiện:<br />\r\n- C&ograve;n nguy&ecirc;n tem m&aacute;c<br />\r\n- Chưa qua sử dụng, giặt tẩy<br />\r\n- Kh&ocirc;ng c&oacute; vết bẩn, r&aacute;ch<br />\r\n▪️ Thời gian đổi trả: trong v&ograve;ng 30 NG&Agrave;Y kể từ ng&agrave;y kh&aacute;ch nhận h&agrave;ng</p>', 1000, 1, '2025-05-21 17:47:59', '2025-05-21 17:47:59', 0),
(71, 12, 'Quần nỉ bộ trơn basic FWBS024', '500000', 329000, 'assets/photos/quanni2.png', '', '<p>????TH&Ocirc;NG TIN SẢN PHẨM:</p>\r\n\r\n<p>????T&ecirc;n sản phẩm:&nbsp;<strong>Quần nỉ nam thương hiệu&nbsp;Torano, chất nỉ đẹp kh&ocirc;ng bai x&ugrave;&nbsp;FWTW024&nbsp;- FWBS024</strong></p>\r\n\r\n<p>????Chất liệu: Nỉ</p>\r\n\r\n<p>????Phom d&aacute;ng: Slimfit hơi &ocirc;m</p>\r\n\r\n<p>????Size: S, M, L, XL</p>\r\n\r\n<p>????Xuất xứ: Việt Nam</p>\r\n\r\n<p><img src=\"https://file.hstatic.net/200000690725/file/img_3208_53969221507_o_grande.jpg\" /></p>\r\n\r\n<p><img src=\"https://file.hstatic.net/200000690725/file/img_3219_53970556465_o_grande.jpg\" /></p>\r\n\r\n<p>????T&iacute;nh năng nổi bật:</p>\r\n\r\n<p>- Chất liệu nỉ d&agrave;y vừa phải, vải được dệt từ những sợi b&ocirc;ng nhập khẩu cao cấp lu&ocirc;n tạo cho người d&ugrave;ng cảm gi&aacute;c v&ocirc; c&ugrave;ng mềm mại, thoải m&aacute;i, quần&nbsp;c&oacute; độ co gi&atilde;n tuyệt đối. Đặc biệt l&agrave; giữ ấm tốt</p>\r\n\r\n<p>- M&agrave;u sắc đa dạng, trẻ trung</p>\r\n\r\n<p>- Chất lượng tốt, gi&aacute; cả hợp l&yacute;</p>\r\n\r\n<p>- Kh&ocirc;ng x&ugrave;, kh&ocirc;ng phai m&agrave;u, kh&ocirc;ng bai</p>\r\n\r\n<p>- Thiết kế&nbsp;đơn giản nhưng v&ocirc; c&ugrave;ng&nbsp;tinh tế mang đến phong c&aacute;ch trẻ trung, thanh lich</p>\r\n\r\n<p><img src=\"https://file.hstatic.net/200000690725/file/img_3284_53970111926_o_grande.jpg\" /></p>\r\n\r\n<p><img src=\"https://file.hstatic.net/200000690725/file/img_3290_53970349733_o_grande.jpg\" /></p>\r\n\r\n<p>???? HƯỚNG DẪN SỬ DỤNG<br />\r\n▪️ Giặt m&aacute;y chế độ nhẹ ở điều kiện thường<br />\r\n▪️ L&agrave; ủi kh&ocirc;ng qu&aacute; 110 độ C<br />\r\n▪️ Kh&ocirc;ng ng&acirc;m l&acirc;u với bột giặt c&aacute;c sản phẩm c&oacute; t&iacute;nh tẩy rửa<br />\r\n▪️ Khi giặt n&ecirc;n lộn mặt tr&aacute;i ra để đảm bảo độ bền của lớp kh&aacute;ng nước Hyper Tex<br />\r\n▪️ Kh&ocirc;ng giặt chung với vật sắc nhọn<br />\r\n*Lưu &yacute; nhỏ: &Aacute;o gi&oacute; l&agrave; sản phẩm th&ocirc;ng dụng, mức&nbsp;độ sử dụng cao. Chăm s&oacute;c theo hướng dẫn l&agrave; c&aacute;ch gia tăng tuổi thọ sản phẩm tốt nhất.</p>\r\n\r\n<p><br />\r\n???? CH&Iacute;NH S&Aacute;CH ĐỔI:<br />\r\n▪️ Torano hỗ trợ đổi h&agrave;ng trong trường hợp: sản phẩm nhầm size, nhầm m&agrave;u; sản phẩm c&oacute; lỗi của nh&agrave; sản xuất.<br />\r\n▪️ Sản phẩm đổi phải đạt điều kiện:<br />\r\n- C&ograve;n nguy&ecirc;n tem m&aacute;c<br />\r\n- Chưa qua sử dụng, giặt tẩy<br />\r\n- Kh&ocirc;ng c&oacute; vết bẩn, r&aacute;ch<br />\r\n▪️ Thời gian đổi trả: trong v&ograve;ng 30 NG&Agrave;Y kể từ ng&agrave;y kh&aacute;ch nhận h&agrave;ng.</p>', 1000, 1, '2025-05-21 17:48:52', '2025-05-21 17:48:52', 0);

-- --------------------------------------------------------

--
-- Table structure for table `product_variants`
--

CREATE TABLE `product_variants` (
  `id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL,
  `size` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `color` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `quantity` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `product_variants`
--

INSERT INTO `product_variants` (`id`, `product_id`, `size`, `color`, `quantity`) VALUES
(1, 1, 'S', 'Đen', 100),
(2, 1, 'S', 'Trắng', 100),
(3, 1, 'S', 'Be', 100),
(4, 1, 'M', 'Đen', 100),
(5, 1, 'M', 'Trắng', 100),
(6, 1, 'M', 'Be', 100),
(7, 1, 'L', 'Đen', 100),
(8, 1, 'L', 'Trắng', 100),
(9, 1, 'L', 'Be', 100),
(10, 1, 'XL', 'Đen', 100),
(11, 1, 'XL', 'Trắng', 100),
(12, 1, 'XL', 'Be', 100),
(13, 2, 'S', 'Đen', 100),
(14, 2, 'S', 'Trắng', 100),
(15, 2, 'S', 'Be', 100),
(16, 2, 'M', 'Đen', 100),
(17, 2, 'M', 'Trắng', 100),
(18, 2, 'M', 'Be', 100),
(19, 2, 'L', 'Đen', 100),
(20, 2, 'L', 'Trắng', 100),
(21, 2, 'L', 'Be', 100),
(22, 2, 'XL', 'Đen', 100),
(23, 2, 'XL', 'Trắng', 100),
(24, 2, 'XL', 'Be', 100),
(25, 3, 'S', 'Đen', 100),
(26, 3, 'S', 'Trắng', 100),
(27, 3, 'S', 'Be', 100),
(28, 3, 'M', 'Đen', 100),
(29, 3, 'M', 'Trắng', 100),
(30, 3, 'M', 'Be', 100),
(31, 3, 'L', 'Đen', 100),
(32, 3, 'L', 'Trắng', 100),
(33, 3, 'L', 'Be', 100),
(34, 3, 'XL', 'Đen', 100),
(35, 3, 'XL', 'Trắng', 100),
(36, 3, 'XL', 'Be', 100),
(37, 4, 'S', 'Đen', 100),
(38, 4, 'S', 'Trắng', 100),
(39, 4, 'S', 'Be', 100),
(40, 4, 'M', 'Đen', 100),
(41, 4, 'M', 'Trắng', 100),
(42, 4, 'M', 'Be', 100),
(43, 4, 'L', 'Đen', 100),
(44, 4, 'L', 'Trắng', 100),
(45, 4, 'L', 'Be', 100),
(46, 4, 'XL', 'Đen', 100),
(47, 4, 'XL', 'Trắng', 100),
(48, 4, 'XL', 'Be', 100),
(49, 5, 'S', 'Đen', 100),
(50, 5, 'S', 'Trắng', 100),
(51, 5, 'S', 'Be', 100),
(52, 5, 'M', 'Đen', 100),
(53, 5, 'M', 'Trắng', 100),
(54, 5, 'M', 'Be', 100),
(55, 5, 'L', 'Đen', 100),
(56, 5, 'L', 'Trắng', 100),
(57, 5, 'L', 'Be', 100),
(58, 5, 'XL', 'Đen', 100),
(59, 5, 'XL', 'Trắng', 100),
(60, 5, 'XL', 'Be', 100),
(61, 6, 'S', 'Đen', 100),
(62, 6, 'S', 'Trắng', 100),
(63, 6, 'S', 'Be', 100),
(64, 6, 'M', 'Đen', 100),
(65, 6, 'M', 'Trắng', 100),
(66, 6, 'M', 'Be', 100),
(67, 6, 'L', 'Đen', 100),
(68, 6, 'L', 'Trắng', 100),
(69, 6, 'L', 'Be', 100),
(70, 6, 'XL', 'Đen', 100),
(71, 6, 'XL', 'Trắng', 100),
(72, 6, 'XL', 'Be', 100),
(73, 7, 'S', 'Đen', 100),
(74, 7, 'S', 'Trắng', 100),
(75, 7, 'S', 'Be', 100),
(76, 7, 'M', 'Đen', 100),
(77, 7, 'M', 'Trắng', 100),
(78, 7, 'M', 'Be', 100),
(79, 7, 'L', 'Đen', 100),
(80, 7, 'L', 'Trắng', 100),
(81, 7, 'L', 'Be', 100),
(82, 7, 'XL', 'Đen', 100),
(83, 7, 'XL', 'Trắng', 100),
(84, 7, 'XL', 'Be', 100),
(85, 8, 'S', 'Đen', 100),
(86, 8, 'S', 'Trắng', 100),
(87, 8, 'S', 'Be', 100),
(88, 8, 'M', 'Đen', 100),
(89, 8, 'M', 'Trắng', 100),
(90, 8, 'M', 'Be', 100),
(91, 8, 'L', 'Đen', 100),
(92, 8, 'L', 'Trắng', 100),
(93, 8, 'L', 'Be', 100),
(94, 8, 'XL', 'Đen', 100),
(95, 8, 'XL', 'Trắng', 100),
(96, 8, 'XL', 'Be', 100),
(97, 9, 'S', 'Đen', 100),
(98, 9, 'S', 'Trắng', 100),
(99, 9, 'S', 'Be', 100),
(100, 9, 'M', 'Đen', 100),
(101, 9, 'M', 'Trắng', 100),
(102, 9, 'M', 'Be', 100),
(103, 9, 'L', 'Đen', 100),
(104, 9, 'L', 'Trắng', 100),
(105, 9, 'L', 'Be', 100),
(106, 9, 'XL', 'Đen', 100),
(107, 9, 'XL', 'Trắng', 100),
(108, 9, 'XL', 'Be', 100),
(109, 10, 'S', 'Đen', 100),
(110, 10, 'S', 'Trắng', 100),
(111, 10, 'S', 'Be', 100),
(112, 10, 'M', 'Đen', 100),
(113, 10, 'M', 'Trắng', 100),
(114, 10, 'M', 'Be', 100),
(115, 10, 'L', 'Đen', 100),
(116, 10, 'L', 'Trắng', 100),
(117, 10, 'L', 'Be', 100),
(118, 10, 'XL', 'Đen', 100),
(119, 10, 'XL', 'Trắng', 100),
(120, 10, 'XL', 'Be', 100),
(121, 11, 'S', 'Đen', 100),
(122, 11, 'S', 'Trắng', 100),
(123, 11, 'S', 'Be', 100),
(124, 11, 'M', 'Đen', 100),
(125, 11, 'M', 'Trắng', 100),
(126, 11, 'M', 'Be', 100),
(127, 11, 'L', 'Đen', 100),
(128, 11, 'L', 'Trắng', 100),
(129, 11, 'L', 'Be', 100),
(130, 11, 'XL', 'Đen', 100),
(131, 11, 'XL', 'Trắng', 100),
(132, 11, 'XL', 'Be', 100),
(133, 12, 'S', 'Đen', 100),
(134, 12, 'S', 'Trắng', 100),
(135, 12, 'S', 'Be', 100),
(136, 12, 'M', 'Đen', 100),
(137, 12, 'M', 'Trắng', 100),
(138, 12, 'M', 'Be', 100),
(139, 12, 'L', 'Đen', 100),
(140, 12, 'L', 'Trắng', 100),
(141, 12, 'L', 'Be', 100),
(142, 12, 'XL', 'Đen', 100),
(143, 12, 'XL', 'Trắng', 100),
(144, 12, 'XL', 'Be', 100),
(145, 13, 'S', 'Đen', 100),
(146, 13, 'S', 'Trắng', 100),
(147, 13, 'S', 'Be', 100),
(148, 13, 'M', 'Đen', 100),
(149, 13, 'M', 'Trắng', 100),
(150, 13, 'M', 'Be', 100),
(151, 13, 'L', 'Đen', 100),
(152, 13, 'L', 'Trắng', 100),
(153, 13, 'L', 'Be', 100),
(154, 13, 'XL', 'Đen', 100),
(155, 13, 'XL', 'Trắng', 100),
(156, 13, 'XL', 'Be', 100),
(157, 14, 'S', 'Đen', 100),
(158, 14, 'S', 'Trắng', 100),
(159, 14, 'S', 'Be', 100),
(160, 14, 'M', 'Đen', 100),
(161, 14, 'M', 'Trắng', 100),
(162, 14, 'M', 'Be', 100),
(163, 14, 'L', 'Đen', 100),
(164, 14, 'L', 'Trắng', 100),
(165, 14, 'L', 'Be', 100),
(166, 14, 'XL', 'Đen', 100),
(167, 14, 'XL', 'Trắng', 100),
(168, 14, 'XL', 'Be', 100),
(169, 15, 'S', 'Đen', 100),
(170, 15, 'S', 'Trắng', 100),
(171, 15, 'S', 'Be', 100),
(172, 15, 'M', 'Đen', 100),
(173, 15, 'M', 'Trắng', 100),
(174, 15, 'M', 'Be', 100),
(175, 15, 'L', 'Đen', 100),
(176, 15, 'L', 'Trắng', 100),
(177, 15, 'L', 'Be', 100),
(178, 15, 'XL', 'Đen', 100),
(179, 15, 'XL', 'Trắng', 100),
(180, 15, 'XL', 'Be', 100),
(181, 16, 'S', 'Đen', 100),
(182, 16, 'S', 'Trắng', 100),
(183, 16, 'S', 'Be', 100),
(184, 16, 'M', 'Đen', 100),
(185, 16, 'M', 'Trắng', 100),
(186, 16, 'M', 'Be', 100),
(187, 16, 'L', 'Đen', 100),
(188, 16, 'L', 'Trắng', 100),
(189, 16, 'L', 'Be', 100),
(190, 16, 'XL', 'Đen', 100),
(191, 16, 'XL', 'Trắng', 100),
(192, 16, 'XL', 'Be', 100),
(193, 17, 'S', 'Đen', 100),
(194, 17, 'S', 'Trắng', 100),
(195, 17, 'S', 'Be', 100),
(196, 17, 'M', 'Đen', 100),
(197, 17, 'M', 'Trắng', 100),
(198, 17, 'M', 'Be', 100),
(199, 17, 'L', 'Đen', 100),
(200, 17, 'L', 'Trắng', 100),
(201, 17, 'L', 'Be', 100),
(202, 17, 'XL', 'Đen', 100),
(203, 17, 'XL', 'Trắng', 100),
(204, 17, 'XL', 'Be', 100),
(205, 18, 'S', 'Đen', 100),
(206, 18, 'S', 'Trắng', 100),
(207, 18, 'S', 'Be', 100),
(208, 18, 'M', 'Đen', 100),
(209, 18, 'M', 'Trắng', 100),
(210, 18, 'M', 'Be', 100),
(211, 18, 'L', 'Đen', 100),
(212, 18, 'L', 'Trắng', 100),
(213, 18, 'L', 'Be', 100),
(214, 18, 'XL', 'Đen', 100),
(215, 18, 'XL', 'Trắng', 100),
(216, 18, 'XL', 'Be', 100),
(217, 19, 'S', 'Đen', 100),
(218, 19, 'S', 'Trắng', 100),
(219, 19, 'S', 'Be', 100),
(220, 19, 'M', 'Đen', 100),
(221, 19, 'M', 'Trắng', 100),
(222, 19, 'M', 'Be', 100),
(223, 19, 'L', 'Đen', 100),
(224, 19, 'L', 'Trắng', 100),
(225, 19, 'L', 'Be', 100),
(226, 19, 'XL', 'Đen', 100),
(227, 19, 'XL', 'Trắng', 100),
(228, 19, 'XL', 'Be', 100),
(229, 20, 'S', 'Đen', 100),
(230, 20, 'S', 'Trắng', 100),
(231, 20, 'S', 'Be', 100),
(232, 20, 'M', 'Đen', 100),
(233, 20, 'M', 'Trắng', 100),
(234, 20, 'M', 'Be', 100),
(235, 20, 'L', 'Đen', 100),
(236, 20, 'L', 'Trắng', 100),
(237, 20, 'L', 'Be', 100),
(238, 20, 'XL', 'Đen', 100),
(239, 20, 'XL', 'Trắng', 100),
(240, 20, 'XL', 'Be', 100),
(241, 21, 'S', 'Đen', 100),
(242, 21, 'S', 'Trắng', 100),
(243, 21, 'S', 'Be', 100),
(244, 21, 'M', 'Đen', 100),
(245, 21, 'M', 'Trắng', 100),
(246, 21, 'M', 'Be', 100),
(247, 21, 'L', 'Đen', 100),
(248, 21, 'L', 'Trắng', 100),
(249, 21, 'L', 'Be', 100),
(250, 21, 'XL', 'Đen', 100),
(251, 21, 'XL', 'Trắng', 100),
(252, 21, 'XL', 'Be', 100),
(253, 22, 'S', 'Đen', 100),
(254, 22, 'S', 'Trắng', 100),
(255, 22, 'S', 'Be', 100),
(256, 22, 'M', 'Đen', 100),
(257, 22, 'M', 'Trắng', 100),
(258, 22, 'M', 'Be', 100),
(259, 22, 'L', 'Đen', 100),
(260, 22, 'L', 'Trắng', 100),
(261, 22, 'L', 'Be', 100),
(262, 22, 'XL', 'Đen', 100),
(263, 22, 'XL', 'Trắng', 100),
(264, 22, 'XL', 'Be', 100),
(265, 23, 'S', 'Đen', 100),
(266, 23, 'S', 'Trắng', 100),
(267, 23, 'S', 'Be', 100),
(268, 23, 'M', 'Đen', 100),
(269, 23, 'M', 'Trắng', 100),
(270, 23, 'M', 'Be', 100),
(271, 23, 'L', 'Đen', 100),
(272, 23, 'L', 'Trắng', 100),
(273, 23, 'L', 'Be', 100),
(274, 23, 'XL', 'Đen', 100),
(275, 23, 'XL', 'Trắng', 100),
(276, 23, 'XL', 'Be', 100),
(277, 24, 'S', 'Đen', 100),
(278, 24, 'S', 'Trắng', 100),
(279, 24, 'S', 'Be', 100),
(280, 24, 'M', 'Đen', 100),
(281, 24, 'M', 'Trắng', 100),
(282, 24, 'M', 'Be', 100),
(283, 24, 'L', 'Đen', 100),
(284, 24, 'L', 'Trắng', 100),
(285, 24, 'L', 'Be', 100),
(286, 24, 'XL', 'Đen', 100),
(287, 24, 'XL', 'Trắng', 100),
(288, 24, 'XL', 'Be', 100),
(289, 25, 'S', 'Đen', 100),
(290, 25, 'S', 'Trắng', 100),
(291, 25, 'S', 'Be', 100),
(292, 25, 'M', 'Đen', 100),
(293, 25, 'M', 'Trắng', 100),
(294, 25, 'M', 'Be', 100),
(295, 25, 'L', 'Đen', 100),
(296, 25, 'L', 'Trắng', 100),
(297, 25, 'L', 'Be', 100),
(298, 25, 'XL', 'Đen', 100),
(299, 25, 'XL', 'Trắng', 100),
(300, 25, 'XL', 'Be', 100),
(301, 26, 'S', 'Đen', 100),
(302, 26, 'S', 'Trắng', 100),
(303, 26, 'S', 'Be', 100),
(304, 26, 'M', 'Đen', 100),
(305, 26, 'M', 'Trắng', 100),
(306, 26, 'M', 'Be', 100),
(307, 26, 'L', 'Đen', 100),
(308, 26, 'L', 'Trắng', 100),
(309, 26, 'L', 'Be', 100),
(310, 26, 'XL', 'Đen', 100),
(311, 26, 'XL', 'Trắng', 100),
(312, 26, 'XL', 'Be', 100),
(313, 27, 'S', 'Đen', 100),
(314, 27, 'S', 'Trắng', 100),
(315, 27, 'S', 'Be', 100),
(316, 27, 'M', 'Đen', 100),
(317, 27, 'M', 'Trắng', 100),
(318, 27, 'M', 'Be', 100),
(319, 27, 'L', 'Đen', 100),
(320, 27, 'L', 'Trắng', 100),
(321, 27, 'L', 'Be', 100),
(322, 27, 'XL', 'Đen', 100),
(323, 27, 'XL', 'Trắng', 100),
(324, 27, 'XL', 'Be', 100),
(325, 28, 'S', 'Đen', 100),
(326, 28, 'S', 'Trắng', 100),
(327, 28, 'S', 'Be', 100),
(328, 28, 'M', 'Đen', 100),
(329, 28, 'M', 'Trắng', 100),
(330, 28, 'M', 'Be', 100),
(331, 28, 'L', 'Đen', 100),
(332, 28, 'L', 'Trắng', 100),
(333, 28, 'L', 'Be', 100),
(334, 28, 'XL', 'Đen', 100),
(335, 28, 'XL', 'Trắng', 100),
(336, 28, 'XL', 'Be', 100),
(337, 29, 'S', 'Đen', 100),
(338, 29, 'S', 'Trắng', 100),
(339, 29, 'S', 'Be', 100),
(340, 29, 'M', 'Đen', 100),
(341, 29, 'M', 'Trắng', 100),
(342, 29, 'M', 'Be', 100),
(343, 29, 'L', 'Đen', 100),
(344, 29, 'L', 'Trắng', 100),
(345, 29, 'L', 'Be', 100),
(346, 29, 'XL', 'Đen', 100),
(347, 29, 'XL', 'Trắng', 100),
(348, 29, 'XL', 'Be', 100),
(349, 30, 'S', 'Đen', 100),
(350, 30, 'S', 'Trắng', 100),
(351, 30, 'S', 'Be', 100),
(352, 30, 'M', 'Đen', 100),
(353, 30, 'M', 'Trắng', 100),
(354, 30, 'M', 'Be', 100),
(355, 30, 'L', 'Đen', 100),
(356, 30, 'L', 'Trắng', 100),
(357, 30, 'L', 'Be', 100),
(358, 30, 'XL', 'Đen', 100),
(359, 30, 'XL', 'Trắng', 100),
(360, 30, 'XL', 'Be', 100),
(361, 31, 'S', 'Đen', 100),
(362, 31, 'S', 'Trắng', 100),
(363, 31, 'S', 'Be', 100),
(364, 31, 'M', 'Đen', 100),
(365, 31, 'M', 'Trắng', 100),
(366, 31, 'M', 'Be', 100),
(367, 31, 'L', 'Đen', 100),
(368, 31, 'L', 'Trắng', 100),
(369, 31, 'L', 'Be', 100),
(370, 31, 'XL', 'Đen', 100),
(371, 31, 'XL', 'Trắng', 100),
(372, 31, 'XL', 'Be', 100),
(373, 32, 'S', 'Đen', 100),
(374, 32, 'S', 'Trắng', 100),
(375, 32, 'S', 'Be', 100),
(376, 32, 'M', 'Đen', 100),
(377, 32, 'M', 'Trắng', 100),
(378, 32, 'M', 'Be', 100),
(379, 32, 'L', 'Đen', 100),
(380, 32, 'L', 'Trắng', 100),
(381, 32, 'L', 'Be', 100),
(382, 32, 'XL', 'Đen', 100),
(383, 32, 'XL', 'Trắng', 100),
(384, 32, 'XL', 'Be', 100),
(385, 33, 'S', 'Đen', 100),
(386, 33, 'S', 'Trắng', 100),
(387, 33, 'S', 'Be', 100),
(388, 33, 'M', 'Đen', 100),
(389, 33, 'M', 'Trắng', 100),
(390, 33, 'M', 'Be', 100),
(391, 33, 'L', 'Đen', 100),
(392, 33, 'L', 'Trắng', 100),
(393, 33, 'L', 'Be', 100),
(394, 33, 'XL', 'Đen', 100),
(395, 33, 'XL', 'Trắng', 100),
(396, 33, 'XL', 'Be', 100),
(397, 34, 'S', 'Đen', 100),
(398, 34, 'S', 'Trắng', 100),
(399, 34, 'S', 'Be', 100),
(400, 34, 'M', 'Đen', 100),
(401, 34, 'M', 'Trắng', 100),
(402, 34, 'M', 'Be', 100),
(403, 34, 'L', 'Đen', 100),
(404, 34, 'L', 'Trắng', 100),
(405, 34, 'L', 'Be', 100),
(406, 34, 'XL', 'Đen', 100),
(407, 34, 'XL', 'Trắng', 100),
(408, 34, 'XL', 'Be', 100),
(409, 35, 'S', 'Đen', 100),
(410, 35, 'S', 'Trắng', 100),
(411, 35, 'S', 'Be', 100),
(412, 35, 'M', 'Đen', 100),
(413, 35, 'M', 'Trắng', 100),
(414, 35, 'M', 'Be', 100),
(415, 35, 'L', 'Đen', 100),
(416, 35, 'L', 'Trắng', 100),
(417, 35, 'L', 'Be', 100),
(418, 35, 'XL', 'Đen', 100),
(419, 35, 'XL', 'Trắng', 100),
(420, 35, 'XL', 'Be', 100),
(421, 36, 'S', 'Đen', 100),
(422, 36, 'S', 'Trắng', 100),
(423, 36, 'S', 'Be', 100),
(424, 36, 'M', 'Đen', 100),
(425, 36, 'M', 'Trắng', 100),
(426, 36, 'M', 'Be', 100),
(427, 36, 'L', 'Đen', 100),
(428, 36, 'L', 'Trắng', 100),
(429, 36, 'L', 'Be', 100),
(430, 36, 'XL', 'Đen', 100),
(431, 36, 'XL', 'Trắng', 100),
(432, 36, 'XL', 'Be', 100),
(433, 37, 'S', 'Đen', 100),
(434, 37, 'S', 'Trắng', 100),
(435, 37, 'S', 'Be', 100),
(436, 37, 'M', 'Đen', 100),
(437, 37, 'M', 'Trắng', 100),
(438, 37, 'M', 'Be', 100),
(439, 37, 'L', 'Đen', 100),
(440, 37, 'L', 'Trắng', 100),
(441, 37, 'L', 'Be', 100),
(442, 37, 'XL', 'Đen', 100),
(443, 37, 'XL', 'Trắng', 100),
(444, 37, 'XL', 'Be', 100),
(445, 38, 'S', 'Đen', 100),
(446, 38, 'S', 'Trắng', 100),
(447, 38, 'S', 'Be', 100),
(448, 38, 'M', 'Đen', 100),
(449, 38, 'M', 'Trắng', 100),
(450, 38, 'M', 'Be', 100),
(451, 38, 'L', 'Đen', 100),
(452, 38, 'L', 'Trắng', 100),
(453, 38, 'L', 'Be', 100),
(454, 38, 'XL', 'Đen', 100),
(455, 38, 'XL', 'Trắng', 100),
(456, 38, 'XL', 'Be', 100),
(457, 39, 'S', 'Đen', 100),
(458, 39, 'S', 'Trắng', 100),
(459, 39, 'S', 'Be', 100),
(460, 39, 'M', 'Đen', 100),
(461, 39, 'M', 'Trắng', 100),
(462, 39, 'M', 'Be', 100),
(463, 39, 'L', 'Đen', 100),
(464, 39, 'L', 'Trắng', 100),
(465, 39, 'L', 'Be', 100),
(466, 39, 'XL', 'Đen', 100),
(467, 39, 'XL', 'Trắng', 100),
(468, 39, 'XL', 'Be', 100),
(469, 40, 'S', 'Đen', 100),
(470, 40, 'S', 'Trắng', 100),
(471, 40, 'S', 'Be', 100),
(472, 40, 'M', 'Đen', 100),
(473, 40, 'M', 'Trắng', 100),
(474, 40, 'M', 'Be', 100),
(475, 40, 'L', 'Đen', 100),
(476, 40, 'L', 'Trắng', 100),
(477, 40, 'L', 'Be', 100),
(478, 40, 'XL', 'Đen', 100),
(479, 40, 'XL', 'Trắng', 100),
(480, 40, 'XL', 'Be', 100),
(481, 41, 'S', 'Đen', 100),
(482, 41, 'S', 'Trắng', 100),
(483, 41, 'S', 'Be', 100),
(484, 41, 'M', 'Đen', 100),
(485, 41, 'M', 'Trắng', 100),
(486, 41, 'M', 'Be', 100),
(487, 41, 'L', 'Đen', 100),
(488, 41, 'L', 'Trắng', 100),
(489, 41, 'L', 'Be', 100),
(490, 41, 'XL', 'Đen', 100),
(491, 41, 'XL', 'Trắng', 100),
(492, 41, 'XL', 'Be', 100),
(493, 42, 'S', 'Đen', 100),
(494, 42, 'S', 'Trắng', 100),
(495, 42, 'S', 'Be', 100),
(496, 42, 'M', 'Đen', 100),
(497, 42, 'M', 'Trắng', 100),
(498, 42, 'M', 'Be', 100),
(499, 42, 'L', 'Đen', 100),
(500, 42, 'L', 'Trắng', 100),
(501, 42, 'L', 'Be', 100),
(502, 42, 'XL', 'Đen', 100),
(503, 42, 'XL', 'Trắng', 100),
(504, 42, 'XL', 'Be', 100),
(505, 43, 'S', 'Đen', 100),
(506, 43, 'S', 'Trắng', 100),
(507, 43, 'S', 'Be', 100),
(508, 43, 'M', 'Đen', 100),
(509, 43, 'M', 'Trắng', 100),
(510, 43, 'M', 'Be', 100),
(511, 43, 'L', 'Đen', 100),
(512, 43, 'L', 'Trắng', 100),
(513, 43, 'L', 'Be', 100),
(514, 43, 'XL', 'Đen', 100),
(515, 43, 'XL', 'Trắng', 100),
(516, 43, 'XL', 'Be', 100),
(517, 44, 'S', 'Đen', 100),
(518, 44, 'S', 'Trắng', 100),
(519, 44, 'S', 'Be', 100),
(520, 44, 'M', 'Đen', 100),
(521, 44, 'M', 'Trắng', 100),
(522, 44, 'M', 'Be', 100),
(523, 44, 'L', 'Đen', 100),
(524, 44, 'L', 'Trắng', 100),
(525, 44, 'L', 'Be', 100),
(526, 44, 'XL', 'Đen', 100),
(527, 44, 'XL', 'Trắng', 100),
(528, 44, 'XL', 'Be', 100),
(529, 45, '28', 'Đen', 100),
(530, 45, '28', 'Trắng', 100),
(531, 45, '28', 'Be', 100),
(532, 45, '29', 'Đen', 100),
(533, 45, '29', 'Trắng', 100),
(534, 45, '29', 'Be', 100),
(535, 45, '30', 'Đen', 100),
(536, 45, '30', 'Trắng', 100),
(537, 45, '30', 'Be', 100),
(538, 45, '31', 'Đen', 100),
(539, 45, '31', 'Trắng', 100),
(540, 45, '31', 'Be', 100),
(541, 45, '32', 'Đen', 100),
(542, 45, '32', 'Trắng', 100),
(543, 45, '32', 'Be', 100),
(544, 46, '28', 'Đen', 100),
(545, 46, '28', 'Trắng', 100),
(546, 46, '28', 'Be', 100),
(547, 46, '29', 'Đen', 100),
(548, 46, '29', 'Trắng', 100),
(549, 46, '29', 'Be', 100),
(550, 46, '30', 'Đen', 100),
(551, 46, '30', 'Trắng', 100),
(552, 46, '30', 'Be', 100),
(553, 46, '31', 'Đen', 100),
(554, 46, '31', 'Trắng', 100),
(555, 46, '31', 'Be', 100),
(556, 46, '32', 'Đen', 100),
(557, 46, '32', 'Trắng', 100),
(558, 46, '32', 'Be', 100),
(559, 47, '28', 'Đen', 100),
(560, 47, '28', 'Trắng', 100),
(561, 47, '28', 'Be', 100),
(562, 47, '29', 'Đen', 100),
(563, 47, '29', 'Trắng', 100),
(564, 47, '29', 'Be', 100),
(565, 47, '30', 'Đen', 100),
(566, 47, '30', 'Trắng', 100),
(567, 47, '30', 'Be', 100),
(568, 47, '31', 'Đen', 100),
(569, 47, '31', 'Trắng', 100),
(570, 47, '31', 'Be', 100),
(571, 47, '32', 'Đen', 100),
(572, 47, '32', 'Trắng', 100),
(573, 47, '32', 'Be', 100),
(574, 48, '28', 'Đen', 100),
(575, 48, '28', 'Trắng', 100),
(576, 48, '28', 'Be', 100),
(577, 48, '29', 'Đen', 100),
(578, 48, '29', 'Trắng', 100),
(579, 48, '29', 'Be', 100),
(580, 48, '30', 'Đen', 100),
(581, 48, '30', 'Trắng', 100),
(582, 48, '30', 'Be', 100),
(583, 48, '31', 'Đen', 100),
(584, 48, '31', 'Trắng', 100),
(585, 48, '31', 'Be', 100),
(586, 48, '32', 'Đen', 100),
(587, 48, '32', 'Trắng', 100),
(588, 48, '32', 'Be', 100),
(589, 49, '28', 'Đen', 100),
(590, 49, '28', 'Trắng', 100),
(591, 49, '28', 'Be', 100),
(592, 49, '29', 'Đen', 100),
(593, 49, '29', 'Trắng', 100),
(594, 49, '29', 'Be', 100),
(595, 49, '30', 'Đen', 100),
(596, 49, '30', 'Trắng', 100),
(597, 49, '30', 'Be', 100),
(598, 49, '31', 'Đen', 100),
(599, 49, '31', 'Trắng', 100),
(600, 49, '31', 'Be', 100),
(601, 49, '32', 'Đen', 100),
(602, 49, '32', 'Trắng', 100),
(603, 49, '32', 'Be', 100),
(604, 50, '28', 'Đen', 100),
(605, 50, '28', 'Trắng', 100),
(606, 50, '28', 'Be', 100),
(607, 50, '29', 'Đen', 100),
(608, 50, '29', 'Trắng', 100),
(609, 50, '29', 'Be', 100),
(610, 50, '30', 'Đen', 100),
(611, 50, '30', 'Trắng', 100),
(612, 50, '30', 'Be', 100),
(613, 50, '31', 'Đen', 100),
(614, 50, '31', 'Trắng', 100),
(615, 50, '31', 'Be', 100),
(616, 50, '32', 'Đen', 100),
(617, 50, '32', 'Trắng', 100),
(618, 50, '32', 'Be', 100),
(619, 51, '28', 'Đen', 100),
(620, 51, '28', 'Trắng', 100),
(621, 51, '28', 'Be', 100),
(622, 51, '29', 'Đen', 100),
(623, 51, '29', 'Trắng', 100),
(624, 51, '29', 'Be', 100),
(625, 51, '30', 'Đen', 100),
(626, 51, '30', 'Trắng', 100),
(627, 51, '30', 'Be', 100),
(628, 51, '31', 'Đen', 100),
(629, 51, '31', 'Trắng', 100),
(630, 51, '31', 'Be', 100),
(631, 51, '32', 'Đen', 100),
(632, 51, '32', 'Trắng', 100),
(633, 51, '32', 'Be', 100),
(634, 52, '28', 'Đen', 100),
(635, 52, '28', 'Trắng', 100),
(636, 52, '28', 'Be', 100),
(637, 52, '29', 'Đen', 100),
(638, 52, '29', 'Trắng', 100),
(639, 52, '29', 'Be', 100),
(640, 52, '30', 'Đen', 100),
(641, 52, '30', 'Trắng', 100),
(642, 52, '30', 'Be', 100),
(643, 52, '31', 'Đen', 100),
(644, 52, '31', 'Trắng', 100),
(645, 52, '31', 'Be', 100),
(646, 52, '32', 'Đen', 100),
(647, 52, '32', 'Trắng', 100),
(648, 52, '32', 'Be', 100),
(649, 53, '28', 'Đen', 100),
(650, 53, '28', 'Trắng', 100),
(651, 53, '28', 'Be', 100),
(652, 53, '29', 'Đen', 100),
(653, 53, '29', 'Trắng', 100),
(654, 53, '29', 'Be', 100),
(655, 53, '30', 'Đen', 100),
(656, 53, '30', 'Trắng', 100),
(657, 53, '30', 'Be', 100),
(658, 53, '31', 'Đen', 100),
(659, 53, '31', 'Trắng', 100),
(660, 53, '31', 'Be', 100),
(661, 53, '32', 'Đen', 100),
(662, 53, '32', 'Trắng', 100),
(663, 53, '32', 'Be', 100),
(664, 54, '28', 'Đen', 100),
(665, 54, '28', 'Trắng', 100),
(666, 54, '28', 'Be', 100),
(667, 54, '29', 'Đen', 100),
(668, 54, '29', 'Trắng', 100),
(669, 54, '29', 'Be', 100),
(670, 54, '30', 'Đen', 100),
(671, 54, '30', 'Trắng', 100),
(672, 54, '30', 'Be', 100),
(673, 54, '31', 'Đen', 100),
(674, 54, '31', 'Trắng', 100),
(675, 54, '31', 'Be', 100),
(676, 54, '32', 'Đen', 100),
(677, 54, '32', 'Trắng', 100),
(678, 54, '32', 'Be', 100),
(679, 55, '28', 'Đen', 100),
(680, 55, '28', 'Trắng', 100),
(681, 55, '28', 'Be', 100),
(682, 55, '29', 'Đen', 100),
(683, 55, '29', 'Trắng', 100),
(684, 55, '29', 'Be', 100),
(685, 55, '30', 'Đen', 100),
(686, 55, '30', 'Trắng', 100),
(687, 55, '30', 'Be', 100),
(688, 55, '31', 'Đen', 100),
(689, 55, '31', 'Trắng', 100),
(690, 55, '31', 'Be', 100),
(691, 55, '32', 'Đen', 100),
(692, 55, '32', 'Trắng', 100),
(693, 55, '32', 'Be', 100),
(694, 56, '28', 'Đen', 100),
(695, 56, '28', 'Trắng', 100),
(696, 56, '28', 'Be', 100),
(697, 56, '29', 'Đen', 100),
(698, 56, '29', 'Trắng', 100),
(699, 56, '29', 'Be', 100),
(700, 56, '30', 'Đen', 100),
(701, 56, '30', 'Trắng', 100),
(702, 56, '30', 'Be', 100),
(703, 56, '31', 'Đen', 100),
(704, 56, '31', 'Trắng', 100),
(705, 56, '31', 'Be', 100),
(706, 56, '32', 'Đen', 100),
(707, 56, '32', 'Trắng', 100),
(708, 56, '32', 'Be', 100),
(709, 57, '28', 'Đen', 100),
(710, 57, '28', 'Trắng', 100),
(711, 57, '28', 'Be', 100),
(712, 57, '29', 'Đen', 100),
(713, 57, '29', 'Trắng', 100),
(714, 57, '29', 'Be', 100),
(715, 57, '30', 'Đen', 100),
(716, 57, '30', 'Trắng', 100),
(717, 57, '30', 'Be', 100),
(718, 57, '31', 'Đen', 100),
(719, 57, '31', 'Trắng', 100),
(720, 57, '31', 'Be', 100),
(721, 57, '32', 'Đen', 100),
(722, 57, '32', 'Trắng', 100),
(723, 57, '32', 'Be', 100),
(724, 58, '28', 'Đen', 100),
(725, 58, '28', 'Trắng', 100),
(726, 58, '28', 'Be', 100),
(727, 58, '29', 'Đen', 100),
(728, 58, '29', 'Trắng', 100),
(729, 58, '29', 'Be', 100),
(730, 58, '30', 'Đen', 100),
(731, 58, '30', 'Trắng', 100),
(732, 58, '30', 'Be', 100),
(733, 58, '31', 'Đen', 100),
(734, 58, '31', 'Trắng', 100),
(735, 58, '31', 'Be', 100),
(736, 58, '32', 'Đen', 100),
(737, 58, '32', 'Trắng', 100),
(738, 58, '32', 'Be', 100),
(739, 59, '28', 'Đen', 100),
(740, 59, '28', 'Trắng', 100),
(741, 59, '28', 'Be', 100),
(742, 59, '29', 'Đen', 100),
(743, 59, '29', 'Trắng', 100),
(744, 59, '29', 'Be', 100),
(745, 59, '30', 'Đen', 100),
(746, 59, '30', 'Trắng', 100),
(747, 59, '30', 'Be', 100),
(748, 59, '31', 'Đen', 100),
(749, 59, '31', 'Trắng', 100),
(750, 59, '31', 'Be', 100),
(751, 59, '32', 'Đen', 100),
(752, 59, '32', 'Trắng', 100),
(753, 59, '32', 'Be', 100),
(754, 60, '28', 'Đen', 100),
(755, 60, '28', 'Trắng', 100),
(756, 60, '28', 'Be', 100),
(757, 60, '29', 'Đen', 100),
(758, 60, '29', 'Trắng', 100),
(759, 60, '29', 'Be', 100),
(760, 60, '30', 'Đen', 100),
(761, 60, '30', 'Trắng', 100),
(762, 60, '30', 'Be', 100),
(763, 60, '31', 'Đen', 100),
(764, 60, '31', 'Trắng', 100),
(765, 60, '31', 'Be', 100),
(766, 60, '32', 'Đen', 100),
(767, 60, '32', 'Trắng', 100),
(768, 60, '32', 'Be', 100),
(769, 61, '28', 'Đen', 100),
(770, 61, '28', 'Trắng', 100),
(771, 61, '28', 'Be', 100),
(772, 61, '29', 'Đen', 100),
(773, 61, '29', 'Trắng', 100),
(774, 61, '29', 'Be', 100),
(775, 61, '30', 'Đen', 100),
(776, 61, '30', 'Trắng', 100),
(777, 61, '30', 'Be', 100),
(778, 61, '31', 'Đen', 100),
(779, 61, '31', 'Trắng', 100),
(780, 61, '31', 'Be', 100),
(781, 61, '32', 'Đen', 100),
(782, 61, '32', 'Trắng', 100),
(783, 61, '32', 'Be', 100),
(784, 62, '28', 'Đen', 100),
(785, 62, '28', 'Trắng', 100),
(786, 62, '28', 'Be', 100),
(787, 62, '29', 'Đen', 100),
(788, 62, '29', 'Trắng', 100),
(789, 62, '29', 'Be', 100),
(790, 62, '30', 'Đen', 100),
(791, 62, '30', 'Trắng', 100),
(792, 62, '30', 'Be', 100),
(793, 62, '31', 'Đen', 100),
(794, 62, '31', 'Trắng', 100),
(795, 62, '31', 'Be', 100),
(796, 62, '32', 'Đen', 100),
(797, 62, '32', 'Trắng', 100),
(798, 62, '32', 'Be', 100),
(799, 63, '28', 'Đen', 100),
(800, 63, '28', 'Trắng', 100),
(801, 63, '28', 'Be', 100),
(802, 63, '29', 'Đen', 100),
(803, 63, '29', 'Trắng', 100),
(804, 63, '29', 'Be', 100),
(805, 63, '30', 'Đen', 100),
(806, 63, '30', 'Trắng', 100),
(807, 63, '30', 'Be', 100),
(808, 63, '31', 'Đen', 100),
(809, 63, '31', 'Trắng', 100),
(810, 63, '31', 'Be', 100),
(811, 63, '32', 'Đen', 100),
(812, 63, '32', 'Trắng', 100),
(813, 63, '32', 'Be', 100),
(814, 64, '28', 'Đen', 100),
(815, 64, '28', 'Trắng', 100),
(816, 64, '28', 'Be', 100),
(817, 64, '29', 'Đen', 100),
(818, 64, '29', 'Trắng', 100),
(819, 64, '29', 'Be', 100),
(820, 64, '30', 'Đen', 100),
(821, 64, '30', 'Trắng', 100),
(822, 64, '30', 'Be', 100),
(823, 64, '31', 'Đen', 100),
(824, 64, '31', 'Trắng', 100),
(825, 64, '31', 'Be', 100),
(826, 64, '32', 'Đen', 100),
(827, 64, '32', 'Trắng', 100),
(828, 64, '32', 'Be', 100),
(829, 65, '28', 'Đen', 100),
(830, 65, '28', 'Trắng', 100),
(831, 65, '28', 'Be', 100),
(832, 65, '29', 'Đen', 100),
(833, 65, '29', 'Trắng', 100),
(834, 65, '29', 'Be', 100),
(835, 65, '30', 'Đen', 100),
(836, 65, '30', 'Trắng', 100),
(837, 65, '30', 'Be', 100),
(838, 65, '31', 'Đen', 100),
(839, 65, '31', 'Trắng', 100),
(840, 65, '31', 'Be', 100),
(841, 65, '32', 'Đen', 100),
(842, 65, '32', 'Trắng', 100),
(843, 65, '32', 'Be', 100),
(844, 66, '28', 'Đen', 100),
(845, 66, '28', 'Trắng', 100),
(846, 66, '28', 'Be', 100),
(847, 66, '29', 'Đen', 100),
(848, 66, '29', 'Trắng', 100),
(849, 66, '29', 'Be', 100),
(850, 66, '30', 'Đen', 100),
(851, 66, '30', 'Trắng', 100),
(852, 66, '30', 'Be', 100),
(853, 66, '31', 'Đen', 100),
(854, 66, '31', 'Trắng', 100),
(855, 66, '31', 'Be', 100),
(856, 66, '32', 'Đen', 100),
(857, 66, '32', 'Trắng', 100),
(858, 66, '32', 'Be', 100),
(859, 67, '28', 'Đen', 100),
(860, 67, '28', 'Trắng', 100),
(861, 67, '28', 'Be', 100),
(862, 67, '29', 'Đen', 100),
(863, 67, '29', 'Trắng', 100),
(864, 67, '29', 'Be', 100),
(865, 67, '30', 'Đen', 100),
(866, 67, '30', 'Trắng', 100),
(867, 67, '30', 'Be', 100),
(868, 67, '31', 'Đen', 100),
(869, 67, '31', 'Trắng', 100),
(870, 67, '31', 'Be', 100),
(871, 67, '32', 'Đen', 100),
(872, 67, '32', 'Trắng', 100),
(873, 67, '32', 'Be', 100),
(874, 68, '28', 'Đen', 100),
(875, 68, '28', 'Trắng', 100),
(876, 68, '28', 'Be', 100),
(877, 68, '29', 'Đen', 100),
(878, 68, '29', 'Trắng', 100),
(879, 68, '29', 'Be', 100),
(880, 68, '30', 'Đen', 100),
(881, 68, '30', 'Trắng', 100),
(882, 68, '30', 'Be', 100),
(883, 68, '31', 'Đen', 100),
(884, 68, '31', 'Trắng', 100),
(885, 68, '31', 'Be', 100),
(886, 68, '32', 'Đen', 100),
(887, 68, '32', 'Trắng', 100),
(888, 68, '32', 'Be', 100),
(889, 69, '28', 'Đen', 100),
(890, 69, '28', 'Trắng', 100),
(891, 69, '28', 'Be', 100),
(892, 69, '29', 'Đen', 100),
(893, 69, '29', 'Trắng', 100),
(894, 69, '29', 'Be', 100),
(895, 69, '30', 'Đen', 100),
(896, 69, '30', 'Trắng', 100),
(897, 69, '30', 'Be', 100),
(898, 69, '31', 'Đen', 100),
(899, 69, '31', 'Trắng', 100),
(900, 69, '31', 'Be', 100),
(901, 69, '32', 'Đen', 100),
(902, 69, '32', 'Trắng', 100),
(903, 69, '32', 'Be', 100),
(904, 70, '28', 'Đen', 100),
(905, 70, '28', 'Trắng', 100),
(906, 70, '28', 'Be', 100),
(907, 70, '29', 'Đen', 100),
(908, 70, '29', 'Trắng', 100),
(909, 70, '29', 'Be', 100),
(910, 70, '30', 'Đen', 100),
(911, 70, '30', 'Trắng', 100),
(912, 70, '30', 'Be', 100),
(913, 70, '31', 'Đen', 100),
(914, 70, '31', 'Trắng', 100),
(915, 70, '31', 'Be', 100),
(916, 70, '32', 'Đen', 100),
(917, 70, '32', 'Trắng', 100),
(918, 70, '32', 'Be', 100),
(919, 71, '28', 'Đen', 100),
(920, 71, '28', 'Trắng', 100),
(921, 71, '28', 'Be', 100),
(922, 71, '29', 'Đen', 100),
(923, 71, '29', 'Trắng', 100),
(924, 71, '29', 'Be', 100),
(925, 71, '30', 'Đen', 100),
(926, 71, '30', 'Trắng', 100),
(927, 71, '30', 'Be', 100),
(928, 71, '31', 'Đen', 100),
(929, 71, '31', 'Trắng', 100),
(930, 71, '31', 'Be', 100),
(931, 71, '32', 'Đen', 100),
(932, 71, '32', 'Trắng', 100),
(933, 71, '32', 'Be', 100);

-- --------------------------------------------------------

--
-- Table structure for table `roles`
--

CREATE TABLE `roles` (
  `id` int(11) NOT NULL,
  `name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `roles`
--

INSERT INTO `roles` (`id`, `name`) VALUES
(1, 'Admin'),
(2, 'Nhân viên'),
(3, 'Khách hàng');

-- --------------------------------------------------------

--
-- Table structure for table `sizes`
--

CREATE TABLE `sizes` (
  `id` int(11) NOT NULL,
  `size` varchar(10) NOT NULL,
  `soluong` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `sliders`
--

CREATE TABLE `sliders` (
  `id` int(11) NOT NULL,
  `image` varchar(100) NOT NULL,
  `title` varchar(100) NOT NULL,
  `content` varchar(100) NOT NULL,
  `active` int(11) NOT NULL DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `sliders`
--

INSERT INTO `sliders` (`id`, `image`, `title`, `content`, `active`) VALUES
(1, 'assets/photos/slide1.jpg', '', '', 1),
(2, 'assets/photos/slide2.jpg', '', '', 1),
(3, 'assets/photos/slide3.jpg', '', '', 1),
(4, 'assets/photos/slide4.png', '', '', 1);

-- --------------------------------------------------------

--
-- Table structure for table `tokens`
--

CREATE TABLE `tokens` (
  `user_id` int(11) NOT NULL,
  `token` varchar(32) NOT NULL,
  `created_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `tokens`
--

INSERT INTO `tokens` (`user_id`, `token`, `created_at`) VALUES
(1, 'ca655bf163fb9394fde41999739368cc', '2025-05-21 13:26:03'),
(1, 'e51da40dae9cf88fd3f5fe08033b5071', '2025-05-21 15:06:37');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` int(11) NOT NULL,
  `fullname` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `phone_number` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `address` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `password` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `role_id` int(11) NOT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  `deleted` int(11) NOT NULL DEFAULT 0,
  `avatar` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `fullname`, `email`, `phone_number`, `address`, `password`, `role_id`, `created_at`, `updated_at`, `deleted`, `avatar`) VALUES
(1, 'Vũ Duy Quang', 'quangadmin@gmail.com', '0365535178', 'Vĩnh Tường- Vĩnh Phúc', 'e6a109a81bb3c1c4a7f63fbfe4f1c48f', 1, '2025-05-21 13:25:58', '2025-05-21 13:25:58', 0, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `users_khach`
--

CREATE TABLE `users_khach` (
  `id` int(11) NOT NULL,
  `name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `phone` varchar(11) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `address` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `password` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `role` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `users_khach`
--

INSERT INTO `users_khach` (`id`, `name`, `email`, `phone`, `address`, `password`, `role`) VALUES
(1, 'Vũ Duy Quang', 'quanguser@gmail.com', '0365535178', 'Vĩnh Tường- Vĩnh Phúc', '123456', 3);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `brands`
--
ALTER TABLE `brands`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `carts`
--
ALTER TABLE `carts`
  ADD PRIMARY KEY (`id`),
  ADD KEY `product_id` (`product_id`);

--
-- Indexes for table `categories`
--
ALTER TABLE `categories`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `feedback`
--
ALTER TABLE `feedback`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `gallery`
--
ALTER TABLE `gallery`
  ADD PRIMARY KEY (`id`),
  ADD KEY `product_id` (`product_id`);

--
-- Indexes for table `orders`
--
ALTER TABLE `orders`
  ADD PRIMARY KEY (`id`),
  ADD KEY `orders_ibfk_1` (`user_id`);

--
-- Indexes for table `order_details`
--
ALTER TABLE `order_details`
  ADD PRIMARY KEY (`id`),
  ADD KEY `order_id` (`order_id`),
  ADD KEY `product_id` (`product_id`);

--
-- Indexes for table `products`
--
ALTER TABLE `products`
  ADD PRIMARY KEY (`id`),
  ADD KEY `category_id` (`category_id`);

--
-- Indexes for table `product_variants`
--
ALTER TABLE `product_variants`
  ADD PRIMARY KEY (`id`),
  ADD KEY `product_id` (`product_id`);

--
-- Indexes for table `roles`
--
ALTER TABLE `roles`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `sizes`
--
ALTER TABLE `sizes`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `sliders`
--
ALTER TABLE `sliders`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tokens`
--
ALTER TABLE `tokens`
  ADD PRIMARY KEY (`user_id`,`token`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD KEY `role_id` (`role_id`);

--
-- Indexes for table `users_khach`
--
ALTER TABLE `users_khach`
  ADD PRIMARY KEY (`id`),
  ADD KEY `role` (`role`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `brands`
--
ALTER TABLE `brands`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `carts`
--
ALTER TABLE `carts`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `categories`
--
ALTER TABLE `categories`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT for table `feedback`
--
ALTER TABLE `feedback`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `gallery`
--
ALTER TABLE `gallery`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `orders`
--
ALTER TABLE `orders`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=62;

--
-- AUTO_INCREMENT for table `order_details`
--
ALTER TABLE `order_details`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `products`
--
ALTER TABLE `products`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=72;

--
-- AUTO_INCREMENT for table `product_variants`
--
ALTER TABLE `product_variants`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=934;

--
-- AUTO_INCREMENT for table `roles`
--
ALTER TABLE `roles`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `sizes`
--
ALTER TABLE `sizes`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `sliders`
--
ALTER TABLE `sliders`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `users_khach`
--
ALTER TABLE `users_khach`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `carts`
--
ALTER TABLE `carts`
  ADD CONSTRAINT `carts_ibfk_1` FOREIGN KEY (`product_id`) REFERENCES `product_variants` (`product_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `gallery`
--
ALTER TABLE `gallery`
  ADD CONSTRAINT `gallery_ibfk_1` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`);

--
-- Constraints for table `orders`
--
ALTER TABLE `orders`
  ADD CONSTRAINT `orders_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users_khach` (`id`);

--
-- Constraints for table `order_details`
--
ALTER TABLE `order_details`
  ADD CONSTRAINT `order_details_ibfk_1` FOREIGN KEY (`order_id`) REFERENCES `orders` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `order_details_ibfk_2` FOREIGN KEY (`product_id`) REFERENCES `product_variants` (`product_id`) ON UPDATE CASCADE;

--
-- Constraints for table `products`
--
ALTER TABLE `products`
  ADD CONSTRAINT `products_ibfk_1` FOREIGN KEY (`category_id`) REFERENCES `categories` (`id`);

--
-- Constraints for table `product_variants`
--
ALTER TABLE `product_variants`
  ADD CONSTRAINT `product_variants_ibfk_1` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`);

--
-- Constraints for table `users`
--
ALTER TABLE `users`
  ADD CONSTRAINT `users_ibfk_1` FOREIGN KEY (`role_id`) REFERENCES `roles` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `users_khach`
--
ALTER TABLE `users_khach`
  ADD CONSTRAINT `users_khach_ibfk_1` FOREIGN KEY (`role`) REFERENCES `roles` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
