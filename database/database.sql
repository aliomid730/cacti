SET CHARSET UTF8;
CREATE DATABASE IF NOT EXISTS cacti CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;
grant all privileges on cacti.* to 'cacti'@'%';
flush privileges;
