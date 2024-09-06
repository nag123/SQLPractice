show databases;
use sys;show tables;

CREATE TABLE IF NOT EXISTS sys.sampletestdata (
  `id` INT,
  `name` VARCHAR(20) CHARACTER SET utf8,
  `location` VARCHAR(20) CHARACTER SET utf8);
  
  INSERT INTO sys.sampletestdata VALUES
  (1,NULL,NULL),
  (NULL,'NAXI',NULL),
  (NULL,NULL,'DELHI')
  ;
  
  SELECT * FROM sys.sampletestdata; 
  
  SELECT 
    MAX(ID) AS ID, 
    MAX(NAME) AS NAME, 
    MAX(LOCATION) AS LOCATION
 FROM sys.sampletestdata;
 
 SELECT 
    coalesce(ID) AS ID, 
    coalesce(NAME) AS NAME, 
    coalesce(LOCATION) AS LOCATION
 FROM sys.sampletestdata;