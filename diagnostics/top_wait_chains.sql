--------------------------------------------------------------------------------
-- Script: top_wait_chains.sql
-- Descrição: Identifica cadeias de bloqueio e suas durações.
--------------------------------------------------------------------------------

-- Mostra quem bloqueia mais vezes
SELECT blocking_session, COUNT(*) cnt
FROM v$session WHERE blocking_session IS NOT NULL
GROUP BY blocking_session ORDER BY cnt DESC;
