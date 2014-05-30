use mydemo;

#用户，角色与菜单权限、功能权限
drop table if exit user,role,menu,operate;

create table user(
	id int primary key auto_increment,
	name varchar(64),
	account varchar(64),
	password varchar(64)
);

create table role(
	id int primary key auto_increment,
	name varchar(64)
);

create table user_role(
	uid int ,
	rid int
);

create table role_menu(
	rid int,
	mid int
);

create table menu(
	id int primary key auto_increment,
	pid int,
	name varchar(64)
);

#功能权限
create table function(
	id int primary key auto_increment,
	mid int,
	code varchar(32),#功能代号，用来组成Url
	name varchar(64)
);

create table operate(
	id int primary key auto_increment,
	name varchar(64),
	code varchar(32)#操作代号，用来和功能代号组成Url
);

create table fun_oper(
 	fid int,
	oid int,
	url varchar(128)
);