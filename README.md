# data-analytics-power-bi-report331

# Milestone 1: Set up the Environment

Task 1 : Set up GitHub

# Milestone 2: Import the Data into Power BI

Task 1 : Create an Azure Windiows VM - Only for Mac and Linux users

Task 2 : Load and Transform Orders table 
1.  Connected to the Azure SQL Database and imported the orders_powerbi table using the Import option in Power BI. The credentials for the Azure DB are as follows:

server_name = my-server-maya.database.windows.net
database_name = orders_db
username = maya
password = AiCore127!

2. Navigated to the Power Query Editor and deleted the column named [Card Number] to ensure data privacy
3. Used the Split Column feature to separate the [Order Date] and [Shipping Date] columns into two distinct columns each: one for the date and another for the time
4. Filtered out and remove any rows where the [Order Date] column has missing or null values to maintain data integrity
5. Renamed the columns in your dataset to align with Power BI naming conventions, ensuring consistency and clarity in your report

Task 3 : Import and Transform Product Dimension table 
The Products table contains information about each product sold by the company, including the product code, name, category, cost price, sale price, and weight.

1.  Downloaded the Products.csv file  and then use Power BI's Get Data option to import the file into your project
2.  In the Data view, used the Remove Duplicates function on the product_code column to ensure each product code is unique
3.  Followed the steps below to clean and transform the data in the weight column
    In Power Query Editor, used the Column From Examples feature to generate two new columns from the weight column - one for the weight values and another for the units (e.g. kg, g, ml). You might need to sort the weight column by descending to get enough different examples to work with.
    For the newly created units column, replaced any blank entries with kg
    For the values column, converted the data type to a decimal number
    If any errors arise during the conversion, replaced those error values with the number 1
    From the Data view, created a new calculated column, such that if the unit in the units column is not kg, divide the corresponding value in the values column by 1000 to convert it to kilograms
    Returned to the Power Query Editor and deleted any columns that are no longer needed
4.  Renamed the columns in your dataset to match Power BI naming conventions, ensuring a consistent and clear presentation in your report

Task 4 : Import and Transform Stores Dimension table 
The Stores table contains information about each store, including the store code, store type, country, region, and address.

1.  Use Power BI's Get Data option to connect to Azure Blob Storage and import the Stores table into your project

    Blob Storage credentials:
    - account_name = powerbistorage2
    - Account Key = ZPUQ+verSniHMG7EqR5/VAQc0aUYYG1utLQQuke0JQqR18TRRZI1/vTX65OqeXfUgWAugYLL73Gp+AStozRNKw==
    - Container Name = data-analytics
2.  Rename the columns in your dataset to align with Power BI naming conventions, ensuring clarity and consistency in your report

Task 5 : Import and Transform Customers table 
1.  Downloaded the Customers.zip file from this link  and unzip it on your local machine. Inside the zip file is a folder containing three CSV files, each with the same column format, one for each of the regions in which the company operates.
2.  Used the Get Data option in Power BI to import the Customers folder into your project. You'll need to use the Folder data connector. Navigate to your folder, and then select Combine and Transform to import the data. Power BI will automatically append the three files into one query.
3.  Once the data are loaded into Power BI, create a Full Name column by combining the [First Name] and [Last Name] columns
4.  Deleted any obviously unused columns (eg. index columns) and rename the remaining columns to align with Power BI naming conventions

Task 6 : Update Documentation
Finally added all the above details to this README.md file

# Milestone 3 : Creating the Data Model

Task 1 : Create a Date table

1.  Created a date table running from the start of the year containing the earliest date in the Orders['Order Date'] column to the end of the year containing the latest date in the Orders['Shipping Date'] column. DAX formula was used to create the table.

2.  Used DAX formulas to add the following columns to the date table:

Day of Week
Month Number (i.e. Jan = 1, Dec = 12 etc.)
Month Name
Quarter
Year
Start of Year
Start of Quarter
Start of Month
Start of Week

Task 2 : Build the STAR schema Data model

1.  Created relationships between the tables to form a star schema. The relationships are as follows:

Products[product_code] to Orders[product_code]
Stores[store code] to Orders[Store Code]
Customers[User UUID] to Orders[User ID]
Date[date] to Orders[Order Date]
Date[date] to Orders[Shipping Date]

2.  Ensured that the relationship between Orders[Order Date] and Date[date] is the active relationship, and that all relationships are one-to-many, with a single filter direction flowing from the dimension table side to the fact table side.

Task 3 : Create a measure table

Created a separate table for measures as a best practice that helped us keep our data model organized and easy to navigate. Created a new table in the data Model View with Power Query Editor as it makes the measures table visible in the Query Editor, which is useful for debugging and troubleshooting.

From the Model view, selected the Enter Data from the Home tab of the ribbon
Named the new blank table Measures Table and then clicked Load

Task 4 : Create Key Measures

1.  Created a measure called Total Orders that counts the number of orders in the Orders table


2.  Created a measure called Total Revenue that multiplies the Orders[Product Quantity] column by the Products[Sale_Price] column for each row, and then sums the result


3.  Created a measure called Total Profit which performs the following calculation:

4.  For each row, subtracted the Products[Cost_Price] from the Products[Sale_Price], and then multipled the result by the Orders[Product Quantity]

Sumed the result for all rows

4.  Created a measure called Total Customers that counts the number of unique customers in the Orders table. This measure changes as the Orders table is filtered, and it is not just count the rows of the Customers table!

5.  Created a measure called Total Quantity that counts the number of items sold in the Orders table

6.  Created a measure called Profit YTD that calculates the total profit for the current year

7.  Created a measure called Revenue YTD that calculates the total revenue for the current year

Task 5 : Create Date and Geogaraphy Hierarchies 

Hierarchies allow us to drill down into our data and perform granular analysis within our report. I created two hierarchies in this task: one for dates, to facilitate drill-down in line charts, and one for geography, to allow me to filter our data by region, country and province/state.


1.  Created a date hierarchy using the following levels:

Start of Year
Start of Quarter
Start of Month
Start of Week
Date

2.  Created a new calculated column in the Stores table called Country that creates a full country name for each row, based on the Stores[Country Code] column, according to the following scheme:
GB : United Kingdom
US : United States
DE : Germany

3.  In addition to the country hierarchy, it can sometimes be helpful to have a full geography column, as in some cases this makes mapping more accurate. Created a new calculated column in the Stores table called Geography that created a full geography name for each row, based on the Stores[Country Region], and Stores[Country] columns, separated by a comma and a space.

4.  Ensured that the following columns have the correct data category assigned, as follows:

World Region : Continent
Country : Country
Country Region : State or Province

5.  Create a Geography hierarchy using the following levels:

World Region
Country
Country Region

Task 6 : Updated Documentation in comprehensive manner.