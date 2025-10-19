-- IMPORTING THE DATABASE

create 
  database bank_project;
use 
  bank_project;
create table 
  bank_marketing(
  age	int,
  job	varchar(50),
  marital	varchar(50),
  education varchar(50),
  default_loan varchar(50),
  housing varchar(50),
  loan varchar(50),
  contact	varchar(50),
  month_ 	varchar(50),
  day_of_week	varchar(50),
  duration int,
  campaign int,
  pdays int,
  previous int,
  poutcome varchar(50),
  emp_var_rate float,
  cons_price_idx float,
  cons_conf_idx float,
  euribor3m float,
  nr_employed float,
  y varchar(5)
  )
;
-- NOW IMPORT THE DATA USING THE TABLE DATA IMPORT WIZARD

select 
  * 
from 
  bank_marketing;

-- finding if there are any null values

SELECT 
    SUM(CASE WHEN age IS NULL THEN 1 ELSE 0 END) AS age_nulls,
    SUM(CASE WHEN job IS NULL THEN 1 ELSE 0 END) AS job_nulls,
    SUM(CASE WHEN marital IS NULL THEN 1 ELSE 0 END) AS marital_nulls,
    SUM(CASE WHEN education IS NULL THEN 1 ELSE 0 END) AS education_nulls,
    SUM(CASE WHEN default_loan IS NULL THEN 1 ELSE 0 END) AS default_nulls,
    SUM(CASE WHEN housing IS NULL THEN 1 ELSE 0 END) AS housing_nulls,
    SUM(CASE WHEN loan IS NULL THEN 1 ELSE 0 END) AS loan_nulls,
    SUM(CASE WHEN contact IS NULL THEN 1 ELSE 0 END) AS contact_nulls,
    SUM(CASE WHEN month_ IS NULL THEN 1 ELSE 0 END) AS month_nulls,
    SUM(CASE WHEN day_of_week IS NULL THEN 1 ELSE 0 END) AS day_of_week_nulls,
    SUM(CASE WHEN duration IS NULL THEN 1 ELSE 0 END) AS duration_nulls,
    SUM(CASE WHEN campaign IS NULL THEN 1 ELSE 0 END) AS campaign_nulls,
    SUM(CASE WHEN pdays IS NULL THEN 1 ELSE 0 END) AS pdays_nulls,
    SUM(CASE WHEN previous IS NULL THEN 1 ELSE 0 END) AS previous_nulls,
    SUM(CASE WHEN poutcome IS NULL THEN 1 ELSE 0 END) AS poutcome_nulls,
    SUM(CASE WHEN emp_var_rate IS NULL THEN 1 ELSE 0 END) AS emp_var_rate_nulls,
    SUM(CASE WHEN cons_price_idx IS NULL THEN 1 ELSE 0 END) AS cons_price_idx_nulls,
    SUM(CASE WHEN cons_conf_idx IS NULL THEN 1 ELSE 0 END) AS cons_conf_idx_nulls,
    SUM(CASE WHEN euribor3m IS NULL THEN 1 ELSE 0 END) AS euribor3m_nulls,
    SUM(CASE WHEN nr_employed IS NULL THEN 1 ELSE 0 END) AS nr_employed_nulls,
    SUM(CASE WHEN y IS NULL THEN 1 ELSE 0 END) AS y_nulls
FROM 
  bank_marketing;

-- What is the total number of clients who subscribed vs did not subscribe?
select 
  count(*), 
  y
from 
  bank_marketing
group by 
  y
;

-- What is the overall subscription rate in percentage?

select 
	round((sum(y)/count(*))*100,3) subscription_rate
from 
	bank_marketing;

-- What is the subscription rate for each job type?

select 
	job,
    round((sum(y)/count(*))*100,3) subscription_rate_to_job
from
	bank_marketing
group by 
	job
;

-- What is the subscription rate by education level?

select 
	education, 
    round((sum(y)/count(*))*100,3) subscription_rate_to_education_level
from
	bank_marketing
group by
	education
;

-- What is the average age of subscribers vs non-subscribers?

SELECT
	CASE WHEN Y=1 THEN 'SUBSCRIBED' ELSE 'NOT SUBSCRIBED' END AS SUBSCRIPTION_STATUS,
    AVG(AGE) AVG_AGE
FROM
	BANK_MARKETING
GROUP BY 
	Y
ORDER BY 
	AVG_AGE
;

-- What is the average duration of the last contact for subscribers vs non-subscribers?

SELECT 
	CASE WHEN Y=1 THEN 'SUBSCRIBED' ELSE 'NOT SUBSCRIBED' END AS SUBSCRIPTION_STATUS,
	AVG(DURATION)
FROM
	BANK_MARKETING
GROUP BY
	Y
;

-- Which contact method (cellular vs telephone) has a higher success rate?

