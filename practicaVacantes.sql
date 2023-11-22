--1
--Un bloque begin end debe tener al menos un comando

--2
SET SERVEROUTPUT ON

DECLARE
    x   NUMBER := 10;
    z   NUMBER := 20;
BEGIN
    dbms_output.put_line(x + z);
END;

--3

SET SERVEROUTPUT ON

DECLARE
    x   NUMBER := 10;
    z   NUMBER := NULL;
BEGIN
    dbms_output.put_line(x + z);
END;

--4

SET SERVEROUTPUT ON

DECLARE
    x   NUMBER := 10;
    z   NUMBER := 20;
    y   CONSTANT NUMBER := 30;
BEGIN
    dbms_output.put_line(x + z + y);
    --y:=12; no es posible cambiar una constante
END;

--5

SET SERVEROUTPUT ON

DECLARE
    nombre   VARCHAR2(20) := 'LUIS ANGEL';
    edad   NUMBER := 27;
    fechaDeNacimiento   DATE := '16-AGO-1996';
BEGIN
    dbms_output.put_line(nombre);
    dbms_output.put_line(edad);
    dbms_output.put_line(fechaDeNacimiento);
    dbms_output.put_line(nombre||' '||fechaDeNacimiento||' '||edad);
    
END;
