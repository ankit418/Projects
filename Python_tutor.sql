CREATE TABLE EmployeeDemographics
(EmployeeID int,
FirstName varchar(50),
LastName varchar(50),
Age int , 
Gender varchar(50) 
)

CREATE TABLE EmployeeSalary
(EmployeeID int,
JobTitle varchar(50) , 
Salary int)

Drop table EmployeeDemographics

INSERT INTO EmployeeDemographics VALUES
(1001 , 'jim' , 'Halpert',30,'Male'),
(1002, 'Pam', 'Beasley', 30, 'Female'),
(1003, 'Dwight', 'Schrute', 29, 'Male'),
(1004, 'Angela', 'Martin', 31, 'Female'),
(1005, 'Toby', 'Flenderson', 32, 'Male'),
(1006, 'Michael', 'Scott', 35, 'Male'),
(1007, 'Meredith', 'Palmer', 32, 'Female'),
(1008, 'Stanley', 'Hudson', 38, 'Male'),
(1009, 'Kevin', 'Malone', 31, 'Male')

Drop table EmployeeSalary

insert into EmployeeSalary VALUES
(1001, 'Salesman', 45000),
(1002, 'Receptionist', 36000),
(1003, 'Salesman', 63000),
(1004, 'Accountant', 47000),
(1005, 'HR', 50000),
(1006, 'Regional Manager', 65000),
(1007, 'Supplier Relations', 41000),
(1008, 'Salesman', 48000),
(1009, 'Accountant', 42000)

Select Top 5*
From Employeedemographics


Select *
From SQL_Tutorial..Employeedemographics

Select Distinct(Gender)
From SQL_Tutorial..Employeedemographics

Select count(lastname) as lastnamecount
From SQL_Tutorial..EmployeeDemographics

Select max(salary) as Maxsalary
From SQL_Tutorial..Employeesalary

Select avg(salary) as AverageSalary
From SQL_Tutorial..Employeesalary

select *
from SQL_Tutorial..employeesalary


select * -- you can access the data with this syntax even if a different database is chosen up there
from Practical_sql.dbo.class_kv

/*
'WHERE ' limits the data that you want to be returned
=,<> , <,> , And , Or , Like , Null , Not Null , In
*/

Select *
From SQL_Tutorial..Employeedemographics
where FirstName <> 'Toby' -- Select all except 'Toby'

Select *
From SQL_Tutorial..Employeedemographics
where Age > 30 AND Gender = 'Male'

Select *
From SQL_Tutorial..Employeedemographics
where Age > 30 OR Gender = 'Male'




Select *  
From SQL_Tutorial..Employeedemographics
where LastName LIKE 'S%' ---It is a wildcard , here it selects the people whose last name starts with S

Select *  
From SQL_Tutorial..Employeedemographics
where LastName LIKE '%S%' -- S is contained anywhere in the last name

Select *  
From SQL_Tutorial..Employeedemographics
where LastName LIKE '%S%o%' -- S is contained at the begining and o is contained somewhere in the text


Select *  
From Employeedemographics
where LastName is NULL


Select *  
From Employeedemographics
where LastName is NOT NULL

Select *  
From SQL_Tutorial..Employeedemographics
where FirstName IN ('Jim' , 'Michael' , 'Angela') -- Condensed way to say equal for multiple things


-- https://www.hackerrank.com/challenges/weather-observation-station-6/problem?isFullScreen=true&h_r=next-challenge&h_v=zen
-- for the strings starting with aeiou
SELECT CITY
FROM STATION
WHERE (CITY LIKE 'a%') OR (CITY LIKE 'e%') OR (CITY LIKE 'i%') OR (CITY LIKE 'o%') OR (CITY LIKE 'u%')
ORDER BY CITY

-- https://www.hackerrank.com/challenges/weather-observation-station-8/problem?isFullScreen=true&h_r=next-challenge&h_v=zen&h_r=next-challenge&h_v=zen&h_r=next-challenge&h_v=zen
SELECT CITY -- for the strings starting and ending with 'aeiou'
FROM STATION
WHERE ((CITY LIKE 'a%') OR (CITY LIKE 'e%') OR (CITY LIKE 'i%') OR (CITY LIKE 'o%') OR (CITY LIKE 'u%') ) 
AND ((CITY LIKE '%a') OR (CITY LIKE '%e') OR (CITY LIKE '%i') OR (CITY LIKE '%o') OR (CITY LIKE '%u') )
ORDER BY CITY

