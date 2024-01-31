-- Create the database if it does not exist
CREATE DATABASE IF NOT EXISTS `datadb`;



-- Switch to the database
USE `datadb`;


-- Drop the table if it exists
DROP TABLE IF EXISTS `form`;



-- Create the "form" table
CREATE TABLE `form` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(255) NOT NULL,
  `apellido` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;



-- Grant all privileges to the user 'isabel' on the database 'datadb'
GRANT ALL PRIVILEGES ON datadb.* TO 'isabel'@'%' IDENTIFIED BY 'isabel';


-- Flush privileges to apply the changes
FLUSH PRIVILEGES;
commit;
