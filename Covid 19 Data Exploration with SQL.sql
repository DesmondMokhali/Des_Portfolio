
/*

Covid 19 Data Exploration

Skills used: Joins, CTE's, Temp Tables, Windows Functions, Aggregate Functions, Creating Views, Converting Data Types

*/

Select * 
From PortfolioProject..CovidDeaths
Where continent is not null
order by 3,4

Select * 
From PortfolioProject..CovidVaccinations
Where continent is not null
order by 3,4



-- Select Data that we are going to be starting with

Select Location, date, total_cases, new_cases, population, total_deaths
From PortfolioProject..CovidDeaths
Where continent is not null 
order by 1,2



-- Looking at Total Cases Vs Total Deaths
-- Shows likelihood of dying if you contract covid in your country

Select location, date, total_cases,total_deaths, 
       CAST(total_deaths AS numeric)/CAST(total_cases AS numeric)*100 as DeathPercentage
From PortfolioProject..CovidDeaths
-- Where loation = 'South Africa'
 Where continent is not null
order by 1,2



-- Looking at Total Cases vs Population 
-- Shows what percenatge of population got Covid

Select location, date, population,total_cases, 
       CAST(total_cases AS numeric)/CAST(population AS numeric)*100 as PercentPopulationInfected
From PortfolioProject..CovidDeaths
-- Where location = 'South Africa'
Where continent is null
order by 1,2



-- Looking at Countries with Highest Infection Rate compared to Population

Select location, population,MAX(CAST(total_cases AS numeric)) as HighestInfectionCount, 
       MAX(CAST(total_cases AS numeric))/MAX(CAST(population AS numeric))*100 as PercentPopulationInfected
From PortfolioProject..CovidDeaths
--where location = 'Africa'
Where continent is not null
Group by location, population
order by PercentPopulationInfected desc



-- Showinng Countries with Highest Death Count per Population

Select location, MAX(CAST(total_deaths AS numeric)) as TotalDeathCount
From PortfolioProject..CovidDeaths
Where continent is not null
Group by location
order by TotalDeathCount desc




-- BREAKING THINGS DOWN BY CONTINENT

-- Showing continents with the highest death counts per population

Select continent, MAX(CAST(total_deaths as numeric)) as TotalDeathCount
From PortfolioProject..CovidDeaths
Where continent is not null
Group by continent
order by TotalDeathCount desc


-- Global Numbers

Select  SUM(CAST(new_cases AS numeric)) as total_cases, 
        SUM(CAST(new_deaths As numeric)) as total_deaths,
        SUM(CAST(new_deaths AS numeric))/SUM(CAST(new_cases AS numeric))*100 as DeathPercentage
From PortfolioProject..CovidDeaths
Where continent is not null
order by 1,2



-- Looking at Total Population Vs Vaccinations
-- Shows Percentage of Population that has recieved at least one Covid Vaccine

Select CovidDeaths.continent,CovidDeaths.location, CovidDeaths.date, CovidDeaths.population,
       CovidVaccinations.new_vaccinations, SUM(CAST( CovidVaccinations.new_vaccinations AS numeric)) 
       OVER (Partition by CovidDeaths.location 
  Order by CovidDeaths.location, CovidDeaths.date) as RollingPeopleVaccinated
From PortfolioProject..CovidDeaths
join PortfolioProject..CovidVaccinations 
  On CovidDeaths.location = CovidVaccinations.location
  and CovidDeaths.date =CovidVaccinations.date
  Where CovidDeaths.continent is not null
  order by 2,3


  -- Using CTE to perform Calculations on Partion By in previous query 

 With PopvsVac (Continent, location, date, population, new_vaccinations, RollingPeopleVaccinated) as
 (
Select CovidDeaths.continent,CovidDeaths.location, CovidDeaths.date, CovidDeaths.population,
  CovidVaccinations.new_vaccinations, SUM(CAST( CovidVaccinations.new_vaccinations AS numeric)) OVER (Partition by CovidDeaths.location 
  Order by CovidDeaths.location, CovidDeaths.date) as RollingPeopleVaccinated
From PortfolioProject..CovidDeaths
join PortfolioProject..CovidVaccinations 
  On CovidDeaths.location = CovidVaccinations.location
  and CovidDeaths.date =CovidVaccinations.date
  -- Where CovidMortality.continent is not null
  -- order by 2,3
  )
  Select *, (RollingPeopleVaccinated/Population)*100 as PercentPopulationVaccinated
  From PopvsVac



  -- Using Temp Table to perform calculation on Partition By in previous query
 
 DROP Table if exists #PercentagePopulationVaccinated
 Create Table #PercentagePopulationVaccinated
 (
 Continent nvarchar (255),
 Location nvarchar (255),
 Date datetime,
 Population numeric,
 New_Vaccinations numeric,
  RollingPeopleVaccinated numeric
 )

 Insert into #PercentagePopulationVaccinated
