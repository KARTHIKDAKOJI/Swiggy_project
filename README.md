# Swiggy_project :swiggy customer orders analysis


# Overview

This project focuses on analyzing real-world Swiggy orders data collected from Chennai. The dataset includes detailed information about food delivery transactions, covering aspects such as order details, restaurant performance, customer behavior, and delivery efficiency. The goal of the project is to extract meaningful insights, improve data quality, and optimize the analysis of food delivery trends in Chennai.







![Image Alt](https://github.com/KARTHIKDAKOJI/Swiggy_project/blob/6a084cd7f4abac0ace79882e8ff31b7190897df6/s.png)





# Dataset Structure

The dataset consists of two primary tables:

 1)Orders Table – Contains details of customer orders, including timestamps, payment methods, delivery status, restaurant information, and whether the order was placed during rain mode. The key columns in this table include:

order_id: Unique identifier for each order.

customer_id: ID representing the customer who placed the order.

restaurant_id: ID representing the restaurant fulfilling the order.

order_time: Timestamp indicating when the order was placed.

delivery_time: Timestamp indicating when the order was delivered.

on_time: Indicates whether the order was delivered on time (Yes/No).

payment_method: Specifies the payment mode used (Cash, Card, UPI, etc.).

order_total: Total amount spent on the order.

rain_mode: Specifies whether the order was placed during rain mode (Yes/No).

order_month: Month when the order was placed.

order_year: Year when the order was placed.

 2)Items Table – Stores information on individual food items ordered, including pricing, category, and whether the item is vegetarian or non-vegetarian. The key columns in this table include:

item_id: Unique identifier for each item.

order_id: ID linking the item to a specific order.

restaurant_id: ID representing the restaurant that prepared the item.

item_name: Name of the food item ordered.

price: Cost of the item.

category: The category of food (e.g., Fast Food, Beverages, Desserts, etc.).

is_veg: Indicates whether the item is vegetarian (Yes/No).




# Analysis and Insights

Customer Preferences

Identifying the most ordered food categories and top-selling restaurants to understand what customers prefer.

Delivery Performance

Assessing on-time vs. delayed deliveries to evaluate delivery efficiency and customer satisfaction.

Restaurant Performance

Analyzing the impact of factors like cuisine type, price range, and customer ratings on restaurant orders.

Peak Order Month and Year

Identifying the months and years with the highest order volume to determine revenue generation trends over time.

Order Value Trends

Understanding spending patterns and how they vary across different customer segments.

Impact of Rain Mode

Evaluating how rainy weather conditions affect order frequency, delivery times, and customer preferences. Orders placed during rain mode may have longer delivery times and different food preferences compared to normal orders.

Seasonal Trends

Understanding how food delivery demand fluctuates across different seasons and how external factors such as festivals or weather conditions impact order volumes.

Restaurant-Specific Trends

Examining how different restaurants perform in terms of order volume, revenue, and customer retention over time.

Future Demand Forecasting

Predicting potential surges in order volumes based on past trends, weather conditions, and seasonal influences.




# Technologies Used

The project utilizes various technologies and tools to process and analyze the dataset effectively:

SQL: Used for data extraction, transformation, and querying.

SQL Queries: Includes DDL (Data Definition Language), DML (Data Manipulation Language), Aggregations, Joins, Subqueries, Window Functions, and CTEs (Common Table Expressions).

Excel: Used for data cleaning and preliminary analysis.




# Data Optimization and Future Scope

To make the dataset more efficient and useful, several improvements can be made:

Improving Data Storage

Organizing the data better for quick access and analysis.

Handling More Data in the Future

Ensuring the dataset can grow easily without major changes.

Adding More Information Sources

Including data from customer reviews, weather reports, and live traffic updates to get a more detailed picture.

Predicting Future Orders

Using past data to estimate when people will order the most, how long deliveries will take, and what food items will be popular.

Customizing Recommendations

Suggesting food items to customers based on what they’ve ordered before and their preferences.
