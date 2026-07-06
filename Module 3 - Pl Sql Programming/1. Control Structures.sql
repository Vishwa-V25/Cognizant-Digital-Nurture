-- Program 1: Apply Discount to Senior Citizens

DECLARE
    CURSOR c_customers IS
        SELECT c.CustomerID,
               c.Name,
               TRUNC(MONTHS_BETWEEN(SYSDATE, c.DOB) / 12) AS Age,
               l.LoanID,
               l.InterestRate
        FROM Customers c
        JOIN Loans l
        ON c.CustomerID = l.CustomerID;

    v_new_rate Loans.InterestRate%TYPE;

BEGIN
    FOR rec IN c_customers LOOP

        IF rec.Age > 60 THEN

            v_new_rate := rec.InterestRate - 1;

            UPDATE Loans
            SET InterestRate = v_new_rate
            WHERE LoanID = rec.LoanID;

            DBMS_OUTPUT.PUT_LINE('Discount applied to '
                                 || rec.Name
                                 || ' Old Rate: '
                                 || rec.InterestRate
                                 || '% New Rate: '
                                 || v_new_rate
                                 || '%');
        END IF;

    END LOOP;

    COMMIT;

    DBMS_OUTPUT.PUT_LINE('Interest Rate Update Completed.');

EXCEPTION
    WHEN OTHERS THEN
        ROLLBACK;
        DBMS_OUTPUT.PUT_LINE(SQLERRM);
END;
/
------------------------------------------------------------

-- Program 2: Promote VIP Customers

BEGIN

    UPDATE Customers
    SET IsVIP = 'YES'
    WHERE Balance > 100000;

    COMMIT;

    DBMS_OUTPUT.PUT_LINE('VIP Customers Updated Successfully.');

END;
/
------------------------------------------------------------

-- Program 3: Loan Eligibility

DECLARE

    v_balance NUMBER := 80000;

BEGIN

    IF v_balance >= 50000 THEN
        DBMS_OUTPUT.PUT_LINE('Customer Eligible for Loan');

    ELSE
        DBMS_OUTPUT.PUT_LINE('Customer Not Eligible');

    END IF;

END;
/
------------------------------------------------------------

-- Program 4: Bonus Calculation using CASE

DECLARE

    v_salary NUMBER := 60000;
    v_bonus NUMBER;

BEGIN

    CASE

        WHEN v_salary >= 50000 THEN
            v_bonus := v_salary * 0.10;

        WHEN v_salary >= 30000 THEN
            v_bonus := v_salary * 0.05;

        ELSE
            v_bonus := v_salary * 0.02;

    END CASE;

    DBMS_OUTPUT.PUT_LINE('Bonus = ' || v_bonus);

END;
/
------------------------------------------------------------

-- Program 5: FOR LOOP Example

BEGIN

    FOR i IN 1..5 LOOP
        DBMS_OUTPUT.PUT_LINE('Iteration : ' || i);
    END LOOP;

END;
/