SELECT
	CONTACT,
    round((sum(y)/count(*))*100,3) subscription_rate_to_CONTACT
FROM 
	BANK_MARKETING
GROUP BY 
	CONTACT;

/*
For each combination of job and education level, calculate:
Total clients
Total subscribers and non-subscribers
Subscription rate
Average call duration (duration)
Average number of previous contacts (previous)
Average euribor 3-month rate (euribor3m)
Rank each combination based on subscription rate descending
Only include combinations with at least 30 clients. Show the top 10 ranked combinations.*/

WITH job_education_stats AS (
    SELECT
        job,
        education,
        COUNT(*) AS total_clients,
        SUM(y) AS total_subscribers,
        COUNT(*) - SUM(y) AS total_non_subscribers,
        ROUND((SUM(y) * 100.0) / COUNT(*), 2) AS subscription_rate_percentage,
        ROUND(AVG(duration), 2) AS avg_contact_duration,
        ROUND(AVG(previous), 2) AS avg_previous_contacts,
        ROUND(AVG(euribor3m), 4) AS avg_euribor3m
    FROM
        bank_marketing
    GROUP BY
        job, education
    HAVING
        COUNT(*) >= 30
)
SELECT
    job,
    education,
    total_clients,
    total_subscribers,
    total_non_subscribers,
    subscription_rate_percentage,
    avg_contact_duration,
    avg_previous_contacts,
    avg_euribor3m,
    RANK() OVER (ORDER BY subscription_rate_percentage DESC, avg_contact_duration ASC) AS subscription_rank
FROM
    job_education_stats
ORDER BY
    subscription_rank
LIMIT 10;

-- Which months had the highest subscription rate?

SELECT
	MONTH_,
  round((sum(y)/count(*))*100,3) subscription_rate_to_MONTH
FROM 
	BANK_MARKETING
GROUP BY 
	MONTH_
ORDER BY 
	subscription_rate_to_MONTH DESC
LIMIT 1
;
    
-- Which day of the week had the highest success rate?

SELECT
	DAY_OF_WEEK,
  round((sum(y)/count(*))*100,3) subscription_rate_to_DAY
FROM 
	BANK_MARKETING
GROUP BY 
	DAY_OF_WEEK
ORDER BY 
	subscription_rate_to_DAY DESC
LIMIT 1;

-- What is the average number of contacts per successful subscription?

SELECT 
    ROUND(AVG(campaign), 2) AS avg_contacts_per_subscription
FROM 
    bank_marketing
WHERE 
    y = 1
;

-- Which customer segment (job × education) has the highest subscription rate?

SELECT 
    job,
    education,
    COUNT(*) AS total_clients,
    ROUND((SUM(y) * 100.0) / COUNT(*), 2) AS subscription_rate_percentage
FROM 
    bank_marketing
GROUP BY 
    job, education
HAVING 
    COUNT(*) >= 10   
ORDER BY 
    subscription_rate_percentage DESC
LIMIT 1
;

-- Which combination of factors (contact, poutcome, job) shows the highest success rate?

SELECT
    contact,
    poutcome,
    job,
    COUNT(*) AS total_clients,
    ROUND((SUM(y) * 100.0) / COUNT(*), 2) AS subscription_rate_percentage
FROM
    bank_marketing
GROUP BY
    contact, poutcome, job
HAVING
    COUNT(*) >= 10   
ORDER BY
    subscription_rate_percentage DESC
LIMIT 1;

-- What is the optimal number of contacts before a client subscribes?

SELECT 
    ROUND(AVG(campaign), 2) AS avg_contacts_before_subscription
FROM 
    bank_marketing
WHERE 
    y = 1;

-- Which job group gives the highest ROI (subscription % vs number of contacts)?

SELECT
    job,
    COUNT(*) AS total_clients,
    ROUND((SUM(y) * 100.0) / COUNT(*), 2) AS subscription_rate_percentage,
    ROUND(AVG(campaign), 2) AS avg_contacts,
    ROUND(((SUM(y) * 100.0) / COUNT(*)) / AVG(campaign), 4) AS roi_per_contact
FROM
    bank_marketing
GROUP BY
    job
HAVING
    COUNT(*) >= 10 
ORDER BY
    roi_per_contact DESC
LIMIT 1
;

-- Are there inefficient segments that require many contacts but low success rate?

SELECT
    job,
    education,
    COUNT(*) AS total_clients,
    ROUND(AVG(campaign), 2) AS avg_contacts,
    ROUND((SUM(y) * 100.0) / COUNT(*), 2) AS subscription_rate_percentage,
    ROUND(AVG(campaign) / NULLIF(SUM(y), 0), 2) AS contacts_per_subscription
FROM
    bank_marketing
GROUP BY
    job, education
HAVING
    COUNT(*) >= 10 
ORDER BY
    contacts_per_subscription DESC
;
