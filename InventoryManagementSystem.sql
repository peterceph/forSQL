
-- Build an Inventory Management System using PL/SQL


CREATE TABLE Products (
    Product_ID NUMBER PRIMARY KEY,
    Product_Name VARCHAR2(100),
    Quantity NUMBER,
    Price NUMBER
);

CREATE TABLE Suppliers (
    Supplier_ID NUMBER PRIMARY KEY,
    Supplier_Name VARCHAR2(100),
    Contact VARCHAR2(100)
);

CREATE TABLE Inventory_Log (
    Log_ID NUMBER PRIMARY KEY,
    Product_ID NUMBER,
    Action VARCHAR2(20),
    Quantity_Changed NUMBER,
    Log_Date DATE DEFAULT SYSDATE
);

select * from products
select * from suppliers
select * from inventory_log



INSERT INTO Products (Product_ID, Product_Name, Quantity, Price) VALUES (101, 'Wireless Mouse', 150, 12.99);
INSERT INTO Products (Product_ID, Product_Name, Quantity, Price) VALUES (102, 'USB-C Cable', 200, 8.50);
INSERT INTO Products (Product_ID, Product_Name, Quantity, Price) VALUES (103, 'Laptop Stand', 75, 29.99);
INSERT INTO Products (Product_ID, Product_Name, Quantity, Price) VALUES (104, 'Mechanical Keyboard', 50, 69.99);
INSERT INTO Products (Product_ID, Product_Name, Quantity, Price) VALUES (105, '27-inch Monitor', 30, 199.99);
INSERT INTO Products (Product_ID, Product_Name, Quantity, Price) VALUES (106, 'External Hard Drive 1TB', 40, 59.95);
INSERT INTO Products (Product_ID, Product_Name, Quantity, Price) VALUES (107, 'Webcam HD', 60, 39.99);
INSERT INTO Products (Product_ID, Product_Name, Quantity, Price) VALUES (108, 'Desk Lamp LED', 90, 18.75);
INSERT INTO Products (Product_ID, Product_Name, Quantity, Price) VALUES (109, 'Office Chair', 20, 149.00);
INSERT INTO Products (Product_ID, Product_Name, Quantity, Price) VALUES (110, 'Noise-Cancelling Headphones', 35, 89.99);

select * from products

ALTER TABLE Products
ADD Supplier_ID NUMBER

ALTER TABLE Products
ADD CONSTRAINT fk_supplier FOREIGN KEY (Supplier_ID)
REFERENCES Suppliers(Supplier_ID);

UPDATE Products SET Supplier_ID = 1 WHERE Product_ID IN (101, 102); -- Tech Supply Co.
UPDATE Products SET Supplier_ID = 2 WHERE Product_ID IN (103, 104); -- Gadget World Ltd.
UPDATE Products SET Supplier_ID = 3 WHERE Product_ID IN (105, 106); -- Bright Office Supplies
UPDATE Products SET Supplier_ID = 4 WHERE Product_ID IN (107, 108); -- Peripheral Pros
UPDATE Products SET Supplier_ID = 5 WHERE Product_ID IN (109, 110); -- Vision Electronics


INSERT INTO Suppliers (Supplier_ID, Supplier_Name, Contact) VALUES (1, 'Tech Supply Co.', 'techsupply@example.com');
INSERT INTO Suppliers (Supplier_ID, Supplier_Name, Contact) VALUES (2, 'Gadget World Ltd.', 'sales@gadgetworld.com');
INSERT INTO Suppliers (Supplier_ID, Supplier_Name, Contact) VALUES (3, 'Bright Office Supplies', 'support@brightoffice.com');
INSERT INTO Suppliers (Supplier_ID, Supplier_Name, Contact) VALUES (4, 'Peripheral Pros', 'contact@peripheralpros.com');
INSERT INTO Suppliers (Supplier_ID, Supplier_Name, Contact) VALUES (5, 'Vision Electronics', 'info@visionelec.com');

select * from suppliers

CREATE SEQUENCE Inventory_Log_seq START WITH 1 INCREMENT BY 1;


-- IMPLEMENTING TRIGGERS---

CREATE OR REPLACE TRIGGER trg_inventory_log
AFTER INSERT OR UPDATE ON Products
FOR EACH ROW
DECLARE
    v_action VARCHAR2(20);
    v_qty_changed NUMBER;
BEGIN
    IF INSERTING THEN
        v_action := 'INSERT';
        v_qty_changed := :NEW.Quantity;
    
    ELSIF UPDATING THEN
        v_action := 'UPDATE';
        v_qty_changed := :NEW.Quantity - :OLD.Quantity;
    END IF;

    INSERT INTO Inventory_Log (Log_ID, Product_ID, Action, Quantity_Changed, Log_Date)
    VALUES (
        Inventory_Log_seq.NEXTVAL,     
        :NEW.Product_ID,
        v_action,
        v_qty_changed,
        SYSDATE
    );
END;
/


-- Insert a new product
INSERT INTO Products (Product_ID, Product_Name, Quantity, Price, Supplier_ID)
VALUES (111, 'Smart Desk', 10, 250.00, 3);

select * from inventory_log

-- Update quantity of a product
UPDATE Products SET Quantity = Quantity + 5 WHERE Product_ID = 101;





CREATE OR REPLACE TRIGGER trg_log_product_delete
AFTER DELETE ON Products
FOR EACH ROW
BEGIN
    INSERT INTO Inventory_Log (
        Log_ID,
        Product_ID,
        Action,
        Quantity_Changed,
        Log_Date
    )
    VALUES (
        Inventory_Log_seq.NEXTVAL,  -- Make sure this sequence exists
        :OLD.Product_ID,
        'DELETE',
        -:OLD.Quantity,             -- Negative quantity indicates removal
        SYSDATE
    );
END;
/

-- Deleting a product (will automatically log the action)
DELETE FROM Products WHERE Product_ID = 103;





CREATE OR REPLACE TRIGGER trg_prevent_negative_quantity
BEFORE INSERT OR UPDATE ON Products
FOR EACH ROW
BEGIN
    -- Check if the quantity is negative
    IF :NEW.Quantity < 0 THEN
        -- Raise an exception if the quantity is negative
        RAISE_APPLICATION_ERROR(-20001, 'Quantity cannot be negative');
    END IF;
END;
/


INSERT INTO Products (Product_ID, Product_Name, Quantity, Price) 
VALUES (111, 'Broken Keyboard', -10, 19.99);
