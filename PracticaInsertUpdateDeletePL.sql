/*
1- Crear un bloque que inserte un nuevo departamento en la tabla 
DEPARTMENTS. Para saber el DEPARTMENT_ID que debemos asignar al 
nuevo departamento primero debemos averiguar el valor mayor que hay en la 
tabla DEPARTMENTS y sumarle uno para la nueva clave.
• Location_id debe ser 1000
• Manager_id debe ser 100
• Department_name debe ser “INFORMATICA”
• NOTA: en PL/SQL debemos usar COMMIT y ROLLBACK de la misma 
forma que lo hacemos en SQL. Por tanto, para validar definitivamente un 
cambio debemos usar COMMIT
*/
DECLARE
    cod_departamento    departments.department_id%TYPE;
    nom_departamento    departments.department_name%TYPE;
    cod_administrador   departments.manager_id%TYPE;
    cod_locacion        departments.location_id%TYPE;
BEGIN
    cod_administrador := 100;
    cod_locacion := 1000;
    nom_departamento := 'INFORMATICA';
    SELECT
        MAX(department_id)
    INTO cod_departamento
    FROM
        departments;

    cod_departamento := cod_departamento + 1;
    INSERT INTO departments (
        department_id,
        department_name,
        manager_id,
        location_id
    ) VALUES (
        cod_departamento,
        nom_departamento,
        cod_administrador,
        cod_locacion
    );

    COMMIT;
END;

/*
2. Crear un bloque PL/SQL que modifique la LOCATION_ID del nuevo 
departamento a 1700. En este caso usemos el COMMIT dentro del bloque 
PL/SQL.
*/

DECLARE
    cod_departamento departments.department_id%TYPE;
BEGIN
    SELECT
        MAX(department_id)
    INTO cod_departamento
    from
        departments;

    UPDATE departments
    SET
        location_id = 1700
    WHERE
        department_id = cod_departamento;

    COMMIT;
END;

/*
3- Por último, hacer otro bloque PL/SQL que elimine ese departamento nuevo
*/

DECLARE
    cod_departamento departments.department_id%TYPE;
BEGIN
    SELECT
        MAX(department_id)
    INTO cod_departamento
    FROM
        departments;

    DELETE FROM departments
    WHERE
        department_id = cod_departamento;

    COMMIT;
END;
