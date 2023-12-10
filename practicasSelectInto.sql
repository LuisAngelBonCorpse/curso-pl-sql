/*
1. PRÁCTICA 1
Crear un bloque PL/SQL que devuelva al salario máximo del 
departamento 100 y lo deje en una variable denominada salario_maximo 
y la visualice
*/
SET SERVEROUTPUT ON

DECLARE
    salario_maximo employees.salary%TYPE;
BEGIN
    SELECT
        MAX(salary) "Maximum"
    INTO salario_maximo
    FROM
        employees
    WHERE
        department_id = 100;

    dbms_output.put_line(salario_maximo);
END;

/*
2. PRÁCTICA 2
Visualizar el tipo de trabajo del empleado número 100
*/

DECLARE
    tipo_trabajo employees.job_id%TYPE;
BEGIN
    SELECT
        job_id
    INTO tipo_trabajo
    FROM
        employees
    WHERE
        employee_id = 100;

    dbms_output.put_line(tipo_trabajo);
END;

/*
3. PRÁCTICA 3
• Crear una variable de tipo DEPARTMENT_ID y ponerla algún valor, por 
ejemplo 10.
• Visualizar el nombre de ese departamento y el número de empleados 
que tiene, poniendo. Crear dos variables para albergar los valores.
*/

DECLARE
    id_departamento       employees.department_id%TYPE := 90;
    nombre_departamento   departments.department_name%TYPE;
    empleados             NUMBER;
BEGIN
    SELECT
        COUNT(*)
    INTO empleados
    FROM
        employees
    WHERE
        department_id = id_departamento
    ;

    SELECT
        department_name
    INTO nombre_departamento
    FROM
        departments
    WHERE
        department_id = id_departamento;

    dbms_output.put_line('Numero de empleados del departamento '
                         || nombre_departamento
                         || ': '
                         || empleados);
END;

/*
4. PRÁCTICA 4
• Mediante dos consultas recuperar el salario máximo y el salario mínimo 
de la empresa e indicar su diferencia
*/

DECLARE
    salario_maximo employees.salary%TYPE;
    salario_minimo employees.salary%TYPE;
BEGIN
    SELECT
        MAX(salary)
    INTO salario_maximo
    FROM
        employees;
        
    SELECT
        MIN(salary)
    INTO salario_minimo
    FROM
        employees;

    dbms_output.put_line(salario_maximo-salario_minimo);
END;
