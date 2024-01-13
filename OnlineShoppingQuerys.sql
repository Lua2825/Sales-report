----------
-- SALES
----------

/* Average sale per year */
SELECT
    strftime('%Y', ord.Order_Date) AS year,
    ROUND(AVG(ma.Sales)) AS avg_sale
FROM market ma
JOIN orders ord
  ON ma.Ord_id = ord.Ord_id
GROUP BY 1;
/*The highest average sale was reached in the first year, but then, the 
following 3 years, the average sale has been below that of the first 
year by around 15%.*/


/* Annual revenue and year-over-year difference. */
WITH yearly_revenue AS (
    SELECT 
        strftime('%Y', Order_Date) AS year,
        SUM(Sales) AS revenue
    FROM orders
    JOIN market
      ON orders.Ord_id = market.Ord_id
    GROUP BY strftime('%Y', Order_Date)
    )
SELECT
    year,
    revenue,
    IFNULL(LAG(revenue) OVER(ORDER BY year),0) AS revenue_previous_year,
    ROUND(IFNULL(revenue - LAG(revenue) OVER(ORDER BY year),0),3) AS YOY_difference,
    ROUND(IFNULL(((revenue - IFNULL(LAG(revenue) OVER(ORDER BY year),0)) / IFNULL(LAG(revenue) OVER(ORDER BY year),0)) * 100.0, 0), 3) AS percentage
FROM yearly_revenue;
/*After the first year, the growth percentage was negative, but by the 
fourth year it started to pick up and there was a recovery.*/


/* Annual profit and year-over-year difference */
WITH yearly_profit AS (
    SELECT
        strftime('%Y', Order_Date) AS year,
        ROUND(SUM(Profit),3) AS profit
    FROM orders
    JOIN market
      ON orders.Ord_id = market.Ord_id
    GROUP BY strftime('%Y', Order_Date)
    )
SELECT
    year,
    profit,
    IFNULL(LAG(profit) OVER(ORDER BY year),0) AS profit_previous_year,
    ROUND(IFNULL(profit - LAG(profit) OVER(ORDER BY year),0),3) AS YOY_difference,
    ROUND(IFNULL(((profit - IFNULL(LAG(profit) OVER(ORDER BY year),0)) / IFNULL(LAG(profit) OVER(ORDER BY year),0)) * 100.0, 0), 3) AS percentage
FROM yearly_profit;
/* In terms of profits, the year-over-year difference has been mostly negative. */


/* Annual sales by product subcategories */
SELECT
    Product_Sub_Category,
    IFNULL(SUM(CASE
        WHEN strftime('%Y', ord.Order_Date) = '2009' THEN ma.Sales END), 0) AS sales_2009,
    RANK() OVER(ORDER BY IFNULL(SUM(CASE WHEN strftime('%Y', ord.Order_Date) = '2009' THEN ma.Sales END), 0) DESC) AS rank_2009,
    IFNULL(SUM(CASE
        WHEN strftime('%Y', ord.Order_Date) = '2010' THEN ma.Sales END), 0) AS sales_2010,
    RANK() OVER(ORDER BY IFNULL(SUM(CASE WHEN strftime('%Y', ord.Order_Date) = '2010' THEN ma.Sales END), 0) DESC) AS rank_2010,
    IFNULL(SUM(CASE
        WHEN strftime('%Y', ord.Order_Date) = '2011' THEN ma.Sales END), 0) AS sales_2011,
    RANK() OVER(ORDER BY IFNULL(SUM(CASE WHEN strftime('%Y', ord.Order_Date) = '2011' THEN ma.Sales END), 0) DESC) AS rank_2011,
    IFNULL(SUM(CASE
        WHEN strftime('%Y', ord.Order_Date) = '2012' THEN ma.Sales END), 0) AS sales_2012,
    RANK() OVER(ORDER BY IFNULL(SUM(CASE WHEN strftime('%Y', ord.Order_Date) = '2012' THEN ma.Sales END), 0) DESC) AS rank_2012
FROM orders ord
JOIN market ma
  ON ord.Ord_id = ma.Ord_id
JOIN products
  ON ma.Prod_id = products.Prod_id
GROUP BY 1
ORDER BY sales_2009 DESC;
/* Each subcategory has remained around the same position each year, 
without significant fluctuations.*/


