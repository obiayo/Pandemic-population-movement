
select * from dbo.county

--Separate the states from the county
select * from dbo.county where Federal_Information_Processing_Standards_Code % 1000=0


--Create new table for the states
select * into US_States from dbo.county where Federal_Information_Processing_Standards_Code % 1000=0

--Top 15 largest county in the country in 1990
select  top(15) AreaName as County,State, population1990 
from dbo.county
order by population1990 desc

select  top(15) AreaName as County,State, population2000 
from dbo.county
order by population2000 desc

select  top(15) AreaName as County,State, population2010
from dbo.county
order by population2010 desc

select  top(15) AreaName as County,State, population2020
from dbo.county
order by population2020 desc

select  top(15) AreaName as County,State, population2021
from dbo.county
order by population2021 desc

--Smallest county in the US
select top (15) AreaName as County,State, population1990 
from dbo.county
where Population1990 is not null
order by population1990 asc 

select  top(15) AreaName as County,State, population2020
from dbo.county
order by population2020 asc

select  top(15) AreaName as County,State, population2021 
from dbo.county
where Population2021 is not null
order by population2021 asc



--County Population movement during the pandemic, where they moved to
select top(15)AreaName as County, State, Population2020, Population2021, Population2021-Population2020 as Moved_To
from dbo.county
where Population2021 is not null
order by Moved_To desc


--County Population movement during the pandemic, where they moved away from
select top(15)AreaName as County, State, Population2020, Population2021, Population2021-Population2020 as Moved_Away
from dbo.county
where Population2021 is not null
order by Moved_Away asc


--Confirm new table has been created called US_States, this is only the states population
select * from US_States

--State Population movement during the pandemic, where they moved to
select top(15) AreaName as State, Population2020, Population2021, Population2021-Population2020 as Moved_To
from US_States
where Population2021 is not null
order by Moved_To desc

--State Population movement during the pandemic, where they moved away from
select top(15) AreaName as State, Population2020, Population2021, Population2021-Population2020 as Moved_Away
from US_States
where Population2021 is not null
order by Moved_Away asc


--Delete states from main table
delete from dbo.county where Federal_Information_Processing_Standards_Code % 1000=0

--Delete the USA population numbers
delete from dbo.US_States where Federal_Information_Processing_Standards_Code = 0000


--Population numbers from top 15 highest state to lowest state creating new table for each year

select Top(15)AreaName as State, Population2000 into Ttop15_2000
from US_States
order by Population2000 desc, AreaName

select * from Ttop15_2000



select Top(15)AreaName as US_State, Population1990 into Ttop15_1990
from US_States
order by Population1990 desc, AreaName

select * from Ttop15_1990


select Top(15) AreaName as US_State, population2010 into Ttop15_2010
from US_States
order by Population2010 desc, AreaName 


select * from Ttop15_2010


select Top(15) AreaName as US_State, population2020 into Ttop15_2020
from US_States
order by Population2020 desc, AreaName 


select * from Ttop15_2020


select Top(15)AreaName as US_State, population2021 into Ttop15_2021
from US_States
order by Population2021 desc, AreaName 

select * from Top15_2021


--Population numbers from top 15 state lowest state to highest

select Top(15) AreaName as US_State, Population1990 into Bottom15_1990
from US_States
order by Population1990 asc, AreaName

select * from Bottom15_1990


select Top(15) AreaName as US_State, Population2000 into Bottom15_2000
from US_States
order by Population2000 asc, AreaName

select * from Bottom15_2000


select Top(15) AreaName as US_State, Population2010 into Bottom15_2010
from US_States
order by Population2010 asc, AreaName

select * from Bottom15_2010


select Top(15) AreaName as US_State, Population2020 into Bottom15_2020
from US_States
order by Population2020 asc, AreaName

select * from Bottom15_2020


select Top(15) AreaName as US_State, Population2021 into Bottom15_2021
from US_States
order by Population2021 asc, AreaName

select * from Bottom15_2021




--Isolating the biggest state
select AreaName as Biggest_State_1990, population1990 as PopulationSize1990 
from US_States
where Population1990 > 25000000
order by Population1990 desc

--Isolating the smallest state
select AreaName as Smallest_State_1990, population1990 as PopulationSize1990 
from US_States
where Population1990 < 500000
order by Population1990 asc, AreaName


select AreaName as Smallest_State_2000, population2000 as PopulationSize2000
from US_States
where Population1990 < 500000
order by Population2000 asc


select AreaName as Smallest_State_2021, population2021 as PopulationSize2021
from US_States
where Population1990 < 500000
order by Population2021 asc




