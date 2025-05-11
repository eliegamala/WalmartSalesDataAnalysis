# Walmart Sales Data Analysis README
This project provides a comprehensive analysis of Walmart sales data using MySQL for database management and querying. 
It includes scripts for setting up the database, performing feature engineering to derive meaningful insights, 
and executing SQL queries to answer key business questions related to sales, products, customers, and time-based trends.


## 📁 Project Structure
    WalmartSalesAnalysis/
    │
    ├── WalmartSalesData.csv      # Raw dataset containing Walmart sales transactions
    ├── databaseCreation.sql      # Script to create the database and table structure
    ├── featureEngineering.sql    # Script to extract new features (time_of_day, day_name, month_name)
    └── WalmartSQLqueries.sql     # Set of SQL queries for analyzing the sales data

## 📊 Dataset Overview
The dataset used is sourced from:

Kaggle - Walmart Recruiting: Store Sales Forecasting - https://www.kaggle.com/competitions/walmart-recruiting-store-sales-forecasting/data



| Column                  | Description                             | Data Type      |
| :---------------------- | :-------------------------------------- | :------------- |
| invoice_id              | Invoice of the sales made               | VARCHAR(30)    |
| branch                  | Branch at which sales were made         | VARCHAR(5)     |
| city                    | The location of the branch              | VARCHAR(30)    |
| customer_type           | The type of the customer                | VARCHAR(30)    |
| gender                  | Gender of the customer making purchase  | VARCHAR(10)    |
| product_line            | Product line of the product solf        | VARCHAR(100)   |
| unit_price              | The price of each product               | DECIMAL(10, 2) |
| quantity                | The amount of the product sold          | INT            |
| VAT                 | The amount of tax on the purchase       | FLOAT(6, 4)    |
| total                   | The total cost of the purchase          | DECIMAL(10, 2) |
| date                    | The date on which the purchase was made | DATE           |
| time                    | The time at which the purchase was made | TIMESTAMP      |
| payment_method                 | The total amount paid                   | DECIMAL(10, 2) |
| cogs                    | Cost Of Goods sold                      | DECIMAL(10, 2) |
| gross_margin_percentage | Gross margin percentage                 | FLOAT(11, 9)   |
| gross_income            | Gross Income                            | DECIMAL(10, 2) |
| rating                  | Rating                                  | FLOAT(2, 1)    |



## ⚙️ Setting Up the Database
1. ### Open MySQL Workbench. 
2. ### Run the script databaseCreation.sql
3. ### Import the CSV File

      Right-click the sales table in MySQL Workbench under walmartsalesdata.
   
      Select Table Data Import Wizard.
   
      Browse to the WalmartSalesData.csv file and follow the steps to import it.
   
      Ensure the columns map correctly to the table schema.

4. ### Feature Engineering

    Run the featureengineering.sql script to create new fields:

    time_of_day: Categorizes transactions into Morning, Afternoon, Evening.

    day_name: Extracts the day of the week.

    month_name: Extracts the month name.

5. ### Perform Data Analysis

    Run WalmartSQLqueries.sql to:

    Answer business questions.

    Gain insights into sales trends, customer preferences, and product performance.

## 🧠 SQL Queries and Business Insights
The WalmartSQLqueries.sql script contains a set of analytical queries designed to answer various business questions, grouped into three main categories:

### 🛍️ Product Analysis
Most common payment method

Top-selling product line

Revenue by month and product

VAT contribution by product line

Product performance relative to average sales

### 📊 Sales Analysis
Sales volume by time of day and weekday

Revenue by customer type

Average tax rate per city

VAT contributions by customer type

### 👥 Customer Analysis
Distribution of customer types

Number of unique payment methods

Gender distribution

Rating behavior by time and day

Best days for customer satisfaction
Each query is well-commented and structured to provide actionable insights.
