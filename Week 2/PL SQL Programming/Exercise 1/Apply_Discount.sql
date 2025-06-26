BEGIN
  FOR c IN (SELECT * FROM customers) LOOP
    IF c.age > 60 THEN
      UPDATE customers
      SET interest_rate = interest_rate - 1
      WHERE customer_id = c.customer_id;
    END IF;
  END LOOP;
  
  COMMIT;
END;
/
