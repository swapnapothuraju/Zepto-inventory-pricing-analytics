use zepto;

 ALTER TABLE zepto_data RENAME COLUMN  discountedSellingPrice TO  Discounted_Selling_Price;
ALTER TABLE zepto_v2 RENAME TO zepto_data;
ALTER TABLE zepto_data RENAME COLUMN ï»¿Category TO Category;
ALTER TABLE zepto_data RENAME COLUMN name TO product_name;
ALTER TABLE zepto_data RENAME COLUMN outOfStock TO out_of_stock;
ALTER TABLE zepto_data RENAME COLUMN discountPercent TO Discount_percent;
ALTER TABLE zepto_data RENAME COLUMN mrp TO MRP;
ALTER TABLE zepto_data RENAME COLUMN weightInGms TO weight_in_gms;
ALTER TABLE zepto_data RENAME COLUMN availableQuantity TO Quantity_available;


-- -------------------------------------------------------------------------------BASIC LEVEL (1–20)------------------------------------------------
-- 1. Display all records from the table.
SELECT * FROM zepto_data;

-- 2 Show only the name and mrp of all products.
SELECT product_name , MRP FROM zepto_data;

-- 3.List all products where Category = 'Fruits & Vegetables'.
SELECT * FROM zepto_data WHERE Category='Fruits & Vegetables';

-- 4  Find products where mrp is greater than 3000.
SELECT product_name,MRP FROM zepto_data WHERE MRP>3000;

-- 5  Show products where discountPercent is 15. 
SELECT product_name,Discount_Percent FROM zepto_data WHERE Discount_percent=15;

-- 6 Display products where outOfStock is FALSE.
SELECT product_name,out_of_stock FROM zepto_data Where out_of_stock=FALSE;

-- 7 List the names of products with weightInGms greater than 500. 
SELECT product_name,weight_in_gms as WEIGHT_IN_GRAMS FROM zepto_data WHERE weight_in_gms>500;

-- 8  Find products where availableQuantity is less than 5. 
SELECT product_name,Quantity_available FROM zepto_data WHERE Quantity_available <5;

-- 9 Show distinct categories available in the table. 
SELECT DISTINCT Category FROM zepto_data;

-- 10  Count the total number of products.
SELECT COUNT(DISTINCT product_name) FROM zepto_data;

-- 11  Display products sorted by mrp in ascending order.
SELECT product_name,MRP FROM zepto_data ORDER BY MRP ASC;

-- 12 Display products sorted by discountPercent in descending order. 
SELECT product_name,Discount_percent FROM zepto_data ORDER BY Discount_percent DESC;

-- 13  Show top 10 most expensive products based on mrp.
SELECT product_name AS Top_Expensive_Products,MRP FROM zepto_data ORDER BY MRP DESC LIMIT 10;

-- 14 Find products where name starts with letter ‘T’. 
SELECT Product_name AS Product_Name_Starts_With_T FROM zepto_data WHERE product_name LIKE 'T%';

-- 15 Count how many products are out of stock. 
SELECT COUNT(out_of_stock) AS Out_OF_STOCK FROM zepto_data WHERE out_of_stock=TRUE;

-- 16 Show products where quantity is greater than 50. 
SELECT product_name,Quantity FROM zepto_data WHERE Quantity >50;

-- 17  Find products where mrp is between 2000 and 4000. 
SELECT product_name ,MRP FROM zepto_data WHERE MRP BETWEEN 2000 AND 4000 ORDER BY MRP;

-- 18  Display products where discountedSellingPrice is less than 1500.
SELECT product_name,Discounted_Selling_Price FROM zepto_data WHERE Discounted_Selling_Price <1500 ORDER BY Discounted_Selling_Price;

-- 19 . List products where weightInGms equals 1000.
SELECT product_name,weight_in_gms FROM zepto_data WHERE weight_in_gms=1000;

-- 20  Show all products whose category contains the word ‘Vegetables’.
SELECT Category, product_name FROM zepto_data WHERE Category LIKE'%Vegetables%';


-- ---------------------------------------------------------------- INTERMEDIATE LEVEL (21–35)-------------------------------------------------------
SELECT * FROM zepto_data;
-- 21 Find the maximum mrp in each category. 
SELECT Category, MAX(MRP) FROM zepto_data GROUP BY Category ORDER BY MAX(MRP);

