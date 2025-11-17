-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Nov 14, 2025 at 07:42 AM
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
-- Database: `jpmc`
--

-- --------------------------------------------------------

--
-- Table structure for table `about_certifications`
--

CREATE TABLE `about_certifications` (
  `id` int(11) NOT NULL,
  `title` varchar(255) NOT NULL,
  `image` varchar(255) NOT NULL,
  `display_order` int(11) NOT NULL DEFAULT 0,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `about_certifications`
--

INSERT INTO `about_certifications` (`id`, `title`, `image`, `display_order`, `created_at`, `updated_at`) VALUES
(1, 'ISO 9001 Certified : 2015', 'ISO 9001.png', 1, '2025-05-28 08:27:06', '2025-08-14 01:45:50'),
(2, 'ISO 14001 Certified : 2015', 'ISO 14001.png', 2, '2025-05-28 08:27:06', '2025-08-13 19:56:13'),
(3, 'RoHS Compliant', 'RoHS.png', 3, '2025-05-28 08:27:06', '2025-08-13 19:57:03'),
(4, 'REACH Compliant', 'REACH.png', 4, '2025-05-28 08:27:06', '2025-08-13 19:57:14'),
(5, 'cGMP Compliant', 'cGMP.png', 5, '2025-07-03 01:43:51', '2025-08-13 19:57:26'),
(6, 'TQCSI 9001 - Quality Certified', 'TQCSI 9001.png', 6, '2025-07-04 05:45:31', '2025-08-13 19:57:39'),
(7, 'TQCSI 14001 - Environmentally Awareness', 'TQCSI 14001.png', 7, '2025-07-04 05:46:04', '2025-08-13 19:57:52'),
(8, 'BEST', 'BEST.png', 8, '2025-07-07 02:42:32', '2025-08-13 19:58:00');

-- --------------------------------------------------------

--
-- Table structure for table `about_csr`
--

CREATE TABLE `about_csr` (
  `id` int(11) NOT NULL,
  `title` varchar(255) NOT NULL,
  `subtitle` text DEFAULT NULL,
  `author_credit` varchar(255) DEFAULT NULL,
  `image` varchar(255) NOT NULL,
  `display_order` int(11) NOT NULL DEFAULT 0,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `about_csr`
--

INSERT INTO `about_csr` (`id`, `title`, `subtitle`, `author_credit`, `image`, `display_order`, `created_at`, `updated_at`) VALUES
(2, 'OJT Mission Statement', 'To provide students with meaningful on-the-job training that prepares them for real-world work environments, equips them with practical experience, and enhances their employability for future career opportunities.', 'Photo by JPMC', 'OJT Mission Statement.jpg', 1, '2025-07-14 06:22:21', '2025-08-15 01:00:05'),
(3, 'Promoting Responsible Plastic Disposal', 'As a polymer manufacturer, we advocate for proper plastic waste segregation and disposal. This initiative encourages individuals and communities to dispose of plastics correctly using designated recycle bins, helping reduce pollution and protect ecosystems from long-term plastic harm.', 'Photo by Julio Lopez', 'Promoting Responsible Plastic Disposal.jpg', 2, '2025-07-14 06:37:09', '2025-08-15 01:00:11');

-- --------------------------------------------------------

--
-- Table structure for table `about_sections`
--

CREATE TABLE `about_sections` (
  `id` int(11) NOT NULL,
  `section_name` varchar(50) NOT NULL,
  `title` varchar(255) NOT NULL,
  `subtitle` text DEFAULT NULL,
  `content` text NOT NULL,
  `image` varchar(255) DEFAULT NULL,
  `position` varchar(255) NOT NULL,
  `audio` varchar(255) NOT NULL,
  `display_order` int(11) NOT NULL DEFAULT 0,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `about_sections`
--

INSERT INTO `about_sections` (`id`, `section_name`, `title`, `subtitle`, `content`, `image`, `position`, `audio`, `display_order`, `created_at`, `updated_at`) VALUES
(1, 'company_profile', 'as a Company...', 'For over three decades, James Polymers has been at the forefront of polymer innovation, delivering high-performance material solutions to industries worldwide.', 'Founded in 1980, initially, it was drawn up to start with manufacturing rubber molded items and its allied products in as much as the founder’s experience for almost fifteen years in the rubber industry had provided him enough technical and production know-how. Eventually, the operation was streamlined to start with plastic as its main product line and rubber as its support product. As the company expanded its operation we added a new annex building to accommodate some of the additional injection machines and other equipment needed. We also maintained our rubber section in this building to cater those customers who seek our services in the rubber molding and lining jobs, be it on job-site or in-house. James Polymers had acquired mold fabrication equipment including our latest machining center that could fabricate mold in a very short time and these are located in the old plant. These improvements enhance our capability to serve our customers better and faster. In our continuous effort to upgrade our operation, this company applied for ISO 14001 approved in 2004.', 'Company Profile.png', '', '', 1, '2025-05-28 08:27:06', '2025-08-15 09:03:28'),
(2, 'mission', 'Our Mission', '', 'James Polymers Manufacturing is dedicated to achieving excellence in plastic injection molding and rubber compression molding processing in the industry by providing quality, service, and competitive pricing to our customers.\r\n\r\nWe aim to be internationally competitive in the world market by setting a milestone that will open a door of opportunities which will be wholly embraced and accepted by the international market and linger the eyes of Filipinos that we can also be a great leader in our own simple ways.\r\n\r\nWe aim to support long-term economic growth and progress in the regions where we operate, as well as caring for the environment and ensuring sustainable use of natural \r\n', NULL, '', '', 2, '2025-05-28 08:27:06', '2025-07-16 06:47:59'),
(3, 'vision', 'Our Vision', '', 'Achieve a profitable and growth-oriented organization satisfying its employees, customers, and community through continual improvement.  ', NULL, '', '', 3, '2025-05-28 08:27:06', '2025-07-16 06:48:18'),
(4, 'quality_policy', 'Quality Assurance', NULL, 'In the world of service and manufacturing product, people recognized things that are more reliable, dependable, and other characteristics, which leads to \"SATISFACTION THRU QUALITY\".', NULL, '', '', 4, '2025-05-28 08:27:06', '2025-05-28 08:27:06'),
(5, 'environmental_policy', 'Environmental Policy', NULL, 'Our commitment to environmental sustainability drives our manufacturing processes and product development.', NULL, '', '', 5, '2025-05-28 08:27:06', '2025-05-28 08:27:06'),
(6, 'presidents_message', 'A Message from Our President', 'Leadership Vision', ' As we enter another year, James Polymers Mfg. Corp. remains committed to innovation and excellence in plastic injection and moulded rubber solutions. Our focus on quality, sustainability, and advanced technology positions us to lead in setting new industry standards. Over the next decade, we aim to enhance efficiency and sustainability, embrace smart technologies, and expand globally. Together with our partners, we strive to transform industries and create a more sustainable future. Thank you for your continued support.', NULL, 'President & CEO', 'President Message.mp3', 6, '2025-06-25 07:44:41', '2025-08-19 06:18:42');

-- --------------------------------------------------------

--
-- Table structure for table `about_timeline`
--

CREATE TABLE `about_timeline` (
  `id` int(11) NOT NULL,
  `title` varchar(255) NOT NULL,
  `description` text NOT NULL,
  `photo` varchar(255) DEFAULT NULL,
  `year` varchar(10) NOT NULL,
  `display_order` int(11) NOT NULL DEFAULT 0,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `about_timeline`
--

INSERT INTO `about_timeline` (`id`, `title`, `description`, `photo`, `year`, `display_order`, `created_at`, `updated_at`) VALUES
(1, 'Company Founded', 'Founded in 1980, James Polymers started with rubber products and later expanded to plastics as its main line, while still offering rubber services.', NULL, '1980', 1, '2025-05-28 08:27:06', '2025-08-19 07:28:16'),
(2, 'First Production Facility', 'The company’s first clients came from the appliance and paint industries, marking the beginning of its business growth.', 'Panasonic & Dutch Boy.png', '1980-1985', 2, '2025-05-28 08:27:06', '2025-08-19 07:30:22'),
(3, 'Brand New Clients', 'The company gained brand new clients such as ACS and Purefoods, expanding its reach into their respective industries.', 'ACS & Purefoods.png', '1985-1990', 3, '2025-05-28 08:27:06', '2025-08-19 07:33:33'),
(4, 'Continental Joins as a Valued Client', 'The company added Continental, a global leader in the automotive and tire manufacturing industry, to its growing list of partners.', 'Continental.png', '1995', 4, '2025-05-28 08:27:06', '2025-08-19 07:35:34'),
(5, 'Strong Partnerships Through ISO-Certified Excellence', 'After achieving ISO 14001:2015 and ISO 9001:2015 certifications, the company earned the trust of renowned firms across diverse industries. Appliances, automotive, electric & manufacturing technology.', 'Multiple Companies.png', '2000-2010', 5, '2025-05-28 08:27:06', '2025-08-19 07:40:04'),
(6, 'Current Operations (Production and Delivery)', 'Current operations are actively focused on the production and timely delivery of high-quality components and packaging solutions to our valued partners.', 'Koppel & Unilab.png', '2010-2025', 6, '2025-05-28 08:27:06', '2025-08-14 01:59:16'),
(7, 'ISO 14001:2015 & 9001:2015 Recertification', 'To establish the company\'s former quality & environmental management system.', NULL, '2025', 7, '2025-08-12 01:34:21', '2025-08-19 07:36:16');

-- --------------------------------------------------------

--
-- Table structure for table `admin_otp`
--

CREATE TABLE `admin_otp` (
  `id` int(11) NOT NULL,
  `admin_id` int(11) NOT NULL,
  `email` varchar(255) NOT NULL,
  `otp_code` varchar(6) NOT NULL,
  `expires_at` datetime NOT NULL,
  `used` tinyint(1) NOT NULL DEFAULT 0,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `admin_users`
--

CREATE TABLE `admin_users` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL,
  `is_active` tinyint(1) NOT NULL DEFAULT 1,
  `last_login` datetime DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `admin_users`
--

INSERT INTO `admin_users` (`id`, `name`, `email`, `password`, `is_active`, `last_login`, `created_at`, `updated_at`) VALUES
(9, 'admin', 'admin@gmail.com', '$2y$10$UJpyr/FoDOdVmOllPjtxxe8aOnlEB5ZPzP3VWTCcha.sexBhWOR06', 1, '2025-11-14 10:46:17', '2025-11-13 07:40:41', '2025-11-14 02:46:17');

-- --------------------------------------------------------

--
-- Table structure for table `awards`
--

CREATE TABLE `awards` (
  `id` int(255) NOT NULL,
  `title` varchar(300) NOT NULL,
  `description` varchar(300) NOT NULL,
  `year` varchar(300) NOT NULL,
  `icon` varchar(300) NOT NULL,
  `event_title` varchar(300) NOT NULL,
  `image` varchar(300) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `awards`
--

INSERT INTO `awards` (`id`, `title`, `description`, `year`, `icon`, `event_title`, `image`) VALUES
(1, 'Certificate of Recognition', 'Best Trusted Plastic Injection & Molded Rubber Products Manufacturer. The Golden Globe Annual Awards for Business Excellence (GGAABE) is a recognition that searches for companies and brands that exhibit innovative business practices, deliver quality products and services, epitomize customer concern ', '2023', 'fa-medal', 'Golden Globe Annual Awards For Business Excellence', '1763024801_1763024650_biggold_frame.jpg'),
(2, 'Service Award', 'In sincere recognition of meritorious and dedicated service rendered to our Company throughout the years and for having manifested its deep commitment and untiring support towards the realization of our common goals and visions. Given this 10th Day of June, in the Year of our Lord, two thousand and ', '2004', 'Fa-Medal', 'Matsushita Electric Philippines Corporation (MEPCO) Panasonic Communication Imaging Corp. of the Phils. (PCIP)', 'illuminati_logo.jpg'),
(3, 'Achievement Award', 'In sincere recognition of its outstanding effort and dedicated support in all the Panasonic Group of Companies in the Philippines (PGCP) Business operations, more specifically in acquiring the ISO 14001 Certification, which contributed immeasurably to PGCP towards attaining one of the major directiv', '2005', 'Fa-Medal', 'Panasonic Group of Companies in the Philippines', 'better_shark_fin.jpg'),
(4, 'Plaque of Appreciation', 'In appreciation of continuous support and valuable services rendered to Matsushita Electric Philippines Corporation and Matsushita Communication Industrial Corporation of the Philippines from April 1995 to March 1996. Given this 31st Day of May, in the year of our Lord, Nineteen hundred and ninety s', '1996', 'fa-Medal', 'Matsushita Electric Philippines Corporation Matsushita Communication Industrial Corp. of the Phils.', 'shark_fin_award.jpg'),
(5, 'Total Quality Achievement Award', 'Preferred Supplier. Given this 3rd day of May 2011 at Bayanihan Center, United Laboratories Inc.', '2011', 'fa-medal', 'United Laboratories Inc.', 'malaking_T.jpg'),
(6, 'Certificate of Appreciation', 'For continuous support and cooperation given to Koppel Incorporated. Given this 7th day of December 2012 at Tiara Oriental Hotel, Makati City, Philippines', '2012', 'fa-medal', 'Koppel Incorporated', 'koppel.jpg'),
(7, 'Best in Delivery', 'In recognition of your valuable service in providing punctual delivery of parts of material to Concepcion Durables, Incorporated thus contributing to the company\'s timely production of finished goods from January to March 2008. Given this 29th day of April two thousand and eight during CDi Supplier\'', '2008', 'fa-medal', 'Concepcion Durables, Inc.', 'best_in_delivery.jpg'),
(8, 'Certificate of Recognition', 'Certificate of Recognition to James Polymer Manufacturing for being a SGS Quality Partner through its successful certification to ISO 9001:2000 Quality Management Systems in June 2007. Given this 12th day of September 2008 on the occasion of the SGS Quality Network Forum Appreciation Night at the To', '2008', 'fa-medal', 'SGS Quality Network Forum Appreciation Night', 'SGS_bluebird.jpg'),
(9, 'Best in Environmental Management System Award', 'In recognition of its outstanding Environmental Management System performance from April 2006 to March 2007; and in acknowledgement of its continuous support and cooperation in complying to our RoHS requirements thus ensuring the non-use of hazardous substances in the materials and parts being suppl', '2007', 'fa-medal', 'Panasonic Manufacturing Philippines Corporation', 'mahabang_blue_may_E.jpg'),
(10, 'Plaque of Appreciation', 'In recognition for its continuous support and dedicated services rendered to all the Matsushita Philippines Group of Companies\' business operations from April 1998 to March 1999. Given this 30th day of April, in the Year of our Lord, nineteen hundred and ninety nine at City Garden, Mandaluyong City.', '1999', 'fa-medal', 'Matsushita Philippines Group of Companies\' business operations', 'plaque2matsushita.jpg'),
(11, 'Plaque of Appreciation', 'In recognition of continuous support and valuable services rendered to Matsushita Electric Philippines Corporation; Matsushita Communication Industrial Corporation of the Philippines and Matsushita Business Machine Corporation of the Philippines Business Operation from April 1996 to March 1997. Give', '1997', 'fa-medal', 'Matsushita Philippines Group Companies Business Operations', 'apprec_matsushita2.jpg'),
(12, 'Appreciation Award', 'In recognition of its continuous support and dedicated services rendered to the business operations of Panasonic Group of Companies in the Philippines from April 2007 to March 2008. Given this 27th day of June, in the Year of our Lord, two thousand and eight at Dusit Thani Manila Hotel, Makati City', '2008', 'fa-medal', 'Panasonic Manufacturing Philippines Corporation/Panasonic Communications Philippines Corporation', 'appawards1.jpg'),
(13, 'Appreciation Award', 'In recognition of its continuous support and dedicated services rendered to the business operation of MEPCO and MBP from April 2000 to March 2001. Given this 31st Day of August, in the Year of our Lord, two thousand and one at Dusit Hotel Nikko, Makati City', '2001', 'fa-medal', 'Matsushita Electric Philippines Corporations (MEPCO), Matsushita Business Machine Corp, of the Philippines (MBP)', 'appmatsushita.jpg'),
(14, 'Plaque of Appreciation', 'In recognition of the continuous support and valuable services rendered to Matsushita Electric Philippines Corporation of the Philippines and Matsushita Business Machine Corporation of the Philippines business operations from April 1997 to March 1998', '1998', 'fa-medal', 'Matsushita Electric Philippines Corporation and Matsushita Business Machine Corporation', 'appawards2.jpg'),
(15, 'CERTECH ANAB - ISO 14001: 2004 Environmental Management System', 'ISO 14001: 2004 Environmental Management System covering the Manufacture of Molded Rubber and Plastic Products through Compression Molding and Plastic Injection Process, respectively at 016 Panapaan 2, Aguinaldo Highway & 35 Coastal Green, Panapaan 1 Bacoor, Cavite, Philippines 4102', '2004', 'fa-medal', 'Certech Registration Inc.', 'newiso4001.jpg'),
(16, 'Best Trusted Plastic Injection & Molded Rubber Products Manufacturer', 'Golden Globe Annual Awards for Business Excellence & Outstanding Filipino Achievers ', '2023', 'fa-medal', 'Golden Globe Awards', 'BEST.jpg'),
(18, 'All Awards', 'A showcase of our prestigious awards and certifications, reflecting excellence, quality, and commitment across all aspects of our operations.', '1996 - 2023', 'fa-medal', '', 'AWARDS.avif'),
(19, 'SGS - ISO 14001:2004 Environmental Management System', 'ISO 14001: 2004 Environmental Management System covering the Manufacture of Molded Rubber and Plastic Products through Compression Molding and Plastic Injection Process, respectively at 016 Panapaan 2, Aguinaldo Highway & 35 Coastal Green, Panapaan 1 Bacoor, Cavite, Philippines 4102', '2004', 'fa-trophy', '', '1763025372_SGS.jpg');

-- --------------------------------------------------------

--
-- Table structure for table `award_timeline`
--

CREATE TABLE `award_timeline` (
  `id` int(11) NOT NULL,
  `title` varchar(255) NOT NULL,
  `description` text NOT NULL,
  `date` date NOT NULL,
  `icon` varchar(50) NOT NULL DEFAULT 'fa-trophy',
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `award_timeline`
--

INSERT INTO `award_timeline` (`id`, `title`, `description`, `date`, `icon`, `created_at`, `updated_at`) VALUES
(1, 'Best Trusted Plastic Injection & Molded Rubber Products Manufacturer', 'Golden Globe Annual Awards for Business Excellence & Outstanding Filipino Achievers', '2023-03-15', 'fa-trophy', '2025-05-23 01:41:44', '2025-10-01 06:02:08'),
(2, 'Green Manufacturing Certification', 'Achieved Green Manufacturing Certification for our sustainable production processes and reduced environmental footprint.', '2021-03-15', 'fa-leaf', '2025-05-23 01:41:44', '2025-05-23 01:41:44'),
(3, 'Export Excellence Award', 'Recognized for outstanding export performance and contribution to the national economy.', '2020-11-20', 'fa-medal', '2025-05-23 01:41:44', '2025-05-23 01:41:44'),
(4, 'ISO 9001:2015 Certification', 'Successfully implemented Quality Management System and achieved ISO 9001:2015 certification.', '2019-08-10', 'fa-certificate', '2025-05-23 01:41:44', '2025-05-23 01:41:44');

-- --------------------------------------------------------

--
-- Table structure for table `careers_applications`
--

CREATE TABLE `careers_applications` (
  `id` int(11) NOT NULL,
  `position_id` int(11) NOT NULL,
  `first_name` varchar(100) NOT NULL,
  `last_name` varchar(100) NOT NULL,
  `email` varchar(255) NOT NULL,
  `phone` varchar(50) NOT NULL,
  `has_skills` enum('Yes','No') NOT NULL,
  `hours_required` int(11) DEFAULT NULL,
  `work_onsite` enum('yes','no','hybrid') NOT NULL,
  `resume_url` varchar(500) DEFAULT NULL,
  `status` enum('pending','reviewed','shortlisted','rejected','hired') NOT NULL DEFAULT 'pending',
  `notes` text DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `careers_applications`
--

INSERT INTO `careers_applications` (`id`, `position_id`, `first_name`, `last_name`, `email`, `phone`, `has_skills`, `hours_required`, `work_onsite`, `resume_url`, `status`, `notes`, `created_at`, `updated_at`) VALUES
(1, 5, 'MELCHOR ADRIAN', 'LIBARNES', 'rianlibarnes@gmail.com', '09062613043', 'Yes', 468, 'yes', 'http://localhost/JPMC2/uploads/resumes/6858f1c5f3a55_Libarnes, Melchor Adrian Resume.pdf', 'pending', NULL, '2025-06-23 06:18:46', '2025-06-23 06:18:46'),
(2, 5, 'MELCHOR ADRIAN', 'LIBARNES', 'rianlibarnes@gmail.com', '09062613043', 'Yes', 486, 'yes', 'http://localhost/JPMC2/uploads/resumes/685d08fa80d17_2 OJT2025-Placement (1).docx', 'pending', NULL, '2025-06-26 08:46:50', '2025-06-26 08:46:50'),
(3, 5, 'MELCHOR ADRIAN', 'LIBARNES', 'rianlibarnes@gmail.com', '09062613043', 'Yes', 468, 'yes', 'http://localhost/JPMC2/uploads/resumes/685defdfd583a_6858f1c5f3a55_Libarnes, Melchor Adrian Resume.pdf', 'pending', NULL, '2025-06-27 01:11:59', '2025-06-27 01:11:59'),
(4, 8, 'MELCHOR ADRIAN', 'LIBARNES', 'rianlibarnes@gmail.com', '09062613043', 'Yes', 486, 'yes', 'http://localhost/JPMC2/uploads/resumes/685df177a48e0_6858f1c5f3a55_Libarnes, Melchor Adrian Resume (1).pdf', 'pending', NULL, '2025-06-27 01:18:47', '2025-06-27 01:18:47'),
(5, 5, 'Melchor Adrian', 'Libarnes', 'rianlibarnes@gmail.com', '09062613043', 'Yes', 486, 'yes', 'https://jamespolymersmcorp.kesug.com/uploads/resumes/685dfa92e0eed_1750989458.pdf', 'pending', NULL, '2025-06-27 01:57:38', '2025-06-27 01:57:38'),
(6, 5, 'Melchor Adrian', 'Libarnes', 'rianlibarnes@gmail.com', '09062613043', 'Yes', 486, 'yes', 'https://jamespolymersmcorp.kesug.com/uploads/resumes/685dfb70a55ca_1750989680.pdf', 'pending', NULL, '2025-06-27 02:01:20', '2025-06-27 02:01:20'),
(7, 4, 'sample', 'sample', 'sample@email.com', '09123456789', 'Yes', 0, 'yes', 'https://jamespolymers.com/JPMC2/uploads/resumes/6875ce07137bb_handsanitizerlogo.pdf', 'pending', NULL, '2025-07-15 03:41:59', '2025-07-15 03:41:59'),
(8, 4, 'nathaniel', 'navarriti', 'natnavariti@gmail.com', '09123456789', 'Yes', 0, 'yes', 'https://jamespolymers.com/JPMC2/uploads/resumes/6876fe8ac1320_SBS Flyer.pdf', 'pending', NULL, '2025-07-16 01:21:14', '2025-07-16 01:21:14'),
(10, 2, 'Dan', 'evia', 'danielrossevia@gmail.com', '09946122359', 'Yes', 0, 'yes', 'http://localhost/JPMC2/uploads/resumes/68d366c75c1f4_CIE 136 - P2 Laboratory no. 3.pdf', 'pending', NULL, '2025-09-24 03:34:31', '2025-09-24 03:34:31'),
(11, 2, 'Dan', 'evia', 'danielrossevia@gmail.com', '09946122359', 'Yes', 0, 'yes', 'http://localhost/JPMC2/uploads/resumes/68d37cc9e3059_CIE 136 - P2 Laboratory no. 3.pdf', 'pending', NULL, '2025-09-24 05:08:25', '2025-09-24 05:08:25'),
(12, 2, 'Dan', 'evia', 'danielrossevia@gmail.com', '09946122359', 'Yes', 0, 'yes', 'http://localhost/JPMC2/uploads/resumes/68d385a5bad5c_CIE 136 - P2 Laboratory no. 3.pdf', 'pending', NULL, '2025-09-24 05:46:13', '2025-09-24 05:46:13'),
(13, 1, 'Daniel Ross', 'Evia', 'danielrossevia@gmail.com', '09946122359', 'Yes', 0, 'yes', 'http://localhost/dashboard/JPMC/uploads/resumes/68e3211e5a6e8_13.Evaluation Form (2).pdf', 'pending', NULL, '2025-10-06 01:53:34', '2025-10-06 01:53:34');

-- --------------------------------------------------------

--
-- Table structure for table `careers_benefits`
--

CREATE TABLE `careers_benefits` (
  `id` int(11) NOT NULL,
  `title` varchar(255) NOT NULL,
  `description` text NOT NULL,
  `icon` varchar(100) NOT NULL DEFAULT 'fas fa-heartbeat',
  `is_active` tinyint(1) NOT NULL DEFAULT 1,
  `display_order` int(11) NOT NULL DEFAULT 0,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `careers_benefits`
--

INSERT INTO `careers_benefits` (`id`, `title`, `description`, `icon`, `is_active`, `display_order`, `created_at`, `updated_at`) VALUES
(1, 'COMING SOON', '', 'fa-solid fa-question', 1, 1, '2025-06-23 05:41:51', '2025-07-17 03:28:37'),
(2, 'COMING SOON', '', 'fa-solid fa-question', 1, 2, '2025-06-23 05:41:51', '2025-07-17 03:29:05'),
(3, 'COMING SOON', '', 'fa-solid fa-question', 1, 3, '2025-06-23 05:41:51', '2025-07-17 03:29:17'),
(4, 'COMING SOON', '', 'fa-solid fa-question', 1, 4, '2025-06-23 05:41:51', '2025-07-17 03:29:29');

-- --------------------------------------------------------

--
-- Table structure for table `careers_positions`
--

CREATE TABLE `careers_positions` (
  `id` int(11) NOT NULL,
  `title` varchar(255) NOT NULL,
  `type` enum('full-time','internship') NOT NULL DEFAULT 'full-time',
  `shift` varchar(100) NOT NULL,
  `schedule` varchar(255) NOT NULL,
  `location` varchar(255) NOT NULL,
  `description` text NOT NULL,
  `image` varchar(255) DEFAULT NULL,
  `is_active` tinyint(1) NOT NULL DEFAULT 1,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `careers_positions`
--

INSERT INTO `careers_positions` (`id`, `title`, `type`, `shift`, `schedule`, `location`, `description`, `image`, `is_active`, `created_at`, `updated_at`) VALUES
(1, 'Senior Software Engineer', 'full-time', 'Day Shift', 'Monday to Friday, 9:00 AM - 6:00 PM', 'On-site', 'Join our engineering team to build innovative solutions for the polymer industry. You will be responsible for developing and maintaining software systems, collaborating with cross-functional teams, and implementing best practices in software development. This role requires strong technical expertise and the ability to lead complex projects.', 'https://images.unsplash.com/photo-1517694712202-14dd9538aa97?w=500', 1, '2025-06-23 05:41:51', '2025-06-23 05:48:30'),
(2, 'Product Manager', 'full-time', 'Day Shift', 'Monday to Friday, 8:00 AM - 5:00 PM', 'On-site', 'Lead product development and strategy in a fast-paced environment. You will be responsible for defining product vision, gathering requirements, and working with cross-functional teams to deliver successful products. This role requires strong leadership skills and the ability to balance business objectives with technical constraints.', 'https://images.unsplash.com/photo-1553877522-43269d4ea984?w=500', 1, '2025-06-23 05:41:51', '2025-06-23 05:41:51'),
(3, 'Business Development Manager', 'full-time', 'Day Shift', 'Monday to Friday, 8:30 AM - 5:30 PM', 'On-site', 'Drive strategic partnerships and expand our business to new markets. You will be responsible for identifying growth opportunities, developing business relationships, and creating strategies to increase market share. This role requires strong business acumen and excellent networking skills.', 'https://images.unsplash.com/photo-1552664730-d307ca884978?w=500', 1, '2025-06-23 05:41:51', '2025-06-23 05:48:17'),
(4, 'Manufacturing Engineer', 'full-time', 'Day Shift', 'Monday to Friday, 7:00 AM - 4:00 PM', 'On-site', 'Optimize production processes and ensure quality standards in our manufacturing facilities. You will be responsible for improving efficiency, reducing costs, and implementing new manufacturing technologies. This role requires strong technical knowledge and hands-on experience in manufacturing processes.', 'https://images.unsplash.com/photo-1599583863916-e06c29087f51?q=80&w=1584&auto=format&fit=crop&ixlib=rb-4.1.0&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D', 1, '2025-06-23 05:41:51', '2025-06-23 05:41:51'),
(5, 'IT Development Intern', 'internship', 'Day Shift', 'Monday to Friday, 9:00 AM - 5:00 PM', 'On-site', 'Learn and contribute to real-world projects with our engineering team. You will work on various software development tasks, participate in team meetings, and gain hands-on experience with modern development tools and practices.', 'https://images.unsplash.com/photo-1517694712202-14dd9538aa97?w=500', 1, '2025-06-23 05:41:51', '2025-06-23 05:49:02'),
(6, 'Marketing Intern', 'internship', 'Day Shift', 'Monday to Friday, 9:00 AM - 5:00 PM', 'On-site', 'Support our marketing team with campaigns and digital outreach. You will assist in creating content, managing social media, and analyzing marketing metrics. This role provides valuable experience in modern marketing practices.', 'https://images.unsplash.com/photo-1552664730-d307ca884978?w=500', 1, '2025-06-23 05:41:51', '2025-06-23 05:49:02'),
(7, 'Engineering Intern', 'internship', 'Day Shift', 'Monday to Friday, 8:00 AM - 4:00 PM', 'On-site', 'Contribute to cutting-edge research and product development initiatives. You will work alongside experienced engineers on real projects, gaining practical experience in engineering processes and methodologies.', 'https://static.vecteezy.com/system/resources/thumbnails/001/343/510/small_2x/engineering-plans-with-blueprint-free-photo.jpg', 1, '2025-06-23 05:41:51', '2025-06-23 05:41:51'),
(8, 'Human Resources Intern', 'internship', 'Day Shift', 'Monday to Friday, 9:00 AM - 5:00 PM', 'On-site', 'Learn HR operations, recruitment, and employee engagement strategies. You will assist in various HR functions, including recruitment, onboarding, and employee relations. This role provides comprehensive exposure to HR practices.', 'https://images.unsplash.com/photo-1553877522-43269d4ea984?w=500', 1, '2025-06-23 05:41:51', '2025-06-23 05:49:02'),
(9, 'Accounting Intern', 'internship', 'Day Shift', 'Monday to Friday, 9:00 AM - 5:00 PM', 'On-site', 'Support our accounting team with financial reporting and data management. Assist in bookkeeping, reconciling accounts, and preparing reports. This role provides valuable experience in core accounting practices and financial operations', 'https://images.unsplash.com/photo-1454165804606-c3d57bc86b40?q=80&w=1170&auto=format&fit=crop&ixlib=rb-4.1.0&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D', 1, '2025-08-09 03:01:21', '2025-08-09 03:01:21');

-- --------------------------------------------------------

--
-- Table structure for table `careers_qualifications`
--

CREATE TABLE `careers_qualifications` (
  `id` int(11) NOT NULL,
  `position_id` int(11) NOT NULL,
  `qualification` text NOT NULL,
  `display_order` int(11) NOT NULL DEFAULT 0,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `careers_qualifications`
--

INSERT INTO `careers_qualifications` (`id`, `position_id`, `qualification`, `display_order`, `created_at`) VALUES
(1, 1, 'Bachelor\'s degree in Computer Science or related field', 1, '2025-06-23 05:41:51'),
(2, 1, '5+ years of software development experience', 2, '2025-06-23 05:41:51'),
(3, 1, 'Strong knowledge of modern programming languages and frameworks', 3, '2025-06-23 05:41:51'),
(4, 1, 'Experience with cloud platforms and microservices architecture', 4, '2025-06-23 05:41:51'),
(5, 1, 'Excellent problem-solving and communication skills', 5, '2025-06-23 05:41:51'),
(6, 1, 'Experience in leading technical teams and mentoring junior developers', 6, '2025-06-23 05:41:51'),
(7, 2, 'Bachelor\'s degree in Business, Engineering, or related field', 1, '2025-06-23 05:41:51'),
(8, 2, '3+ years of product management experience', 2, '2025-06-23 05:41:51'),
(9, 2, 'Strong analytical and strategic thinking skills', 3, '2025-06-23 05:41:51'),
(10, 2, 'Experience with agile methodologies', 4, '2025-06-23 05:41:51'),
(11, 2, 'Excellent communication and leadership abilities', 5, '2025-06-23 05:41:51'),
(12, 2, 'Knowledge of polymer industry is a plus', 6, '2025-06-23 05:41:51'),
(13, 3, 'Bachelor\'s degree in Business Administration or related field', 1, '2025-06-23 05:41:51'),
(14, 3, '5+ years of business development experience', 2, '2025-06-23 05:41:51'),
(15, 3, 'Proven track record of successful partnerships and sales growth', 3, '2025-06-23 05:41:51'),
(16, 3, 'Strong negotiation and presentation skills', 4, '2025-06-23 05:41:51'),
(17, 3, 'Experience in the polymer or manufacturing industry', 5, '2025-06-23 05:41:51'),
(18, 3, 'Excellent relationship-building abilities', 6, '2025-06-23 05:41:51'),
(19, 4, 'Bachelor\'s degree in Manufacturing Engineering or related field', 1, '2025-06-23 05:41:51'),
(20, 4, '3+ years of manufacturing engineering experience', 2, '2025-06-23 05:41:51'),
(21, 4, 'Knowledge of lean manufacturing principles', 3, '2025-06-23 05:41:51'),
(22, 4, 'Experience with process optimization and quality control', 4, '2025-06-23 05:41:51'),
(23, 4, 'Strong problem-solving and analytical skills', 5, '2025-06-23 05:41:51'),
(24, 4, 'Familiarity with polymer manufacturing processes', 6, '2025-06-23 05:41:51'),
(25, 5, 'Currently pursuing a degree in Computer Science or related field', 1, '2025-06-23 05:41:51'),
(26, 5, 'Basic knowledge of programming languages', 2, '2025-06-23 05:41:51'),
(27, 5, 'Strong desire to learn and grow', 3, '2025-06-23 05:41:51'),
(28, 5, 'Good communication and teamwork skills', 4, '2025-06-23 05:41:51'),
(29, 5, 'Familiarity with software development concepts', 5, '2025-06-23 05:41:51'),
(30, 5, 'Available for 3-6 months internship', 6, '2025-06-23 05:41:51'),
(31, 6, 'Currently pursuing a degree in Marketing or related field', 1, '2025-06-23 05:41:51'),
(32, 6, 'Basic knowledge of digital marketing concepts', 2, '2025-06-23 05:41:51'),
(33, 6, 'Strong written and verbal communication skills', 3, '2025-06-23 05:41:51'),
(34, 6, 'Familiarity with social media platforms', 4, '2025-06-23 05:41:51'),
(35, 6, 'Creative thinking and problem-solving abilities', 5, '2025-06-23 05:41:51'),
(36, 6, 'Available for 3-6 months internship', 6, '2025-06-23 05:41:51'),
(37, 7, 'Currently pursuing a degree in Engineering', 1, '2025-06-23 05:41:51'),
(38, 7, 'Basic knowledge of engineering principles', 2, '2025-06-23 05:41:51'),
(39, 7, 'Strong analytical and problem-solving skills', 3, '2025-06-23 05:41:51'),
(40, 7, 'Good communication and teamwork abilities', 4, '2025-06-23 05:41:51'),
(41, 7, 'Familiarity with CAD software is a plus', 5, '2025-06-23 05:41:51'),
(42, 7, 'Available for 3-6 months internship', 6, '2025-06-23 05:41:51'),
(43, 8, 'Currently pursuing a degree in Human Resources or related field', 1, '2025-06-23 05:41:51'),
(44, 8, 'Basic knowledge of HR principles and practices', 2, '2025-06-23 05:41:51'),
(45, 8, 'Strong interpersonal and communication skills', 3, '2025-06-23 05:41:51'),
(46, 8, 'Attention to detail and organizational abilities', 4, '2025-06-23 05:41:51'),
(47, 8, 'Familiarity with HR software is a plus', 5, '2025-06-23 05:41:51'),
(48, 8, 'Available for 3-6 months internship', 6, '2025-06-23 05:41:51');

-- --------------------------------------------------------

--
-- Table structure for table `careers_testimonials`
--

CREATE TABLE `careers_testimonials` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `position` varchar(255) NOT NULL,
  `testimonial` text NOT NULL,
  `image` varchar(255) DEFAULT NULL,
  `is_active` tinyint(1) NOT NULL DEFAULT 1,
  `display_order` int(11) NOT NULL DEFAULT 0,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `careers_testimonials`
--

INSERT INTO `careers_testimonials` (`id`, `name`, `position`, `testimonial`, `image`, `is_active`, `display_order`, `created_at`, `updated_at`) VALUES
(1, 'Michael Chen', '', 'COMING SOON', 'https://cdn.pixabay.com/photo/2015/10/05/22/37/blank-profile-picture-973460_1280.png', 1, 1, '2025-06-23 05:41:51', '2025-07-17 03:19:57'),
(2, 'Sarah Johnson', '', 'COMING SOON', 'https://randomuser.me/api/portraits/women/44.jpg', 1, 2, '2025-06-23 05:41:51', '2025-07-17 02:58:20'),
(3, 'David Rodriguez', '', 'COMING SOON', 'https://randomuser.me/api/portraits/men/67.jpg', 1, 3, '2025-06-23 05:41:51', '2025-07-17 02:58:29');

-- --------------------------------------------------------

--
-- Table structure for table `content_section_images`
--

CREATE TABLE `content_section_images` (
  `id` int(11) NOT NULL,
  `section_id` int(11) NOT NULL,
  `image_path` varchar(255) NOT NULL,
  `alt_text` varchar(255) DEFAULT NULL,
  `display_order` int(11) NOT NULL DEFAULT 0,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `content_section_images`
--

INSERT INTO `content_section_images` (`id`, `section_id`, `image_path`, `alt_text`, `display_order`, `created_at`) VALUES
(51, 51, 'uploads/news_events/content_sections/1751961941_686cd155b0b11_0.jpg', '', 0, '2025-07-08 08:05:41'),
(52, 51, 'uploads/news_events/content_sections/1751961941_686cd155b10c6_1.jpg', '', 1, '2025-07-08 08:05:41'),
(53, 51, 'uploads/news_events/content_sections/1751961941_686cd155b143f_2.jpg', '', 2, '2025-07-08 08:05:41'),
(54, 51, 'uploads/news_events/content_sections/1751961941_686cd155b1701_3.jpg', '', 3, '2025-07-08 08:05:41'),
(55, 51, 'uploads/news_events/content_sections/1751961941_686cd155b190d_4.jpg', '', 4, '2025-07-08 08:05:41'),
(56, 51, 'uploads/news_events/content_sections/1751961941_686cd155b1aff_5.jpg', '', 5, '2025-07-08 08:05:41'),
(57, 51, 'uploads/news_events/content_sections/1751961941_686cd155b1d24_6.jpg', '', 6, '2025-07-08 08:05:41'),
(58, 51, 'uploads/news_events/content_sections/1751961941_686cd155b1f24_7.jpg', '', 7, '2025-07-08 08:05:41'),
(59, 51, 'uploads/news_events/content_sections/1751961941_686cd155b2121_8.jpg', '', 8, '2025-07-08 08:05:41'),
(60, 51, 'uploads/news_events/content_sections/1751961941_686cd155b2303_9.jpg', '', 9, '2025-07-08 08:05:41'),
(61, 51, 'uploads/news_events/content_sections/1751961941_686cd155b250e_10.jpg', '', 10, '2025-07-08 08:05:41'),
(62, 51, 'uploads/news_events/content_sections/1751961941_686cd155b26e6_11.jpg', '', 11, '2025-07-08 08:05:41'),
(63, 51, 'uploads/news_events/content_sections/1751961941_686cd155b28d9_12.jpg', '', 12, '2025-07-08 08:05:41'),
(64, 51, 'uploads/news_events/content_sections/1751961941_686cd155b2ac1_13.jpg', '', 13, '2025-07-08 08:05:41'),
(65, 51, 'uploads/news_events/content_sections/1751961941_686cd155b2cbb_14.jpg', '', 14, '2025-07-08 08:05:41'),
(66, 51, 'uploads/news_events/content_sections/1751961941_686cd155b2ef8_15.jpg', '', 15, '2025-07-08 08:05:41'),
(67, 51, 'uploads/news_events/content_sections/1751961941_686cd155b3168_16.jpg', '', 16, '2025-07-08 08:05:41'),
(68, 51, 'uploads/news_events/content_sections/1751961941_686cd155b33bf_17.jpg', '', 17, '2025-07-08 08:05:41'),
(69, 51, 'uploads/news_events/content_sections/1751961941_686cd155b365b_18.jpg', '', 18, '2025-07-08 08:05:41'),
(70, 51, 'uploads/news_events/content_sections/1751961941_686cd155b388d_19.jpg', '', 19, '2025-07-08 08:05:41');

-- --------------------------------------------------------

--
-- Table structure for table `content_section_videos`
--

CREATE TABLE `content_section_videos` (
  `id` int(11) NOT NULL,
  `section_id` int(11) NOT NULL,
  `video_type` enum('local','url') NOT NULL DEFAULT 'local',
  `video_path` varchar(500) NOT NULL,
  `video_title` varchar(255) DEFAULT NULL,
  `video_description` text DEFAULT NULL,
  `display_order` int(11) NOT NULL DEFAULT 0,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `content_section_videos`
--

INSERT INTO `content_section_videos` (`id`, `section_id`, `video_type`, `video_path`, `video_title`, `video_description`, `display_order`, `created_at`) VALUES
(18, 45, 'url', 'https://youtu.be/RPqBV7yHMKQ', '', '', 0, '2025-07-04 08:50:32'),
(19, 46, 'url', 'https://youtu.be/HdQakgQDdHI', '', '', 0, '2025-07-04 08:50:50'),
(20, 47, 'url', 'https://youtu.be/IOikM5ywlqQ', '', '', 0, '2025-07-04 08:51:06'),
(21, 48, 'url', 'https://youtu.be/GINvC9dHsHA', '', '', 0, '2025-07-04 08:51:16'),
(22, 37, 'url', 'https://youtu.be/6pt9HZQ1oyw', '', '', 0, '2025-07-05 17:50:31'),
(23, 35, 'url', 'https://youtu.be/gRTiHcwezZo', '', '', 0, '2025-07-05 17:56:21'),
(24, 49, 'url', 'https://youtu.be/1RcrGulEXPY', '', '', 0, '2025-07-05 18:01:05'),
(25, 38, 'url', 'https://youtu.be/JRg_86mpyUw', '', '', 0, '2025-07-05 18:03:34'),
(26, 39, 'url', 'https://youtu.be/rc19Xutb1yI', '', '', 0, '2025-07-05 18:07:13'),
(27, 50, 'url', 'https://youtu.be/hukbrOXFBwk', '', '', 0, '2025-07-05 18:11:45'),
(28, 40, 'url', 'https://youtu.be/ssayp3HuiMU', '', '', 0, '2025-07-05 18:16:11'),
(29, 41, 'url', 'https://youtu.be/dbk4sn58Yho', '', '', 0, '2025-07-05 18:19:19'),
(30, 43, 'url', 'https://youtu.be/ZzDx8vasJuA', '', '', 0, '2025-07-05 18:22:54'),
(31, 44, 'url', 'https://youtu.be/PJDnX6jiaMY', '', '', 0, '2025-07-05 18:24:49'),
(32, 34, 'url', 'https://youtu.be/aR9POCckEgk', '', '', 0, '2025-07-08 07:49:15'),
(33, 42, 'url', 'https://youtu.be/TrWRvA5zPt8', '', '', 0, '2025-07-08 07:50:04'),
(34, 54, 'url', 'https://youtu.be/KgzB1EbpQFA?si=UyqYTccDMsHccjNP', NULL, NULL, 0, '2025-08-18 01:04:59'),
(35, 55, 'url', 'https://youtu.be/q9XelzPAdRU', NULL, NULL, 0, '2025-08-18 03:10:08'),
(36, 56, 'url', 'https://youtu.be/p2DgvaxDmYc', NULL, NULL, 0, '2025-08-18 03:14:04'),
(37, 57, 'url', 'https://youtu.be/k0dxPNsv2kQ', NULL, NULL, 0, '2025-08-18 03:18:12'),
(38, 58, 'url', 'https://youtu.be/KyqZSJjV1TM', NULL, NULL, 0, '2025-08-18 03:21:31'),
(39, 59, 'url', 'https://youtu.be/4W20K2XJtXo', NULL, NULL, 0, '2025-08-18 03:23:32'),
(40, 60, 'url', 'https://youtu.be/OG0VXq_dwQo', NULL, NULL, 0, '2025-08-18 03:26:02'),
(41, 61, 'url', 'https://youtu.be/vIB7PHgTynw', NULL, NULL, 0, '2025-08-18 03:29:47'),
(42, 62, 'url', 'https://youtu.be/YXKhzt1veMk', NULL, NULL, 0, '2025-08-18 03:32:14'),
(43, 63, 'url', 'https://youtu.be/acijgCC1-cI', NULL, NULL, 0, '2025-08-18 03:34:15'),
(44, 64, 'url', 'https://youtu.be/W2TDHiaVWpQ', NULL, NULL, 0, '2025-08-18 03:37:13'),
(45, 65, 'url', 'https://youtu.be/Z3rkF-H3sis', NULL, NULL, 0, '2025-09-09 06:50:21'),
(46, 66, 'url', 'https://youtu.be/UyK_iRmnOYI', NULL, NULL, 0, '2025-09-09 06:52:04'),
(47, 67, 'url', 'https://youtu.be/r4rkK5C_yWA', NULL, NULL, 0, '2025-09-09 06:52:20'),
(48, 68, 'url', 'https://youtu.be/OWshsKELWvw', NULL, NULL, 0, '2025-09-09 06:53:18'),
(49, 69, 'url', 'https://youtu.be/t3Xmc1FH0Qc', NULL, NULL, 0, '2025-09-09 06:53:33'),
(50, 70, 'url', 'https://youtu.be/lqj2VSdYS9w', NULL, NULL, 0, '2025-09-09 06:53:49'),
(51, 71, 'url', 'https://youtu.be/gZiOQB9UXKQ', NULL, NULL, 0, '2025-09-09 06:54:07'),
(52, 72, 'url', 'https://youtu.be/A_8aG8RhiUg', NULL, NULL, 0, '2025-09-09 06:55:03'),
(53, 73, 'url', 'https://youtu.be/1Ag5HHiJqsU', NULL, NULL, 0, '2025-09-09 06:55:17'),
(54, 74, 'url', 'https://youtu.be/-hCxrj_4aEg', NULL, NULL, 0, '2025-09-09 06:55:35'),
(55, 75, 'url', 'https://youtu.be/YBUNbV2IJh8', NULL, NULL, 0, '2025-09-10 03:00:55'),
(56, 76, 'url', 'https://youtu.be/4S7TXBrLceU', NULL, NULL, 0, '2025-09-10 03:01:27'),
(57, 77, 'url', 'https://youtu.be/u14oZ18-jQ0', NULL, NULL, 0, '2025-09-10 03:03:15'),
(58, 79, 'url', 'https://youtu.be/FvJGKorc1cE', NULL, NULL, 0, '2025-09-10 03:04:56'),
(59, 80, 'url', 'https://youtu.be/AwM-fn0N8o4', NULL, NULL, 0, '2025-09-11 02:31:07'),
(61, 82, 'url', 'https://youtu.be/Qefd5ClR4zM', NULL, NULL, 0, '2025-09-11 02:34:30'),
(62, 83, 'url', 'https://youtu.be/_jSQhssSCKw', NULL, NULL, 0, '2025-09-11 02:35:33'),
(63, 84, 'url', 'https://youtu.be/EOtbgRn8QaY', NULL, NULL, 0, '2025-09-11 02:35:44'),
(64, 85, 'url', 'https://youtu.be/K03l3e3B9DA', NULL, NULL, 0, '2025-09-11 02:35:57'),
(65, 86, 'url', 'https://youtu.be/AiN7ga2KuXs', NULL, NULL, 0, '2025-09-11 02:36:10'),
(66, 87, 'url', 'https://youtu.be/ElIAhoAmbpY', NULL, NULL, 0, '2025-09-11 02:36:22'),
(67, 88, 'url', 'https://youtu.be/eVmu8flMNrc', NULL, NULL, 0, '2025-09-11 02:36:35'),
(68, 89, 'url', 'https://youtu.be/kBvPmXSwP2M', NULL, NULL, 0, '2025-09-11 02:38:07'),
(69, 90, 'url', 'https://youtu.be/RwTPWwr95o0', NULL, NULL, 0, '2025-09-11 02:38:28'),
(71, 92, 'url', 'https://youtu.be/2PK9w9nBKqU', NULL, NULL, 0, '2025-09-11 02:38:51');

-- --------------------------------------------------------

--
-- Table structure for table `counter`
--

CREATE TABLE `counter` (
  `Counter_Visitor` int(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `counter`
--

INSERT INTO `counter` (`Counter_Visitor`) VALUES
(19066);

-- --------------------------------------------------------

--
-- Table structure for table `faqs`
--

CREATE TABLE `faqs` (
  `id` int(11) NOT NULL,
  `question` text NOT NULL,
  `answer` text NOT NULL,
  `category` varchar(100) DEFAULT 'General',
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `faqs`
--

INSERT INTO `faqs` (`id`, `question`, `answer`, `category`, `created_at`, `updated_at`) VALUES
(1, 'What is injection molding?', 'Injection molding is a manufacturing process where molten polymer material is injected into a mold cavity under high pressure. The material cools and solidifies, taking the shape of the mold cavity. This process is widely used for producing plastic parts in high volumes with excellent precision and repeatability.', 'General Information', '2025-08-12 01:56:36', '2025-08-12 01:56:36'),
(2, 'How does injection molding work?', 'The injection molding process consists of four main stages: 1) Clamping - The mold is securely closed, 2) Injection - Molten plastic is injected into the mold cavity, 3) Cooling - The plastic cools and solidifies, 4) Ejection - The finished part is ejected from the mold. This cycle repeats continuously for mass production.', 'General Information', '2025-08-12 01:56:36', '2025-08-12 01:56:36'),
(3, 'What materials can be used in injection molding?', 'Common materials include ABS (Acrylonitrile Butadiene Styrene), Polypropylene (PP), Polyethylene (PE), Polycarbonate (PC), Nylon (PA), and many others. Material selection depends on factors like strength requirements, temperature resistance, chemical resistance, and cost considerations.', 'General Information', '2025-08-12 01:56:36', '2025-08-12 01:56:36'),
(4, 'What are the advantages of injection molding?', 'Key advantages include: high production rates, excellent part consistency and repeatability, complex part geometries, minimal material waste, ability to use multiple materials and colors, and cost-effectiveness for large production runs. The process also allows for excellent surface finish and dimensional accuracy.', 'General Information', '2025-08-12 01:56:36', '2025-08-12 01:56:36'),
(5, 'What is the typical cycle time for injection molding?', 'Cycle times vary widely depending on part size, material, wall thickness, and complexity. Small parts might have cycle times of 10-30 seconds, while larger or more complex parts can take 1-5 minutes. Factors affecting cycle time include cooling time (usually the longest phase), injection time, and mold opening/closing time.', 'Technical Details', '2025-08-12 01:56:36', '2025-08-12 01:56:36'),
(6, 'How do I calculate the cost of injection molding?', 'Injection molding costs include: 1) Tooling costs (mold design and fabrication), 2) Material costs per part, 3) Machine time costs, 4) Labor costs, and 5) Overhead costs. Tooling is a significant upfront investment ($5,000-$100,000+) but becomes cost-effective with high production volumes (1,000+ parts).', 'Technical Details', '2025-08-12 01:56:36', '2025-08-12 01:56:36'),
(7, 'What are the key process parameters?', 'Critical process parameters include: 1) Melt temperature (varies by material), 2) Injection pressure (typically 500-2,000 bar), 3) Hold pressure and time, 4) Cooling time and temperature, 5) Mold temperature, and 6) Injection speed. These parameters must be carefully controlled and monitored for consistent part quality.', 'Technical Details', '2025-08-12 01:56:36', '2025-08-12 01:56:36'),
(8, 'How do I design parts for injection molding?', 'Design considerations include: uniform wall thickness (ideally 1-4mm), adequate draft angles (1-3°), proper gate placement, avoiding sharp corners, designing for easy ejection, and considering material shrinkage. Good design practices help reduce defects and improve production efficiency.', 'Technical Details', '2025-08-12 01:56:36', '2025-08-12 01:56:36'),
(9, 'What are common injection molding defects?', 'Common defects include: 1) Flow marks (surface imperfections), 2) Sink marks (depressions), 3) Warping (distortion), 4) Short shots (incomplete filling), 5) Flash (excess material), 6) Voids (air pockets), and 7) Burn marks. Each defect has specific causes and prevention methods.', 'Quality & Standards', '2025-08-12 01:56:36', '2025-08-12 01:56:36'),
(10, 'How do I prevent injection molding defects?', 'Prevention strategies include: proper material drying, optimal process parameters, good mold design, regular maintenance, quality control procedures, and operator training. Specific defects require targeted solutions - for example, sink marks can be reduced by proper gate design and cooling optimization.', 'Quality & Standards', '2025-08-12 01:56:36', '2025-08-12 01:56:36'),
(11, 'What quality control measures are used?', 'Quality control includes: 1) Process parameter monitoring, 2) Regular part inspection (dimensions, appearance, weight), 3) Material testing and certification, 4) Mold maintenance schedules, 5) Statistical process control (SPC), and 6) Final product testing. Documentation and traceability are essential for quality assurance.', 'Quality & Standards', '2025-08-12 01:56:36', '2025-08-12 01:56:36'),
(12, 'How do I maintain consistent part quality?', 'Maintain consistency through: 1) Regular process parameter monitoring, 2) Consistent material handling and drying, 3) Regular mold maintenance and cleaning, 4) Operator training and standard operating procedures, 5) Quality control checkpoints, and 6) Continuous improvement processes based on data analysis.', 'Quality & Standards', '2025-08-12 01:56:36', '2025-08-12 01:56:36'),
(13, 'How can I reduce cycle time?', 'Cycle time reduction strategies include: 1) Optimizing cooling system design, 2) Using materials with faster cooling properties, 3) Reducing part wall thickness where possible, 4) Optimizing gate size and placement, 5) Using hot runner systems, 6) Implementing efficient mold design, and 7) Regular equipment maintenance.', 'Process Optimization', '2025-08-12 01:56:36', '2025-08-12 01:56:36'),
(14, 'What is the difference between hot and cold runner systems?', 'Hot runner systems keep the plastic molten in the mold, reducing waste and cycle time but increasing initial cost. Cold runner systems allow the plastic to solidify in the runner, creating more waste but are less expensive. Hot runners are preferred for high-volume production where material savings justify the higher upfront cost.', 'Process Optimization', '2025-08-12 01:56:36', '2025-08-12 01:56:36'),
(15, 'How do I optimize material usage?', 'Material optimization strategies include: 1) Proper gate design to minimize waste, 2) Using hot runner systems, 3) Optimizing part design for minimal material usage, 4) Recycling runner and sprue material, 5) Proper material handling to prevent contamination, and 6) Regular process optimization to reduce defects and rework.', 'Process Optimization', '2025-08-12 01:56:36', '2025-08-12 01:56:36'),
(16, 'What maintenance is required for injection molding machines?', 'Regular maintenance includes: 1) Daily cleaning and inspection, 2) Weekly lubrication and safety checks, 3) Monthly hydraulic system maintenance, 4) Quarterly electrical system inspection, 5) Annual comprehensive machine inspection, and 6) Preventive maintenance based on manufacturer recommendations. Proper maintenance extends equipment life and ensures consistent performance.', 'Process Optimization', '2025-08-12 01:56:36', '2025-08-12 01:56:36'),
(17, 'What causes short shots in injection molding?', 'Short shots occur when the mold cavity is not completely filled. Common causes include: insufficient injection pressure, low material temperature, blocked gates, inadequate venting, material contamination, and mold design issues. Solutions involve adjusting process parameters, cleaning the mold, and ensuring proper material flow.', 'Troubleshooting', '2025-08-12 01:56:36', '2025-08-12 01:56:36'),
(18, 'How do I fix warping issues?', 'Warping is caused by uneven cooling and internal stresses. Solutions include: 1) Optimizing cooling system design for uniform temperature distribution, 2) Adjusting cooling time and temperature, 3) Improving part design for better cooling balance, 4) Using materials with lower shrinkage, and 5) Implementing proper ejection procedures to prevent distortion.', 'Troubleshooting', '2025-08-12 01:56:36', '2025-08-12 01:56:36'),
(19, 'What causes sink marks and how do I prevent them?', 'Sink marks are depressions caused by material shrinkage during cooling. Prevention methods include: 1) Designing uniform wall thickness, 2) Optimizing gate placement and size, 3) Using proper hold pressure and time, 4) Implementing adequate cooling, and 5) Choosing materials with lower shrinkage rates. Good design is crucial for preventing sink marks.', 'Troubleshooting', '2025-08-12 01:56:36', '2025-08-12 01:56:36'),
(20, 'How do I resolve flow marks on parts?', 'Flow marks are surface imperfections caused by material flow issues. Solutions include: 1) Increasing injection speed and pressure, 2) Optimizing material temperature, 3) Improving gate design and placement, 4) Ensuring proper material drying, 5) Using materials with better flow properties, and 6) Optimizing mold temperature for the specific material.', 'Troubleshooting', '2025-08-12 01:56:36', '2025-08-12 01:56:36');

-- --------------------------------------------------------

--
-- Table structure for table `headline_articles`
--

CREATE TABLE `headline_articles` (
  `id` int(11) NOT NULL,
  `title` varchar(255) NOT NULL,
  `description` text NOT NULL,
  `image_path` varchar(500) NOT NULL,
  `date` date NOT NULL,
  `is_active` tinyint(1) DEFAULT 1,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `headline_articles`
--

INSERT INTO `headline_articles` (`id`, `title`, `description`, `image_path`, `date`, `is_active`, `created_at`, `updated_at`) VALUES
(1, 'CvSU Rosario Supervisors Visit Interns at JPMC', 'JPMC is honored to welcome the supervisors of Cavite State University – Rosario Campus as they visited their students undergoing On-the-Job Training with us. \r\n\r\nThis meaningful visit strengthens our partnership with CvSU Rosario, ensuring guidance, support, and shared commitment to the growth and success of future professionals.', 'assets/img/ojt_pictures/Plant_Visit1.jpg', '2025-08-13', 1, '2025-08-20 02:13:20', '2025-08-20 03:42:46');

-- --------------------------------------------------------

--
-- Table structure for table `home_sections`
--

CREATE TABLE `home_sections` (
  `id` int(11) NOT NULL,
  `section_name` varchar(50) NOT NULL,
  `field_name` varchar(50) NOT NULL,
  `field_type` enum('text','textarea','image') NOT NULL DEFAULT 'text',
  `label` varchar(100) NOT NULL,
  `value` text DEFAULT NULL,
  `display_order` int(11) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `home_sections`
--

INSERT INTO `home_sections` (`id`, `section_name`, `field_name`, `field_type`, `label`, `value`, `display_order`) VALUES
(1, 'hero_section', 'heading', 'text', 'Main Heading', 'James Polymers Manufacturing Corporation', 10),
(2, 'hero_section', 'subheading', 'text', 'Sub Heading', 'Delivering high-performance polymer compounds tailored to your specific requirements with over 15 years of expertises', 20),
(3, 'hero_section', 'button1_text', 'text', 'Primary Button Text', 'Explore Our Capabilities', 30),
(4, 'hero_section', 'button2_text', 'text', 'Secondary Button Text', 'Contact Us', 40),
(5, 'hero_section', 'background_image', 'image', 'Background Image', 'Background.png', 50),
(6, 'mission_vision', 'heading', 'text', 'Section Heading', 'Our Mission & Vision', 10),
(7, 'mission_vision', 'mission_heading', 'text', 'Mission Heading', 'Our Mission', 20),
(8, 'mission_vision', 'mission_content', 'textarea', 'Mission Content', '<p class=\"text-gray-600 mb-4 text-justify\">James Polymers Manufacturing is dedicated to achieving excellence in plastic injection molding and rubber compression molding processing in the industry by providing quality, service, and competitive pricing to our customers.</p>\r\n<p class=\"text-gray-600 mb-4 text-justify\">We aim to be internationally competitive in the world market by setting a milestone that will open a door of opportunities which will be wholly embraced and accepted by the international market and linger the eyes of Filipinos that we can also be a great leader in our own simple ways.</p>\r\n<p class=\"text-gray-600 text-justify\">We aim to support long-term economic growth and progress in the regions where we operate, as well as caring for the environment and ensuring sustainable use of natural resources.</p>', 30),
(9, 'mission_vision', 'vision_heading', 'text', 'Vision Heading', 'Our Vision', 40),
(10, 'mission_vision', 'vision_content', 'textarea', 'Vision Content', '<p class=\"text-gray-600 mb-4 text-justify\">Achieve a profitable and growth-oriented organization satisfying its employees, customers, and community through continual improvement.</p>', 50),
(11, 'products_services', 'heading', 'text', 'Section Heading', 'Products & Services', 10),
(12, 'products_services', 'subheading', 'text', 'Section Subheading', 'We offer a comprehensive range of polymer compounds and value-added services to meet the most demanding material requirements across various industries.', 20),
(13, 'products_services', 'cat1_image', 'image', 'Category 1 Image', 'Thermoplastic.png', 30),
(14, 'products_services', 'cat1_title', 'text', 'Category 1 Title', 'Thermoplastic Materials & Engineering Plastics', 40),
(15, 'products_services', 'cat1_description', 'text', 'Category 1 Description', 'High-performance TPE compounds offering excellent flexibility, durability, and processing characteristics for diverse applications.', 50),
(16, 'products_services', 'cat2_image', 'image', 'Category 2 Image', 'Molded.png', 60),
(17, 'products_services', 'cat2_title', 'text', 'Category 2 Title', 'Molded Rubber Compression & Compound', 70),
(18, 'products_services', 'cat2_description', 'text', 'Category 2 Description', 'Specialized compounds designed for demanding mechanical, thermal, and chemical resistance applications.', 80),
(19, 'products_services', 'cat3_image', 'image', 'Category 3 Image', 'Resin.png', 90),
(20, 'products_services', 'cat3_title', 'text', 'Category 3 Title', 'Master Batch of Resin', 100),
(21, 'products_services', 'cat3_description', 'text', 'Category 3 Description', 'Tailored polymer solutions developed to meet your specific performance, regulatory, and processing requirements.', 110),
(22, 'products_services', 'cat4_image', 'image', 'Category 4 Image', 'Services.png', 120),
(23, 'products_services', 'cat4_title', 'text', 'Category 4 Title', 'Engineering, Design & Technical Services', 130),
(24, 'products_services', 'cat4_description', 'text', 'Category 4 Description', 'Comprehensive support including material selection, testing, processing optimization, and troubleshooting.', 140),
(25, 'industries', 'heading', 'text', 'Section Heading', 'Industries We Cater', 10),
(26, 'industries', 'subheading', 'text', 'Section Subheading', 'Our advanced polymer solutions serve critical applications across multiple industries, enabling innovation and performance enhancement.', 20),
(27, 'industries', 'industry1_title', 'text', 'Industry 1 Title', 'Automotive', 30),
(28, 'industries', 'industry1_description', 'text', 'Industry 1 Description', 'Lightweight, durable materials for interior, exterior, and under-the-hood applications.', 40),
(29, 'industries', 'industry2_title', 'text', 'Industry 2 Title', 'Medical', 50),
(30, 'industries', 'industry2_description', 'text', 'Industry 2 Description', 'Biocompatible, sterilizable compounds for devices and equipment.', 60),
(31, 'industries', 'industry3_title', 'text', 'Industry 3 Title', 'Consumer', 70),
(32, 'industries', 'industry3_description', 'text', 'Industry 3 Description', 'High-performance materials for appliances, tools, and household products.', 80),
(33, 'industries', 'industry4_title', 'text', 'Industry 4 Title', 'Industrial', 90),
(34, 'industries', 'industry4_description', 'text', 'Industry 4 Description', 'Robust materials for machinery, fluid handling, and industrial components.', 100),
(35, 'industries', 'industry5_title', 'text', 'Industry 5 Title', 'Electronics', 110),
(36, 'industries', 'industry5_description', 'text', 'Industry 5 Description', 'Specialized compounds with electrical properties and flame retardancy.', 120),
(37, 'industries', 'industry6_title', 'text', 'Industry 6 Title', 'Aerospace', 130),
(38, 'industries', 'industry6_description', 'text', 'Industry 6 Description', 'High-performance materials for aircraft interiors and components.', 140),
(39, 'awards', 'heading', 'text', 'Section Heading', 'Awards & Recognition', 10),
(40, 'awards', 'subheading', 'text', 'Section Subheading', 'Our commitment to excellence and innovation has been recognized by industry organizations and publications.', 20),
(41, 'awards', 'award1_title', 'text', 'Award 1 Title', 'Best in Environmental Management System Award (2007)\r\n', 30),
(42, 'awards', 'award1_description', 'text', 'Award 1 Description', 'Awarded by Panasonic Manufacturing Philippines Corporation (PMPC) and Panasonic Communication Philippines Corporation, this recognition honors outstanding environmental practices from April 2006 to March 2007.\r\n', 40),
(43, 'awards', 'award2_title', 'text', 'Award 2 Title', 'Preferred Supplier (2011)', 50),
(44, 'awards', 'award2_description', 'text', 'Award 2 Description', 'Given this 3rd day of May 2011 at Bayanihan Center, United Laboratories Inc.', 60),
(45, 'awards', 'award3_title', 'text', 'Award 3 Title', 'Golden Globe Annual Awards for Business Excellence - BEST (2023)\r\n\r\n', 70),
(46, 'awards', 'award3_description', 'text', 'Award 3 Description', '\r\nRecognized in 2023 by the Golden Globe Annual Awards for Business Excellence, this prestigious award highlights exceptional performance, innovation, and business leadership in the industry.\r\n', 80),
(47, 'awards', 'award4_title', 'text', 'Award 4 Title', 'ISO 14001:2015 & ISO 9001:2015 Recertification (2025)', 90),
(48, 'awards', 'award4_description', 'text', 'Award 4 Description', 'Achieving this reflects our dedication to sustainable operations and adherence to international standards for quality, consistency, and continuous improvement.', 100),
(49, 'customers', 'heading', 'text', 'Section Heading', 'Our Valued Customers', 10),
(50, 'customers', 'subheading', 'text', 'Section Subheading', 'We\'re proud to partner with industry leaders across various sectors, providing them with high-performance polymer solutions.', 20),
(51, 'customers', 'customer1_logo', 'image', 'Customer 1 Logo', '3M.png', 1),
(52, 'customers', 'customer2_logo', 'image', 'Customer 2 Logo', 'Unilab.png', 2),
(53, 'customers', 'customer3_logo', 'image', 'Customer 3 Logo', 'APC.png', 3),
(54, 'customers', 'customer4_logo', 'image', 'Customer 4 Logo', 'Carrier.png', 4),
(55, 'customers', 'customer5_logo', 'image', 'Customer 5 Logo', 'Panasonic.png', 5),
(56, 'customers', 'customer6_logo', 'image', 'Customer 6 Logo', 'Koppel.png', 6),
(57, 'customers', 'customer7_logo', 'image', 'Customer 7 Logo', 'Dutch.png', 7),
(58, 'customers', 'customer8_logo', 'image', 'Customer 8 Logo', 'WB.png', 8),
(59, 'customers', 'customer9_logo', 'image', 'Customer 9 Logo', 'ACS.png', 9),
(60, 'customers', 'customer10_logo', 'image', 'Customer 10 Logo', 'Purefoods.png', 10),
(61, 'customers', 'customer11_logo', 'image', 'Customer 11 Logo', 'Condura.png', 11),
(62, 'customers', 'customer12_logo', 'image', 'Customer 12 Logo', 'Continental.png', 12),
(66, 'customers', 'customer13_logo', 'image', 'Customer 13 logo', 'ISUZU.png', 13),
(67, 'customers', 'customer14_logo', 'image', 'Customer 14', '6915a4271c457.png', 14),
(68, 'customers', 'customer15_logo', 'image', 'Customer 15', '6915a5b593d3e.jpg', 15);

-- --------------------------------------------------------

--
-- Table structure for table `industries`
--

CREATE TABLE `industries` (
  `id` int(11) NOT NULL,
  `name` varchar(100) NOT NULL,
  `description` text NOT NULL,
  `image_url` varchar(255) NOT NULL,
  `icon_class` varchar(50) NOT NULL,
  `coming_soon` tinyint(1) DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `industries`
--

INSERT INTO `industries` (`id`, `name`, `description`, `image_url`, `icon_class`, `coming_soon`) VALUES
(1, 'Aviation Industry', 'Manufactures durable and lightweight plastic and rubber components used in aircraft interiors, support equipment, and engine parts.', 'assets/img/industries/Aviation.jpg', 'fas fa-plane', 0),
(2, 'Agricultural', 'Produces tough, weather-resistant parts for farming tools, irrigation systems, and agricultural machinery.', 'assets/img/industries/Agricultural.jpg', 'fas fa-tractor', 0),
(3, 'Automotive Industry', 'Supplies precision-molded plastic and rubber parts for vehicle interiors, engine systems, and under-the-hood components.', 'assets/img/industries/Automotive.jpg', 'fas fa-car-side', 0),
(4, 'Beauty and Cosmetic Packaging Accessory', 'Creates elegant, functional packaging accessories such as caps, containers, and applicators tailored for personal care and cosmetic products.', 'assets/img/industries/Beauty_Cosmetic.jpg', 'fas fa-paintbrush', 0),
(5, 'Casino and Entertainment Parts & Accessory', 'Produces specialized molded parts and accessories for gaming machines, entertainment equipment, and casino fixtures.', 'assets/img/industries/Casino.jpg', 'fas fa-money-bill', 0),
(6, 'Chemical Packaging Parts & Accessory', 'Manufactures chemical-resistant plastic containers, seals, and closures designed for safe chemical storage and transport.', 'assets/img/industries/Chemicals.jpg', 'fas fa-flask', 0),
(7, 'IT and Computer Peripheral, Component, Parts & Accessory', 'Semi Conductor/Computer Peripherals', 'assets/img/industries/IT_Computer.jpg', 'fas fa-computer-mouse', 0),
(8, 'Construction Supply', 'Provides rugged, durable molded components for construction tools, safety equipment, and structural accessories.', 'assets/img/industries/Construction.jpg', 'fas fa-helmet-safety', 0),
(9, 'Electrical Devices & Accessory', 'Provides rugged, durable molded components for construction tools, safety equipment, and structural accessories.', 'assets/img/industries/Electrical.jpg', 'fas fa-plug', 0),
(10, 'Firearms Accessory and Armory', 'Produces polymer-based firearm components and tactical accessories with durability and precision in mind.', 'assets/img/industries/Firearms.jpg', 'fas fa-gun', 0),
(11, 'Food & Beverages Packaging', 'Creates food-grade containers, caps, and seals designed for hygiene, safety, and shelf appeal in food and drink packaging.', 'assets/img/industries/Food_Beverages.jpg', 'fas fa-burger', 0),
(12, 'Furniture & Upholstery', 'Manufactures support parts, stoppers, and trim accessories for furniture frames and upholstered products.', 'assets/img/industries/Furniture_Upholstery.jpg', 'fas fa-chair', 0),
(13, 'Gaming Equipment & Accessory', 'Produces precision-molded parts and accessories for arcade machines, gaming consoles, and related electronic devices.', 'assets/img/industries/Gaming.jpg', 'fas fa-gamepad', 0),
(14, 'Health And Wellness Parts & Accessory', 'Manufactures hygienic, medical-grade plastic and rubber components used in health, wellness, and personal care devices.', 'assets/img/industries/Health_Wellness.jpg', 'fas fa-suitcase-medical', 0),
(15, 'Home Appliances Parts & Accessory', 'Supplies durable internal and external components for kitchen, cleaning, and electronic home appliances.', 'assets/img/industries/Home_Appliances.jpg', 'fas fa-blender-phone', 0),
(16, 'Home Decor & Accessory', 'Crafts stylish and functional decorative accessories, frames, trims, and fittings for home interiors.', 'assets/img/industries/Home_Decor.jpg', 'fas fa-home-user', 0),
(17, 'Horticultural Tools, Equipment, and Gardening Materials', 'Produces weather-resistant parts and tools for gardening, irrigation, and horticultural equipment.', 'assets/img/industries/Horticultural.jpg', 'fas fa-water', 0),
(18, 'Warehouse and Logistic, Tools & Equipment', 'Delivers rugged molded components for packaging, storage bins, pallets, and handling equipment used in logistics and warehousing.', 'assets/img/industries/Warehouse_Logistic.jpg', 'fas fa-warehouse', 0),
(19, 'Maritime & Shipping Industries', 'Produces corrosion-resistant plastic and rubber components for marine vessels, shipping equipment, and offshore applications.', 'assets/img/industries/Maritime_Shipping.jpg', 'fas fa-ship', 0),
(20, 'Medical Devices, Hospital Equipment & Accessory', 'Supplies precision plastic and rubber parts for computers, peripherals, and electronic device housings.', 'assets/img/industries/Medical.jpg', 'fas fa-ambulance', 0),
(21, 'Military Defense Equipment, Parts & Accessory', 'Military Defense Equipment Parts, Accessories and Armor Solutions', 'assets/img/industries/Military.jpg', 'fas fa-jet-fighter', 0),
(22, 'Motorcycle Industry', 'Develops durable plastic and rubber parts for motorcycle interiors, safety components, and engine accessories.', 'assets/img/industries/Motorcycle.jpg', 'fas fa-motorcycle', 0),
(23, 'Oil and Lubricant', 'Provides chemical-resistant packaging, seals, and container parts for oil, grease, and lubricant handling and storage.', 'assets/img/industries/Oil_Lubricant.jpg', 'fas fa-oil-can', 0),
(24, 'Personal Hygiene Products', 'Produces hygienic, user-friendly packaging and components for soaps, wipes, and hygiene dispensers.', 'assets/img/industries/Personal_Hygiene.jpg', 'fas fa-soap', 0),
(25, 'Pharmaceutical Industry', 'Crafts safe, tamper-resistant packaging parts and accessories for medicines, syringes, and healthcare kits.', 'assets/img/industries/Pharmaceutical.jpg', 'fas fa-capsules', 0),
(26, 'Power & Energy Industry', 'Manufactures insulating and protective components for power distribution, renewable systems, and energy equipment.', 'assets/img/industries/Power_Energy.jpg', 'fas fa-bolt', 0),
(27, 'Semiconductor Industry', 'Produces precision-molded, anti-static components and tool accessories used in cleanroom and chip manufacturing environments.', 'assets/img/industries/Semiconductor.jpg', 'fas fa-microchip', 0),
(28, 'Train and Locomotive', 'Supplies durable plastic and rubber parts for rail interiors, control panels, and mechanical assemblies in trains and locomotives.', 'assets/img/industries/Train_Locomotive.jpg', 'fas fa-train', 0),
(29, 'Water Sports, Equipment, and Accessory', 'Manufactures water-resistant, lightweight components for sporting gear, flotation devices, and aquatic accessories.', 'assets/img/industries/Water_Sports.jpg', 'fas fa-water-ladder', 0);

-- --------------------------------------------------------

--
-- Table structure for table `industry_solutions`
--

CREATE TABLE `industry_solutions` (
  `id` int(11) NOT NULL,
  `industry_id` int(11) NOT NULL,
  `solution` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `industry_solutions`
--

INSERT INTO `industry_solutions` (`id`, `industry_id`, `solution`) VALUES
(227, 2, 'Irrigation Hose Connectors'),
(228, 2, 'Tractor Grip Handles'),
(229, 2, 'Seed Planter Wheels'),
(230, 2, 'Protective Cable Covers'),
(231, 2, 'Water Tank Lids'),
(232, 1, 'Sealing Gaskets'),
(233, 1, 'Cable Clamps'),
(234, 1, 'Control Knobs'),
(235, 1, 'Ventilation Duct Covers'),
(236, 1, 'Landing Gear Dust Caps'),
(237, 3, 'Door Seals'),
(238, 3, 'Dashboard Panels'),
(239, 3, 'Pedal Pads'),
(240, 3, 'Bumper End Caps'),
(241, 3, 'Washer Fluid Caps'),
(242, 4, 'Bottle Caps'),
(243, 4, 'Compact Powder Cases'),
(244, 4, 'Lipstick Tubes'),
(245, 4, 'Dropper Bulbs'),
(246, 4, 'Pump Dispensers'),
(247, 5, 'Slot Machine Buttons'),
(248, 5, 'Poker Chip Trays'),
(249, 5, 'Card Shuffler Gears'),
(250, 5, 'Bumper Rings'),
(251, 5, 'Token Dispenser Hoppers'),
(252, 6, 'Chemical Drum Caps'),
(253, 6, 'Seal Gaskets'),
(254, 6, 'Measuring Scoops'),
(255, 6, 'Spout Closures'),
(256, 6, 'Safety Valve Covers'),
(257, 8, 'Pipe End Caps'),
(258, 8, 'Cable Grommets'),
(259, 8, 'Tool Handles'),
(260, 8, 'Tile Spacers'),
(261, 8, 'Protective Corner Guards'),
(262, 9, 'Plug Casings'),
(263, 9, 'Wire Insulation Sleeves'),
(264, 9, 'Switch Buttons'),
(265, 9, 'Cable Clips'),
(266, 9, 'Socket Covers'),
(267, 10, 'Pistol Grip Handles'),
(268, 10, 'Buttstock Pads'),
(269, 10, 'Magazine Floor Plates'),
(270, 10, 'Scope Lens Caps'),
(271, 10, 'Trigger Guards'),
(272, 11, 'Bottle Caps'),
(273, 11, 'Jar Lids'),
(274, 11, 'Sealing Rings'),
(275, 11, 'Dispensing Nozzles'),
(276, 11, 'Cup Lids'),
(277, 12, 'Chair Leg Caps'),
(278, 12, 'Furniture Feet Pads'),
(279, 12, 'Armrest Covers'),
(280, 12, 'Adjuster Knobs'),
(281, 12, 'Cushion Stoppers'),
(282, 13, 'Controller Thumb Grips'),
(283, 13, 'Console Button Covers'),
(284, 13, 'Headset Ear Cushions'),
(285, 13, 'Cable Management Clips'),
(286, 13, 'Protective Console Shells'),
(287, 14, 'Exercise Band Handles'),
(288, 14, 'Water Bottle Caps'),
(289, 14, 'Yoga Mat End Caps'),
(290, 14, 'Massage Roller Wheels'),
(291, 14, 'Protective Mouthpieces'),
(292, 15, 'Washing Machine Door Seals'),
(293, 15, 'Blender Jar Lids'),
(294, 15, 'Vacuum Cleaner Wheels'),
(295, 15, 'Refrigerator Door Handles'),
(296, 15, 'Microwave Button Covers'),
(297, 16, 'Picture Frame Corners'),
(298, 16, 'Lamp Switch Knobs'),
(299, 16, 'Vase Base Pads'),
(300, 16, 'Curtain Rod End Caps'),
(301, 16, 'Wall Hook Covers'),
(302, 17, 'Hose Nozzle Handles'),
(303, 17, 'Plant Pot Bases'),
(304, 17, 'Tool Handle Grips'),
(305, 17, 'Sprinkler Heads'),
(306, 17, 'Protective Plant Clips'),
(307, 7, 'Keyboard Keycaps'),
(308, 7, 'Mouse Scroll Wheels'),
(309, 7, 'Cable Grommets'),
(310, 7, 'USB Port Covers'),
(311, 7, 'Cooling Fan Blades'),
(312, 19, 'Dock Bumper Pads'),
(313, 19, 'Sealing Gaskets'),
(314, 19, 'Rope Cleat Covers'),
(315, 19, 'Buoy Shells'),
(316, 19, 'Cable Protection Sleeves'),
(317, 20, 'Syringe Plungers'),
(318, 20, 'Oxygen Mask Seals'),
(319, 20, 'IV Drip Caps'),
(320, 20, 'Medical Equipment Handles'),
(321, 20, 'Protective Tube Caps'),
(322, 21, 'Weapon Grip Handles'),
(323, 21, 'Protective Lens Covers'),
(324, 21, 'Sealing Gaskets'),
(325, 21, 'Helmet Padding Inserts'),
(326, 21, 'Ammunition Magazine Caps'),
(327, 22, 'Handlebar Grips'),
(328, 22, 'Mirror Housings'),
(329, 22, 'Foot Peg Covers'),
(330, 22, 'Chain Guards'),
(331, 22, 'Turn Signal Lenses'),
(332, 23, 'Bottle Caps'),
(333, 23, 'Pour Spouts'),
(334, 23, 'Seal Gaskets'),
(335, 23, 'Measuring Caps'),
(336, 23, 'Drum Bung Plugs'),
(337, 24, 'Toothbrush Handles'),
(338, 24, 'Soap Dispenser Pumps'),
(339, 24, 'Shampoo Bottle Caps'),
(340, 24, 'Razor Grip Handles'),
(341, 24, 'Toothpaste Tube Caps'),
(342, 25, 'Pill Bottle Caps'),
(343, 25, 'Dropper Bulbs'),
(344, 25, 'Measuring Cups'),
(345, 25, 'Syringe Barrels'),
(346, 25, 'Vial Stoppers'),
(347, 26, 'Cable Insulation Sleeves'),
(348, 26, 'Connector Housings'),
(349, 26, 'Seal Gaskets'),
(350, 26, 'Protective Caps'),
(351, 26, 'Control Knobs'),
(352, 27, 'Wafer Carrier Trays'),
(353, 27, 'Protective End Caps'),
(354, 27, 'Equipment Gaskets'),
(355, 27, 'Handle Grips'),
(356, 27, 'Connector Insulators'),
(357, 28, 'Door Seals'),
(358, 28, 'Control Panel Knobs'),
(359, 28, 'Cable Grommets'),
(360, 28, 'Seat Handle Covers'),
(361, 28, 'Light Housing Covers'),
(362, 18, 'Pallet Jack Wheels'),
(363, 18, 'Handle Grips'),
(364, 18, 'Protective Corner Bumpers'),
(365, 18, 'Tool Case Latches'),
(366, 18, 'Label Holders'),
(367, 29, 'Swim Goggle Seals'),
(368, 29, 'Fin Straps'),
(369, 29, 'Board Fins'),
(370, 29, 'Valve Caps'),
(371, 29, 'Handle Grips');

-- --------------------------------------------------------

--
-- Table structure for table `inquiries`
--

CREATE TABLE `inquiries` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `phone` varchar(50) DEFAULT NULL,
  `address` varchar(255) NOT NULL,
  `company` varchar(255) DEFAULT NULL,
  `position` varchar(255) DEFAULT NULL,
  `subject` varchar(255) NOT NULL,
  `priority` enum('low','medium','high') NOT NULL,
  `message` text NOT NULL,
  `date_submitted` datetime NOT NULL,
  `status` enum('new','in-progress','resolved','closed') NOT NULL DEFAULT 'new'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `news_events`
--

CREATE TABLE `news_events` (
  `id` int(11) NOT NULL,
  `title` varchar(255) NOT NULL,
  `content` text NOT NULL,
  `featured` tinyint(1) NOT NULL DEFAULT 0,
  `show_in_banner` tinyint(1) NOT NULL DEFAULT 0,
  `has_multimedia` tinyint(1) NOT NULL DEFAULT 0,
  `has_content_sections` tinyint(1) NOT NULL DEFAULT 0,
  `type` enum('news','event') NOT NULL,
  `date` date NOT NULL,
  `image` varchar(255) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `Batch` int(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `news_events`
--

INSERT INTO `news_events` (`id`, `title`, `content`, `featured`, `show_in_banner`, `has_multimedia`, `has_content_sections`, `type`, `date`, `image`, `created_at`, `Batch`) VALUES
(49, 'Aryne Kate Magsalang Shares Inspiring Testimony', '', 0, 0, 0, 1, 'news', '2025-07-10', NULL, '2025-07-03 09:22:28', 1),
(50, 'Hanelyn Abilong Shares Empowering Testimony', '', 0, 0, 0, 1, 'news', '2025-07-05', NULL, '2025-07-03 10:05:41', 1),
(52, 'Gielyn Fernandez Delivers Uplifting Testimony', '', 0, 0, 0, 1, 'news', '2025-07-05', NULL, '2025-07-03 10:07:03', 1),
(53, 'John Joseph Albuera Inspires with His Testimony', '', 0, 0, 0, 1, 'news', '2025-07-05', NULL, '2025-07-03 10:10:26', 1),
(54, 'John Vern Shares His Motivational Testimony', '', 0, 0, 0, 1, 'news', '2025-07-05', NULL, '2025-07-03 10:12:43', 1),
(55, 'Junjay Sayco Reflects on His Journey in Testimony at James Polymers', '', 0, 0, 0, 1, 'news', '2025-07-05', NULL, '2025-07-03 10:15:11', 1),
(56, 'Justine James Belluso Shares Impactful Testimony', '', 0, 0, 0, 1, 'news', '2025-07-05', NULL, '2025-07-03 10:22:19', 1),
(57, 'Marvin Alagos Delivers His Inspiring Testimony', '', 0, 0, 0, 1, 'news', '2025-07-08', NULL, '2025-07-03 10:24:07', 1),
(58, 'Phoebe Jane Mangakoy Shares Uplifting Testimony', '', 0, 0, 0, 1, 'news', '2025-07-05', NULL, '2025-07-03 10:29:22', 1),
(59, 'Prince Pila Delivers His Heartfelt Testimony at James Polymers', '', 0, 0, 0, 1, 'news', '2025-07-05', NULL, '2025-07-03 10:31:23', 1),
(60, 'Rhemnel Nimrhod Cecilio Shares Powerful Testimony', '', 0, 0, 0, 1, 'news', '2025-07-03', NULL, '2025-07-03 10:34:40', 1),
(61, 'Richardo Abanto Shares Motivational Testimony', '', 0, 0, 0, 1, 'news', '2025-07-03', NULL, '2025-07-03 10:36:33', 1),
(62, 'Roland Cris Jacob Inspires with Testimony at James Polymers', '', 0, 0, 0, 1, 'news', '2025-07-03', NULL, '2025-07-03 10:38:25', 1),
(63, 'Melchor Adrian Libarnes Shares Insightful Testimony', '', 0, 0, 0, 1, 'news', '2025-07-03', NULL, '2025-07-03 10:39:39', 1),
(64, 'John Cody Aburquez Delivers Inspiring Testimony', '', 0, 0, 0, 1, 'news', '2025-07-06', NULL, '2025-07-05 18:01:05', 1),
(65, 'Ken Levy Aniñon Shares Empowering Testimony ', '', 0, 0, 0, 1, 'news', '2025-07-06', NULL, '2025-07-05 18:11:45', 1),
(66, 'Internship Journey Highlights: Batch One Graduation & Hands-On Experience', '', 0, 0, 0, 1, 'event', '2025-07-09', NULL, '2025-07-08 08:05:41', 2),
(67, 'Internship Journey Highlights: Batch Two Graduation & Hands-On Experience', '', 0, 0, 0, 1, 'event', '2025-07-19', NULL, '2025-08-15 06:08:01', 2),
(68, 'Internship Journey Highlights: CvSU - Rosario Visit', '', 0, 0, 0, 1, 'event', '2025-08-14', NULL, '2025-08-16 05:22:01', 2),
(69, 'Adrian De Lara Shares His Motivational Testimony', '', 0, 0, 0, 1, 'news', '2025-07-19', NULL, '2025-08-18 01:02:06', 2),
(70, 'Aljohnson Daet Shares His Inspiring Testimony', '', 0, 0, 0, 1, 'news', '2025-07-19', NULL, '2025-08-18 03:07:25', 2),
(71, 'Carlos Luis Cataulin Shares His Empowering Testimony', '', 0, 0, 0, 1, 'news', '2025-07-19', NULL, '2025-08-18 03:12:53', 2),
(72, 'Francis Emmanuel Abaya Delivers His Uplifting Testimony', '', 0, 0, 0, 1, 'news', '2025-07-19', NULL, '2025-08-18 03:16:53', 2),
(73, 'Genrey Palomares Inspires with His Testimony', '', 0, 0, 0, 1, 'news', '2025-07-19', NULL, '2025-08-18 03:19:54', 2),
(74, 'Jerico Altabano Shares His Motivational Testimony', '', 0, 0, 0, 1, 'news', '2025-07-19', NULL, '2025-08-18 03:22:13', 2),
(75, 'Jonathan Fajardo Reflects on His Journey in Testimony at James Polymers', '', 0, 0, 0, 1, 'news', '2025-07-19', NULL, '2025-08-18 03:24:12', 2),
(76, 'John Lawrence Agustin Shares His Impactful Testimony', '', 0, 0, 0, 1, 'news', '2025-07-19', NULL, '2025-08-18 03:26:44', 2),
(77, 'Paul Vincent Olega Delivers His Inspiring Testimony', '', 0, 0, 0, 1, 'news', '2025-07-19', NULL, '2025-08-18 03:30:54', 2),
(78, 'Randy Cornita Shares His Powerful Testimony', '', 0, 0, 0, 1, 'news', '2025-07-19', NULL, '2025-08-18 03:33:07', 2),
(79, 'Ronald Josiah Cruz Inspires with Testimony at James Polymers', '', 0, 0, 0, 1, 'news', '2025-07-19', NULL, '2025-08-18 03:34:57', 2),
(80, 'Niña Mae M. Rubio gives her moving account of working with James Polymer.', '', 0, 0, 0, 1, 'news', '2025-09-09', NULL, '2025-09-09 03:17:40', 3),
(81, 'Jasmin Rize H. Calicdan tells her motivating account of professional success.', '', 0, 0, 0, 1, 'news', '2025-09-09', NULL, '2025-09-09 03:21:14', 3),
(82, 'Angelica P. Ramirez reveals her uplifting story of new opportunities.', '', 0, 0, 0, 1, 'news', '2025-09-09', NULL, '2025-09-09 03:22:53', 3),
(83, 'Cathereena Paula G.Capacia tells her motivating journey of success with James Polymer.', '', 0, 0, 0, 1, 'news', '2025-09-09', NULL, '2025-09-09 03:25:33', 3),
(84, 'Mark Jezreel C. Antivo tells his inspiring experience with James Polymer.', '', 0, 0, 0, 1, 'news', '2025-09-09', NULL, '2025-09-09 03:27:01', 3),
(85, 'Sebastian Lucas Tagalog presents his story of achievement and progress.', '', 0, 0, 0, 1, 'news', '2025-09-09', NULL, '2025-09-09 03:34:03', 3),
(86, 'Danzle Ian Bucoy Vale Cruz presents his uplifting story about James Polymer.', '', 0, 0, 0, 1, 'news', '2025-09-09', NULL, '2025-09-09 03:36:19', 3),
(87, 'Marc Daniel D. Moratalla tells his inspiring journey of resilience and determination.', '', 0, 0, 0, 1, 'news', '2025-09-09', NULL, '2025-09-09 03:39:17', 3),
(88, 'Mhira Shane O. Pato reveals her encouraging journey of determination.', '', 0, 0, 0, 1, 'news', '2025-09-09', NULL, '2025-09-09 03:41:14', 3),
(89, 'John Benedict L. Tabor offers his uplifting story of career success.', '', 0, 0, 0, 1, 'news', '2025-09-09', NULL, '2025-09-09 03:42:50', 3),
(90, 'Kenneth Gabren E. Oakes reveals his encouraging testimony about James Polymer.', '', 0, 0, 0, 1, 'news', '2025-09-09', NULL, '2025-09-09 07:00:25', 3),
(91, 'Arlan M. Salisipan Jr. tells his motivating experience in James Polymer.', '', 0, 0, 0, 1, 'news', '2025-09-09', NULL, '2025-09-09 07:00:42', 3),
(92, 'Cristine S. Trubanos reveals her testimony of success at James Polymer.', '', 0, 0, 0, 1, 'news', '2025-09-09', NULL, '2025-09-09 07:02:03', 3),
(93, 'Daniel Ross B. Evia presents his uplifting story about James Polymer.', '', 0, 0, 0, 1, 'news', '2025-09-09', NULL, '2025-09-09 07:02:59', 3),
(94, 'Elisha B. Rebollos gives his heartfelt appreciation for James Polymer.', '', 0, 0, 0, 1, 'news', '2025-09-09', NULL, '2025-09-09 07:05:25', 3),
(95, 'Kim Irvine Ulep tells his inspiring journey of resilience.', '', 0, 0, 0, 1, 'news', '2025-09-09', NULL, '2025-09-09 07:05:36', 3),
(96, 'Sherlywin V. Bongalon delivers her story of professional growth with James Polymer.', '', 0, 0, 0, 1, 'news', '2025-09-09', NULL, '2025-09-09 07:05:46', 3),
(97, 'Harold Diaz Vivas offers his gratitude for the support of James Polymer.', '', 0, 0, 0, 1, 'news', '2025-09-09', NULL, '2025-09-09 07:06:01', 3),
(98, 'Rhea Mae B. Lapido reveals her testimony of success at James Polymer.', '', 0, 0, 0, 1, 'news', '2025-09-09', NULL, '2025-09-09 07:06:21', 3),
(99, 'Julius Christian Partido Cuvos delivers his remarkable testimony of hard work.', '', 0, 0, 0, 1, 'news', '2025-09-09', NULL, '2025-09-09 07:06:48', 3),
(100, 'Gerimae Vega Buen tells her heartfelt story of perseverance.', '', 0, 0, 0, 1, 'news', '2025-09-09', NULL, '2025-09-09 07:06:59', 3),
(101, 'Larrah Jane Ashley T. Manzo delivers her inspiring testimony of dedication.', '', 0, 0, 0, 1, 'news', '2025-09-09', NULL, '2025-09-09 07:07:11', 3),
(102, 'Hannah Jane C. Bito-on reveals her testimony of success at James Polymer.', '', 0, 0, 0, 1, 'news', '2025-09-09', NULL, '2025-09-09 07:07:23', 3),
(103, 'Jonel Billones Andamon reveals his encouraging testimony about James Polymer.', '', 0, 0, 0, 1, 'news', '2025-09-09', NULL, '2025-09-09 07:07:36', 3),
(104, 'Arl Joseph Lagasca Rodelas offers his testimony of growth and resilience', '', 0, 0, 0, 1, 'news', '2025-09-09', NULL, '2025-09-09 07:07:55', 3),
(106, 'Harold Miano Dizon recounts his powerful journey of dedication.', '', 0, 0, 0, 1, 'news', '2025-09-09', NULL, '2025-09-09 07:12:32', 3);

-- --------------------------------------------------------

--
-- Table structure for table `news_events_content_sections`
--

CREATE TABLE `news_events_content_sections` (
  `id` int(11) NOT NULL,
  `news_event_id` int(11) NOT NULL,
  `section_title` varchar(255) DEFAULT NULL,
  `section_content` text NOT NULL,
  `display_order` int(11) NOT NULL DEFAULT 0,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `news_events_content_sections`
--

INSERT INTO `news_events_content_sections` (`id`, `news_event_id`, `section_title`, `section_content`, `display_order`, `created_at`) VALUES
(34, 49, '', 'In a heartfelt moment during the latest James Polymers Manufacturing Corporation gathering, Aryne Kate Magsalang took the stage to share her personal testimony.\r\n\r\nHer story, filled with perseverance, growth, and gratitude, captivated the audience and left a lasting impact on attendees. \r\n\r\nHer message emphasized the importance of hard work, self-belief, and the value of opportunities provided by the company. \r\n\r\nThis event highlighted not only her journey but also the empowering culture fostered within James Polymers.', 0, '2025-07-03 09:22:28'),
(35, 50, '', 'Hanelyn Abilong took center stage during the recent James Polymers Manufacturing Corporation event to share her empowering testimony. \r\n\r\nWith sincerity and strength, she spoke about the challenges she has overcome, the lessons she has learned, and how the company\'s supportive environment helped her grow both professionally and personally. \r\n\r\nHer story served as a source of motivation for fellow employees, reminding everyone of the impact of dedication, teamwork, and a strong sense of purpose.', 0, '2025-07-03 10:05:41'),
(37, 52, '', 'During a recent James Polymers Manufacturing Corporation event, Gielyn Fernandez delivered an inspiring testimony that resonated deeply with employees and guests. \r\n\r\nShe reflected on her personal and professional journey, emphasizing resilience, learning through challenges, and the growth she experienced within the company. \r\n\r\nHer story served as a powerful reminder of how determination and a supportive workplace environment can shape success.\r\n\r\nGielyn’s message inspired many and reinforced the core values that James Polymers upholds.', 0, '2025-07-03 10:07:03'),
(38, 53, '', 'At a recent gathering hosted by James Polymers Manufacturing Corporation, John Joseph Albuera delivered a powerful testimony that inspired colleagues and guests alike. \r\n\r\nHe shared his journey of growth, the struggles he faced, and the breakthroughs that defined his path within the company. \r\n\r\nHis words highlighted the importance of perseverance, continuous learning, and the role of a positive work environment in achieving success. \r\n\r\nHis heartfelt message encouraged others to keep striving for excellence, no matter the obstacles.', 0, '2025-07-03 10:10:26'),
(39, 54, '', 'John Vern took the spotlight during the recent James Polymers Manufacturing Corporation event, delivering a motivational testimony that left a lasting impression on the audience. \r\n\r\nHe spoke about his personal and professional journey, the lessons he gained through perseverance, and the growth he experienced within the company. \r\n\r\nHis testimony highlighted the value of hard work, integrity, and the supportive culture at James Polymers, inspiring fellow employees to remain committed to their goals and proud of their contributions.', 0, '2025-07-03 10:12:43'),
(40, 55, '', 'In a moving testimony delivered at the recent James Polymers Manufacturing Corporation event, Junjay Sayco shared his journey marked by determination, learning, and growth. \r\n\r\nHe spoke openly about the challenges he encountered and how they shaped his character and work ethic. \r\n\r\nHis story emphasized the importance of perseverance, teamwork, and the opportunities provided by the company.\r\n\r\nJunjay’s heartfelt message resonated with many, serving as a reminder of the strength found in resilience and the positive impact of a supportive workplace.', 0, '2025-07-03 10:15:11'),
(41, 56, '', 'Justin James Belluso delivered an impactful and heartfelt testimony during the recent James Polymers Manufacturing Corporation event. \r\n\r\nReflecting on his experiences, he spoke about the challenges he faced, the lessons he learned, and how the company played a key role in his personal and professional development. \r\n\r\nHis story highlighted the importance of growth, dedication, and the value of a nurturing work environment. \r\n\r\nHis inspiring words left a strong impression on the audience, encouraging others to stay motivated and committed to their journey.', 0, '2025-07-03 10:22:19'),
(42, 57, '', 'At the recent James Polymers Manufacturing Corporation gathering, Marvin Alagos shared an inspiring testimony that deeply resonated with attendees. \r\n\r\nHe spoke about his personal and professional growth, the obstacles he has overcome, and how the company\'s culture of support and excellence helped shape his journey. \r\n\r\nMarvin’s story emphasized perseverance, humility, and the importance of seizing opportunities. \r\n\r\nHis message served as a powerful reminder to fellow employees that with dedication and the right environment, success is within reach.', 0, '2025-07-03 10:24:07'),
(43, 58, '', 'Phoebe Jane Mangakoy took the stage at the recent James Polymers Manufacturing Corporation event to share her uplifting and heartfelt testimony. \r\n\r\nShe reflected on her journey with the company, expressing gratitude for the experiences that shaped her professionally and personally. \r\n\r\nHer story highlighted the importance of staying committed, embracing growth, and finding purpose in every task. \r\n\r\nPhoebe’s sincere words inspired her fellow employees and reminded everyone of the positive impact of a supportive workplace and a resilient mindset.\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n', 0, '2025-07-03 10:29:22'),
(44, 59, '', 'During the recent James Polymers Manufacturing Corporation event, Prince Pila shared a heartfelt testimony that touched the hearts of many. \r\n\r\nHe spoke about his personal challenges, the lessons he learned through perseverance, and the growth he experienced within the company. \r\n\r\nHis story reflected the values of hard work, dedication, and the strength of a supportive community. \r\n\r\nPrince’s sincere words served as both an inspiration and a reminder of how every journey, no matter how difficult, can lead to meaningful success when guided by purpose and passion.', 0, '2025-07-03 10:31:23'),
(45, 60, '', 'Rhemnel Nimrhod Cecilio took the spotlight at the recent James Polymers Manufacturing Corporation event to share a powerful and moving testimony. \r\n\r\nHe reflected on his journey filled with challenges, growth, and meaningful achievements within the company. \r\n\r\nHis story emphasized the importance of resilience, continuous learning, and the value of being part of a team that believes in one’s potential. \r\n\r\nRhemnel’s testimony inspired his colleagues and served as a reminder that with determination and the right support, personal and professional success is always within reach.', 0, '2025-07-03 10:34:40'),
(46, 61, '', 'At the recent James Polymers Manufacturing Corporation event, Richardo Abanto delivered a motivational testimony that resonated with employees and guests alike. \r\n\r\nHe spoke about the valuable lessons he has learned, the challenges he overcame, and the growth he achieved through hard work and dedication. \r\n\r\nRichardo highlighted the importance of commitment, discipline, and the supportive culture fostered within the company. \r\n\r\nHis words served as an encouragement to his peers, reinforcing the belief that perseverance and a positive attitude can lead to meaningful progress and success.', 0, '2025-07-03 10:36:33'),
(47, 62, '', 'Roland Cris Jacob took the stage at the recent James Polymers Manufacturing Corporation event to deliver an inspiring testimony about his journey within the company. \r\n\r\nHe shared the challenges he faced, the growth he experienced, and the lessons that shaped his character and work ethic. \r\n\r\nHis heartfelt message emphasized the importance of perseverance, adaptability, and the strong sense of community at James Polymers. \r\n\r\nRoland’s story encouraged fellow employees to keep striving for excellence and to take pride in every step of their journey.', 0, '2025-07-03 10:38:25'),
(48, 63, '', 'Melchor Adrian Libarnes took the opportunity to share his insightful testimony during the recent James Polymers Manufacturing Corporation event.\r\n\r\nWith sincerity and humility, he reflected on his experiences, the challenges he encountered, and the milestones he achieved throughout his time with the company. \r\n\r\nHis story highlighted the value of perseverance, learning from setbacks, and staying committed to personal and professional growth. \r\n\r\nMelchor’s message inspired his colleagues and reinforced the importance of a strong work ethic and a supportive workplace environment.', 0, '2025-07-03 10:39:39'),
(49, 64, '', 'John Cody Aburquez took the stage during the recent James Polymers Manufacturing Corporation event to share an inspiring and heartfelt testimony. \r\n\r\nHe spoke about his journey of growth, the challenges he overcame, and how his experiences within the company helped shape his character and confidence. \r\n\r\nHis testimony emphasized the importance of determination, resilience, and the positive impact of a supportive team.\r\n\r\nJohn Cody’s story encouraged his fellow employees to believe in their potential and to continue striving for excellence in every aspect of their work.', 0, '2025-07-05 18:01:05'),
(50, 65, '', 'During the recent James Polymers Manufacturing Corporation event, Ken Levy Aniñon shared an empowering testimony that left a meaningful impression on everyone present. \r\n\r\nHe opened up about his experiences, highlighting the personal and professional challenges he faced and how he turned them into opportunities for growth. \r\n\r\nKen Levy expressed gratitude for the supportive environment at James Polymers, which helped him build confidence, skills, and a strong work ethic. \r\n\r\nHis story served as a powerful reminder that with perseverance and the right support system, anyone can rise above difficulties and achieve success.', 0, '2025-07-05 18:11:45'),
(51, 66, '', 'This photo collection captures the memorable moments and activities of our Batch One interns during their on-the-job training. The images highlight the practical tasks carried out by each department\'s interns:\r\n\r\n• Computer Engineering Interns are shown troubleshooting and repairing desktop computers, showcasing their technical problem-solving skills and hands-on hardware experience.\r\n\r\n• Marketing Interns are featured creating advertising materials and managing brand promotions, reflecting their creativity and communication strategies in real-world applications.\r\n\r\n• IT Interns are documented developing a functional website, representing their proficiency in web development and digital solutions.\r\n\r\n• Human Resource Interns are seen assisting in the recruitment process, handling applicant documents and coordinating interviews, demonstrating their organizational and people management skills.\r\n\r\nThe photo series concludes with the graduation ceremony of Batch One, marking the interns’ successful completion of their training — a celebration of growth, learning, and teamwork throughout their internship journey.', 0, '2025-07-08 08:05:41'),
(52, 67, NULL, 'This photo collection captures the memorable moments and activities of our Batch Two interns during their on-the-job training. The images highlight the practical tasks carried out by each department\'s interns:\r\n \r\n• Computer Engineering Interns are shown troubleshooting and repairing desktop computers, showcasing their technical problem-solving skills and hands-on hardware experience.\r\n\r\n• Marketing Interns are featured creating advertising materials and managing brand promotions, reflecting their creativity and communication strategies in real-world applications.\r\n\r\n• IT Interns are documented developing a functional website, representing their proficiency in web development and digital solutions.\r\n\r\n• Human Resource Interns are seen assisting in the recruitment process, handling applicant documents and coordinating interviews, demonstrating their organizational and people management skills.\r\n\r\nThe photo series concludes with the graduation ceremony of Batch Two, marking the interns’ successful completion of their training — a celebration of growth, learning, and teamwork throughout their internship journey.', 0, '2025-08-15 06:15:06'),
(53, 68, NULL, 'Cavite State University – Rosario recently conducted a plant visit to inspect the on-the-job training (OJT) performance of its interns across multiple departments. \r\n\r\nAccompanied by their OJT Coordinator and the Department Chairperson, the team evaluated each intern\'s contributions in the following areas:\r\n\r\n• Assets Management Team\r\n\r\n• Web Development Team\r\n\r\n• Arduino Team\r\n\r\n• ERP Team\r\n\r\n• IT Marketing Team\r\n\r\nThis visit provided essential oversight and support, ensuring that students are receiving meaningful learning experiences and meeting performance expectations under the guidance of their academic leaders.', 0, '2025-08-16 05:25:56'),
(54, 69, NULL, 'Adrian De Lara took the stage at the recent James Polymers Manufacturing Corporation event to deliver an inspiring testimony about his journey within the company. \r\n\r\nHe shared the challenges he faced, the growth he experienced, and the lessons that shaped his character and work ethic. \r\n\r\nHis heartfelt message emphasized the importance of perseverance, adaptability, and the strong sense of community at James Polymers. \r\n\r\nAdrian’s story encouraged fellow employees to keep striving for excellence and to take pride in every step of their journey.', 0, '2025-08-18 01:02:35'),
(55, 70, NULL, 'In a heartfelt moment during the latest James Polymers Manufacturing Corporation gathering, Aljohnson Daet took the stage to share his personal testimony. \r\n\r\nHis story, filled with perseverance, growth, and gratitude, captivated the audience and left a lasting impact on attendees. \r\n\r\nHis message emphasized the importance of hard work, self-belief, and the value of opportunities provided by the company.\r\n\r\nThis event highlighted not only his journey but also the empowering culture fostered within James Polymers.', 0, '2025-08-18 03:09:47'),
(56, 71, NULL, 'Carlos Luis Cataulin took center stage during the recent James Polymers Manufacturing Corporation event to share his empowering testimony. \r\n\r\nWith sincerity and strength, he spoke about the challenges he has overcome, the lessons he has learned, and how the company\'s supportive environment helped him grow both professionally and personally. \r\n\r\nHis story served as a source of motivation for fellow employees, reminding everyone of the impact of dedication, teamwork, and a strong sense of purpose.', 0, '2025-08-18 03:13:47'),
(57, 72, NULL, 'During a recent James Polymers Manufacturing Corporation event, Francis Emmanuel Abaya delivered an inspiring testimony that resonated deeply with employees and guests. \n\nHe reflected on his personal and professional journey, emphasizing resilience, learning through challenges, and the growth he experienced within the company. \n\nHis story served as a powerful reminder of how determination and a supportive workplace environment can shape success. His message inspired many and reinforced the core values that James Polymers upholds.', 0, '2025-08-18 03:17:59'),
(58, 73, NULL, 'At a recent gathering hosted by James Polymers Manufacturing Corporation, Genrey Palomares delivered a powerful testimony that inspired colleagues and guests alike. \r\n\r\nHe shared his journey of growth, the struggles he faced, and the breakthroughs that defined his path within the company. \r\n\r\nHis words highlighted the importance of perseverance, continuous learning, and the role of a positive work environment in achieving success. \r\n\r\nHis heartfelt message encouraged others to keep striving for excellence, no matter the obstacles.', 0, '2025-08-18 03:20:37'),
(59, 74, NULL, 'Jerico Altabano took the spotlight during the recent James Polymers Manufacturing Corporation event, delivering a motivational testimony that left a lasting impression on the audience. \r\n\r\nHe spoke about his personal and professional journey, the lessons he gained through perseverance, and the growth he experienced within the company. \r\n\r\nHis testimony highlighted the value of hard work, integrity, and the supportive culture at James Polymers, inspiring fellow employees to remain committed to their goals and proud of their contributions.', 0, '2025-08-18 03:22:32'),
(60, 75, NULL, 'In a moving testimony delivered at the recent James Polymers Manufacturing Corporation event, Jonathan Fajardo shared his journey marked by determination, learning, and growth. \r\n\r\nHe spoke openly about the challenges he encountered and how they shaped his character and work ethic. \r\n\r\nHis story emphasized the importance of perseverance, teamwork, and the opportunities provided by the company.\r\n\r\nJonathan\'s heartfelt message resonated with many, serving as a reminder of the strength found in resilience and the positive impact of a supportive workplace.', 0, '2025-08-18 03:25:04'),
(61, 76, NULL, 'John Lawrence Agustin delivered an impactful and heartfelt testimony during the recent James Polymers Manufacturing Corporation event. \r\n\r\nReflecting on his experiences, he spoke about the challenges he faced, the lessons he learned, and how the company played a key role in his personal and professional development. \r\n\r\nHis story highlighted the importance of growth, dedication, and the value of a nurturing work environment. \r\n\r\nHis inspiring words left a strong impression on the audience, encouraging others to stay motivated and committed to their journey.', 0, '2025-08-18 03:28:12'),
(62, 77, NULL, 'At the recent James Polymers Manufacturing Corporation gathering, Paul Vincent Olega shared an inspiring testimony that deeply resonated with attendees. \n\nHe spoke about his personal and professional growth, the obstacles he has overcome, and how the company\'s culture of support and excellence helped shape his journey. \n\nPaul’s story emphasized perseverance, humility, and the importance of seizing opportunities. \n\nHis message served as a powerful reminder to fellow employees that with dedication and the right environment, success is within reach.', 0, '2025-08-18 03:31:18'),
(63, 78, NULL, 'Randy Cornita took the spotlight at the recent James Polymers Manufacturing Corporation event to share a powerful and moving testimony. \r\n\r\nHe reflected on his journey filled with challenges, growth, and meaningful achievements within the company. \r\n\r\nHis story emphasized the importance of resilience, continuous learning, and the value of being part of a team that believes in one’s potential. \r\n\r\nRandy’s testimony inspired his colleagues and served as a reminder that with determination and the right support, personal and professional success is always within reach.', 0, '2025-08-18 03:33:26'),
(64, 79, NULL, 'Ronald Josiah Cruz took the stage at the recent James Polymers Manufacturing Corporation event to deliver an inspiring testimony about his journey within the company. \r\n\r\nHe shared the challenges he faced, the growth he experienced, and the lessons that shaped his character and work ethic. \r\n\r\nHis heartfelt message emphasized the importance of perseverance, adaptability, and the strong sense of community at James Polymers. \r\n\r\nRonald’s story encouraged fellow employees to keep striving for excellence and to take pride in every step of their journey.', 0, '2025-08-18 03:36:00'),
(65, 80, NULL, 'During a recent James Polymers Manufacturing Corporation gathering, Niña Mae M. Rubio shared her heartfelt testimony with employees and partners.\n\nShe spoke about the value of perseverance, the importance of learning, and the personal growth she achieved through her role in the company.\n\nHer story motivated others to stay committed to excellence and highlighted the supportive culture that James Polymers provides.', 0, '2025-09-09 05:12:34'),
(66, 81, NULL, 'At a leadership workshop, Jasmin Rize H. Calicdan gave her moving story that shed light on her experiences with James Polymers.\r\n\r\nShe explained how the company encouraged her to discover her potential, supported her during difficult times, and opened doors for her career development.\r\n\r\nHer message served as a strong reminder of how growth happens when determination meets opportunity.', 0, '2025-09-09 05:29:12'),
(67, 82, NULL, 'During a corporate event, Angelica P. Ramirez  shared her inspiring account of what James Polymers has meant in her professional journey.\r\n\r\nShe highlighted the importance of patience, the skills she developed, and the encouragement she consistently received from colleagues and mentors.\r\n\r\nHer testimony gave employees a renewed sense of motivation and confidence in their own paths.', 0, '2025-09-09 05:32:39'),
(68, 83, NULL, 'During a staff development session, Cathereena Paula G.Capacia  shared her testimony that spoke of perseverance and determination.\r\n\r\nShe described how the company’s environment motivated her to keep striving, provided her with support during challenges, and celebrated her progress.\r\n\r\nHer story served as an inspiration for colleagues to stay committed to excellence and long-term growth.', 0, '2025-09-09 05:34:22'),
(69, 84, NULL, 'During a recent James Polymers event, Mark Jezreel C. Antivo shared his inspiring testimony that reflected on his years of service.\r\n\r\nHe spoke about the challenges he faced in his role, the way the company provided him with opportunities to grow, and how teamwork shaped his success.\r\n\r\nHis story encouraged colleagues to value persistence and highlighted James Polymers’ commitment to empowering its people.', 0, '2025-09-09 05:36:33'),
(70, 85, NULL, 'During a training program, Sebastian Lucas Tagalog presented his uplifting story with James Polymers.\r\n\r\nHe described how the company shaped his career path, providing both opportunities to advance and a supportive team to guide him.\r\n\r\nHis testimony left colleagues motivated to embrace hard work and perseverance.', 0, '2025-09-09 05:37:55'),
(71, 86, NULL, 'During a company program, Danzle Ian Bucoy Vale Cruz delivered an encouraging testimony about his experiences.\r\n\r\nHe described the lessons he learned from setbacks, the skills he developed through guidance, and the growth he achieved with persistence.\r\n                                                                                                                                              \r\nHis account motivated colleagues to pursue excellence while appreciating the value of hard work.', 0, '2025-09-09 05:45:35'),
(72, 87, NULL, 'During a company celebration, Marc Daniel D. Moratalla shared his motivating testimony.\r\n\r\nHe described how he started with small roles but gradually advanced by learning, working hard, and relying on the company’s guidance.\r\n                                                                                                                                              \r\nHis account encouraged employees to value persistence and patience in their career journeys.', 0, '2025-09-09 05:48:22'),
(73, 88, NULL, 'At a development workshop, Mhira Shane O. Pato shared her uplifting testimony.\r\n\r\nShe spoke about her professional growth, the lessons she learned from mentors, and the importance of determination.\r\n\r\nHer message gave employees renewed motivation to continue striving for excellence.', 0, '2025-09-09 05:57:29'),
(74, 89, NULL, 'In a recent employee engagement activity, John Benedict L. Tabor delivered his testimony that captured the true essence of teamwork within James Polymers.\n\nHe described the way collaboration, guidance from leaders, and the company’s values helped him turn challenges into meaningful achievements.\n                                                                                                                                              \nHis story reinforced the importance of trust and cooperation in building long-term success.', 0, '2025-09-09 05:59:25'),
(75, 90, NULL, 'During his OJT, Kenneth Gabren E. Oakes gave his testimony about the importance of hard work and consistency.\n\nHe emphasized how James Polymers taught him to be detail-oriented, responsible, and focused on achieving results.\n\nHis message motivated students to understand that excellence is built through daily effort and persistence.', 0, '2025-09-09 07:19:09'),
(76, 91, NULL, 'At the end of his OJT, Arlan M. Salisipan Jr. presented a heartfelt testimony about his growth.\n\nHe shared how the program gave him hands-on training, boosted his confidence, and taught him the importance of responsibility.\n\nHis words inspired students to see their OJT as a foundation for their professional success.', 0, '2025-09-09 07:19:32'),
(77, 92, NULL, 'In her testimony, Cristine S. Trubanos shared her growth and development from her OJT at James Polymers.\n\nShe talked about how the company environment taught her responsibility, patience, and the importance of effective communication.\n\nHer message encouraged other students to maximize their training experience as preparation for their future careers.', 0, '2025-09-09 07:19:45'),
(78, 93, NULL, 'At the conclusion of his OJT, Daniel Ross B. Evia shared his moving testimony about the lessons he gained.\n\nHe described how James Polymers gave him a deeper understanding of his chosen career, built his confidence, and helped him develop a professional mindset.\n\nHis message encouraged other trainees to stay motivated and always open to learning in order to succeed.', 0, '2025-09-09 07:20:05'),
(79, 94, NULL, 'During his OJT, Elisha B. Rebollos gave his testimony about the skills and lessons he gained at James Polymers.\n\nHe highlighted how hands-on experiences, real tasks, and close guidance from staff gave him a clearer understanding of his career path.\n\nHis words motivated trainees to embrace training with passion, dedication, and a positive outlook.', 0, '2025-09-09 07:21:05'),
(80, 95, NULL, 'In his OJT testimony, Kim Irvine Ulep reflected on how his training at James Polymers changed his perspective on work.\n\nHe spoke about how he gained discipline, improved his technical knowledge, and learned how to balance efficiency with accuracy in his role.\n\nHis message reminded trainees that challenges are not obstacles but opportunities to become better versions of themselves.', 0, '2025-09-09 07:21:19'),
(82, 96, NULL, 'Sherlywin V. Bongalon shared her testimony about the transformative experiences she had as an OJT trainee at James Polymers.\n\nShe emphasized how she developed stronger problem-solving skills, learned to adapt to challenges, and discovered the importance of teamwork in reaching goals.\n\nHer story encouraged students to approach every task with responsibility and a willingness to learn.', 0, '2025-09-09 07:21:44'),
(83, 97, NULL, 'During his OJT, Harold Diaz Vivas presented his testimony highlighting how valuable real-world training can be.\n\nHe spoke about the opportunities James Polymers gave him to work alongside skilled professionals, learn practical techniques, and build confidence in his chosen field.\n\nHis account motivated other students to take their training seriously and see it as a stepping stone to future success.', 0, '2025-09-09 07:21:57'),
(84, 98, NULL, 'As part of her OJT program, Rhea Mae B. Lapido gave her inspiring testimony about her growth and experiences at James Polymers.\n\nShe shared how the supportive workplace environment helped her develop communication skills, leadership abilities, and the courage to step out of her comfort zone.\n\nHer message reminded trainees that determination and openness to learning are key ingredients for success.', 0, '2025-09-09 07:22:52'),
(85, 99, NULL, 'Julius Christian Partido Cuvos reflected on his OJT journey with James Polymers in a heartfelt testimony that captured his personal development.\n\nHe emphasized how mentorship from supervisors taught him the value of discipline, teamwork, and time management, which made him more confident and capable.\n\nHis words encouraged other students to embrace every challenge as an opportunity to grow both professionally and personally.', 0, '2025-09-09 07:23:09'),
(86, 100, NULL, 'Gerimae Vega Buen presented her heartfelt OJT testimony reflecting on her time as a trainee at James Polymers.\n\nShe explained how the program taught her patience, honed her adaptability, and reinforced the importance of being committed even in small tasks.\n\nHer story inspired students to understand that success starts with discipline and the willingness to learn.', 0, '2025-09-09 07:26:45'),
(87, 101, NULL, 'During her OJT, Larrah Jane Ashley T. Manzo reflected on the professional values she learned at James Polymers.\n\nShe emphasized how the company guided her in developing leadership qualities, teamwork, and adaptability to various challenges.\n\nHer story encouraged trainees to remain open-minded and always eager to learn from others.', 0, '2025-09-09 07:27:43'),
(88, 102, NULL, 'Hannah Jane C. Bito-on delivered an inspiring OJT testimony during the program’s closing.\n\nShe shared how the experience built her confidence, taught her patience, and allowed her to discover her strengths in a professional setting.\n\nHer words motivated trainees to see every challenge as an opportunity for growth.', 0, '2025-09-09 07:28:15'),
(89, 103, NULL, 'In his OJT testimony,Jonel Billones Andamon shared his gratitude for the meaningful experiences he had at James Polymers.\n\nHe explained how the training gave him practical knowledge, taught him responsibility, and helped him envision his future career.\n\nHis story encouraged students to stay motivated and view OJT as the first step toward success.', 0, '2025-09-09 07:29:18'),
(90, 104, NULL, 'During his OJT, Arl Joseph Lagasca Rodelas reflected on his growth with James Polymers.\n\nHe highlighted how the company’s guidance helped him apply theory into practice, develop confidence, and learn professional values.\n\nHis words encouraged students to use their OJT as a foundation for future success.', 0, '2025-09-09 07:30:48'),
(92, 106, NULL, 'During his OJT, Harold Miano Dizon gave his testimony about the value of hard work and consistency.\n\nHe spoke about how James Polymers nurtured his professional skills and provided him with practical experiences that shaped his perspective.\n\nHis account reminded trainees that every effort contributes to long-term success.', 0, '2025-09-09 07:31:11');

-- --------------------------------------------------------

--
-- Table structure for table `news_events_images`
--

CREATE TABLE `news_events_images` (
  `id` int(100) NOT NULL,
  `news_event_id` int(100) NOT NULL,
  `image_path` varchar(255) NOT NULL,
  `alt_text` varchar(255) DEFAULT NULL,
  `display_order` int(11) NOT NULL DEFAULT 0,
  `is_featured` tinyint(1) NOT NULL DEFAULT 0,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `news_events_images`
--

INSERT INTO `news_events_images` (`id`, `news_event_id`, `image_path`, `alt_text`, `display_order`, `is_featured`, `created_at`) VALUES
(29, 49, 'assets/img/ojt_pictures/aryne.png', '', 0, 1, '2025-07-03 09:22:28'),
(30, 50, 'assets/img/ojt_pictures/hanelyn.png', '', 0, 1, '2025-07-03 10:05:41'),
(31, 52, 'assets/img/ojt_pictures/fernandez.png', '', 0, 1, '2025-07-03 10:07:03'),
(32, 53, 'assets/img/ojt_pictures/joseph.png', '', 0, 1, '2025-07-03 10:10:26'),
(33, 54, 'assets/img/ojt_pictures/vern.png', '', 0, 1, '2025-07-03 10:12:43'),
(34, 55, 'assets/img/ojt_pictures/junjay.png', '', 0, 1, '2025-07-03 10:15:11'),
(35, 56, 'assets/img/ojt_pictures/justine.png', '', 0, 1, '2025-07-03 10:22:19'),
(36, 57, 'assets/img/ojt_pictures/marvin.png', '', 0, 1, '2025-07-03 10:24:07'),
(37, 58, 'assets/img/ojt_pictures/phoebe.png', '', 0, 1, '2025-07-03 10:29:22'),
(38, 59, 'assets/img/ojt_pictures/prince.png', '', 0, 1, '2025-07-03 10:31:23'),
(39, 60, 'assets/img/ojt_pictures/rhemnel.png', '', 0, 1, '2025-07-03 10:34:40'),
(40, 61, 'assets/img/ojt_pictures/richardo.png', '', 0, 1, '2025-07-03 10:36:33'),
(41, 62, 'assets/img/ojt_pictures/roland.png', '', 0, 1, '2025-07-03 10:38:25'),
(42, 63, 'assets/img/ojt_pictures/adrian.png', '', 0, 1, '2025-07-03 10:39:39'),
(43, 64, 'assets/img/ojt_pictures/cody.png', '', 0, 1, '2025-07-05 18:01:05'),
(44, 65, 'assets/img/ojt_pictures/ken.png', '', 0, 1, '2025-07-05 18:11:45'),
(45, 66, 'assets/img/ojt_pictures/1 (13).jpg', '', 0, 1, '2025-07-08 08:05:41'),
(49, 66, 'assets/img/ojt_pictures/1 (2).jpg', '', 0, 1, '2025-07-08 08:05:41'),
(50, 66, 'assets/img/ojt_pictures/1 (3).jpg', '', 0, 1, '2025-07-08 08:05:41'),
(51, 66, 'assets/img/ojt_pictures/1 (5).jpg', '', 0, 1, '2025-07-08 08:05:41'),
(52, 66, 'assets/img/ojt_pictures/1 (6).jpg', '', 0, 1, '2025-07-08 08:05:41'),
(53, 66, 'assets/img/ojt_pictures/1 (7).jpg', '', 0, 1, '2025-07-08 08:05:41'),
(54, 66, 'assets/img/ojt_pictures/1 (8).jpg', '', 0, 1, '2025-07-08 08:05:41'),
(55, 66, 'assets/img/ojt_pictures/1 (10).jpg', '', 0, 1, '2025-07-08 08:05:41'),
(56, 66, 'assets/img/ojt_pictures/1 (11).jpg', '', 0, 1, '2025-07-08 08:05:41'),
(57, 66, 'assets/img/ojt_pictures/1 (12).jpg', '', 0, 1, '2025-07-08 08:05:41'),
(58, 66, 'assets/img/ojt_pictures/1 (14).jpg', '', 0, 1, '2025-07-08 08:05:41'),
(59, 66, 'assets/img/ojt_pictures/1 (15).jpg', '', 0, 1, '2025-07-08 08:05:41'),
(60, 66, 'assets/img/ojt_pictures/1 (18).jpg', '', 0, 1, '2025-07-08 08:05:41'),
(61, 66, 'assets/img/ojt_pictures/1 (19).jpg', '', 0, 1, '2025-07-08 08:05:41'),
(62, 66, 'assets/img/ojt_pictures/1 (20).jpg', '', 0, 1, '2025-07-08 08:05:41'),
(63, 66, 'assets/img/ojt_pictures/1 (21).jpg', '', 0, 1, '2025-07-08 08:05:41'),
(64, 66, 'assets/img/ojt_pictures/1 (22).jpg', '', 0, 1, '2025-07-08 08:05:41'),
(65, 66, 'assets/img/ojt_pictures/1 (23).jpg', '', 0, 1, '2025-07-08 08:05:41'),
(66, 67, 'assets/img/ojt_pictures/2 (16).webp', NULL, 0, 0, '2025-08-15 06:10:54'),
(67, 67, 'assets/img/ojt_pictures/2 (14).png', NULL, 0, 0, '2025-08-15 06:12:25'),
(68, 67, 'assets/img/ojt_pictures/2 (2).png', NULL, 0, 0, '2025-08-15 06:12:34'),
(69, 67, 'assets/img/ojt_pictures/2 (3).png', NULL, 0, 0, '2025-08-15 06:12:44'),
(70, 67, 'assets/img/ojt_pictures/2 (4).png', NULL, 0, 0, '2025-08-15 06:12:58'),
(71, 66, 'assets/img/ojt_pictures/2 (5).png', NULL, 0, 0, '2025-08-15 06:13:06'),
(72, 67, 'assets/img/ojt_pictures/2 (6).png', NULL, 0, 0, '2025-08-15 06:13:14'),
(73, 67, 'assets/img/ojt_pictures/2 (7).png', NULL, 0, 0, '2025-08-15 06:13:24'),
(74, 67, 'assets/img/ojt_pictures/2 (8).png', NULL, 0, 0, '2025-08-15 06:13:33'),
(75, 67, 'assets/img/ojt_pictures/2 (9).png', NULL, 0, 0, '2025-08-15 06:13:41'),
(76, 67, 'assets/img/ojt_pictures/2 (10).png', NULL, 0, 0, '2025-08-15 06:13:52'),
(77, 67, 'assets/img/ojt_pictures/2 (11).png', NULL, 0, 0, '2025-08-15 06:14:04'),
(78, 67, 'assets/img/ojt_pictures/2 (12).png', NULL, 0, 0, '2025-08-15 06:14:11'),
(79, 67, 'assets/img/ojt_pictures/2 (13).png', NULL, 0, 0, '2025-08-15 06:14:21'),
(80, 68, 'assets/img/ojt_pictures/Plant_Visit1.jpg', NULL, 0, 0, '2025-08-16 05:27:16'),
(81, 69, 'assets/img/ojt_pictures/lara.png', NULL, 0, 0, '2025-08-18 01:09:44'),
(82, 70, 'assets/img/ojt_pictures/aljohnson.png', NULL, 0, 0, '2025-08-18 03:11:37'),
(83, 71, 'assets/img/ojt_pictures/cataulin.png', NULL, 0, 0, '2025-08-18 03:15:48'),
(84, 72, 'assets/img/ojt_pictures/abaya.png', NULL, 0, 0, '2025-08-18 03:18:52'),
(85, 73, 'assets/img/ojt_pictures/genrey.png', NULL, 0, 0, '2025-08-18 03:21:20'),
(86, 74, 'assets/img/ojt_pictures/altabano.png', NULL, 0, 0, '2025-08-18 03:23:22'),
(87, 75, 'assets/img/ojt_pictures/fajardo.png', NULL, 0, 0, '2025-08-18 03:25:53'),
(88, 76, 'assets/img/ojt_pictures/lawrence.png', NULL, 0, 0, '2025-08-18 03:29:34'),
(89, 77, 'assets/img/ojt_pictures/olega.png', NULL, 0, 0, '2025-08-18 03:31:58'),
(90, 78, 'assets/img/ojt_pictures/cornita.png', NULL, 0, 0, '2025-08-18 03:34:05'),
(91, 79, 'assets/img/ojt_pictures/josiah.png', NULL, 0, 0, '2025-08-18 03:37:00'),
(92, 80, 'assets/img/ojt_pictures/3 (1).png', NULL, 0, 0, '2025-09-09 06:16:51'),
(93, 81, 'assets/img/ojt_pictures/3 (2).png', NULL, 0, 0, '2025-09-09 06:18:18'),
(94, 82, 'assets/img/ojt_pictures/3 (3).png', NULL, 0, 0, '2025-09-09 06:19:47'),
(95, 83, 'assets/img/ojt_pictures/3 (4).png', NULL, 0, 0, '2025-09-09 06:20:35'),
(96, 84, 'assets/img/ojt_pictures/3 (5).png', NULL, 0, 0, '2025-09-09 06:22:28'),
(97, 85, 'assets/img/ojt_pictures/3 (6).png', NULL, 0, 0, '2025-09-09 06:24:11'),
(98, 86, 'assets/img/ojt_pictures/3 (7).png', NULL, 0, 0, '2025-09-09 06:24:35'),
(99, 87, 'assets/img/ojt_pictures/3 (8).png', NULL, 0, 0, '2025-09-09 06:24:50'),
(100, 88, 'assets/img/ojt_pictures/3 (9).png', NULL, 0, 0, '2025-09-09 06:25:34'),
(101, 89, 'assets/img/ojt_pictures/3 (10).png', NULL, 0, 0, '2025-09-09 06:27:38'),
(102, 90, 'assets/img/ojt_pictures/3 (11).png', NULL, 0, 0, '2025-09-10 01:38:35'),
(103, 91, 'assets/img/ojt_pictures/3 (12).png', NULL, 0, 0, '2025-09-10 01:45:15'),
(104, 92, 'assets/img/ojt_pictures/3 (13).png', NULL, 0, 0, '2025-09-10 01:46:30'),
(105, 93, 'assets/img/ojt_pictures/3 (14).png', NULL, 0, 0, '2025-09-10 01:49:57'),
(106, 94, 'assets/img/ojt_pictures/3 (15).png', NULL, 0, 0, '2025-09-10 01:51:14'),
(107, 95, 'assets/img/ojt_pictures/3 (16).png', NULL, 0, 0, '2025-09-10 01:52:25'),
(108, 96, 'assets/img/ojt_pictures/3 (17).png', NULL, 0, 1, '2025-09-10 02:01:27'),
(109, 97, 'assets/img/ojt_pictures/3 (18).png', NULL, 0, 0, '2025-09-10 02:09:07'),
(110, 98, 'assets/img/ojt_pictures/3 (19).png', NULL, 0, 0, '2025-09-10 02:19:36'),
(111, 99, 'assets/img/ojt_pictures/3 (20).png', NULL, 0, 0, '2025-09-10 02:20:31'),
(112, 100, 'assets/img/ojt_pictures/3 (21).png', NULL, 0, 0, '2025-09-10 02:23:40'),
(113, 101, 'assets/img/ojt_pictures/3 (22).png', NULL, 0, 0, '2025-09-10 02:24:25'),
(114, 102, 'assets/img/ojt_pictures/3 (23).png', NULL, 0, 0, '2025-09-10 02:30:22'),
(115, 103, 'assets/img/ojt_pictures/3 (24).png', NULL, 0, 0, '2025-09-10 02:31:47'),
(116, 104, 'assets/img/ojt_pictures/3 (25).png', NULL, 0, 0, '2025-09-10 02:32:47'),
(117, 106, 'assets/img/ojt_pictures/3 (26).png', NULL, 0, 0, '2025-09-10 02:58:22');

-- --------------------------------------------------------

--
-- Table structure for table `news_events_videos`
--

CREATE TABLE `news_events_videos` (
  `id` int(11) NOT NULL,
  `news_event_id` int(11) NOT NULL,
  `video_type` enum('local','url') NOT NULL DEFAULT 'local',
  `video_path` varchar(500) NOT NULL,
  `video_title` varchar(255) DEFAULT NULL,
  `video_description` text DEFAULT NULL,
  `display_order` int(11) NOT NULL DEFAULT 0,
  `is_featured` tinyint(1) NOT NULL DEFAULT 0,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `ojt_media_gallery`
--

CREATE TABLE `ojt_media_gallery` (
  `id` int(255) NOT NULL,
  `batch` enum('Batch 1','Batch 2','Batch 3') NOT NULL,
  `image` varchar(255) NOT NULL,
  `is_active` tinyint(1) DEFAULT 1,
  `uploaded_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `ojt_media_gallery`
--

INSERT INTO `ojt_media_gallery` (`id`, `batch`, `image`, `is_active`, `uploaded_at`) VALUES
(1, 'Batch 1', 'assets/img/media_gallery/1 (2).jpg', 1, '2025-08-09 06:52:10'),
(2, 'Batch 1', 'assets/img/media_gallery/1 (3).jpg', 1, '2025-08-09 06:52:10'),
(3, 'Batch 1', 'assets/img/media_gallery/1 (4).jpg', 1, '2025-08-09 06:52:10'),
(4, 'Batch 1', 'assets/img/media_gallery/1 (5).jpg', 1, '2025-08-09 06:52:10'),
(5, 'Batch 1', 'assets/img/media_gallery/1 (6).jpg', 1, '2025-08-09 06:52:10'),
(6, 'Batch 1', 'assets/img/media_gallery/1 (8).jpg', 1, '2025-08-09 06:52:10'),
(8, 'Batch 1', 'assets/img/media_gallery/1 (10).jpg', 1, '2025-08-09 06:52:10'),
(9, 'Batch 1', 'assets/img/media_gallery/1 (11).jpg', 1, '2025-08-09 06:52:10'),
(10, 'Batch 1', 'assets/img/media_gallery/1 (12).jpg', 1, '2025-08-09 06:52:10'),
(11, 'Batch 1', 'assets/img/media_gallery/1 (13).jpg', 1, '2025-08-09 06:52:10'),
(12, 'Batch 1', 'assets/img/media_gallery/1 (14).jpg', 1, '2025-08-09 06:52:10'),
(13, 'Batch 1', 'assets/img/media_gallery/1 (23).jpg', 1, '2025-08-09 06:52:10'),
(14, 'Batch 2', 'assets/img/media_gallery/2 (1).png', 1, '2025-08-15 09:14:32'),
(15, 'Batch 2', 'assets/img/media_gallery/2 (2).png', 1, '2025-08-15 09:14:57'),
(16, 'Batch 2', 'assets/img/media_gallery/2 (3).png', 1, '2025-08-15 09:15:05'),
(17, 'Batch 2', 'assets/img/media_gallery/2 (4).png', 1, '2025-08-15 09:15:12'),
(18, 'Batch 2', 'assets/img/media_gallery/2 (5).png', 1, '2025-08-15 09:15:24'),
(19, 'Batch 2', 'assets/img/media_gallery/2 (6).png', 1, '2025-08-15 09:15:32'),
(20, 'Batch 2', 'assets/img/media_gallery/2 (7).png', 1, '2025-08-15 09:15:41'),
(21, 'Batch 2', 'assets/img/media_gallery/2 (8).png', 1, '2025-08-15 09:15:49'),
(22, 'Batch 2', 'assets/img/media_gallery/2 (9).png', 1, '2025-08-15 09:15:58'),
(23, 'Batch 2', 'assets/img/media_gallery/2 (10).png', 1, '2025-08-15 09:16:04'),
(24, 'Batch 2', 'assets/img/media_gallery/2 (11).png', 1, '2025-08-15 09:16:10'),
(25, 'Batch 2', 'assets/img/media_gallery/2 (12).png', 1, '2025-08-15 09:16:18'),
(26, 'Batch 2', 'assets/img/media_gallery/2 (13).png', 1, '2025-08-15 09:16:27'),
(27, 'Batch 2', 'assets/img/media_gallery/2 (14).png', 1, '2025-08-15 09:16:34'),
(28, 'Batch 2', 'assets/img/media_gallery/2 (15).png', 1, '2025-08-15 09:16:41'),
(29, 'Batch 3', 'assets/img/media_gallery/3 (1).jpg', 1, '2025-08-16 03:52:41'),
(30, 'Batch 3', 'assets/img/media_gallery/3 (10).jpg', 1, '2025-08-16 03:52:57'),
(31, 'Batch 3', 'assets/img/media_gallery/3 (2).jpg', 1, '2025-08-16 03:53:05'),
(32, 'Batch 3', 'assets/img/media_gallery/3 (3).jpg', 1, '2025-08-16 03:53:12'),
(33, 'Batch 3', 'assets/img/media_gallery/3 (4).jpg', 1, '2025-08-16 03:53:40'),
(34, 'Batch 3', 'assets/img/media_gallery/3 (11).jpg', 1, '2025-08-27 07:19:01'),
(36, 'Batch 3', 'assets/img/media_gallery/3 (8).jpg', 1, '2025-08-16 03:54:05'),
(37, 'Batch 3', 'assets/img/media_gallery/3 (9).jpg', 1, '2025-08-16 03:54:15'),
(38, 'Batch 3', 'assets/img/media_gallery/3 (12).jpg', 1, '2025-08-26 16:00:00'),
(39, 'Batch 3', 'assets/img/media_gallery/3 (13).jpg', 1, '2025-08-27 07:30:35'),
(40, 'Batch 3', 'assets/img/media_gallery/3 (14).jpg', 1, '2025-08-27 07:30:52'),
(41, 'Batch 3', 'assets/img/media_gallery/3 (17).jpg', 1, '2025-08-27 07:32:43'),
(42, 'Batch 3', 'assets/img/media_gallery/3 (15).jpg', 1, '2025-08-27 07:32:56'),
(43, 'Batch 3', 'assets/img/media_gallery/3 (16).jpg', 1, '2025-08-27 07:33:33'),
(44, 'Batch 3', 'assets/img/media_gallery/3 (18).jpg', 1, '2025-08-27 07:35:27'),
(45, 'Batch 3', 'assets/img/media_gallery/3 (19).jpg\r\n', 1, '2025-08-27 07:53:23'),
(46, 'Batch 3', 'assets/img/media_gallery/3 (20).jpg\r\n', 1, '2025-08-27 07:53:37'),
(47, 'Batch 3', 'assets/img/media_gallery/3 (21).jpg\r\n', 1, '2025-08-27 07:54:00'),
(48, 'Batch 3', 'assets/img/media_gallery/3 (22).jpg\r\n', 1, '2025-08-27 07:54:16'),
(49, 'Batch 3', 'assets/img/media_gallery/3 (23).jpg\r\n', 1, '2025-08-27 07:54:31'),
(50, 'Batch 3', 'assets/img/media_gallery/3 (24).jpg\r\n', 1, '2025-08-27 07:54:53'),
(51, 'Batch 3', 'assets/img/media_gallery/3 (25).jpg\r\n', 1, '2025-08-27 07:55:35'),
(52, 'Batch 3', 'assets/img/media_gallery/3 (26).jpg\r\n', 1, '2025-08-27 07:55:53'),
(53, 'Batch 3', 'assets/img/media_gallery/3 (27).jpg\r\n', 1, '2025-08-27 07:56:06'),
(54, 'Batch 3', 'assets/img/media_gallery/3 (28).jpg\r\n', 1, '2025-08-27 07:56:21'),
(55, 'Batch 3', 'assets/img/media_gallery/3 (29).jpg\r\n', 1, '2025-08-27 07:57:14'),
(56, 'Batch 3', 'assets/img/media_gallery/3 (30).jpg\r\n', 1, '2025-08-27 07:57:29');

-- --------------------------------------------------------

--
-- Table structure for table `overview_processes`
--

CREATE TABLE `overview_processes` (
  `id` int(11) NOT NULL,
  `process_type` enum('plastic','rubber') NOT NULL,
  `title` varchar(255) NOT NULL,
  `description` text NOT NULL,
  `image` varchar(255) DEFAULT NULL,
  `created_at` datetime DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `overview_processes`
--

INSERT INTO `overview_processes` (`id`, `process_type`, `title`, `description`, `image`, `created_at`) VALUES
(1, 'plastic', 'Plastic Injection Process', 'Plastic injection molding involves melting plastic pellets and injecting them into a mold cavity to form precise and durable parts. It\'s ideal for high-volume production of consistent plastic components.\r\nThe image below illustrates our plastic injection processing diagram.', 'Plastic Injection Process Chart.png', '2025-08-09 16:40:13'),
(2, 'rubber', 'Rubber Molding Process', 'Rubber molding involves shaping rubber material by applying heat and pressure within a mold cavity to produce flexible, resilient parts. It is commonly used for manufacturing seals, gaskets, and custom rubber components with excellent durability and performance. The image below illustrates our rubber molding processing diagram.\r\n', 'Rubber Molding Process Chart.png', '2025-08-09 16:40:13');

-- --------------------------------------------------------

--
-- Table structure for table `overview_process_info`
--

CREATE TABLE `overview_process_info` (
  `id` int(11) NOT NULL,
  `heading` varchar(255) NOT NULL,
  `description` text NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `overview_process_info`
--

INSERT INTO `overview_process_info` (`id`, `heading`, `description`) VALUES
(1, 'Company Business Overview Process', 'At James Polymers Manufacturing Corporation, our business process is designed to ensure efficiency, quality, and client satisfaction at every stage. From initial consultation to final delivery, we follow a structured approach that promotes transparency and results-driven action.');

-- --------------------------------------------------------

--
-- Table structure for table `page_configs`
--

CREATE TABLE `page_configs` (
  `page_name` varchar(50) NOT NULL,
  `main_bg` varchar(255) DEFAULT NULL,
  `header_bg` varchar(255) NOT NULL,
  `header_title` varchar(255) NOT NULL,
  `header_overlay` varchar(50) NOT NULL,
  `left_badge` varchar(255) NOT NULL,
  `right_badge` varchar(255) NOT NULL,
  `coming_soon` varchar(255) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `page_configs`
--

INSERT INTO `page_configs` (`page_name`, `main_bg`, `header_bg`, `header_title`, `header_overlay`, `left_badge`, `right_badge`, `coming_soon`, `created_at`, `updated_at`) VALUES
('careers', 'uploads/page_configs/68511da826118.png', '', 'CAREERS', 'rgba(37,80,200,0.38)', 'images/sustainability/beslogo.png', 'images/sustainability/beslogo.png', 'images/sustainability/comingsoon.jfif', '2025-06-17 06:47:52', '2025-06-18 07:02:43'),
('faq', 'uploads/page_configs/68511f8dc99a3.png', 'uploads/page_configs/6851147659dbd.png', 'FAQ', 'rgba(37,80,200,0.38)', 'images/sustainability/beslogo.png', 'images/sustainability/beslogo.png', 'images/sustainability/comingsoon.jfif', '2025-06-17 06:47:52', '2025-06-17 07:55:57'),
('manufacturingprocess', 'uploads/page_configs/68511d72cb55e.png', 'images/sustainability/header.png', 'MANUFACTURING PROCESS', 'rgba(37,80,200,0.38)', 'images/sustainability/beslogo.png', 'images/sustainability/beslogo.png', 'images/sustainability/comingsoon.jfif', '2025-06-17 06:47:52', '2025-06-17 07:46:58'),
('news_events', 'uploads/page_configs/68511d9da6223.png', 'images/sustainability/header.png', 'NEWS & EVENTS', 'rgba(37,80,200,0.38)', 'images/sustainability/beslogo.png', 'images/sustainability/beslogo.png', 'images/sustainability/comingsoon.jfif', '2025-06-17 06:47:52', '2025-06-17 07:47:41'),
('overviewprocess', 'uploads/page_configs/68511d85b56b9.png', 'images/sustainability/header.png', 'OVERVIEW PROCESS', 'rgba(37,80,200,0.38)', 'images/sustainability/beslogo.png', 'images/sustainability/beslogo.png', 'images/sustainability/comingsoon.jfif', '2025-06-17 06:47:52', '2025-06-17 07:47:17'),
('plant_visit', 'uploads/page_configs/68511db34f5a3.png', 'uploads/page_configs/6865ec2b3c57a.png', 'PLANT VISIT', 'rgba(37,80,200,0.38)', 'images/sustainability/beslogo.png', 'images/sustainability/beslogo.png', 'images/sustainability/comingsoon.jfif', '2025-06-17 06:47:52', '2025-07-03 02:34:19'),
('shop', 'uploads/page_configs/68511ba048847.png', 'images/sustainability/header.png', 'SHOP', 'rgba(37,80,200,0.38)', 'images/sustainability/beslogo.png', 'images/sustainability/beslogo.png', 'images/sustainability/comingsoon.jfif', '2025-06-17 06:47:52', '2025-06-17 07:39:12'),
('sustainability', '', '', 'SUSTAINABILITY', 'rgba(37,80,200,0.38)', 'images/sustainability/beslogo.png', 'images/sustainability/beslogo.png', 'images/sustainability/comingsoon.jfif', '2025-06-17 06:47:52', '2025-06-18 07:03:46'),
('videos_promotion', '', 'uploads/page_configs/686494b305d66.png', 'VIDEOS & PROMOTION', 'rgba(37,80,200,0.38)', 'images/sustainability/beslogo.png', 'images/sustainability/beslogo.png', 'images/sustainability/comingsoon.jfif', '2025-06-17 06:47:52', '2025-07-02 02:08:50');

-- --------------------------------------------------------

--
-- Table structure for table `page_content`
--

CREATE TABLE `page_content` (
  `id` int(11) NOT NULL,
  `page_name` varchar(50) NOT NULL,
  `section_name` varchar(100) NOT NULL,
  `content_key` varchar(100) NOT NULL,
  `content_value` text DEFAULT NULL,
  `content_type` enum('text','html','image','video') DEFAULT 'text',
  `last_updated` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `page_content`
--

INSERT INTO `page_content` (`id`, `page_name`, `section_name`, `content_key`, `content_value`, `content_type`, `last_updated`) VALUES
(2, 'index', 'hero_section', 'heading', 'James Poylmers Manufacturing Corporation', 'text', '2025-05-26 03:04:41'),
(5, 'index', 'hero_section', 'subheading', 'Delivering high-performance polymer compounds tailored to your specific requirements with over 15 years of expertise', 'text', '2025-05-26 03:21:57');

-- --------------------------------------------------------

--
-- Table structure for table `plant_visits`
--

CREATE TABLE `plant_visits` (
  `id` int(11) NOT NULL,
  `title` varchar(255) NOT NULL,
  `description` text NOT NULL,
  `image` varchar(255) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `plant_visits`
--

INSERT INTO `plant_visits` (`id`, `title`, `description`, `image`, `created_at`, `updated_at`) VALUES
(28, 'German Client Visit and Plant Tour', 'We were honored to welcome our esteemed client from Germany for an official visit to James Polymers Manufacturing Corporation. \r\n\r\nThe day began with a guided plant tour, where we showcased our advanced production facilities, including key stages of our plastic injection molding and rubber compression molding operations. \r\n\r\nOur team provided in-depth insights into our manufacturing processes, quality control systems, and safety protocols, highlighting our commitment to excellence and innovation.\r\n\r\nFollowing the tour, a business meeting was held to discuss our current product lines, customized solutions, and shared market opportunities. \r\n\r\nThe exchange was highly productive, with both parties expressing interest in expanding cooperation and exploring future projects. \r\n\r\nThis visit not only reinforced our mutual goals but also deepened the foundations of a strong and lasting international partnership.\r\n\r\n', '1751510661_318453134_923905485650724_7649793498539377790_n.jpg', '2025-07-03 02:44:21', '2025-08-20 02:37:11'),
(37, 'Business Meeting and Product Discussion with U.S. Client at James Polymers', 'James Polymers Manufacturing Corporation was honored to welcome a valued client from the United States for a focused business meeting centered around our product offerings and future partnership opportunities. \r\n\r\nThe visit began with a brief introduction to our company\'s capabilities, followed by an in-depth discussion covering our range of plastic injection and rubber molding products.\r\n\r\nOur team presented current product specifications, customization options, and ongoing innovations aimed at addressing specific industry needs. \r\n\r\nThe dialogue also explored new development possibilities, market demands, and tailored solutions to meet the client’s requirements. \r\n\r\nBoth sides engaged in a productive exchange of insights, strengthening mutual understanding and paving the way for continued collaboration.\r\n\r\nThis meeting marks a significant step toward deepening our international relationships and aligning our goals for long-term growth and innovation.', '1751535232_307207695_786716779250354_7075200255413149727_n.jpg', '2025-07-03 09:33:52', '2025-08-20 02:39:19');

-- --------------------------------------------------------

--
-- Table structure for table `plant_visit_images`
--

CREATE TABLE `plant_visit_images` (
  `id` int(11) NOT NULL,
  `plant_visit_id` int(11) NOT NULL,
  `image` varchar(255) DEFAULT NULL,
  `media_type` enum('image','video') DEFAULT 'image',
  `video_url` varchar(500) DEFAULT NULL,
  `video_type` enum('youtube','vimeo','uploaded') DEFAULT 'youtube',
  `video_title` varchar(255) DEFAULT NULL,
  `video_description` text DEFAULT NULL,
  `display_order` int(11) NOT NULL DEFAULT 0,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `plant_visit_images`
--

INSERT INTO `plant_visit_images` (`id`, `plant_visit_id`, `image`, `media_type`, `video_url`, `video_type`, `video_title`, `video_description`, `display_order`, `created_at`) VALUES
(103, 28, '1751510661_318453134_923905485650724_7649793498539377790_n.jpg', 'image', NULL, 'youtube', NULL, NULL, 2, '2025-07-03 02:44:21'),
(104, 28, '1751510661_318474800_550348816962619_566497971398423965_n.jpg', 'image', NULL, 'youtube', NULL, NULL, 3, '2025-07-03 02:44:21'),
(105, 28, '1751510661_319061774_3381790375477110_5020188251602975917_n.jpg', 'image', NULL, 'youtube', NULL, NULL, 4, '2025-07-03 02:44:21'),
(106, 28, '1751510661_319066065_8728956580477669_2190448563411619994_n.jpg', 'image', NULL, 'youtube', NULL, NULL, 5, '2025-07-03 02:44:21'),
(107, 28, '1751510661_319543888_1378979172876212_4511187673268110170_n.jpg', 'image', NULL, 'youtube', NULL, NULL, 6, '2025-07-03 02:44:21'),
(108, 28, '1751510661_319577142_1314308556035270_2640281160630802399_n.jpg', 'image', NULL, 'youtube', NULL, NULL, 7, '2025-07-03 02:44:21'),
(109, 28, '1751510661_319610801_502543361942520_7293230460981889500_n.jpg', 'image', NULL, 'youtube', NULL, NULL, 8, '2025-07-03 02:44:21'),
(110, 28, '1751510661_319659149_1114498412561989_8830339438357153047_n.jpg', 'image', NULL, 'youtube', NULL, NULL, 9, '2025-07-03 02:44:21'),
(111, 28, '1751510661_319745471_428455976034880_6060257457454827510_n.jpg', 'image', NULL, 'youtube', NULL, NULL, 10, '2025-07-03 02:44:21'),
(112, 28, '1751510661_320011056_864225341530118_5053693961114342215_n.jpg', 'image', NULL, 'youtube', NULL, NULL, 11, '2025-07-03 02:44:21'),
(113, 28, '1751510661_323530101_504780565128541_5144794131607219007_n.jpg', 'image', NULL, 'youtube', NULL, NULL, 12, '2025-07-03 02:44:21'),
(114, 28, '1751510661_324912522_951388219351318_8446549719719541913_n.jpg', 'image', NULL, 'youtube', NULL, NULL, 13, '2025-07-03 02:44:21'),
(177, 37, '1751535232_307207695_786716779250354_7075200255413149727_n.jpg', 'image', NULL, 'youtube', NULL, NULL, 2, '2025-07-03 09:33:52'),
(178, 37, '1751535232_307220487_649727413133022_5054127165078689404_n.jpg', 'image', NULL, 'youtube', NULL, NULL, 3, '2025-07-03 09:33:52'),
(179, 37, '1751535232_307337376_780430026403688_1623520764983245519_n.jpg', 'image', NULL, 'youtube', NULL, NULL, 4, '2025-07-03 09:33:52'),
(180, 37, '1751535232_307393154_785071922703396_5175915107176253618_n.jpg', 'image', NULL, 'youtube', NULL, NULL, 5, '2025-07-03 09:33:52'),
(181, 37, '1751535232_307420306_617080290075093_8061339269510968459_n.jpg', 'image', NULL, 'youtube', NULL, NULL, 6, '2025-07-03 09:33:52'),
(182, 37, '1751535232_307485236_391689599836270_2437934935393315490_n.jpg', 'image', NULL, 'youtube', NULL, NULL, 7, '2025-07-03 09:33:52'),
(183, 37, '1751535232_307497126_2379925728851607_2019299277415683448_n.jpg', 'image', NULL, 'youtube', NULL, NULL, 8, '2025-07-03 09:33:52'),
(184, 37, '1751535232_307504732_483095037160605_1023824563521245795_n.jpg', 'image', NULL, 'youtube', NULL, NULL, 9, '2025-07-03 09:33:52'),
(185, 37, '1751614695_307529264_417457730534038_4526339298621975602_n.jpg', 'image', NULL, 'youtube', NULL, NULL, 10, '2025-07-04 07:38:15'),
(186, 37, '1751614695_307579003_674247080299118_4823453108376254498_n.jpg', 'image', NULL, 'youtube', NULL, NULL, 11, '2025-07-04 07:38:15'),
(187, 37, '1751614695_307581453_1216033825906358_3585341333558631190_n.jpg', 'image', NULL, 'youtube', NULL, NULL, 12, '2025-07-04 07:38:15'),
(188, 37, '1751614695_307583083_763805458244240_3908835162126253751_n.jpg', 'image', NULL, 'youtube', NULL, NULL, 13, '2025-07-04 07:38:15'),
(189, 37, '1751614695_307633499_3256099844629327_2382671906341889345_n.jpg', 'image', NULL, 'youtube', NULL, NULL, 14, '2025-07-04 07:38:15'),
(190, 37, '1751614695_307692789_816275346178157_3937413913079896021_n.jpg', 'image', NULL, 'youtube', NULL, NULL, 15, '2025-07-04 07:38:15'),
(191, 37, '1751614695_307695164_498257825454184_7693038328538268161_n.jpg', 'image', NULL, 'youtube', NULL, NULL, 16, '2025-07-04 07:38:15'),
(192, 37, '1751614695_307723726_666391298156905_2524328780406445289_n.jpg', 'image', NULL, 'youtube', NULL, NULL, 17, '2025-07-04 07:38:15'),
(195, 37, '1751741920_307773027_1291687764978995_7568607588911163468_n.jpg', 'image', NULL, 'youtube', NULL, NULL, 18, '2025-07-05 18:58:40'),
(196, 37, '1751741920_307820982_652099146332380_4301339619343977215_n.jpg', 'image', NULL, 'youtube', NULL, NULL, 19, '2025-07-05 18:58:40'),
(197, 37, '1751741920_307845212_644870963940034_7840244708674426334_n.jpg', 'image', NULL, 'youtube', NULL, NULL, 20, '2025-07-05 18:58:40'),
(198, 37, '1751741920_307895664_1827060224304264_9188306689747145472_n.jpg', 'image', NULL, 'youtube', NULL, NULL, 21, '2025-07-05 18:58:40'),
(199, 37, '1751741920_308023594_1157374941514301_2014907923379317973_n.jpg', 'image', NULL, 'youtube', NULL, NULL, 22, '2025-07-05 18:58:40'),
(200, 37, '1751741920_308078420_636806171207402_3651963600285095085_n.jpg', 'image', NULL, 'youtube', NULL, NULL, 23, '2025-07-05 18:58:40'),
(201, 37, '1751741920_308096636_1471325936716280_77416032563553573_n.jpg', 'image', NULL, 'youtube', NULL, NULL, 24, '2025-07-05 18:58:40'),
(202, 37, '1751741920_308203626_761302328293820_1812136791364908441_n.jpg', 'image', NULL, 'youtube', NULL, NULL, 25, '2025-07-05 18:58:40'),
(203, 37, '', 'video', 'https://vimeo.com/1099037939', 'vimeo', '', '', 26, '2025-07-05 19:31:33'),
(204, 37, '', 'video', 'https://vimeo.com/1099039582', 'vimeo', '', '', 27, '2025-07-05 19:40:37'),
(205, 37, '', 'video', 'https://vimeo.com/1099039656', 'vimeo', '', '', 28, '2025-07-05 19:40:37'),
(206, 37, '', 'video', 'https://vimeo.com/1099039712', 'vimeo', '', '', 29, '2025-07-05 19:40:37'),
(207, 37, '', 'video', 'https://vimeo.com/1099039743', 'vimeo', '', '', 30, '2025-07-05 19:40:37'),
(208, 37, '', 'video', 'https://vimeo.com/1099039821', 'vimeo', '', '', 31, '2025-07-05 19:40:37'),
(209, 28, '', 'video', 'https://vimeo.com/1099040125', 'vimeo', '', '', 17, '2025-07-05 19:45:46'),
(210, 28, '', 'video', 'https://vimeo.com/1099040154', 'vimeo', '', '', 18, '2025-07-05 19:45:46'),
(211, 28, '', 'video', 'https://vimeo.com/1099040209', 'vimeo', '', '', 19, '2025-07-05 19:45:46'),
(212, 28, '', 'video', 'https://vimeo.com/1099040173', 'vimeo', '', '', 20, '2025-07-05 19:45:46'),
(213, 28, '', 'video', 'https://vimeo.com/1099040245', 'vimeo', '', '', 21, '2025-07-05 19:45:46'),
(214, 28, '', 'video', 'https://vimeo.com/1099040284', 'vimeo', '', '', 22, '2025-07-05 19:45:46'),
(215, 28, '', 'video', 'https://vimeo.com/1099040319', 'vimeo', '', '', 23, '2025-07-05 19:45:46'),
(216, 28, '', 'video', 'https://vimeo.com/1099040334', 'vimeo', '', '', 24, '2025-07-05 19:45:46');

-- --------------------------------------------------------

--
-- Table structure for table `privacy_policy`
--

CREATE TABLE `privacy_policy` (
  `id` int(11) NOT NULL,
  `section_title` varchar(255) DEFAULT NULL,
  `section_content` text DEFAULT NULL,
  `display_order` int(11) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `privacy_policy`
--

INSERT INTO `privacy_policy` (`id`, `section_title`, `section_content`, `display_order`) VALUES
(1, 'Introduction', 'We value your privacy and are committed to protecting your personal information. Our data handling practices fully comply with the Data Privacy Act of 2012 (Republic Act No. 10173), ensuring that your data is collected, processed, and stored securely and responsibly. We also recognize and comply with the Cybercrime Prevention Act of 2012 (Republic Act No. 10175), safeguarding your data against unauthorized access, cyber threats, and malicious activities.', 1),
(2, 'Data Collection', 'We collect personal information when you use our website, including but not limited to your name, email address, and usage behavior. This information may be collected through forms, cookies, or analytics tools, in accordance with lawful and fair methods.', 2),
(3, 'Use of Data', 'The data we collect is used solely to provide, improve, and personalize our services. We do not sell or share your personal data with third parties without your consent, unless required by law.', 3),
(4, 'Your Rights', 'Under the Data Privacy Act of 2012, you have the right to:\r\n\r\n- Access your personal information\r\n- Correct inaccurate or outdated data\r\n- Request deletion or suspension of processing\r\n- Be informed about how your data is used\r\n- Lodge complaints with the National Privacy Commission (NPC) if your rights are violated\r\n\r\nWe also take measures in line with the Cybercrime Prevention Act of 2012 to ensure the protection of your data from online threats, such as hacking, identity theft, and other forms of cybercrime.', 4);

-- --------------------------------------------------------

--
-- Table structure for table `products`
--

CREATE TABLE `products` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `description` text DEFAULT NULL,
  `category` enum('appliance','automotive','industrial') NOT NULL,
  `image_url` varchar(255) DEFAULT NULL,
  `features` text DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `Cat` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `products`
--

INSERT INTO `products` (`id`, `name`, `description`, `category`, `image_url`, `features`, `created_at`, `Cat`) VALUES
(1, 'Aircon Parts - Supply Grille', 'Durable polymer grilles designed for optimal airflow in air-conditioning systems.', 'appliance', 'assets/products/AirconParts.jpg', NULL, '0000-00-00 00:00:00', ''),
(2, 'Electric Fan Parts Series', 'High-performance polymer components for electric fan assemblies.', 'appliance', 'assets/products/ElectricFanParts.jpg', NULL, '2025-05-14 04:35:36', ''),
(3, '3M - Plastic Core (12MM and 18MM)', 'Precision plastic cores for industrial applications.', 'industrial', 'assets/products/PlasticCore.jpg', NULL, '2025-05-14 04:35:36', ''),
(4, 'Motorcycle Wire Insulator - Grommet', 'Protective grommets for motorcycle wiring systems.', 'automotive', 'assets/products/Grommet.jpg', NULL, '2025-05-14 04:35:36', ''),
(5, 'Footing Stove', 'Portable heater used on construction sites to provide warmth or aid in concrete curing.', 'appliance', 'assets/products/FootingStove.jpg', NULL, '2025-05-19 04:10:31', ''),
(6, 'Car Part Accessory - Front Rubber Base', 'Car accessory that provides cushioning and protection for the vehicle\'s front underbody.', 'automotive', 'assets/products/FrontRubberBase.jpg', NULL, '2025-05-19 04:12:30', ''),
(7, 'Gas Stove Part - Knob', 'Control accessory used to adjust the flame intensity on a gas burner.', 'appliance', 'assets/products/GasStovePart.jpg', NULL, '2025-05-19 04:13:15', ''),
(8, 'Car Part Accessory - Rear Rubber Base', 'Car accessory that cushions and protects the vehicle’s rear underbody from impact and wear.', 'automotive', 'assets/products/RearRubberBase.jpg', NULL, '2025-05-19 04:14:59', ''),
(9, 'Refrigerator Part - Freezer Door', 'Refrigerator part that seals the freezer compartment to maintain low temperatures and preserve frozen items.', 'appliance', 'assets/products/FreezerDoor.jpg', NULL, '2025-05-19 04:15:33', ''),
(10, 'Paint Packaging Set - 1 Gallon (4L)', 'Durable and secure container set for storing and transporting up to 4 liters (1 gallon) of paint.', 'industrial', 'assets/products/PaintPackaging.jpg', NULL, '2025-05-19 04:04:42', ''),
(11, 'Battery Accessory - Battery Dispenser Assembly', 'Compact and organized assembly for dispensing and storing batteries efficiently.', 'industrial', 'assets/products/BatteryDispenser.jpg', NULL, '2025-05-19 04:05:07', '');

-- --------------------------------------------------------

--
-- Table structure for table `product_features`
--

CREATE TABLE `product_features` (
  `product_id` int(11) DEFAULT NULL,
  `feature` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `product_features`
--

INSERT INTO `product_features` (`product_id`, `feature`) VALUES
(1, 'Optimized for maximum airflow'),
(1, 'UV and temperature resistant'),
(1, 'Available in multiple colors'),
(2, 'Precision balanced components'),
(2, 'Lightweight yet durable'),
(2, 'Reduced vibration and noise'),
(3, 'Available in 12mm and 18mm sizes'),
(3, 'High dimensional accuracy'),
(3, 'Chemical and wear resistant'),
(4, 'Excellent electrical insulation'),
(4, 'UV and weather resistant'),
(4, 'Withstands extreme temperatures'),
(5, 'Durable rubber base for stable support'),
(5, 'Heat-resistant material for safety'),
(5, 'Prevents slipping and surface scratches'),
(6, 'Provides stable front-end support'),
(6, 'Reduces vibration and road noise'),
(6, 'Made from durable, weather-resistant rubber'),
(7, 'Easy-grip design for smooth control'),
(7, 'Heat-resistant and durable material'),
(7, 'Universal fit for most gas stoves'),
(8, 'Supports rear chassis stability'),
(8, 'Minimizes road impact and noise'),
(8, 'Durable rubber construction for long-term use'),
(9, 'Provides secure sealing to lock in cold air'),
(9, 'Durable and insulated for energy efficiency'),
(9, 'Designed for easy opening and closing'),
(10, 'Leak-proof container ideal for paint storage'),
(10, 'Sturdy handle for easy carrying'),
(10, 'Tight-seal lid to prevent spills and drying'),
(11, 'Organizes and dispenses batteries efficiently'),
(11, 'Compact design for easy storage and access'),
(11, 'Protects batteries from dust and damage');

-- --------------------------------------------------------

--
-- Table structure for table `services`
--

CREATE TABLE `services` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `description` text DEFAULT NULL,
  `image_url` varchar(255) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `youtube_url` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `services`
--

INSERT INTO `services` (`id`, `name`, `description`, `image_url`, `created_at`, `youtube_url`) VALUES
(1, 'Ultrasonic Welding Services', 'High-powered ultrasonic welding for sealing plastic parts with precision and consistency.', 'assets/img/services/Ultrasonic.webp', '2025-05-14 04:35:36', 'https://youtu.be/2mDk5121I8E'),
(2, 'Sub-Assembly Services', 'Complete assembly of plastic-to-plastic, plastic-to-rubber, and plastic-to-metal components.', 'assets/img/services/Assembly.webp', '2025-05-14 04:35:36', 'https://youtu.be/cXbxFFckDTg'),
(6, 'Precision CNC & Mold Solutions', 'Vertical milling machining center (VMC) / CNC machining, mold design & mold fabrication using latest technology & conventional machines', 'assets/img/services/Precision.jpg', '2025-07-16 07:40:48', 'https://youtu.be/alYxZuHd7M4'),
(9, 'Rubber Compression Molding', 'A heat-and-pressure-based process ensuring durability and structural integrity of molded rubber parts.', 'assets/img/services/Compression.jpg', '2025-07-16 08:08:20', 'https://youtu.be/WcLgX740a8U'),
(10, 'Silkscreen Printing', 'Manual and automatic silkscreen printing solutions for plastic-injected parts and bottles with vibrant, lasting finishes.', 'assets/img/services/Silkscreen.jpg', '2025-07-16 08:41:03', ''),
(11, '3D Rapid Prototyping', 'Fast and accurate 3D printed prototypes for validating plastic injection and rubber compression designs before full-scale production.', 'assets/img/services/3D.jpg', '2025-07-17 01:16:05', 'https://youtu.be/R4bsubxG4UY');

-- --------------------------------------------------------

--
-- Table structure for table `videos_promotions`
--

CREATE TABLE `videos_promotions` (
  `id` int(11) NOT NULL,
  `title` varchar(255) NOT NULL,
  `description` text NOT NULL,
  `type` enum('video','promotion') NOT NULL,
  `url` varchar(255) NOT NULL,
  `multiple_images` text DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `videos_promotion_images`
--

CREATE TABLE `videos_promotion_images` (
  `id` int(11) NOT NULL,
  `videos_promotion_id` int(11) NOT NULL,
  `image_url` varchar(255) NOT NULL,
  `image_title` varchar(255) DEFAULT NULL,
  `image_description` text DEFAULT NULL,
  `display_order` int(11) NOT NULL DEFAULT 0,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `about_certifications`
--
ALTER TABLE `about_certifications`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `about_csr`
--
ALTER TABLE `about_csr`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `about_sections`
--
ALTER TABLE `about_sections`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `about_timeline`
--
ALTER TABLE `about_timeline`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `admin_otp`
--
ALTER TABLE `admin_otp`
  ADD PRIMARY KEY (`id`),
  ADD KEY `admin_id` (`admin_id`),
  ADD KEY `email` (`email`),
  ADD KEY `expires_at` (`expires_at`);

--
-- Indexes for table `admin_users`
--
ALTER TABLE `admin_users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `email` (`email`);

--
-- Indexes for table `awards`
--
ALTER TABLE `awards`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `award_timeline`
--
ALTER TABLE `award_timeline`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `careers_applications`
--
ALTER TABLE `careers_applications`
  ADD PRIMARY KEY (`id`),
  ADD KEY `position_id` (`position_id`);

--
-- Indexes for table `careers_benefits`
--
ALTER TABLE `careers_benefits`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `careers_positions`
--
ALTER TABLE `careers_positions`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `careers_qualifications`
--
ALTER TABLE `careers_qualifications`
  ADD PRIMARY KEY (`id`),
  ADD KEY `position_id` (`position_id`);

--
-- Indexes for table `careers_testimonials`
--
ALTER TABLE `careers_testimonials`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `content_section_images`
--
ALTER TABLE `content_section_images`
  ADD PRIMARY KEY (`id`),
  ADD KEY `section_id` (`section_id`),
  ADD KEY `idx_content_section_images_order` (`display_order`);

--
-- Indexes for table `content_section_videos`
--
ALTER TABLE `content_section_videos`
  ADD PRIMARY KEY (`id`),
  ADD KEY `section_id` (`section_id`),
  ADD KEY `idx_content_section_videos_order` (`display_order`);

--
-- Indexes for table `faqs`
--
ALTER TABLE `faqs`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `headline_articles`
--
ALTER TABLE `headline_articles`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `home_sections`
--
ALTER TABLE `home_sections`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `section_field_unique` (`section_name`,`field_name`);

--
-- Indexes for table `industries`
--
ALTER TABLE `industries`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `industry_solutions`
--
ALTER TABLE `industry_solutions`
  ADD PRIMARY KEY (`id`),
  ADD KEY `industry_id` (`industry_id`);

--
-- Indexes for table `inquiries`
--
ALTER TABLE `inquiries`
  ADD PRIMARY KEY (`id`),
  ADD KEY `idx_inquiry_status` (`status`),
  ADD KEY `idx_inquiry_date` (`date_submitted`),
  ADD KEY `idx_inquiry_email` (`email`);

--
-- Indexes for table `news_events`
--
ALTER TABLE `news_events`
  ADD PRIMARY KEY (`id`),
  ADD KEY `idx_news_events_type_date` (`type`,`date`),
  ADD KEY `idx_news_events_featured` (`featured`),
  ADD KEY `idx_news_events_show_in_banner` (`show_in_banner`);

--
-- Indexes for table `news_events_content_sections`
--
ALTER TABLE `news_events_content_sections`
  ADD PRIMARY KEY (`id`),
  ADD KEY `news_event_id` (`news_event_id`),
  ADD KEY `idx_content_sections_order` (`display_order`);

--
-- Indexes for table `news_events_images`
--
ALTER TABLE `news_events_images`
  ADD PRIMARY KEY (`id`),
  ADD KEY `news_event_id` (`news_event_id`),
  ADD KEY `idx_news_events_images_order` (`display_order`);

--
-- Indexes for table `news_events_videos`
--
ALTER TABLE `news_events_videos`
  ADD PRIMARY KEY (`id`),
  ADD KEY `news_event_id` (`news_event_id`),
  ADD KEY `idx_news_events_videos_order` (`display_order`);

--
-- Indexes for table `ojt_media_gallery`
--
ALTER TABLE `ojt_media_gallery`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `overview_processes`
--
ALTER TABLE `overview_processes`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `overview_process_info`
--
ALTER TABLE `overview_process_info`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `page_configs`
--
ALTER TABLE `page_configs`
  ADD PRIMARY KEY (`page_name`);

--
-- Indexes for table `page_content`
--
ALTER TABLE `page_content`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `unique_content` (`page_name`,`section_name`,`content_key`);

--
-- Indexes for table `plant_visits`
--
ALTER TABLE `plant_visits`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `plant_visit_images`
--
ALTER TABLE `plant_visit_images`
  ADD PRIMARY KEY (`id`),
  ADD KEY `plant_visit_id` (`plant_visit_id`);

--
-- Indexes for table `privacy_policy`
--
ALTER TABLE `privacy_policy`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `products`
--
ALTER TABLE `products`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `product_features`
--
ALTER TABLE `product_features`
  ADD KEY `product_id` (`product_id`);

--
-- Indexes for table `services`
--
ALTER TABLE `services`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `videos_promotions`
--
ALTER TABLE `videos_promotions`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `videos_promotion_images`
--
ALTER TABLE `videos_promotion_images`
  ADD PRIMARY KEY (`id`),
  ADD KEY `videos_promotion_id` (`videos_promotion_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `about_certifications`
--
ALTER TABLE `about_certifications`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `about_csr`
--
ALTER TABLE `about_csr`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `about_sections`
--
ALTER TABLE `about_sections`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `about_timeline`
--
ALTER TABLE `about_timeline`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `admin_otp`
--
ALTER TABLE `admin_otp`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=42;

--
-- AUTO_INCREMENT for table `admin_users`
--
ALTER TABLE `admin_users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT for table `awards`
--
ALTER TABLE `awards`
  MODIFY `id` int(255) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=20;

--
-- AUTO_INCREMENT for table `award_timeline`
--
ALTER TABLE `award_timeline`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `careers_applications`
--
ALTER TABLE `careers_applications`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- AUTO_INCREMENT for table `careers_benefits`
--
ALTER TABLE `careers_benefits`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `careers_positions`
--
ALTER TABLE `careers_positions`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT for table `careers_qualifications`
--
ALTER TABLE `careers_qualifications`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=49;

--
-- AUTO_INCREMENT for table `careers_testimonials`
--
ALTER TABLE `careers_testimonials`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `content_section_images`
--
ALTER TABLE `content_section_images`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=71;

--
-- AUTO_INCREMENT for table `content_section_videos`
--
ALTER TABLE `content_section_videos`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=76;

--
-- AUTO_INCREMENT for table `faqs`
--
ALTER TABLE `faqs`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=21;

--
-- AUTO_INCREMENT for table `headline_articles`
--
ALTER TABLE `headline_articles`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `home_sections`
--
ALTER TABLE `home_sections`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=69;

--
-- AUTO_INCREMENT for table `industries`
--
ALTER TABLE `industries`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=32;

--
-- AUTO_INCREMENT for table `industry_solutions`
--
ALTER TABLE `industry_solutions`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=372;

--
-- AUTO_INCREMENT for table `inquiries`
--
ALTER TABLE `inquiries`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=52;

--
-- AUTO_INCREMENT for table `news_events`
--
ALTER TABLE `news_events`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=107;

--
-- AUTO_INCREMENT for table `news_events_content_sections`
--
ALTER TABLE `news_events_content_sections`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=93;

--
-- AUTO_INCREMENT for table `news_events_images`
--
ALTER TABLE `news_events_images`
  MODIFY `id` int(100) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=121;

--
-- AUTO_INCREMENT for table `news_events_videos`
--
ALTER TABLE `news_events_videos`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `ojt_media_gallery`
--
ALTER TABLE `ojt_media_gallery`
  MODIFY `id` int(255) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=57;

--
-- AUTO_INCREMENT for table `overview_processes`
--
ALTER TABLE `overview_processes`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `overview_process_info`
--
ALTER TABLE `overview_process_info`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `page_content`
--
ALTER TABLE `page_content`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `plant_visits`
--
ALTER TABLE `plant_visits`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=38;

--
-- AUTO_INCREMENT for table `plant_visit_images`
--
ALTER TABLE `plant_visit_images`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=217;

--
-- AUTO_INCREMENT for table `privacy_policy`
--
ALTER TABLE `privacy_policy`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `products`
--
ALTER TABLE `products`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- AUTO_INCREMENT for table `services`
--
ALTER TABLE `services`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT for table `videos_promotions`
--
ALTER TABLE `videos_promotions`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=29;

--
-- AUTO_INCREMENT for table `videos_promotion_images`
--
ALTER TABLE `videos_promotion_images`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=96;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `admin_otp`
--
ALTER TABLE `admin_otp`
  ADD CONSTRAINT `admin_otp_ibfk_1` FOREIGN KEY (`admin_id`) REFERENCES `admin_users` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `careers_applications`
--
ALTER TABLE `careers_applications`
  ADD CONSTRAINT `fk_applications_position` FOREIGN KEY (`position_id`) REFERENCES `careers_positions` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `careers_qualifications`
--
ALTER TABLE `careers_qualifications`
  ADD CONSTRAINT `fk_qualifications_position` FOREIGN KEY (`position_id`) REFERENCES `careers_positions` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `content_section_images`
--
ALTER TABLE `content_section_images`
  ADD CONSTRAINT `content_section_images_ibfk_1` FOREIGN KEY (`section_id`) REFERENCES `news_events_content_sections` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `content_section_videos`
--
ALTER TABLE `content_section_videos`
  ADD CONSTRAINT `content_section_videos_ibfk_1` FOREIGN KEY (`section_id`) REFERENCES `news_events_content_sections` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `industry_solutions`
--
ALTER TABLE `industry_solutions`
  ADD CONSTRAINT `industry_solutions_ibfk_1` FOREIGN KEY (`industry_id`) REFERENCES `industries` (`id`);

--
-- Constraints for table `news_events_content_sections`
--
ALTER TABLE `news_events_content_sections`
  ADD CONSTRAINT `news_events_content_sections_ibfk_1` FOREIGN KEY (`news_event_id`) REFERENCES `news_events` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `news_events_images`
--
ALTER TABLE `news_events_images`
  ADD CONSTRAINT `news_events_images_ibfk_1` FOREIGN KEY (`news_event_id`) REFERENCES `news_events` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `news_events_videos`
--
ALTER TABLE `news_events_videos`
  ADD CONSTRAINT `news_events_videos_ibfk_1` FOREIGN KEY (`news_event_id`) REFERENCES `news_events` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `plant_visit_images`
--
ALTER TABLE `plant_visit_images`
  ADD CONSTRAINT `plant_visit_images_ibfk_1` FOREIGN KEY (`plant_visit_id`) REFERENCES `plant_visits` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `product_features`
--
ALTER TABLE `product_features`
  ADD CONSTRAINT `product_features_ibfk_1` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `videos_promotion_images`
--
ALTER TABLE `videos_promotion_images`
  ADD CONSTRAINT `videos_promotion_images_ibfk_1` FOREIGN KEY (`videos_promotion_id`) REFERENCES `videos_promotions` (`id`) ON DELETE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
