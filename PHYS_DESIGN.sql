drop table RES_LINE_ITEM cascade constraints;
drop table RESERVATION cascade constraints;
drop table ROOM cascade constraints;
drop table VISITOR cascade constraints;
drop table HOUSE cascade constraints;
drop table TRANSACTION cascade constraints;
drop table TRANS_LINE_ITEM cascade constraints;
drop table PRODUCT cascade constraints;
drop table INVENTORY cascade constraints;
drop table SHOP cascade constraints;
drop table MONK cascade constraints;
drop table TIME_CARD cascade constraints;
drop table EMPLOYEE cascade constraints;
drop table PAYCHECK cascade constraints;
drop table PAYROLL cascade constraints;

create table HOUSE
(house_id 		varchar2(10) primary key,
num_of_rooms 		number(3) not null);

create table PAYROLL
(payroll_id		varchar2(10) primary key);

create table VISITOR
(visitor_id		varchar2(10) primary key,
first_name		varchar2(25) not null,
last_name		varchar2(25) not null,
phone_number		varchar2(25) not null,
city_name		varchar2(25) not null,
state			varchar2(25) not null);

create table TRANSACTION
(trans_id   		varchar2(10) primary key,
trans_type    		varchar2(10)  not null,
trans_date		date not null,
fk_visitor_id		varchar2(10) not null);

create table PRODUCT
(product_id   		varchar2(10) primary key,
product_desc    	varchar2(25)  not null,
product_price		number(7,2) not null,
fk_inventory_id		varchar2(10) not null);

create table TRANS_LINE_ITEM
(trans_item_id   	varchar2(10) primary key,
quantity    		number(7)  not null,
unit_price		number(7,2) not null,
fk_product_id		varchar2(10) not null,
fk_trans_id		varchar2(10) not null);

create table INVENTORY
(inventory_id   	varchar2(10) primary key,
fk_shop_id 		varchar2(10)  not null,
quantity_on_hand	number(7) not null);

create table TIME_CARD
(time_card_id   	varchar2(10) primary key,
start_date_time 	date not null,
end_date_time		date not null,
fk_emp_id		varchar2(10),
fk_shop_id		varchar2(10),
fk_house_id		varchar2(10),
fk_monk_id		varchar2(10));

create table MONK
(monk_id   		varchar2(10) primary key,
first_name    		varchar2(25)  not null,
last_name    		varchar2(25)  not null,
vow_of_silence    	varchar2(10)  not null);

create table SHOP
(shop_id 		varchar2(10) primary key,
type_of_business	varchar2(25)  not null);

create table ROOM
(room_id 		varchar2(10) primary key,
fk_house_id 		varchar2(10) not null,
room_desc 		varchar2(25) not null,
room_rate 		number(7,2) not null);

create table RESERVATION
(reservation_id		varchar2(10) primary key,
fk_visitor_id 		varchar2(10) not null,
number_guests		number(7,2) not null,
check_in_date		date not null,
check_out_date		date not null);

create table RES_LINE_ITEM
(res_line_item_id	varchar2(10) primary key,
fk_room_id 		varchar2(10) not null,
fk_reservation_id 	varchar2(10) not null);

create table PAYCHECK
(paycheck_id		varchar2(10) primary key,
fk_payroll_id		varchar2(10) not null,
fk_emp_id		varchar2(10) not null,
check_date		date not null,
pay_period_start	date not null,
pay_period_end		date not null,
check_amount		number(7,2) not null);

create table EMPLOYEE
(emp_id			varchar2(10) primary key,
first_name		varchar2(25) not null,
last_name		varchar2(25) not null,
phone_number		varchar2(25) not null,
street_address		varchar2(25) not null,
town			varchar2(25) not null,
pay_rate		number(7,2) not null);


alter table TRANSACTION
add constraint fk_visitor_1
foreign key (fk_visitor_id)
references visitor(visitor_id);

