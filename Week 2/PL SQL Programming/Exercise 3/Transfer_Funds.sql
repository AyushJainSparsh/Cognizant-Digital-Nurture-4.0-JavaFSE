CREATE OR REPLACE PROCEDURE TransferFunds (
  from_acc_id IN NUMBER,
  to_acc_id IN NUMBER,
  amount IN NUMBER
) AS
  insufficient_funds EXCEPTION;
  from_balance NUMBER;
BEGIN
  SELECT balance INTO from_balance FROM accounts WHERE account_id = from_acc_id;

  IF from_balance < amount THEN
    RAISE insufficient_funds;
  END IF;

  -- Deduct from sender
  UPDATE accounts SET balance = balance - amount WHERE account_id = from_acc_id;

  -- Add to receiver
  UPDATE accounts SET balance = balance + amount WHERE account_id = to_acc_id;

  COMMIT;

EXCEPTION
  WHEN insufficient_funds THEN
    DBMS_OUTPUT.PUT_LINE('Error: Insufficient balance in source account.');
  WHEN OTHERS THEN
    DBMS_OUTPUT.PUT_LINE('An unexpected error occurred.');
END;
/
