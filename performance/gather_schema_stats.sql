--------------------------------------------------------------------------------
-- Script: gather_schema_stats.sql
-- Descrição: Coleta estatísticas de um schema específico.
--------------------------------------------------------------------------------

-- Defina o schema alvo
DEFINE SCHEMA_NAME = 'MY_SCHEMA'

-- Ajustes de exibição
COLUMN owner FORMAT A20
COLUMN table_name FORMAT A30

-- Chama DBMS_STATS para o schema
BEGIN
  DBMS_STATS.GATHER_SCHEMA_STATS(
    ownname => UPPER('&SCHEMA_NAME'),
    estimate_percent => DBMS_STATS.AUTO_SAMPLE_SIZE,
    degree => DBMS_STATS.DEFAULT_DEGREE,
    cascade => TRUE
  );
END;
/

