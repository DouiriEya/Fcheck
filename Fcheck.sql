-- question 1 -- 
SELECT
    *
FROM
    Customers;

-- question 2 -- 
SELECT
    Product_Name,
    Category
FROM
    Product
WHERE
    (Price between 5000 and 10000);

-- question 3 -- 
SELECT
    *
FROM
    Product
ORDER BY
    price DESC;

-- question 4 -- 
SELECT
    Product_id,
    COUNT(*) AS TOTALOrders,
    AVG(Quantity) AS AVGQUANTITY,
    MAX(Total_Amount) AS MAX,
    MIN(Total_Amount) AS MIN
FROM
    ORDERS
GROUP BY
    Product_id;

-- question 5  --
SELECT
    customer_id
FROM
    ORDERS
WHERE
    quantity > 2;

-- question 6 -- 
SELECT
    EXTRACT(
        MONTH
        FROM
            OrderDate
    ) AS month,
    COUNT(*) AS total_orders
FROM
    Orders
WHERE
    EXTRACT(
        YEAR
        FROM
            OrderDate
    ) = 2020
GROUP BY
    EXTRACT(
        MONTH
        FROM
            OrderDate
    );
-- question 7 -- 
SELECT 
    p.product_name,
    c.customer_name,
    o.order_date
FROM 
    Orders o
JOIN 
    Products p ON o.product_id = p.product_id
JOIN 
    Customers c ON o.customer_id = c.customer_id;
-- question 8 -- 
SELECT *
FROM Orders
WHERE OrderDate = ADD_MONTHS(TRUNC(SYSDATE), -3);
-- question 9 -- 
SELECT C.Customer_Id
FROM Customer C
    LEFT JOIN Orders o ON C.Customer_Id = o.Customer_Id
WHERE o.Customer_Id IS NULL;