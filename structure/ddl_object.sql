--------------------------------------------------------------------------------
-- Script: ddl_object.sql
-- Descrição: Gera DDL de um objeto via DBMS_METADATA.GET_DDL.
--------------------------------------------------------------------------------

DEFINE OBJ_OWNER = 'MY_SCHEMA'
DEFINE OBJ_TYPE = 'TABLE' 
DEFINE OBJ_NAME = 'MY_TABLE'

SELECT DBMS_METADATA.GET_DDL('&OBJ_TYPE', '&OBJ_NAME', '&OBJ_OWNER') FROM DUAL;
