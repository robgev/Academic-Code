drop table employee cascade constraints;

create table employee (
    emp_id number primary key,
    fname varchar2(25 char),
    lname varchar2(25 char),
    manager_id number references employee(emp_id)
);

insert into employee values (
    1, 'John', 'Doe', null
);

insert into employee values (
    2, 'Jesus', 'Christ', 1
);

insert into employee values (
    3, 'Julius', 'Caesar', 1
);

select e1.fname || ' works for ' || e2.fname "Employees and their managers"
from employee e1 join employee e2
on e1.manager_id = e2.emp_id
order by e1.fname;