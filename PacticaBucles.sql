/*
. Práctica 1
• Vamos a crear la tabla de multiplicar del 1 al 10, con los tres tipos de 
bucles: LOOP, WHILE y FOR
*/
DECLARE
    conloop    NUMBER := 0;
    conwhile   NUMBER := 0;
BEGIN
    dbms_output.put_line('Tabla del 1 con Loop');
    LOOP
        conloop := conloop + 1;
        dbms_output.put_line('1 x '
                             || conloop
                             || ' = '
                             || conloop);
        EXIT WHEN conloop = 10;
    END LOOP;

    dbms_output.put_line('Tabla del 1 con For');
    FOR i IN 1..10 LOOP dbms_output.put_line('1 x '
                                             || i
                                             || ' = '
                                             || i);
    END LOOP;

    dbms_output.put_line('Tabla del 1 con While');
    WHILE conwhile < 10 LOOP
        conwhile := conwhile + 1;
        dbms_output.put_line('1 x '
                             || conwhile
                             || ' = '
                             || conwhile);
    END LOOP;

END;

/*
2. Práctica 2-
• Crear una variable llamada TEXTO de tipo VARCHAR2(100).
• Poner alguna frase
• Mediante un bucle, escribir la frase al revés, Usamos el bucle WHILE
*/

DECLARE
    texto       VARCHAR2(100) := 'Se que es tarde ya, para pedir perdon, se que es tarde ya y lo siento.... Termina nuestro amor';
    resultado   VARCHAR2(100) := '';
    i           NUMBER := 1;
BEGIN
    WHILE i < length(texto) + 1 LOOP
        resultado := resultado
                     || substr(texto, -i, 1);
        i := i + 1;
    END LOOP;

    dbms_output.put_line(texto);
    dbms_output.put_line(resultado);
END;

/*
3. Práctica 3
• Usando la práctica anterior, si en el texto aparece el carácter "x" debe 
salir del bucle. Es igual en mayúsculas o minúsculas.
• Debemos usar la cláusula EXIT.
*/

DECLARE
    texto       VARCHAR2(100) := 'Se que es tarde ya, para pedir perdonx, se que es tarde ya y lo siento.... Termina nuestro amor';
    resultado   VARCHAR2(100) := '';
    i           NUMBER := 1;
BEGIN
    WHILE i < length(texto) + 1 LOOP
        EXIT WHEN upper(substr(texto, -i, 1)) = 'X';
        resultado := resultado
                     || substr(texto, -i, 1);
        i := i + 1;
    END LOOP;

    dbms_output.put_line(texto);
    dbms_output.put_line(resultado);
END;
/*
4. Práctica 4
• Debemos crear una variable llamada NOMBRE
• Debemos pintar tantos asteriscos como letras tenga el nombre. 
Usamos un bucle FOR
• Por ejemplo Alberto → *******
• O por ejemplo Pedro → *****
*/

DECLARE
    nombre   VARCHAR2(20) := 'Alberto';
    salida   VARCHAR2(20) := '';
BEGIN
    FOR i IN 1..length(nombre) LOOP salida := salida || '*';
    END LOOP;

    dbms_output.put_line(nombre);
    dbms_output.put_line(salida);
END;

/*
5. Práctica 5
• Creamos dos variables numéricas, "inicio y fin"
• Las inicializamos con algún valor:
• Debemos sacar los números que sean múltiplos de 4 de ese rango
*/

DECLARE
    inicio   NUMBER := 12;
    fin      NUMBER := 61;
BEGIN
    FOR i IN inicio..fin LOOP
        IF MOD(i, 4) = 0 THEN
            dbms_output.put_line(i);
        END IF;
    END LOOP;
END;
