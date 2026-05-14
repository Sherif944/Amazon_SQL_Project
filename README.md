<p align="center">
  <img src="https://upload.wikimedia.org/wikipedia/commons/a/a9/Amazon_logo.svg" width="200" alt="Amazon Logo">
</p>

# 🛒 Amazon Sales & Operations Advanced Analytics
## 📊 End-to-End Data Warehousing & SQL Analysis Project

### 📝 Project Overview
This project involves building a comprehensive **Data Warehouse** from scratch to analyze Amazon's sales and supply chain operations. The goal was to transform raw transactional data into actionable business intelligence using advanced SQL techniques and professional data modeling.

---

### 🏗️ Data Architecture & Modeling (The Journey)
I followed the **Medallion Architecture** to ensure data quality, moving from raw discovery to a structured Data Mart.

#### 1. Phase One: Data Exploration & Relations (Bronze Layer)
Before cleaning or structuring, I used **Draw.io** to map out the initial tables and understand the raw relationships between the data entities. This visualization guided the transformation process.

<p align="center">
  <img src="https://github.com/Sherif944/Amazon_SQL_Project/blob/main/Draw.io/Exploring%20and%20analyzing%20tables%20and%20data.png" width="800" alt="Initial Table Relations">
  <br>
  <em>Figure 1: Initial Exploration of Table Relations (Bronze Layer)</em>
</p>

#### 2. Phase Two: Sales Data Mart & Star Schema (Gold Layer)
After processing the data through the Silver layer, I architected a **Star Schema** for the final Gold layer. This design centralizes sales metrics into a **Fact Table** surrounded by optimized **Dimension Tables**.

<p align="center">
  <img src="https://github.com/Sherif944/Amazon_SQL_Project/blob/main/Draw.io/Sales%20data%20mart%20(Star%20Schema).png" width="800" alt="Star Schema Data Mart">
  <br>
  <em>Figure 2: Final Sales Data Mart Star Schema (Gold Layer)</em>
</p>

---

### 🛠️ Technical Skills Demonstrated
* **Data Modeling:** Transitioning from ER Diagrams to Star Schema design.
* **Advanced SQL (SQL Server):**
    * **Window Functions:** `DENSE_RANK`, `LAG`, and `LEAD` for trend analysis.
    * **CTEs (Common Table Expressions):** For modular and readable code.
    * **Data Cleaning:** Handling nulls and standardizing formats.
* **Automation:** Using **Google Apps Script** for supply chain inventory logic.

---

### 📈 Key Business Insights
I addressed critical business questions including:
1.  **Growth Metrics:** Calculated **Year-over-Year (YoY) Growth**.
2.  **Supply Chain Efficiency:** Analyzed shipping delays and delivery performance.
3.  **Profitability:** Deep-dive analysis into **COGS** and Profit Margins.
4.  **Customer Intelligence:** Segmentation based on purchase behavior and **CLTV**.

---

### 📂 Repository Structure
* `dataset/`: Raw Excel/CSV data files.
* `scripts/`: SQL scripts for schema creation and analytical queries.
* `diagrams/`: Screenshots of the data architecture at different stages.

---

### 🚀 How to Use
1.  Clone the repository.
2.  Load datasets from the `/dataset` folder into SQL Server.
3.  Execute scripts in the `/scripts` folder to build the Star Schema and generate reports.

---

## 👨‍💻 About the Author
**Sherif Mohammed**
* **Pharmacist | MBA in Supply Chain Management**
* Data Analyst specializing in SQL Server & Strategic Insights.
* [LinkedIn Profile](https://www.linkedin.com/in/sherif-mohammed-8a0aa3162/) | [GitHub Profile](https://github.com/Sherif944)
