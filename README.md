# Desmond's_Portfolio

#### These are some of my personal projects, and the goal was to become acquainted with and comprehend some of the daily responsibilities of a data analyst. 

### **[Project 1: Bike Sales](https://github.com/DesmondMokhali/Des_Portfolio/blob/70fe99263a5d9d373fb2b0a92af4e3e9f60c1a7f/Bike%20Sales.xlsx)**

**Business Task:** Analyze patterns and trends in the sales of bikes using a specified dataset.

**Data:** [Excel Project Dataset.csv](https://drive.google.com/drive/folders/1JFJ8_mzXTr_xPbS-4qWqpJsOQCnazrxC) 
[Last accessed on 03/Jan/2023]

[@Alex the Analyst](https://github.com/AlexTheAnalyst) compiled this dataset and granted permission for reusing it under the Creative Commons Attribution license. 

**Tools used:** Microsoft Office Profesional Plus 2019

**Skills used:** Format data to a table, Remove duplicates,Replace values, Converting data types, Nested IF statement, Pivot table, Data visualization, Dashboard with slices

**Process**
- transformed the data into a table format.
- removed duplicates
- changed the values for the <kbd>marital status </kbd>and <kbd>gender</kbd> columns from <kbd> M</kbd> and <kbd>S</kbd> to <kbd>Married</kbd> and <kbd>Single</kbd> and <kbd>M</kbd> and <kbd>F</kbd> to <kbd>Male</kbd> and <kbd>Female</kbd>, respectively.  
- changed the data type of the Income column from General to Currency.
- In order to build the age bracket for <kbd>adolescents (31 years)</kbd>,<kbd>middle-aged (>=31 years)</kbd>, and <kbd> old (>54 years)</kbd>, a new column from the age column was created using a nested "IF statement"  <kbd>=IF(L963>54;"Old";IF(L963>=31;"Middle Age"; IF(L963<31;"Adolescent";"Invalid")))</kbd>

**Analyze**

Charts
1. Column chart depict the correlation between average income per bicycle purchase by gender.
2. Line chart showing a range of customers' commute distances vs. a count of bicycle purchase statuses
3. Line chart showing the correlation between purchased bicycles and age brackets
4. Column chart comparing the number of bicycles a customer has purchased with the number of cars they possess. 
5. Customers' bicycle purchases and the number of children they have are compared in a column chart. 

**Dashboard**

The Customer Age Bracket (column chart), Customer Communite Distance (line chart), Average Income Per Purchase (column chart), and Cars Per Customer (column chart) are all displayed on the Bike Sales dashboard. Slices for region, education, marital status, and number of children are also included.





------------------------------------------------------------------------------------------------------------------------------------------------------------------

### **[Project 2: Covid 19 Data Exploration with SQL](https://github.com/DesmondMokhali/Des_Portfolio/blob/bd1d20477e99512387dbda1e7dcb66b88c6c6e1c/Covid%2019%20Data%20Exploration%20with%20SQL.sql)**

**Business Task:** Explore the impact of Covid-19 and the vaccination program globally



**Data:** [owid-covid-data.csv](https://ourworldindata.org/covid-deaths) [Last accessed on 03/Jan/2023]

Under the terms of the Creative Commons BY license, this dataset created by "Our World in Data" is freely available. 

**Tools used:** Microsoft SQL Server Management Studio V18.12.1

**Skills used:** Joins, CTE's, Temp Tables, Windows Functions, Aggregate Functions, Creating Views, Converting Data Types




#### Developed questions to explore the following:

1.**Total Cases Vs Total Deaths**

  - *Shows likelihood of dying if you contract covid in your country*


2.**Total Cases vs Population** 

 -  *Shows what percenatge of population got Covid*

3.**Countries with Highest Infection Rate compared to Population**

4.**Countries with Highest Death Count per Population**




##### **BREAKING THINGS DOWN BY CONTINENT**

5.**Continents with the highest death counts per population**


6.**Global Numbers**


7.**Total Population Vs Vaccinations**

 - *Displays the percentage of the population who have received at least one Covid vaccine.*

 - *Used CTE and Temp Table to perform Calculations on Partion By in previous query* 


8.**Total Population Vs Full Vaccinations**

  - *Demonstrates the percentage of people who have received all recommended vaccinations.* 


9.**Daily administered vaccine doeses** 

 - *Rate of Daily Vaccine Doses for the Population* 

10.**GDP per capita VS Vaccininations**


--------------------------------------------------------------------------------------------------------------------------------------------------------------------


### **[Project 3: Covid-19 Vaccine Tracker](https://public.tableau.com/app/profile/bofihla.mokhali/viz/Proejct_1_Covid-19_Draft/GlobalVaccnineTracker?publish=yes)**
**Business Task:** Track the progress of the global vaccination program

 **Data:** [COVID-19 country_vaccinations.rar](https://drive.google.com/drive/folders/1JFJ8_mzXTr_xPbS-4qWqpJsOQCnazrxC) [Last accessed on 03/Jan/2023]

This "our world in data" dataset has been preprocessed by [Lore so what](https://www.youtube.com/@loresowhat), who has granted permission to reuse it (under the Creative Commons Attribution license)

**Tools used:** Tableau Desktop Public Edition 2022.1.3

**Skills used:** Data visualization, Dashboard

#### **Worksheets**

**KPI's**

1. People Partially Vaccinated
2. People Fully Vaccinated
3. Share of People Not Vaccinated

**Charts**

1. Vaccinated vs Fully Vaccinated Per Location (Bar chart)
2. Vaccination Per Handred (Map)
3. Vaccinated over GDP (Scatter plot with a logarithmic trend line)
 
 
 
**Dashboard**
Covid-19 Global Vaccine Tracker

- Calculated field used as a filter for dates

<kbd>Date >= [Select Start Date] AND [Date] <= [Select End Date]</kbd>

Parameters for dates
- <kbd>Start date 04/09/20</kbd>, <kbd>End date 25/10/21</kbd>


**Filters**
- Country (wildcard match)
- Continent (Multiple values drop down with a customized apply button)
- Start date and End date 




These initiatives were motivated by and completed with the assistance of [@Alex the Analyst](https://github.com/AlexTheAnalyst) and [@Lor So What](https://www.youtube.com/@loresowhat).

