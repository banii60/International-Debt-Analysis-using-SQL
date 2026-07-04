SELECT * FROM datanalytics.international_debt;

-- total amount of debt owed by all countries (in millions)
select (sum(debt)/1000000)::numeric(20,2) as total_debt 
from datanalytics.international_debt id;

-- distinct countries 
select distinct country_name
from datanalytics.international_debt id;

 --distinct types of debt indicators and they represent
select distinct indicator_name, indicator_code
from datanalytics.international_debt id;

--country that highest total debt, and how much does it owe
select country_name, debt
from datanalytics.international_debt
order by debt desc
limit 1;

--average debt across different debt indicators
select distinct indicator_name, indicator_code, avg(debt) as avg_debt
from datanalytics.international_debt id
group by indicator_name, indicator_code;

--most common debt indicator across all countries
select  indicator_name, COUNT(*) as frequency 
from datanalytics.international_debt id 
group by id.indicator_name 
order by frequency desc
limit 1;