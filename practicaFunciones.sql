/*
1. Visualizar iniciales de un nombre
• Crea un bloque PL/SQL con tres variables VARCHAR2: 
o Nombre
o apellido1
o apellido2
• Debes visualizar las iniciales separadas por puntos.
• Además siempre en mayúscula
• Por ejemplo alberto pérez García debería aparecer--> A.P.G
*/
SET SERVEROUTPUT ON

DECLARE
    nombre      VARCHAR2(50);
    apellido1   VARCHAR2(50);
    apellido2   VARCHAR2(50);
BEGIN
    nombre := 'luis';
    apellido1 := 'duran';
    apellido2 := 'lopez';
    dbms_output.put_line(upper(substr(nombre, 0, 1))
                         || '.'
                         || upper(substr(apellido1, 0, 1))
                         || '.'
                         || upper(substr(apellido2, 0, 1)));

END;

/*
2. Averiguar el nombre del día que naciste, por ejemplo "Martes"
*/

DECLARE
    fecha DATE;
BEGIN
    fecha := '21/08/96';
    dbms_output.put_line(TO_CHAR(fecha, 'day'));
END;
