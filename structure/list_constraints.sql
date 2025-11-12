--------------------------------------------------------------------------------
-- Script: list_constraints.sql
-- Descrição: Lista constraints de uma tabela.
--------------------------------------------------------------------------------

DEFINE OWNER = 'MY_SCHEMA'
DEFINE TABLE_NAME = 'MY_TABLE'

SELECT constraint_name, constraint_type, search_condition, r_constraint_name, status
FROM dba_constraints
WHERE owner = UPPER('&OWNER') AND table_name = UPPER('&TABLE_NAME');
