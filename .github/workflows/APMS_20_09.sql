CREATE DATABASE APMS
CREATE TABLE ADMIN
(admin_email_id  varchar(50)   NOT NULL,
fname varchar(30)    NOT NULL,
PRIMARY KEY(admin_email_id)
);
select * from ADMIN;


CREATE TABLE STUDENT
(student_email_id   varchar(30)   NOT NULL,
group_id   varchar(30)    NOT NULL,
project_topic   varchar(50)   NOT NULL,
PRIMARY KEY(group_id)
);
select * from STUDENT;



CREATE TABLE USERS
(
login_id		VARCHAR(11)		NOT NULL,
fullname		VARCHAR(30)		NOT NULL,
PRIMARY KEY (login_id)
)
CREATE TABLE MENTOR(
mentor_email_id		VARCHAR(50)		NOT NULL,
Name				VARCHAR(30)		NOT NULL,
PRIMARY KEY(mentor_email_iD)
);
INSERT INTO USERS
VALUES ('INFTSTD0001','SIDDHANT SATHE'),
('INFTMTR0001','CHARUSHEELA NEHETE');
TRUNCATE TABLE USERS;
select * from USERS
INSERT INTO USERS
VALUES 
('INFTMTR0001','CHARUSHEELA NEHETE'),
('INFTSTD0001','SIDDHANT SATHE'),
('INFTSTD0003','ARNAV SAWANT'),
('INFTSTD0004','PRANAV TITAMBE'),
('INFTMTR0001','CHARUSHEELA NEHETE'),
('INFTSTD0005','OMKAR GHOLAP'),
('INFTSTD0008','MANYA ITAL'),
('INFTSTD0009','VAISHNAL MALI'),
('INFTSTD0010','PRAJJWAL PANDEY'),
('INFTSTD0011','ANUSHKA SHAHANE'),
('INFTSTD0007','VEDANG WAJGE'),
('INFTSTD0006','RONAK KATARIYA');


UPDATE users SET fullname = 'NITISH BHOSALE' WHERE login_id = 'INFTSTD0003';


INSERT INTO USERS (login_id,fullname) VALUES ('INFTSTD0016','ARNAV SAWANT');


CREATE TABLE LOGIN(
PASSWORD		VARCHAR(30)			NOT NULL,
adminemail_id  varchar(50)   NOT NULL,
login_id		VARCHAR(11)	NOT NULL,
PRIMARY KEY(PASSWORD),
FOREIGN KEY(adminemail_id)	REFERENCES ADMIN(admin_email_iD)
);

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







