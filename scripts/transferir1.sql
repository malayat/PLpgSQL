/* 
  Función que transfiere dinero de una cuenta a otra
  Ejemplo de uso:
  select transferir(id_cuenta_1, id_cuenta_2, valor_a_transferir);
*/

CREATE FUNCTION TRANSFERIR (CTA1 CUENTAS.ID%TYPE, CTA2 CUENTAS.ID%TYPE, MONTO CUENTAS.SALDO%TYPE) 
RETURNS CUENTAS.SALDO%TYPE AS $$

DECLARE
  SALDO_NUEVO CUENTAS.SALDO%TYPE;

BEGIN
  UPDATE CUENTAS SET SALDO = SALDO - MONTO WHERE ID = CTA1;
  UPDATE CUENTAS SET SALDO = SALDO + MONTO WHERE ID = CTA2;
  SELECT SALDO INTO SALDO_NUEVO FROM CUENTAS WHERE ID = CTA2;
  RETURN SALDO_NUEVO;
END;
$$
LANGUAGE PLPGSQL;