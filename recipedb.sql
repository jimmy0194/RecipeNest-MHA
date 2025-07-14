-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jul 14, 2025 at 12:12 PM
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
-- Database: `recipedb`
--

-- --------------------------------------------------------

--
-- Table structure for table `chefprofiles`
--

CREATE TABLE `chefprofiles` (
  `ProfileId` int(11) NOT NULL,
  `UserId` int(11) NOT NULL,
  `FullName` varchar(255) DEFAULT NULL,
  `Bio` text DEFAULT NULL,
  `ProfilePicture` varchar(255) DEFAULT NULL,
  `ContactDetails` varchar(500) DEFAULT NULL,
  `SocialMediaLinks` text DEFAULT NULL,
  `UpdatedAt` datetime NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `recipecomments`
--

CREATE TABLE `recipecomments` (
  `CommentId` int(11) NOT NULL,
  `RecipeId` int(11) NOT NULL,
  `UserId` int(11) NOT NULL,
  `CommentText` text DEFAULT NULL,
  `CreatedAt` datetime NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `recipes`
--

CREATE TABLE `recipes` (
  `RecipeId` int(11) NOT NULL,
  `ChefId` int(11) NOT NULL,
  `Title` varchar(255) DEFAULT NULL,
  `Description` text DEFAULT NULL,
  `Ingredients` text DEFAULT NULL,
  `Instructions` text DEFAULT NULL,
  `RecipeImage` varchar(255) DEFAULT NULL,
  `PublishedAt` datetime NOT NULL DEFAULT current_timestamp(),
  `UpdatedAt` datetime NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `recipeshares`
--

CREATE TABLE `recipeshares` (
  `ShareId` int(11) NOT NULL,
  `RecipeId` int(11) NOT NULL,
  `SocialMediaPlatform` varchar(100) DEFAULT NULL,
  `ShareDate` datetime NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `UserId` int(11) NOT NULL,
  `Email` varchar(100) NOT NULL,
  `PasswordHash` varchar(255) NOT NULL,
  `Role` varchar(50) NOT NULL,
  `CreatedAt` datetime NOT NULL DEFAULT current_timestamp(),
  `UpdatedAt` datetime NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `chefprofiles`
--
ALTER TABLE `chefprofiles`
  ADD PRIMARY KEY (`ProfileId`),
  ADD KEY `UserId` (`UserId`);

--
-- Indexes for table `recipecomments`
--
ALTER TABLE `recipecomments`
  ADD PRIMARY KEY (`CommentId`),
  ADD KEY `UserId` (`UserId`),
  ADD KEY `idx_recipe_comments` (`RecipeId`);

--
-- Indexes for table `recipes`
--
ALTER TABLE `recipes`
  ADD PRIMARY KEY (`RecipeId`),
  ADD KEY `ChefId` (`ChefId`),
  ADD KEY `idx_recipes_title` (`Title`);

--
-- Indexes for table `recipeshares`
--
ALTER TABLE `recipeshares`
  ADD PRIMARY KEY (`ShareId`),
  ADD KEY `idx_recipe_shares` (`RecipeId`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`UserId`),
  ADD UNIQUE KEY `Email` (`Email`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `chefprofiles`
--
ALTER TABLE `chefprofiles`
  MODIFY `ProfileId` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `recipecomments`
--
ALTER TABLE `recipecomments`
  MODIFY `CommentId` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `recipes`
--
ALTER TABLE `recipes`
  MODIFY `RecipeId` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `recipeshares`
--
ALTER TABLE `recipeshares`
  MODIFY `ShareId` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `UserId` int(11) NOT NULL AUTO_INCREMENT;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `chefprofiles`
--
ALTER TABLE `chefprofiles`
  ADD CONSTRAINT `chefprofiles_ibfk_1` FOREIGN KEY (`UserId`) REFERENCES `users` (`UserId`);

--
-- Constraints for table `recipecomments`
--
ALTER TABLE `recipecomments`
  ADD CONSTRAINT `recipecomments_ibfk_1` FOREIGN KEY (`RecipeId`) REFERENCES `recipes` (`RecipeId`),
  ADD CONSTRAINT `recipecomments_ibfk_2` FOREIGN KEY (`UserId`) REFERENCES `users` (`UserId`);

--
-- Constraints for table `recipes`
--
ALTER TABLE `recipes`
  ADD CONSTRAINT `recipes_ibfk_1` FOREIGN KEY (`ChefId`) REFERENCES `users` (`UserId`);

--
-- Constraints for table `recipeshares`
--
ALTER TABLE `recipeshares`
  ADD CONSTRAINT `recipeshares_ibfk_1` FOREIGN KEY (`RecipeId`) REFERENCES `recipes` (`RecipeId`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
