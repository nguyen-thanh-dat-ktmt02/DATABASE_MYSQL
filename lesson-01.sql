-- Xoá cơ sở dữ liệu nếu tồn tại
DROP DATABASE IF EXISTS lesson_01;

-- Tạo cơ sở dữ liệu
CREATE DATABASE lesson_01;

-- hiển thị danh sách cơ sở dữ liệu
SHOW DATABASES;

-- Chọn cơ sở dữ liệu muốn thao tác
USE lesson_01;

-- Kiểu dữ liệu
-- Số nguyên: IINYINT, SMALLINT, MEDIUMINT, INT, BIGINT
-- Tối ưu dung lượng lưu trữ 
-- Số thực: FLOAT, DOUBLE
-- Chuỗi: VARCHAR(50), CHAR(50)
-- Thời gian: DATE (yyyy- MM- dd), TIME, DATETIME
-- Logic: BOOLEAN, BIT true/ flase
-- Kiểu ENUM: MALE, FEMALE ENUM("Loading", "Success","Error")

-- Xóa bảng nếu tồn tại
DROP TABLE IF EXISTS department;

-- Tạo bảng
CREATE TABLE department (
	id INT,
    name VARCHAR(50),
    created_date DATE 
);

-- Thêm dữ liệu vào bảng 
INSERT INTO department(id, name, created_date)
VALUES  (1, "Bảo vệ"		, "2024-05-19"),
		(2, "Kinh doanh"	, "2024-06-19"),
        (3, "Giám đốc"		, "2024-07-19");

-- Hiển thị dữ liệu
TABLE department;
-- Hoặc
SELECT * FROM department;

-- Ràng buộc dữ liệu
-- Khóa chính (PRIMARY KEY)
-- 1. Một bảng có tối đa một khóa chính
-- 2. Giá trị là duy nhất 
-- 3. Không được để trống (Phải NOT NULL)
-- Tự động tăng: AUTO_INCREMENT

DROP TABLE IF EXISTS product;
CREATE TABLE product(
	id INT PRIMARY KEY AUTO_INCREMENT,
    name VARCHAR(50)
);

INSERT INTO product(id, name)
VALUES (1, "chuột máy tính");

INSERT INTO product(id, name)
VALUES (2, "bàn phím máy tính");

INSERT INTO product(name)
VALUES ("card máy tính");

-- NOT NULL: không được để trống
DROP TABLE IF EXISTS question;
CREATE TABLE question(
 id INT PRIMARY KEY AUTO_INCREMENT,
 content VARCHAR(100) NOT NULL
);

INSERT INTO question (content)
VALUES ("");

-- UNIQUE KEY: Khóa duy nhất 
DROP TABLE IF EXISTS customer;
CREATE TABLE customer(
	id INT PRIMARY KEY AUTO_INCREMENT,
    email VARCHAR(100) UNIQUE NOT NULL
);

--
-- INSERT INTO customer(email)
-- VALUES (NULL);
--
INSERT INTO customer(email)
VALUES ("thanhdat2002tn@gmail.com");

-- DEFAULT: Mặc định
DROP TABLE IF EXISTS customer;
CREATE TABLE customer(
	id INT PRIMARY KEY AUTO_INCREMENT,
    email VARCHAR(100) DEFAULT "unknow@gamil.com",
    created DATE DEFAULT (CURRENT_DATE)
);
INSERT INTO customer(id)
VALUES (100);


-- CHECK: Kiểm tra
DROP TABLE IF EXISTS `user`;
CREATE TABLE `user`(
	id INT PRIMARY KEY AUTO_INCREMENT,
    age INT CHECK (age >=18) 
);

INSERT INTO `user` (age)
VALUES (20);

-- FOREIGIN KEY: Khóa ngoại
DROP TABLE IF EXISTS department;
CREATE TABLE department(
	id INT PRIMARY KEY AUTO_INCREMENT,
    name VARCHAR(50)
);


DROP TABLE IF EXISTS account;
CREATE TABLE account (
	id INT PRIMARY KEY AUTO_INCREMENT,
    full_name VARCHAR(50),
    department_id INT,
    FOREIGN KEY (department_id) REFERENCES department(id)
    ON UPDATE CASCADE ON DELETE CASCADE
);
--
INSERT INTO department (id, name)
VALUES (100, "Bảo vệ");
--
INSERT INTO account (full_name, department_id)
VALUES("NGUYỄN THÀNH ĐẠT", 100);



















