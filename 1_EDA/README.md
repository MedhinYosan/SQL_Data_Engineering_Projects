# Exploratory Data Analysis w/ SQL: Job Market Analysis


![Project 1 Overview](Images/1_1_Project1_EDA.png)


=================================================================
## SQL Queries

## SQL Queries

### Top Demanded Skills

📄 **SQL File:** [`01_top_demanded_skills.sql`](./01_top_demanded_skills.sql)

Jump to:
- [Results](#results)
- [Analysis](#analysis)

1. [`01_top_demanded_skills.sql`](./01_top_demanded_skills.sql) – Demand analysis with multi-table joins

[Top Paying Skills Query](#top-paying-skills-query)

[Optimal Skills Query](#optimal-skills-query)

2. [`02_top_paying_skills.sql`](./02_top_paying_skills.sql) – Salary analysis with aggregations

3. [`03_optimal_skills.sql`](./03_optimal_skills.sql) – Combined demand and salary optimization
==============================================================
# Exploratory Data Analysis w/ SQL: Job Market Analysis
A SQL project analyzing the data engineer job
market using real world job posting data. It
demonstrates my ability to ** write
production-quality analytical SQL, design
efficient queries, and turn business questions
into data-driven insights **.

## Executive Summary
- ** Project scope :** Built ** 3 analytical
queries ** that answer key questions about the data
engineer job market
- ** Data modeling :** Used ** multi-table joins **
across fact and dimension tables to extract
insights
- ** Analytics :** Applied ** aggregations,
filtering, and sorting ** to find top skills by
demand, salary, and overall value
- ** Outcomes :** Delivered ** actionable
insights ** on SQL/Python dominance, cloud trends,
and salary patterns

[Top Demanded Skills Query](Lessons/1_EDA/01_top_demanded_skills.sql)

[Top Paying Skills Qoery](Lessons/1_EDA/02_top_paying_skills.sql)

[Optimal Skills](Lessons/1_EDA/03_optimal_skills.sql)

## Problem & Context

Job market analysts need to answer questions like:

- e ** Most in-demand :** *Which skills are most
in-demand for data engineers ?*
- e ** Highest paid :** *Which skills command the
highest salaries ?*
- 44 ** Best trade-off :** *What is the optimal
skill set balancing demand and compensation ?*

This project analyzes a ** data warehouse ** built
using a star schema design. The warehouse
structure consists of:

![Data Warehouse](Images/1_2_Data_Warehouse.png)

- ** Fact Table :** `ob_postings_fact` - Central
table containing job posting details (job titles,
locations, salaries, dates, etc.)
- ** Dimension Tables :**
- `company_dim` - Company information linked to
job postings
-`skills_dim` - Skills catalog with skill names
and types
- ** Bridge Table :** `skills_job_dim` - Resolves
the many-to-many relationship between job postings
and skills

By querying across these interconnected tables, I
extracted insights about skill demand, salary
patterns, and optimal skill combinations for data
roles.
engineerina roles.

## Tech Stack

- ** Query Engine :** DuckDB for fast OLAP-style
analytical queries
** Language :** SQL (ANSI-style with analytical
functions)
** Data Model :** Star schema with fact +
dimension + bridge tables
- % ** Development :** VS Code for SQL editing +
Terminal for DuckDB CLI
** Version Control :** Git/GitHub for versioned
SQL scripts
## Analysis Overview
### Query Structure

1. **[Top Demanded Skills](./01_top_demanded_skills.sql)** - Identifies the 10 most in-demand skills for remote data engineer positions.

2. **[Top Paying Skills](./02_top_paying_skills.sql)** - Analyzes the 25 highest-paying skills with salary and demand metrics.

3. **[Optimal Skills](./03_optimal_skills.sql)** - Calculates an optimal score using the natural log of demand combined with median salary to identify the most valuable skills to learn.

### Key Insights

- Core languages: SQL and Python each appear in
~29,000 job postings, making them the most
demanded skills
- Cloud platforms: AWS and Azure are critical
for modern data engineering roles-
- Infra & tooling: Kubernetes, Docker, and
Terraform are associated with premium salaries
- Big data tools: Apache Spark shows strong
demand with competitive compensation

## SQL Skills Demonstrated
### Query Design & Optimization


- **Complex Joins:** Multi-table `INNER JOIN` operations across the `job_postings_fact`, `skills_job_dim`, and `skills_dim` tables.

- **Aggregations:** Used `COUNT()`, `MEDIAN()`, and `ROUND()` to calculate demand and salary statistics.

- **Filtering:** Applied `WHERE` clauses with multiple conditions, including `job_title_short`, `job_work_from_home`, and `salary_year_avg IS NOT NULL`.

- **Sorting & Limiting:** Used `ORDER BY DESC` and `LIMIT` to rank and return the top results.

### Data Analysis Techniques

### Data Analysis Techniques

- **Grouping:** Applied `GROUP BY` to aggregate job postings by skill.

- **Conditional Logic:** Used `CASE WHEN` to create calculated metrics for ranking skills.

- **Mathematical Functions:** Leveraged `LN()` to normalize demand values before calculating the optimal score.

- **Calculated Metrics:** Combined normalized demand and median salary into a single optimal score for skill evaluation.

- **Aggregate Filtering:** Used `HAVING` to return only skills with `>= 100` job postings, ensuring statistically meaningful results.

- **NULL Handling:** Filtered incomplete records with (`salary_year_avg IS NOT NULL`) to improve data quality and analysis accuracy.











