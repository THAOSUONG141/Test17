CREATE TABLE `account` (
  `AccountID` mediumint unsigned NOT NULL AUTO_INCREMENT,
  `Email` varchar(50) DEFAULT NULL,
  `UserName` varchar(50) NOT NULL,
  `FullName` varchar(50) DEFAULT NULL,
  `DepartmentID` tinyint unsigned DEFAULT NULL,
  `PositionID` tinyint unsigned DEFAULT NULL,
  `CreatedDate` datetime DEFAULT NULL,
  PRIMARY KEY (`AccountID`),
  UNIQUE KEY `Email` (`Email`),
  KEY `fk_account_department` (`DepartmentID`),
  KEY `fk_account_position` (`PositionID`),
  CONSTRAINT `fk_account_department` FOREIGN KEY (`DepartmentID`) REFERENCES `department` (`DepartmentID`) ON DELETE SET NULL ON UPDATE CASCADE,
  CONSTRAINT `fk_account_position` FOREIGN KEY (`PositionID`) REFERENCES `position` (`PositionID`) ON DELETE SET NULL ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

CREATE TABLE `answer` (
  `AnswerID` tinyint unsigned NOT NULL AUTO_INCREMENT,
  `Content` varchar(50) DEFAULT NULL,
  `QuestionID` tinyint unsigned DEFAULT NULL,
  `IsCorrect` bit(1) DEFAULT NULL,
  PRIMARY KEY (`AnswerID`),
  KEY `fk_answer_question` (`QuestionID`),
  CONSTRAINT `fk_answer_question` FOREIGN KEY (`QuestionID`) REFERENCES `question` (`QuestionID`) ON DELETE SET NULL ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

CREATE TABLE `categoryquestion` (
  `CategoryID` tinyint unsigned NOT NULL AUTO_INCREMENT,
  `CategoryName` enum('Java','SQL','.NET','Ruby','Python','NodeJS','HTML','CSS','JavaScript') DEFAULT NULL,
  PRIMARY KEY (`CategoryID`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

CREATE TABLE `department` (
  `DepartmentID` tinyint unsigned NOT NULL AUTO_INCREMENT,
  `DepartmentName` varchar(50) NOT NULL,
  PRIMARY KEY (`DepartmentID`),
  UNIQUE KEY `DepartmentName` (`DepartmentName`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

CREATE TABLE `exam` (
  `ExamID` tinyint unsigned NOT NULL AUTO_INCREMENT,
  `Code` varchar(20) NOT NULL,
  `Title` varchar(50) NOT NULL,
  `CategoryID` tinyint unsigned DEFAULT NULL,
  `Duration` tinyint DEFAULT NULL,
  `CreatorID` mediumint unsigned DEFAULT NULL,
  `CreatedDate` datetime DEFAULT NULL,
  PRIMARY KEY (`ExamID`),
  KEY `fk_exam_account` (`CreatorID`),
  KEY `fk_exam_categoryquestion` (`CategoryID`),
  CONSTRAINT `fk_exam_account` FOREIGN KEY (`CreatorID`) REFERENCES `account` (`AccountID`) ON DELETE SET NULL ON UPDATE CASCADE,
  CONSTRAINT `fk_exam_categoryquestion` FOREIGN KEY (`CategoryID`) REFERENCES `categoryquestion` (`CategoryID`) ON DELETE SET NULL ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=20 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

CREATE TABLE `examquestion` (
  `ExamID` tinyint unsigned DEFAULT NULL,
  `QuestionID` tinyint unsigned DEFAULT NULL,
  KEY `fk_examquestion_exam` (`ExamID`),
  KEY `fk_examquestion_question` (`QuestionID`),
  CONSTRAINT `fk_examquestion_exam` FOREIGN KEY (`ExamID`) REFERENCES `exam` (`ExamID`) ON DELETE SET NULL ON UPDATE CASCADE,
  CONSTRAINT `fk_examquestion_question` FOREIGN KEY (`QuestionID`) REFERENCES `question` (`QuestionID`) ON DELETE SET NULL ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

CREATE TABLE `group` (
  `GroupID` mediumint unsigned NOT NULL AUTO_INCREMENT,
  `GroupName` varchar(50) NOT NULL,
  `CreatorID` mediumint unsigned DEFAULT NULL,
  `CreatedDate` datetime DEFAULT NULL,
  PRIMARY KEY (`GroupID`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

CREATE TABLE `groupaccount` (
  `GroupID` mediumint DEFAULT NULL,
  `AccountID` mediumint DEFAULT NULL,
  `JoinDate` datetime DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

CREATE TABLE `position` (
  `PositionID` tinyint unsigned NOT NULL AUTO_INCREMENT,
  `PositionName` enum('Dev1','Dev2','PM','Leader','Scrum Master','Tester') DEFAULT NULL,
  PRIMARY KEY (`PositionID`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

CREATE TABLE `question` (
  `QuestionID` tinyint unsigned NOT NULL AUTO_INCREMENT,
  `Content` varchar(50) DEFAULT NULL,
  `CategoryID` tinyint unsigned DEFAULT NULL,
  `TypeID` tinyint unsigned DEFAULT NULL,
  `CreatorID` mediumint unsigned DEFAULT NULL,
  `CreatedDate` datetime DEFAULT NULL,
  PRIMARY KEY (`QuestionID`),
  KEY `question` (`CreatorID`),
  KEY `fk_question_categoryquestion` (`CategoryID`),
  KEY `fk_question_typequestion` (`TypeID`),
  CONSTRAINT `fk_question_categoryquestion` FOREIGN KEY (`CategoryID`) REFERENCES `categoryquestion` (`CategoryID`) ON DELETE SET NULL ON UPDATE CASCADE,
  CONSTRAINT `fk_question_typequestion` FOREIGN KEY (`TypeID`) REFERENCES `typequestion` (`TypeID`) ON DELETE SET NULL ON UPDATE CASCADE,
  CONSTRAINT `question` FOREIGN KEY (`CreatorID`) REFERENCES `account` (`AccountID`) ON DELETE SET NULL ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

CREATE TABLE `typequestion` (
  `TypeID` tinyint unsigned NOT NULL AUTO_INCREMENT,
  `TypeName` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`TypeID`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
