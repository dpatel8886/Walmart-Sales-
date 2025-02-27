Walmart Sales Analysis 📊

Project Overview

This project is an end-to-end data analysis solution designed to extract critical business insights from Walmart sales data. The goal was to understand customer purchasing behavior, identify revenue trends, and optimize business strategies using Python for data cleaning and analysis, and SQL for advanced querying.

🔑 Problem Statement / Primary Goal

  Walmart needed detailed insights into its sales performance to optimize operational efficiency and customer satisfaction. The 
  primary objectives were:

  -Identify revenue trends across branches and product categories.
  
  -Analyze sales performance by payment methods, time of day, and city-wise sales.
  
  -Detect branches with the highest revenue drop year-over-year.
  
  -Understand customer behavior during different shifts and identify top-rated product categories.

🛠️ Solution Approach

   -The project followed a structured data pipeline with the following key steps:

1. Set Up Environment

 -Tools Used: Visual Studio Code (VS Code), Python,Microsoft SQL

 -Organized project folders with subfolders for data, notebooks, SQL queries, and reports.

2. Data Collection

 -Downloaded Walmart sales dataset using Kaggle API.

 -Stored the dataset locally in the data/ folder.

3. Data Cleaning

 -Performed comprehensive data cleaning using Python (Pandas):

 -Removed duplicate records.

 -Handled missing values through appropriate methods.

 -Converted data types (dates to datetime, prices to float).

 -Currency formatting using .replace().

4. Feature Engineering

 -Created Total Amount column by multiplying unit_price and quantity.

 -Added this feature to improve aggregation and revenue analysis.

5. Database Setup

 -Loaded cleaned data into Microsoft SQL Server.

 -Verified data accuracy through SQL queries.

6. SQL Analysis

 -Executed various SQL queries to answer critical business questions:

   -What are the most frequently used payment methods?

   -Which branch experienced the highest revenue drop year-over-year?

   -What is the busiest day for each branch?

   -Which product categories generate the highest profit?

   -How do sales shift throughout the day across branches?

7. Business Insights

 -Highest transactions were made through Credit Card payment method.

 -The largest revenue decline was 62.62% in one branch, followed by 58.58% in another.

 -Morning shifts had the lowest transactions, while Evening shifts had the highest.

 -Top-rated product categories varied across branches, with Electronics being the most popular.

📊 Impact

 -Provided insights into customer payment preferences.

 -Helped Walmart optimize staff scheduling based on peak sales hours.

 -Identified branches that need sales improvement strategies.

 -Supported decision-making on regional promotions and stock management.


📈 Results

This project provided actionable business insights that help Walmart:

 -Improve operational efficiency.

 -Enhance customer satisfaction.

 -Focus marketing efforts on high-demand product categories.

 -Optimize staff scheduling based on peak sales periods.

🚀 Future Improvements

 -Interactive Power BI Dashboard for better visualization.

 -Predictive analysis to forecast future sales trends.

 -Automate the data pipeline using Airflow.

⭐ Don't forget to star this repository if you found it helpful!
