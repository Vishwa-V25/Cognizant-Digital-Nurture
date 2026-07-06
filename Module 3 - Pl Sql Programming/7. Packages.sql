-- PACKAGES.sql

------------------------------------------------------------
-- Package Specification
------------------------------------------------------------

CREATE OR REPLACE PACKAGE BankPackage AS

    PROCEDURE AddCustomer(
        p_customerId NUMBER,
        p_name VARCHAR2,
        p_balance NUMBER
    );

    PROCEDURE UpdateBalance(
        p_customerId NUMBER,
        p_amount NUMBER
    );

    FUNCTION GetBalance(
        p_customerId NUMBER
    ) RETURN NUMBER;

END BankPackage;
/

------------------------------------------------------------
-- Package Body
------------------------------------------------------------

CREATE OR REPLACE PACKAGE BODY BankPackage AS

------------------------------------------------------------
-- Procedure to Add Customer
------------------------------------------------------------

PROCEDURE AddCustomer(
    p_customerId NUMBER,
    p_name VARCHAR2,
    p_balance NUMBER
)
IS
BEGIN

    INSERT INTO Customers(CustomerID, Name, Balance)
    VALUES(p_customerId, p_name, p_balance);

    DBMS_OUTPUT.PUT_LINE('Customer Added Successfully.');

END AddCustomer;

------------------------------------------------------------
-- Procedure to Update Balance
------------------------------------------------------------

PROCEDURE UpdateBalance(
    p_customerId NUMBER,
    p_amount NUMBER
)
IS
BEGIN

    UPDATE Customers
    SET Balance = Balance + p_amount
    WHERE CustomerID = p_customerId;

    DBMS_OUTPUT.PUT_LINE('Balance Updated Successfully.');

END UpdateBalance;

------------------------------------------------------------
-- Function to Get Balance
------------------------------------------------------------

FUNCTION GetBalance(
    p_customerId NUMBER
)
RETURN NUMBER
IS

    v_balance Customers.Balance%TYPE;

BEGIN

    SELECT Balance
    INTO v_balance
    FROM Customers
    WHERE CustomerID = p_customerId;

    RETURN v_balance;

EXCEPTION
    WHEN NO_DATA_FOUND THEN
        RETURN 0;

END GetBalance;

END BankPackage;
/

------------------------------------------------------------
-- Execute Package Procedures and Function
------------------------------------------------------------

BEGIN

    BankPackage.AddCustomer(105,'Shyam',50000);

    BankPackage.UpdateBalance(105,10000);

END;
/

------------------------------------------------------------
-- Display Customer Balance
------------------------------------------------------------

DECLARE

    v_balance NUMBER;

BEGIN

    v_balance := BankPackage.GetBalance(105);

    DBMS_OUTPUT.PUT_LINE('Customer Balance = ' || v_balance);

END;
/