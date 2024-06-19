select * from "covid19deaths" ;
------EXPLORATORY DATA ANALYSIS OF COVID DATASET ----
--A) Datewise likelyhood of dying due to covid- Total cases vs total deaths in India 
select date,total_case,total_deaths from "covid19deaths" where location like 'India';
--b.Total % of deaths out of entire population- in India
Select * from "covid19deaths" where location like 'India';
select (max(total_deaths)/avg(cast (population as integer))*100) from "covid19deaths" where location like 'India';
--c.Verify b by getting info separately in a descending manner
Select total_deaths,population from "covid19deaths" where location like 'India'order by total_deaths desc ;
--d.Country with highest total covid cases as a % of population 
Select location ,(max(total_deaths)/avg(cast(population as bigint))*100)as populationpercentage from "covid19deaths" group by location order by populationpercentage desc;
--"Peru"	0.64647478260236217800--
--e.Total % of covid +ve cases- in India
Select * from "covid19deaths" where location like 'India';
Select (max(total_case)/avg(cast(population as bigint))*100) as percengtage_positive from "covid19deaths" where location like 'India'; 
--3.17201867334% --
--f) % of positive cases in the world highest top 5
Select location, (max(total_case)/avg(cast(population as bigint))*100) as percengtage_positive from "covid19deaths" group by location order by  percengtage_positive desc ;
--"Cyprus"	73.48714909593340230600--
--"San Marino"	71.62956366874443455000--
--"Austria"	67.85202319070268894100--
--"Faeroe Islands"	65.24841387879586573000--
--"Brunei"	64.15361178792076650000--
----g.Continentwise +ve cases--
Select location , (max(total_case))as positive_cases from "covid19deaths" where continent is null group by location ;
--h)Continentwise total deaths --
Select location , (max(total_deaths))as total_deaths from "covid19deaths" where continent is null group by location ;
--i) countrywise age>65
select "covid19deaths".date, "covid19deaths".location,"covid19vaccinations".age_65_older from "covid19deaths" join "covid19vaccinations" on "covid19vaccinations".iso_code="covid19deaths".iso_code and "covid19deaths".date="covid19vaccinations".date;
--j). Countrywise people fully vaccinated person --
Select "covid19deaths".location as country, (max("covid19vaccinations".people_fully_vaccinated))as fullyvaccinated from "covid19deaths" join "covid19vaccinations" on "covid19deaths".iso_code="covid19vaccinations".iso_code and "covid19deaths".date="covid19vaccinations".date where "covid19deaths".continent is null group by country order by fullyvaccinated desc ;
--k)countrywise death of  age>70 persons
select "covid19deaths".date, "covid19deaths".location,"covid19vaccinations".aged_70_older from "covid19deaths" join "covid19vaccinations" on "covid19vaccinations".iso_code="covid19deaths".iso_code and "covid19deaths".date="covid19vaccinations".date;
--l)countrtywise count of people fully vaccinated who stays in extreme poverty 
select "covid19vaccinations".location , "covid19vaccinations".people_fully_vaccinated , "covid19vaccinations".extreme_poverty from "covid19vaccinations" ;