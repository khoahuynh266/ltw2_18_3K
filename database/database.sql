-- phpMyAdmin SQL Dump
-- version 4.7.4
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1:3306
-- Generation Time: Jan 09, 2018 at 04:42 AM
-- Server version: 5.7.19
-- PHP Version: 5.6.31

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `ban_hang`
--

-- --------------------------------------------------------

--
-- Table structure for table `chi_tiet_don_hang`
--

DROP TABLE IF EXISTS `chi_tiet_don_hang`;
CREATE TABLE IF NOT EXISTS `chi_tiet_don_hang` (
  `id_donhang` int(11) UNSIGNED NOT NULL AUTO_INCREMENT,
  `id_sanpham` int(11) UNSIGNED NOT NULL,
  `soluong` int(11) NOT NULL COMMENT 'số lượng',
  `giaban` double NOT NULL,
  `giatien` int(11) NOT NULL,
  PRIMARY KEY (`id_donhang`,`id_sanpham`) USING BTREE,
  KEY `id_sanpham` (`id_sanpham`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `don_hang`
--

DROP TABLE IF EXISTS `don_hang`;
CREATE TABLE IF NOT EXISTS `don_hang` (
  `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT,
  `id_nguoidung` int(11) UNSIGNED NOT NULL,
  `tongsp` int(11) DEFAULT NULL COMMENT 'tổng số sản phẩm',
  `tongtien` int(11) DEFAULT NULL COMMENT 'tổng giá trị',
  `trangthai` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  KEY `id_nguoidung` (`id_nguoidung`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `gio_hang`
--

DROP TABLE IF EXISTS `gio_hang`;
CREATE TABLE IF NOT EXISTS `gio_hang` (
  `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT,
  `id_nguoidung` int(11) UNSIGNED NOT NULL,
  `id_sanpham` int(11) UNSIGNED NOT NULL,
  `soluong` int(11) NOT NULL,
  `tinhtrang` int(11) NOT NULL DEFAULT '0',
  `tinhtrangdonhang` int(11) DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `id_nguoidung` (`id_nguoidung`),
  KEY `id_sanpham` (`id_sanpham`)
) ENGINE=InnoDB AUTO_INCREMENT=104 DEFAULT CHARSET=utf32 COLLATE=utf32_unicode_ci;

--
-- Dumping data for table `gio_hang`
--

INSERT INTO `gio_hang` (`id`, `id_nguoidung`, `id_sanpham`, `soluong`, `tinhtrang`, `tinhtrangdonhang`) VALUES
(10, 1, 2, 3, 1, 0),
(84, 4, 2, 1, 1, 0),
(102, 4, 2, 1, 0, 0),
(103, 4, 24, 1, 0, 0);

-- --------------------------------------------------------

--
-- Table structure for table `loai_san_pham`
--

DROP TABLE IF EXISTS `loai_san_pham`;
CREATE TABLE IF NOT EXISTS `loai_san_pham` (
  `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT,
  `ten_loai` varchar(100) CHARACTER SET utf8 NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf32 COLLATE=utf32_unicode_ci;

--
-- Dumping data for table `loai_san_pham`
--

INSERT INTO `loai_san_pham` (`id`, `ten_loai`) VALUES
(1, 'Điện thoại'),
(2, 'LapTop'),
(3, 'Máy tính bảng');

-- --------------------------------------------------------

--
-- Table structure for table `nha_san_xuat`
--

DROP TABLE IF EXISTS `nha_san_xuat`;
CREATE TABLE IF NOT EXISTS `nha_san_xuat` (
  `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT,
  `ten_nsx` varchar(50) CHARACTER SET utf8 NOT NULL,
  `diachi` varchar(100) CHARACTER SET utf8 NOT NULL,
  `email` text CHARACTER SET utf8,
  `phone` varchar(16) COLLATE utf8_unicode_ci DEFAULT NULL,
  `images` varchar(256) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `nha_san_xuat`
--

INSERT INTO `nha_san_xuat` (`id`, `ten_nsx`, `diachi`, `email`, `phone`, `images`) VALUES
(1, 'SamSung', 'Seoul, Hàn Quốc', 'support@samsung.vn', '1800 588 890', 'images/SamSung.jpg'),
(2, 'Oppo', 'Đông Hoản, Trung Quốc', 'service@oppo.vn', '(028)38229844', 'images/Oppo.jpg'),
(3, 'Apple', 'Cupertino, California', 'support@Apple.com', '358 63 53 47 005', 'images/apple.jpg'),
(4, 'Sony', 'Minato, Tokyo, Tōkyō, Nhật Bản', 'support@Sony.vn', '180 058 885', 'images/sony.jpg'),
(5, 'Dell', 'Round Rock, Texas, Hoa Kỳ', 'support@dell.com', '358 11 44 88 000', 'images/Dell/dell.jpg'),
(6, 'HP', 'Palo Alto, California, Hoa Kỳ', 'support@HP.vn', '1900 555567', 'images/HP/hp.jpg'),
(7, 'Acer', 'Tân Bắc, Đài Loan', 'support@Acer.com', '351 04 48 80 003', 'images/Acer/acer.jpg');

-- --------------------------------------------------------

--
-- Table structure for table `san_pham`
--

DROP TABLE IF EXISTS `san_pham`;
CREATE TABLE IF NOT EXISTS `san_pham` (
  `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT,
  `tensp` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `loai` int(11) UNSIGNED NOT NULL,
  `id_nsx` int(11) UNSIGNED NOT NULL,
  `gia` int(11) DEFAULT NULL,
  `soluong` int(11) DEFAULT NULL,
  `mota` text COLLATE utf8_unicode_ci NOT NULL,
  `image` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `xuatsu` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `luotxem` int(11) NOT NULL,
  `daban` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `loai` (`loai`),
  KEY `id_nsx` (`id_nsx`)
) ENGINE=InnoDB AUTO_INCREMENT=76 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `san_pham`
--

INSERT INTO `san_pham` (`id`, `tensp`, `loai`, `id_nsx`, `gia`, `soluong`, `mota`, `image`, `xuatsu`, `created_at`, `luotxem`, `daban`) VALUES
(1, 'Điện thoại Samsung Galaxy Note 8', 1, 1, 22490000, 100, 'Galaxy Note 8 là niềm hy vọng vực lại dòng Note danh tiếng của Samsung với diện mạo nam tính, sang trọng. Trang bị camera kép xóa phông thời thượng, màn hình vô cực như trên S8 Plus, bút Spen với nhiều tính năng mới và nhiều công nghệ được Samsung ưu ái đem lên Note 8.', 'images/1.jpg', 'Việt Nam', '2017-12-26 10:00:00', 1234, 0),
(2, 'Điện thoại Samsung Galaxy S8 Plus', 1, 1, 20490000, 100, 'Galaxy S8 và S8 Plus hiện đang là chuẩn mực smartphone về thiết kế trong tương lai', 'images/2.jpg', 'Việt Nam', '2017-12-26 10:00:00', 1234, 0),
(3, 'Điện thoại Samsung Galaxy S8', 1, 1, 18490000, 100, 'Galaxy S8 và S8 Plus hiện đang là chuẩn mực smartphone về thiết kế trong tương lai', 'images/3.jpg', 'Việt Nam', '2017-12-26 10:00:00', 1234, 0),
(4, 'Điện thoại Samsung Galaxy Note FE', 1, 1, 13990000, 100, 'Đúng như tên gọi, Samsung Galaxy Note FE (Fan Edition) được ra mắt dành cho các fan trung thành của dòng sản phẩm này, thuộc phân khúc cao cấp, Note FE trang bị những tính năng hàng đầu, giá tốt', 'images/4.jpg', 'Việt Nam', '2017-12-26 10:00:00', 1234, 0),
(5, 'Điện thoại Samsung Galaxy ', 1, 1, 10990000, 100, 'Camera selfie kép chuyên nghiệpThiết kế hoàn hảo trong lòng bàn tayChuẩn kháng nước và bụi đỉnh cao', 'images/5.jpg', 'Việt Nam', '2017-12-26 10:00:00', 1234, 0),
(6, 'Điện thoại Samsung Galaxy A8+ (2018)', 1, 1, 13490000, 100, 'Camera selfie kép chuyên nghiệpThiết kế hoàn hảo trong lòng bàn tayChuẩn kháng nước và bụi đỉnh cao', 'images/6.jpg', 'Việt Nam', '2017-12-26 10:00:00', 1234, 0),
(7, 'Điện thoại Samsung Galaxy A7 (2017)', 1, 1, 9990000, 100, 'Samsung Galaxy A7 (2017) tạo bước đột phá cho dòng A với thiết kế sang trọng và đẳng cấp, cấu hình mạnh mẽ, nhiều tiện ích cao cấp', 'images/7.jpg', 'Việt Nam', '2017-12-26 10:00:00', 1234, 0),
(8, 'Điện thoại Samsung Galaxy C9 Pro', 1, 1, 9990000, 100, 'Samsung Galaxy C9 Pro gây được sự chú ý cho người dùng bởi nó sở hữu mức RAM lên tới 6 GB, lần đầu tiên có một chiếc Galaxy đến từ Samsung sở hữu mức RAM đó', 'images/8.jpg', 'Việt Nam', '2017-12-26 10:00:00', 1234, 0),
(9, 'Điện thoại Samsung Galaxy J7+', 1, 1, 8690000, 100, 'Samsung Galaxy J7+ là dòng smartphone tầm trung nhưng được trang bị camera kép có khả năng chụp ảnh xóa phông chân dung cùng thiết kế đẹp và hiệu năng mạnh mẽ', 'images/9.jpg', 'Việt Nam', '2017-12-26 10:00:00', 1234, 0),
(10, 'Điện thoại Samsung Galaxy A5 (2017)', 1, 1, 7990000, 100, 'Đẳng cấp, sang trọng, dẫn đầu xu thế là những từ ngữ chuẩn xác để miêu tả về điện thoại Samsung Galaxy A5(2017)', 'images/10.jpg', 'Việt Nam', '2017-12-26 10:00:00', 1234, 0),
(11, 'Điện thoại Oppo F5', 1, 2, 6990000, 100, 'OPPO F5, chuyên gia selfie mới nổi bật với màn hình tràn cạnh thời trang và camera tích hợp trí tuệ nhân tạo AI để càng chụp càng đẹp', 'images/11.jpg', 'Việt Nam', '2017-12-26 10:00:00', 1234, 0),
(12, 'Điện thoại OPPO F3 Plus', 1, 2, 10690000, 100, 'Sau sự thành công của F1 Plus, OPPO F3 Plus đang được người dùng quan tâm yêu thích với cụm camera selfie kép, công nghệ chụp thiếu sáng đỉnh cao, cấu hình mạnh mẽ và tất nhiên đó là thiết kế nguyên khối quá ư là sang trọng', 'images/12.jpg', 'Việt Nam', '2017-12-26 10:00:00', 1234, 0),
(13, 'Điện thoại OPPO F5 6GB', 1, 2, 8990000, 100, 'OPPO F5 6GB là phiên bản nâng cấp cấu hình của chiếc OPPO F5, chuyên gia selfie làm đẹp thông minh và màn hình tràn viền tuyệt đẹp', 'images/13.jpg', 'Việt Nam', '2017-12-26 10:00:00', 1234, 0),
(14, 'Điện thoại OPPO F5 Youth', 1, 2, 6190000, 100, 'OPPO F5 Youth, phiên bản giá rẻ của chuyên gia selfie, màn hình tràn cạnh OPPO F5 với thiết kế và tính năng hoàn toàn tương đương nhưng thông số cấu mình phần cứng kém hơn một chút', 'images/14.jpg', 'Việt Nam', '2017-12-26 10:00:00', 1234, 0),
(15, 'Điện thoại OPPO F3 Lite (A57)', 1, 2, 5490000, 100, 'OPPO A57 là phiên bản rút gọn của Oppo F1s có mức giá dễ chịu hơn nhưng vẫn cho những trải nghiệm gần như tương đương', 'images/15.jpg', 'Việt Nam', '2017-12-26 10:00:00', 1234, 0),
(16, 'Điện thoại iPhone X 256GB', 1, 3, 34790000, 100, 'iPhone X mang trên mình thiết kế hoàn toàn mới với màn hình Super Retina viền cực mỏng và trang bị nhiều công nghệ hiện đại như nhận diện khuôn mặt Face ID, sạc pin nhanh và sạc không dây cùng khả năng chống nước bụi cao cấp', 'images/16.jpg', 'Việt Nam', '2017-12-26 10:00:00', 1234, 0),
(17, 'Điện thoại iPhone X 64GB', 1, 3, 29990000, 100, '\"iPhone X giá\" là cụm từ được rất nhiều người mong chờ và tìm kiếm trên Google bởi đây là chiếc điện thoại mà Apple kỉ niệm 10 năm iPhone đầu tiên được bán ra', 'images/17.jpg', 'Việt Nam', '2017-12-26 10:00:00', 1234, 0),
(18, 'Điện thoại iPhone 8 Plus 256GB', 1, 3, 28790000, 100, 'iPhone 8 Plus là bản nâng cấp nhẹ của chiếc iPhone 7 Plus đã ra mắt trước đó với cấu hình mạnh mẽ cùng camera có nhiều cải tiến', 'images/18.jpg', 'Việt Nam', '2017-12-26 10:00:00', 1234, 0),
(19, 'Điện thoại iPhone 8 256GB', 1, 3, 25790000, 100, 'iPhone 8 là bản nâng cấp nhẹ của chiếc iPhone 7 đã ra mắt trước đó với cấu hình mạnh mẽ cùng camera có nhiều cải tiến', 'images/19.jpg', 'Việt Nam', '2017-12-26 10:00:00', 1234, 0),
(20, 'Điện thoại iPhone 8 Plus 64GB', 1, 3, 23990000, 200, 'Thừa hưởng thiết kế đã đạt đến độ chuẩn mực, thế hệ iPhone 8 Plus thay đổi phong cách bóng bẩy hơn và bổ sung hàng loạt tính năng cao cấp cho trải nghiệm sử dụng vô cùng tuyệt vờ', 'images/20.jpg', 'Việt Nam', '2017-12-26 10:00:00', 1234, 0),
(21, 'Điện thoại iPhone 7 Plus 256GB', 1, 3, 23990000, 100, 'Với thiết kế không quá nhiều thay đổi, vẫn bảo tồn vẻ đẹp truyền thống từ thời iPhone 6 Plus,  iPhone 7 Plus được trang bị nhiều nâng cấp đáng giá như camera kép, đạt chuẩn chống nước chống bụi cùng cấu hình cực mạnh', 'images/21.jpg', 'Việt Nam', '2017-12-26 10:00:00', 1234, 0),
(22, 'Điện thoại iPhone 7 Plus Red 256GB', 1, 3, 23990000, 100, 'iPhone 7 Plus Red 256GB là phiên bản iPhone 7 Plus mới được Apple giới thiệu với màu sắc mới là màu Red nhằm kỉ niệm 10 năm hợp tác giữa Apple và (RED) – một tổ chức gây quỹ hỗ trợ phòng chống AIDS', 'images/22.jpg', 'Việt Nam', '2017-12-26 10:00:00', 1234, 0),
(23, 'Điện thoại iPhone 7 Plus 128GB', 1, 3, 22990000, 100, 'Với thiết kế không quá nhiều thay đổi, vẫn bảo tồn vẻ đẹp truyền thống từ thời iPhone 6 Plus,  iPhone 7 Plus được trang bị nhiều nâng cấp đáng giá như camera kép, đạt chuẩn chống nước chống bụi cùng cấu hình cực mạnh', 'images/23.jpg', 'Việt Nam', '2017-12-26 10:00:00', 1234, 0),
(24, 'Điện thoại iPhone 8 64GB', 1, 3, 20990000, 200, 'iPhone 8 64GB nổi bật với điểm nhấn mặt lưng kính kết hợp cạnh viền và mặt trước giữ nguyên thiết kế như iPhone 7, cùng với đó là hàng loạt công nghệ đáng mong đợi như sạc nhanh, không dây hay hỗ trợ thực tế ảo AR', 'images/24.jpg', 'Việt Nam', '2017-12-26 10:00:00', 1234, 0),
(25, 'Điện thoại iPhone 7 Plus 32GB', 1, 3, 19990000, 100, 'Với thiết kế không quá nhiều thay đổi, vẫn bảo tồn vẻ đẹp truyền thống từ thời iPhone 6 Plus,  iPhone 7 Plus 32GB được trang bị nhiều nâng cấp đáng giá như camera kép, đạt chuẩn chống nước chống bụi cùng cấu hình cực mạnh', 'images/25.jpg', 'Việt Nam', '2017-12-26 10:00:00', 1234, 0),
(26, 'Điện thoại iPhone 7 256GB', 1, 3, 19990000, 200, 'iPhone 7 256 GB mang trên mình thiết kế quen thuộc từ thời iPhone 6, máy được trang bị bộ nhớ lưu trữ lớn, khả năng chống nước cao cấp, dàn loa stereo cho âm thanh hay và cấu hình cực mạnh', 'images/26.jpg', 'Việt Nam', '2017-12-26 10:00:00', 1234, 0),
(27, 'Điện thoại iPhone 7 128GB', 1, 3, 18990000, 200, 'iPhone 7 128 GB mang trên mình thiết kế quen thuộc từ thời iPhone 6, máy được trang bị bộ nhớ lưu trữ lớn, khả năng chống nước cao cấp, dàn loa stereo cho âm thanh hay và cấu hình cực mạnh', 'images/27.jpg', 'Việt Nam', '2017-12-26 10:00:00', 1234, 0),
(28, 'Điện thoại iPhone 6s 128GB', 1, 3, 16990000, 200, 'iPhone 6s xứng đáng là phiên bản nâng cấp hoàn hảo từ iPhone 6 với nhiều tính năng mới hấp dẫn', 'images/28.jpg', 'Việt Nam', '2017-12-26 10:00:00', 1234, 0),
(29, 'Điện thoại iPhone 7 32GB', 1, 3, 15990000, 200, 'iPhone 7 32 GB vẫn mang trên mình thiết kế quen thuộc của từ thời iPhone 6 nhưng có nhiều thay đổi lớn về phần cứng như trang bị khả năng chống nước, dàn loa stereo và cấu hình cực mạnh', 'images/29.jpg', 'Việt Nam', '2017-12-26 10:00:00', 1234, 0),
(30, 'Điện thoại iPhone 6s Plus 32GB', 1, 3, 13990000, 200, 'iPhone 6s Plus 32 GB là phiên bản nâng cấp hoàn hảo từ iPhone 6 Plus với nhiều tính năng mới hấp dẫn', 'images/30.jpg', 'Việt Nam', '2017-12-26 10:00:00', 1234, 0),
(31, 'Điện thoại iPhone 6 32GB', 1, 3, 8490000, 100, 'iPhone 6 là một trong những smartphone được yêu thích nhất của Apple. Lắng nghe nhu cầu về thiết kế, khả năng lưu trữ và giá cả, iPhone 6 32GB được chính thức phân phối chính hãng tại Việt Nam hứa hẹn sẽ là một sản phẩm rất Hot', 'images/31.jpg', 'Việt Nam', '2017-12-26 10:00:00', 1234, 0),
(32, 'Điện thoại iPhone 5S 16GB', 1, 3, 5990000, 100, 'Thiết kế sang trọng, gia công tỉ mỉ, tích hợp cảm biến vân tay cao cấp hơn, camera cho hình ảnh đẹp và sáng hơn.', 'images/32.jpg', 'Việt Nam', '2017-12-26 10:00:00', 1234, 0),
(33, 'Điện thoại Sony Xperia XZ Premium', 1, 4, 17990000, 100, 'Sony Xperia XZ Premium là flagship của Sony trong năm 2017 với vẻ ngoài hào nhoáng, màn hình cao cấp cũng nhiều trang bị hàng đầu khác.', 'images/33.jpg', 'Việt Nam', '2017-12-26 10:00:00', 1234, 0),
(34, 'Điện thoại Sony Xperia XZ Premium Pink Gold', 1, 4, 16490000, 200, 'Sony Xperia XZ Premium Pink Gold là một phiên bản khác của chiếc Sony Xperia XZ Premium với khác biệt duy nhất đến từ màu Pink Gold quyến rũ.', 'images/34.jpg', 'Việt Nam', '2017-12-26 10:00:00', 1234, 0),
(35, 'Điện thoại Sony Xperia XZ1', 1, 4, 15990000, 100, 'Sony Xperia XZ1 là mẫu flagship kế tiếp của Sony tiếp nối sự thành công của chiếc Xperia XZs đã ra mắt trước đó với những nâng cấp nhẹ về mặt cấu hình và thiết kế.', 'images/35.jpg', 'Việt Nam', '2017-12-26 10:00:00', 1234, 0),
(36, 'Điện thoại Sony Xperia XZs', 1, 4, 12990000, 200, 'Sony Xperia XZs là smartphone được Sony đầu tư mạnh mẽ về camera với hàng loạt các trang bị cao cấp và sở hữu cho mình một mức giá bán hợp lý với người tiêu dùng.', 'images/36.jpg', 'Việt Nam', '2017-12-26 10:00:00', 1234, 0),
(37, 'Điện thoại Sony Xperia XZ Dual', 1, 4, 9990000, 200, 'Sony Xperia XZ với thiết kế cực đẹp, cùng camera chất lượng hơn, nhiều tính năng tiện ích hơn.', 'images/37.jpg', 'Việt Nam', '2017-12-26 10:00:00', 1234, 0),
(38, 'Điện thoại Sony Xperia XA1 Ultra', 1, 4, 8490000, 200, 'Kế nhiệm sự thành công của phablet không viền Sony Xperia XA Ultra thì Sony giới thiệu phiên bản XA1 Ultra với nhiều cải tiến đáng giá.', 'images/38.jpg', 'Việt Nam', '2017-12-26 10:00:00', 1234, 0),
(39, 'Điện thoại Sony Xperia XA1 Ultra Pink', 1, 3, 7490000, 200, 'Sau một thời gian xuất hiện tại Việt Nam và nhận được nhiều sự quan tâm từ người dùng thì mới đây Sony đã tung ra phiên bản màu hồng cho chiếc Sony Xperia XA1 Ultra để phục vụ riêng cho \"phái đẹp\".', 'images/39.jpg', 'Việt Nam', '2017-12-26 10:00:00', 1234, 0),
(40, 'Điện thoại Sony Xperia X', 1, 3, 7490000, 200, 'Sony vừa giới thiệu dòng sản phẩm X Serie mới của hãng trong năm 2016 tại triển lãm MWC. Xperia X là chiếc smartphone tầm trung mới với nhiều điểm nhấn đáng chú ý.', 'images/40.jpg', 'Việt Nam', '2017-12-26 10:00:00', 1234, 0),
(41, 'Máy tính bảng Samsung Galaxy Book 10.6 inch', 3, 1, 19990000, 400, 'Samsung Galaxy Book 10.6 inch là mẫu tablet 2 trong 1 chạy trên nền tảng Windows 10 nhưng vẫn sở hữu cho mình cây bút Spen thần thánh.', 'images/41.jpg', 'Việt Nam', '0000-00-00 00:00:00', 56, 0),
(42, 'Máy tính bảng Samsung Galaxy Tab A6 10.1 Spen', 3, 1, 7990000, 100, 'Tiếp nối sự thành công của chiếc Samsung Galaxy Tab A thì mới đây Samsung đã giới thiệu phiên bản cải tiến là chiếc Galaxy Tab A6 10.1 với nhiều nâng cấp đáng giá về cấu hình và thiết kế.', 'images/42.jpg', 'Việt Nam', '2017-12-26 10:00:00', 54, 0),
(43, 'Máy tính bảng Samsung Galaxy Tab A 8.0 (2017)', 3, 1, 6490000, 100, 'Samsung Galaxy Tab A 8.0 (2017) mới có màn hình tỉ lệ 4:3 với không gian hiển thị rộng thông minh cho người dùng.', 'images/43.jpg', 'Việt Nam', '2017-12-26 10:00:00', 64, 0),
(44, 'Máy tính bảng Samsung Galaxy Tab E 9.6 (SM-T561)', 3, 1, 4490000, 100, 'Samsung Galaxy Tab E 9.6 là một sự lựa chọn cho bạn thích một chiếc máy có màn hình lớn để giải trí thoải mái hơn nhưng cấu hình không quá thấp.', 'images/44.jpg', 'Việt Nam', '2017-12-26 10:00:00', 94, 0),
(45, 'Máy tính bảng Samsung Galaxy Tab A6 7.0\"', 3, 1, 3590000, 100, 'Samsung Galaxy Tab A6 7.0 với thiết kế vẫn mang vẻ truyền thống và cấu hình tốt, khả năng hiển thị cải thiện, cùng kết nối 4G.', 'images/45.jpg', 'Việt Nam', '2017-12-26 10:00:00', 1434, 0),
(46, 'Máy tính bảng iPad Pro 10.5 inch Wifi Cellular 64GB (2017)', 3, 3, 19990000, 400, 'Apple vẫn giữ ngôn ngữ thiết kế từ xa xưa tới nay, nên phiên bản 10.5 inch cũng không có gì khác lắm với những người tiền nhiệm còn lại. Tuy không mới nhưng đây vẫn là một thiết kế vượt thời gian và rất sang trọng.', 'images/46.jpg', 'Việt Nam', '2017-12-26 10:00:00', 1434, 0),
(47, 'Máy tính bảng iPad Pro 10.5 inch Wifi 64GB (2017)', 3, 3, 16990000, 400, 'iPad Pro 10.5 inch Wifi 64GB (2017) với kích thước màn hình nhỏ hơn, viền màn hình siêu mỏng cùng hiệu năng mạnh mẽ sẽ đáp ứng tốt cho bạn trong mọi nhu cầu sử dụng hằng ngày.', 'images/47.jpg', 'Việt Nam', '2017-12-26 10:00:00', 1434, 0),
(48, 'Máy tính bảng iPad Wifi Cellular 32GB (2017)', 3, 3, 12990000, 400, 'Dòng máy tính bảng iPad Wifi Cellular 32GB (2017) mới của Apple sở hữu cho mình cấu hình mạnh mẽ cùng mức giá bán rất hấp dẫn.', 'images/48.jpg', 'Việt Nam', '2017-12-26 10:00:00', 1434, 0),
(49, 'Máy tính bảng iPad Mini 4 Wifi 128GB', 3, 3, 10990000, 400, 'iPad Mini 4 Wifi 128GB cho bạn thêm sự lựa chọn với bộ nhớ trong dung lượng lớn thoải mái cài đặt game và ứng dụng.', 'images/49.jpg', 'Việt Nam', '2017-12-26 10:00:00', 1434, 0),
(50, 'Máy tính bảng iPad Wifi 32GB (2017)', 3, 3, 8990000, 400, 'iPad Wifi 32GB (2017) là một bản nâng cấp nhẹ của chiếc iPad Air 2 đã ra mắt từ năm 2014 với một số thay đổi về ngoại hình và cấu hình được nâng cấp mạnh mẽ hơn.', 'images/50.jpg', 'Việt Nam', '2017-12-26 10:00:00', 1434, 0),
(51, 'DELL 15.6″ dòng Inspiron 5570', 2, 5, 15000000, 100, 'Dell inspiron 15 là dòng laptop thời trang cao cấp trong series 5000 của Dell với điểm nổi bật là thiết kế nhôm nguyên khối mỏng nhẹ cực kỳ sang trọng. Điểm xuyến giữa phần nắp màn hình là logo Dell màu đen sang trọng, bàn phím và touchpad đều được viền một lớp khung đánh bóng. Inspiron 5570 mang phong cách hiện đại với cấu hình mạnh mẽ với trọng lượng không quá 2kg. Đây được coi là chiếc máy tính lí tưởng cho các doanh nhân hoặc người dùng thường xuyên di chuyển. Chiếc máy cho âm thanh chất lượng cao bằng công nghệ Waves MaxxAudio® của Dell ', 'images/Dell/1.jpg', 'Việt Nam', NULL, 10, 5),
(52, 'DELL 15.6 inch dòng INSPIRON 5577', 2, 5, 18890000, 100, 'Dell N5577 sở hữu một vẻ ngoài đặc trưng của dòng laptop Gaming với tông màu đen chủ đạo kết hợp cùng các đường viền màu đỏ nổi bật và rất nhiều quạt tản nhiệt trên thân máy tạo nên một phong cách rất riêng. Máy được hoàn thiện bằng chất liệu nhựa, mặt lưng được làm ở dạng sần vừa toát lên sự sang trọng vừa cho người dùng cảm giác cầm chắc chắn hơn.', 'images/Dell/2.jpg', 'Việt Nam', NULL, 6, 6),
(53, 'DELL 15 inch dòng XPS 2017 -9560', 2, 5, 40990000, 100, 'XPS 15 9560 là phiên bản mới nhất trong dòng máy tính giải trí di động XPS với thiết kế hiện đại, màn hình cảm ứng độ phân giải FHD cùng cấu hình phần cứng mạnh. Máy có thiết kế tinh tế, kiểu dáng mỏng nhẹ cùng chất liệu sợi carbon và hợp kim nhôm nên máy khá nhẹ đồng thời vẫn tạo được sự chắc chắn, độ bền cao. Chiếc máy cho âm thanh chất lượng cao bằng công nghệ Waves MaxxAudio® Pro của Del', 'images/Dell/3.jpg', 'Việt Nam', NULL, 7, 7),
(54, 'DELL 17.3 inch dòng New Alienware 17', 2, 5, 41790000, 100, 'New Alienware 17 là phiên bản mới nhất trong dòng máy tính Gaming của dell với thiết kế hiện đại, màn hình cảm ứng độ phân giải FHD cùng cấu hình phần cứng cực mạnh. Máy có thiết kế tinh tế, kiểu dáng cực pro cùng chất liệu sợi carbon và hợp kim nhôm nên máy khá nhẹ đồng thời vẫn tạo được sự chắc chắn, độ bền cao. Chiếc máy cho âm thanh chất lượng cao bằng công nghệ Waves MaxxAudio® Pro của Dell', 'images/Dell/4.jpg', 'Việt Nam', NULL, 8, 8),
(55, 'DELL 15.6 inch dòng inspiron 5000', 2, 5, 12790000, NULL, 'Dell Inspiron 15 5578 lẽ đương nhiên cũng sở hữu bản lề xoay 360 độ, màn hình cảm ứng đa điểm, nên không chỉ có thể xếp gọn để dùng như một chiếc tablet khủng, máy còn hỗ trợ nhiều chế độ sử dụng khác – tiện dụng cho nhu cầu giải trí hoặc khi cần chia sẻ ý tưởng trong công việc. Riêng về phần cứng, Inspiron 15 cũng đã được Dell mạnh dạn trang bị ổ 1tb và bộ xử lý Kaby-lake đời thế hệ 7 Intel Core i7-7500U vốn có mức xung nhịp chuẩn đạt mức 2,7GHz, RAM DDR4 kênh đôi tổng dung lượng 32GB. Dell Inspiron 13 5578 cũng được nhà sản xuất ưu ái đóng gói kèm công nghệ âm thanh MaxxAudio vốn cung cấp các tùy chỉnh âm thanh được thiết lập sẵn tối ưu cho từng nhu cầu giải trí. Lẽ đương nhiên là người dùng cũng có thể tùy chỉnh các thiết lập âm thanh theo sở thích nghe nhạc của mình một cách dễ dàng. Khoác lên mình lớp vỏ độc đáo hợp kim nhôm kết hợp với một màu trắng bạc để hiện diện nổi bật và thật khác biệt. ', 'images/Dell/5.jpg', 'Việt Nam', NULL, 9, 9),
(56, 'DELL 15.6 inch dòng INSPIRON 5577', 2, 5, 22890000, NULL, 'Dell N5577 là chiếc laptop Gaming của Dell có thiết mạnh mẽ, cá tính cùng cấu hình vô cùng mạnh mẽ với bộ vi xử lý Core i7 thế hệ 7 mới nhất của Intel kết hợp cùng bộ nhớ RAM 8GB và card đồ họa rời 4GB, hứa hẹn sẽ mang đến cho người dùng những trải nghiệm khác biệt và mượt mà nhất.', 'images/Dell/6.jpg', NULL, NULL, 0, 0),
(57, 'DELL 15.6 inch dòng INSPIRON 5577', 2, 5, 18889000, NULL, 'Dell N5577 là chiếc laptop Gaming của Dell có thiết mạnh mẽ, cá tính cùng cấu hình vô cùng mạnh mẽ với bộ vi xử lý Core i7 thế hệ 7 mới nhất của Intel kết hợp cùng bộ nhớ RAM 8GB và card đồ họa rời 4GB, hứa hẹn sẽ mang đến cho người dùng những trải nghiệm khác biệt và mượt mà nhất.', 'images/Dell/7.jpg', NULL, NULL, 5, 5),
(58, 'DELL 12.5\" dòng LATITUDE E7270 ', 2, 5, 15590000, NULL, 'Dell Latitude E7270/i5-6300U sở hữu một thiết kế khá nhỏ gọn, với chiều dài 31 cm, rộng 21.6 cm, cao 1.72 cm và chỉ nặng 1.26 kg phù hợp cho người dùng mang theo máy trong các chuyến công tác, hay di chuyển trong văn phòng. Máy được chế tạo từ chất liệu cao cấp, mặt ngoài nắp máy được chế tạo để chống bám vân tay, các góc cạnh được bo tròn một cách tỉ mỹ đem lại một vẻ ngoài sang trọng và chắc chắn.', 'images/Dell/8.jpg', NULL, NULL, 5, 5),
(59, 'DELL 15 inch dòng LATITUDE E3580', 2, 5, 11490000, NULL, 'Dell latitude 3580 là một dòng laptop 15.6\" có thiết kế mỏng nhẹ với màn hình FHD ATG rực rỡ. Là thương hiệu máy tính cao cấp của Dell hướng đến đối tượng người dùng doanh nhân, doanh nghiệp và nằm chung phân khúc với HP EliteBook và ThinkPad. Bộ vi xử lí core i3 thế hệ 7 cho hiệu suất tối đa. Chất liệu chế tạo của 3580 mang lại cảm nhận xúc giác rất tốt và sự cao cấp. Mặt ngoài nắp máy được hoàn thiện với một lớp phủ mềm, không bám vân tay bằng sợi carbon. Theo Dell, Latitude 3580 đã trải qua các thử nghiệm nhằm đáp ứng tiêu chuẩn độ bền quân sự MIL-STD 810G để đảm bảo rằng hệ thống có thể xử lý việc sử dụng hàng ngày mà không có vấn đề.', 'images/Dell/9.jpg', NULL, NULL, 5, 5),
(60, 'Dell Latitude E6540(Màu Bạc)', 2, 5, 9800000, NULL, 'Với vi xử lý Intel Core i3 Skylake, xung nhịp 2.00 Ghz khá tốt cùng với ổ cứng lưu trữ HDD 1 TB, máy đáp ứng đầy đủ nhu cầu về xem phim, chơi game.', 'images/Dell/10.jpg', NULL, NULL, 5, 5),
(61, 'HP 15.6 inch  (màu silver)', 2, 6, 12590000, NULL, 'Khoác lên mình lớp vỏ độc đáo kết hợp với một màu xám bạc để hiện diện nổi bật và thật khác biệt. Chiếc máy có hai loa Stereo nằm bên dưới mặt trước máy được thiết kế với thương hiệu Altec Lansing cho âm thanh chất lượng cao.', 'images/HP/14.jpg', NULL, NULL, 5, 5),
(62, 'HP 15.6 inch (màu xám đen)', 2, 6, 6290000, NULL, '', 'images/HP/15.jpg', NULL, NULL, 5, 5),
(63, 'HP ProBook 14 inch (Màu Đen)', 2, 6, 9390000, NULL, 'Khoác lên mình lớp vỏ độc đáo kết hợp với một đen xám để hiện diện nổi bật và thật khác biệt. Chiếc máy có hai loa Stereo nằm bên dưới mặt trước máy được thiết kế với thương hiệu Altec Lansing cho âm thanh chất lượng cao.', 'images/HP/20.jpg', NULL, NULL, 5, 5),
(64, 'HP SPECTRE X360 15t 15.6 inch (gold)', 2, 6, 30590000, NULL, 'HP SPECTRE 15 là sản phẩm hai trong một đã vượt qua những thử nghiệm máy tính khắc nghiệt. Sản phẩm này có bàn phím chế tác tinh xảo, thiết kế mỏng nhẹ nhưng mạnh mẽ đáp ứng những đòi hỏi khắt khe của doanh nghiệp', 'images/HP/17.jpg', NULL, NULL, 5, 5),
(65, 'HP 13.3 inch dòng ENVY', 2, 6, 24490000, NULL, 'Khoác lên mình lớp vỏ hợp vàng ánh kim sang trọng để hiện diện nổi bật và thật khác biệt. Hình thức thanh gọn nhưng công lực thật đáng nể với pin hoạt động bền bỉ lên đến 10 tiếng, cho bạn tha hồ sử dụng không ngơi nghỉ. ', 'images/HP/18.jpg', NULL, NULL, 5, 5),
(66, 'Acer Aspire ES1 432(Màu Đen)', 2, 7, 6290000, NULL, 'Acer Aspire ES1 432 C5J2 N3350 mang lại hiệu năng sử dụng đơn giản để học tập hay giải trí cho bạn.', 'images/Acer/24.jpg', NULL, NULL, 5, 5),
(67, 'Acer ES1 533 N4200(Màu Đen)', 2, 7, 7490000, NULL, 'Acer ES1 533 N4200 mang lại hiệu năng sử dụng đơn giản để học tập hay giải trí cho bạn.', 'images/Acer/26.jpg', NULL, NULL, 5, 5),
(68, 'Acer Aspire E5 475 33WT i3 6006U', 2, 7, 8690000, NULL, 'Laptop Acer Aspire E5 475 33WT i3 6006U là sự lựa chọn đáng giá với cấu hình tốt so với nhiều đối thủ khác trong cùng phân khúc.', 'images/Acer/27.jpg', NULL, NULL, 5, 5),
(69, 'Acer Aspire E5 575G 53EC i5 7200U', 2, 7, 10590000, NULL, 'Acer Aspire E5 575G 53EC i5 7200U là sản phẩm thiết kế đơn giản, gọn nhẹ. Với cấu hình core i5 Kabylake bổ sung thêm sức mạnh, hiệu suất làm việc của máy.', 'images/Acer/28.jpg', NULL, NULL, 5, 5),
(70, 'Acer Swift SF314 32EX i3 7100U', 2, 7, 21000000, NULL, 'Laptop Acer Swift SF314 32EX là một sản phẩm có thiết kế sang trọng với vỏ kim loại chắc chắn, bảo mật vân tay, cùng màn hình Full HD sắc nét.', 'images/Acer/29.jpg', NULL, NULL, 5, 5),
(71, 'Laptop Apple Macbook Air MQD32SA/A i5 1.8GHz/8GB/128GB (2017)', 2, 3, 23990000, 200, 'Macbook Air MQD32SA/A i5 5350U với thiết kế vỏ nhôm nguyên khối Unibody rất đẹp, chắc chắn và sang trọng. Máy siêu mỏng và siêu nhẹ, hiệu năng ổn định mượt mà, thời lượng pin cực lâu, phục vụ tốt cho nhu cầu làm việc lẫn giải trí.', 'images/Apple/.jpg', 'Việt Nam', '2017-12-26 03:00:00', 1234, 0),
(72, 'Laptop Apple Macbook Pro MPXR2SA/A i5 2.3GHz/8GB/128GB (2017)', 2, 3, 33990000, 200, 'Apple Macbook Pro MPXR2SA/A i5 là dòng sản phẩm cao cấp với thiết kế kim loại nguyên khối, chip i5 thế hệ thứ 7 và dùng ổ SSD dung lượng 128 GB mang đến sự bền bỉ và mạnh mẽ khi sử dụng.', 'images/Apple/2.jpg', 'Việt Nam', '2017-12-26 03:00:00', 1234, 0),
(73, 'Laptop Apple Macbook 12\" MMGM2 Core M 1.2GHz/8GB/512GB (2016)', 2, 3, 36990000, 200, 'Apple Macbook 12 inch MMGM2 là phiên bản 2016 được nâng cấp đôi chút so với bản 2015, có RAM lớn, ổ SSD tốc độ cao, chip xử lý mới và tốt.', 'images/Apple/3.jpg', 'Việt Nam', '2017-12-26 03:00:00', 1234, 0),
(74, 'Laptop Apple Macbook 12\" MLHF2 Core M 1.2GHz/8GB/512GB (2016)', 2, 3, 36990000, 200, 'Vẫn duy trì thiết kế cực kỳ quyến rũ của mình Apple Macbook 12 inch năm 2016 được cải tiến thêm về hiệu năng với chip xử lý Core M của Intel đem đến hiệu năng vượt trội hơn.', 'images/Apple/4.jpg', 'Việt Nam', '2017-12-26 03:00:00', 1234, 0),
(75, 'Laptop Apple Macbook Pro Touch MLH32SA/A i7 2.6GHz/16GB/256GB (2016)', 2, 3, 56990000, 200, 'MacBook Pro 2016 là “khủng long xinh đẹp” trong thế giới laptop, đặc biệt là sự xuất hiện của thanh Touch Bar – là một dải cảm ứng cho phép truy cập nhanh công cụ. ', 'images/Apple/5.jpg', 'Việt Nam', '2017-12-26 03:00:00', 1234, 0);

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
CREATE TABLE IF NOT EXISTS `users` (
  `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT,
  `fullname` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `password` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `type` int(255) DEFAULT NULL,
  `phone` varchar(16) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `fullname`, `email`, `password`, `type`, `phone`) VALUES
(1, 'admin', 'admin@gmailcom', '$2y$11$hQSVhxhIWPJz91GMB2FGie7Yjt9hpTDN8aAOZosb7ns8JmSGxkJe', 1, NULL),
(2, 'Khoa huynh', 'yumiling1001@gmailcom', '$2y$11$hQSVhxhIWPJz91GMB2FGie7Yjt9hpTDN8aAOZosb7ns8JmSGxkJe', NULL, NULL),
(3, 'khanh', 'khanhthangngulol@gmail.com', '$2y$10$gP0faF7xtpIeurNtCw.JPeSVTMWrfAjeh7z/u.WHM7j/UiE3ecdPW', NULL, '0'),
(4, 'khanhvo1', 'khanhthangngulol1@gmail.com', '$2y$10$Zs3586jvp5BbTxKjcMly8.y0.TtcjOa/mPDa0hzmpaE1AtUI/hwcS', NULL, '01649502951');

--
-- Constraints for dumped tables
--

--
-- Constraints for table `chi_tiet_don_hang`
--
ALTER TABLE `chi_tiet_don_hang`
  ADD CONSTRAINT `chi_tiet_don_hang_ibfk_1` FOREIGN KEY (`id_donhang`) REFERENCES `don_hang` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `chi_tiet_don_hang_ibfk_2` FOREIGN KEY (`id_sanpham`) REFERENCES `san_pham` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `don_hang`
--
ALTER TABLE `don_hang`
  ADD CONSTRAINT `don_hang_ibfk_1` FOREIGN KEY (`id_nguoidung`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `gio_hang`
--
ALTER TABLE `gio_hang`
  ADD CONSTRAINT `gio_hang_ibfk_1` FOREIGN KEY (`id_nguoidung`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `gio_hang_ibfk_2` FOREIGN KEY (`id_sanpham`) REFERENCES `san_pham` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `san_pham`
--
ALTER TABLE `san_pham`
  ADD CONSTRAINT `san_pham_ibfk_1` FOREIGN KEY (`id_nsx`) REFERENCES `nha_san_xuat` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `san_pham_ibfk_2` FOREIGN KEY (`loai`) REFERENCES `loai_san_pham` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
