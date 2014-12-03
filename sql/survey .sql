-- phpMyAdmin SQL Dump
-- version 4.1.6
-- http://www.phpmyadmin.net
--
-- Host: 127.0.0.1
-- Generation Time: Dec 03, 2014 at 05:58 PM
-- Server version: 5.6.16
-- PHP Version: 5.5.9

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Database: `survey`
--

-- --------------------------------------------------------

--
-- Table structure for table `pages`
--

CREATE TABLE IF NOT EXISTS `pages` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `subject_id` int(11) NOT NULL,
  `survey_menu_name` varchar(30) NOT NULL,
  `position` int(3) NOT NULL,
  `visible` tinyint(1) NOT NULL,
  `content` text NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=7 ;

--
-- Dumping data for table `pages`
--

INSERT INTO `pages` (`id`, `subject_id`, `survey_menu_name`, `position`, `visible`, `content`) VALUES
(1, 1, 'survey1', 1, 1, 'This is food habit survey 1 history now'),
(3, 2, 'Cold drinks choice?', 2, 1, 'Our Mission is .....'),
(4, 2, 'Entertainment', 1, 1, 'All entertainment survey in here..'),
(5, 2, 'School life survey', 1, 1, 'You can find how have you been passed in you school life... '),
(6, 5, 'About dresses', 1, 1, 'which dresses do you like?');

-- --------------------------------------------------------

--
-- Table structure for table `survey_answers`
--

