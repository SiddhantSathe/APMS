
CREATE TABLE ADMIN
(admin_email_id  varchar(50)   NOT NULL,
fname varchar(30)    NOT NULL,
a_password varchar(50) NOT NULL,
PRIMARY KEY(admin_email_id)
);


select * from ADMIN;

CREATE TABLE USERS
(
login_id		INT	 	NOT NULL  auto_increment,
fullname		VARCHAR(30)		NOT NULL,
PRIMARY KEY (login_id)
);

CREATE TABLE STUDENT
(
student_email_id varchar(30)   NOT NULL,
sname           varchar(30)    NOT NULL,
s_password      varchar(30)    NOT NULL,
BRANCH           VARCHAR(4)    NOT NULL,
roll_no             INT        NOT NULL,
class           VARCHAR(4)     NOT NULL,
login_id		INT	   ,
PRIMARY KEY(student_email_id),
FOREIGN KEY(login_id) REFERENCES USERS(login_id)
);

ALTER TABLE STUDENT ADD s_password varchar(50) NOT NULL;

select * from STUDENT;
select * from STUDENT ORDER BY roll_no asc,class asc; 

INSERT INTO STUDENT
VALUES
('2022.siddhant.sathe@ves.ac.in','4','ACADEMIC PROJECT MANAGEMENT SYSTEM','INFTSTD0001','INFT',47,'D10A'),
('2022.pranav.titambe@ves.ac.in','4','ACADEMIC PROJECT MANAGEMENT SYSTEM','INFTSTD0004','INFT',58,'D10A'),
('2022.pranav.pol@ves.ac.in','4','ACADEMIC PROJECT MANAGEMENT SYSTEM','INFTSTD0002','INFT',37,'D10A'),
('2022.arnav.sawant@ves.ac.in','4','ACADEMIC PROJECT MANAGEMENT SYSTEM','INFTSTD0003','INFT',49,'D10A');

create TABLE GROUP_INFO
(
group_id int not null auto_increment,
group_topic varchar(45) not null,
student_email_id varchar(30),
admin_email_id  varchar(50),
mentor_email_id		VARCHAR(50),
primary key (group_id),
foreign key (student_email_id) references STUDENT(student_email_id),
foreign key (admin_email_id) references ADMIN(admin_email_id),
foreign key (mentor_email_id) references MENTOR(mentor_email_id)
);




CREATE TABLE MENTOR(
mentor_email_id		VARCHAR(50)		NOT NULL,
Name				VARCHAR(30)		NOT NULL,
m_password varchar(50) NOT NULL,
admin_email_id      varchar(50) NULL,
PRIMARY KEY(mentor_email_iD),
foreign key (admin_email_id) references ADMIN(admin_email_id)
);


INSERT INTO USERS
VALUES 
(1,'CHARUSHEELA NEHETE');
-- ('INFTSTD0001','SIDDHANT SATHE'),
-- ('INFTSTD0003','ARNAV SAWANT'),
-- ('INFTSTD0004','PRANAV TITAMBE'),
-- ('INFTSTD0005','OMKAR GHOLAP'),
-- ('INFTSTD0008','MANYA ITAL'),
-- ('INFTSTD0009','VAISHNAL MALI'),
-- ('INFTSTD0010','PRAJJWAL PANDEY'),
-- ('INFTSTD0011','ANUSHKA SHAHANE'),
-- ('INFTSTD0007','VEDANG WAJGE'),
-- ('INFTSTD0006','RONAK KATARIYA');

INSERT INTO USERS
VALUES('INFTSTD0101','TEENA WAISHY');




SELECT * FROM STUDENT order by class ASC,roll_no ASC;
select * FROM USERS;
INSERT INTO USERS (login_id,fullname) VALUES ('INFTSTD0002','PRANAV POL');


CREATE TABLE LOGIN(
PASSWORD		VARCHAR(30)			NOT NULL,
admin_email_id  varchar(50)   NOT NULL,
login_id		VARCHAR(11)	NOT NULL,
PRIMARY KEY(PASSWORD),
FOREIGN KEY(admin_email_id)	REFERENCES ADMIN(admin_email_iD)
);

ALTER TABLE LOGIN ADD role varchar(10) NOT NULL;
select * from LOGIN;

CREATE TABLE SUB_WORKDONE
(
sub_no int NOT NULL,
entry_no INT NOT NULL,
FOREIGN KEY(sub_no) REFERENCES SUBMISSION(sub_no),
FOREIGN KEY(entry_no) REFERENCES SUBMISSION(entry_no)
);

CREATE TABLE SUBMISSION
(
project_link        VARCHAR(100)    NOT NULL,
entry_date          date     NOT NULL,
work_done           varchar(3)      not null,
entry_no            int             not null,
presentation        char            not null,
sub_no              int             not null,
admin_email_id      varchar(50)     not null,
primary key(sub_no),
foreign key(admin_email_id) references ADMIN(admin_email_id)
);

create table FEEDBACK
(
grade       char                    not null,
reviews     varchar(200)            not null,       
primary key (reviews)
);

create table VIEWS
(
reviews     varchar(200)            not null,
group_id   varchar(30)    NOT NULL,
foreign key (reviews) references FEEDBACK(reviews),
foreign key (group_id) references STUDENT(group_id)
);

create table PROVIDES
(
reviews     varchar(200)            not null,
mentor_email_id		VARCHAR(50)		NOT NULL,
foreign key(reviews) references FEEDBACK(reviews),
foreign key(mentor_email_id) references MENTOR(mentor_email_id)
);

create table VIEWS1
(
mentor_email_id		VARCHAR(50)		NOT NULL,
admin_email_id      varchar(50)     not null,
sub_no              int             not null,
foreign key (mentor_email_id) references MENTOR(mentor_email_id),
foreign key (admin_email_id) references ADMIN(admin_email_id),
foreign key (sub_no) references SUBMISSION(sub_no)
);