alter table TRANS_LINE_ITEM
add constraint fk_product_2
foreign key (fk_product_id)
references product(product_id);

alter table TRANS_LINE_ITEM
add constraint fk_transaction_3
foreign key (fk_trans_id)
references transaction(trans_id);

alter table PRODUCT
add constraint fk_inventory_4
foreign key (fk_inventory_id)
references inventory(inventory_id);

alter table INVENTORY
add constraint fk_shop_5
foreign key (fk_shop_id)
references shop(shop_id);

alter table TIME_CARD
add constraint fk_employee_6
foreign key (fk_emp_id)
references employee(emp_id);

alter table TIME_CARD
add constraint fk_shop_7
foreign key (fk_shop_id)
references shop(shop_id);

alter table TIME_CARD
add constraint fk_house_8
foreign key (fk_house_id)
references house(house_id);

alter table TIME_CARD
add constraint fk_monk_9
foreign key (fk_monk_id)
references monk(monk_id);

alter table PAYCHECK
add constraint fk_payroll_10
foreign key (fk_payroll_id)
references payroll(payroll_id);

alter table PAYCHECK
add constraint fk_employee_11
foreign key (fk_emp_id)
references employee(emp_id);

alter table RES_LINE_ITEM
add constraint fk_room_12
foreign key (fk_room_id)
references room(room_id);

alter table RES_LINE_ITEM
add constraint fk_reservation_13
foreign key (fk_reservation_id)
references reservation(reservation_id);

alter table RESERVATION
add constraint fk_visitor_14
foreign key (fk_visitor_id)
references visitor(visitor_id);

alter table ROOM
add constraint fk_house_15
foreign key (fk_house_id)
references house(house_id);

create index ind_loc_to_employee_by_last_name
on time_card(last_name);

create index ind_loc_to_reservation_by_check_in_date
on reservation(check_in_date);

insert into visitor
(visitor_id, first_name, last_name, phone_number, city_name, state)
values
('2021111','JOE','SCHMIDT','2538887052','SEATTLE', 'WA');
insert into visitor
(visitor_id, first_name, last_name, phone_number, city_name, state)
values
('2021112','GRETA','THUNBERG','0713348475','STOCKHOLM', 'SWEDEN');
insert into visitor
(visitor_id, first_name, last_name, phone_number, city_name, state)
values
('2021113','KIM','KARDASHIAN','3102359977','LOS ANGELES', 'CA');
insert into visitor
(visitor_id, first_name, last_name, phone_number, city_name, state)
values
('2021114','SNOOP','DOGG','5039996666','PORTLAND', 'OR');
insert into visitor
(visitor_id, first_name, last_name, phone_number, city_name, state)
values
('2021115','MICHAEL','SCHUMACHER','41227676111','GLAND', 'SWITZERLAND');


insert into house
(house_id, num_of_rooms)
values
('h1001', 4);
insert into house
(house_id, num_of_rooms)
values
('h1002', 6);
insert into house
(house_id, num_of_rooms)
values
('h1003', 7);
insert into house
(house_id, num_of_rooms)
values
('h1004', 5);
insert into house
(house_id, num_of_rooms)
values
('h1005', 4);
insert into house
(house_id, num_of_rooms)
values
('h1006', 2);
insert into house
(house_id, num_of_rooms)
values
('h1007', 5);
insert into house
(house_id, num_of_rooms)
values
('h1008', 12);
insert into house
(house_id, num_of_rooms)
values
('h1009', 6);
insert into house
(house_id, num_of_rooms)
values
('h1010', 3);
insert into house
(house_id, num_of_rooms)
values
('h1011', 4);
insert into house
(house_id, num_of_rooms)
values
('h1012', 6);


insert into payroll
(payroll_id)
values
('PAY0001');
insert into payroll
(payroll_id)
values
('PAY0002');
insert into payroll
(payroll_id)
values
('PAY0003');
insert into payroll
(payroll_id)
values
('PAY0004');
insert into payroll
(payroll_id)
values
('PAY0005');

