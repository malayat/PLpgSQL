/*
  La función simplemente imprime información relacionada 
  con la cuenta que se pasa como parámetro.
  Ejemplo de uso de %ROWTYPE, es posible declarar 
  RECORDS del mismo tipo de una tabla.
*/

CREATE FUNCTION INFO_CUENTA(NUM_CUENTA INT) RETURNS VARCHAR AS $$
DECLARE
CUENTA_ROW CUENTAS%ROWTYPE;
CLIENTE_ROW CLIENTES%ROWTYPE;
RESULTADO VARCHAR;

BEGIN
  SELECT * INTO CUENTA_ROW FROM CUENTAS WHERE ID = NUM_CUENTA;
  IF NOT FOUND THEN
    RAISE EXCEPTION 'La cuenta % no existe', NUM_CUENTA;
  ELSE
    SELECT * INTO CLIENTE_ROW FROM CLIENTES WHERE ID = CUENTA_ROW.CLI_ID;
    RESULTADO:= 'La cuenta pertenece a ' || CLIENTE_ROW.NOMBRE || 
    '. Y el saldo de la cuenta es ' || CUENTA_ROW.SALDO;
    RETURN RESULTADO;
  END IF;
END;
$$
LANGUAGE PLPGSQL;