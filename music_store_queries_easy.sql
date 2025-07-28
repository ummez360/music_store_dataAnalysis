-- Q1: Who is the senior most employee based on the job title?

SELECT * FROM employee ORDER BY levels desc Limit 1;

-- Q2: Which country have the most invoices?

SELECT COUNT(*) AS C, BILLING_COUNTRY 
FROM INVOICE
GROUP BY BILLING_COUNTRY
ORDER BY C DESC

-- Q3: What ar top 3 values of total invoices

SELECT TOTAL FROM INVOICE
ORDER BY TOTAL DESC LIMIT 3

-- Q4: Which city has the best customers? We would like to throw a promotional Music Festival in the city we made the most money. 
-- Write a query that returns one city that has the highest sum of invoice totals. 
-- Return both the city name & sum of all invoice totals 

SELECT SUM(TOTAL) AS INVOICE_TOTAL, BILLING_CITY 
FROM INVOICE
GROUP BY BILLING_CITY
ORDER BY INVOICE_TOTAL DESC
LIMIT 1

-- Q5: Who is the best customer? The customer who has spent the most money will be declared the best customer. 
-- Write a query that returns the person who has spent the most money.

SELECT C.customer_id,C.first_name, C.last_name, SUM(I.total) AS TOTAL FROM CUSTOMER AS C
JOIN INVOICE AS I ON C.CUSTOMER_ID=I.CUSTOMER_ID
GROUP BY C.customer_id
ORDER BY TOTAL DESC
LIMIT 1