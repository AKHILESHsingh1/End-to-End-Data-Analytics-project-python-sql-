# 📊 Orders Data Analysis Project

This repository showcases an end-to-end data analysis project using an e-commerce order dataset. It includes:

- ETL process using Python and Pandas
- Data upload to MySQL
- Exploratory data analysis and business insights using SQL

---

## 📁 Project Structure
├── orders.csv # Raw dataset
├── ETL process.ipynb # Python notebook for preprocessing & loading data
├── df_orders_analysis.sql # SQL queries for analysis
└── README.md # Project documentation

---

## 🔧 Tools Used

- 🐍 Python (Pandas, SQLAlchemy)
- 🐬 MySQL
- 📓 Jupyter Notebook

---

## 🧪 ETL Process

1. **Load** the raw CSV file (`orders.csv`) using Pandas
2. **Clean and format** data (e.g. dates, nulls)
3. **Upload** the cleaned DataFrame to MySQL using SQLAlchemy

> Check the notebook: `ETL process.ipynb`

---

## 🗃️ SQL Table Schema

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
