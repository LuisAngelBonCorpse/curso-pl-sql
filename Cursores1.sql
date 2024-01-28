/*
CURSORES

LOS HAY:
    IMPLICITOS
    EXPLICITOS

POR EJEMPLO:
    SQL&isopen
    SQL&found 
    SQL&notfound
    SQL&ROWCOUNT
*/
SET SERVEROUTPUT ON

--DECLARE
  --  x NUMBER;
BEGIN
    UPDATE test
    SET
        c2 = 'ADIOS'
    WHERE
        c1 = 100;

    dbms_output.put_line(SQL%rowcount);
    
    IF SQL%found THEN
        dbms_output.put_line('ENCONTRADO');
    END IF;
    
    IF SQL%notfound THEN
        dbms_output.put_line('NO ENCONTRADO');
    END IF;
    
    /*
    SELECT
        c1
    INTO x
    FROM
        test
    WHERE
        c1 = 1000;

    IF SQL%notfound THEN
        dbms_output.put_line("NO EXISTE FILA");
    END IF;
    
    No funciona esta parte debido a que primero se detona la excepcion y no llega al IF.
    
    */
END;