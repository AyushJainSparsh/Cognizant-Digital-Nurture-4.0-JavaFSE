-- Drop existing tables if they exist
BEGIN
  EXECUTE IMMEDIATE 'DROP TABLE accounts';
EXCEPTION
  WHEN OTHERS THEN NULL;
END;
/

BEGIN
  EXECUTE IMMEDIATE 'DROP TABLE employees';
EXCEPTION
  WHEN OTHERS THEN NULL;
END;
/

-- Create savings accounts table
CREATE TABLE accounts (
    account_id NUMBER PRIMARY KEY,
    customer_id NUMBER,
    account_type VARCHAR2(20),
    balance NUMBER
);

-- Create employees table
CREATE TABLE employees (
    emp_id NUMBER PRIMARY KEY,
    name VARCHAR2(50),
    department VARCHAR2(30),
    salary NUMBER
);

-- Insert dummy data
INSERT INTO accounts VALUES (1, 101, 'savings', 10000);
INSERT INTO accounts VALUES (2, 102, 'savings', 15000);
INSERT INTO accounts VALUES (3, 103, 'current', 20000);

INSERT INTO employees VALUES (1, 'Rahul', 'HR', 30000);
INSERT INTO employees VALUES (2, 'Anita', 'IT', 45000);
INSERT INTO employees VALUES (3, 'Ravi', 'IT', 50000);

COMMIT;

