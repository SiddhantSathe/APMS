CREATE TABLE ADMIN
(id int not null auto_increment,
custom_id varchar(20) not null ,
admin_email_id  varchar(50)   NOT NULL,
fname varchar(30)    NOT NULL,
a_password varchar(50) NOT NULL,
PRIMARY KEY(id)
);

DELIMITER $$

CREATE FUNCTION custom_id(initials VARCHAR(20)) 
RETURNS VARCHAR(30) 
deterministic
BEGIN
    DECLARE custom_id VARCHAR(30);
    SELECT MAX(id) + 1 INTO custom_id FROM admin;
    IF custom_id IS NULL THEN
        SET custom_id = '1';
    END IF;
    SET custom_id = CONCAT(LEFT(initials,10),  '00000', custom_id);
    RETURN custom_id;
END $$

DELIMITER ;

INSERT INTO ADMIN(custom_id,admin_email_id,fname,a_password)
values(custom_id('INFTADM'),'ansh@ves.ac.in','ansh sarfare','ansh@123'),
(custom_id('INFTADM'),'rnk@ves.ac.in','ronak katariya','ronakkatariya@123'),
(custom_id('INFTADM'),'omkara@ves.ac.in','omkar gholap','og@123456');
-- (custom_id('INFTADM'),'akruti dabas','akruti@ves.ac.in','akruti@1234'),
-- (custom_id('INFTADM'),'anushka shahane','anushka@ves.ac.in','anushka@123');

select * from ADMIN;

CREATE TABLE MENTOR(
id  int not null auto_increment,
custom_user_id   varchar(20) not null ,
mentor_email_id		VARCHAR(50)		NOT NULL,
Name				VARCHAR(30)		NOT NULL,
m_password      varchar(50) NOT NULL,
admin_id     int    ,
PRIMARY KEY(id),
foreign key (admin_id) references ADMIN(id)
);
DELIMITER $$

CREATE FUNCTION custom_user_id(initials VARCHAR(20)) 
RETURNS VARCHAR(30) 
deterministic
BEGIN
    DECLARE custom_user_id VARCHAR(30);
    SELECT MAX(id) + 1 INTO custom_user_id FROM admin;
    IF custom_user_id IS NULL THEN
        SET custom_user_id = '1';
    END IF;
    SET custom_user_id = CONCAT(LEFT(initials,10),  '00000', custom_user_id);
    RETURN custom_user_id;
END $$

DELIMITER ;
select * from mentor;

 INSERT INTO mentor (custom_user_id, mentor_email_id,  Name,m_password)
VALUES (custom_user_id('INFTMTR'), 'charusheela.nehete.mtr@ves.ac.in','Charusheela Nehete','charusheela@123'),
(custom_user_id('INFTMTR'), 'pranav.titambe.mtr@example.com','Pranav Titambe','pranav@123');

       --  (custom_user_id('INFTMTR'), 'siddhant', 'sathe', 'siddhant.sathe@example.com'),
      --   (custom_user_id('INFTMTR'), 'pranav', 'pol', 'pranav.pol@example.com'),
      --   (custom_user_id('INFTMTR'), 'Charusheela', 'Nehete', 'charusheela.nehete@example.com'),
      --   (custom_user_id('INFTMTR'), 'arnav', 'sawant', 'arnav.sawant@example.com');

CREATE TABLE STUDENT
(
id               int           not null AUTO_INCREMENT,
custom_std_id   varchar(20)   not null,
student_email_id varchar(30)   NOT NULL,
sname           varchar(30)    NOT NULL,
s_password      varchar(30)    NOT NULL,
BRANCH           VARCHAR(4)    NOT NULL,
roll_no             INT        NOT NULL,
class           VARCHAR(4)     NOT NULL,
s_role          varchar(10)    not null,
admin_id        int    ,
PRIMARY KEY(id),
foreign key(admin_id) references ADMIN(id)
);


DELIMITER $$

CREATE FUNCTION custom_std_id(initials VARCHAR(20)) 
RETURNS VARCHAR(30) 
deterministic
BEGIN
    DECLARE custom_std_id VARCHAR(30);
    SELECT MAX(id) + 1 INTO custom_std_id FROM student;
    IF custom_std_id IS NULL THEN
        SET custom_std_id = '1';
    END IF;
    SET custom_std_id = CONCAT(LEFT(initials,10),  '00000', custom_std_id);
    RETURN custom_std_id;
