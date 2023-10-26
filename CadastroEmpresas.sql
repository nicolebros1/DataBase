create database CadastroEmpresas;
use CadastroEmpresas;
create table dadospf (
nome varchar (50) not null,
idade numeric (2,0) not null,
cpf numeric (11,0) not null primary key, 
endereco varchar (60) not null,
tel numeric (11,0) not null,
idbairro varchar (20) not null, 
idcidade varchar (20) not null,
slestado char (2) not null
);
create table dadospj (
nomefantasia varchar (100), 
razaosocial varchar (100) not null,
cnpj numeric (14,0) not null primary key, 
endereco varchar (60), 
num numeric (11,0) not null, 
cpf numeric (11,0) not null,
idbairro varchar (20) not null, 
idcidade varchar (20) not null, 
slestado char (2) not null,
foreign key (cpf)
references dadospf(cpf)
);
create table estado (
nmestado varchar (20) not null,
slestado varchar (2) not null primary key
);

create table cidade (
idcidade integer not null primary key,
nmcidade varchar (20) not null,
slestado char (2) not null,
foreign key (slestado)
references estado(slestado)
);

create table bairro (
idbairro integer not null primary key, 
nmbairro varchar (50) not null,
idcidade varchar (20) not null, 
slestado char (2) not null, 
foreign key (idcidade)
references cidade(idcidade),
foreign key (slestado)
references estado(slestado)
);
#insert into estado
#values( 
	#   ('AL', 'Alagoas'),
	#   ('AP', 'Amapa'),
    #   ('AM', 'Amazonas'),
    #   ('BA', 'Bahia'),
    #   ('CE', 'Ceara'),
    #   ('DF', 'Distrito Federal'),
    #   ('ES', 'Espirito Santo'),
    #   ('GO', 'Goias'),
    #   ('MA', 'MAranhao'),
    #   ('MT', 'Mato Grosso'),
    #   ('MS', 'Mato Grosso do Sul'),
    #   ('MG', 'Minas Gerais'),
    #   ('PA', 'Para'),
    #   ('PB', 'Paraiba'), 
   #    ('PR', 'Parana'),
  #     ('PE', 'Pernanbuco'), 
 #      ('PI', 'Piaui'),
       #('RJ', 'Rio de Janeiro'),
       #('RN', 'Rio Grande do Norte'),
      # ('RS', 'Rio Grande do Sul'), 
     #  ('RO', 'Rondonia'), 
    #   ('RR', 'Roraima'), 
   #    ('SC', 'Santa Catarina'),
  #     ('SP', 'Sao Paulo'),
 #      ('SE', 'Sergipe'),
#       ('TO', 'Tocantins');
#truncate table estado;

drop table estado; 

create table estado (
nmestado varchar (20) not null,
slestado varchar (10) not null primary key
);


insert into estado
values ( 'Alagoas', 'AL');

insert into estado 
values('Amapa', 'AP'),
('Amazonas', 'AM'),
('Bahia', 'BA'),
('Ceara', 'CE'),
('Distrito Federal', 'DF'),
('Espirito Santo', 'ES'),
('Goias', 'GO'),
('MAranhao', 'MA'),
('Mato Grosso', 'MT'),
('Mato Grosso do Sul', 'MS'),
('Minas Gerais', 'MG'),
('Para', 'PA'),
('Paraiba', 'PB'), 
('Parana', 'PR'),
('Pernanbuco', 'PE'), 
('Piaui', 'PI'),
('Rio de Janeiro', 'RJ'),
('Rio Grande do Norte', 'RN'),
('Rio Grande do Sul', 'RS'), 
('Rondonia', 'RO'), 
('Roraima', 'RR'), 
('Santa Catarina', 'SC'),
('Sao Paulo', 'SP'),
('Sergipe', 'SE'),
('Tocantins', 'TO');

select *
from estado;

