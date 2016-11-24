create database test DEFAULT CHARACTER SET utf8 ;
!--CREATE SCHEMA `test` DEFAULT CHARACTER SET utf8 ;
create table test.user (
        id int(8) not null auto_increment,
        name varchar(25),
        age integer,
        isAdmin bit not null DEFAULT 0,
        createdDate TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
        primary key (id)
)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;

