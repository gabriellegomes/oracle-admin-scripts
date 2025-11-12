--------------------------------------------------------------------------------
-- Script: show_privileges.sql
-- Descrição: Lista privilégios do usuário atual.
--------------------------------------------------------------------------------

SELECT * FROM user_sys_privs;
SELECT * FROM user_tab_privs;
SELECT * FROM user_role_privs;
