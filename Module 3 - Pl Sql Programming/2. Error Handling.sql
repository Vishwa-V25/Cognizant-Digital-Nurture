-- ERROR HANDLING.sql

-- Program 1: Handle Divide by Zero

DECLARE
    v_num1 NUMBER := 100;
    v_num2 NUMBER := 0;
    v_result NUMBER;

BEGIN
    v_result := v_num1 / v_num2;

    DBMS_OUTPUT.PUT_LINE('Result = ' || v_result);

EXCEPTION
    WHEN ZERO_DIVIDE THEN
        DBMS_OUTPUT.PUT_LINE('Error: Division by Zero is not allowed.');

    WHEN OTHERS THEN
        DBMS_OUTPUT.PUT_LINE('Unexpected Error: ' || SQLERRM);
END;
/
------------------------------------------------------------

-- Program 2: Handle NO_DATA_FOUND

DECLARE
    v_name Customers.Name%TYPE;

BEGIN
    SELECT Name
    INTO v_name
    FROM Customers
    WHERE CustomerID = 9999;

    DBMS_OUTPUT.PUT_LINE('Customer Name: ' || v_name);

EXCEPTION
    WHEN NO_DATA_FOUND THEN
        DBMS_OUTPUT.PUT_LINE('Customer not found.');

    WHEN OTHERS THEN
        DBMS_OUTPUT.PUT_LINE(SQLERRM);
END;
/
------------------------------------------------------------

-- Program 3: Handle TOO_MANY_ROWS

DECLARE
    v_name Customers.Name%TYPE;

BEGIN
    SELECT Name
    INTO v_name
    FROM Customers
    WHERE Balance > 50000;

    DBMS_OUTPUT.PUT_LINE(v_name);

EXCEPTION
    WHEN TOO_MANY_ROWS THEN
        DBMS_OUTPUT.PUT_LINE('More than one customer found.');

    WHEN OTHERS THEN
        DBMS_OUTPUT.PUT_LINE(SQLERRM);
END;
/
------------------------------------------------------------

-- Program 4: User Defined Exception

DECLARE
    v_age NUMBER := 16;

    invalid_age EXCEPTION;

BEGIN

    IF v_age < 18 THEN
        RAISE invalid_age;
    END IF;

    DBMS_OUTPUT.PUT_LINE('Eligible');

EXCEPTION

    WHEN invalid_age THEN
        DBMS_OUTPUT.PUT_LINE('Age must be 18 or above.');

    WHEN OTHERS THEN
        DBMS_OUTPUT.PUT_LINE(SQLERRM);

END;
/
------------------------------------------------------------

-- Program 5: Rollback on Error

BEGIN

    UPDATE Customers
    SET Balance = Balance + 1000
    WHERE CustomerID = 101;

    COMMIT;

EXCEPTION

    WHEN OTHERS THEN
        ROLLBACK;
        DBMS_OUTPUT.PUT_LINE('Transaction Rolled Back.');
        DBMS_OUTPUT.PUT_LINE(SQLERRM);

END;
/