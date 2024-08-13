-- Mệnh đề SELECT: Truy vấn
SELECT CURRENT_DATE ;
SELECT PI();
SELECT 1+1;
SELECT "Dat";
SELECT CURRENT_DATE AS "Today", NOW() AS "Now" ;

-- Mệnh đề FROM
SELECT department_name, department_id
FROM department;
-- SELECT *: Lấy ra tất cả thông tin của bảng
SELECT *
FROM question;

-- Mệnh đề WHERE: đứng sau FROM, mệnh đề điều kiện
-- Toán tử: >, >=, <, <=, =, != 
SELECT *
FROM department
WHERE department_id >= 5;
-- AND, OR: Toán tử logic
SELECT *
FROM department
WHERE department_id < 3 OR department_id > 8;
SELECT *
FROM department
WHERE department_id < 3 OR department_id > 8;
-- BETWEEN ... AND ...: 
SELECT *
FROM department
WHERE department_id BETWEEN 3 AND 8;
-- IN 
SELECT *
FROM department
WHERE department_id IN (2,4,6,8);
-- LIKE
-- _: Đại diện cho 1 ký tự
-- %: Đại diện cho 0 hoặc nhiều ký tự [Điện thoại %]
SELECT *
FROM department
WHERE department_name LIKE "%g%";
-- IS NULL / IS NOT NULL
SELECT * 
FROM department
WHERE department_name IS NOT NULL;

-- Mệnh đề LIMIT: Giới hạn số lượng trả về
SELECT *
FROM department
LIMIT 5;
-- Phân trang
SELECT *
FROM department
LIMIT 0,3; -- Start: Vị trí bắt đầu lấy, Number: Số lượng phần tử muốn lấy

-- Mệnh đề ORDER BY: xắp xếp 
-- ASC: Tăng dần, DESC: Giảm dần
-- Mặc định: ASC
SELECT *
FROM exam
ORDER BY duration DESC;
-- Xắp xếp theo nhiều tiêu chí
SELECT *
FROM exam
ORDER BY duration DESC, created_date ASC;

-- Hàm tổng hợp
-- COUNT(*): Đếm số dòng
SELECT COUNT(*) AS exam_count
FROM exam;
-- COUNT(id): Đếm số dòng mà id IS NOT NULL
SELECT COUNT(duration) AS exam_count
FROM exam;
-- SUM, MIN, MAX, AVG: Chỉ thao tác với các dòng trên cột là khác NULL
SELECT SUM(duration), MIN(duration), MAX(duration), AVG(duration)
FROM exam;

-- Mệnh đề GROUP BY: chỉ in được các thông tin chung về nhóm
SELECT duration, COUNT(exam_id) 
FROM exam
GROUP BY duration;
--
SELECT duration, created_date, COUNT(exam_id) AS exam_count
FROM exam
GROUP BY duration, created_date
ORDER BY duration, created_date;

-- Mệnh đề HAVING: điều kiện trên 1 nhóm 1 group
SELECT duration, created_date, COUNT(exam_id) AS exam_count
FROM exam
GROUP BY duration, created_date
HAVING COUNT(exam_id) > 1
ORDER BY duration, created_date;

-- Cập nhật dữ liệu
UPDATE department
SET department_name = "Phòng chờ"
WHERE department_id = 1;

-- Xoá dữ liệu 
DELETE FROM exam 
WHERE  duration IS NULL;








