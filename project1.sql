CREATE DATABASE customer_churn;

USE customer_churn;

/*Import the table*/

SELECT COUNT(*) FROM telco_customers;

SELECT * FROM telco_customers;

SELECT COUNT(*) AS Total_Customers
FROM telco_customers;

SELECT COUNT(*) AS Churned_customers
FROM telco_customers
WHERE Churn='Yes';

SELECT
ROUND(
SUM(CASE WHEN Churn='Yes' THEN 1 ELSE 0 END)
*100.0/
COUNT(*),
2
) AS Churn_Rate
FROM telco_customers;

SELECT
Contract,
COUNT(*) AS Customers,
SUM(CASE WHEN Churn='Yes' THEN 1 ELSE 0 END) AS Churned
FROM telco_customers
GROUP BY Contract;

SELECT
AVG(MonthlyCharges)
FROM telco_customers;

SELECT
PaymentMethod,
COUNT(*)
FROM telco_customers
GROUP BY PaymentMethod;

SELECT
CASE
WHEN tenure <=12 THEN '0-12 Months'
WHEN tenure <=24 THEN '13-24 Months'
WHEN tenure <=48 THEN '25-48 Months'
ELSE '49+ Months'
END AS Tenure_Group,
COUNT(*)
FROM telco_customers
GROUP BY Tenure_Group;