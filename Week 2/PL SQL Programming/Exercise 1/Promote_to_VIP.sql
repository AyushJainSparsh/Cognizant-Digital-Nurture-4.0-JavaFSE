BEGIN
  FOR c IN (SELECT * FROM customers) LOOP
    IF c.balance > 10000 THEN
      UPDATE customers
      SET is_vip = 'TRUE'
      WHERE customer_id = c.customer_id;
    END IF;
  END LOOP;

  COMMIT;
END;
/
