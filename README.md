## Overview

I analyzed a data set from an online store. Although the data is not current, my intention was to put into practice and demonstrate the use of window functions and JOINs in the preparation of a sales report.

Some of the ways in which these functions were used in the report included: cross-referencing information between tables to obtain data such as year-over-year growth, evaluating the performance of an aspect or set of elements through rankings (sales and number of monthly orders, number of products sold, sales by province, customers) and percentage over totals.

To access specific details on the questions addressed and the corresponding results, you can simply click on the topic of interest in the list below. However, I recommend reviewing the entire content from start to finish for a comprehensive understanding. And to see in detail the SQL queries I used, you can access the document with the name "OnlineShoppingQuerys.sql" in this repository.

## Sales

*Average sale per year.*

The highest average sale was reached in the first year, but then, the following 3 years, the average sale has been below that of the first year by around 15%.

[![Average-sale-per-year.png](https://i.postimg.cc/vBQ5JYvW/Average-sale-per-year.png)](https://postimg.cc/Y4s4gwZ9)

*Annual revenue and year-over-year difference.*

After the first year, the growth percentage was negative, but by the fourth year it started to pick up and there was a recovery.

[![Annual-revenue-and-year-over-year-difference.png](https://i.postimg.cc/hvYxQ9Rr/Annual-revenue-and-year-over-year-difference.png)](https://postimg.cc/64dTD432)

*Annual profit and year-over-year difference.*

In terms of profits, the year-over-year difference has been mostly negative. 

[![Annual-profit-and-year-over-year-difference.png](https://i.postimg.cc/nz0qZydN/Annual-profit-and-year-over-year-difference.png)](https://postimg.cc/YGLvzsBx)

*Annual sales by product subcategories.*

There appear to be no significant changes in the subcategories' rankings over the years.

[![Annual-sales-by-product-subcategories.png](https://i.postimg.cc/R01cp6wS/Annual-sales-by-product-subcategories.png)](https://postimg.cc/NyM950NS)

*Annual sales by province.*

Of the 13 provinces, 5 - Ontario, British Columbia, Alberta, New Brunswick, and Prince Edward Island - saw their highest annual sales in the first year but thereafter failed to match or exceed that first year.

[![Annual-sales-per-province.png](https://i.postimg.cc/jq3y1rn7/Annual-sales-per-province.png)](https://postimg.cc/bdbGGWTy)

## Dates

*Monthly sales for each year.*

First, the sales of the first year have been ordered according to the month with the highest sales, and then we can see their evolution over the years through the annual rankings.

There does not seem to be a relevant pattern for monthly sales. Only December and October have relative stability at the top over the 4 years.

[![Monthly-sales-for-each-year.png](https://i.postimg.cc/Rhp11kKw/Monthly-sales-for-each-year.png)](https://postimg.cc/FkcJNnPK)

*Monthly sales and orders. Is there a correlation?*

I compared the monthly orders of each year, sorted by their annual ranking, with the monthly sales of each year and their ranking, looking to see if there was any correlation between sales and the number of orders. Comparing both rankings shows that there is not a relationship, higher number of orders does not mean higher sales.

[![Monthly-sales-and-orders.png](https://i.postimg.cc/zB5kqSqH/Monthly-sales-and-orders.png)](https://postimg.cc/7CszVzGq)

## Customers

*Number of customers per year who made at least one order.*

The first year the online shop reached the highest number of customers with at least one order, but has not equaled or exceeded that number since.

[![Number-of-customers-per-year-who-made-at-least-one-order.png](https://i.postimg.cc/6qpLvW29/Number-of-customers-per-year-who-made-at-least-one-order.png)](https://postimg.cc/vgCVRdtj)

*Number of customers per year by customer segment who placed at least one order.*

The number of customers in the Consumer segment has declined since the first year.
The number of customers in the Corporate segment has always been higher than the rest.

[![Number-of-customers-per-year-by-customer-segment-who-placed-at-least-one-order.png](https://i.postimg.cc/C1Ns5BKP/Number-of-customers-per-year-by-customer-segment-who-placed-at-least-one-order.png)](https://postimg.cc/G84ySpGG)

*Top 10 customers per year with the highest sales amount.*

[![Top-10-customers-per-year-with-the-highest-sales-amount.png](https://i.postimg.cc/tCftsHXj/Top-10-customers-per-year-with-the-highest-sales-amount.png)](https://postimg.cc/crR8z2g9)

*Bottom 10 customers per year in terms of sales.*

[![Bottom-10-customers-per-year-in-terms-of-sales.png](https://i.postimg.cc/CMc4VqXd/Bottom-10-customers-per-year-in-terms-of-sales.png)](https://postimg.cc/rzt41K8L)

## Products

*Quantity sold of each product per year.*

Bookcases; Scissors, rulers and trimmers; and Copiers and Fax, were the only sub-categories below 1000 units sold. Bookcases 1 year, scissors, rulers and trimmers 2 years, and copiers and fax all 4 years.

[![Quantity-sold-of-each-product-per-year.png](https://i.postimg.cc/8PsmkCg4/Quantity-sold-of-each-product-per-year.png)](https://postimg.cc/8jQ6tN5f)

## Shipping

*The number of orders for each type of shipping and the percentage of each type over the total.*

Regular air shipment is by far the most common type of shipment.

[![Number-of-orders-for-each-type-of-shipping-and-the-percentage-of-each-type-over-the-total.png](https://i.postimg.cc/02tXZ3PW/Number-of-orders-for-each-type-of-shipping-and-the-percentage-of-each-type-over-the-total.png)](https://postimg.cc/bstRwmGk)

*Number of shipping per month, sorted from the month with the highest number of shipments.*

There is no significant variation in the number of shipments each month.

[![Number-of-shippings-per-month.png](https://i.postimg.cc/GtLzxPNn/Number-of-shippings-per-month.png)](https://postimg.cc/VrhjYtmK)
