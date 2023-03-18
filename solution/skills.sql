show databases;
use sys;show tables;

CREATE TABLE IF NOT EXISTS sys.Skills (
  `Id` INT,
  `Name` VARCHAR(20) CHARACTER SET utf8
);
INSERT INTO sys.Skills VALUES
 (101,"Oracle"),
(102,"Oracle"),
(103,"Oracle"),
(101,"Oracle"),
(102,"Java"),
(103,"Java"),
(101,"Java"),
(102,"Java"),
(103,"Java"),
(101,"Java"),
(101,"Java"),
(101,"Oracle"),
(101,"VB"),
(102,"ASP");

select * from sys.Skills;
select count(*) from sys.Skills;