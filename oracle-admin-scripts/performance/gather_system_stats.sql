--------------------------------------------------------------------------------
-- Script: gather_system_stats.sql
-- Descrição: Coleta estatísticas de sistema (via DBMS_STATS.GATHER_SYSTEM_STATS).
--------------------------------------------------------------------------------

-- Executa coleta de system stats (por exemplo antes/depois de carga)
BEGIN
  DBMS_STATS.GATHER_SYSTEM_STATS(
    METHOD_OPT => 'FOR ALL NUMERIC SIZE SKEWONLY',
    STATTAB => NULL,
    STATID => NULL
  );
END;
/
