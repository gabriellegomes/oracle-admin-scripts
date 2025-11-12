--------------------------------------------------------------------------------
-- Script: spool_output.sql
-- Descrição: Exemplo de uso de SPOOL para salvar saída em arquivo.
--------------------------------------------------------------------------------

-- Defina nome do arquivo de saída
DEFINE OUTFILE = 'teste.txt'

SPOOL &OUTFILE

SELECT sysdate FROM dual;
SPOOL OFF

PROMPT Output salvo em &OUTFILE
