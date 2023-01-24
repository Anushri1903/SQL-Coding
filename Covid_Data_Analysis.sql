
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

-- Aggregating total_cases and total_deaths for INDIA --

select 
location,sum(total_cases) as sum_total_cases, sum(total_deaths) as sum_total_deaths
from CovidDeath
where location like '%India%'
group by location;

--- Percentage Likelihood of dying if you contract COVID in your Country(India)--
select 
location, total_cases,total_deaths, (total_deaths/total_cases)*100 as percentage
from CovidDeath;
where location like '%India%';

---Analysis for India only---

--Looking total death VS total country population 
select 
location,date,population, total_cases,total_deaths, (total_deaths/population)*100 as percentage
from CovidDeath;


 ----Countries with Highest Death Count per Population
Select Location, MAX(Total_deaths) as TotalDeathCount
From CovidDeath
Where continent is not null 
Group by Location

--- Let's analyse further by Continent -- 
-- Showing contintents with the highest death count per population
select continent, population,max(total_deaths) as max_c_deaths
from CovidDeath
where continent is not null
group by continent,population
order by max_c_deaths desc;

select dea.continent, dea.location, dea.date, dea.population, vac.new_vaccinations
From CovidDeath dea
join CovidVaccination vac
On dea.location = vac.location
where dea.continent is not null 
order by 2,3;
