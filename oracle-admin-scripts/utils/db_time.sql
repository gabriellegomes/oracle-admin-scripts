--------------------------------------------------------------------------------
-- Script: db_time.sql
-- Descrição: Mostra data/hora da instância Oracle.
--------------------------------------------------------------------------------

SELECT SYSDATE AS db_sysdate, SYSTIMESTAMP AS db_timestamp FROM dual;
