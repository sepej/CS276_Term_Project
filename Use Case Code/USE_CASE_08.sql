/* Ruslan Kalashnikov & Joseph Sepe - CS276 WINTER 2021
USE CASE 8:
Write a function that will return the count of rooms that do NOT have reservations at the Abbey on Saturday, Feb 2, 2021.
*/

SET SERVEROUTPUT ON;

create or replace function check_rooms_available
(v_date date)
return number
is 

v_rooms_available number;

BEGIN      
select count(distinct room_id) into v_rooms_available from room
    left outer join res_line_item on room.room_id = res_line_item.fk_room_id
    left outer join reservation on reservation.reservation_id = res_line_item.fk_reservation_id
    where res_line_item.fk_room_id IN 
        (select distinct fk_room_id from res_line_item 
            join reservation on reservation.reservation_id = res_line_item.fk_reservation_id 
            where (v_date not between check_in_date and check_out_date)) 
            or res_line_item.fk_reservation_id is null;
            
return v_rooms_available;
END;
/
    
-- Sample code to test the function
select check_rooms_available(to_date('01-02-2021', 'dd-mm-yyyy')) as rooms_available from dual;