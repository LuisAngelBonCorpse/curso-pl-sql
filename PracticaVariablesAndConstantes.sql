/*
 Queremos calcular el impuesto de un producto
o El impuesto será del 21%. Le debemos poner en una constante
o Creamos una variable de tipo number (5,2) para poner el precio del 
producto
o Creamos otra variable para el resultado. Le decimos que es del 
mismo tipo (type) que la anterior
o Hacemos el cálculo y visualizamos el resultado
*/

DECLARE
TASA CONSTANT NUMBER:= 21/100;
PRECIO NUMBER(5,2) := 499;
RESULTADO PRECIO%TYPE;
BEGIN
RESULTADO:= PRECIO*TASA;
dbms_output.put_line(RESULTADO);
END;
