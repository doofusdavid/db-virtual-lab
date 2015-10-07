-- phpMyAdmin SQL Dump
-- version 4.0.10deb1
-- http://www.phpmyadmin.net
--
-- Host: localhost
-- Generation Time: Oct 06, 2015 at 12:30 PM
-- Server version: 5.5.44-0ubuntu0.14.04.1
-- PHP Version: 5.5.9-1ubuntu4.11

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Database: `mydb`
--
CREATE DATABASE IF NOT EXISTS `lab-brewery` DEFAULT CHARACTER SET utf8 COLLATE utf8_general_ci;
USE `lab-brewery`;

-- --------------------------------------------------------

--
-- Table structure for table `Batches`
--

CREATE TABLE IF NOT EXISTS `Batches` (
  `Id` int(11) NOT NULL AUTO_INCREMENT,
  `Beer` int(11) DEFAULT NULL,
  `FermentationStart` date DEFAULT NULL,
  `FermentationEnd` date DEFAULT NULL,
  `TapStart` date DEFAULT NULL,
  `TapEnd` date DEFAULT NULL,
  `Quantity_Gallons` int(11) DEFAULT NULL,
  PRIMARY KEY (`Id`),
  KEY `Batch_Beer_idx` (`Beer`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=5 ;

--
-- Dumping data for table `Batches`
--

INSERT INTO `Batches` (`Id`, `Beer`, `FermentationStart`, `FermentationEnd`, `TapStart`, `TapEnd`, `Quantity_Gallons`) VALUES
(1, 1, '2015-09-01', '2015-09-20', '2015-09-21', NULL, 5),
(2, 2, '2015-09-01', '2015-09-15', '2015-09-17', '2015-09-22', 5),
(3, 2, '2015-09-05', '2015-09-20', '2015-09-23', NULL, 10),
(4, 1, '2015-09-10', '2015-09-30', NULL, NULL, 5);

-- --------------------------------------------------------

--
-- Table structure for table `Beer`
--

CREATE TABLE IF NOT EXISTS `Beer` (
  `Id` int(11) NOT NULL AUTO_INCREMENT,
  `Name` varchar(45) DEFAULT NULL,
  `FermentationTime_Days` int(11) DEFAULT NULL,
  PRIMARY KEY (`Id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=4 ;

--
-- Dumping data for table `Beer`
--

INSERT INTO `Beer` (`Id`, `Name`, `FermentationTime_Days`) VALUES
(1, 'High Sierra Pale Ale', 20),
(2, 'American Wheat', 15),
(3, 'Dale''s Pale Ale', 17);

-- --------------------------------------------------------

--
-- Table structure for table `BeerIngredients`
--

CREATE TABLE IF NOT EXISTS `BeerIngredients` (
  `Id` int(11) NOT NULL AUTO_INCREMENT,
  `Beer` int(11) NOT NULL,
  `Ingredient` int(11) NOT NULL,
  `Amount_Cups` int(11) DEFAULT NULL,
  PRIMARY KEY (`Id`),
  KEY `Recipe_Beer_idx` (`Beer`),
  KEY `Recipe_Ingredient_idx` (`Ingredient`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=24 ;

--
-- Dumping data for table `BeerIngredients`
--

INSERT INTO `BeerIngredients` (`Id`, `Beer`, `Ingredient`, `Amount_Cups`) VALUES
(13, 1, 1, 96),
(14, 1, 2, 16),
(15, 1, 8, 2),
(16, 1, 9, 1),
(17, 1, 7, 5),
(18, 1, 12, 18),
(19, 2, 3, 93),
(20, 2, 4, 74),
(21, 2, 8, 8),
(22, 2, 10, 1),
(23, 2, 11, 18);

-- --------------------------------------------------------

--
-- Table structure for table `IngredientTypes`
--

CREATE TABLE IF NOT EXISTS `IngredientTypes` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `Name` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=6 ;

--
-- Dumping data for table `IngredientTypes`
--

INSERT INTO `IngredientTypes` (`ID`, `Name`) VALUES
(1, 'Hops'),
(2, 'Yeast'),
(3, 'Malts'),
(4, 'Barley'),
(5, 'Other');

-- --------------------------------------------------------

--
-- Table structure for table `Ingredients`
--

CREATE TABLE IF NOT EXISTS `Ingredients` (
  `Id` int(11) NOT NULL AUTO_INCREMENT,
  `Type` int(11) DEFAULT NULL,
  `Cost` int(11) DEFAULT NULL,
  `Name` varchar(45) DEFAULT NULL,
  `CurrentInventory_Cups` int(11) DEFAULT NULL,
  PRIMARY KEY (`Id`),
  KEY `Ing_IngType_idx` (`Type`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=13 ;

--
-- Dumping data for table `Ingredients`
--

INSERT INTO `Ingredients` (`Id`, `Type`, `Cost`, `Name`, `CurrentInventory_Cups`) VALUES
(1, 3, 6, 'Light Malt', 50),
(2, 3, 3, 'Crystal Malt', 20),
(3, 3, 1, 'Wheat Malt', 40),
(4, 3, 2, 'Row Malt', 15),
(5, 1, 25, 'Perle Hops', 30),
(6, 1, 32, 'Spalt Hops', 60),
(7, 5, 1, 'Sugar', 150),
(8, 1, 48, 'Cascade Hops', 60),
(9, 1, 23, 'Chinook Hops', 40),
(10, 5, 10, 'Rice Hulls', 3),
(11, 2, 70, 'American Hefeweizen Yeast', 4),
(12, 2, 15, 'Brewers Yeast', 16);

--
-- Constraints for dumped tables
--

--
-- Constraints for table `Batches`
--
ALTER TABLE `Batches`
  ADD CONSTRAINT `Batch_Beer` FOREIGN KEY (`Beer`) REFERENCES `Beer` (`Id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `BeerIngredients`
--
ALTER TABLE `BeerIngredients`
  ADD CONSTRAINT `Recipe_Beer` FOREIGN KEY (`Beer`) REFERENCES `Beer` (`Id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `Recipe_Ingredient` FOREIGN KEY (`Ingredient`) REFERENCES `Ingredients` (`Id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `Ingredients`
--
ALTER TABLE `Ingredients`
  ADD CONSTRAINT `Ing_IngType` FOREIGN KEY (`Type`) REFERENCES `IngredientTypes` (`ID`) ON DELETE NO ACTION ON UPDATE NO ACTION;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
