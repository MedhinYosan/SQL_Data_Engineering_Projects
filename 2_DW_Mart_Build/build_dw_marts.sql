-- duckdb dw_marts.duckdb -c ".read build_dw_marts.sql"

--SELECT '===== STARTING STEP 1: CREATE DW TABLES =====' AS progress;
.read 01_create_tables_dw.sql

--SELECT '===== STARTING STEP 2: LOAD DW DATA =====' AS progress;
.read 02_load_schema_dw.sql

--SELECT '===== STARTING STEP 3: CREATE FLAT MART =====' AS progress;
.read 03_create_flat_mart.sql

--SELECT '===== STARTING STEP 4: CREATE SKILLS MART =====' AS progress;
.read 04_create_skills_mart.sql

--SELECT '===== STARTING STEP 5: CREATE PRIORITY MART =====' AS progress;
.read 05_create_priority_mart.sql

--SELECT '===== STARTING STEP 6: UPDATE PRIORITY MART =====' AS progress;
.read 06_update_priority_mart.sql

--SELECT '===== STARTING STEP 7: CREATE COMPANY MART =====' AS progress;
.read 07_create_company_mart.sql

--SELECT '===== BUILD COMPLETE =====' AS progress;

