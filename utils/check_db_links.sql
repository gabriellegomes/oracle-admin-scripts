--------------------------------------------------------------------------------
-- Script: check_db_links.sql
-- Descrição: Lista DB Links e testa conexão via SELECT 1@dblink (quando possível).
--------------------------------------------------------------------------------

SELECT owner, db_link, username, host FROM dba_db_links;
