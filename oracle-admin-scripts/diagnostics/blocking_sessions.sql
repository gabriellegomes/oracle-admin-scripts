--------------------------------------------------------------------------------
-- Script: blocking_sessions.sql
-- Descrição: Mostra sessões bloqueadoras e bloqueadas.
--------------------------------------------------------------------------------

-- Usa view v$lock e v$session para identificar bloqueios
SELECT l1.sid as blocker_sid, s1.username as blocker_user,
       l2.sid as waiting_sid, s2.username as waiting_user,
       l1.type, l1.id1, l1.id2
FROM v$lock l1
JOIN v$lock l2 ON l1.id1 = l2.id1 AND l1.id2 = l2.id2 AND l1.block = 1 AND l2.request > 0
JOIN v$session s1 ON l1.sid = s1.sid
JOIN v$session s2 ON l2.sid = s2.sid;
