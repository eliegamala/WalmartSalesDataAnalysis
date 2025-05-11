-- Step 1: Import WalmartSalesData.csv using Table Data Import Wizard

CREATE DATABASE IF NOT EXISTS walmartsalesdata;
USE walmartsalesdata;

-- Step 2: Import WalmartSalesData.csv using Table Data Import Wizard
CREATE TABLE IF NOT EXISTS sales(
    invoice_id VARCHAR(30) NOT NULL PRIMARY KEY,
    branch VARCHAR(5) NOT NULL,
    city VARCHAR(30) NOT NULL,
    customer_type VARCHAR(30) NOT NULL,
    gender VARCHAR(10) NOT NULL,
    product_line VARCHAR(100) NOT NULL,
    unit_price DECIMAL(10, 2) NOT NULL,
    quantity INT NOT NULL,
    VAT FLOAT NOT NULL,
    total DECIMAL(12, 4) NOT NULL,
    date DATETIME NOT NULL,
    time TIME NOT NULL,
    payment_method VARCHAR(15) NOT NULL,
    cogs DECIMAL(10, 2) NOT NULL,
    gross_margin_pct FLOAT,
    gross_income DECIMAL(12, 4) NOT NULL,
    rating FLOAT
);

-- Step 3: Import WalmartSalesData.csv using Table Data Import Wizard
-- -------------------------------------------------------------------------
-- 1. In MySQL Workbench, go to the left sidebar under the 'sales' database.
-- 2. Right-click on the 'sales' table.
-- 3. Click on "Table Data Import Wizard".
-- 4. Browse and select the WalmartSalesData.csv file.
-- 5. Click "Next" and follow the wizard to map CSV columns to table columns.
-- 6. Review the preview, then click "Next" to complete the import.