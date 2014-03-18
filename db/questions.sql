-- What 3 towns have the highest population of citizens that are 65 years and older?
1) SELECT town, population_greater_than_65_2005 FROM town_health_records WHERE town != 'Massachusetts Total' Order By population_greater_than_65_2005 DESC LIMIT 5;

-- What 3 towns have the highest population of citizens that are 19 years and younger?
2) SELECT town, population_0_to_19_2005 from town_health_records ORDER BY population_0_to_19_2005 DESC LIMIT 4;

-- What 5 towns have the lowest per capita income?
3) SELECT town, per_capita_income_2000 FROM town_health_records ORDER BY per_capita_income_2000 LIMIT 5;

-- Omitting Boston, Becket, and Beverly, what town has the highest percentage of teen births?
4) SELECT town, percent_teen_births_2005_to_2008 FROM town_health_records WHERE town != 'Boston' OR town != 'Becket' OR town != 'Beverly';

-- Omitting Boston, what town has the highest number of infant mortalities?
5) SELECT town, total_infant_deaths_2005_to_2008 FROM town_health_records WHERE town != 'Boston' AND town != 'Massachusetts Total' ORDER BY total_infant_deaths_2005_to_2008 DESC LIMIT 1;

-- Of the 5 towns with the highest per capita income, which one has the highest number of people below the poverty line?
6) SELECT town, per_capita_income_2000, persons_below_poverty_2000 FROM (SELECT  town, per_capita_income_2000, persons_below_poverty_2000 FROM town_health_records ORDER BY per_capita_income_2000 DESC LIMIT 5) AS figsnnuts ORDER BY persons_below_poverty_2000 DESC LIMIT 1 ;

-- Of the towns that start with the letter b, which has the highest population?
7) SELECT town, total_population_2005 FROM town_health_records WHERE town LIKE 'B%';

-- Of the 10 towns with the highest percent publicly financed prenatal care, are any of them also the top 10 for total infant deaths?
8) (SELECT town FROM town_health_records WHERE percent_publicly_financed_prenatal_care_2005_to_2008 IS NOT NULL ORDER BY percent_publicly_financed_prenatal_care_2005_to_2008 DESC LIMIT 10)
UNION (SELECT town FROM town_health_records WHERE total_infant_deaths_2005_to_2008 IS NOT NULL AND town != 'Massachusetts Total' ORDER BY total_infant_deaths_2005_to_2008 DESC LIMIT 10);

-- Which town has the highest percent multiple births?
9) SELECT town, percent_multiple_births_2005_to_2008 FROM town_health_records WHERE percent_multiple_births_2005_to_2008 IS NOT NULL ORDER BY percent_multiple_births_2005_to_2008 DESC LIMIT 1 ;

-- What is the percent adequacy of prenatal care in that town?
10) SELECT town, percent_adequacy_pre_natal_care FROM town_health_records WHERE percent_multiple_births_2005_to_2008 IS NOT NULL ORDER BY percent_multiple_births_2005_to_2008 DESC LIMIT 1  ;

-- Excluding towns that start with W, how many towns are part of this data?
11) SELECT COUNT(town) FROM town_health_records WHERE town NOT LIKE 'W%';

-- How many towns have a lower per capita income that of Boston?
12) SELECT COUNT(town) FROM town_health_records WHERE per_capita_income_2000 < (SELECT per_capita_income_2000 FROM town_health_records WHERE town = 'Boston');










