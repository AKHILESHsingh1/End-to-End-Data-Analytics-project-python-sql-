# 📊 Orders Data Analysis Project

This repository demonstrates a complete data analysis workflow using an e-commerce order dataset. It includes an ETL pipeline, data upload to a MySQL database, and SQL-based analytical queries to extract business insights.

---

## 🗂️ Project Structure

- `orders.csv` – Raw dataset
- `ETL process.ipynb` – Jupyter Notebook for data cleaning and loading into MySQL
- `df_orders_analysis.sql` – SQL file containing various analysis queries
- `README.md` – Project documentation

---

## 🛠️ Tools & Technologies

- **Python** (Pandas, SQLAlchemy)
- **MySQL**
- **Jupyter Notebook**
- **SQL** (CTEs, Aggregations, Window Functions)

---

## 🔁 ETL Process

The ETL (Extract, Transform, Load) process is implemented in the `ETL process.ipynb` notebook.

- **Extract:** Load `orders.csv` using Pandas
- **Transform:** Clean and format data (handle dates, nulls, etc.)
- **Load:** Upload the processed DataFrame to MySQL using SQLAlchemy

---

## 🧱 SQL Table Schema

```sql
CREATE TABLE df_orders (
    order_id INT PRIMARY KEY,
    order_date DATE,
    ship_mode VARCHAR(20),
    segment VARCHAR(20),
    country VARCHAR(20),
    city VARCHAR(20),
    state VARCHAR(20),
    postal_code VARCHAR(20),
    region VARCHAR(20),
    category VARCHAR(20),
    sub_category VARCHAR(20),
    product_id VARCHAR(50),
    quantity INT,
    discount DECIMAL(7,2),
    sale_price DECIMAL(7,2),
    profit DECIMAL(7,2)
);
