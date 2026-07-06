-- CURSORS.sql

------------------------------------------------------------
-- Program 1: Display All Customer Details
------------------------------------------------------------

DECLARE

    CURSOR customer_cursor IS
        SELECT CustomerID, Name, Balance
        FROM Customers;

    v_id Customers.CustomerID%TYPE;
    v_name Customers.Name%TYPE;
    v_balance Customers.Balance%TYPE;

BEGIN

    OPEN customer_cursor;

    LOOP

        FETCH customer_cursor
        INTO v_id, v_name, v_balance;

        EXIT WHEN customer_cursor%NOTFOUND;

        DBMS_OUTPUT.PUT_LINE(
            'ID : ' || v_id ||
            '  Name : ' || v_name ||
            '  Balance : ' || v_balance
        );

    END LOOP;

    CLOSE customer_cursor;

END;
/

------------------------------------------------------------
-- Program 2: Display Employee Details
------------------------------------------------------------

DECLARE

    CURSOR employee_cursor IS
        SELECT EmployeeID, Name, Salary
        FROM Employees;

BEGIN

    FOR emp IN employee_cursor LOOP

        DBMS_OUTPUT.PUT_LINE(
            'Employee ID : ' || emp.EmployeeID ||
            '  Name : ' || emp.Name ||
            '  Salary : ' || emp.Salary
        );

    END LOOP;

END;
/

------------------------------------------------------------
-- Program 3: Update Loan Interest
------------------------------------------------------------

DECLARE

    CURSOR loan_cursor IS
        SELECT LoanID, InterestRate
        FROM Loans
        FOR UPDATE;

BEGIN

    FOR loan IN loan_cursor LOOP

        UPDATE Loans
        SET InterestRate = loan.InterestRate - 0.5
        WHERE CURRENT OF loan_cursor;

    END LOOP;

    COMMIT;

    DBMS_OUTPUT.PUT_LINE('Interest Rates Updated.');

END;
/

------------------------------------------------------------
-- Program 4: Display High Balance Customers
------------------------------------------------------------

DECLARE

    CURSOR balance_cursor IS
        SELECT CustomerID, Name, Balance
        FROM Customers
        WHERE Balance > 50000;

BEGIN

    FOR customer IN balance_cursor LOOP

        DBMS_OUTPUT.PUT_LINE(
            customer.CustomerID || ' - ' ||
            customer.Name || ' - ' ||
            customer.Balance
        );

    END LOOP;

END;
/

------------------------------------------------------------
-- Program 5: Count Total Customers
------------------------------------------------------------

DECLARE

    CURSOR customer_cursor IS
        SELECT Name
        FROM Customers;

    total NUMBER := 0;

BEGIN

    FOR customer IN customer_cursor LOOP
        total := total + 1;
    END LOOP;

    DBMS_OUTPUT.PUT_LINE('Total Customers : ' || total);

END;
/