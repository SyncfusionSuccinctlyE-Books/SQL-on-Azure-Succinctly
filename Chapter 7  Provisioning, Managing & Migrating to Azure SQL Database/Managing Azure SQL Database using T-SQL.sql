-- Create New Database
CREATE DATABASE myTestDB
(
 EDITION='Standard',
 SERVICE_OBJECTIVE='S0'
);
-- ALTER DATABASE 
ALTER DATABASE myTestDB
MODIFY
(
SERVICE_OBJECTIVE='S1'
);
-- DROP DATABASE 
DROP DATABASE myTestDB;
-- Create New Server Login
CREATE LOGIN User1 WITH password='Password1';
-- Create Database User (Switch to User Database)
CREATE USER dbuser1 FROM LOGIN User1;
--Adding User to db_datareader role (Switch to User Database)
exec sp_addrolemember 'db_datareader', 'dbuser1';    
-- DROP Login (Switch to master Database)
DROP LOGIN User1
-- Query Catalog Views (on Master database)
SELECT * FROM sys.databases
SELECT * FROM sys.sql_logins
-- Query Dynamic Management Views (On User database)
SELECT text,* from sys.dm_exec_requests
cross apply sys.dm_exec_sql_text(sql_handle)
SELECT * from sys.dm_exec_connections
SELECT * from sys.dm_exec_sessions