-- https://www.hackerrank.com/challenges/weather-observation-station-9/problem?isFullScreen=true&h_r=next-challenge&h_v=zen&h_r=next-challenge&h_v=zen&h_r=next-challenge&h_v=zen&h_r=next-challenge&h_v=zen
SELECT DISTINCT(CITY) -- strings not starting with 'aeiou'
FROM STATION
WHERE (CITY NOT LIKE 'a%') AND (CITY NOT LIKE 'e%') AND (CITY NOT LIKE 'i%') AND (CITY NOT LIKE 'o%') 
AND (CITY NOT LIKE 'u%')

-- https://www.hackerrank.com/challenges/more-than-75-marks/problem?isFullScreen=true&h_r=next-challenge&h_v=zen&h_r=next-challenge&h_v=zen

SELECT Name -- Marks > 75 , Order your output by the last three characters of each name. If two or more students both have 
-- names ending in the same last three characters (i.e.: Bobby, Robby, etc.), secondary sort them by ascending ID.
FROM STUDENTS
WHERE Marks>75 
ORDER BY RIGHT(Name,3) ASC, ID ASC ; -- RIGHT(column , x) to select x Str_length from the right.
-- primary and secondary sort

https://www.hackerrank.com/challenges/revising-aggregations-sum/problem?isFullScreen=true&h_r=next-challenge&h_v=zen&h_r=next-challenge&h_v=zen&h_r=next-challenge&h_v=zen&h_r=next-challenge&h_v=zen&h_r=next-challenge&h_v=zen

select sum(POPULATION) -- To sum-up all the values in the column(population) for distirct california
from CITY
where DISTRICT = 'california'


-- CEILING() function returns the smallest integer value that is larger than or equal to a number.
-- FLOOR() function returns the largest integer value that is smaller than or equal to a number.

select ceiling(40.6)
select floor(40.6)

https://www.hackerrank.com/challenges/the-blunder/problem?isFullScreen=true&h_r=next-challenge&h_v=zen&h_r=next-challenge&h_v=zen&h_r=next-challenge&h_v=zen&h_r=next-challenge&h_v=zen&h_r=next-challenge&h_v=zen&h_r=next-challenge&h_v=zen&h_r=next-challenge&h_v=zen&h_r=next-challenge&h_v=zen&h_r=next-challenge&h_v=zen&h_r=next-challenge&h_v=zen

SELECT CAST(CEILING(AVG(CAST(SALARY AS FLOAT(10))) - AVG(CAST((REPLACE(SALARY,0,'')) AS FLOAT(10)))) AS INT) 
FROM EMPLOYEES -- replace function is used here to replace all 0's in SALARY column with ''(i.e-nothing) or in other words 0 is removed.

https://www.hackerrank.com/challenges/earnings-of-employees/problem?isFullScreen=true&h_r=next-challenge&h_v=zen&h_r=next-challenge&h_v=zen&h_r=next-challenge&h_v=zen&h_r=next-challenge&h_v=zen&h_r=next-challenge&h_v=zen&h_r=next-challenge&h_v=zen&h_r=next-challenge&h_v=zen&h_r=next-challenge&h_v=zen&h_r=next-challenge&h_v=zen&h_r=next-challenge&h_v=zen&h_r=next-challenge&h_v=zen
-- find the maximum total earnings for all employees as well as the total number of employees who have maximum total earnings.
select TOP 1 max(months * salary),count(employee_id) -- Only the top cell will be shown
from employee 
group by (months * salary) -- it groups all the value , i.e a number will be shown for total number of individual who have this maximum earning.   
order by (months * salary) desc

https://www.hackerrank.com/challenges/weather-observation-station-2/problem?isFullScreen=true&h_r=next-challenge&h_v=zen&h_r=next-challenge&h_v=zen&h_r=next-challenge&h_v=zen&h_r=next-challenge&h_v=zen&h_r=next-challenge&h_v=zen&h_r=next-challenge&h_v=zen&h_r=next-challenge&h_v=zen&h_r=next-challenge&h_v=zen&h_r=next-challenge&h_v=zen&h_r=next-challenge&h_v=zen&h_r=next-challenge&h_v=zen&h_r=next-challenge&h_v=zen

select cast(sum(LAT_N) as decimal(10,2)) , cast (sum(LONG_W) as decimal(10,2))
from STATION

