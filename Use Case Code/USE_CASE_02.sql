/* Ruslan Kalashnikov & Joseph Sepe - CS276 WINTER 2021
USE CASE 2:
The Abbott wants to know all room numbers, as well as those customer names that are staying at the monastery on Friday, Feb 2, 2021.
Not all rooms will be filled…
*/

select room_id, visitor.first_name as "visitor first name", visitor.last_name as "visitor last name" from room
    left join res_line_item on room_id = fk_room_id
    left join reservation on fk_reservation_id = reservation_id
    left join visitor on fk_visitor_id = visitor_id
        and to_date('2/02/2021', 'mm/dd/yyyy') between check_in_date and check_out_date;