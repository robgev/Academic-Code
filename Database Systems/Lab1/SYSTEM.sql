create user robgev identified by "Rohaanva!23"
default Tablespace users
quota unlimited on users
temporary tablespace temp;

grant create session to robgev;
grant all privileges to robgev;