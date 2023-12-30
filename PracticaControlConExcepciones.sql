/*
1- Crear una Excepción personalizada denominada CONTROL_REGIONES.
• Debe dispararse cuando al insertar o modificar una región queramos poner una clave superior a 200. Por ejemplo usando una variable con ese valor.
• En ese caso debe generar un texto indicando algo así como “Codigo no permitido. Debe ser inferior a 200”
• Recordemos que las excepciones personalizadas deben dispararse de forma manual con el RAISE
*/

DECLARE
    CONTROL_REGIONES EXCEPTION;
    regn   NUMBER;
    regt   VARCHAR2(200);
BEGIN
    regn := 201;
    regt := 'NORTEAMERICA';
    IF regn > 200 THEN
        RAISE CONTROL_REGIONES;
    ELSE
        INSERT INTO REGIONS VALUES (
            regn,
            regt
        );

        COMMIT;
    END IF;

EXCEPTION
    WHEN CONTROL_REGIONES THEN
        dbms_output.put_line('La region no puede ser mayor a 200. Favor de seleccionar un numero menor.');
    WHEN OTHERS THEN
        dbms_output.put_line('Error indefinido');
END;
