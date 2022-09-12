create database b;
\c b;
create table authors(id serial primary key, first_name text not null, last_name text not null, age int not null);
create table books(id serial primary key, title text not null, authors_id int, foreign key(authors_id) references authors(id), copies_sold int not null);
insert into authors (id, first_name, last_name, age) values (1, 'gh', 'ty', 10);
insert into authors values (2, 'ghh', 'thy', 100);
insert into authors values (3, 'John', 'Doe', 228);
insert into authors values (4, 'Jane', 'Doe', 18);
insert into authors values (5, 'Harry', 'Potter', 78);
insert into authors values (6, 'Elizabeth', 'II', 96);
insert into authors values (7, 'Grzegorz', 'Brzeczyszczykiewicz', 69);
insert into authors values (8, 'Chloe', 'Cherry', 25);
insert into authors values (9, 'Kurt', 'Cobain', 27);
insert into authors values (10, 'Jimi', 'Hendrix', 27);
insert into authors values (11, 'Janis', 'Joplin', 27);
insert into authors values (12, 'Jim', 'Morrison', 27);
insert into authors values (13, 'Brian', 'Jones', 27);
select * from authors where length(first_name) > 6;
select age, count (age) from authors group by age order by count desc;
insert into books values (1, 'The Catcher in the Rye', 5, 100);
insert into books values (2, 'The Great Gatsby', 6, 1000);
insert into books values (3, 'Wuthering Heights', 1, 144);
insert into books values (4, 'Pride and Prejudice', 1, 144144);
insert into books values (5, 'Frankenstein', 10, 1);
insert into books values (6, 'To Kill a Mockingbird', 9, 10);
insert into books values (7, 'Animal Farm', 9, 100);
insert into books values (8, '1984', 12, 1000000000);
select * from books order by copies_sold desc limit 3;
select * from authors join books on authors.id = books.authors_id order by authors.id;
drop table books;
drop table authors;
\c postgres;
drop database b;