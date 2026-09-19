-- Create Table -- 
CREATE TABLE student_information_data(
	student_id INTEGER,
	name VARCHAR(100),
	age INTEGER,
	email VARCHAR(150),
	department VARCHAR(100),
	gpa DECIMAL(3,2),
	graduation_year INTEGER
)

-- Check Data --
Select *
From student_information_data
LIMIT 12;

Select 
	column_name,
	data_type
FROM information_schema.columns
Where table_name = 'student_information_data'
ORDER BY ordinal_position

Select COUNT(*)
From student_information_data

-- Business Questions --
-- 1. How Many students are enrolled in each department --
Select
	department,
	COUNT(*) AS student_count
FROM student_information_data
GROUP BY department
ORDER BY student_count DESC;
-- This analysis shows the distribution of students across academic departments to indentify differences in department size, providing an overview of how students in the dataset are distributed among the various areas of study. --
-- The result show that the Physics has the largest number of students, with 51,  while the Biology has the smallest, with 27. Computer Science and Chemistry each have 46 students, while Mathematics has 30. --

-- 2. What is the average GPA for each department?
Select
	department,
	ROUND(AVG(gpa), 2) AS average_gpa
From student_information_data
GROUP BY department
ORDER BY average_gpa DESC;
-- Here shows the average GPA of students across academic departments. It provides a general view of how academic performance differs among the departments represented in the dataset. --
-- It seems that of those departments, Physics also has the highest average in GPA with 3.12 whereas Biology holds the lowest with 2.92. In addition, Mathematic has an average of 3.08 followed by Computer Science and Chemistry with 3.04 and 2.94 respectively. --

-- 3. How many students are graduating in each year? --
Select
	graduation_year, 
	COUNT(*) AS student_count
From student_information_data
GROUP BY graduation_year
ORDER BY graduation_year;
-- This analysis examines the number of students associated with each graduation year. It provides insight into how the student population is distributed across different expected graduation periods. --
-- The data shows that 23 students are associated with the 2024 graduation year while 37 are in 2030. Between these years, the number of students varies, with 30 in 2025, 23 in 2026, 36 in 2027, 25 in 2028, and 26 in 2029. --

-- 4. Which departments have students with GPA of 3.50 or higher? --
Select
	department,
	COUNT(*) AS students_gpa_350_or_higher
From student_information_data
Where gpa >= 3.50
GROUP BY department 
ORDER BY students_gpa_350_or_higher DESC;
-- This analysis identifies the number of students achieving a GPA of 3.50 or higher within each department. It focuses on the distribution of higher academic achievement across the different areas of study. --
-- The data results show that Physics has the highest number of students with a GPA of 3.50 or higher, with 17, while Biology has the lowest total of 5 students. Computer Science follows Physics with 15 students, while Chemestry and Mathematics have 9 and 7 students, respectively. --

-- 5. How many students are in each age group? --
Select
	Case
		When age between 18 and 20 then '18-20'
		When age between 21 and 23 then '21-23'
		When age between 24 and 26 then '24-26'
		Else '27+'
	End AS age_group,
	COUNT(*) AS student_count
From student_information_data
GROUP BY age_group
ORDER BY age_group;
-- This analysis groups students into age ranges to examine the age composition of the dataset. It provides a broader view of how students are distributed across different stages of the age range represnted. --
-- The data presents that 72 students fall within 18 to 20 age group, 77 are between 21 to 23, and the remaining 51 within ages 24 to 26. --

-- 6. Which departments have the most students graduating in 2030?--
Select
	department,
	COUNT(*) AS graduating_2030
From student_information_data
Where graduation_year = 2030
GROUP BY department
ORDER BY graduating_2030 DESC;
-- This analization looks into the distribution of students expected to graduate in 2030 across academic departments. It focuses specifically on the upcoming graduating group to identify how students are distributed among the different departments --
-- Results show that both Physics and Chemistry have the largest number of students associated with the 2030 graduation year, while Biology has the least amount. The remaining two departments, Computer Science and Mathematics, fall between these three totals. --

-- 7. What are the 10 students with the highest GPA? -- 
Select
	student_id,
	name,
	department,
	gpa,
	graduation_year
From student_information_data
ORDER BY gpa DESC
LIMIT 10;
-- These results examine the students with the highest GPAs in the dataset. It provides a focused view of the students demonstrating the highest recorded levels of academic performance. --
-- Among the students with the highest GPAs, Peter Day from the Mathematics department has the highest recorded GPA at 3.99, while Vicki Lewis has the lowest of the highest GPAs at 3.90 from the Computer Science department. --