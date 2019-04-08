create table customer (
    customer_id number primary key,
    fname varchar2(15 char),
    lname varchar2(25 char),
    email varchar2(50 char)
);

create table employee (
    employee_id number primary key,
    fname varchar2(15 char),
    lname varchar2(25 char),
    department varchar2(50 char)
);

insert into customer values (1, 'Maro', 'Grigoryan', 'maro1998.g@gmail.com');
insert into customer values (2, 'Poghos', 'Poghosyan', 'poghos868.gsd@gmail.com');
insert into customer values (3, 'Anush', 'Gevorgyan', 'anush.gevorgyan@gmail.com');
insert into employee values (1, 'Maro', 'Grigoryan', 'Department of Finances');
insert into employee values (2, 'Poghos', 'Poghosyan', 'Department of placeholder names');

select customer_id, fname, lname, email, to_char(null) department from customer
union
select employee_id, fname, lname, to_char(null) email, department from employee;