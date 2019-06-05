#create database swipeio;
use swipeio;
#drop table Employee;
#drop table  Main_swipe;
#drop table if exists Cards;
#drop table if exists Temp_card_log;
#drop table if exists Gate;
#drop table if exists Leave_description;
#drop table if exists Leave_log;
#drop table incharge_log;
#create table Employee(emp_id int primary key NOT NULL auto_increment,emp_number varchar(10) unique not null,emp_name varchar(25),email varchar(50),card_id int,is_admin bit,is_contract bit,pass_word varchar(20) unique key,created_on datetime,updated_on datetime,is_delete bit default 0,foreign key (card_id) references cards(card_id));
#create table Main_swipe(log_id int primary key not null auto_increment ,date_log date,time_log time,inorout bit,emp_id int,gate_id int,card_id int,foreign key (emp_id) references Employee(emp_id),foreign key (gate_id) references Gate(gate_id),foreign key (card_id) references Cards(card_id));
#create table Gate(gate_id int primary key not null auto_increment,gate_name varchar(10),updated_on datetime,created_on datetime);
#create table Temp_card_log(entry_id int primary key auto_increment not null,name_of_contracter varchar(25),date_of_log date,emp_id int,card_id int,foreign key (emp_id) references Employee(emp_id),foreign key (card_id) references cards(card_id));
#create table Cards(card_id int primary key not null auto_increment,card_number varchar(8),updated_on datetime,created_on datetime);
#create table Leave_description(leave_id int primary key not null auto_increment,leave_name varchar(10),updated_on datetime,created_on datetime);
#create table Leave_log(leave_log_id int primary key not null auto_increment,from_date date,to_date date,emp_id int,leave_id int,foreign key (emp_id) references Employee(emp_id),foreign key (leave_id) references Leave_description(leave_id));
#create table Incharge_log(incharge_log_id int primary key not null auto_increment,emp_id int,incharge_id int,foreign key (emp_id) references Employee(emp_id),foreign key (incharge_id) references Incharge(incharge_id)) ;
#create table Incharge(incharge_id  int primary key not null auto_increment,incharge_name varchar(25));
#select sysdate() from dual;
DROP PROCEDURE insert_employee;
delimiter //
create procedure insert_employee(in emp_number1 varchar(10),in emp_name1 varchar(25),in email1 varchar(50),in pass_word1  varchar(20),in card_id1 int,in is_admin1 bit,in is_contract1 bit,in created_on1 datetime)
begin
insert into Employee (emp_number,emp_name,email,pass_word,card_id,is_contract,is_admin,created_on) values(emp_number1,emp_name1,email1,pass_word1,card_id1,is_contract1,is_admin1,created_on1); 
select * from Employee;
end//
delimiter ;
SET FOREIGN_KEY_CHECKS = 0;
SET FOREIGN_KEY_CHECKS = 1;
call insert_employee('8942','mani','mani@gmail.com','bjjbdd69',1,1,0,now());


drop procedure insert_cards;
delimiter //
create procedure insert_cards(in card_number1 varchar(8),in created_on1 datetime)
begin
insert into Cards (card_number,created_on) values (card_number1,created_on1);
select * from Cards;
end//
delimiter ;
call insert_cards('c123',now());

#drop procedure insert_leave_log;
delimiter //
create procedure insert_leave_log(in from_date1 date,in to_date1 date,in emp_id1 int,in leave_id1 int)
begin
insert into Leave_log (from_date,to_date,emp_id,leave_id) values (from_date1,to_date,emp_id1,leave_id);
select * from Leave_log;
end //
delimiter ;
SET FOREIGN_KEY_CHECKS = 0;
SET FOREIGN_KEY_CHECKS = 1;
call insert_leave_log('2019-06-23','2019-06-08',1,1);

#drop procedure insert_gate;
delimiter //
create procedure insert_gate(in gate_name1 varchar(10),in created_on1 datetime)
begin
insert into Gate (gate_name,created_on) values (gate_name1,created_on1);
select * from Gate;
end//
delimiter ;
call insert_gate('server',now());


delimiter //
SET FOREIGN_KEY_CHECKS = 0;
create procedure insert_temp_card_log(in name_of_contracter varchar(25),in log_date date,in empl_id int(11),cardss_id int(11))
begin
insert into Temp_card_log (name_of_contracter,date_of_log,emp_id,card_id) values (name_of_contracter,log_date,empl_id,cardss_id);
select * from Temp_card_log;
end //
delimiter ;
call insert_temp_card_log('suganya',now(),12,1);


