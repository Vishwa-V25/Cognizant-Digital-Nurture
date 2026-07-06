-- STORED PROCEDURES.sql

------------------------------------------------------------
-- Procedure 1: Transfer Funds Between Accounts
------------------------------------------------------------

CREATE OR REPLACE PROCEDURE TransferFunds(
    p_fromAccount NUMBER,
    p_toAccount NUMBER,
    p_amount NUMBER
)
IS
BEGIN

    UPDATE Accounts
    SET Balance = Balance - p_amount
    WHERE AccountID = p_fromAccount;

    UPDATE Accounts
    SET Balance = Balance + p_amount
    WHERE AccountID = p_toAccount;

    COMMIT;

    DBMS_OUTPUT.PUT_LINE('Fund Transfer Successful.');

EXCEPTION
    WHEN OTHERS THEN
        ROLLBACK;
        DBMS_OUTPUT.PUT_LINE(SQLERRM);
END;
/

------------------------------------------------------------
-- Execute Procedure
------------------------------------------------------------

BEGIN
    TransferFunds(101,102,5000);
END;
/

------------------------------------------------------------
-- Procedure 2: Update Employee Salary
------------------------------------------------------------

CREATE OR REPLACE PROCEDURE UpdateSalary(
    p_empId NUMBER,
    p_increment NUMBER
)
IS
BEGIN

    UPDATE Employees
    SET Salary = Salary + p_increment
    WHERE EmployeeID = p_empId;

    COMMIT;

    DBMS_OUTPUT.PUT_LINE('Salary Updated Successfully.');

EXCEPTION
    WHEN OTHERS THEN
        ROLLBACK;
        DBMS_OUTPUT.PUT_LINE(SQLERRM);
END;
/

------------------------------------------------------------
-- Execute Procedure
------------------------------------------------------------

BEGIN
    UpdateSalary(101,5000);
END;
/

------------------------------------------------------------
-- Procedure 3: Add New Customer
------------------------------------------------------------

CREATE OR REPLACE PROCEDURE AddCustomer(
    p_customerId NUMBER,
    p_name VARCHAR2,
    p_balance NUMBER
)
IS
BEGIN

    INSERT INTO Customers(CustomerID, Name, Balance)
    VALUES(p_customerId, p_name, p_balance);

    COMMIT;

    DBMS_OUTPUT.PUT_LINE('Customer Added Successfully.');

EXCEPTION
    WHEN OTHERS THEN
        ROLLBACK;
        DBMS_OUTPUT.PUT_LINE(SQLERRM);
END;
/

------------------------------------------------------------
-- Execute Procedure
------------------------------------------------------------

BEGIN
    AddCustomer(105,'Shyam',75000);
END;
/

------------------------------------------------------------
-- Procedure 4: Display Customer Details
------------------------------------------------------------

CREATE OR REPLACE PROCEDURE DisplayCustomer(
    p_customerId NUMBER
)
IS
    v_name Customers.Name%TYPE;
    v_balance Customers.Balance%TYPE;

BEGIN

    SELECT Name, Balance
    INTO v_name, v_balance
    FROM Customers
    WHERE CustomerID = p_customerId;

    DBMS_OUTPUT.PUT_LINE('Customer Name : ' || v_name);
    DBMS_OUTPUT.PUT_LINE('Balance : ' || v_balance);

EXCEPTION
    WHEN NO_DATA_FOUND THEN
        DBMS_OUTPUT.PUT_LINE('Customer Not Found.');

    WHEN OTHERS THEN
        DBMS_OUTPUT.PUT_LINE(SQLERRM);
END;
/

------------------------------------------------------------
-- Execute Procedure
------------------------------------------------------------

BEGIN
    DisplayCustomer(101);
END;
/