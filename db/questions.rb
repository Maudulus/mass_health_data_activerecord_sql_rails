# What 3 towns have the highest population of citizens that are 65 years and older?
1) TownHealthRecord.select('town,population_greater_than_65_2005').order('population_greater_than_65_2005').limit(5)

# What 3 towns have the highest population of citizens that are 19 years and younger?
2) TownHealthRecord.select('town,population_0_to_19_2005').order('population_0_to_19_2005').limit(4)

# What 5 towns have the lowest per capita income?
3) TownHealthRecord.select('town,per_capita_income_2000').order('per_capita_income_2000').limit(5)

# Omitting Boston, Becket, and Beverly, what town has the highest percentage of teen births?
4) TownHealthRecord.select('town,percent_teen_births_2005_to_2008').order('town_health_records').where(:town !=['Boston','Becket','Beverly'])

# Omitting Boston, what town has the highest number of infant mortalities?
5) TownHealthRecord.select('town,total_infant_deaths_2005_to_2008').order('total_infant_deaths_2005_to_2008').where("town != 'Massachusetts Total' AND town != 'Boston'").last

# Of the 5 towns with the highest per capita income, which one has the highest number of people below the poverty line?
6) ****TownHealthRecord.select('town,per_capita_income_2000,persons_below_poverty_2000').order('')

# Of the towns that start with the letter b, which has the highest population?
7) TownHealthRecord.select('town, total_population_2005').where("town LIKE 'B%' ")

# Of the 10 towns with the highest percent publicly financed prenatal care, are any of them also the top 10 for total infant deaths?
8) ****TownHealthRecord.where(town: TownHealthRecord.select("town").where("percent_publicly_financed_prenatal_care_2005_to_2008 IS NOT NULL").order("percent_publicly_financed_prenatal_care_2005_to_2008").first(10)).where(town: TownHealthRecord.select("town").where("total_infant_deaths_2005_to_2008 IS NOT NULL AND town != 'Massachusetts Total'").order("total_infant_deaths_2005_to_2008").first(10))

# Which town has the highest percent multiple births?
9) TownHealthRecord.select("town, percent_multiple_births_2005_to_2008").order("percent_multiple_births_2005_to_2008").where("percent_multiple_births_2005_to_2008 IS NOT NULL").first(1)

# What is the percent adequacy of prenatal care in that town?
10) TownHealthRecord.select("town, percent_adequacy_pre_natal_care").where("percent_multiple_births_2005_to_2008 IS NOT NULL").order("percent_multiple_births_2005_to_2008").first(1)

# Excluding towns that start with W, how many towns are part of this data?
11) TownHealthRecord.where("town NOT LIKE 'W%'").count("town")

# How many towns have a lower per capita income that of Boston?
12) TownHealthRecord.where("per_capita_income_2000 < (SELECT per_capita_income_2000 FROM town_health_records WHERE town = 'Boston')").count("town")












