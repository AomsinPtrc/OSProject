-- phpMyAdmin SQL Dump
-- version 4.9.5
-- https://www.phpmyadmin.net/
--
-- Host: localhost:3306
-- Generation Time: May 13, 2021 at 07:28 PM
-- Server version: 5.7.24
-- PHP Version: 7.4.1

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `smart`
--

-- --------------------------------------------------------

--
-- Table structure for table `cart`
--

CREATE TABLE `cart` (
  `cart_id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL,
  `mem_id` int(11) NOT NULL,
  `product_price` double NOT NULL,
  `cart_date` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `cart`
--

INSERT INTO `cart` (`cart_id`, `product_id`, `mem_id`, `product_price`, `cart_date`) VALUES
(2, 3, 1, 13499, '2021-05-14 00:06:01');

-- --------------------------------------------------------

--
-- Table structure for table `members`
--

CREATE TABLE `members` (
  `mem_id` int(11) NOT NULL COMMENT 'รหัสพนักงาน',
  `mem_fname` varchar(40) NOT NULL COMMENT 'ชื่อ',
  `mem_lname` varchar(40) NOT NULL COMMENT 'นามสกุล',
  `mem_email` varchar(80) NOT NULL COMMENT 'อีเมลล์',
  `mem_tel` varchar(10) NOT NULL COMMENT 'เบอร์',
  `mem_address` varchar(100) NOT NULL COMMENT 'ที่อยู่',
  `mem_username` varchar(30) NOT NULL COMMENT 'ชื่อผู้ใช้',
  `mem_password` varchar(60) NOT NULL COMMENT 'รหัสผ่าน',
  `mem_create_at` varchar(15) NOT NULL,
  `mem_status` enum('admin','personnel','user') NOT NULL DEFAULT 'user' COMMENT 'สถานะ'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `members`
--

INSERT INTO `members` (`mem_id`, `mem_fname`, `mem_lname`, `mem_email`, `mem_tel`, `mem_address`, `mem_username`, `mem_password`, `mem_create_at`, `mem_status`) VALUES
(1, 'demo', 'demo', 'demo@demo.com', '0814567899', '1001/32 Thailand', 'demo', '$2y$10$OsBJKA6tkMFg4LZ7hUy89.B.pi1jVcJAApi5UoXPWfqWPe8JQ9xdy', '2020-04-08', 'user'),
(2, 'admin', 'admin', 'admin@admin.com', '0894969999', '-', 'admin', '$2y$10$1Psji12WhAwbKQ8YYgIXL.CW8kRXKRt9fG6ORTWTU2hPZdeLBWQem', '2020-04-08', 'user'),
(3, 'ภัทรชัย', 'สุภาควัฒน์', 'pha@test.com', '0882762645', 'ลาดกระบัง', 'aomsin', '$2y$10$J3gZx0P1NVukGn2SOISwnOCve4oePq/3LJqyBjTQhcOOyp6LBiR7G', '2021-05-07', 'user');

-- --------------------------------------------------------

--
-- Table structure for table `news`
--

CREATE TABLE `news` (
  `new_id` int(11) NOT NULL COMMENT 'รหัสข่าว',
  `new_title` varchar(30) NOT NULL COMMENT 'หัวข้อข่าว',
  `new_image` varchar(100) NOT NULL COMMENT 'รูปข่าว',
  `new_date` date NOT NULL COMMENT 'วันที่ลงข่าว'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `news`
--

INSERT INTO `news` (`new_id`, `new_title`, `new_image`, `new_date`) VALUES
(1, ' ad1', 'ad1.jpg', '2020-02-18'),
(2, 'ad2', 'ad2.jpg', '2020-02-18');

-- --------------------------------------------------------

--
-- Table structure for table `orders`
--

CREATE TABLE `orders` (
  `order_id` int(11) NOT NULL,
  `order_number` varchar(20) NOT NULL,
  `mem_id` int(11) NOT NULL,
  `address` varchar(100) NOT NULL,
  `order_shipping` varchar(2) NOT NULL,
  `price_total` int(8) NOT NULL,
  `order_status` int(1) NOT NULL,
  `order_date` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `orders`
--

INSERT INTO `orders` (`order_id`, `order_number`, `mem_id`, `address`, `order_shipping`, `price_total`, `order_status`, `order_date`) VALUES
(1, '050521162454', 1, '1001/32 Thailand', '50', 11900, 4, '2021-05-05 16:24:54'),
(2, '050521162527', 1, '1001/32 Thailand', '50', 11900, 4, '2021-05-05 16:25:27'),
(3, '050521163301', 1, '1001/32 Thailand', '50', 12000, 4, '2021-05-05 16:33:01'),
(4, '050521163844', 1, '1001/32 Thailand', '80', 12000, 4, '2021-05-05 16:38:44'),
(5, '050521172756', 1, '1001/32 Thailand', '50', 11900, 4, '2021-05-05 17:27:56'),
(6, '070521180151', 1, '1001/32 Thailand', '50', 11900, 4, '2021-05-07 18:01:51'),
(7, '070521180248', 1, '1001/32 Thailand', '50', 11900, 4, '2021-05-07 18:02:48'),
(8, '070521190015', 1, '1001/32 Thailand', '50', 11900, 4, '2021-05-07 19:00:15'),
(9, '130521170402', 1, '1001/32 Thailand', '50', 27900, 1, '2021-05-13 17:04:02');

-- --------------------------------------------------------

--
-- Table structure for table `order_detail`
--

CREATE TABLE `order_detail` (
  `order_detail_id` int(11) NOT NULL,
  `order_number` varchar(20) NOT NULL,
  `product_id` int(11) NOT NULL,
  `product_price` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `order_detail`
--

INSERT INTO `order_detail` (`order_detail_id`, `order_number`, `product_id`, `product_price`) VALUES
(1, '130521170402', 1, 27900);

-- --------------------------------------------------------

--
-- Table structure for table `product`
--

CREATE TABLE `product` (
  `product_id` int(11) NOT NULL,
  `product_name` varchar(30) NOT NULL,
  `product_detail` varchar(500) NOT NULL,
  `product_image` varchar(50) NOT NULL,
  `product_code` varchar(10) NOT NULL,
  `product_price` double(10,2) NOT NULL,
  `product_tag` varchar(30) NOT NULL,
  `product_date` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `product`
--

INSERT INTO `product` (`product_id`, `product_name`, `product_detail`, `product_image`, `product_code`, `product_price`, `product_tag`, `product_date`) VALUES
(1, 'Samsung Galaxy S21 Series', 'คู่เรือธงน้องใหม่ แรงเท่ารุ่นใหญ่ ฟีเจอร์ไฮเอนด์จัดเต็มน่าใช้ ในราคาย่อมเยากว่า ด้วยจอ 120Hz, \r\nกล้องโปร 3 ตัว ซูมไกล 30 เท่า พร้อมถ่ายวิดีโอ 8K, ชิปเซ็ต Exynos 2100 ตัวท็อป ผสาน RAM LPDDR5 8GB, \r\nROM UFS 3.1 สูงสุด 256GB, เทคโนโลยีชาร์จไร้สายความเร็วสูง และลำโพงคู่ AKG บนตัวเครื่องดีไซน์ใหม่', 'S21.jpg', 'SM-R815FZD', 27900.00, 'Sumsung', '2020-02-20'),
(2, 'Samsung Galaxy A72', 'Galaxy A72 สมาร์ทโฟนสำหรับสายเกมเมอร์จัดเต็มด้วย AI Game Booster+ และ Snapdragon 720G \r\nมาพร้อมสเปคที่ครบเครื่อง แรม 8GB รอม 128GB แบตเตอรี่อึด 5000mAh ดีไซน์สวยพรีเมี่ยมกันน้ำกันฝุ่นได้ตามมาตรฐาน IP67 \r\nแถมยังมีกล้องหลัง 3 ตัวความละเอียด 64MP', 'A72.jpg', 'SM-R815FZK', 13999.00, 'Sumsung', '2020-02-04'),
(3, 'Samsung Galaxy A52', 'รับชมรายละเอียดที่ดูสดใสได้ด้วย Super AMOLED Display FHD+ ที่สว่างถึง 800 nit1 ที่ทำให้คุณดูสิ่งต่าง ๆ \r\nได้อย่างชัดเจนแม้จะอยู่ท่ามกลางแสงแดดจ้าก็ตาม Eye Comfort Shield2 ช่วยลดแสงสีฟ้า ส่วน Real Smooth \r\nช่วยทำให้ทุกอย่างไหลลื่นไม่ว่าคุณจะเล่นเกมหรือเลื่อนดูสิ่งต่าง ๆ ก็ตาม ซึ่งคุณสามารถรับชมทุกสิ่งที่กล่าวมานี้ได้ใน Infinity-O Display ขนาดใหญ่จุใจ 6.5 นิ้ว', 'A52.jpg', 'SM-R830NSD', 13499.00, 'Sumsung', '2020-02-20'),
(4, 'Samsung Galaxy A32', 'Galaxy A32 4G มาพร้อมหน้าจอ Super AMOLED ขนาด 6.4 นิ้ว \r\nความละเอียด Full HD+ 1080 x 2400 pixels อัตรารีเฟรช 90Hz \r\nภายในหน่วยประมวลผล Mediatek Helio G80 (12 nm) แบตเตอรี่ 5,000 mAh ชาร์จเร็ว 15W', 'A32.jpg', 'SM-R835FSK', 8499.00, 'Sumsung', '2020-02-20'),
(5, 'XIAOMI Mi 11', 'Mi 11 เกิดมาเพื่อสร้างสรรค์อย่างแท้จริง ด้วยกล้อง AI 108MP ให้มุมกว้างพร้อม OIS และฟิลเตอร์วิดีโอภาพยนตร์ ตัดต่อเหมือนสตูดิโอ กว้างข้ามทุกขีดจำกัดไปกับความเร็วแรงระดับท็อป โปรเซสเซอร์ Qualcomm® Snapdragon™ 888 ที่แข็งแกร่งที่สุดในยุค 5G.', 'Mi11.jpg', 'SM-R370NZK', 23990.00, 'Xiaomi', '2020-02-20'),
(6, 'XIAOMI Mi Note 10', 'นวัตกรรมกล้องคมชัดดั่งจินตนาการ ครั้งแรกของโลกกับสมาร์ทโฟน 5 กล้อง 108MP  ระบบประมวลผลภาพสำหรับทุกสถานการณ์ มอบความรู้สึกใหม่และความงดงามสุดตระการตา พร้อมให้คุณ สัมผัสประสิทธิการประมวลผลอันน่าทึ่งชิพเซ็ทประมวลผล Qualcomm Snapdragon 730G เลือกสีสันที่เข้ากับคุณไม่ว่าจะเป็น Midnight Black ,Glacier White หรือ Aurora Green ให้คุณโด่นเด่นอย่างมีสไตล์', 'Minote10.jpg', 'SM-R805FZS', 16990.00, 'Xiaomi', '2020-02-18'),
(7, 'XIAOMI Redmi 9', ' สมาร์ทโฟนรุ่นนี้มาพร้อมสีสันที่เป็นเอกลักษณ์ ดูโฉบเฉี่ยว สะดุดตา จอแสดงผลเป็นแบบ FHD+ คุณสามารถรับชมภาพยนตร์หรือเล่นเกมได้เต็มอรรถรสกว่าที่เคย นอกจากนี้ยังให้ Ram มาถึง 4 GB ซึ่งเพียงพอต่อการใช้งานทั่วไป กล้องของสมาร์ทโฟนรุ่นนี้ก็ให้มาแบบจัดเต็มโดยกล้องหลังมีความละเอียดสูงสุด 13 ล้านพิกเซลและกล้องหน้า 8 ล้านพิกเซล ตัวสมาร์ทโฟนทำจากวัสดุคุณภาพดี เสียหายได้ยาก น้ำหนักเบา พกพาได้อย่างสะดวกสบาย นอกจากนี้แบตเตอรี่ให้มาถึง 5020 mAh ใช้งานได้ตลอดทั้งวัน', 'Redmi9.jpg', 'AP-WS4GP44', 3794.00, 'Xiaomi', '2020-02-28'),
(9, 'XIAOMI Redmi Note 8 Pro', 'มือถือสมาร์ทโฟน ดีไซน์เรียบหรู ออกแบบมาเพื่อการเกมมิ่งโดยเฉพาะ หน้าจอ Full HD+ 6.53 นิ้ว ได้ภาพเต็มตา คมชัดในทุกรายละเอียด ใช้ชิพเซ็ตที่ทรงพลังอย่าง MediaTek Helio G90T เล่นเกมแบบไม่มีหน่วง มีเสารับ WiFi แบบอักษร X รับสัญญาณได้เสถียร หมดห่หวงเรื่องเน็ตหลุดระหว่างเล่น มีเทคโนโลยี LiquidCool เสริมประสิทธิภาพด้านระบายความร้อน รองรับชาร์จเร็ว เล่นเกมหรือใช้งานได้ต่อเนื่อง ตลอดวัน', 'Redminote8.jpg', 'SM-R815FZK', 5999.00, 'Xiaomi', '2020-03-02'),
(12, 'HUAWEI Mate 40 Pro', 'ชิปเซ็ต Kirin 9000 5G SoC ขนาด 5nm\r\nกล้อง Ultra Vision Cine และกล้องเซลฟี่\r\nHUAWEI SuperCharge แบบคู่\r\n', 'Mate40Pro.jpg', 'SKM-0001', 34990.00, 'Huawei', '2020-04-09'),
(13, 'HUAWEI Y7a', 'เทคโนโลยีชาร์จไว 22.5 W HUAWEI SuperCharge แบตเตอรี่ขนาดใหญ่ 5000 mAh\r\n4 กล้อง 48MP ภาพสวยด้วยระบบ AI อัจฉริยะ', 'Y7a.jpg', 'SKM-0002', 6999.00, 'Huawei', '2020-04-09'),
(14, 'Iphone 12', 'ด้วยความเร็วระดับ 5G, ชิปที่เร็วที่สุดในสมาร์ทโฟนอย่าง A14 Bionic, จอภาพ OLED แบบขอบจรดขอบ, Ceramic Shield ที่ทนต่อการตกกระแทกได้ดีขึ้น 4 เท่า และโหมดกลางคืนบนกล้องทุกตัว ', 'iphone12.jpg', 'iph-01', 25900.00, 'Apple', '2020-04-09'),
(15, 'IPhone 11', 'โดดเด่นด้วยจอภาพระดับโปรอันน่าทึ่ง, ชิพ A13 Bionic และระบบกล้องระดับโปรสุดล้ำ ส่วน iPhone 11 Pro Max นั้นยังมาพร้อมแบตเตอรี่ที่ใช้งานได้นานที่สุดเท่าที่เคยมีมาใน iPhone', 'iPhone11.jpg', 'iph-02', 24900.00, 'Apple', '2020-04-09');

-- --------------------------------------------------------

--
-- Table structure for table `product_tag`
--

CREATE TABLE `product_tag` (
  `product_tag_id` int(11) NOT NULL,
  `product_tag_name` varchar(50) NOT NULL,
  `product_tag_date` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `product_tag`
--

INSERT INTO `product_tag` (`product_tag_id`, `product_tag_name`, `product_tag_date`) VALUES
(1, 'Sumsung', '2020-04-08'),
(2, 'Apple', '2020-04-08'),
(3, 'Xiaomi', '2020-04-09'),
(4, 'Huawei', '2020-04-09');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `cart`
--
ALTER TABLE `cart`
  ADD PRIMARY KEY (`cart_id`);

--
-- Indexes for table `members`
--
ALTER TABLE `members`
  ADD PRIMARY KEY (`mem_id`);

--
-- Indexes for table `news`
--
ALTER TABLE `news`
  ADD PRIMARY KEY (`new_id`);

--
-- Indexes for table `orders`
--
ALTER TABLE `orders`
  ADD PRIMARY KEY (`order_id`);

--
-- Indexes for table `order_detail`
--
ALTER TABLE `order_detail`
  ADD PRIMARY KEY (`order_detail_id`);

--
-- Indexes for table `product`
--
ALTER TABLE `product`
  ADD PRIMARY KEY (`product_id`);

--
-- Indexes for table `product_tag`
--
ALTER TABLE `product_tag`
  ADD PRIMARY KEY (`product_tag_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `cart`
--
ALTER TABLE `cart`
  MODIFY `cart_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `members`
--
ALTER TABLE `members`
  MODIFY `mem_id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'รหัสพนักงาน', AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `news`
--
ALTER TABLE `news`
  MODIFY `new_id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'รหัสข่าว', AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `orders`
--
ALTER TABLE `orders`
  MODIFY `order_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT for table `order_detail`
--
ALTER TABLE `order_detail`
  MODIFY `order_detail_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `product`
--
ALTER TABLE `product`
  MODIFY `product_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

--
-- AUTO_INCREMENT for table `product_tag`
--
ALTER TABLE `product_tag`
  MODIFY `product_tag_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
