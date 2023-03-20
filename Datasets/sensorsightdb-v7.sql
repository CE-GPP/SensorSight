-- --------------------------------------------------------
-- Host:                         mysql.yaman-ka.com
-- Server version:               5.7.41 - MySQL Community Server (GPL)
-- Server OS:                    Linux
-- HeidiSQL Version:             10.1.0.5464
-- --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8 */;
/*!50503 SET NAMES utf8mb4 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;


-- Dumping database structure for db
CREATE DATABASE IF NOT EXISTS `db` /*!40100 DEFAULT CHARACTER SET latin1 */;
USE `db`;

-- Dumping structure for table db.cameras
CREATE TABLE IF NOT EXISTS `cameras` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(300) NOT NULL,
  `lon` float NOT NULL,
  `lat` float NOT NULL,
  `elevation` float NOT NULL,
  `manufacturer` varchar(300) DEFAULT NULL,
  `series` varchar(300) DEFAULT NULL,
  `resolution` varchar(300) DEFAULT NULL,
  `360` int(11) NOT NULL,
  `feed_link` varchar(300) DEFAULT NULL,
  `image_link` varchar(300) DEFAULT NULL,
  `full_image_link` varchar(300) DEFAULT NULL,
  `camera_coordinates` json DEFAULT NULL,
  `column_base_coordinates` json DEFAULT NULL,
  `vision_field_1` json DEFAULT NULL,
  `vision_field_2` json DEFAULT NULL,
  `vision_field_3` json DEFAULT NULL,
  `vision_field_4` json DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=latin1;

