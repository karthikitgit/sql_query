creating table 
--------------------------------------------------------------------------------------------------------
CREATE TABLE Students (
    id INT PRIMARY KEY,
    name VARCHAR(50),
    age INT,
    grade CHAR(1)
);
-------------------------------------------------------------------------------------------------------
inserting data
INSERT INTO Students (id, name, age, grade)
VALUES (1, 'Alice', 20, 'A'),
       (2, 'Bob', 22, 'B'),
       (3, 'Charlie', 21, 'A');

-------------------------------------------------------------------------------------------------------
Selecting Data:
SELECT * FROM Students;

-------------------------------------------------------------------------------------------------------
Filtering with WHERE:
SELECT * FROM Students
WHERE age > 20;

-------------------------------------------------------------------------------------------------------
Updating Data:

UPDATE Students
SET grade = 'B'
WHERE name = 'Alice';
---------------------------------------------------------------------------------------------------------
Deleting Data:
DELETE FROM Students
WHERE id = 3;
--------------------------------------------------------------------------------------------------------
Sorting Data:
SELECT * FROM Students
ORDER BY age DESC;
