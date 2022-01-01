/*        Single-Row Subqueries:                   
 
 1.Write a query to find the maximum duration among the 
tracks. Your query should include TrackId, Name, Milliseconds.*/

SELECT TrackId, Name, max(Milliseconds)
FROM tracks;

/* 2. Write a query to find the minimum duration among the tracks. 
Your query should include TrackId, Name, Milliseconds.*/

SELECT TrackId, Name, min(Milliseconds)
FROM tracks;

/* 3. Write a query to find the tracks whose bytes are higher than the 
average of the bytes of all tracks. Your query should include TrackId, 
Name, Bytes, general average and should be ordered by Bytes from highest 
to lowest. General average is the average of all tracks. General average 
should repeat in every row. (Hint: You need to use two subqueries)*/

SELECT TrackId,Name, Bytes
FROM tracks
WHERE Bytes > (SELECT avg(Bytes)
FROM tracks)
ORDER by Bytes DESC;

/* Multiple-Row Subqueries:

Write a query that returns the customers whose sales representatives are 
Jane Peacock and Margaret Park. Your query should include CustomerID, 
First Name and Last Name of the customers.*/

SELECT FirstName,LastName
FROM employees
WHERE FirstName in("Jane", "Margaret");

SELECT CustomerID, FirstName, LastName
FROM customers; 

/*DDL (CREATE, ALTER, DELETE) and DML (SELECT, INSERT, UPDATE, DELETE) Statements

1. Create a table inside the chinook database. This table tracks the employees’ 
courses inside the organization. Your table should have the followings features:

               Name of the table: courses
               Columns:
                    CourseId (Primary Key)
                    CourseName (Cannot be null)
                    EmployeeId (Foreign Key - Refers to EmployeeId of employees 
					table ) 
                    CoursePrice*/
					
CREATE TABLE courses (
		CourseId VARCHAR(20),
		CourseName TEXT,
		EmployeeId VARCHAR(20),
		CoursePrice INT
		FOREIGN KEY(EmployeeId)
		);
		
/* 2. Insert at least 5 rows into the courses table. Your EmployeeId should contain 
the values of the EmployeeId column on the employees table. You’re free to choose 
any values for other columns (CourseId, CourseName, CoursePrice)*/ 

INSERT INTO courses VALUES(1, 'Futbol', 21, 134);
INSERT INTO courses VALUES(2, 'Basketbal', 22, 150);
INSERT INTO courses VALUES(3, 'Hentbol', 23, 155);
INSERT INTO courses VALUES(4, 'Masa_Tenisi', 24, 140);
INSERT INTO courses VALUES(5, 'Yüzme', 25, 152);

/* 3. Delete the last row of your courses table.*/
    DELETE FROM courses
   WHERE EmployeeId=25;
   
/* 4. Add a new column to your courses table named StartDate. The new column 
cannot be null.*/
 
	ALTER TABLE courses
	ADD	StartDate date DEFAULT NOT NULL;
	
/* 5. Delete the CoursePrice column.*/

ALTER TABLE
courses DROP COLUMN CoursePrice;

/* Delete the courses table.*/

DROP TABLE courses;









