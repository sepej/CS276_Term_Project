# Buckfast Abbey Term Project

CS276 Database System and Modeling - Winter 2021  
By **Ruslan Kalashnikov &amp; Joseph Sepe**

---

## Business Rules

1. A **VISITOR** may make 0 to many **RESERVATIONS**; A **RESERVATION** must be made by 1 and only 1 **VISITOR**.

2. A **RESERVATION** may be for 0 to many     **ROOM**s; A **ROOM** may belong to 0 to many **RESERVATION**s.

3. A **HOUSE** must contain 1 to many **ROOM**s; A **ROOM** must belong to 1 and only 1     **HOUSE**.

4. A **VISITOR** may have 0 to many **TRANSACTION**s; A **TRANSACTION** must be made from 1 and only 1 **VISITOR**.

5. A **VISITOR** may purchase 0 to many     **PRODUCT**s; A **PRODUCT** may be purchased by 0 to many **VISITOR**s.

6. 1. A **VISITOR** may have 0 to many **TRANSACTION**s;      A **TRANSACTION** must belong to 1 and only 1 **VISITOR**.

   2. A **TRANSACTION** will contain 1 to many **PRODUCT**s;      A **PRODUCT** will be a part of 0 to many **TRANSACTION**s.

   3. 1. A **PRODUCT** may be on 0 to many **TRANSACTION       LINE ITEM**s; A **TRANSACTION       LINE ITEM** has 1 and only 1 **PRODUCT**.
      2. A **TRANSACTION** must have 1 to many **TRANSACTION       LINE ITEM**s; A **TRANSACTION       LINE ITEM** must have 1 and only 1 **TRANSACTION**.

7. A **PRODUCT** will belong to 0 to many     **SHOP**s; A **SHOP** may have 0 to many **PRODUCT**s.

8. 1. A **SHOP** must have 1 to many **INVENTORY**;      An **INVENTORY** must belong to 1 and only 1 **SHOP**.
   2. A **PRODUCT** will be a part of 1 and only 1 **INVENTORY**; An **INVENTORY**      may contain 0 to many **PRODUCT**s;

9. An **EMPLOYEE** must work at 1 and only 1     **SHOP**; A **SHOP** must employ 1 to many **EMPLOYEE**s.

10. 1. A **TIME CARD** must belong to 1 and only 1 **EMPLOYEE**; An **EMPLOYEE** must      have 1 to many **TIME CARD**s.
    2. A **SHOP** must have 1 to many **TIME      CARD**s; A **TIME CARD** must      have 1 and only 1 **SHOP**.

1. An **EMPLOYEE** must have 1 to many **PAYROLL**; A **PAYROLL** must have 1 to many **EMPLOYEE**s.

2. 1. An **EMPLOYEE** must get 1 to many **PAYCHECK**s;      A **PAYCHECK** must be sent to 1 and only 1 **EMPLOYEE**;
   2. A **PAYROLL** must process 1 to many **PAYCHECK**s;      A **PAYCHECK** must be processed      by 1 and only 1 **PAYROLL**.

3. A **MONK** may work at 0 to many **HOUSE**s; A **HOUSE** may have 0 to many **MONK**s.

4. 1. A **TIME CARD** must have 1 and only 1 **MONK**; A **MONK** may      have 0 to many **TIME CARD**s.
   2. A **TIME CARD** must be for 1 and only 1 **HOUSE**; A **HOUSE** may      have 0 to many **TIME CARD**s.

5. A **MONK** may work at 0 to many **SHOP**s; A **SHOP** may have 0 to many **MONK**s.

6. 1. A **TIME CARD** must have 1 and only 1 **MONK**; A **MONK** may      have 0 to many **TIME CARD**s.
   2. A **TIME CARD** must be for 1 and only 1 **SHOP**; A **SHOP** may      have 0 to many **TIME CARD**s.