CREATE TABLE IF NOT EXISTS `survey_answers` (
  `answers_id` int(11) NOT NULL AUTO_INCREMENT,
  `questions_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `answer_body` text NOT NULL,
  PRIMARY KEY (`answers_id`),
  KEY `questions_id` (`questions_id`,`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `survey_field`
--

CREATE TABLE IF NOT EXISTS `survey_field` (
  `survey_id` int(11) NOT NULL AUTO_INCREMENT,
  `survey_name` varchar(150) NOT NULL,
  PRIMARY KEY (`survey_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=2 ;

--
-- Dumping data for table `survey_field`
--

INSERT INTO `survey_field` (`survey_id`, `survey_name`) VALUES
(1, 'The Digital craft');

-- --------------------------------------------------------

--
-- Table structure for table `survey_question`
--

CREATE TABLE IF NOT EXISTS `survey_question` (
  `question_id` int(11) NOT NULL AUTO_INCREMENT,
  `page_id` int(11) NOT NULL,
  `survey_name` text NOT NULL,
  `type` enum('radio','checkbox') NOT NULL DEFAULT 'checkbox',
  PRIMARY KEY (`question_id`),
  KEY `survey_id` (`page_id`),
  KEY `page_id` (`page_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=67 ;

--
-- Dumping data for table `survey_question`
--

INSERT INTO `survey_question` (`question_id`, `page_id`, `survey_name`, `type`) VALUES
(1, 1, 'Do you like the digital craft inc?', 'radio'),
(2, 1, 'What kind of project do you next?', 'checkbox'),
(4, 4, 'How long have you been here?', 'checkbox'),
(5, 2, 'Do you like coffee? ', 'radio'),
(6, 1, 'Which food do you like?', 'checkbox'),
(7, 1, 'what is your color choice?', 'checkbox'),
(14, 1, 'what is your favorite writer?', ''),
(38, 5, 'Do you like spent gossiping time ?', 'radio'),
(48, 6, 'Do you like pant ?', 'radio'),
(49, 6, 'How many dresses you have?', 'checkbox'),
(50, 4, 'Which movie do you like most?', 'checkbox'),
(51, 4, 'Do you like modern life?', 'checkbox'),
(52, 4, 'What kind of music do you like?', 'checkbox'),
(53, 4, 'Which sports do you like most?', 'checkbox'),
(54, 4, 'Do you like football?', 'radio'),
(56, 5, 'Which friend do you like most?', 'checkbox'),
(57, 5, 'Like book?', 'checkbox'),
(58, 5, 'This life is so boor ?', 'radio'),
(59, 5, 'ssdf', ''),
(60, 5, 'Last shoeb test', 'radio'),
(61, 5, 'again test', ''),
(62, 5, 'sdfsd', ''),
(63, 5, 'sdfsd', ''),
(64, 5, 'sdfsd', ''),
(65, 3, 'Which cold drinks do you like', ''),
(66, 3, 'do you like milk', 'checkbox');

-- --------------------------------------------------------

--
-- Table structure for table `survey_question_answers`
--

CREATE TABLE IF NOT EXISTS `survey_question_answers` (
  `survey_question_ans_id` int(11) NOT NULL AUTO_INCREMENT,
  `question_id` int(11) NOT NULL,
  `answer` text NOT NULL,
  `ans_type` enum('radio','checkbox') NOT NULL DEFAULT 'checkbox',
  PRIMARY KEY (`survey_question_ans_id`),
  KEY `question_id` (`question_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=173 ;

--
-- Dumping data for table `survey_question_answers`
--

INSERT INTO `survey_question_answers` (`survey_question_ans_id`, `question_id`, `answer`, `ans_type`) VALUES
(1, 1, 'yes', 'radio'),
(2, 2, 'PHP', 'checkbox'),
(3, 2, 'JAVA', 'checkbox'),
(8, 5, 'yes', 'radio'),
(9, 6, 'ice cream ', 'checkbox'),
(10, 6, 'wine', 'checkbox'),
(11, 6, 'mutton ', 'checkbox'),
(12, 6, 'burger ', 'checkbox'),
(38, 0, 'traveling ', 'checkbox'),
(51, 1, 'No', 'radio'),
(52, 2, 'CSS', 'checkbox'),
(53, 2, 'HTML', 'checkbox'),
(54, 2, 'other', 'checkbox'),
(55, 3, '1 year', 'checkbox'),
(56, 3, '2 year', 'checkbox'),
(57, 3, '3 year', 'checkbox'),
(58, 3, '4 year', 'checkbox'),
(59, 3, 'other', 'checkbox'),
(61, 5, 'no', 'radio'),
(62, 6, 'other', 'checkbox'),
(63, 7, 'White', 'checkbox'),
(64, 7, 'Black', 'checkbox'),
(65, 6, 'Blue', 'checkbox'),
(66, 7, 'Red', 'checkbox'),
(67, 7, 'other', 'checkbox'),
(68, 14, 'humayun', 'checkbox'),
(69, 14, 'robert', 'checkbox'),
(70, 14, 'khali', 'checkbox'),
(71, 14, 'mamun', 'checkbox'),
(72, 48, 'yes', 'radio'),
(73, 48, 'no', 'radio'),
(74, 49, '10', 'checkbox'),
(75, 49, '20', 'checkbox'),
(76, 49, '25', 'checkbox'),
(77, 49, '30', 'checkbox'),
(78, 49, 'other', 'checkbox'),
(85, 50, 'The Godfather', 'checkbox'),
(86, 50, 'The Shawshank Redemption', 'checkbox'),
(87, 50, 'Titanic ', 'checkbox'),
(89, 50, 'Gladiator', 'checkbox'),
(90, 50, 'other', 'checkbox'),
(91, 51, 'yes', 'radio'),
(92, 51, 'no', 'radio'),
(93, 52, 'folk', 'checkbox'),
(94, 52, 'melody ', 'checkbox'),
(95, 52, 'rock', 'checkbox'),
(96, 52, 'classic ', 'checkbox'),
(97, 52, 'other', 'checkbox'),
(100, 53, 'football', 'checkbox'),
(101, 53, 'cricket ', 'checkbox'),
(102, 53, 'baseball', 'checkbox'),
(103, 53, 'other', 'checkbox'),
(104, 54, 'yes', 'radio'),
(105, 54, 'no', 'radio'),
(110, 49, '10', 'checkbox'),
(111, 49, '20', 'checkbox'),
(112, 49, '25', 'checkbox'),
(113, 49, '50', 'checkbox'),
(114, 49, 'other', 'checkbox'),
(136, 4, 'Answer2', 'checkbox'),
(137, 4, 'Answer2', 'checkbox'),
(138, 4, 'Answer3', 'checkbox'),
(139, 4, 'Other', 'checkbox'),
(142, 61, 'sdfsd', 'radio'),
(143, 61, 'sdsdf', 'radio'),
(144, 62, 'sdfsdf', 'radio'),
(145, 62, 'sdfs', 'radio'),
(146, 63, 'sdfsdf', 'radio'),
(147, 63, 'sdfs', 'radio'),
(148, 64, 'sdfsdf', 'radio'),
(149, 64, 'sdfs', 'radio'),
(150, 65, 'Cocola', 'checkbox'),
(151, 65, 'Marinda', 'checkbox'),
(152, 65, 'Frutika', 'checkbox'),
(153, 65, 'Janina', 'checkbox'),
(154, 65, 'Other', 'checkbox'),
(155, 38, 'yes', 'radio'),
(156, 38, 'no', 'radio'),
(157, 56, 'Helpfully friends ', 'checkbox'),
(158, 56, 'Girls friends ', 'checkbox'),
(159, 56, 'boys friends', 'checkbox'),
(160, 56, 'others', 'checkbox'),
(161, 60, 'Yes', 'radio'),
(162, 60, 'No', 'radio'),
(166, 57, 'Nobel book', 'checkbox'),
(167, 57, 'history type book ', 'checkbox'),
(168, 57, 'addvencer book', 'checkbox'),
(169, 58, 'Yes', 'radio'),
(170, 58, 'No', 'radio'),
(171, 66, 'Yes', 'radio'),
(172, 66, 'No', 'radio');

-- --------------------------------------------------------

--
-- Table structure for table `survey_subject`
--

CREATE TABLE IF NOT EXISTS `survey_subject` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `survey_menu_name` varchar(30) NOT NULL,
  `position` int(3) NOT NULL,
  `visible` tinyint(1) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=9 ;

--
-- Dumping data for table `survey_subject`
--

INSERT INTO `survey_subject` (`id`, `survey_menu_name`, `position`, `visible`) VALUES
(2, 'Survey', 2, 1),
(5, 'Team survey1', 2, 1),
(6, 'learning survey', 3, 1),
(7, 'Test survey', 4, 1),
(8, 'Bangladesh', 5, 1);

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE IF NOT EXISTS `users` (
  `user_id` int(30) NOT NULL AUTO_INCREMENT,
  `username` varchar(50) NOT NULL,
  `hashed_password` varchar(40) NOT NULL,
  `email` varchar(30) NOT NULL,
  `user_type` enum('admin','normal') NOT NULL DEFAULT 'normal',
  PRIMARY KEY (`user_id`),
  UNIQUE KEY `username` (`username`),
  UNIQUE KEY `email` (`email`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=33 ;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`user_id`, `username`, `hashed_password`, `email`, `user_type`) VALUES
(3, 'zakaria1', 'f10e2821bbbea527ea02200352313bc059445190', 'asadf@gmail.com', 'normal'),
(12, 'zakaria112', 'f9a7c6df341325822e3ea264cfe39e5ef8c73aa4', 'zak@gmail.com', 'normal'),
(13, 'zakariar', 'f10e2821bbbea527ea02200352313bc059445190', 'as@fgd.com', 'normal'),
(14, 'newuser', 'f10e2821bbbea527ea02200352313bc059445190', 'ad@gmail.com', 'normal'),
(15, 'admin', '40bd001563085fc35165329ea1ff5c5ecbdbbeef', 'zakaria@gmail.com', 'admin'),
(30, 'admin12', '40bd001563085fc35165329ea1ff5c5ecbdbbeef', 'zakaria1@gmail.com', 'normal'),
(31, 'enam', '40bd001563085fc35165329ea1ff5c5ecbdbbeef', 'e@gmail.com', 'normal');

-- --------------------------------------------------------

--
-- Table structure for table `user_answers`
--

CREATE TABLE IF NOT EXISTS `user_answers` (
  `answer_id` int(11) NOT NULL AUTO_INCREMENT,
  `question_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `answer` varchar(300) NOT NULL,
  `page_id` int(11) NOT NULL,
  PRIMARY KEY (`answer_id`),
  KEY `survey_question_ans_id` (`question_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=27 ;

--
-- Dumping data for table `user_answers`
--

INSERT INTO `user_answers` (`answer_id`, `question_id`, `user_id`, `answer`, `page_id`) VALUES
(1, 38, 15, '156', 5),
(2, 56, 15, '159', 5),
(3, 57, 15, '167', 5),
(4, 61, 20, '143', 5),
(5, 4, 20, '136,138,139,4years', 4),
(6, 50, 20, '87,90,nice test', 4),
(7, 51, 20, '91', 4),
(8, 52, 20, '97,wwwww', 4),
(9, 53, 20, '101,', 4),
(10, 54, 20, '105', 4),
(11, 65, 20, '151,152,153,154,wine', 3),
(12, 66, 20, '172', 3),
(13, 48, 20, '73', 6),
(14, 49, 20, '76,,112,', 6),
(15, 4, 30, '136,137,139,4 years', 4),
(16, 50, 30, '86,90,ek cup chaa', 4),
(17, 51, 30, '92', 4),
(18, 52, 30, '93,94,', 4),
(19, 53, 30, '100,', 4),
(20, 54, 30, '104', 4),
(21, 4, 31, '136,139,5 years', 4),
(22, 50, 31, '85,86,90,ek cup chaa', 4),
(23, 51, 31, '91', 4),
(24, 52, 31, '95,96,', 4),
(25, 53, 31, '100,102,103,socker', 4),
(26, 54, 31, '104', 4);

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
