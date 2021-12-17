-- MySQL Script to setup MySQL Schema and populate some data
--

-- Create user & grant privileges
CREATE USER 'demouser'@'%' IDENTIFIED BY 'demopass';
GRANT ALL PRIVILEGES ON *.* TO 'demouser'@'%';
FLUSH PRIVILEGES;
--

-- Create database
CREATE DATABASE IF NOT EXISTS demoapp;
--

-- Create tables & populate data.
USE demoapp;
CREATE TABLE IF NOT EXISTS `musicians` (
  `id` int(5) NOT NULL AUTO_INCREMENT,
  `first_name` varchar(255) NOT NULL,
  `last_name` varchar(255) NOT NULL,
  `genre` varchar(255),
  `instrument` varchar(255),
  PRIMARY KEY (`id`)
);
INSERT INTO `musicians`
  VALUES
  (1,'Smt. Shymala', 'Sajnani', 'Carnatic', 'Saraswati Veena'),
  (2,'Ustad Bahauddin', 'Dagar', 'Dhrupad', 'Rudra Veena'),
  (3,'Mr. Sanjay', 'Divecha', 'Jazz, Blues, Latin', 'Guitar'),
  (4,'Mr. Eliah', 'Levy', 'Latin', 'Chapman Stick'),
  (5,'Pt. Arvind', 'Parikh', 'Khyal', 'Sitar');
  (6,'Mr. Pranav', 'Salunke', 'Dhrupad/Carnatic, Jazz/Latin/Blues', 'Veenas')
SELECT * FROM musicians;
--
