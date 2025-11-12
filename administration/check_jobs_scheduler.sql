--------------------------------------------------------------------------------
-- Script: check_jobs_scheduler.sql
-- Descrição: Lista jobs do DBMS_SCHEDULER com status e última execução.
--------------------------------------------------------------------------------

SELECT owner, job_name, enabled, state, last_start_date, last_run_duration
FROM dba_scheduler_jobs
ORDER BY owner, job_name;
