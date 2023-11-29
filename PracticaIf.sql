/*
 PRÁCTICA 1
• Debemos hacer un bloque PL/SQL anónimo, donde declaramos una variable 
NUMBER y la ponemos algún valor.
• Debe indicar si el número es PAR o IMPAR. Es decir debemos usar IF..... ELSE 
para hacer el ejercicio
• Como pista, recuerda que hay una función en SQL denominada MOD, que 
permite averiguar el resto de una división.
• Por ejemplo MOD(10,4) nos devuelve el resto de dividir 10 por 4.
*/
SET SERVEROUTPUT ON

DECLARE
    entrada   NUMBER := 121;
    resto     NUMBER;
    salida    VARCHAR2(50);
BEGIN
    resto := MOD(entrada, 2);
    IF resto = 0 THEN
        salida := 'PAR';
    ELSE
        salida := 'IMPAR';
    END IF;

    dbms_output.put_line('El nùmero: '
                         || entrada
                         || ' es '
                         || salida);
END;

/*
PRÁCTICA 2
• Crear una variable CHAR(1) denominada TIPO_PRODUCTO.
• Poner un valor entre "A" Y "E"
• Visualizar el siguiente resultado según el tipo de producto
o 'A' --> Electronica
o 'B' --> Informática
o 'C' --> Ropa
o 'D' --> Música
o 'E' --> Libros
o Cualquier otro valor debe visualizar "El código es incorrecto"

*/

DECLARE
    tipo_producto   CHAR(1) := 'D';
    resultado       VARCHAR2(10);
BEGIN
    IF tipo_producto = 'A' THEN
        resultado := 'Electronica';
    ELSIF tipo_producto = 'B' THEN
        resultado := 'Informática';
    ELSIF tipo_producto = 'C' THEN
        resultado := 'Ropa';
    ELSIF tipo_producto = 'D' THEN
        resultado := 'Música';
    ELSIF tipo_producto = 'E' THEN
        resultado := 'Libros';
    ELSE
        resultado := 'N/A';
    END IF;

    dbms_output.put_line('Tipo de producto: '
                         || tipo_producto
                         || ', '
                         || resultado);
END;
