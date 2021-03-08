/* Ruslan Kalashnikov & Joseph Sepe - CS276 WINTER 2021
USE CASE 7:
Write a function that will display the total number of sales for one of the stores between two dates.
I should be able to call the function passing in a begin date and an end date and store code.
*/

set serveroutput on;
create or replace function get_total_number_sales
(v_shop_id varchar2, v_start_date date, v_end_date date)
return number
is
v_total_sales number;
begin
  select count(*) into v_total_sales from transaction 
    join trans_line_item on trans_line_item.fk_trans_id = transaction.trans_id
    join product on product.product_id = trans_line_item.fk_product_id
    join inventory on inventory.inventory_id = product.fk_inventory_id
    join shop on shop.shop_id = inventory.fk_shop_id
    where (trans_date between v_start_date and v_end_date) and shop_id = v_shop_id;
  return v_total_sales;
end;
/

-- Sample code to test the function
set serveroutput on;
select get_total_number_sales('001', to_date('14-01-2021', 'dd-mm-yyyy'), to_date('22-01-2021', 'dd-mm-yyyy'))
as total_number_of_sales from dual;