--
insert into shop
(shop_id, type_of_business)
values
('001', 'Bookshop');
insert into shop
(shop_id, type_of_business)
values
('002', 'Gift Shop');
insert into shop
(shop_id, type_of_business)
values
('003', 'Candy Shop');
insert into shop
(shop_id, type_of_business)
values
('004', 'The Grange');
--

insert into inventory
(inventory_id, fk_shop_id, quantity_on_hand)
values
('item001','003',258);
insert into inventory
(inventory_id, fk_shop_id, quantity_on_hand)
values
('item002','002',115);
insert into inventory
(inventory_id, fk_shop_id, quantity_on_hand)
values
('item003','001',53);
insert into inventory
(inventory_id, fk_shop_id, quantity_on_hand)
values
('item004','003',113); 
insert into inventory
(inventory_id, fk_shop_id, quantity_on_hand)
values
('item005','001',197); 


insert into product
(product_id, product_desc, product_price, fk_inventory_id)
values
('prod001','Bag of candy',5,'item001');
insert into product
(product_id, product_desc, product_price, fk_inventory_id)
values
('prod002','Cinnamon Candle',12,'item002');
insert into product
(product_id, product_desc, product_price, fk_inventory_id)
values
('prod003','Mini Bible',25,'item003');
insert into product
(product_id, product_desc, product_price, fk_inventory_id)
values
('prod004','Jar of Jam',7,'item004');
insert into product
(product_id, product_desc, product_price, fk_inventory_id)
values
('prod005','Collection of sermons',45,'item005');


insert into transaction
(trans_id, trans_type, trans_date, fk_visitor_id)
values
('2021001','Cash',to_date('01/15/2021', 'mm/dd/yyyy'), '2021111');
insert into transaction
(trans_id, trans_type, trans_date, fk_visitor_id)
values
('2021002','Cash',to_date('01/16/2021', 'mm/dd/yyyy'), '2021112');
insert into transaction
(trans_id, trans_type, trans_date, fk_visitor_id)
values
('2021003','Cash',to_date('01/17/2021', 'mm/dd/yyyy'), '2021113');
insert into transaction
(trans_id, trans_type, trans_date, fk_visitor_id)
values
('2021004','Cash',to_date('01/17/2021', 'mm/dd/yyyy'), '2021112');
insert into transaction
(trans_id, trans_type, trans_date, fk_visitor_id)
values
('2021005','Cash',to_date('01/18/2021', 'mm/dd/yyyy'), '2021114');


insert into trans_line_item
(trans_item_id, quantity, unit_price, fk_product_id, fk_trans_id)
values
('line111',2,45,'prod005', '2021001');
insert into trans_line_item
(trans_item_id, quantity, unit_price, fk_product_id, fk_trans_id)
values
('line112',3,12,'prod002', '2021001');
insert into trans_line_item
(trans_item_id, quantity, unit_price, fk_product_id, fk_trans_id)
values
('line113',4,45,'prod005', '2021002');
insert into trans_line_item
(trans_item_id, quantity, unit_price, fk_product_id, fk_trans_id)
values
('line114',4,12,'prod002', '2021002');
insert into trans_line_item
(trans_item_id, quantity, unit_price, fk_product_id, fk_trans_id)
values
('line115',1,45,'prod005', '2021003');
insert into trans_line_item
(trans_item_id, quantity, unit_price, fk_product_id, fk_trans_id)
values
('line116',2,7,'prod004', '2021003');
insert into trans_line_item
(trans_item_id, quantity, unit_price, fk_product_id, fk_trans_id)
values
('line117',4,45,'prod005', '2021004');
insert into trans_line_item
(trans_item_id, quantity, unit_price, fk_product_id, fk_trans_id)
values
('line118',2,7,'prod004', '2021004');
insert into trans_line_item
(trans_item_id, quantity, unit_price, fk_product_id, fk_trans_id)
values
('line119',7,5,'prod001', '2021005');
insert into trans_line_item
(trans_item_id, quantity, unit_price, fk_product_id, fk_trans_id)
values
('line120',1,25,'prod003', '2021005');


