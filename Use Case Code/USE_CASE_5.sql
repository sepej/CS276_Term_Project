/* Ruslan Kalashnikov & Joseph Sepe - CS276 WINTER 2021
USE CASE 5:
A Monk needs to find out which guest rooms are empty (the guests have checked out) on Feb 3 so he can clean them.
*/

select r.room_id, house_id, res.check_out_date as check_out from house h
    join room r on h.house_id = r.fk_house_id
    join res_line_item ln on r.room_id = ln.fk_room_id
    join reservation res on res.reservation_id = ln.fk_reservation_id
    where to_date('03-feb-21', 'dd-mon-yy') = res.check_out_date;