https://www.hackerrank.com/challenges/weather-observation-station-15/problem?isFullScreen=true&h_r=next-challenge&h_v=zen&h_r=next-challenge&h_v=zen&h_r=next-challenge&h_v=zen&h_r=next-challenge&h_v=zen&h_r=next-challenge&h_v=zen&h_r=next-challenge&h_v=zen&h_r=next-challenge&h_v=zen&h_r=next-challenge&h_v=zen&h_r=next-challenge&h_v=zen&h_r=next-challenge&h_v=zen&h_r=next-challenge&h_v=zen&h_r=next-challenge&h_v=zen&h_r=next-challenge&h_v=zen&h_r=next-challenge&h_v=zen&h_r=next-challenge&h_v=zen
SELECT TOP 1 CAST((LONG_W) AS DECIMAL(7,4)) 
FROM station WHERE LAT_N < 137.2345 
ORDER BY LAT_N DESC -- TOP 1 + ORDER BY can help to obtain the required value in some cases

https://www.hackerrank.com/challenges/what-type-of-triangle/problem?isFullScreen=true

SELECT 
    CASE    WHEN ((A+B)<=C OR (A+C)<=B OR (B+C)<=A) THEN 'Not A Triangle'
            WHEN (A=B AND B=C ) THEN 'Equilateral'
            WHEN (A!=B AND B!=C AND A!=C) THEN 'Scalene'
            WHEN ((A=B AND A!=C) OR (B=C AND B!=A) OR (A=C AND A!=B))THEN 'Isosceles' 
			END
    FROM TRIANGLES;

https://www.hackerrank.com/challenges/draw-the-triangle-1/problem?isFullScreen=true

DECLARE @i int; -- The variable must be suffixed by @
set @i=20;

WHILE @i>0 begin print replicate('* ',@i) set @i=@i-1; end; -- replicate function for replicating a pattern

https://www.hackerrank.com/challenges/weather-observation-station-19/problem?isFullScreen=true

select cast (sqrt( power((max(LAT_N) - min(LAT_N)),2) + power((max(LONG_W) - min(LONG_W)),2 )) as decimal(10,4))
from STATION -- for power and sqrt--- power() and sqrt() are used.

https://www.hackerrank.com/challenges/weather-observation-station-20/problem?isFullScreen=true

-- Median calculation
SELECT TOP 1 CAST(half.lat_n AS DECIMAL(18,4)) -- 'half' is utilized well here , to get the answer
FROM (SELECT TOP 50 PERCENT lat_n FROM station ORDER BY lat_n ASC) as half
ORDER BY lat_n DESC -- The top 50 - 30 etc. percent can be easily selected like this
-- In the above qn , first the top 50% of ascending data is taken , than it is inverted to get the top 1 ( or MEDIAN)

https://www.hackerrank.com/challenges/asian-population/problem?isFullScreen=true

select sum(c.population) -- In this Qn , you have to define that which population you are referring to ( as both columns are having the population)
from CITY c
Full Outer join COUNTRY cr on c.COUNTRYCODE = cr.CODE
where CONTINENT = 'asia';

https://www.hackerrank.com/challenges/african-cities/problem?isFullScreen=true
select c.NAME
from CITY c 
full outer join COUNTRY cr on c.CountryCode = cr.Code
where CONTINENT = 'Africa' and c.NAME is not NULL; -- If output contains NULL values , remove them like this.
https://www.hackerrank.com/challenges/average-population-of-each-continent/problem?isFullScreen=true
select cr.continent , avg(c.population)-- you have to tell sql ,if you want sum ,avg etc. of the column with integer/float values.
from CITY c 
full outer join COUNTRY cr on c.CountryCode = cr.Code
where cr.continent is not null and c.population is not  null -- Great way of removing null values
group by cr.continent
https://www.hackerrank.com/challenges/the-report/problem?isFullScreen=true

Select 
case 
   when GRADE<8 then 'NULL' else name 
   end, GRADE, Marks as MArk -- ***only inner join will work here because required values exist only at intersection , more than required values--> wrong answer
from Students INNER JOIN Grades ON Students.Marks BETWEEN Grades.Min_Mark AND Grades.Max_MArk 
ORDER BY GRADE DESC, name; -- In 'ON' part , instead of equal to -> Between is used( which defines the limit within which it could exist)

