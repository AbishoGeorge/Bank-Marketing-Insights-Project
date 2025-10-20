# Bank Marketing Campaign Analysis and Customer Subscription Prediction

This is an **end-to-end data analysis project** using **Excel, SQL, and Power BI**. The project focuses on analyzing the **Bank Marketing dataset** to understand which factors influence a client’s decision to subscribe to a term deposit.  

I have included all **SQL queries used for analysis** in this repository, along with the cleaned dataset and the final Power BI dashboard.

---

## Overview
This project focuses on analyzing the **Bank Marketing dataset** to understand what drives clients to subscribe to a term deposit. The main goal was to uncover actionable insights that can help the bank **optimize marketing campaigns, improve conversion rates, and make smarter data-driven decisions**.  

To make these insights tangible, I built an **interactive Power BI dashboard** that visualizes key metrics, customer segments, and campaign performance. It provides a clear view of which strategies are most effective and where the bank should focus its efforts.

---

## Objective
The primary objectives of this project were to:  

1. **Understand customer behavior**  
   Analyze demographics, financial status, and campaign details to identify patterns in subscription behavior.  

2. **Evaluate marketing strategies**  
   Assess the effectiveness of contact methods, campaign frequency, and outcomes of previous campaigns.  

3. **Provide actionable insights**  
   Help marketing teams target high-potential customers and improve ROI.  

4. **Explore predictive trends**  
   Identify combinations of customer features that indicate a higher likelihood of subscription.

---

## Step 1: Data Collection
- The dataset contains customer demographics, financial information, and campaign details.
- ## Dataset
You can download the dataset used in this project here: [Bank Marketing Dataset](https://github.com/AbishoGeorge/Bank-Marketing-Insights-Project/blob/main/bank-Marketing-Dataset-csv.csv)
- Key columns include:  
  - `age`, `job`, `marital`, `education`  
  - `default_status`, `housing`, `loan`  
  - `contact`, `month`, `day_of_week`  
  - `duration`, `campaign`, `pdays`, `previous`  
  - `poutcome`, `balance`, `y` (subscription outcome)

---

## Step 2: Data Cleaning (Excel)
I started by cleaning the dataset in **Excel** to ensure accuracy:

- Checked for **missing values** and inconsistent data entries.  
- Standardized categorical variables (e.g., `yes/no` to `Yes/No`).  
- Converted relevant columns to appropriate data types.  
- Created new calculated columns, such as **age groups**, **contact duration in minutes**, and **campaign counts per client**.  
- Removed duplicates and irrelevant columns to simplify analysis.

This step ensured the dataset was ready for analysis and visualization.

---

## Step 3: SQL Analysis
I used **SQL queries** to extract insights and answer business questions.  

---

## Step 4: Power BI Dashboard

After performing SQL analysis, I visualized the results in Power BI to make insights **interactive and actionable**.

### Dashboard Sections:

**Key Metrics (KPI Cards)**
- Total Clients Contacted
- Total Subscriptions
- Subscription Rate (%)
- Average Calls per Client
- Time Spent per Client

**Customer Demographics**
- Subscription rate by job, education, age group

**Campaign & Financial Insights**
- Subscription rate by month
- Impact of housing and personal loans
- Call duration analysis

**Engagement Metrics**
- Average calls per subscriber
- Success rate by contact method
- Lead ranking based on balance, age, and previous contacts

This dashboard helps **quickly identify high-potential customer segments** and optimize campaign strategies.

---

## Step 5: Insights & Key Takeaways
- Certain job profiles and education levels have higher subscription rates.
- Longer calls are often associated with higher engagement and conversion.
- Targeted campaigns based on demographics and previous interactions are more effective than broad campaigns.
- Seasonal trends can inform optimal timing for campaigns.
- Lead scoring using multiple features helps prioritize high-potential clients.

---

## Tools & Techniques Used
- **Excel:** Data cleaning, formatting, and calculations.
- **SQL:** Data querying, aggregation, and trend identification.
- **Power BI:** Dashboard creation, visualizations, and KPI cards.
- **DAX:** Created measures for Subscription Rate, Average Call Duration, and Total Subscriptions.
- **Data Analysis:** Customer segmentation, trend analysis, and KPI evaluation.

---

<img width="1180" height="663" alt="image" src="https://github.com/user-attachments/assets/4432b273-564b-4a50-88bc-76cab0d4da79" />

## Dashboard Description
The dashboard provides a comprehensive view of both **customer behavior** and **campaign performance**. Here’s a breakdown of each section:

### Key Metrics (KPI Cards)
- **Time Spent per Client:** Average duration of last call (seconds) to understand engagement.  
- **Total Subscriptions:** Number of clients who subscribed (y=1).  
- **Subscription Rate:** Percentage of clients who subscribed out of all contacted.  
- **Average Call per Client:** Average number of contacts per client.  
- **Clients Contacted:** Total clients reached during campaigns.  

These KPIs give an **at-a-glance view** of campaign efficiency and client responsiveness.

---

### Customer Demographics
- **Subscription Rate by Job:** Highlights which professions (students, managers, retired, etc.) are more likely to subscribe.  
- **Subscription Rate by Education:** Shows how education level affects subscription behavior.  
- **Subscription Rate by Age:** Identifies age groups with higher conversion rates.  

These visuals **help segment clients** and tailor marketing strategies more effectively.

---

### Campaign & Financial Insights
- **Subscription Rate by Month:** Detects seasonal trends and high-conversion months.  
- **Housing and Personal Loan Status:** Compares subscription behavior among clients with different financial obligations.  
- **Call Duration Analysis:** Explores how call length influences subscription likelihood.  

These insights enable the bank to **optimize contact strategies** and allocate resources efficiently.

---

### Engagement Metrics
- **Average Calls per Subscriber:** Reveals how many calls are typically required for a subscription.  
- **Success Rate by Contact Method:** Compares the effectiveness of cellular vs telephone outreach.  
- **Lead Ranking:** Combines features like balance, age, and prior contacts to identify high-potential clients.  

This section helps the marketing team **focus on high-impact campaigns** and reduce wasted effort.

---

## Business Questions Answered
- **Customer Targeting:** Which jobs, education levels, and age groups are more likely to subscribe?  
- **Campaign Effectiveness:** Which contact methods, months, or previous campaign outcomes lead to higher subscription rates?  
- **Financial Patterns:** Do clients with higher balances show a higher likelihood of subscribing?  
- **Optimization:** How many contacts per client are ideal before conversion?  
- **Strategy Recommendations:** Which segments should the bank prioritize to maximize ROI?

---

## Key Takeaways
- Certain job profiles and education levels have higher subscription rates.  
- Longer call durations are linked to higher engagement and conversion.  
- Targeted campaigns based on demographics and past interactions outperform broad campaigns.  
- Seasonal trends can guide the timing of campaigns for maximum impact.  
- Lead scoring based on multiple features helps prioritize high-potential clients.

---

## Tools & Techniques Used
- **Power BI:** Created interactive dashboards and visualizations.  
- **Excel / SQL:** Cleaned and prepared the dataset for analysis.  
- **DAX:** Built key measures like Subscription Rate, Average Call Duration, and Total Subscriptions.  
- **Data Analysis Techniques:** Customer segmentation, KPI analysis, and trend identification.

---

## Conclusion
This project demonstrates how a combination of **Excel, SQL, and Power BI** can be used to perform end-to-end data analysis. By integrating cleaned data, analytical queries, and interactive dashboards, I was able to highlight key areas of focus for future campaigns.

The dashboard is **interactive, user-friendly**, and can be extended for predictive modeling or more advanced analytics.
