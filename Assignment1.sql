/*question 1*/
DROP DATABASE IF EXISTS trainee;

CREATE DATABASE IF NOT EXISTS trainee;

use trainee;
drop table if exists trainee;
CREATE TABLE trainee (
TraineeID INT PRIMARY KEY AUTO_INCREMENT,
Full_Name VARCHAR(25),
Birth_Date DATE,
Gender ENUM('male', 'female', 'unknown'),
ET_IQ INT CHECK (ET_IQ >= 0 AND ET_IQ <= 20),
ET_Gmath INT CHECK (ET_Gmath >= 0 AND ET_Gmath <= 20),
ET_English INT CHECK (ET_English >= 0 AND ET_English <= 50),
Training_Class VARCHAR(25),
Evaluation_Notes VARCHAR(250)
);

/* question 2*/
ALTER TABLE trainee ADD COLUMN VIT_Account VARCHAR(50) NOT NULL UNIQUE;