insert into room
(room_id, room_desc, room_rate, fk_house_id)
values
('1001','Standard, 2 dbl beds',115,'h1001');
insert into room
(room_id, room_desc, room_rate, fk_house_id)
values
('1002','Standard, 3 dbl beds',165,'h1008');
insert into room
(room_id, room_desc, room_rate, fk_house_id)
values
('1003','Standard, 4 dbl beds',215,'h1008');
insert into room
(room_id, room_desc, room_rate, fk_house_id)
values
('1004','Standard, 1 twin bed',55,'h1006');
insert into room
(room_id, room_desc, room_rate, fk_house_id)
values
('1005','Standard, 4 dbl beds',215,'h1010');


insert into reservation
(reservation_id, check_in_date, check_out_date, number_guests, fk_visitor_id)
values
('135875', to_date('02/01/2021', 'mm/dd/yyyy'), to_date('02/03/2021', 'mm/dd/yyyy'), 4, '2021112');
insert into reservation
(reservation_id, check_in_date, check_out_date, number_guests, fk_visitor_id)
values
('135876', to_date('02/01/2021', 'mm/dd/yyyy'), to_date('02/08/2021', 'mm/dd/yyyy'), 8, '2021115');
insert into reservation
(reservation_id, check_in_date, check_out_date, number_guests, fk_visitor_id)
values
('135877', to_date('02/04/2021', 'mm/dd/yyyy'), to_date('02/06/2021', 'mm/dd/yyyy'), 1, '2021113');
insert into reservation
(reservation_id, check_in_date, check_out_date, number_guests, fk_visitor_id)
values
('135878', to_date('02/01/2021', 'mm/dd/yyyy'), to_date('02/03/2021', 'mm/dd/yyyy'), 4, '2021111');
insert into reservation
(reservation_id, check_in_date, check_out_date, number_guests, fk_visitor_id)
values
('135879', to_date('03/15/2021', 'mm/dd/yyyy'), to_date('03/25/2021', 'mm/dd/yyyy'), 6, '2021115');


insert into res_line_item
(res_line_item_id, fk_room_id, fk_reservation_id)
values
('line3276', '1001', '135875');
insert into res_line_item
(res_line_item_id, fk_room_id, fk_reservation_id)
values
('line3277', '1003', '135876');
insert into res_line_item
(res_line_item_id, fk_room_id, fk_reservation_id)
values
('line3278', '1004', '135877');
insert into res_line_item
(res_line_item_id, fk_room_id, fk_reservation_id)
values
('line3279', '1005', '135878');
insert into res_line_item
(res_line_item_id, fk_room_id, fk_reservation_id)
values
('line3280', '1003', '135879');


insert into monk
(monk_id, first_name, last_name, vow_of_silence)
values
('monk001', 'John', 'Campbell', 'N');
insert into monk
(monk_id, first_name, last_name, vow_of_silence)
values
('monk002', 'Ruslan', 'Kalashnikov', 'Y');
insert into monk
(monk_id, first_name, last_name, vow_of_silence)
values
('monk003', 'Joseph', 'Sepe', 'N');
insert into monk
(monk_id, first_name, last_name, vow_of_silence)
values
('monk004', 'Pam', 'Farr', 'N');
insert into monk
(monk_id, first_name, last_name, vow_of_silence)
values
('monk005', 'Will', 'Smith', 'N');