/* Annual sales per province */
SELECT
    cu.Province,
    IFNULL(SUM(CASE
        WHEN strftime('%Y', ord.Order_Date) = '2009' THEN ma.Sales END), 0) AS sales_2009,
    IFNULL(SUM(CASE
        WHEN strftime('%Y', ord.Order_Date) = '2010' THEN ma.Sales END), 0) AS sales_2010,
    IFNULL(SUM(CASE
        WHEN strftime('%Y', ord.Order_Date) = '2011' THEN ma.Sales END), 0) AS sales_2011,
    IFNULL(SUM(CASE
        WHEN strftime('%Y', ord.Order_Date) = '2012' THEN ma.Sales END), 0) AS sales_2012
FROM customers cu
JOIN market ma
  ON cu.Cust_id = ma.Cust_id
JOIN orders ord
  ON ord.Ord_id = ma.Ord_id
GROUP BY 1
ORDER BY sales_2009 DESC;
/* Of the 13 provinces, 5 - Ontario, British Columbia, Alberta, 
New Brunswick, and Prince Edward Island - saw their highest annual 
sales in the first year but thereafter have failed to match or exceed that first year. */





---------
-- DATES
---------

/* Monthly sales for each year. */
SELECT
    strftime('%m', ord.Order_Date) AS month,
    IFNULL(SUM(CASE
        WHEN strftime('%Y', ord.Order_Date) = '2009' THEN ma.Sales END), 0) AS sales_2009,
    RANK() OVER(ORDER BY IFNULL(SUM(CASE WHEN strftime('%Y', ord.Order_Date) = '2009' THEN ma.Sales END), 0) DESC) AS rank_2009,
    IFNULL(SUM(CASE
        WHEN strftime('%Y', ord.Order_Date) = '2010' THEN ma.Sales END), 0) AS sales_2010,
    RANK() OVER(ORDER BY IFNULL(SUM(CASE WHEN strftime('%Y', ord.Order_Date) = '2010' THEN ma.Sales END), 0) DESC) AS rank_2010,
    IFNULL(SUM(CASE
        WHEN strftime('%Y', ord.Order_Date) = '2011' THEN ma.Sales END), 0) AS sales_2011,
    RANK() OVER(ORDER BY IFNULL(SUM(CASE WHEN strftime('%Y', ord.Order_Date) = '2011' THEN ma.Sales END), 0) DESC) AS rank_2011,
    IFNULL(SUM(CASE
        WHEN strftime('%Y', ord.Order_Date) = '2012' THEN ma.Sales END), 0) AS sales_2012,
    RANK() OVER(ORDER BY IFNULL(SUM(CASE WHEN strftime('%Y', ord.Order_Date) = '2012' THEN ma.Sales END), 0) DESC) AS rank_2012
FROM orders ord
JOIN market ma
  ON ord.Ord_id = ma.Ord_id
GROUP BY 1
ORDER BY sales_2009 DESC;
/* First, the sales of the first year have been ordered according to the month with the highest sales, and 
then we can see their evolution over the years through the annual rankings. There does not seem to be a 
relevant pattern for monthly sales. Only December and October seem to have relative stability at the 
top over the 4 years. */


/* Monthly sales and orders. Is there a correlation? */
SELECT
  strftime('%Y', ord.Order_Date) AS year,
  strftime('%m', ord.Order_Date) AS month,
  COUNT(ma.Ord_id) AS num_of_orders,
  RANK() OVER(PARTITION BY strftime('%Y', ord.Order_Date)
              ORDER BY COUNT(ma.Ord_id) DESC) AS rank_orders,
  SUM(ma.Sales) AS sales,
  RANK() OVER(PARTITION BY strftime('%Y', ord.Order_Date)
              ORDER BY SUM(ma.Sales) DESC) AS rank_sales
FROM orders ord
JOIN market ma
  ON ord.Ord_id = ma.Ord_id
GROUP BY 1,2
ORDER BY year, rank_orders;
/* I compared the monthly orders of each year, sorted by their annual 
ranking, with the monthly sales of each year and their ranking, looking to 
see if there was any correlation between sales and the number of orders. 
Comparing both rankings shows that there does not seem to be a relationship, 
higher number of orders does not mean higher sales. */





-------------
-- CUSTOMERS
-------------

/* Number of customers per year who made at least one order */
SELECT
    strftime('%Y', Order_Date) AS year,
    COUNT(Cust_id) AS num_of_customers
FROM orders
JOIN market
  ON orders.Ord_id = market.Ord_id
GROUP BY strftime('%Y', Order_Date);
/* The first year, the online shop reached the highest number of customers 
with at least one order, but has not equaled or exceeded that number since. */


