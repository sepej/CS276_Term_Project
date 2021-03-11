/* Ruslan Kalashnikov & Joseph Sepe - CS276 WINTER 2021
USE CASE 1:
A Visitor makes a reservation for Feb 21, 2021 to Feb 27, 2021 for one of the Guest Houses, and a monk must be assigned for each of those weeks.
Using one query, display the Visitor name, the Guest house, and the monk assigned for each week.
*/

select  visitor.first_name as "visitor first name", visitor.last_name as "visitor last name", check_in_date, check_out_date, 
        time_card.fk_house_id as "house id", monk.first_name as "monk first name", time_card.start_date_time from visitor
    join reservation on visitor_id = fk_visitor_id
    join res_line_item on reservation_id = fk_reservation_id
    join room on fk_room_id = room_id
    join time_card on time_card.fk_house_id = room.fk_house_id
    join monk on monk.monk_id = time_card.fk_monk_id
        where time_card.start_date_time between to_date('02-21-2021', 'mm-dd-yyyy') and to_date('02-27-2021', 'mm-dd-yyyy');