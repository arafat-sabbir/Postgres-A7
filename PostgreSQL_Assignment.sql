-- Active: 1730136343523@@127.0.0.1@5432@ph
create table student (
    id serial primary key,
    name varchar(50),
    age int
)

select * from student;

INSERT INTO student (name, age) VALUES ('John', 25),('arafat',20);

select * from student where name ='John';