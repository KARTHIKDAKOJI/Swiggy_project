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


