-- phpMyAdmin SQL Dump
-- version 4.1.6
-- http://www.phpmyadmin.net
--
-- Host: 127.0.0.1
-- Generation Time: Dec 02, 2014 at 07:01 PM
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
(3, 1, 'which cold drinks like?', 2, 1, 'Our Mission is .....'),
(4, 2, 'Survey page 1', 1, 1, 'All survey in here..'),
(5, 6, 'School life survey', 1, 1, 'You can find how have you been passed in you school life... '),
(6, 8, 'About dresses', 1, 1, 'which dresses do you like?');

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
  `type` enum('radio','checkbox','text') NOT NULL DEFAULT 'text',
  PRIMARY KEY (`question_id`),
  KEY `survey_id` (`page_id`),
  KEY `page_id` (`page_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=50 ;

--
-- Dumping data for table `survey_question`
--

INSERT INTO `survey_question` (`question_id`, `page_id`, `survey_name`, `type`) VALUES
(1, 1, 'Do you like the digital craft inc?', 'text'),
(2, 1, 'What kind of project do you next?', 'text'),
(4, 1, 'How long have you been here?', 'text'),
(5, 3, 'Do you like coffee? ', 'text'),
(6, 1, 'Which food do you like?', 'radio'),
(7, 1, 'what is your color choice?', 'checkbox'),
(11, 1, 'what is your favorite color?', 'text'),
(14, 5, 'what is your favorite writer?', 'text'),
(30, 1, 'what is your fathers name?', 'text'),
(35, 1, 'what is your fathers name?', 'text'),
(36, 1, 'what is your fathers name?', 'text'),
(38, 5, 'what is your grand fathers name?', 'text'),
(39, 5, 'what is your fathers name?', 'text'),
(45, 1, 'what is your fathers name?', 'text'),
(46, 1, 'what is your fathers name?', 'text'),
(48, 6, 'Do you like pant ?', 'text'),
(49, 6, 'How many dresses you have?', 'radio');

-- --------------------------------------------------------

--
-- Table structure for table `survey_question_answers`
--

CREATE TABLE IF NOT EXISTS `survey_question_answers` (
  `survey_question_ans_id` int(11) NOT NULL AUTO_INCREMENT,
  `question_id` int(11) NOT NULL,
  `answer` text NOT NULL,
  `ans_type` varchar(20) NOT NULL,
  PRIMARY KEY (`survey_question_ans_id`),
  KEY `question_id` (`question_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=37 ;

--
-- Dumping data for table `survey_question_answers`
--

INSERT INTO `survey_question_answers` (`survey_question_ans_id`, `question_id`, `answer`, `ans_type`) VALUES
(1, 1, 'yes', 'radiobutton'),
(2, 2, 'PHP', 'chechkbox'),
(3, 2, 'JAVA', 'chechkbox'),
(8, 5, 'yes', 'chechkbox'),
(9, 6, 'ice cream ', ''),
(10, 6, 'wine', ''),
(11, 6, 'mutton ', ''),
(12, 6, 'burger ', ''),
(28, 4, 'Answer1', 'checkbox'),
(29, 4, 'Answer2', 'checkbox'),
(30, 4, 'Answer3', 'checkbox'),
(31, 4, 'Answer4', 'checkbox'),
(33, 48, 'yes', 'radiobutton'),
(35, 49, 'Yes', 'radio'),
(36, 49, 'No', 'radio');

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
  PRIMARY KEY (`user_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=16 ;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`user_id`, `username`, `hashed_password`, `email`) VALUES
(1, 'rony', 'fa7168ff4543c7458c26748786ed596d2730a6a8', ''),
(2, 'rony', 'f10e2821bbbea527ea02200352313bc059445190', ''),
(3, 'zakaria1', 'f10e2821bbbea527ea02200352313bc059445190', 'asadf@gmail.com'),
(11, 'shoeb', 'f9a7c6df341325822e3ea264cfe39e5ef8c73aa4', ''),
(12, 'zakaria112', 'f9a7c6df341325822e3ea264cfe39e5ef8c73aa4', 'zak@gmail.com'),
(13, 'zakariar', 'f10e2821bbbea527ea02200352313bc059445190', 'as@fgd.com'),
(14, 'newuser', 'f10e2821bbbea527ea02200352313bc059445190', 'ad@gmail.com'),
(15, 'admin', 'fa7168ff4543c7458c26748786ed596d2730a6a8', 'zakaria@gmail.com');

-- --------------------------------------------------------

--
-- Table structure for table `user_answers`
--

CREATE TABLE IF NOT EXISTS `user_answers` (
  `answer_id` int(11) NOT NULL AUTO_INCREMENT,
  `survey_question_ans_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `answer` varchar(300) NOT NULL,
  PRIMARY KEY (`answer_id`),
  KEY `survey_question_ans_id` (`survey_question_ans_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