https://www.hackerrank.com/challenges/full-score/problem?isFullScreen=true
SELECT su.hacker_id, ha.name  -- Here multiple tables are present , you can see how connection is formed between them by multiple 'on' statement. 
FROM submissions su INNER JOIN challenges ch ON su.challenge_id = ch.challenge_id INNER JOIN difficulty di ON ch.difficulty_level = di.difficulty_level INNER JOIN hackers ha ON su.hacker_id = ha.hacker_id 
WHERE su.score = di.score -- great qn do it again
GROUP BY su.hacker_id, ha.name 
HAVING COUNT(su.hacker_id) > 1 
ORDER BY COUNT(su.hacker_id) DESC, su.hacker_id ASC;

https://www.hackerrank.com/challenges/print-prime-numbers/problem?isFullScreen=true

declare @a int, @b int, @res varchar(4000)
set @a = 3
set @b = 2
set @res = '2'
while @a < = 1000 -- learn while loop and if loop better
begin
    while @b < @a
    begin
        if @a%@b = 0
        break
        set @b = @b + 1
    end
    if @a = @b
    begin
        set @res = @res +'&'+cast(@a as nvarchar(max)) -- What is nvarchar(max) ?
    end
    set @a = @a + 1
    set @b = 2
end
select @res

https://www.hackerrank.com/challenges/placements/problem?isFullScreen=true

select s.name from students s
inner join friends f on f.id=s.id
inner join packages p on p.id=s.id
inner join packages p2 on p2.id=f.friend_id -- ** The salary values in p2 are in order of the freind_id , or in other words it shows the freinds salary
where p2.salary>p.salary -- p2 is having the freinds salary in it
order by p2.salary

/*
MATH - power() , sqrt()
*/


SELECT POWER(4, 2);

/*

Group By , Order By

*/


SELECT  Gender , Count(Age)-- output shows that there are 4 females , you can keep any column name inside the count bracket it will show same value. 
FROM EmployeeDemographics
GROUP BY Gender -- Group by will group or roll up all the similar values

SELECT Gender ,Age, COUNT(Gender) -- Count(gender) is a derieved column , not a actual column in database
FROM EmployeeDemographics
GROUP BY Gender,Age -- only actual columns are required here


SELECT Gender ,Age, COUNT(Gender) -- Count(gender) is a derieved column , not a actual column in database
FROM EmployeeDemographics
WHERE Age >31
GROUP BY Gender,Age 

SELECT Gender ,COUNT(Gender) AS CountGender
FROM EmployeeDemographics
WHERE Age >31
GROUP BY Gender
ORDER BY CountGender ASC

Select *  
From Employeedemographics
ORDER BY Age DESC , Gender DESC -- ASC or DESC in string is as per the alphabatical order of first alphabet


Select *  
From Employeedemographics -- Column numbers can also be used Directly
ORDER BY 4 ASC


---------------------------------------

--Intermediate

---------------------------------------

/*
Inner Joins , Full/Left/Right Outer Joins

-- combining multiple tables into a single output
*/


Insert into SQL_Tutorial.dbo.EmployeeDemographics VALUES
(1011, 'Ryan', 'Howard', 26, 'Male'),
(NULL, 'Holly', 'Flax', NULL, NULL),
(1013, 'Darryl', 'Philbin', NULL, 'Male')

Select *
From EmployeeDemographics
ORDER BY EmployeeID ASC

DROP Table EmployeeDemographics



Create Table WareHouseEmployeeDemographics 
(EmployeeID int, 
FirstName varchar(50), 
LastName varchar(50), 
Age int, 
Gender varchar(50)
)

Insert into WareHouseEmployeeDemographics VALUES
(1013, 'Darryl', 'Philbin', NULL, 'Male'),
(1050, 'Roy', 'Anderson', 31, 'Male'),
(1051, 'Hidetoshi', 'Hasagawa', 40, 'Male'),
(1052, 'Val', 'Johnson', 31, 'Female')


Select *
From SQL_Tutorial.dbo.Employeedemographics
Inner join SQL_Tutorial.dbo.EmployeeSalary
ON EmployeeDemographics.EmployeeID = EmployeeSalary.EmployeeID -- Here we are only seeing things that are same , based on the EmployeeID


Select *
From SQL_Tutorial.dbo.Employeedemographics
Full Outer join SQL_Tutorial.dbo.EmployeeSalary
ON EmployeeDemographics.EmployeeID = EmployeeSalary.EmployeeID

Select *
From SQL_Tutorial.dbo.Employeedemographics
Left Outer join SQL_Tutorial.dbo.EmployeeSalary
ON EmployeeDemographics.EmployeeID = EmployeeSalary.EmployeeID

