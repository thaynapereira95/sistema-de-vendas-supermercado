show databases;

create database db_vendas_trabalho;
use db_vendas_trabalho;

create table tbl_clientes(
id int not null primary key auto_increment,
nome_cliente varchar(45) not null,
cpf varchar(45) not null
);

create table telefone(
id int not null primary key auto_increment,
numero varchar(15) not null,
id_clientes int not null,

constraint FK_clientes_telefone
foreign key (id_clientes)
references tbl_clientes(id)

);

create table email(
id int not null primary key auto_increment,
email varchar(255),
id_clientes int not null,

constraint FK_clientes_email
foreign key(id_clientes)
references tbl_clientes(id)


);

create table endereco (
id int not null primary key auto_increment,
rua varchar(45) not null,
cidade varchar(45) not null,
cep varchar(45) not null,
pais varchar(45),
id_clientes int not null,

constraint FK_clientes_endereco
foreign key(id_clientes)
references tbl_clientes(id)


);

create table tbl_produto(
id int not null primary key auto_increment,
nome_produto varchar(45) not null,
codigo_de_barras varchar(50) not null,
estoque int not null,
valor decimal(10, 2) not null,

unique index(id)

);

create table colaboradores(
id int not null primary key auto_increment,
nome varchar(45),
salario decimal(10, 2),
funcao varchar(100),
data_contratacao date

);


create table vendas(
id int not null primary key auto_increment,
data_venda date not null,
valor_total decimal(10,2),
id_cliente int,
id_colaborador int,

foreign key (id_cliente) references tbl_clientes(id),
foreign key (id_colaborador) references colaboradores(id)


);

create table itens_venda(
id int not null primary key auto_increment,
id_venda int,
id_produto int,
qtde int not null,
preco_unitario decimal(10,2) not null,

constraint fk_produto_itens_venda
foreign key (id_produto)
references tbl_produto(id)


);

insert into tbl_clientes (nome_cliente, cpf)
values ('Thayna Mendes', '123.456.789-00'),
('joao oliveira', '987.654.321-00');


insert into tbl_produto (nome_produto, codigo_de_barras, estoque, valor)
values ('Arroz', '9581029348', 100, 10.50),
('Feijão', '9581029353', 50, 7.30);

insert into colaboradores (nome, salario, funcao, data_contratacao)
values ('Pedro Souza', 2500.00, 'Caixa', '2023-01-10'),
('Ana Luiza', 3500.00, 'Gerente', '2021-01-20');

select*from tbl_clientes;

select*from tbl_produto;

select*from colaboradores;

insert into vendas (data_venda, valor_total, id_cliente, id_colaborador)
values('2023-02-15', 100.00, 1, 1);

insert into itens_venda(id_venda, id_produto, qtde, preco_unitario)
values(1, 1, 2, 10.50),
(1, 2, 1, 7.30);

select v.id, v.data_venda, v.valor_total, c.nome_cliente, col.nome as nome_colaborador
from vendas v
join tbl_clientes c on v.id_cliente = c.id
join colaboradores col on v.id_colaborador = col.id;


select iv.id_venda, p.nome_produto, iv.qtde, iv.preco_unitario
from itens_venda iv
join tbl_produto p on iv.id_produto = p.id
where iv.id_venda = 1;




show tables;
