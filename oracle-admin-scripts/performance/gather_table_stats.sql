--------------------------------------------------------------------------------
-- Script: gather_table_stats.sql
-- Descrição: Coleta estatísticas de uma tabela específica.
--------------------------------------------------------------------------------
DEFINE OWNER = 'MY_SCHEMA'
DEFINE TABLE_NAME = 'MY_TABLE'

COLUMN owner FORMAT A20
COLUMN table_name FORMAT A30

BEGIN
  DBMS_STATS.GATHER_TABLE_STATS(
    ownname => UPPER('&OWNER'),
    tabname => UPPER('&TABLE_NAME'),
    estimate_percent => DBMS_STATS.AUTO_SAMPLE_SIZE,
    cascade => TRUE
  );
END;
/

