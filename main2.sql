-- DDL Commands
-- 	Used to define and manage database structures (tables, schemas, indexes).
--     CREATE – make new database objects.
-- 	ALTER – modify structure of tables.
-- 	DROP – delete tables/databases permanently.
-- 	TRUNCATE – remove all rows but keep structure.
-- 	RENAME – rename database objects. 

CREATE DATABASE college1;

use college1;

CREATE TABLE Students(
  id int PRIMARY KEY,
  name varchar(10) NOT NULL,
  age int check(age>=18),
  qualification varchar(10)
);

-- ALTER – change structure of table
-- Adding new column: Alter table tablename add newcolumnname datatype 
-- Modifying columnname ALTER TABLE tablename MODIFY columnname VARCHAR(100);
-- Rename column ALTER TABLE Tablename RENAME COLUMN oldcolumanname TO newcolumnname;
-- Drop a column ALTER TABLE tablename DROP COLUMN columnname;

-- DROP-Permanenetly remove database/table
-- DROP TABLE tablename;
-- DROP DATABASE databasename;

-- TRUNCATE – remove all rows but keep structure
-- TRUNCATE TABLE tablename;

-- RENAME – rename table
-- RENAME TABLE oldtablename TO newtablename;