delimiter //
create procedure insert_leave_description(in leave_name varchar(25),in created datetime)
begin
insert into Leave_description (leave_name,created_on) values (leave_name,created);
select * from Leave_description;
end //
delimiter ;
call insert_leave_description('casual',now());

drop procedure insert_incharge_log;
delimiter //
create procedure insert_incharge_log(in emp_id int,in incharge_id int)
begin
insert into Incharge_log (emp_id,incharge_id) values (emp_id1,incharge_id1);
select * from Incharge_log;
end//
delimiter ;
call insert_incharge_log(1,9);

#drop procedure insert_incharge;
delimiter //
create procedure insert_incharge(in incharge_name1 varchar(25))
begin
insert into Incharge (incharge_name) values (incharge_name1);
select * from Incharge;
end//
delimiter ;
call insert_incharge('suganya');


delimiter //

delimiter //
create procedure update_card(in card_id1 int,in card_number1 varchar(8))
begin
UPDATE Cards SET card_number=card_number1,updated_on=now() where card_id=card_id1;
select * from Cards;
end//
delimiter ;
call update_card(1,'123456');

delimiter //
create procedure update_gate(in gate_id1 int,in gate_name1 varchar(10))
begin
update Gate set gate_name=gate_name1,updated_on=now() where gate_id=gate_id1;
select * from Gate;
end//
delimiter ;
call update_gate(1,'enter');

delimiter //
create procedure update_leave_description(in leave_id1 int,in leave_name1 varchar(10))
begin
update Leave_description set leave_name=leave_name1,updated_on=now() where leave_id=leave_id1;
select * from Leave_description;
end//
delimiter ;
call update_leave_description(1,'privilege');
truncate Employee;
select * from Employee;
delimiter //

create procedure update_employee(in emp_number1 varchar(10),in emp_name1 varchar(25), in email1 varchar(25), in is_admin1 bit, in is_contract1 bit,in pass_word1 varchar(20))
begin
update Employee set emp_name=emp_name1,email=email1, is_admin=is_admin1,is_contract=is_contract1,updated_on=now(),pass_word=pass_word1 where emp_number=emp_number1;
select * from Employee;
end //
delimiter ;
drop procedure update_employee;
call update_employee('1234','Sathish','sathish@cg.com',1,1,'dert');

drop procedure update_incharge;
delimiter //
create procedure update_incharge(in incharge_id1 int,in incharge_name1 varchar(25))
begin
update Incharge set incharge_name=incharge_name1  where incharge_id=incharge_id1;
select * from Incharge;
end//
delimiter ;
call update_incharge(1,'jagu');

delimiter //
create procedure delete_employee(in emp_id2 int)
begin
update Employee set is_delete=1 where emp_id=emp_id2;
select * from Employee;
end//
delimiter ;
call delete_employee(3);

drop procedure insert_swipe;
delimiter //
SET FOREIGN_KEY_CHECKS = 0;
create procedure insert_swipe(in date_log1 date,in time_log1 time,in inorout1 bit(1),in emp_id3 int(11),in gate_id2 int(10),in card_id4 int(11))
begin
insert into Main_swipe (date_log,time_log,inorout,emp_id,gate_id,card_id) values (date_log1,time_log1,inorout1,emp_id3,gate_id2,card_id4);
select * from Main_swipe;
end//
delimiter ;
call insert_swipe(now(),now(),1,10,1,2);

delimiter //
create procedure total_employees(out total int)
begin
declare total int;
select count(emp_id) from Employee;
select total=count;
end //
delimiter ;
call total_employees(@total);


drop procedure getEmployeeLoginDetails;
delimiter //
create procedure getEmployeeLoginDetails(in email1 varchar(50),in pass_word1 varchar(10),out result int)
begin
if((select count(emp_id) from Employee where email=email1 and pass_word=pass_word1) = 1) then 
select emp_id from Employee where email=email1 and pass_word=pass_word1;
set result=emp_id;
elseif((select count(emp_id) from Employee where email=email1 and pass_word!=pass_word1)=1) then
set result=-1;
else
set result=0;
end if;
select result;
end//
delimiter ;
call getEmployeeLoginDetails('kayal1234@gmail.com','12355',@result);

select * from Employee;

#select version();
#select * from Employee;

/*if(result = 1)then 
select * from Employee where email=email1 and pass_word=pass_word1;
end if;*/