Select *
From SQL_Tutorial.dbo.Employeedemographics
Right Outer join SQL_Tutorial.dbo.EmployeeSalary
ON EmployeeDemographics.EmployeeID = EmployeeSalary.EmployeeID


Select EmployeeDemographics.EmployeeID , FirstName,LastName, JobTitle,Salary -- If we are not putting EmployeeDemographics.EmployeeID . than SQL will be confused on which table's EmployeeID to pick(Thus Error) . So we must specify it.
From SQL_Tutorial.dbo.Employeedemographics
Inner join SQL_Tutorial.dbo.EmployeeSalary
ON EmployeeDemographics.EmployeeID = EmployeeSalary.EmployeeID

Select EmployeeDemographics.EmployeeID , FirstName,LastName, JobTitle,Salary
From SQL_Tutorial.dbo.Employeedemographics
Left Outer join SQL_Tutorial.dbo.EmployeeSalary
ON EmployeeDemographics.EmployeeID = EmployeeSalary.EmployeeID

Select EmployeeDemographics.EmployeeID , FirstName,LastName, Salary
From SQL_Tutorial.dbo.Employeedemographics
Inner join SQL_Tutorial.dbo.EmployeeSalary
ON EmployeeDemographics.EmployeeID = EmployeeSalary.EmployeeID
WHERE FirstName <> 'Michael'
ORDER BY Salary DESC


Select Jobtitle , Salary
From SQL_Tutorial.dbo.Employeedemographics
Inner join SQL_Tutorial.dbo.EmployeeSalary
ON EmployeeDemographics.EmployeeID = EmployeeSalary.EmployeeID
WHERE JobTitle = 'Salesman'

Select Jobtitle , AVG(Salary)
From SQL_Tutorial.dbo.Employeedemographics
Inner join SQL_Tutorial.dbo.EmployeeSalary
ON EmployeeDemographics.EmployeeID = EmployeeSalary.EmployeeID
WHERE JobTitle = 'Salesman'
GROUP BY Jobtitle

/*
Union , Union All
(Unions are like joins , as here also two tables are combined to produce one output)
*/


Select *
From SQL_Tutorial.dbo.Employeedemographics
Full Outer join SQL_Tutorial.dbo.WareHouseEmployeeDemographics
ON EmployeeDemographics.EmployeeID = WareHouseEmployeeDemographics.EmployeeID

-- In the above database , the union will help to stick the right side data under left-side data

Select *
From SQL_Tutorial.dbo.EmployeeDemographics
--Run two of these together and you will see that they have exactly same number of columns ,  so it would be super-easy to stick both of them together
Select *
From SQL_Tutorial.dbo.WareHouseEmployeeDemographics


Select *
From SQL_Tutorial.dbo.EmployeeDemographics
UNION -- It avoids the duplicates
Select *
From SQL_Tutorial.dbo.WareHouseEmployeeDemographics


Select *
From SQL_Tutorial.dbo.EmployeeDemographics
UNION ALL -- Includes all no matter if they are duplicates or not
Select *-- In the output you can see the 'Darryl Philbean' is there twice(as it is available in both tables)
From SQL_Tutorial.dbo.WareHouseEmployeeDemographics
Order by EmployeeID

Select *
From SQL_Tutorial.dbo.EmployeeDemographics
-- Run both together , see what kind of command can be applied
Select *
From SQL_Tutorial.dbo.EmployeeSalary
ORDER BY EmployeeID


Select EmployeeID , FirstName , Age
From SQL_Tutorial.dbo.EmployeeDemographics
UNION -- It will work because The columns have string and int value in similar fashion . but this is not something you want to do , because age cannot be 45000 and name cannot be salesman
Select EmployeeID , JobTitle , Salary
From SQL_Tutorial.dbo.EmployeeSalary
ORDER BY EmployeeID

/*
Case statement
*/

Select FirstName , LastName , Age,
CASE
   WHEN  Age > 30 THEN 'Old'
   WHEN Age BETWEEN 27 And 30 THEN 'Young'
   ELSE 'Baby'
END
From SQL_tutorial.dbo.EmployeeDemographics
Where Age > 25
ORDER BY Age ASC

select *
from employeedemographics

Select FirstName , LastName , Age,
CASE -- case is like a column only
   --WHEN Age = 38 THEN 'Stanley'
   WHEN  Age > 30 THEN 'Old'-- WHEN - THEN is like 'if' statements in python , only difference is that , here 'ELSE' statement also runs no matter what
   WHEN Age = 38 THEN 'Stanley'--If condition is already met , than conditions after it will not return , try changing order of this WHEN Statement above the first WHEN statement
   ELSE 'Baby'
