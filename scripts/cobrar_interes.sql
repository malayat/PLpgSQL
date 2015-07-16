/*
  La siguiente función actualiza los intereses de mora en las cuentas que están sobregiradas. 
  Los intereses que se cobran son proporcionales al saldo de la cuenta 
  y se utiliza el porcentaje que se pasa como parámetro. 
*/

CREATE FUNCTION COBRAR_INTERES(PORCENTAJE REAL) RETURNS VOID AS $$
BEGIN
  UPDATE CUENTAS SET INTERESES = SALDO * PORCENTAJE * EXTRACT('DAYS' FROM (NOW() - FECHA_SOBREGIRO)) 
  WHERE FECHA_SOBREGIRO IS NOT NULL;
END;
$$
LANGUAGE PLPGSQL;