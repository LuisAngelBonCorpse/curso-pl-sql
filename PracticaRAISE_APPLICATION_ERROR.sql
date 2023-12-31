/*
1. Modificar la practica anterior para disparar un error con RAISE_APPLICATION en vez de con PUT_LINE.
a. Esto permite que la aplicación pueda capturar y gestionar el error que devuelve el PL/SQL
*/
SET SERVEROUTPU ON

DECLARE
    
    regn   NUMBER;
    regt   VARCHAR2(200);
BEGIN
    regn := 201;
    regt := 'NORTEAMERICA';
    IF regn > 200 THEN
        RAISE_APPLICATION_ERROR(-20002, 'La region no puede ser mayor a 200. Favor de seleccionar un numero menor.');
    ELSE
        INSERT INTO REGIONS VALUES (
            regn,
            regt
        );

        COMMIT;
    END IF;

END;