END
From SQL_tutorial.dbo.EmployeeDemographics
Where Age is NOT NULL
ORDER BY Age

SELECT *
FROM SQL_Tutorial.dbo.EmployeeDemographics
JOIN SQL_Tutorial.dbo.EmployeeSalary
   ON EmployeeDemographics.EmployeeID = EmployeeSalary.EmployeeID

SELECT FirstName,LastName , JobTitle , Salary,
CASE
    WHEN JobTitle = 'Salesman' THEN Salary + (Salary * .10)
	WHEN JobTitle = 'Accountant' THEN Salary + (Salary * .05)
	WHEN JobTitle = 'HR' THEN Salary + (Salary * .000001)
	ELSE Salary + (Salary * .03)
END AS SalaryAfterRaise
FROM SQL_Tutorial.dbo.EmployeeDemographics
JOIN SQL_Tutorial.dbo.EmployeeSalary
   ON EmployeeDemographics.EmployeeID = EmployeeSalary.EmployeeID

/*
Having Clause
*/

SELECT JobTitle , COUNT(JobTitle)
FROM SQL_Tutorial.dbo.EmployeeDemographics
JOIN SQL_Tutorial.dbo.EmployeeSalary
    ON EmployeeDemographics.EmployeeID = EmployeeSalary.EmployeeID
GROUP BY JobTitle

SELECT JobTitle , COUNT(JobTitle)
FROM SQL_Tutorial.dbo.EmployeeDemographics
JOIN SQL_Tutorial.dbo.EmployeeSalary
    ON EmployeeDemographics.EmployeeID = EmployeeSalary.EmployeeID -- Read the Error
GROUP BY JobTitle
WHERE COUNT(JobTitle) > 1


SELECT JobTitle , COUNT(JobTitle)
FROM SQL_Tutorial.dbo.EmployeeDemographics
JOIN SQL_Tutorial.dbo.EmployeeSalary
    ON EmployeeDemographics.EmployeeID = EmployeeSalary.EmployeeID -- Read the Error
HAVING COUNT(JobTitle) > 1 
GROUP BY JobTitle -- HAVING must come after this is aggregated by the GROUPBY statement

SELECT JobTitle , COUNT(JobTitle)
FROM SQL_Tutorial.dbo.EmployeeDemographics
JOIN SQL_Tutorial.dbo.EmployeeSalary
    ON EmployeeDemographics.EmployeeID = EmployeeSalary.EmployeeID 
GROUP BY JobTitle
HAVING COUNT(JobTitle) > 1    -- We can only look at the info' , once it is aggregated by GROUPBY statement

SELECT JobTitle , AVG(Salary)
FROM SQL_Tutorial.dbo.EmployeeDemographics
JOIN SQL_Tutorial.dbo.EmployeeSalary
    ON EmployeeDemographics.EmployeeID = EmployeeSalary.EmployeeID
GROUP BY JobTitle
HAVING AVG(Salary) > 45000
ORDER BY AVG(Salary)

/*
Updating Data - will update the existing data
Deleting Data - will delete the existing data
*/

SELECT *
FROM SQL_Tutorial.dbo.EmployeeDemographics

UPDATE SQL_Tutorial.dbo.EmployeeDemographics
SET EmployeeID = NULL      -- you can again write NULL here
WHERE FirstName = 'Holly' AND LastName = 'Flax'

UPDATE SQL_Tutorial.dbo.EmployeeDemographics
SET Age = 31 , Gender = 'Female'
WHERE FirstName = 'Holly' AND LastName = 'Flax'

DELETE FROM SQL_Tutorial.dbo.EmployeeDemographics -- It cannot be Reversed. So be very careful
WHERE EmployeeID = 1005

SELECT *
FROM SQL_Tutorial.dbo.EmployeeDemographics -- With this statement you can what exactly you will be deleting , Therefore you can avoid Mistakes
WHERE EmployeeID = 1004


/*

Aliasing

*/


Select FirstName + ' ' + LastName AS FullName
FROM SQL_Tutorial.dbo.EmployeeDemographics

Select Avg(Age) AS AvgAge
FROM SQL_Tutorial.dbo.EmployeeDemographics

