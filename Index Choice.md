# Buckfast Abbey Term Project

CS276 Database System and Modeling - Winter 2021  
By **Ruslan Kalashnikov &amp; Joseph Sepe**

---

## Index Choice

1. The index is created on the TIME_CARD table, employee last name to facilitate retrieval of all of the time card records associated with a specific employee (last name).

   **create index ind_loc_to_employee_by_last_name on time_card(last_name);** 

2. The index is created on the RESERVATION table, check-in date in order to quickly find all the reservations based on a specific check-in date.
   **create index ind_loc_to_reservation_by_check_in_date on reservation(check_in_date);**