insert into employee
(emp_id, first_name, last_name, phone_number, street_address, town, pay_rate)
values
('EMP55555', 'Lana', 'Del Rey', '015558864', 'One Abbey Lane', 'Buckfestleigh', 15);
insert into employee
(emp_id, first_name, last_name, phone_number, street_address, town, pay_rate)
values
('EMP55556', 'James', 'Franco', '015552343', 'Two Abbey Lane', 'Buckfestleigh', 14);
insert into employee
(emp_id, first_name, last_name, phone_number, street_address, town, pay_rate)
values
('EMP55557', 'Tom', 'Hanks', '015552363', 'Three Abbey Lane', 'Buckfestleigh', 17);
insert into employee
(emp_id, first_name, last_name, phone_number, street_address, town, pay_rate)
values
('EMP55558', 'Bruce', 'Willis', '015551237', 'Four Abbey Lane', 'Buckfestleigh', 15);
insert into employee
(emp_id, first_name, last_name, phone_number, street_address, town, pay_rate)
values
('EMP55559', 'Will', 'Ferrell', '015552983', 'Five Abbey Lane', 'Buckfestleigh', 16);


-----
insert into time_card
(time_card_id, start_date_time, end_date_time, fk_emp_id, fk_shop_id, fk_house_id, fk_monk_id)
values
('TC33333', to_date('02/22/2021 08:00', 'mm/dd/yyyy hh24:mi'), to_date('02/22/2021 16:00', 'mm/dd/yyyy hh24:mi'), 'EMP55555', '004', NULL, NULL);
insert into time_card
(time_card_id, start_date_time, end_date_time, fk_emp_id, fk_shop_id, fk_house_id, fk_monk_id)
values
('TC33334', to_date('02/22/2021 16:00', 'mm/dd/yyyy hh24:mi'), to_date('02/22/2021 23:00', 'mm/dd/yyyy hh24:mi'), 'EMP55556', '004', NULL, NULL);
-----
insert into time_card
(time_card_id, start_date_time, end_date_time, fk_emp_id, fk_shop_id, fk_house_id, fk_monk_id)
values
('TC33335', to_date('02/23/2021 08:00', 'mm/dd/yyyy hh24:mi'), to_date('02/23/2021 16:00', 'mm/dd/yyyy hh24:mi'), 'EMP55557', '004', NULL, NULL);
insert into time_card
(time_card_id, start_date_time, end_date_time, fk_emp_id, fk_shop_id, fk_house_id, fk_monk_id)
values
('TC33336', to_date('02/23/2021 16:00', 'mm/dd/yyyy hh24:mi'), to_date('02/23/2021 23:00', 'mm/dd/yyyy hh24:mi'), 'EMP55558', '004', NULL, NULL);
-----
insert into time_card
(time_card_id, start_date_time, end_date_time, fk_emp_id, fk_shop_id, fk_house_id, fk_monk_id)
values
('TC33337', to_date('02/24/2021 08:00', 'mm/dd/yyyy hh24:mi'), to_date('02/24/2021 16:00', 'mm/dd/yyyy hh24:mi'), 'EMP55559', '004', NULL, NULL);
insert into time_card
(time_card_id, start_date_time, end_date_time, fk_emp_id, fk_shop_id, fk_house_id, fk_monk_id)
values
('TC33338', to_date('02/24/2021 16:00', 'mm/dd/yyyy hh24:mi'), to_date('02/24/2021 23:00', 'mm/dd/yyyy hh24:mi'), 'EMP55555', '004', NULL, NULL);
-----
insert into time_card
(time_card_id, start_date_time, end_date_time, fk_emp_id, fk_shop_id, fk_house_id, fk_monk_id)
values
('TC33339', to_date('02/21/2021 08:00', 'mm/dd/yyyy hh24:mi'), to_date('02/21/2021 04:00', 'mm/dd/yyyy hh24:mi'), NULL, NULL, 'h1008', 'monk004');
insert into time_card
(time_card_id, start_date_time, end_date_time, fk_emp_id, fk_shop_id, fk_house_id, fk_monk_id)
values
('TC33340', to_date('02/21/2021 16:00', 'mm/dd/yyyy hh24:mi'), to_date('02/21/2021 23:00', 'mm/dd/yyyy hh24:mi'), NULL, NULL, 'h1012', 'monk003');
insert into time_card
(time_card_id, start_date_time, end_date_time, fk_emp_id, fk_shop_id, fk_house_id, fk_monk_id)
values
('TC33341', to_date('02/22/2021 08:00', 'mm/dd/yyyy hh24:mi'), to_date('02/22/2021 16:00', 'mm/dd/yyyy hh24:mi'), NULL, NULL, 'h1002', 'monk005');
insert into time_card
(time_card_id, start_date_time, end_date_time, fk_emp_id, fk_shop_id, fk_house_id, fk_monk_id)
values
('TC33342', to_date('02/22/2021 16:00', 'mm/dd/yyyy hh24:mi'), to_date('02/22/2021 23:00', 'mm/dd/yyyy hh24:mi'), NULL, NULL, 'h1008', 'monk004');
insert into time_card
(time_card_id, start_date_time, end_date_time, fk_emp_id, fk_shop_id, fk_house_id, fk_monk_id)
values
('TC33343', to_date('02/23/2021 08:00', 'mm/dd/yyyy hh24:mi'), to_date('02/23/2021 16:00', 'mm/dd/yyyy hh24:mi'), NULL, NULL, 'h1007', 'monk005');
insert into time_card
(time_card_id, start_date_time, end_date_time, fk_emp_id, fk_shop_id, fk_house_id, fk_monk_id)
values
('TC33344', to_date('02/23/2021 16:00', 'mm/dd/yyyy hh24:mi'), to_date('02/23/2021 23:00', 'mm/dd/yyyy hh24:mi'), NULL, NULL, 'h1010', 'monk003');



