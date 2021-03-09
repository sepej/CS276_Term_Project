# Buckfast Abbey Term Project

CS276 Database System and Modeling - Winter 2021  
By **Ruslan Kalashnikov &amp; Joseph Sepe**

---

## Project Description

### Buckfast Abbey

Nestled in the shadow of Dartmoor, in a beautiful wooded valley beside the river Dart, Buckfast Abbey offers visitors a tranquil refuge from the hectic pace of everyday life. The Abbey is a working monastery where a community of Benedictine monks live self-sufficiently, welcoming visitors from all around the world.

At the heart of the site is the Abbey Church, a spiritual haven for the many thousands of visitors who come each year. There is an overwhelming sense of peace as soon as you enter the grounds with the church surrounded by gardens which in the summer come alive with color.

Within the Abbey precinct, visitors can browse in the Bookshop or visit the Monastic Shop which has an extraordinary array of products made by nuns and monks across Europe. There is also a gift shop and information point by the Westgate entrance.

In the Grange Restaurant, you can relax and enjoy tea and homemade cakes or choose from a range of hot meals and light snacks which are changed daily.

Escape for a while at Buckfast – worlds away from the busy rush of the everyday and just a few minutes from the A38.

---

Buckfast Abbey has 12 Guest Houses for visitors to reserve, and are available at $60 a night. A monk is assigned to work a single guest house for a week on a rotational basis.

There are three shops available to browse: A Bookshop which has a wide range of religious books as well as books about the local county; a Gift Shop for the religious; and a Candy Shop which sells items made by nuns and monks from monasteries (candies, jams, candles). Monks who have not taken a vow of silence work in the shops and Guest Houses and are assigned on a rotating basis.

The Grange restaurant has lay workers who work there every day except holidays. Payroll is paid twice a month. Reservations must be made at least 24 hours in advance.

Inventory for the stores is delivered twice a week, on Mondays and Thursdays, and shipping is all done online because of the pandemic.

---

The following are required for your term project:

1. Title Page with Abstract
2. Table of Contents
3. Entities List
4. Business Rules
5. Conceptual ERD
6. Logical ERD
7. Data Warehouse
8. [Physical Implementation (SQL) scripts (in a zip file, and separate from the report itself)](https://github.com/sepej/CS276_Term_Project/blob/main/PHYS_DESIGN.sql)
9. [Use Case Code (10 points each)](https://github.com/sepej/CS276_Term_Project/tree/main/Use%20Case%20Code)
10. Index choice

[USE CASES – SQL Coding](https://github.com/sepej/CS276_Term_Project/tree/main/Use%20Case%20Code)

1. A Visitor makes a reservation for February 21, 2021 to February 27, 2021 for one of the Guest Houses, and a monk must be assigned for each of those weeks. Using one query, display the Visitor name, the Guest house, and the monk assigned for each week. [USE_CASE_01.sql](https://github.com/sepej/CS276_Term_Project/blob/main/Use%20Case%20Code/USE_CASE_01.sql)
2. The Abbott wants to know all room numbers, as well as those customer names that are staying at the monastery on Friday, February 2, 2021. Not all rooms will be filled… [USE_CASE_02.sql](https://github.com/sepej/CS276_Term_Project/blob/main/Use%20Case%20Code/USE_CASE_02.sql)
3. The Abbott wants to know if there are any visitors that have made repeat visits (MORE THAN ONE) so they can direct marketing efforts toward them. This query will require an aggregate. [USE_CASE_03.sql](https://github.com/sepej/CS276_Term_Project/blob/main/Use%20Case%20Code/USE_CASE_03.sql)
4. The Abbott wants to know the total pay for employee EMP55555 between Feb 2, 2021 and March 21, 2021. You must calculate the number of hours (based on start and end times of each of their shifts), and using the hourly pay, calculate the total pay. [USE_CASE_04.sql](https://github.com/sepej/CS276_Term_Project/blob/main/Use%20Case%20Code/USE_CASE_04.sql)
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

| **Description** | **Points** |
| --- | --- |
| **Entities** | **20** |
| **Business Rules** | **20** |
| **Conceptual ERD** | **20** |
| **Logical ERD** | **20** |
| **Table Creates** | **20** |
| **Use Case Code** | **100** |
| **TOTAL** | **200** |
