--------------------------------------------------------------------------------
-- Script: list_partitions.sql
-- Descrição: Lista partições de uma tabela informada.
--------------------------------------------------------------------------------

DEFINE OWNER = 'MY_SCHEMA'
DEFINE TABLE_NAME = 'MY_TABLE'

SELECT table_owner, table_name, partition_name, high_value, partition_position
FROM all_tab_partitions
WHERE table_owner = UPPER('&OWNER') AND table_name = UPPER('&TABLE_NAME')
ORDER BY partition_position;
