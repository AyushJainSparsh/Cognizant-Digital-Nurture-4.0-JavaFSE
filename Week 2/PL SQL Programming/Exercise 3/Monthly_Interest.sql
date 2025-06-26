CREATE OR REPLACE PROCEDURE ProcessMonthlyInterest AS
BEGIN
  UPDATE accounts
  SET balance = balance + (balance * 0.01)
  WHERE account_type = 'savings';
  
  COMMIT;
END;
/
