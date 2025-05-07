# E-Commerce Data Analysis Project | SQL & Power BI

![d1](https://raw.githubusercontent.com/bakiylc/E-Ticaret-Projesi/refs/heads/main/dsh1.jpg)

![d2](https://raw.githubusercontent.com/bakiylc/E-Ticaret-Projesi/refs/heads/main/dsh2.jpg)

![d3](https://raw.githubusercontent.com/bakiylc/E-Ticaret-Projesi/refs/heads/main/dsh3.jpg)


## 🚀 Overview
Welcome to the **E-Commerce Data Analysis Project!** In this project, we are digging into the E-Commerce dataset using Power BI to create meaningful insights for an E-Commerce company, including customer behavior, sales channel comparisons, and key performance indicators (KPIs).

Through this analysis, we discover key metrics such as key customer demographics such as gender and age classification, as well as most purchased products, number of orders per month and year, and percentage distribution of platforms from which orders are received.

The ultimate goal is to provide actionable insights for better business planning, sales-focused decisions, and targeted customer strategies.


## 📊 Dataset Overview
The dataset contains critical information about customers and their orders, covering a variety of fields, including product information, city of order, and order amount. Here’s a quick look at the data columns
### Customers Information

- **CustomerID**: Unique identifier for each customer.
- **CustomerName**: First and last name of the customer.
- **City**: City where the customer lives.
- **Country**: Country where the customer lives.
- **Gender**: Gender of the customer.
- **Age**: Age of the customer.
- **Age_Group**: Categorizes customers by age (e.g. 25-30 years old, 45-50 years old).


### Orders Information
- **OrderID**: Unique identifier for each order.
- **CustomerID**: The customer ID that placed the order.
- **OrderDate**: Date of the Order Placed
- **Total Amount**: Total amount of the order
- **OrderType**: Type of platform on which the order is placed

### Order_Details Information
- **OrderID**: Unique identifier for each order.
- **ProductID**: The product ID number ordered.
- **Quantity**: Number of products ordered
- **UnitPrice**: Unit price of each product


### Products Information
- **ProductID**: Unique identifier for each product.
- **ProductName**: Name for each product.
- **Category**: Categorizes products by type (e.g. Giyim, Elektronik, Aksesuar)
- **UnitPrice**: Unit price of each product




## 💡 Key Insights and Reports

### 1. **Average Properties Owned by Gender**
This report provides a segmented breakdown of products purchased by customers based on gender, providing deeper insights into the gender distribution of orders.

**2. Number of orders by category**
This visualization helps us understand which categories are selling the most. It helps the company identify which products are selling poorly and create a sales plan accordingly.

**3. Customer Loyalty Classification and Total Revenue**
This report highlights the total revenue segmented based on customer loyalty classification. This is critical in determining the revenue distribution between loyal and non-loyal customers.

**4. Number of Products Ordered and Correlation Between Cities**
This report investigates whether there is a significant correlation between the number of orders placed by customers and the city they live in. This analysis can help the company in its sales strategies.

**5. Customer Age Distribution**
It provides us with information about how many customers we have from which age group. It helps determine the customer profile to which the company sells. 
Accordingly, it adds strategic importance in determining new product sales and campaigns.

⚙️ **DAX Measures and Functions Used**
In this project , Most of the analysis was done using SQL. Some calculations were done using DAX. 
To view the analysis done using SQL, see the "Analiz.sql" file in the Repository.


**🎯 Key Takeaways**
The project highlights critical customer and sales metrics such as sales distribution, monthly sales trends, and number of orders by region.
It helps understand customer profiles by correlating revenue and sales metrics with products and cities.
It allows the company to focus on customer segments and identify high-value customers who place higher order amounts and purchase products more frequently.

**🚀 How to Use This Project**
Clone or download the repository.
Open the "E-Commerce Dashboard.pbix" file in Power BI Desktop.
Explore the various dashboards and reports created in this project.
Customize and modify the analysis or add new data as needed.
Feel free to tweak the existing visualizations and DAX calculations to fit your own data needs or project requirements.


