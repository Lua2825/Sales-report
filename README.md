## Overview

I analyzed a data set from an online store. Although the data is not current, my intention was to put into practice and demonstrate the use of window functions and JOINs in the preparation of a sales report.

Some of the ways in which these functions were used in the report included: cross-referencing information between tables to obtain data such as year-over-year growth, evaluating the performance of an aspect or set of elements through rankings (sales and number of monthly orders, number of products sold, sales by province, customers) and percentage over totals.

To access specific details on the questions addressed and the corresponding results, you can simply click on the topic of interest in the list below. However, I recommend reviewing the entire content from start to finish for a comprehensive understanding. And to see in detail the SQL queries I used, you can access the document with the name "OnlineShoppingQuerys.sql" in this repository.


## Report questions

### Sales
1. Average sale per year.
2. Annual revenue and year-over-year difference.
3. Annual profit and year-over-year difference.
4. Annual sales by product subcategories.
5. Annual sales by province.

### Customers
1. Number of customers per year who made at least one order.
2. Number of customers per year by customer segment who placed at least one order.
3. Top 10 customers per year with the highest sales amount.
4. Bottom 10 customers per year in terms of sales.

### Products
1. Quantity sold of each product per year.

### Dates
1. Monthly sales for each year. First, the sales of the first year have been ordered according to the month with the highest sales, and then we can see their evolution over the years through the annual rankings.
2. Monthly sales and orders. Is there a correlation?

### Shipping
1. The number of orders for each type of shipping and the percentage of each type over the total.
2. Number of shipping per month, sorted from the month with the highest number of shipments.


## Sales
1. Average sale per year.
	The highest average sale was reached in the first year, but then, the following 3 years, the average sale has been below that of the first year by around 15%.
![](https://drive.google.com/file/d/1zAXV5Zux1lo6U6HIrZRy548H2iuVdruQ/view?usp=drive_link){}
