
Link to Dataset: https://ourworldindata.org/covid-deaths
/*
Covid 19 Data Exploration 
Skills used: Joins, CTE's, Temp Tables, Windows Functions, Aggregate Functions, Creating Views, Converting Data Types
*/

-- Reading the data file CovidDeath order by Country population
SELECT * from CovidDeath order by 3,4;

select 
location, date, total_cases, new_cases, total_deaths, population  
from CovidDeath order by 1,2;

select 
location,sum(total_cases) as sum_t_c, sum(total_deaths) as sum_t_d
from CovidDeath
group by location;

--- Percentage Likelihood of dying if you contract COVID in your Country
select 
location, total_cases,total_deaths, (total_deaths/total_cases)*100 as percentage
from CovidDeath;

---Analysis for India only---

select 
location,date,population, total_cases,total_deaths, (total_deaths/population)*100 as percentage
from CovidDeath
where location like '%India%';

--Looking total death VS total country population 
select 
location,date,population, total_cases,total_deaths, (total_deaths/population)*100 as percentage
from CovidDeath;


 ----Countries with Highest Death Count per Population
Select Location, MAX(Total_deaths) as TotalDeathCount
From CovidDeath
Where continent is not null 
Group by Location