-- 22 Find the minimum discountedSellingPrice in each category.
SELECT Category,MIN(Discounted_Selling_Price) FROM zepto_data GROUP BY Category ORDER BY MIN(Discounted_Selling_Price);

-- 23 Count the number of products in each category.
SELECT Category,COUNT(DISTINCT product_name) AS NO_OF_PRODUCTS FROM zepto_data GROUP BY Category ORDER BY COUNT(product_name);

-- 24  Calculate the average mrp of all products.
SELECT product_name,ROUND(AVG(MRP),2) AS AVERAGE_MRP_PER_PRODUCT FROM zepto_data GROUP BY product_name ORDER BY AVG(MRP);

-- 25 Show total available quantity of products category-wise. 
SELECT Category ,SUM(Quantity_available) FROM zepto_data GROUP BY Category ORDER BY SUM(Quantity_available);

-- 26  Find products where the difference between mrp and discountedSellingPrice is greater than 1000.
SELECT product_name,(MRP- Discounted_Selling_Price) 
FROM zepto_data
WHERE
(MRP- Discounted_Selling_Price)>1000;

-- 27  Display products with discount greater than the average discount. 
SELECT AVG(discount_percent) FROM zepto_data;
SELECT product_name ,discount_percent 
FROM zepto_data 
WHERE discount_percent >=
(SELECT AVG(discount_percent) FROM zepto_data) 
ORDER BY discount_percent;

-- 28  Show categories having more than 50 products.
SElECT Category ,COUNT(product_name)
FROM zepto_data 
GROUP BY Category 
HAVING COUNT(product_name)>50
ORDER BY COUNT(product_name);

-- 29  Find top 5 products with highest discount percent. 
SELECT product_name,discount_percent
FROM zepto_data 
ORDER BY discount_percent DESC limit 5;

-- 30  Display total inventory weight (weightInGms * availableQuantity) for each product. 
SELECT product_name,(weight_in_gms* Quantity_available) AS Inventory_Weight FROM zepto_data;

-- 31  Find products where discountedSellingPrice is less than 50% of mrp.
SELECT product_name,Discounted_Selling_Price,MRP AS 'Discounted_Selling_Price_<50%_OF_MRP'
 FROM zepto_data
 WHERE Discounted_Selling_Price < 0.5*MRP;
 
-- 32  Show products whose names contain the word ‘Coconut’. 
SELECT product_name AS PRODUCT_NAME_CONTAINS_COCONUT
 FROM zepto_data
 WHERE product_name LIKE '%Coconut%';
 
 -- 33 Calculate total stock value (discountedSellingPrice * availableQuantity) for each product. 
 SELECT product_name,(Discounted_Selling_Price* Quantity_available) AS STOCK_VALUE 
 FROM zepto_data
 ORDER BY STOCK_VALUE DESC;
 
-- 34 Display the category with the highest average discount
SELECT Category ,AVG(discount_percent)
FROM zepto_data
GROUP BY Category
ORDER BY AVG(discount_percent) DESC limit 1;
 
 -- 35  Show products where availableQuantity is zero but outOfStock is FALSE (data inconsistency check).
 SELECT product_name, Quantity_available,out_of_stock 
 FROM zepto_data 
 WHERE Quantity_available =0 and out_of_stock =FALSE;
 
 -- ------------------------------------------------------------------------------------------------ADVANCED LEVEL (36–50) -----------------------------
 
-- 36  Rank products within each category based on mrp. 
SELECT category,product_name,quantity_available,
RANK() OVER (
 PARTITION BY category
 ORDER BY product_name) AS RANK_NUMBER
FROM zepto_data;


-- 37. Find the second highest mrp product in each category. 
SELECT category,product_name,quantity_available,RANK_NUMBER
FROM (
    SELECT 
    category,product_name,quantity_available,
    RANK() OVER (
       PARTITION BY category
       ORDER BY product_name) AS RANK_NUMBER
	FROM zepto_data ) AS RANK_TWO
WHERE RANK_NUMBER=2;

-- 38 Display cumulative sum of availableQuantity category-wise. 
SELECT category,product_name,quantity_available,
      SUM(quantity_available) OVER(
           PARTITION BY Category
		   ORDER BY product_name) AS cumulative_available_Quantity
FROM zepto_data;

