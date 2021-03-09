# Buckfast Abbey Term Project

CS276 Database System and Modeling - Winter 2021  
By **Ruslan Kalashnikov &amp; Joseph Sepe**

---

## Use Cases

[USE CASES – SQL Coding](https://github.com/sepej/CS276_Term_Project/tree/main/Use%20Case%20Code)

1. A Visitor makes a reservation for February 21, 2021 to February 27, 2021 for one of the Guest Houses, and a monk must be assigned for each of those weeks. Using one query, display the Visitor name, the Guest house, and the monk assigned for each week.[USE_CASE_01.sql](https://github.com/sepej/CS276_Term_Project/blob/main/Use%20Case%20Code/USE_CASE_01.sql)
2. The Abbott wants to know all room numbers, as well as those customer names that are staying at the monastery on Friday, February 2, 2021. Not all rooms will be filled… [USE_CASE_02.sql](https://github.com/sepej/CS276_Term_Project/blob/main/Use%20Case%20Code/USE_CASE_02.sql)
3. The Abbott wants to know if there are any visitors that have made repeat visits (MORE THAN ONE) so they can direct marketing efforts toward them. This query will require an aggregate. [USE_CASE_03.sql](https://github.com/sepej/CS276_Term_Project/blob/main/Use%20Case%20Code/USE_CASE_03.sql)
4. The Abbott wants to know the total pay for employee 101 between June 1, 2019 and June 14, 2019. You must calculate the number of hours (based on start and end times of each of their shifts), and using the hourly pay, calculate the total pay. [USE_CASE_04.sql](https://github.com/sepej/CS276_Term_Project/blob/main/Use%20Case%20Code/USE_CASE_04.sql)
5. A Monk needs to find out which guest rooms are empty (the guests have checked out) on February 3, 2021 so he can clean them. [USE_CASE_05.sql](https://github.com/sepej/CS276_Term_Project/blob/main/Use%20Case%20Code/USE_CASE_05.sql)

[USE CASES – PL/SQL Coding](https://github.com/sepej/CS276_Term_Project/tree/main/Use%20Case%20Code)

6. A vendor delivers a product to the abbey to one of the stores. Write a stored procedure to take in the product ID and a delivery amount and price and insert it into the database if new, or update it if it currently is sold. This will require updating the inventory count. Make sure you test both conditions. [USE_CASE_06.sql](https://github.com/sepej/CS276_Term_Project/blob/main/Use%20Case%20Code/USE_CASE_06.sql)
7. Write a function that will display the total number of sales for one of the stores between two dates. I should be able to call the function passing in a begin date and an end date and store code. [USE_CASE_07.sql](https://github.com/sepej/CS276_Term_Project/blob/main/Use%20Case%20Code/USE_CASE_07.sql)
8. Write a function that will return the count of rooms that do NOT have reservations at the Abbey on February 2, 2021. [USE_CASE_08.sql](https://github.com/sepej/CS276_Term_Project/blob/main/Use%20Case%20Code/USE_CASE_08.sql)
9. Write a trigger that will calculate a customer&#39;s total Guest House bill and store it in a separate table when they make a reservation at a Guest House. The customer will stay multiple days. [USE_CASE_09.sql](https://github.com/sepej/CS276_Term_Project/blob/main/Use%20Case%20Code/USE_CASE_09.sql)
10. Write a package made up of the following: [USE_CASE_10.sql](https://github.com/sepej/CS276_Term_Project/blob/main/Use%20Case%20Code/USE_CASE_10.sql)  
  a. A procedure that will receive a purchase ID and the customer number  
  b. A function that will calculate the amount of sales tax based on a purchase from Buckfast Abbey, depending on the state where the purchaser is located  
  c. A procedure which will subtract from inventory  
  d. Print out the customer id, the first and last names of the customer, the purchase date, and the total cost of the purchase (including the calculated sales tax).