insert into paycheck
(paycheck_id, check_date, pay_period_start, pay_period_end, check_amount, fk_payroll_id, fk_emp_id)
values
('CK202101', to_date('02/02/2021', 'mm/dd/yyyy'), to_date('01/17/2021', 'mm/dd/yyyy'), to_date('01/31/2021', 'mm/dd/yyyy'), 1200, 'PAY0001', 'EMP55555');
insert into paycheck
(paycheck_id, check_date, pay_period_start, pay_period_end, check_amount, fk_payroll_id, fk_emp_id)
values
('CK202102', to_date('02/02/2021', 'mm/dd/yyyy'), to_date('01/17/2021', 'mm/dd/yyyy'), to_date('01/31/2021', 'mm/dd/yyyy'), 1200, 'PAY0002', 'EMP55559');
insert into paycheck
(paycheck_id, check_date, pay_period_start, pay_period_end, check_amount, fk_payroll_id, fk_emp_id)
values
('CK202103', to_date('02/02/2021', 'mm/dd/yyyy'), to_date('01/17/2021', 'mm/dd/yyyy'), to_date('01/31/2021', 'mm/dd/yyyy'), 1200, 'PAY0003', 'EMP55557');
insert into paycheck
(paycheck_id, check_date, pay_period_start, pay_period_end, check_amount, fk_payroll_id, fk_emp_id)
values
('CK202104', to_date('02/02/2021', 'mm/dd/yyyy'), to_date('01/17/2021', 'mm/dd/yyyy'), to_date('01/31/2021', 'mm/dd/yyyy'), 1200, 'PAY0004', 'EMP55556');
insert into paycheck
(paycheck_id, check_date, pay_period_start, pay_period_end, check_amount, fk_payroll_id, fk_emp_id)
values
('CK202105', to_date('02/02/2021', 'mm/dd/yyyy'), to_date('01/17/2021', 'mm/dd/yyyy'), to_date('01/31/2021', 'mm/dd/yyyy'), 1200, 'PAY0005', 'EMP55558');


commit;

