/*
Creamos un TYPE RECORD que tenga las siguientes columnas NAME VARCHAR2(100),SAL EMPLOYEES.SALARY%TYPE,COD_DEPT EMPLOYEES.DEPARTMENT_ID%TYPE);
    • Creamos un TYPE TABLE basado en el RECORD anterior
    • Mediante un bucle cargamos en la colección los empleados. El campo NAME debe contener FIRST_NAME y LAST_NAME concatenado.
    • Para cargar las filas y siguiendo un ejemplo parecido que hemos visto en el vídeo usamos el EMPLOYEE_ID que va de 100 a 206
• A partir de este momento y ya con la colección cargada, hacemos las siguientes operaciones, usando métodos de la colección.
    • Visualizamos toda la colección
    • Visualizamos el primer empleado
    • Visualizamos el último empleado
    • Visualizamos el número de empleados
    • Borramos los empleados que ganan menos de 7000 y visualizamos de nuevo la colección
    • Volvemos a visualizar el número de empleados para ver cuantos se han borrado
*/
SET SERVEROUTPU ON

DECLARE
    TYPE empleados_record IS RECORD (
        namee      VARCHAR2(100),
        sal        employees.salary%TYPE,
        cod_dept   employees.department_id%TYPE
    );
    TYPE empleados_table IS
        TABLE OF empleados_record INDEX BY PLS_INTEGER;
    empleado1 empleados_table;
BEGIN
    FOR i IN 100..206 LOOP SELECT
                               first_name
                               || ' '
                               || last_name,
                               salary,
                               department_id
                           INTO
                               empleado1
                           (i)
                           FROM
                               employees
                           WHERE
                               employee_id = i;

    END LOOP;

    FOR i IN empleado1.first..empleado1.last LOOP 
        dbms_output.put_line(empleado1(i).namee
                             || '   '
                             || empleado1(i).sal
                             || '   '
                             || empleado1(i).cod_dept);
    END LOOP;

    dbms_output.put_line('-------------------------------------------------------------------------');
    dbms_output.put_line('Primero: '
                         || empleado1(empleado1.first).namee
                         || '   '
                         || empleado1(empleado1.first).sal
                         || '   '
                         || empleado1(empleado1.first).cod_dept);

    dbms_output.put_line('Ultimo: '
                         || empleado1(empleado1.last).namee
                         || '   '
                         || empleado1(empleado1.last).sal
                         || '   '
                         || empleado1(empleado1.last).cod_dept);

    dbms_output.put_line('-------------------------------------------------------------------------');

    dbms_output.put_line('Nùmero de empleados: ' || empleado1.count);

    FOR i IN empleado1.first..empleado1.last LOOP 
      IF empleado1(i).sal < 7000 THEN
        empleado1.DELETE(i);
      ELSE
        dbms_output.put_line(empleado1(i).namee
                             || '   '
                             || empleado1(i).sal
                             || '   '
                             || empleado1(i).cod_dept);
      END IF;
    END LOOP;

    dbms_output.put_line('Nùmero de empleados que ganan mas de 7000: ' || empleado1.count);

END;