Select CovidDeaths.continent,CovidDeaths.location, CovidDeaths.date, CovidDeaths.population,
  CovidVaccinations.new_vaccinations, SUM(CAST( CovidVaccinations.new_vaccinations AS numeric)) OVER (Partition by CovidDeaths.location 
  Order by CovidDeaths.location, CovidDeaths.date) as RollingPeopleVaccinated
From PortfolioProject..CovidDeaths
join PortfolioProject..CovidVaccinations 
  On CovidDeaths.location = CovidVaccinations.location
  and CovidDeaths.date =CovidVaccinations.date

    Select *, (RollingPeopleVaccinated/Population)* 100 as PercentPopulationVaccinated
  From #PercentagePopulationVaccinated


  -- Looking at Total Population Vs Full Vaccinations
  -- Shows Percenetage of people who are fully vaccinated 

 With PopvsVac (Continent, location, date, population, new_vaccinations, RollingPeopleFullyVaccinated) as
 (
 Select CovidDeaths.continent,CovidDeaths.location,CovidDeaths.date, CovidDeaths.population,
  CovidVaccinations.new_vaccinations, SUM(CONVERT( numeric,CovidVaccinations.people_fully_vaccinated)) OVER (Partition by CovidDeaths.location 
  Order by CovidDeaths.location) as RollingPeopleFullyVaccinated
From PortfolioProject..CovidDeaths
join PortfolioProject..CovidVaccinations 
  On CovidDeaths.location = CovidVaccinations.location
   and CovidDeaths.date =CovidVaccinations.date
 -- Where CovidDeaths.continent is not null
 -- order by 2,3
  )
  Select *, (RollingPeopleFullyVaccinated/Population)*100 as PercentPopFullyVaccinated
  From PopvsVac

  

  -- Looking at daily administered vaccine doeses 
 -- Shows Percent of Populations daily Vaccine doses 

 Select CovidDeaths.continent,CovidDeaths.location, CovidDeaths.date, CovidDeaths.population, CovidVaccinations.new_vaccinations,
        CONVERT(numeric, CovidVaccinations.new_vaccinations)/CONVERT(numeric, CovidDeaths.population) * 100 as PercentDailyDoses, 
        SUM(CONVERT( numeric,CovidVaccinations.new_vaccinations)) OVER (Partition by CovidDeaths.location 
  Order by CovidDeaths.location, CovidDeaths.date) as RollingPeopleVaccinated
From PortfolioProject..CovidDeaths
join PortfolioProject..CovidVaccinations 
  On CovidDeaths.location = CovidVaccinations.location
  and CovidDeaths.date =CovidVaccinations.date
  Where CovidDeaths.continent is not null
  order by 2,3



  -- Loooking at GDP per capita VS Vaccininations

    Select CovidDeaths.continent, CovidDeaths.location, CovidDeaths.population,CovidDeaths.GDP_per_capita,
	       SUM(CONVERT(numeric,CovidVaccinations.new_vaccinations)) as TotalVaccinations,
          (SUM(CONVERT(numeric,CovidVaccinations.new_vaccinations))/ CovidDeaths.population) * 100 as PercentVaccinatedPopulation
  From PortfolioProject..CovidDeaths
join PortfolioProject..CovidVaccinations 
  On CovidDeaths.location = CovidVaccinations.location
  -- Where  CovidDeaths.continent is not null
  Group by  CovidDeaths.GDP_per_capita, CovidDeaths.continent,CovidDeaths.location, population
  order by CovidDeaths.GDP_per_capita desc