END $$

DELIMITER ;
INSERT INTO student(custom_std_id,student_email_id,sname,s_password,BRANCH,class,roll_no,s_role)
values(
custom_std_id('INFTSTD'),'siddhant.sathe@ves.ac.in','Siddhant Sathe','Siddhant1234','INFT','D10A',47,'leader');


select * from student;


create TABLE GROUP_INFO
(
group_id int not null auto_increment,
group_topic varchar(200) not null,
member1 varchar(100) not null,
member2 varchar(100) not null,
member3 varchar(100) not null,
member4 varchar(100),
student_id int ,
admin_id  int ,
mentor_id		int ,
primary key (group_id),
foreign key (student_id) references STUDENT(id),
foreign key (admin_id) references ADMIN(id),
foreign key (mentor_id) references MENTOR(id)
);


 insert into group_info (group_topic,member1,member2,member3,member4,student_id,admin_id,mentor_id)
values
('academic project management systems','pranav pol', 'siddhant sathe', 'arnav sawant', 'pranav titambe',1,1,1);
-- ('hospital management systems', 'renisa, anushka , mhavish, shravani','2022.pranav.titambe@ves.ac.in','charusheela.nehete@ves.ac.in','pranav.titambe@ves.ac.in');

select * from group_info;

create table logbook
(
log_entry_no int not NULL AUTO_INCREMENT,
log_date DATE not null,
log_work_done VARCHAR(500) not null,
group_id int,
PRIMARY KEY (log_entry_no),
foreign key(group_id) references group_info(group_id)
);



INSERT INTO logbook (log_date, log_work_done,group_id)
VALUES ('2023-10-05', 'Completed project XYZ',4);
insert into submissions(documents,links) values('asfdasdf/asdf/sdfasdf','wwww.apms1.com');
insert into submissions (documents,links)values('asfdasdfasd/asdwwf/sdfasdf213','www.apms1.com123213');


select * from logbook;


SELECT * FROM STUDENT order by class ASC,roll_no ASC;



-- CREATE TABLE LOGIN(
-- PASSWORD		VARCHAR(30)			NOT NULL,
-- admin_email_id  varchar(50)         NOT NULL,
-- login_id		VARCHAR(11)	        NOT NULL,
-- PRIMARY KEY(PASSWORD),
-- FOREIGN KEY(admin_email_id)	REFERENCES ADMIN(admin_email_iD)
-- );



-- CREATE TABLE SUB_WORKDONE
-- (
-- sub_no int NOT NULL,
-- entry_no INT NOT NULL,
-- FOREIGN KEY(sub_no) REFERENCES SUBMISSION(sub_no),
-- FOREIGN KEY(entry_no) REFERENCES SUBMISSION(entry_no)
-- );

CREATE TABLE submissions
(
sub_no int NOT null  AUTO_INCREMENT,
documents varchar(300) default 'empty' ,
links varchar(300) default 'empty' ,
group_id int,
PRIMARY KEY (sub_no),
foreign key(group_id) references group_info(group_id)
);



INSERT into submissions(documents,group_id) values ('ppt',4);
truncate table submissions;
select * from submissions;

-- create table FEEDBACK
-- (
-- grade       char                    not null,
-- reviews     varchar(200)            not null,       
-- primary key (reviews)
-- );

-- create table VIEWS
-- (
-- reviews     varchar(200)            not null,
-- group_id   varchar(30)    NOT NULL,
-- foreign key (reviews) references FEEDBACK(reviews),
-- foreign key (group_id) references STUDENT(group_id)
-- );

-- create table PROVIDES
-- (
-- reviews     varchar(200)            not null,
-- mentor_email_id		VARCHAR(50)		NOT NULL,
-- foreign key(reviews) references FEEDBACK(reviews),
-- foreign key(mentor_email_id) references MENTOR(mentor_email_id)
-- );

-- create table VIEWS1
-- (
-- mentor_email_id		VARCHAR(50)		NOT NULL,
-- admin_email_id      varchar(50)     not null,
-- sub_no              int             not null,
-- foreign key (mentor_email_id) references MENTOR(mentor_email_id),
-- foreign key (admin_email_id) references ADMIN(admin_email_id),
-- foreign key (sub_no) references SUBMISSION(sub_no)
-- );



