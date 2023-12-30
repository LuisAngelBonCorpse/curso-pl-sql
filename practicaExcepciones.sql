/*
1- Crear una SELECT (no un cursor explícito) que devuelva el nombre de un 
empleado pasándole el EMPLOYEE_ID en el WHERE, 
    • Comprobar en primer lugar que funciona pasando un empleado existente  
    • Pasar un empleado inexistente y comprobar que genera un error
    • Crear una zona de EXCEPTION controlando el NO_DATA_FOUND para que pinte un mensaje como “Empleado inexistente”
*/
DECLARE
    nombre employees.first_name%TYPE;
BEGIN
    SELECT
        first_name
    INTO nombre
    FROM
        employees
    WHERE
        employee_id = 1000; --100

    dbms_output.put_line(nombre);
EXCEPTION
    WHEN no_data_found THEN
        dbms_output.put_line('Empleado inexistente');
    WHEN OTHERS THEN
        dbms_output.put_line(sqlcode);
        dbms_output.put_line(sqlerrm);
END;

/*
2- Modificar la SELECT para que devuelva más de un empleado, por ejemplo 
poniendo EMPLOYEE_ID> 100. Debe generar un error. Controlar la 
excepción para que genere un mensaje como “Demasiados empleados 
en la consulta”
*/

DECLARE
    nombre employees.first_name%TYPE;
BEGIN
    SELECT
        first_name
    INTO nombre
    FROM
        employees
    WHERE
        employee_id < 1000;

    dbms_output.put_line(nombre);
EXCEPTION
    WHEN no_data_found THEN
        dbms_output.put_line('Empleado inexistente');
    WHEN too_many_rows THEN
        dbms_output.put_line('Demasiados empleados en la consulta');
    WHEN OTHERS THEN
        dbms_output.put_line(sqlcode);
        dbms_output.put_line(sqlerrm);
END;

/*
3- Modificar la consulta para que devuelva un error de división por CERO, 
por ejemplo, vamos a devolver el salario en vez del nombre y lo dividimos 
por 0. En este caso, en vez de controlar la excepción directamente, 
creamos una sección WHEN OTHERS y pintamos el error con SQLCODE 
y SQLERR
*/

DECLARE
    nombre employees.first_name%TYPE;
BEGIN
    SELECT
        first_name
    INTO nombre
    FROM
        employees
    WHERE
        employee_id = 1000/0;

    dbms_output.put_line(nombre);
EXCEPTION
    WHEN no_data_found THEN
        dbms_output.put_line('Empleado inexistente');
    WHEN too_many_rows THEN
        dbms_output.put_line('Demasiados empleados en la consulta');
    WHEN OTHERS THEN
        dbms_output.put_line(sqlcode);
        dbms_output.put_line(sqlerrm);
END;

/*
4- El error -00001 es clave primaria duplicada. 
a. Aunque ya existe una predefinida (DUP_VAL_ON_INDEX) vamos 
a crear una excepción no -predefinida que haga lo mismo. 
b. Vamos a usar la tabla REGIONS para hacerlo más fácil 
c. Usamos PRAGMA EXCEPTION_INIT y creamos una excepción 
denominada “duplicado”. 
d. Cuando se genere ese error debemos pintar “Clave duplicada, 
intente otra”. 
*/

DECLARE
    duplicado EXCEPTION;
    PRAGMA exception_init ( duplicado, -00001 );
    v1 NUMBER := 1;
BEGIN
    INSERT INTO regions VALUES ( v1, 'Europe' );

    dbms_output.put_line(v1);
EXCEPTION
    WHEN duplicado THEN
        dbms_output.put_line('Clave duplicada, intente otra');
    WHEN OTHERS THEN
        dbms_output.put_line(sqlcode);
        dbms_output.put_line(sqlerrm);
END;
