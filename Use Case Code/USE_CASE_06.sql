/* Ruslan Kalashnikov & Joseph Sepe - CS276 WINTER 2021
USE CASE 6:
A vendor delivers a product to the abbey to one of the stores.
Write a stored procedure to take in the product ID and a delivery amount and price and insert it into the database if new,
or update it if it currently is sold. This will require updating the inventory count. Make sure you test both conditions.
*/

set serveroutput on;
create or replace procedure update_inventory(
  v_product_id in varchar2,
  v_delivery_amount in number,
  v_price in number
  )
is
bool_product_exists number;
product_id varchar2(20);
v_current_amount number(7);
v_prod_description varchar2(20) := 'Default Product Desc';
v_inventory_id varchar2(15);
v_shop_id varchar2(15);
bool_already_exists number(10);
v_random_number number(10);
begin
-- check if product exists
  select count(*)
  into bool_product_exists
  from product
  where product_id = v_product_id;
  
  if bool_product_exists = 0
  then
    --dbms_output.put_line('That product does not exist Inserting');
    select dbms_random.value(100,999) num into v_random_number FROM dual;
    v_inventory_id := 'item' || v_random_number;
    v_shop_id := '001';
    
    select count(*)
    into bool_already_exists
    from inventory
    where inventory_id = v_inventory_id;
    
    WHILE bool_already_exists = 1
    LOOP
      select dbms_random.value(100,999) num into v_random_number FROM dual;
      v_inventory_id := 'item' || v_random_number;
      
      select count(*)
      into bool_already_exists
      from inventory
      where inventory_id = v_inventory_id;
    END LOOP;
    
    insert into inventory values(v_inventory_id, v_shop_id, v_delivery_amount);
    insert into product values(v_product_id, v_prod_description, v_price, v_inventory_id);
  else
    -- get shop id and inventory id
    select shop_id, inventory_id into v_shop_id, v_inventory_id from product
    join inventory on inventory.inventory_id = product.fk_inventory_id
    join shop on shop.shop_id = inventory.fk_shop_id
    where product_id = v_product_id;
  
    --dbms_output.put_line('Product exists Updating');
    select quantity_on_hand into v_current_amount from inventory
    where inventory_id = v_inventory_id;

    update inventory set quantity_on_hand = (v_current_amount + v_delivery_amount) where inventory_id = v_inventory_id;
    update product set product_price = v_price where inventory_id = v_inventory_id;
  end if;
end;
/

-- Sample code to execute the procedure
set serveroutput on;
exec update_inventory('prod008', 25, 50);