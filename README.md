# 📊 Zepto Inventory & Pricing Analytics using Advanced SQL

## 📌 Project Overview
This project focuses on analyzing a Zepto-style grocery product dataset using **Advanced SQL (MySQL)**.  
It demonstrates how SQL can be used to solve **real-world business problems** related to inventory management, pricing, discounts, and stock automation.

The project is designed as a **portfolio-ready SQL case study**, covering both analytical queries and database automation features.

---

## 📁 Dataset Description
The dataset represents product-level data from a quick-commerce grocery platform and includes the following columns:

- Category  
- Product Name  
- MRP  
- Discount Percent  
- Discounted Selling Price  
- Quantity Available  
- Out of Stock Status  
- Weight (in grams)

---

## 🛠️ Technologies Used
- MySQL 8+
- SQL (Advanced)
- MySQL Workbench

---

## 🔑 SQL Concepts Covered
This project extensively uses advanced SQL concepts, including:

- GROUP BY & HAVING
- Subqueries
- Window Functions (ROW_NUMBER, RANK, SUM OVER, AVG OVER)
- Views
- Stored Procedures
- Functions
- Triggers

---

## 📌 Key Features & Queries

### 🔹 Duplicate Product Detection
Identifies duplicate product names using aggregation and HAVING clause.

### 🔹 Top 3 Cheapest Products per Category
Uses window functions with PARTITION BY and ROW_NUMBER to rank products category-wise based on MRP.

### 🔹 Inventory Value Analysis
Calculates total stock value for each category and identifies categories where inventory value exceeds ₹1,00,000.

### 🔹 Discount Calculation Function
Implements a reusable SQL function to calculate discount amount using:
MRP − Discounted Selling Price.

### 🔹 Stored Procedure for Category-Based Fetch
Creates a stored procedure to fetch products dynamically by category name.

### 🔹 Automated Stock Status Management
Implements a trigger that automatically sets `out_of_stock` to TRUE when `quantity_available` becomes zero.

### 🔹 Category-Level Report
Generates a summary report showing:
- Total products
- Average MRP
- Average discount (percentage)

### 🔹 Global Price Comparison
Uses a subquery to find products whose MRP is higher than the overall average MRP.

---
## 📂 Project Structure

zepto-inventory-sql-analysis/
│
├── README.md
├── dataset/
│   └── zepto_data.csv
│
├── problem_statements/
│   └── sql_questions
│
├── answers/
│   ├── basic_sql_answers.sql
│   ├── intermediate_sql_answers.sql
│   └── advanced_sql_answers.sql


---

## ▶️ How to Run This Project
1. Create the database and table using the schema script.
2. Insert dataset records into the table.
3. Execute SQL files in the following order:
   - Views
   - Functions
   - Stored Procedures
   - Triggers
   - Analytical Queries
4. Run queries using MySQL Workbench.

---

## 🎯 Learning Outcomes
- Strong understanding of **advanced SQL concepts**
- Hands-on experience with **real-world business scenarios**
- Ability to write **optimized, reusable, and maintainable SQL**
- Improved confidence for **SQL technical interviews**

---

## 🧠 Interview Explanation (Short)
This project demonstrates how advanced SQL features like window functions, subqueries, views, stored procedures, functions, and triggers can be used to analyze 
and automate inventory and pricing operations in a real-world e-commerce dataset.

---

## 👤 Author
Swapna Pothuraju

---

## ⭐ Feedback
If you find this project useful, feel free to star the repository or fork it for learning purposes.