Select Demo.EmployeeID , Sal.Salary
FROM SQL_Tutorial.dbo.EmployeeDemographics AS Demo
JOIN SQL_Tutorial.dbo.EmployeeSalary AS Sal
 ON Demo.EmployeeID = Sal.EmployeeID

 /*
 Partition By
 */

 Select *
 FROM SQL_Tutorial..EmployeeDemographics

 Select *
 FROM SQL_Tutorial..EmployeeSalary

 Select *
 FROM SQL_Tutorial..EmployeeDemographics dem
 JOIN SQL_Tutorial..EmployeeSalary sal
   ON dem.EmployeeID = sal.EmployeeID

Select FirstName , LastName , Gender , Salary
 , COUNT(Gender) OVER (PARTITION BY Gender) as TotalGender -- Parition by is differnt from GROUP BY because unlike GROUP BY, it does not reduce the number of rows  
FROM SQL_Tutorial..EmployeeDemographics dem -- Just one space acts as a 'AS' or alias
 JOIN SQL_Tutorial..EmployeeSalary sal
   ON dem.EmployeeID = sal.EmployeeID -- Output should be read like - Pam beasley earns 36k , and there are 3 females working with her

 Select Gender , COUNT(Gender) 
 FROM SQL_Tutorial..EmployeeDemographics dem -- Just one space acts as a 'AS' or alias
 JOIN SQL_Tutorial..EmployeeSalary sal
   ON dem.EmployeeID = sal.EmployeeID
GROUP BY Gender


/*
CTEs
*/
-- CTE = common table expression , it is used to reduce the complex subquery data
WITH CTE_Employee as 
(SELECT FirstName , LastName , Gender , Salary
, COUNT(gender) OVER (PARTITION BY Gender) as TotalGender
, AVG(Salary) OVER (PARTITION BY Gender) as AvgSalary
FROM SQL_Tutorial..EmployeeDemographics emp
JOIN SQL_Tutorial..EmployeeSalary sal
  ON emp.EmployeeID = sal.EmployeeID
WHERE Salary > '45000'
) -- Not stored anywhere , so you have to run the whole thing

Select AvgSalary -- Here you can just query what you want , the CTE will do all the heavy lifting
FROM CTE_Employee


/*
Temp Tables
*/

CREATE TABLE #Temp_Employee (
EmployeeID int ,
JobTitle varchar(100),
Salary int
)

Select *
FROM #temp_Employee

INSERT INTO #temp_Employee VALUES (
'1001' , 'HR' , '45000'
)

INSERT INTO #temp_Employee
SELECT *
FROM SQL_Tutorial..EmployeeSalary --It takes all the data from employeesalary and stick it in temp_employee



CREATE TABLE #Temp_Employee2(
JobTitle varchar(50) , 
EmployeesPerJob int , 
AvgAge int ,
AvgSalary int )

INSERT INTO #Temp_Employee2
SELECT JobTitle , Count(JobTitle) , Avg(Age), AVG(Salary)
FROM SQL_Tutorial..EmployeeDemographics emp
JOIN SQL_Tutorial..EmployeeSalary sal
  ON emp.EmployeeID = sal.EmployeeID
Group by JobTitle

SELECT *
FROM #Temp_Employee2


CREATE TABLE #Temp_Employee2(
JobTitle varchar(50) , 
EmployeesPerJob int , 
AvgAge int ,
AvgSalary int )

INSERT INTO #Temp_Employee2
SELECT JobTitle , Count(JobTitle) , Avg(Age), AVG(Salary)
FROM SQL_Tutorial..EmployeeDemographics emp
JOIN SQL_Tutorial..EmployeeSalary sal
  ON emp.EmployeeID = sal.EmployeeID
Group by JobTitle

SELECT *
FROM #Temp_Employee2

DROP TABLE #Temp_Employee2

/*
String Functions - TRIM , LTRIM , RTRIM , Replace , Substring , Upper, Lower
*/

CREATE TABLE EmployeeErrors (
EmployeeID varchar(50)
,FirstName varchar(50)
,LastName varchar(50)
)

Insert into EmployeeErrors Values
('1001  ' , 'Jimbo' , 'Halbert')
,('  1002' , 'Pamela' , 'Beasely')
,('1005' , 'TOby' , 'Flenderson-Fired')

Select *
From EmployeeErrors

DROP TABLE EmployeeErrors

-- using Trim , Ltrim , Rtrim

Select EmployeeID , TRIM(EmployeeID) as IDTRIM
FROM EmployeeErrors

Select EmployeeID , LTRIM(EmployeeID) as IDTRIM
FROM EmployeeErrors

