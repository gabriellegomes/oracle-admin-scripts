--------------------------------------------------------------------------------
-- Script: invalid_objects.sql
-- Descrição: Lista objetos inválidos e gera comandos para recompilar.
--------------------------------------------------------------------------------

COLUMN owner FORMAT A20
COLUMN name FORMAT A30
COLUMN type FORMAT A10

SELECT owner, object_name AS name, object_type AS type
FROM dba_objects
WHERE status = 'INVALID'
ORDER BY owner, name;

-- Exemplo para recompilar:
-- EXEC DBMS_UTILITY.COMPILE_SCHEMA(schema => 'MY_SCHEMA');
