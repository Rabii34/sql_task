create database dept;
use dept;
 
 ----- Schema 1	-----

 --Departments Table
CREATE TABLE Depart (
    DepartmentID INT PRIMARY KEY,
    DepartmentName VARCHAR(50)
);

--3. Insert three departments into the Departments table.
INSERT INTO Depart(DepartmentID, DepartmentName)
VALUES
    (1, 'HR'),
    (2, 'IT'),
    (3, 'Finance');
SELECT * FROM Department;

-- Employees Table
CREATE TABLE Emp (
    EmployeeID INT PRIMARY KEY,
    FirstName VARCHAR(50),
    LastName VARCHAR(50),
    DepartmentID INT,
    Salary DECIMAL(10, 2)
);

--6. Fetch a list of all employees along with the department they belong to.
SELECT EmployeeID,FirstName,LastName,DepartmentName FROM Emp AS emp join Depart as dep on 
emp.DepartmentID=dep.DepartmentID;


--7. Retrieve the employees whose last name starts with 'S'.
SELECT * FROM Employe WHERE LastName like 'S%';

--2. Insert five employees into the Employees table.

--4. Assign each employee to a department in the Employees table.
INSERT INTO Emp(EmployeeID, FirstName, LastName, DepartmentID, Salary)
VALUES
    (1, 'John', 'Doe', 1, 60000.00),
    (2, 'Jane', 'Smith', 2, 55000.00),
    (3, 'Mike', 'Johnson', 1, 65000.00),
    (4, 'Emily', 'Williams', 3, 70000.00),
    (5, 'David', 'Brown', 2, 50000.00),
    (6, 'Sarah', 'Miller', 1, 62000.00),
    (7, 'Chris', 'Wilson', 3, 75000.00),
    (8, 'Anna', 'Jones', 2, 53000.00),
    (9, 'Brian', 'Taylor', 1, 58000.00),
    (10, 'Laura', 'Anderson', 3, 72000.00);
SELECT * FROM Employe;

--9. Calculate the total salary of all employees.
SELECT  SUM(Salary) as Tot_salary FROM Employe;

--10.Find the department with the highest average salary.
SELECT AVG(Salary) as Average_Salary from Employe;
SELECT MAX(Salary) as Highest_Salary from Employe;

--5. Retrieve the details of employees whose salary is above 50000.
SELECT * FROM Employe WHERE Salary>5000;

--1. Create a new table named Projects with columns ProjectID, ProjectName, and StartDate.

--Project table
CREATE TABLE Project(
     ProjectID INT,
	 ProjectName VARCHAR(50),
	 StartingDate date,
	 EmployeeID int,
	 Foreign key (EmployeeID) references Employe (EmployeeID)
);
INSERT INTO Project(ProjectID,ProjectName,StartingDate,EmployeeID)
VALUES
    (1,'Database','2022-11-03',3),
	(2,'Web application','2021-10-13',6),
	(1,'Database','2022-11-03',9),
	(4,'Desktop application','2020-01-30',5),
    (1,'Database','2022-11-03',2),
	(6,'E-Project','2023-05-16',9),
	(1,'Database','2022-11-03',7),
	(8,'Android','2018-08-01',4),
	(1,'Database','2022-11-03',8),
	(10,'SQL','2011-02-25',1);
SELECT * FROM Project;

--8. Retrieve the projects with names containing the word 'Database'.
SELECT FirstName,LastName,ProjectID,ProjectName,StartingDate FROM Employe  as emp JOIN Project as pro on
emp.EmployeeID=pro.EmployeeID WHERE ProjectName like '%Database%';


		----- Schema 2	-----


-- Courses Table
CREATE TABLE Course (
    CourseID INT PRIMARY KEY,
    CourseName VARCHAR(50)
);

-- Inserting 10 sample records into Courses table
INSERT INTO Course (CourseID, CourseName)
VALUES
    (1, 'Introduction to Programming'),
    (2, 'Web Development Basics'),
    (3, 'Database Management'),
    (4, 'Data Structures and Algorithms'),
    (5, 'JavaScript Fundamentals'),
    (6, 'Mobile App Development'),
    (7, 'Software Engineering Principles'),
    (8, 'Networking Essentials'),
    (9, 'Artificial Intelligence Basics'),
    (10, 'Cybersecurity Fundamentals');
SELECT * FROM Course;

CREATE TABLE Student (
    StudentID INT PRIMARY KEY,
    FirstName VARCHAR(50),
    LastName VARCHAR(50),
    Age INT,
    GPA DECIMAL(3, 2),
	CourseID int,
	foreign key (CourseID) references Course(CourseID)
);
INSERT INTO Student (StudentID, FirstName, LastName, Age, GPA,CourseID)
VALUES
    (1, 'Alice', 'Johnson', 20, 3.75,2),
    (2, 'Bob', 'Smith', 22, 3.50,NULL),
    (3, 'Charlie', 'Davis', 21, 3.80,5),
    (4, 'Diana', 'Brown', 23, 3.90,4),
    (5, 'Eva', 'Miller', 20, 3.65,NULL),
    (6, 'Frank', 'Jones', 22, 3.70,2),
    (7, 'Grace', 'Wilson', 21, 3.85,8),
    (8, 'Henry', 'Anderson', 23, 3.95,5),
    (9, 'Ivy', 'Taylor', 20, 3.60,NULL),
    (10, 'Jack', 'Clark', 22, 3.75,2);
SELECT * FROM Student;

---1.Retrieve a list of all students and the courses they are enrolled in, including those who are not enrolled in any course.
SELECT StudentID,FirstName,LastName,CourseName FROM  Course as cou left join Student as std  on 
cou.CourseID=std.CourseID;

--2.Display the details of students who are enrolled in the course 'Web Development Basics'.
SELECT StudentID,FirstName,LastName,CourseName FROM   Student as std join Course as cou on 
cou.CourseID=std.CourseID WHERE CourseName='Web Development Basics';

--3.Find out which courses have no enrolled students.
SELECT StudentID,FirstName,LastName,CourseName FROM  Course as cou left join Student as std  on 
cou.CourseID=std.CourseID where StudentID is Null;

--4. List the students who are enrolled in any course, along with the course names.
SELECT StudentID,FirstName,LastName,CourseName FROM  Course as cou join Student as std  on 
cou.CourseID=std.CourseID;

--5. Retrieve a list of all courses along with the number of students enrolled in each course, even if the count is zero.
SELECT count(*) as Number_of_Students FROM  Course as cou left join Student as std  on 
cou.CourseID=std.CourseID;