Select EmployeeID , RTRIM(EmployeeID) as IDTRIM
FROM EmployeeErrors

-- Using Replace
Select LastName , REPLACE(LastName , '-Fired','') as LastNameFixed -- Replace( column name , Current value , Final value)
FROM EmployeeErrors

-- Using UPPER and lower
Select SUBSTRING(FirstName,2,3) -- SUBSTRING(Column name , Starting , Length)
FROM EmployeeErrors

Select SUBSTRING(FirstName , 2,3) -- SUBSTRING(Column name , Starting , Length)
FROM EmployeeErrors

Select err.FirstName , dem.FirstName 
FROM EmployeeErrors err
JOIN EmployeeDemographics dem
    ON err.FirstName = dem.FirstName -- Only one will match in this one

Select SUBSTRING(err.FirstName , 1,3) , SUBSTRING(dem.FirstName , 1,3) 
FROM EmployeeErrors err
JOIN EmployeeDemographics dem
    ON SUBSTRING(err.FirstName , 1,3) = SUBSTRING(dem.FirstName, 1,3)--Fuzzy Matching

	-- The below code shows the complete names of output of code above

 Select err.FirstName , SUBSTRING(err.FirstName , 1,3) , dem.FirstName , SUBSTRING(dem.FirstName , 1,3) 
FROM EmployeeErrors err
JOIN EmployeeDemographics dem
    ON SUBSTRING(err.FirstName , 1,3) = SUBSTRING(dem.FirstName, 1,3)

--Genrally fuzzy match is done on things shown below -
--Gender
--Lastname
--Age
--DOB 

-- Using UPPER and lower

Select FirstName , LOWER(FirstName)
FROM EmployeeErrors

Select FirstName , UPPER(FirstName)
FROM EmployeeErrors


/*
Stored Procedures - A stored procedure is SQL statements that are created and stored in the database.
It can be used over the network by several different users , using different input data . 
It reduce network traffic and increase the performance
*/

CREATE PROCEDURE TEST
AS
Select *
From EmployeeDemographics -- after executing , you can go and check it in SQL_Tutorial > Programmability > Storage Procedure


EXEC TEST -- Run this to view

CREATE PROCEDURE Temp_Employee
AS 
Create table #temp_employee( -- temp table is getting inserted to stored procedure
JobTitle varchar(100),
EmployeesPerJob int , 
AvgAge int , 
AvgSalary int
)

INSERT INTO #Temp_Employee
SELECT JobTitle , Count(JobTitle) , Avg(Age), AVG(Salary)
FROM SQL_Tutorial..EmployeeDemographics emp
JOIN SQL_Tutorial..EmployeeSalary sal
  ON emp.EmployeeID = sal.EmployeeID
Group by JobTitle

Select *
From #temp_employee


EXEC Temp_Employee @JobTitle = 'Salesman' -- This is a parameter , it is put in the db.Temp_employee in the stored procedure


/*
Subqueries( in the Select , From , and Where Statement)
*/

Select *
From EmployeeSalary

-- Subquery in Select

Select EmployeeID , Salary, (Select AVG(Salary) From EmployeeSalary) as AllAvgSalary
From EmployeeSalary

--How to do it with Partition By
Select EmployeeID , Salary, AVG(Salary) over() as AllAvgSalary
From EmployeeSalary

--Why Group By doesn't work

Select EmployeeID , Salary, AVG(Salary) over() as AllAvgSalary
From EmployeeSalary
Group By EmployeeID , Salary
Order By 1,2

--Subquery in From

Select a.EmployeeID , AllAvgSalary
From (Select EmployeeID , Salary, AVG(Salary) over() as AllAvgSalary
      From EmployeeSalary) a

--Subquery in Where

Select EmployeeID , JobTitle , Salary
From EmployeeSalary
Where EmployeeID in (
       Select EmployeeID
	   From EmployeeDemographics
	   Where Age > 30)

CREATE TABLE NUMBER(
SNO INT , VALU INT
)

INSERT INTO NUMBER VALUES
(1 , 4),
(2 , 6),
(3 , 8),
(4,10)

SELECT *
FROM NUMBER

-- https://www.hackerrank.com/challenges/weather-observation-station-5/problem?isFullScreen=true
SELECT TOP(1) CITY, LEN(CITY) FROM STATION ORDER BY LEN(CITY), CITY 
SELECT TOP(1) CITY, LEN(CITY) FROM STATION ORDER BY LEN(CITY) DESC, CITY;
-- LEN()

