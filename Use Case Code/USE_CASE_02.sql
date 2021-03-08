/* Ruslan Kalashnikov & Joseph Sepe - CS276 WINTER 2021
USE CASE 2:
The Abbott wants to know all room numbers, as well as those customer names that are staying at the monastery on Friday, June 7, 2019.  Not all rooms will be filled…
*/

select  visitor.first_name as "visitor first name", visitor.last_name as "visitor last name", room_id, check_in_date, check_out_date from visitor
    join reservation on visitor_id = fk_visitor_id
    join res_line_item on reservation_id = fk_reservation_id
    join room on fk_room_id = room_id
        where to_date('2/02/2021', 'mm/dd/yyyy') between check_in_date and check_out_date;