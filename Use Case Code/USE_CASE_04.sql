/* Ruslan Kalashnikov & Joseph Sepe - CS276 WINTER 2021
USE CASE 4:
The Abbott wants to know the total pay for employee EMP55555 between Feb 2, 2021 and March 21, 2021.
You must calculate the number of hours (based on start and end times of each of their shifts), and using the hourly pay, calculate the total pay.
*/

select sum(((end_date_time - start_date_time) * 24 * pay_rate)) as pay from employee
join time_card on emp_id = fk_emp_id
where emp_id = 'EMP55555' and (start_date_time between to_date('2/02/2021', 'mm/dd/yyyy') and to_date('03/21/2021', 'mm/dd/yyyy'));