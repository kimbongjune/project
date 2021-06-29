create table user
(
    nickname varchar(14) primary key not null,
    pw varchar(100),
    mail varchar(20),
    name varchar(20),
    birth int,
    gender varchar(20),
    phonenumber varchar(15),
    type int,
    photo varchar(256) default 'alt.jpg',
    sessionid text,
    ip varchar(15),
    password varchar(50)
    loginblock integer default '0';
) default charset="utf8";


create table board
(
    no int not null auto_increment primary key,
    nickname varchar(20),
    title varchar(50),
    body text,
    replacebody text,
    hit int default 0,
    date datetime default now(),
    address varchar(200),
    number VARCHAR(15),
    good int default 0,
    hate int default 0,
    boardtype int,
    save int,
    street varchar(200),
    foreign key(nickname) references user(nickname)
) default charset="utf8";

create table comment
(
	 comno int not null auto_increment primary key,
	 no int,
	 nickname varchar(14),
	 combody text,
	 comdate datetime default now(),
	 foreign key(nickname) references user(nickname),
	 foreign key(no) references board(no)
) default charset="utf8";

create table attach
(
	attachno int not null auto_increment primary key,
	no int,
	attachname varchar(256) default 'alt.jpg',
	foreign key(no) references board(no)
) default charset="utf8";

create table chat
(
	chatno int not null auto_increment primary key,
	nickname varchar(14),
	chatbody varchar(150),
	chattime datetime default now(),
	chattype int,
	foreign key(nickname) references user(nickname)
) default charset="utf8";

create table agree
(
	no int,
	nickname varchar(14),
	liketype int,
	foreign key(no) references board(no),
	foreign key(nickname) references user(nickname)
) default charset="utf8";

create table festival
(
	datano int not null auto_increment,
	keyword varchar(250) not null,
	startday varchar(250),
	url varchar(250),
	primary key(datano, keyword)
) default charset="utf8";
