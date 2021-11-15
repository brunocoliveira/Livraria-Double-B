-- Criação do banco --
create database library
default character set utf8mb4
default collate utf8mb4_general_ci;

use library;

-- Criação da tabela administradores --
create table administrators (
	id int not null auto_increment,
    cpf varchar(11) not null,
    nome varchar(40) not null,
    email varchar(40),
    senha varchar(6) not null,
    primary key (id)
) default charset = utf8mb4;

desc administrators;

-- Criação da tabela usuários --
create table users (
	id int not null auto_increment,
    cpf varchar(11) not null,
    nome varchar(40) not null,
    email varchar(40),
    senha varchar(6) not null,
    primary key (id)
) default charset = utf8mb4;

desc users;

-- Criação da tabela categorias --
create table categories (
	id int not null auto_increment,
	nome varchar(40) not null,
    primary key (id)
) default charset = utf8mb4;

desc categories;

-- Criação da tabela livros --
create table books (
	id int not null auto_increment,
    nome varchar(40) not null,
    primary key (id)
) default charset = utf8mb4;

desc books;

-- Inclusão da coluna categoria_id --
alter table books
add column categories_id int;

-- Alteração da colina categoria_id para chave estrangeira --
alter table books
add foreign key (categories_id)
references categories(id);

-- Criação da tabela emprestimos --
create table loans (
	id int not null auto_increment,
    valor decimal(5,2),
    periodo tinyint,
    primary key (id)
) default charset = utf8mb4;

desc loans;

-- Inclusão da coluna user_id --
alter table loans
add column user_id int;

-- Inclusão da coluna book_id --
alter table loans
add column book_id int;

-- Alteração da colina user_id para chave estrangeira --
alter table loans
add foreign key (user_id)
references users(id);

-- Alteração da colina book_id para chave estrangeira --
alter table loans
add foreign key (book_id)
references books(id);