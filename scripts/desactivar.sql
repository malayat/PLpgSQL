/*
  La siguiente función inhabilita las cuentas cuyo usuario 
  se encuentra en la tabla de USUARIOS_FRAUDE
  Ejemplo de uso de
  FOR <VAR> IN <QUERY>
*/

CREATE FUNCTION DESACTIVAR() RETURNS VOID AS $$

DECLARE
USR USUARIOS_FRAUDE%ROWTYPE;

BEGIN
FOR USR IN SELECT * FROM USUARIOS_FRAUDE LOOP
UPDATE CUENTAS SET INACTIVA = TRUE WHERE CLI_ID = USR.CLI_ID;
END LOOP;
END;
$$
LANGUAGE PLPGSQL