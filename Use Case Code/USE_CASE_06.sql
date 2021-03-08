/* Ruslan Kalashnikov & Joseph Sepe - CS276 WINTER 2021
USE CASE 6:
A vendor delivers a product to the abbey to one of the stores.
Write a stored procedure to take in the product ID and a delivery amount and price and insert it into the database if new,
or update it if it currently is sold.  This will require updating the inventory count.  Make sure you test both conditions.
*/

select r.room_id, house_id, res.check_out_date as check_out from house h
    join room r on h.house_id = r.fk_house_id
    join res_line_item ln on r.room_id = ln.fk_room_id
    join reservation res on res.reservation_id = ln.fk_reservation_id
    where to_date('03-feb-21', 'dd-mon-yy') = res.check_out_date;