-- Dumping data for table db.cameras: ~16 rows (approximately)
/*!40000 ALTER TABLE `cameras` DISABLE KEYS */;
INSERT INTO `cameras` (`id`, `name`, `lon`, `lat`, `elevation`, `manufacturer`, `series`, `resolution`, `360`, `feed_link`, `image_link`, `full_image_link`, `camera_coordinates`, `column_base_coordinates`, `vision_field_1`, `vision_field_2`, `vision_field_3`, `vision_field_4`) VALUES
	(1, 'OPS-1', 51.5403, -0.008771, 3.9, 'AXIS', 'M3104-A', '1080x1920', 1, 'https://s3-eu-west-1.amazonaws.com/jamcams.tfl.gov.uk/00001.09401.mp4', 'OPS1_close.jpg', 'OPS1_full.jpg', '{"alt": 58.5, "lat": 51.5403, "lon": -0.008771}', '{"alt": 55.1, "lat": 51.5403, "lon": -0.008771}', '{"alt": 55.1, "lat": 51.5493, "lon": -0.008721}', '{"alt": 55.1, "lat": 51.5493, "lon": -0.008729}', NULL, NULL),
	(2, 'OPS-2', 51.539, -0.010579, 3.63, 'Panasonic', 'M3075-V', '1080x1920', 1, 'https://s3-eu-west-1.amazonaws.com/jamcams.tfl.gov.uk/00001.09401.mp4', 'OPS2_close.jpg', 'OPS2_full.jpg', '{"alt": 58.5, "lat": 51.539, "lon": -0.010579}', '{"alt": 55.5, "lat": 51.539, "lon": -0.010579}', '{"alt": 55.5, "lat": 51.509, "lon": -0.010509}', '{"alt": 55.5, "lat": 51.509, "lon": -0.010519}', NULL, NULL),
	(3, 'OPS-3', 51.5391, -0.010675, 3.49, 'AXIS', 'M3104-L', '1080x1920', 1, 'https://s3-eu-west-1.amazonaws.com/jamcams.tfl.gov.uk/00001.09401.mp4', 'OPS3_close.jpg', 'OPS3_full.jpg', '{"alt": 58.5, "lat": 51.5391, "lon": -0.010675}', '{"alt": 55.5, "lat": 51.5391, "lon": -0.010675}', '{"alt": 55.5, "lat": 51.5301, "lon": -0.010605}', '{"alt": 55.5, "lat": 51.5301, "lon": -0.010615}', NULL, NULL),
	(4, 'OPS-4', 51.5395, -0.011017, 3.63, 'AXIS', 'M3104-L', '1080x1920', 1, 'https://s3-eu-west-1.amazonaws.com/jamcams.tfl.gov.uk/00001.09401.mp4', 'OPS4_close.jpg', 'OPS4_full.jpg', '{"alt": 58.5, "lat": 51.5395, "lon": -0.011017}', '{"alt": 55.5, "lat": 51.5395, "lon": -0.011017}', '{"alt": 55.5, "lat": 51.5305, "lon": -0.011097}', '{"alt": 55.5, "lat": 51.5305, "lon": -0.011091}', NULL, NULL),
	(5, 'OPS-5', 51.54, -0.011442, 4, 'AXIS', 'M3075-V', '1080x1920', 0, 'https://s3-eu-west-1.amazonaws.com/jamcams.tfl.gov.uk/00001.09401.mp4', 'OPS5_6_close.jpg', 'OPS5_6_full.jpg', '{"alt": 58.5, "lat": 51.54, "lon": -0.011442}', '{"alt": 55.5, "lat": 51.54, "lon": -0.011442}', '{"alt": 55.5, "lat": 51.542, "lon": -0.011402}', '{"alt": 55.5, "lat": 51.542, "lon": -0.011492}', NULL, NULL),
	(6, 'OPS-6', 51.54, -0.011442, 5.29, 'AXIS', 'M3104-L', '1080x1920', 0, 'https://s3-eu-west-1.amazonaws.com/jamcams.tfl.gov.uk/00001.09401.mp4', 'OPS5_6_close.jpg', 'OPS5_6_full.jpg', '{"alt": 58.5, "lat": 51.54, "lon": -0.011442}', '{"alt": 55.5, "lat": 51.54, "lon": -0.011442}', '{"alt": 55.5, "lat": 51.549, "lon": -0.011402}', '{"alt": 55.5, "lat": 51.549, "lon": -0.011452}', NULL, NULL),
	(7, 'OPS-7', 51.5405, -0.011923, 3.8, 'AXIS', 'M3104-C', '1080x1920', 1, 'https://s3-eu-west-1.amazonaws.com/jamcams.tfl.gov.uk/00001.09401.mp4', 'OPS7_close.jpg', 'OPS7_full.jpg', '{"alt": 58.5, "lat": 51.5405, "lon": -0.011923}', '{"alt": 55.5, "lat": 51.5405, "lon": -0.011923}', '{"alt": 55.5, "lat": 51.5495, "lon": -0.011993}', '{"alt": 55.5, "lat": 51.5495, "lon": -0.011998}', NULL, NULL),
	(8, 'OPS-8', 51.5404, -0.011605, 2.71, 'AXIS', 'M3104-L', '1080x1920', 1, 'https://s3-eu-west-1.amazonaws.com/jamcams.tfl.gov.uk/00001.09401.mp4', 'OPS8_close.jpg', 'OPS8_full.jpg', '{"alt": 58.5, "lat": 51.5404, "lon": -0.011605}', '{"alt": 55.5, "lat": 51.5404, "lon": -0.011605}', '{"alt": 55.5, "lat": 51.54, "lon": -0.011005}', '{"alt": 55.5, "lat": 51.54, "lon": -0.011055}', NULL, NULL),
	(9, 'OPS-9', 51.5395, -0.010677, 4.1, 'AXIS', 'M3104-L', '1080x1920', 1, 'https://s3-eu-west-1.amazonaws.com/jamcams.tfl.gov.uk/00001.09401.mp4', 'OPS9_close.jpg', 'OPS9_full.jpg', '{"alt": 58.5, "lat": 51.5395, "lon": -0.010677}', '{"alt": 55.5, "lat": 51.5395, "lon": -0.010677}', '{"alt": 55.5, "lat": 51.5305, "lon": -0.010607}', '{"alt": 55.5, "lat": 51.5305, "lon": -0.010657}', NULL, NULL),
	(10, 'OPS-10', 51.5393, -0.009992, 3.39, 'AXIS', 'M3075-V', '1080x1920', 1, 'https://s3-eu-west-1.amazonaws.com/jamcams.tfl.gov.uk/00001.09401.mp4', 'OPS10_close.jpg', 'OPS10_full.jpg', '{"alt": 58.5, "lat": 51.5393, "lon": -0.009992}', '{"alt": 55.5, "lat": 51.5393, "lon": -0.009992}', '{"alt": 55.5, "lat": 51.5303, "lon": -0.009902}', '{"alt": 55.5, "lat": 51.5303, "lon": -0.009909}', NULL, NULL),
	(11, 'OPS-11', 51.5392, -0.009596, 3.5, 'AXIS', 'M3104-L', '1080x1920', 1, 'https://s3-eu-west-1.amazonaws.com/jamcams.tfl.gov.uk/00001.09401.mp4', 'OPS11_close.jpg', 'OPS11_full.jpg', '{"alt": 58.5, "lat": 51.5392, "lon": -0.009596}', '{"alt": 55.5, "lat": 51.5392, "lon": -0.009596}', '{"alt": 55.5, "lat": 51.5302, "lon": -0.009506}', '{"alt": 55.5, "lat": 51.5302, "lon": -0.009509}', NULL, NULL),
	(12, 'OPS-12', 51.5395, -0.009176, 3.68, 'AXIS', 'M3075-V', '1080x1920', 1, 'https://s3-eu-west-1.amazonaws.com/jamcams.tfl.gov.uk/00001.09401.mp4', 'OPS12_close.jpg', 'OPS12_full.jpg', '{"alt": 58.5, "lat": 51.5395, "lon": -0.009176}', '{"alt": 55.5, "lat": 51.5395, "lon": -0.009176}', '{"alt": 55.5, "lat": 51.5305, "lon": -0.009106}', '{"alt": 55.5, "lat": 51.5305, "lon": -0.009109}', NULL, NULL),
	(13, 'OPS-13', 51.54, -0.009318, 3.33, 'AXIS', 'M3104-L', '1080x1920', 1, 'https://s3-eu-west-1.amazonaws.com/jamcams.tfl.gov.uk/00001.09401.mp4', 'OPS13_close.jpg', 'OPS13_full.jpg', '{"alt": 58.5, "lat": 51.54, "lon": -0.009318}', '{"alt": 55.5, "lat": 51.54, "lon": -0.009318}', '{"alt": 55.5, "lat": 51.52, "lon": -0.009308}', '{"alt": 55.5, "lat": 51.52, "lon": -0.009398}', NULL, NULL),
	(14, 'OPS-14', 51.5406, -0.009695, 5.01, 'AXIS', 'M3104-L', '1080x1920', 1, 'https://s3-eu-west-1.amazonaws.com/jamcams.tfl.gov.uk/00001.09401.mp4', 'OPS14_close.jpg', 'OPS14_full.jpg', '{"alt": 58.5, "lat": 51.5406, "lon": -0.009695}', '{"alt": 55.5, "lat": 51.5406, "lon": -0.009695}', '{"alt": 55.5, "lat": 51.5496, "lon": -0.009605}', '{"alt": 55.5, "lat": 51.5496, "lon": -0.009609}', NULL, NULL),
	(15, 'OPS-15', 51.5403, -0.008771, 4.6, 'Panasonic', 'M3075-B', '1080x1920', 0, 'https://s3-eu-west-1.amazonaws.com/jamcams.tfl.gov.uk/00001.09401.mp4', 'OPS15_16_close.jpg', 'OPS15_16_full.jpg', '{"alt": 58.5, "lat": 51.5403, "lon": -0.008771}', '{"alt": 55.5, "lat": 51.5403, "lon": -0.008771}', '{"alt": 55.5, "lat": 51.5493, "lon": -0.008701}', '{"alt": 55.5, "lat": 51.5493, "lon": -0.008709}', NULL, NULL),
	(16, 'OPS-16', 51.5403, -0.008771, 4.7, 'AXIS', 'M3104-L', '1080x1920', 0, 'https://s3-eu-west-1.amazonaws.com/jamcams.tfl.gov.uk/00001.09401.mp4', 'OPS15_16_close.jpg', 'OPS15_16_full.jpg', '{"alt": 58.5, "lat": 51.5403, "lon": -0.008771}', '{"alt": 55.5, "lat": 51.5403, "lon": -0.008771}', '{"alt": 55.5, "lat": 51.5493, "lon": -0.008701}', '{"alt": 55.5, "lat": 51.5493, "lon": -0.008729}', NULL, NULL);
/*!40000 ALTER TABLE `cameras` ENABLE KEYS */;

/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IF(@OLD_FOREIGN_KEY_CHECKS IS NULL, 1, @OLD_FOREIGN_KEY_CHECKS) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
