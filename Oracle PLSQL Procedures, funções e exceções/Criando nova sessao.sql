alter session set "_ORACLE_SCRIPT"=true;

CREATE user cursoplsql IDENTIFIED BY cursoplsql DEFAULT tablespace users;

GRANT connect, resource TO cursoplsql;