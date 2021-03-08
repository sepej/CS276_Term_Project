/* Ruslan Kalashnikov & Joseph Sepe - CS276 WINTER 2021
USE CASE 3:
The Abbott wants to know if there are any visitors that have made repeat visits (MORE THAN ONE) so they can direct marketing efforts toward them.
This query will require an aggregate.
*/

select visitor_id, first_name, last_name, count(*) as num_visits from reservation
join visitor on reservation.fk_visitor_id = visitor.visitor_id
group by visitor_id, first_name, last_name having count(*) > 1;