/* Number of customers per year by customer segment who placed at least one order */
SELECT 
    Customer_Segment,
    IFNULL(COUNT(CASE
        WHEN strftime('%Y', ord.Order_Date) = '2009' THEN ma.Cust_id END), 0) AS numb_clients_2009,
    IFNULL(COUNT(CASE
        WHEN strftime('%Y', ord.Order_Date) = '2010' THEN ma.Cust_id END), 0) AS numb_clients_2010,
    IFNULL(COUNT(CASE
        WHEN strftime('%Y', ord.Order_Date) = '2011' THEN ma.Cust_id END), 0) AS numb_clients_2011,
    IFNULL(COUNT(CASE
        WHEN strftime('%Y', ord.Order_Date) = '2012' THEN ma.Cust_id END), 0) AS numb_clients_2012
FROM customers
JOIN market ma
  ON customers.Cust_id = ma.Cust_id
JOIN orders ord
  ON ord.Ord_id = ma.Ord_id
GROUP BY 1;
/* The number of customers in the Consumer segment has been declining since the first year.
The number of customers in the Corporate segment has always been higher than the rest.*/


/* Top 10 customers per year with the highest sales amount. */
SELECT
    Customer_Name,
    Customer_Segment,
    total_sales,
    year,
    rank
FROM (
    SELECT
        ma.Cust_id,
        cu.Customer_Name,
        cu.Customer_Segment,
        strftime('%Y', ord.Order_Date) AS year,
        SUM(ma.Sales) AS total_sales,
        RANK() OVER(PARTITION BY strftime('%Y', ord.Order_Date)
                    ORDER BY SUM(ma.Sales) DESC) AS rank
    FROM customers cu
    JOIN market ma
      ON cu.Cust_id = ma.Cust_id
    JOIN orders ord
      ON ord.Ord_id = ma.Ord_id
    GROUP BY 1,2,3,4
    )
WHERE rank <= 10;


/* Bottom 10 customers per year in terms of sales */
SELECT
    Customer_Name,
    Customer_Segment,
    total_sales,
    year
FROM (
    SELECT
        ma.Cust_id,
        cu.Customer_Name,
        cu.Customer_Segment,
        strftime('%Y', ord.Order_Date) AS year,
        SUM(ma.Sales) AS total_sales,
        RANK() OVER(PARTITION BY strftime('%Y', ord.Order_Date)
                    ORDER BY SUM(ma.Sales)) AS rank
    FROM customers cu
    JOIN market ma
      ON cu.Cust_id = ma.Cust_id
    JOIN orders ord
      ON ord.Ord_id = ma.Ord_id
    GROUP BY 1,2,3,4
    )
WHERE rank <= 10;





-------------
-- PRODUCTS
-------------

/* Quantity sold of each product per year. */
SELECT
    Product_Sub_Category,
    IFNULL(SUM(CASE
        WHEN strftime('%Y', ord.Order_Date) = '2009' THEN ma.Order_Quantity END), 0) AS qty_2009,
    IFNULL(SUM(CASE
        WHEN strftime('%Y', ord.Order_Date) = '2010' THEN ma.Order_Quantity END), 0) AS qty_2010,
    IFNULL(SUM(CASE
        WHEN strftime('%Y', ord.Order_Date) = '2011' THEN ma.Order_Quantity END), 0) AS qty_2011,
    IFNULL(SUM(CASE
        WHEN strftime('%Y', ord.Order_Date) = '2012' THEN ma.Order_Quantity END), 0) AS qty_2012
FROM products pro
JOIN market ma
  ON pro.Prod_id = ma.Prod_id
JOIN orders ord
  ON ord.Ord_id = ma.Ord_id
GROUP BY 1
ORDER BY qty_2009 DESC;
/* Bookcases; Scissors, rulers and trimmers; and Copiers and Fax, were the only 
sub-categories below 1000 units sold. Bookcases 1 year, scissors, rulers and trimmers 2 years, 
and copiers and fax all 4 years. */





------------
-- SHIPPING
------------

/* Number of orders for each type of shipping and the percentage of each type over the total */
SELECT
    Ship_Mode,
    COUNT(Ship_Mode) AS num_of_ship,
    ROUND(COUNT(Ship_Mode) * 100.0 / SUM(COUNT(Ship_Mode)) OVER()) AS percentage
FROM shippings
GROUP BY Ship_Mode
ORDER BY num_of_ship DESC;
/* Regular air shipments are by far the most common type of shipment. */


/* Number of shippings per month, sorted from the month with the highest number of shippings */
SELECT
    strftime('%m', Ship_Date) AS month,
    COUNT(Ship_id) AS num_of_ship,
    ROUND(COUNT(Ship_id) * 100.0 / SUM(COUNT(Ship_id)) OVER()) AS percentage
FROM shippings
GROUP BY 1
ORDER BY num_of_ship DESC;
/* There is no significant variation in the number of 
shipments each month. */
