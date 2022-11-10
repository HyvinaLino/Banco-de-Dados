/*TABELA USER*/
create table User(
id_User int auto_increment,
nome varchar(40) not null,
email varchar(50) not null,
password varchar(8) not null,
created date default now(),
uptated date,
primary key(id_User)
);

select * from User;
select nome, email, password from User;

/*INSERIR DADOS NA TABELA USER*/
insert into User
(nome, email, password)
values
('Maria', 'maria@gmail.com', '1234'),
('Daniel', 'daniel@gmail.com', '4321'),
('Ana', 'ana@gmail.com', '6789'),
('Kaio', 'kaio@gmail.com', '0015'),
('Matheus', 'matheus@gmail.com', '0974');

/*TABELA  ROLES*/
create table Roles(
id_Roles int auto_increment,
nome varchar(40),
primary key(id_Roles)
);

select * from Roles;

insert into Roles
(nome)
values
('Admin'),('Employee'),('Client');

/*TABELA USER_ROLES*/
create table UserRoles(
id_User int,
id_Roles int,
foreign key(id_User) references User(id_User),
foreign key(id_Roles) references Roles(id_Roles)
);

/*SELECIONAR E APRESENTAR O USUÁRIO E CADA NÍVEL DE ACESSO*/
select User.id_User, User.email, Roles.nome from UserRoles
join User on UserRoles.id_User = User.id_User join Roles on 
Roles.id_Roles = UserRoles.id_Roles where Roles.nome = 'Admin';

select User.id_User, User.email, Roles.nome from UserRoles
join User on UserRoles.id_User = User.id_User join Roles on 
Roles.id_Roles = UserRoles.id_Roles where Roles.nome = 'Employee';

select User.id_User, User.email, Roles.nome from UserRoles
join User on UserRoles.id_User = User.id_User join Roles on 
Roles.id_Roles = UserRoles.id_Roles where Roles.nome = 'Client';

/*DEFINIR QUAL NÍVEL DE ACESSO DE CADA USUÁRIO*/
insert into UserRoles
(id_User, id_Roles)
values
('1', '2'),
('2', '3'),
('3', '1'),
('4', '3'),
('5', '2');

/*TABELA POST*/
create table Post(
id_Post int auto_increment,
title varchar(40),
description text,
id_User int,
foreign key(id_User) references User(id_User),
primary key (id_Post)
);

alter table Post

add column updated date;

/*COMANDO PRA APAGAR UMA TABELA*/
/*drop table if exists Post;*/

select * from Post;
select id_User, title, description from Post;

/*SELECIONAR O POST DOS USUÁRIOS 3 E 5*/
select title, description from Post where id_User = 3;
select title, description from Post where id_User = 5;

/*DELETAR O POST DOS USUÁRIOS 2 E 4*/
delete from Post where id_Post = 4;
delete from Post where id_User = 2;

/*VALORES DOS POSTS DE CADA USUÁRIO*/
insert into Post
(id_User, title, description)
values
('1', 'Filme', 'literalmente o melhor filme que eu já assisti!!'),
('1', 'Cinema', 'recomendo super esse cinema'),

('2', 'Compras', 'estou super ancioso praminha compra chegar, não vejo a hr'),
('2', 'Livro', 'meu livro chegou!!,mal vejo a hora de começar a ler'),

('3', 'Musica', 'as músicas do Djonga são as melhores!!'),
('3', 'Bacu', 'sério, eu adoro os álbuns do Bacu '),

('4', 'Desenhos', 'amo assitir desenhos animados'),
('4', 'Séries', 'posso passar o dia todo assistindo séries kkkk'),

('5', 'One Piece', 'sério, One piece é um dos melhores animes que eu já vi!'),
('5', 'Filme', 'mal posso esperar pra assistir o filme do One Piece');

/*ATUALIZAR O POST*/
update Post 
set title = 'Fragmentado',
description = 'filme muito foda',
updated = '2022/11/15'
where id_Post = 1;
