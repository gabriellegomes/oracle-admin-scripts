--------------------------------------------------------------------------------
-- Script: show_parameters.sql
-- Descrição: Mostra parâmetros de inicialização (v$parameter).
--------------------------------------------------------------------------------

COLUMN name FORMAT A30
COLUMN value FORMAT A50

SELECT name, value, display_value
FROM v$parameter
ORDER BY name;
