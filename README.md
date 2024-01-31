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