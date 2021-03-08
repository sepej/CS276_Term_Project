/* Ruslan Kalashnikov & Joseph Sepe - CS276 WINTER 2021
USE CASE 10:
Write a package made up of the following:
a.	A procedure that will receive a purchase ID and the customer number
b.	A function that will calculate the amount of sales tax based on a purchase from Buckfast Abbey, depending on the state where the purchaser is located
c.	A procedure which will subtract from inventory
d.	Print out the customer id, the first and last names of the customer, the purchase date, and the total cost of the purchase (including the calculated sales tax).
*/

set SERVEROUTPUT ON;

CREATE OR REPLACE PACKAGE transaction_calc_package AS

    CURSOR transaction_information(p_trans_id varchar2) IS
        select * from transaction
            join trans_line_item on trans_line_item.fk_trans_id = transaction.trans_id
            join visitor on visitor.visitor_id = transaction.fk_visitor_id
            join product on product.product_id = trans_line_item.fk_product_id
            join inventory on inventory.inventory_id = product.fk_inventory_id
            where transaction.trans_id = p_trans_id;
    
    FUNCTION sales_tax_calc(p_visitor_id varchar2, p_trans_id varchar2) return number;
    
    PROCEDURE handle_transaction_proc (p_visitor_id IN varchar2, p_trans_id IN varchar2);
    
END transaction_calc_package;
/


CREATE OR REPLACE PACKAGE BODY transaction_calc_package AS

    FUNCTION sales_tax_calc(
        p_visitor_id in varchar2,
        p_trans_id in varchar2)
        RETURN number
    IS
        var_visitor_state varchar2(25);
        var_total_paid number(7,2) := 0;
        var_sales_tax_amount number(7,2);
    
    BEGIN
        FOR rec IN transaction_information(p_trans_id) 
        LOOP
                var_total_paid := var_total_paid + (rec.quantity * rec.unit_price);
                var_visitor_state := lower(rec.state);
        END LOOP;
    
        case
            when var_visitor_state = 'wa' then var_sales_tax_amount := var_total_paid * 0.05;
            when var_visitor_state = 'or' then var_sales_tax_amount := var_total_paid * 0.08;
            when var_visitor_state = 'ca' then var_sales_tax_amount := var_total_paid * 0.1;
            when var_visitor_state = 'switzerland' then var_sales_tax_amount := var_total_paid * 0.15;
            when var_visitor_state = 'sweden' then var_sales_tax_amount := var_total_paid * 0.20;
        end case;
     
        dbms_output.put_line('Total paid: ' || var_total_paid);
        dbms_output.put_line('Total tax: ' || var_sales_tax_amount);
        RETURN var_sales_tax_amount;
    END sales_tax_calc;


    PROCEDURE handle_transaction_proc(
        p_visitor_id IN varchar2,
        p_trans_id IN varchar2)
    IS
        var_visitor_name varchar2(50);
        var_visitor_state varchar2(25);
        var_total_paid number(7,2) := 0;
        var_total_sales_tax number(7,2);
        var_total_with_tax number(7,2);
        var_transaction_date date;
    
    BEGIN
        FOR rec IN transaction_information(p_trans_id) 
        LOOP
            var_total_paid := var_total_paid + (rec.quantity * rec.unit_price);
            var_visitor_state := lower(rec.state);
            var_visitor_name := rec.first_name || ' ' || rec.last_name;
            var_transaction_date := rec.trans_date;
        
            -- remove from inventory and update
            update inventory i set i.quantity_on_hand = (i.quantity_on_hand - rec.quantity)
            where i.inventory_id = rec.fk_inventory_id;
        END LOOP;
    
        var_total_sales_tax := sales_tax_calc(p_visitor_id, p_trans_id);
        var_total_with_tax := var_total_paid + var_total_sales_tax;
    
        dbms_output.put_line('Visitor ID: ' || p_visitor_id);
        dbms_output.put_line('Visitor name: ' || var_visitor_name);
        dbms_output.put_line('Transaction date: ' || var_transaction_date);
        dbms_output.put_line('Total amount paid(with tax): ' || var_total_with_tax);   
    END handle_transaction_proc;
END transaction_calc_package;
/


SET SERVEROUTPUT ON;

DECLARE
    visitor_id varchar2(10);
    transaction_id varchar2(10);
    v_sales_tax number(7,2);
BEGIN
    dbms_output.put_line('Calculate Sales Tax');
    dbms_output.put_line('--------------------');
    visitor_id := '2021112';
    transaction_id := '2021002';
    v_sales_tax := transaction_calc_package.sales_tax_calc(visitor_id, transaction_id);
    dbms_output.put_line('--------------------');
    transaction_calc_package.handle_transaction_proc(visitor_id, transaction_id);
END;
/