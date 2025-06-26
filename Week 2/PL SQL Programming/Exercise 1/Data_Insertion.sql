-- Drop tables if already exist
BEGIN
  EXECUTE IMMEDIATE 'DROP TABLE customers';
EXCEPTION
  WHEN OTHERS THEN NULL;
END;
/

BEGIN
  EXECUTE IMMEDIATE 'DROP TABLE loans';
EXCEPTION
  WHEN OTHERS THEN NULL;
END;
/

-- Create customers table
CREATE TABLE customers (
    customer_id NUMBER PRIMARY KEY,
    name VARCHAR2(50),
    age NUMBER,
    balance NUMBER,
    is_vip VARCHAR2(5),
    interest_rate NUMBER
);

-- Create loans table
CREATE TABLE loans (
    loan_id NUMBER PRIMARY KEY,
    customer_id NUMBER,
    due_date DATE,
    FOREIGN KEY (customer_id) REFERENCES customers(customer_id)
);

-- Insert sample data
INSERT INTO customers VALUES (1, 'Ravi Kumar', 65, 15000, 'FALSE', 8.5);
INSERT INTO customers VALUES (2, 'Priya Singh', 45, 9500, 'FALSE', 9.2);
INSERT INTO customers VALUES (3, 'Alok Mehta', 70, 12000, 'FALSE', 8.8);
INSERT INTO customers VALUES (4, 'Neha Jain', 35, 8000, 'FALSE', 10.1);

INSERT INTO loans VALUES (101, 1, SYSDATE + 10);
INSERT INTO loans VALUES (102, 2, SYSDATE + 40);
INSERT INTO loans VALUES (103, 3, SYSDATE + 20);
INSERT INTO loans VALUES (104, 4, SYSDATE + 5);

COMMIT;
