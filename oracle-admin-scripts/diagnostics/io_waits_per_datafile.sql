--------------------------------------------------------------------------------
-- Script: io_waits_per_datafile.sql
-- Descrição: Identifica datafiles com maiores tempos de IO (amostra V$FILESTAT).
--------------------------------------------------------------------------------

SELECT file#, DECODE(name, NULL, 'UNKNOWN', name) name, phyrds, phywrts
FROM v$filestat
ORDER BY phyrds+phywrts DESC FETCH FIRST 50 ROWS ONLY;
