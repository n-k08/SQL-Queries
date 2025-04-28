SELECT * FROM nk.northwind_orders;

SELECT order_ID, customer_ID, freight, ship_country
FROM northwind_orders
WHERE ship_country = 'France'
ORDER BY freight DESC;

SELECT ship_country, SUM(freight) AS total_freight
FROM northwind_orders
GROUP BY ship_country
ORDER BY total_freight DESC;

SELECT o.order_ID, o.customer_ID, s.shipper_name
FROM northwind_orders o
INNER JOIN shippers s ON o.shipper_ID = s.shipper_ID;

SELECT o.OrderID, o.CustomerID, s.ShipperName
FROM northwind_orders o
LEFT JOIN shippers s ON o.ShipperID = s.ShipperID;

SELECT customer_ID, order_ID, freight
FROM northwind_orders
WHERE freight > (SELECT AVG(freight) FROM northwind_orders);

CREATE VIEW USA_Orders AS
SELECT *
FROM northwind_orders
WHERE ship_country = 'USA';

select * from USA_Orders;

SELECT EXTRACT(YEAR FROM order_date) AS order_year, AVG(freight) AS Avgfreight
FROM northwind_orders
GROUP BY EXTRACT(YEAR FROM order_date)
ORDER BY order_year;

CREATE INDEX idx_shipcountry ON northwind_orders (ship_country);

SELECT ship_country, COUNT(order_ID) AS Num_Orders
FROM northwind_orders
GROUP BY ship_country
HAVING COUNT(order_ID) > 50;