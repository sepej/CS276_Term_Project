/* Ruslan Kalashnikov & Joseph Sepe - CS276 WINTER 2021
USE CASE 9:
Write a trigger that will calculate a customer’s total Guest House bill and 
store it in a separate table when they make a reservation at a Guest House.
The customer will stay multiple days.
*/

-- Create the customer_bill table to store the bills.
create table customer_bill (customer_id varchar2(15) primary key not null, total_bill number);

-- Function to check if room is available before making a reservation
create or replace function check_if_room_available
(v_room_number varchar2, v_check_in_date date, v_check_out_date date)
return number
is 
bool_is_available number;
begin
select count(*) into bool_is_available from house 
    join room on house.house_id = room.fk_house_id
    join res_line_item on room.room_id = res_line_item.fk_room_id
    join reservation on res_line_item.fk_reservation_id = reservation.reservation_id
    where room.room_id = v_room_number AND (reservation.check_in_date between
    v_check_in_date and v_check_out_date)
    OR room.room_id = v_room_number AND (reservation.check_out_date between
    v_check_in_date and v_check_out_date);
    if bool_is_available = 1 then bool_is_available := 0;
    elsif bool_is_available = 0 then bool_is_available := 1;
    end if;
    return bool_is_available;
end;
/

-- Sample code to check if room is available
select check_if_room_available('1003', to_date('03/26/2021', 'mm/dd/yyyy'), to_date('03/30/2021', 'mm/dd/yyyy')) as room_is_available from dual;

-- Create the trigger on an insert into res_line_item
CREATE OR REPLACE TRIGGER visitor_total_calc 
before INSERT
    ON res_line_item
FOR EACH ROW
DECLARE

    var_visitor_id varchar2(10);
    var_check_in_date date;
    var_check_out_date date;
    var_total_bill number(7,2);
    var_room_rate number(7,2);
    var_room_id varchar2(10);
    var_reservation_id varchar2(10);
    bool_room_available number;

BEGIN
  if inserting then
    select fk_visitor_id, check_in_date, check_out_date, res.reservation_id
        into var_visitor_id, var_check_in_date, var_check_out_date, var_reservation_id
        from reservation res
        where res.reservation_id = :NEW.fk_reservation_id;
    
        dbms_output.put_line(var_visitor_id);
        dbms_output.put_line(var_check_in_date);
        dbms_output.put_line(var_check_out_date);

        select distinct room_rate into var_room_rate from room 
        join res_line_item on res_line_item.fk_room_id = room.room_id
        where room_id = :NEW.fk_room_id;
        
        dbms_output.put_line(var_room_rate);

        var_total_bill := (var_check_out_date - var_check_in_date) * var_room_rate;

        dbms_output.put_line(var_visitor_id  || ' is making a reservation.
        Total bill is: ' || var_total_bill);
        insert into customer_bill values(var_visitor_id, var_total_bill);
  end if;
END;
/

-- Sample code to test the insert trigger
-- Insert a new reservation:
insert into reservation
(reservation_id, check_in_date, check_out_date, number_guests, fk_visitor_id)
values
('135554', to_date('03/26/2021', 'mm/dd/yyyy'), to_date('03/30/2021', 'mm/dd/yyyy'), 6, '2021113');

-- Insert a new res_line_item
insert into res_line_item
(res_line_item_id, fk_room_id, fk_reservation_id)
values
('line3244', '1001', '135554');

-- Select to look at the new reservation
select * from reservation join res_line_item
on res_line_item.fk_reservation_id = reservation.reservation_id
where reservation_id = '135554';