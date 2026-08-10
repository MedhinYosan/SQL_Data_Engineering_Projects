SELECT * 
FROM skills_dim
LIMIT 5;

SELECT *
FROM information_schema.table_constraints
WHERE table_catalog = 'data_jobs';

PRAGMA show_tables_expanded;

DESCRIBE job_postings_fact;