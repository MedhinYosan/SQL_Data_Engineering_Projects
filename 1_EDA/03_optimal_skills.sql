/*
Question: What are the most optimal skills for data engineers—balancing both demand and salary?
- Create a ranking column that combines demand count and median salary to identify the most valuable skills.
- Focus only on remote Data Engineer positions with specified annual salaries.
- Why?
    - This approach highlights skills that balance market demand and financial reward. It weights core skills appropriately instead of letting rare, outlier skills distort the results.
    - The natural log transformation ensures that both high-salary and widely in-demand skills surface as the most practical and valuable to learn for data engineering careers.
┌────────────┬───────────────┬─────────────────┬───────────────┐
│   skills   │ median_salary │ ln_demand_count │ optimal_score │
│  varchar   │    double     │     double      │    double     │
├────────────┼───────────────┼─────────────────┼───────────────┤
│ terraform  │      184000.0 │             5.3 │          0.97 │
│ kubernetes │      150500.0 │             5.0 │          0.75 │
│ airflow    │      150000.0 │             6.0 │          0.89 │
│ kafka      │      145000.0 │             5.7 │          0.82 │
│ go         │      140000.0 │             4.7 │          0.66 │
│ spark      │      140000.0 │             6.2 │          0.87 │
│ pyspark    │      140000.0 │             5.0 │           0.7 │
│ git        │      140000.0 │             5.3 │          0.75 │
│ aws        │      137320.0 │             6.7 │          0.91 │
│ scala      │      137290.0 │             5.5 │          0.76 │
│ gcp        │      136000.0 │             5.3 │          0.72 │
│ mongodb    │      135750.0 │             4.9 │          0.67 │
│ snowflake  │      135500.0 │             6.1 │          0.82 │
│ python     │      135000.0 │             7.0 │          0.95 │
│ java       │      135000.0 │             5.7 │          0.77 │
│ bigquery   │      135000.0 │             4.8 │          0.65 │
│ hadoop     │      135000.0 │             5.3 │          0.71 │
│ docker     │      135000.0 │             5.0 │          0.67 │
│ github     │      135000.0 │             4.8 │          0.65 │
│ r          │      134775.0 │             4.9 │          0.66 │
│ nosql      │      134415.0 │             5.3 │          0.71 │
│ databricks │      132750.0 │             5.6 │          0.74 │
│ mysql      │      130500.0 │             4.6 │           0.6 │
│ sql        │      130000.0 │             7.0 │          0.91 │
│ redshift   │      130000.0 │             5.6 │          0.73 │
└────────────┴───────────────┴─────────────────┴───────────────┘
*/

SELECT 
sd.skills,
ROUND(MEDIAN(jpf.salary_year_avg), 0) AS median_salary,
--COUNT(jpf.*) AS demand_count,
ROUND(LN(COUNT(jpf.*)), 1) AS ln_demand_count,
ROUND((MEDIAN(jpf.salary_year_avg) * LN(COUNT(jpf.*)))/1_000_000,2) AS optimal_score,
FROM job_postings_fact AS jpf
INNER JOIN skills_job_dim AS sjd
   ON jpf.job_id = sjd.job_id
INNER JOIN skills_dim AS sd
ON sjd.skill_id = sd.skill_id
WHERE 
jpf.job_title_short ='Data Engineer'
AND jpf.job_work_from_home = True
AND jpf.salary_year_avg IS NOT NULL
GROUP BY
sd.skills
HAVING 
   COUNT(jpf.*) >100
ORDER BY 
median_salary DESC
LIMIT 25;