-- 39  Find products whose mrp is higher than the average mrp of their category. 
SELECT category,product_name,MRP,AVG_MRP
FROM (
    SELECT 
    category,product_name,quantity_available,MRP,
    AVG(MRP) OVER (
       PARTITION BY category
       ORDER BY product_name) AS AVG_MRP
	FROM zepto_data ) AS AVG_MRP_DATA
WHERE MRP>AVG_MRP;

-- 40  Identify products where discount percent is above category average discount.
SELECT category,product_name,MRP,Discount_percent,AVG_DISCOUNT
FROM (
    SELECT 
    category,product_name,quantity_available,MRP,Discount_percent,
    AVG(Discount_percent) OVER (
       PARTITION BY category
       ORDER BY product_name) AS AVG_DISCOUNT
	FROM zepto_data ) AS AVG_Discount_DATA
WHERE Discount_percent >AVG_DISCOUNT;


-- 41  Create a view showing only in-stock products with discount greater than 20%.
CREATE VIEW IN_STOCK_PRODUCTS AS 
   SELECT * FROM zepto_data
   WHERE out_of_stock='FALSE' AND Discount_percent>20;
   
SELECT * FROM IN_STOCK_PRODUCTS;

-- 42 . Write a query to update outOfStock = TRUE where availableQuantity = 0. 
SET SQL_SAFE_UPDATES = 0;
UPDATE zepto_data SET out_of_stock='TRUE' WHERE Quantity_available=0;
SET SQL_SAFE_UPDATES = 1;

-- 43 Create a stored procedure to fetch products by category name. 
DELIMITER $$
CREATE PROCEDURE get_products_by_category(
    IN p_category VARCHAR(100))
BEGIN
    SELECT *
    FROM zepto_data
    WHERE category = p_category;
END $$
DELIMITER ;
CALL get_products_by_category('Fruits & Vegetables');


-- 44  Create a function to calculate discount amount (mrp - discountedSellingPrice). 
DELIMITER $$
CREATE FUNCTION discount_amount(
    mrp DECIMAL(10,2),
    discountedSellingPrice DECIMAL(10,2)
)
RETURNS DECIMAL(10,2)
DETERMINISTIC
BEGIN
    RETURN mrp - discountedSellingPrice;
END $$
DELIMITER ;

SELECT product_name, MRP, Discounted_Selling_Price,
       discount_amount(MRP, Discounted_Selling_Price) AS discount
FROM zepto_data;

-- 45 Find duplicate product names if any exist. 
SELECT product_name FROM zepto_data 
GROUP BY product_name
HAVING COUNT(product_name)>1;

-- 46  Show top 3 cheapest products in each category.
SELECT category, product_name, mrp
FROM ( SELECT category,product_name,mrp,
        ROW_NUMBER() OVER (
            PARTITION BY category
            ORDER BY mrp ASC) AS rn
    FROM zepto_data) t
WHERE rn <= 3;


-- 47 Find categories where total stock value exceeds 1,00,000. 
SELECT category,
SUM(Discounted_Selling_Price * quantity_available) AS total_stock_value
FROM zepto_data
GROUP BY category
HAVING SUM(Discounted_Selling_Price * quantity_available) > 100000;

-- 48  Create a trigger that sets outOfStock to TRUE when availableQuantity becomes 0. 
DELIMITER $$
CREATE TRIGGER set_out_of_stock
BEFORE UPDATE ON zepto_data
FOR EACH ROW
BEGIN
    IF NEW.quantity_available = 0 THEN
        SET NEW.out_of_stock = 'TRUE';
    END IF;
END $$
DELIMITER ;

SET SQL_SAFE_UPDATES = 0;
UPDATE zepto_data SET  quantity_available = 0 WHERE product_name = 'On1y Mixed Herbs';
SET SQL_SAFE_UPDATES = 1;

SELECT product_name, quantity_available, out_of_stock
FROM zepto_data
WHERE product_name = 'On1y Mixed Herbs';

-- 49 Generate a report showing: Category, Total Products, Avg MRP, Avg Discount. 
SELECT 
    category,
    COUNT(*) AS total_products,
    ROUND(AVG(mrp), 2) AS avg_mrp,
    ROUND(AVG(discount_percent), 2) AS avg_discount_percent
FROM zepto_data
GROUP BY category;

-- 50. Write a query using a subquery to find products with mrp greater than overall average mrp. 
SELECT product_name, category, MRP
FROM zepto_data
WHERE MRP > (
    SELECT AVG(MRP)
    FROM zepto_data
);


