-- FUNCTIONS.sql

------------------------------------------------------------
-- Function 1: Calculate Annual Salary
------------------------------------------------------------

CREATE OR REPLACE FUNCTION CalculateAnnualSalary(
    p_monthlySalary NUMBER
)
RETURN NUMBER
IS
BEGIN
    RETURN p_monthlySalary * 12;
END;
/

------------------------------------------------------------
-- Execute Function
------------------------------------------------------------

DECLARE
    v_salary NUMBER;
BEGIN
    v_salary := CalculateAnnualSalary(50000);

    DBMS_OUTPUT.PUT_LINE('Annual Salary = ' || v_salary);
END;
/

------------------------------------------------------------
-- Function 2: Calculate Age
------------------------------------------------------------

CREATE OR REPLACE FUNCTION CalculateAge(
    p_dob DATE
)
RETURN NUMBER
IS
BEGIN
    RETURN TRUNC(MONTHS_BETWEEN(SYSDATE, p_dob) / 12);
END;
/

------------------------------------------------------------
-- Execute Function
------------------------------------------------------------

DECLARE
    v_age NUMBER;
BEGIN
    v_age := CalculateAge(DATE '2003-05-15');

    DBMS_OUTPUT.PUT_LINE('Age = ' || v_age);
END;
/

------------------------------------------------------------
-- Function 3: Calculate Simple Interest
------------------------------------------------------------

CREATE OR REPLACE FUNCTION CalculateInterest(
    p_principal NUMBER,
    p_rate NUMBER,
    p_years NUMBER
)
RETURN NUMBER
IS
BEGIN
    RETURN (p_principal * p_rate * p_years) / 100;
END;
/

------------------------------------------------------------
-- Execute Function
------------------------------------------------------------

DECLARE
    v_interest NUMBER;
BEGIN
    v_interest := CalculateInterest(100000, 8, 2);

    DBMS_OUTPUT.PUT_LINE('Interest = ' || v_interest);
END;
/

------------------------------------------------------------
-- Function 4: Check Loan Eligibility
------------------------------------------------------------

CREATE OR REPLACE FUNCTION CheckEligibility(
    p_balance NUMBER
)
RETURN VARCHAR2
IS
BEGIN
    IF p_balance >= 50000 THEN
        RETURN 'Eligible';
    ELSE
        RETURN 'Not Eligible';
    END IF;
END;
/

------------------------------------------------------------
-- Execute Function
------------------------------------------------------------

DECLARE
    v_result VARCHAR2(20);
BEGIN
    v_result := CheckEligibility(70000);

    DBMS_OUTPUT.PUT_LINE('Loan Status : ' || v_result);
END;
/

------------------------------------------------------------
-- Function 5: Get Customer Balance
------------------------------------------------------------

CREATE OR REPLACE FUNCTION GetCustomerBalance(
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
END;
/

------------------------------------------------------------
-- Execute Function
------------------------------------------------------------

DECLARE
    v_balance NUMBER;
BEGIN
    v_balance := GetCustomerBalance(101);

    DBMS_OUTPUT.PUT_LINE('Customer Balance = ' || v_balance);
END;
/