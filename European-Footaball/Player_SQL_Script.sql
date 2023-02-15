--In this analysis , I will be using the SQL to pull, manipulate and sort data. In order to get useful insights from the dataset.
--The analysis is compiled into a QnA format.

-- About Dataset:
-- Two seperate dataset of 'English' and 'Non-English' Football players are used in this analysis. 
-- Both of the datasets contain informations , such as - Nationality, joining year , Height , Weight etc. of players. 

--Q Display Both Datasets,together.

select *
from English_Players
select *
from Non_English_Players


--Q Display the union of datasets.
select *
from English_Players
Union all
select *
from Non_English_Players

-- Q - Find the maximum height and maximum weight.

select max(h.Height) as Max_Height , max(h.Weight) as Max_weight
from  (select *
from English_Players
Union all
select *
from Non_English_Players) as h

-- Q - Find the median weight.

WITH CTE_Employee as (select *
from English_Players
Union all
select *
from Non_English_Players)

SELECT TOP 1 CAST(half.Weight AS decimal(10,2)) as Median_height 
FROM (SELECT TOP 50 PERCENT Weight FROM CTE_Employee ORDER BY Weight ASC) as half
ORDER BY Weight DESC

-- Q Display the number of player joined in each month , in ascending order.

select  DATENAME (MONTH,o.Joined) month_name , count(DATENAME (MONTH,o.Joined)) AS Number_of_athletes_joined
from English_Players o
where joined is  not null
group by DATENAME (MONTH,o.Joined)
order by count(DATENAME (MONTH,o.Joined)) ASC

-- Q Display the country's name, along with number of player from that country , in descending order.

WITH CTE_Employee as (select * 
from English_Players
Union all
select *
from Non_English_Players)

SELECT  distinct(c.Nationality) , count(c.Nationality) as Number_of_players
FROM  CTE_Employee as c
group by c.Nationality
ORDER BY count(c.Nationality) DESC , c.Nationality DESC


-- Q Find the total number of countries available in both datasets , combined.

SELECT  count(distinct(c.Nationality)) as Total_Number_of_Countries
FROM  (select *
from English_Players
Union all
select *
from Non_English_Players) as c


-- Q find the Total number of players with 'Normal' Body type.

SELECT  count(c.[Body Type]) as Normal_Body_Type
FROM  (select *
from English_Players
Union all
select *
from Non_English_Players) as c
where c.[Body Type] = 'Normal'

-- Q Display the country name along with its total number of players with 'Lean' Body type, in desceding order.

SELECT  distinct(c.Nationality) as Country, count(c.[Body Type]) as Number_of_players
FROM  (select *
from English_Players
Union all
select *
from Non_English_Players) as c
where c.[Body Type] = 'Lean'
Group by c.Nationality
Order by count(c.[Body Type]) DESC


-- Q Find the number of players in each country with less than 150 lb weight.Label the team with 5 or less players under 150lb as 'Heavy team' , otherwise 'Normal Team'. 

SELECT  distinct(c.Nationality),count(c.weight) as Normal_Body_Type , CASE
   WHEN  count(c.weight) <=5 THEN 'Heavy Team'
   Else 'Normal Team'
END as Team_Label
FROM  (select *
from English_Players
Union all
select *
from Non_English_Players) as c
where c.Weight < 150
Group by c.Nationality
Order by count(c.[Weight]) DESC

-- Q Find out the Number of player who prefer 'Right' Vs Those who prefet 'Left' foot.

SELECT  c.[Preferred Foot],count(c.[Preferred Foot]) as Number_of_Players
FROM  (select *
from English_Players
Union all
select *
from Non_English_Players) as c
Where c.[Preferred Foot] is not null
Group by c.[Preferred Foot]
Order by count(c.[Preferred Foot]) DESC

-- Q Display the number of players in each country with even jersey number , in desceding order.

select distinct(c.Nationality) , count(c.[Jersey Number])
FROM  (select *
from English_Players
Union all
select *
from Non_English_Players) as c
where c.[Jersey Number]%2 = 0
group by c.Nationality
order by count(c.[Jersey Number]) desc


-- Q Days on which maximum number of player joined , in decending order . If same number of players joined on two seperate days than order by day.

select  DATENAME (DAY,o.Joined) AS Day ,  count(DATENAME (DAY,o.Joined)) AS Number_of_athletes_joined
from English_Players o
where joined is  not null
group by DATENAME (DAY,o.Joined)
order by count(DATENAME (Day,o.Joined)) DESC , DATENAME (DAY,o.Joined)

-- Q Display Position-wise distribution of the dataset.

select c.Position , count(c.Position) as number_of_players
FROM  (select *
from English_Players
Union all
select *
from Non_English_Players) as c
where c.Position is not null
group by c.Position

-- Q Display the Players , Whose names start with vowels.

select c.name
FROM  (select *
from English_Players
Union all
select *
from Non_English_Players) as c
where (name like 'a%') or (name like 'e%') or (name like 'i%') or (name like 'o%') or (name like 'u%')

-- Q Display the Players , Whose names starting and ending with vowels.

select c.name
FROM  (select *
from English_Players
Union all
select *
from Non_English_Players) as c
where ((name like 'a%') or (name like 'e%') or (name like 'i%') or (name like 'o%') or (name like 'u%')) 
and ((name like '%a') or (name like '%e') or (name like '%i') or (name like '%o') or (name like '%u'))

--Q Display average weight of players , country-wise.

select c.nationality , cast ( avg(c.weight) as decimal(10,2)) as Average_weight 
FROM  (select * 
from English_Players
Union all
select *
from Non_English_Players) as c
where c.nationality is not null
group by c.nationality


-- Q Find the Lightest player along with the country he belongs.
select top 1 c.nationality, min(c.weight) as Lightest_weight
FROM  (select *
from English_Players
Union all
select *
from Non_English_Players) as c
where c.weight is not null
group by c.Nationality
order by min(c.weight)

-- Q Display the new average weight of players , country-wise. If all the zeros are removed from weight values.

select c.nationality , avg(cast((replace(c.weight,0,'')) as float(10))) as Average_weight
FROM  (select * 
from English_Players
Union all
select *
from Non_English_Players) as c
where c.nationality is not null
group by c.nationality

-- Q Display the names in alphabetical order, based on the last letter of names.
select c.name
FROM  (select *
from English_Players
Union all
select *
from Non_English_Players) as c
order by right(name , 1)


-- Q List the names of player with joining date , In ascending order.

select c.name , c.joined
FROM  (select *
from English_Players
Union all
select *
from Non_English_Players) as c
where c.joined is not null
order by datename(YEAR, c.joined) , datename(DAYOFYEAR, c.joined)


