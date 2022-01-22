CREATE DATABASE ImovelAds;


USE ImovelAds;



CREATE TABLE faixaImovel(
idFaixa INTEGER NOT NULL PRIMARY KEY,
nmFaixa VARCHAR(50) NOT NULL,
vlMinimo DECIMAL(8,2) NOT NULL,
vlMaximo DECIMAL(9,2) NOT NULL
);


CREATE TABLE estado(
sgEstado CHAR(2) NOT NULL PRIMARY KEY,
nmEstado VARCHAR(25) NOT NULL
);


CREATE TABLE cidade(
idCidade VARCHAR (50)NOT NULL PRIMARY KEY,
nmCidade VARCHAR(50) NOT NULL,
sgEstado CHAR(2) NOT NULL,
FOREIGN KEY(sgEstado)
REFERENCES estado(sgEstado)
);


CREATE TABLE bairro(
idBairro varchar (15) NOT NULL PRIMARY KEY,
nmBairro VARCHAR(50) NOT NULL,
idCidade VARCHAR (50) NOT NULL,
sgEstado CHAR(2) NOT NULL,
FOREIGN KEY(idCidade)
REFERENCES cidade(idCidade),
FOREIGN KEY(sgEstado)
REFERENCES estado(sgEstado)
);


CREATE TABLE comprador(
idComprador INTEGER NOT NULL PRIMARY KEY,
nmComprador VARCHAR(50) NOT NULL, 
nmEnderecoComprador VARCHAR(100) NOT NULL,
nrCPFComprador NUMERIC(11,0) NOT NULL,
idCidade INTEGER NOT NULL,
idBairro INTEGER NOT NULL,
sgEstado CHAR(2) NOT NULL,
telComprador NUMERIC(11,0) NOT NULL,
FOREIGN KEY(idCidade)
REFERENCES cidade(idCidade), 
FOREIGN KEY(idBairro)
REFERENCES bairro(idBairro),
FOREIGN KEY(sgEstado)
REFERENCES estado(sgEstado)
);


CREATE TABLE vendedor(
idVendedor INTEGER NOT NULL PRIMARY KEY,
nmVendedor VARCHAR(50) NOT NULL,
nmEnderecoVendedor VARCHAR(100) NOT NULL,
nrCPFVendedor NUMERIC(11,0) NOT NULL,
idCidade INTEGER NOT NULL,
idBairro INTEGER NOT NULL,
sgEstado CHAR(2) NOT NULL,
telComprador NUMERIC(11,0) NOT NULL,
dtNasc DATE NOT NULL,
FOREIGN KEY(idCidade)
REFERENCES cidade(idCidade),
FOREIGN KEY(idBairro)
REFERENCES bairro(idBairro),
FOREIGN KEY(sgEstado)
REFERENCES estado(sgEstado)
);


CREATE TABLE imovel(
idImovel INTEGER NOT NULL PRIMARY KEY,
idVendedor INTEGER NOT NULL,
idBairro INTEGER NOT NULL,
idCidade INTEGER NOT NULL,
sgEstado CHAR(2) NOT NULL,
nmEnderecoImovel VARCHAR(100) NOT NULL,
nrAreaUtil DECIMAL(7,2) NOT NULL,
nrAreaTotal DECIMAL(7,2) NOT NULL,
vlPreco DECIMAL(11,2) NOT NULL,
idOferta INTEGER NOT NULL,
stVendido CHAR(1) NOT NULL,
dtLancto DATE NOT NULL,
FOREIGN KEY(idVendedor)
REFERENCES vendedor(idVendedor),
FOREIGN KEY(idBairro)
REFERENCES bairro(idBairro),
FOREIGN KEY(idCidade)
REFERENCES cidade(idCidade),
FOREIGN KEY(sgEstado)
REFERENCES estado(sgEstado)
);


CREATE TABLE oferta(
idOferta INTEGER NOT NULL PRIMARY KEY,
idImovel INTEGER NOT NULL,
idComprador INTEGER NOT NULL,
vlOferta DECIMAL(11,2) NOT NULL,
dtOferta DATE NOT NULL,
FOREIGN KEY(idImovel)
REFERENCES imovel(idImovel),
FOREIGN KEY(idComprador)
REFERENCES comprador(idComprador)
);

ALTER TABLE imovel
ADD FOREIGN KEY(idOferta)
REFERENCES oferta(idOferta);

insert into estado 
values ('AC', 'Acre'),
	   ('AL', 'Alagoas'),
	   ('AP', 'Amapa'),
       ('AM', 'Amazonas'),
       ('BA', 'Bahia'),
       ('CE', 'Ceara'),
       ('DF', 'Distrito Federal'),
       ('ES', 'Espirito Santo'),
       ('GO', 'Goias'),
       ('MA', 'MAranhao'),
       ('MT', 'Mato Grosso'),
       ('MS', 'Mato Grosso do Sul'),
       ('MG', 'Minas Gerais'),
       ('PA', 'Para'),
       ('PB', 'Paraiba'), 
       ('PR', 'Parana'),
       ('PE', 'Pernanbuco'), 
       ('PI', 'Piaui'),
       ('RJ', 'Rio de Janeiro'),
       ('RN', 'Rio Grande do Norte'),
       ('RS', 'Rio Grande do Sul'), 
       ('RO', 'Rondonia'), 
       ('RR', 'Roraima'), 
       ('SC', 'Santa Catarina'),
       ('SP', 'Sao Paulo'),
       ('SE', 'Sergipe'),
       ('TO', 'Tocantins');
	
    select *
    from estado; 
    
    insert into cidade
    values ('rioBranco1', 'Rio Branco', 'AC'),
		   ('acrelandia', 'Acrelandia', 'AC'), 
           ('assisBrasil', 'Assis Brasil', 'AC'),
           ('maceio', 'Maceio', 'AL'),
           ('arapicara', 'Arapicara', 'AL'),
           ('rioLargo', 'Rio Largo', 'AL'),
           ('macapa', 'Macapa', 'AP'),
           ('cutias', 'Cutias', 'AP'),
           ('itaubal', 'Itaubal', 'AP'),
           ('manaus', 'Manaus', 'AM'),
           ('tefe', 'Tefe', 'AM'),
           ('itacoatiara', 'Itacoatiara', 'AM'),
           ('salvador', 'Salvador', 'BA'),
           ('ilheus', 'Ilheus', 'BA'), 
           ('juazeiro', 'Juazeiro', 'BA'),
           ('fortaleza','Fortaleza', 'CE'),
           ('sobral', 'Sobral', 'CE'),
           ('juazeiroDoNorte', 'Juazeiro do Norte', 'CE'),
           ('vitoria', 'Vitoria', 'ES'),
           ('serra', 'serra', 'ES'),
           ('vilaVelha', 'Vila Velha', 'ES'),
           ('goiania', 'Goiania', 'GO'),
           ('rioVerde', 'Rio Verde', 'GO'),
           ('trindade', 'Trindade', 'GO'), 
           ('saoLuis', 'Sao Luis', 'MA'),
           ('imperatriz', 'Imperatriz', 'MA'),
           ('saoJoseDeRimabar', 'Sao Jose de Rimabar','MA'),
           ('cuiaba', 'Cuiaba', 'MT'),
           ('aguaBoa', 'Agua Boa', 'MT'),
           ('acorizal', 'Acorizal', 'MT'),
           ('campoGrande', 'Campo grande', 'MS'),
           ('dourados', 'Dourados', 'MS'),
           ('tresLagoas', 'Tres Lagoas', 'MS'),
           ('beloHorizonte', 'Belo Horizonte', 'MG'),
           ('pampulha', 'Pampulha', 'MG'),
           ('anchieta', 'Anchieta', 'MG'),
           ('belem','Belem', 'PA'),
           ('nazare','Nazare', 'PA'),
           ('umarizal','Umarizal', 'PA'),
           ('joaoPessoa','Joao Pessoa', 'PB'),
           ('caboBranco','Cabo Branco','PB'),
           ('casteloBranco', 'Castelo Branco', 'PB'),
           ('curitiba', 'Curitiba', 'PR'),
           ('bomRetiro', 'Bom Retiro', 'PR'),
           ('cabral1', 'Cabral', 'PR'),
           ('recife','Recife', 'PE'),
           ('areias', 'Areias', 'PE'),
           ('aguaFria','Agua Fria', 'PE'),
           ('teresina','Teresina', 'PI'),
           ('cabral','Cabral', 'PI'),
           ('porenquanto', 'Porenquanto', 'PI'),
           ('rioDeJaneiro', 'Rio de Janeiro', 'RJ'),
           ('leblon', 'Leblon', 'RJ'),
           ('ipanema', 'Ipanema','RJ'),
           ('natal','Natal','RN'),
           ('alecrim', 'Alecrim', 'RN'),
           ('candelaria', 'Candelaria', 'RN'),
           ('portoAlegre','Porto Alegre', 'RS'),
           ('caixiasDoSul', 'Caixias do sul', 'RS'),
           ('canoas', 'Canoas', 'RS'),
           ('belaVista', 'Bela Vista', 'RO'),
           ('portoVelho','Porto Velho', 'RO'),
           ('areal','Areal', 'RO'),
           ('boaVista', 'Boa vista','RR'),
           ('jardimEquatorial', 'Jardim Equatorial', 'RR'),
           ('buritis','Buritis','RR'),
           ('florianopolis', 'Florianopolis', 'SC'),
           ('jurere', 'Jurere', 'SC'), 
           ('sacoGrande', 'Saco Grande', 'SC'),
           ('saoPaulo', 'Sao Paulo', 'SP'),
           ('indaiatuba', 'Indaiatuba', 'SP'),
           ('campinas', 'Campinas', 'SP'),
           ('aracaju', 'Aracaju', 'SE'),
           ('iatabaiana','Itabaiana', 'SE'),
           ('lagarto', 'lagarto', 'SE'),
           ('palmas','Palmas','TO'),
           ('almas','Almas','TO'),
           ('abreulandia', 'abreulandia','TO'),
           ('brasilia','brasilia','DF'),
           ('samambaia', 'samambaia', 'DF'); 
           
		select *
           from cidade; 
           
           
           insert into bairro 
           values ('DI0','Distrito Industrial','acrelandia','AC'),
('VR1','Vila redencao','acrelandia','AC'),
('G01','Geninunes','Assis Brasil','AC'),
('ce1','centro','Assis Brasil','AC'),
('BR0','Brasil novo','Rio Largo','AC'),
('fo0','Forence','Rio Largo','AC'),
('bb0', 'Bebedouro', 'Maceio','AL'),
('CJ0', 'Cha da jaqueira','Maceio','AL'),
('DI' , 'Distritito industrial' ,'Arapiraca','AL'),
('EE0', 'E. eldorado' ,'Arapiraca' ,'AL'),
('BR02', 'Brasil Novo', 'Rio Largo', 'AL'),
('FO', 'Forence', 'Rio largo' ,'AL'),
('AC1' , 'Acai', 'Macapa' ,'AP'),
('ar0' , 'Araxa','Macapa ','AP'),
('ce2', 'centro',' Cutias', 'AP'),
('SE1','sedeCutias','cutias','AP'),
('CA4', 'Cabralzinho' , 'Macapa' ,'AP'),
('BR05', 'Brasil novo' , 'Macapa', 'AP'),

('CD', 'Cidade de deus', 'Manaus','AM'),
('NV', 'nova cidade' , 'Manaus','AM'),
('AE', 'aeroporto', 'Coari', 'AM'),
('Ce0', 'Centro', 'Coari', 'AM'),
('AE2', 'aeroporto1', 'Tabatinga', 'AM'),
('IB','Ibirapuera', 'Tabatinga' ,'AM'),

('PI0', 'Pituba', 'Salvador', 'BA'),
('CA01', 'Caminho das Arvores','Salvador','BA'),
('ES0','Esperanca','Ilheus','BA'),
('IG', 'Iguape', 'Ilheus', 'BA'),
('CR0', 'coreia', 'juazeiro', 'BA'),
('AG0', 'Agemiro','juazeiro', 'BA'),

('JD', 'Jardim', 'Fortaleza', 'CE'),
('IR', 'Iracema', 'Fortaleza', 'CE'),
('AL2' ,'Alto' ,'Sobral' ,'CE'),
('BE', 'Betania', 'Sobral' ,'CE'),
('SC5', 'Socorro' ,'Juazeiro do norte' ,'CE'),
('SA', 'Salgadinho' ,'Juazeiro do norte','CE'),

('AE3', 'Aeroporto', 'Vitoria' ,'ES'),
('BV0', 'Boa vista', 'Vitoria', 'ES'),
('AL5' ,'Alterosas' ,'Serra', 'ES'),
('NS' ,'Nossa senhora', 'Serra' ,'ES'),
('AL1', 'Alecrim', 'Vila velha' ,'ES'),
('AR5' ,'Argolas', 'Vila velha' ,'ES'),
 
('SO','Setor oeste' ,'Goiania', 'GO'),
('SR2' ,'Setor serrinha', ')Goiana', 'GO'),
('JN' ,'Jardim never' ,'Rio Verde' ,'GO'),
('VO' ,'Vila olinda' ,'Rio Verde', 'GO'),
('BL' ,'Bela' 'vista', 'Trindade', 'GO'),
('MS' ,'Maisa' ,'Trindade' ,'GO'),


('TU', 'Turu' ,'Sao luis', 'MA'),
('CE' ,'Centro ','Sao luis', 'MA'),
('AG1' ,'Agua boa' ,'Imperatriz', 'MA'),
('AN1', 'Asa norte' ,'Imperatriz', 'MA'),
('AR1', 'Araci' ,'Sao jose de Ribamar', 'MA'),
('JA', 'Janaia' ,'Sao jose de Ribamar' ,'MA'),


('Co', 'Coxipo da pote', 'Cuiaba' ,'MG'),
('CP' ,'Chacara dos pinheiros' ,'Cuiaba' ,'MG'),
('CE4', 'Centro','Agua boa', 'MG'),
('RO', 'Rodoviario', 'Agua boa', 'MG'),
('AL0' ,'Aldeia', 'Acorizal' ,'MG'),

('JC', 'Jardim colorado' ,'Campo grande', 'MS'),
('AM', 'America','Campo grande' ,'MS'),
('VI', 'Vila industrial' ,'Dourados', 'MS'),
('IT', 'Italia', 'Dourados', 'MS'),
('AB', 'Alto da boa vista', 'Tres lagoas' ,'MS'),
('CE05' ,'Centro', 'Tres lagoas' ,'MS'),

('PA0' ,'Pampulha' ,'Belo Horizonte' ,'MG'),
('AN' ,'Anchieta' ,'Belo Horizonte' ,'MG'),
('AG' ,'Agua Branca' ,'Contagem' ,'MG'),
('BV2' ,'Bela vista', 'Contagem', 'MG'),
('NS1', 'Nossa senhora do carmo', 'Betim' ,'MG'),
('BR2', 'Brasileia' ,'Betim' ,'MG'),

('NA' , 'Nazare' , 'Belem' , 'PA'),
('UM' ,'Umarizal', 'Belem', 'PA'),
('AP2', 'Aparecida ' ,'Santarem' , 'PA'),
('AM2', 'Amparo', 'Sanrarem' ,'PA'),
('JU', 'Jardim uniao', 'Maraba', 'PA'),
('MV' ,'Mirante do Vale', 'maraba', 'PA'),


('CB0', 'Cabo Branco', 'Joao pessoa', 'PB'),
('CB2', 'Castelo branco', 'Joao pessoa','PB'),
('JB', 'Jose benon' ,' Agua Branca ', 'PB'),
('CE5', 'Centro',' Agua branca', 'PB'),
('ZB', 'Zumbi', 'Alagoa grande', 'PB'),
('VR', 'Vera cruz', 'Alagoa grande', 'PB'),

('BR', 'Bom retiro', 'Curitiba' ,'PR' ),
('CB', 'Cabral', 'Curitiba' ,'PR'),
('VN' ,'Vila nova', 'Abatia', 'PR'),
('CR', 'Curvao' , 'Abatia' ,'PR'),
('VL2', 'Vila Bela' , 'Adrianopolis', 'PR'),
('VM', 'Vila mota', 'Adrianopolis', 'PR'),

('AR01', 'Areias', 'Recife', 'PE'),
('AF', 'Agua fria', 'Refire', 'PE'),
('PI', 'Pitanga', 'Abreu e lima', 'PE'),
('IN1', 'Inhama', 'Abreu e lima', 'PE'),
('BR3', 'Brotas', 'Afogados da ingazeira', 'PE'),
('BO',' Birges', 'Afogados da ingazeira', 'PE'),

('CA1', 'Cabral', 'Teresina','PI'),
('PO' ,'Porem quanto', 'Teresina', 'PI'),
('DN' ,'Dner', 'Picos' ,'PI'),
('PE', 'Pedrinhas', 'Picos', 'PI'),
('BV5 ',' Boa Vista',' Barras' ,'PI'),
('PA', 'Palestina', 'Barras', 'PI'),
('LB' ,'Lebon', 'Rio de janeiro' ,'RJ'),
('IP', 'Ipanema', 'Rio de janeiro' ,'RJ'),
('BR5', 'Barreto', 'Niteroi' ,'RJ'),
('IC' ,'Icarai', 'Niteroi', 'RJ'),
('GR' ,'Gramacho', 'Duque de caxias' ,'RJ'),
('PL', 'Parque Lafaiete', 'Duque de caixias', 'RJ'),

('AL' ,'Alecrim', 'Natal', 'RN'),
('CA0', 'Candelaria', 'Natal' ,'RN' ),
('CA6' ,'Candelaria', 'Mossoro' ,'RN'),
('IN6', 'Independencia', 'Mososorro', 'RN'),
('CA' ,'Cajupiranga' ,'Parnamirim', 'RN') ,
('CN', 'Cidade Nova', 'Parnamirim', 'RN'),

('BV' ,'Bela vista', 'Porto velho' ,'RO'),
('AR' ,'Areal' ,'Porto velho', 'RO'),
('VL', 'Vila rica', 'Alto paraiso', 'RO'),
('IN','Industrial', 'Alto Paraiso', 'RO'),
('AL', 'Alto alegre' ,'Alvorada d oeste' ,'RO'),
('ZR' ,'Zona rural', 'alvorada d oeste' ,'RO'),


('Ju' ,'Jurere' ,'Florianopolis', 'SC'),
('SG' ,'Saco Grande'  ,'Florianoplis', 'SC'),
('PR' ,'Progresso' ,'Blumenau' ,'SC'),
('PM' ,'Passo Manso' ,'Blumenau', 'SC'),
('PT' ,'Pitangueira', 'Agrolandia' ,'SC'),
('BT', 'Barra' ,'Agrolandia' ,'SC'),


('CO', 'Consolacao', 'Sao paulo' ,'SP'),
('SE', 'SE', 'Sao Paulo' ,'SP'),
('Bo' ,'Bosque' ,'Campinas' ,'SP'),
('BO2' ,'Botafogo' ,'Campinas' ,'SP'),


('GT', 'Getulio Vargas', 'Acaraju', 'SE'),
('CE', 'Centro', 'Acaraju', 'SE'),
('CE2', 'Centro', 'Itabaiana', 'SE'),
('TO', 'Torre', 'Itabaiana', 'SE'),
('RU', 'Rurral', 'Largato', 'SE' ),
('HO', 'Horta',' Largato', 'SE'),


('TA', 'Taquaralto', 'Palmas', 'TO'),
('MO' ,'Morada do Sol' ,'Palmas' ,'TO'),
('CE6', 'Centro', 'almas' ,'TO'),
('DI' ,'Distrito Industrial' ,'Almas', 'TO'),
('CE7', 'Centro' ,'Abreulandia' ,'TO'),
('DI2', 'Distrito Industrial', 'Abreulandia' ,'TO'),

('AS' ,'Asa sul' ,'Brasilia' ,'DF'),
('AC' ,'Agua Clara' ,'Brasilia' ,'DF'),
('CE8' ,'Centro' ,'samabaia' ,'DF'),
('DI' ,'Distrito Industrial', 'Samabaia' ,'DF'),
('CE9', 'Centro' ,'Plano Piloto' ,'DF'),
('PN' ,'Parque Nacional' ,'Plano Piloto' ,'DF');

select *
from bairro;

insert into comprador 
values ('c1', 'Noah Sebastião Enrico Ramos', 'Rua Bela Vista, 703', '532.785.670-48','Araguaina','São João', 'TO', '(63) 98406-1975'),
	   ('c2', 'Geraldo Benjamin Lucas da Cruz','Estrada Arrieiro, 842', '219.270.145-49','Teresópolis','Colônia Alpina','RJ','(21) 98768-2311'),
       ('c3','Cecília Nair Mirella da Mata','Rua Carlos Drumond de Andrade, 901','985.568.989-55','Macapá','Congós','AP','(96) 98960-5211'),
       ('c4','Augusto Elias Dias','Via de Acesso, 250','382.998.109-06','Boa Vista','Jardim Floresta','RR','(95) 98426-7640'),
       ('c5','Yasmin Ana Assunção','Rua Egito 987','735.902.543-51','Várzea Grande','Ikaray','(65) 99601-5188'),
       ('c6','Antônia Tereza Vieira','Rua Santa Isabel 358','596.602.791-91','Santarém','Área Verde','PA','(93) 99666-5167'),
       ('c7', 'Cauã Igor Guilherme da Rocha','Rua Palmeira dos Índios 267','932.583.165-11','Feira de Santana','Lagoa Salgada','BA','(75) 99747-5062'),
       ('c8','Liz Emilly Rosângela da Cunha','Rua 20, 154','839.599.215-78','São Luís','Cidade Operária','MA','(98) 99977-6269'),
       ('c9','Alessandra Nicole Manuela Dias','Rua Francisca Alves Dantas 782','171.857.016-35','Iguatu','Centro','CE','(88) 98558-7358'),
       ('c10','Francisca Yasmin Assis','Rua Régia Severino 753','296.883.142-93','Fortaleza','Lagoa Redonda','CE','(85) 98621-1590'),
       ('c11','Esther Evelyn Gomes','Rua Corumbá 911','036.252.259-64','Cuiabá','Baú','MT','(65) 98529-1605'),
       ('c12','Alexandre Edson Yago Porto','Quadra M-N 920','994.295.891-64','MaceiO','Bom Parto','AL','(82) 98746-8356'),
       ('c13','Lucas Pedro Henrique Marcos Cardoso','602.071.327-04','Maracanau','Jereissati II','CE','(85) 98675-1269'),
       ('c14','Heloise Sueli Costa','Rua E 740','175.837.107-23','Barra Mansa','Jardim Guanabara','RJ','(24) 98743-2517'),
       ('c15','Sabrina Valentina Silveira','Rua Coronel Terêncio Dourado 536','462.995.413-93','Irecê','Morada do Sol','BA','(74) 98270-6009');
       
       select *
       from bairro;
       
       insert into vendedor
       values ('v1','Heloisa Antônia Analu da Silva','Rua Bodocó 641','047.917.614-05','Rio Branco','Cidade Nova','AC','(68) 98677-1511'),
('v2','Davi Diogo Rocha','Ramal da Fortaleza 126','781.552.073-15','Macapá','Cabralzinho','AP','(96) 98706-5512'),
('v3','Carla Sophie Alana Santos','Rua Wilson Evangelista da Rocha 815','336.082.113-06','Catalão','GO','(64) 99146-8584'),
('v4','Thomas Sérgio Marcos Vinicius da Rocha','Rua Enrico Caruso 554','869.555.397-36','Porto Velho','Aponiã','RO','(69) 98170-0526'),
('v5','Gabrielly Stella Natália Drumond','Rua Projetada III 307','870.886.146-34','Cachoeiro de Itapemirim','Nossa Senhora Aparecida','ES','(28) 99485-1949'),
('v6''Eduardo Bernardo Raimundo Carvalho','Estrada do Pau Ferro 361','077.829.879-54','Aracaju','Cidade Nova','SE','(79) 98900-1851'),
('v7','Victor Ricardo Costa','Rua Francisco Luiz Zanetta 937','651.760.283-60','Tubarão','Passagem','SC','(48) 99515-0006'),
('v8','Sophie Olivia Louise Duarte','Rua Maria Amélia 993','311.812.984-07','Diadema','Piraporinha','SP','(11) 99761-7663'),
('v9','Murilo Sérgio da Mota','Rua Salmão 105','542.159.823-32','Campo Largo','Jardim Três Rios','PR','(41) 98234-4671'),
('v10','Mário Rodrigo Aragão','Rodovia SC-480, 846','779.024.706-94','Chapecó','Centro (Marechal Bormann)','SC','(49) 99221-6490'),
('v11','Enrico Marcos Gustavo Porto','Alameda 8, 225','826.132.532-66','Corumbá','Conjunto Guatos','MS','(67) 98921-2604'),
('v12','Ruan Benjamin da Costa''Rua Maria Ribeiro 834','089.392.007-05','Rio Branco','Cadeia Velha','AC','(68) 99600-0365'),
('v13','Clarice Francisca Cavalcanti','Rua Silvano Franco de Oliveira 788','236.336.702-20','João Pessoa','Mangabeira','PB','(83) 98150-6810' ),
('v14','Isadora Raimunda Baptista','Avenida Jarú 215','149.646.566-08','Ariquemes','Setor 06','RO','(69) 98515-7062'),
('v15''Manoel Elias Moraes','Rua Domingos Belentani 266','780.937.990-95','Campo Grande','Dom Antônio Barbosa','MS','(67) 99650-4577');

INSERT INTO FAIXAIMOVEL 
VALUES('1','BAIXO','0','105000'),
('2','MEDIO','105001','180000'),
('3','ALTO','108001','999999');

select *
from vendedor; 

insert into imovel
values ('imv1','v1','Distrito Industrial','acrelandia','AC','rua um', '01', '100', '200.000', 'oft1', 'disponivel', '10/10/2022'),
('imv2''v1','Vila redencao','acrelandia','AC','rua dois','101', '02', '100.00', 'oft2', 'disponivel', '20/08/2022'),
('imv2','v1','Geninunes','Assis Brasil','AC','rua tres','03', '102','200.00','oft3','disponivel', '10/11/2022'),
('imv3','v1','centro','Assis Brasil','AC','rua um''04', '102', '200.000', 'oft4', 'disponivel', '10/11/2022'),
('imv4','v1','Brasil novo','Rio Largo','AC', 'rua dois', '05', '103','300.000', 'oft5', 'disponivel', '11/01/2022'),
('imv5''v1','Forence','Rio Largo','AC', 'rua tres','06', '104', '350.000', 'oft6', 'disponivel', '12/01/2022'),
('imv6''v1','cha da jaqueira','maceio','AC', 'rua tres','06', '104', '350.000', 'oft6', 'disponivel', '12/01/2022'),
('imv7''v2','distrito industrial','arapiraca','AL', 'rua tres','06', '104', '350.000', 'oft6', 'disponivel', '12/01/2022'),
('imv8''v2','e.eldorado','arapiraca','AL', 'rua tres','06', '104', '350.000', 'oft6', 'disponivel', '12/01/2022'),
('imv9''v2','Brasil novo','Rio Largo','AL', 'rua tres','06', '104', '350.000', 'oft6', 'disponivel', '12/01/2022'),
('imv10''v2','acai','macapa','AP', 'rua tres','06', '104', '350.000', 'oft6', 'disponivel', '12/01/2022'),
('imv11''v2','araxa', 'macapa','AP', 'rua tres','06', '104', '350.000', 'oft6', 'disponivel', '12/01/2022'),
('imv12''v3','centro', 'cutias','AP', 'rua tres','06', '104', '350.000', 'oft6', 'disponivel', '12/01/2022'),
('imv13''v3','sede cutias', 'cutias','AP' 'rua tres','06', '104', '350.000', 'oft6', 'disponivel', '12/01/2022'),
('imv14''v3','cabralzinho', 'macapa','AP', 'rua tres','06', '104', '350.000', 'oft6', 'disponivel', '12/01/2022'),
('imv15''v3','Brasil novo', 'macapa','AP', 'rua tres','06', '104', '350.000', 'oft6', 'disponivel', '12/01/2022'),
('imv16''v4','cidade de deus', 'manaus','Am', 'rua tres','06', '104', '350.000', 'oft6', 'disponivel', '12/01/2022'),
('imv17''v4','nova cidade', 'manaus','Am', 'rua tres','06', '104', '350.000', 'oft6', 'disponivel', '12/01/2022'),
('imv18''v4','aeroporto', 'coari','Am', 'rua tres','06', '104', '350.000', 'oft6', 'disponivel', '12/01/2022'),
('imv19''v4','centro', 'coari','Am', 'rua tres','06', '104', '350.000', 'oft6', 'disponivel', '12/01/2022'),
('imv20''v4','aeroporto1', 'tabatinga','Am', 'rua quatro','06', '104', '350.000', 'oft6', 'disponivel', '12/01/2022'),
('imv21''v4','ibirapuera', 'tabatinga','Am', 'rua quatro','06', '104', '350.000', 'oft6', 'disponivel', '12/01/2022'),
('imv22''v5','pituba', 'salvador','BA', 'rua vinte','06', '104', '330.000', 'oft6', 'disponivel', '12/11/2022'),
('imv23''v5','caminho das arvores', 'salvador','BA', 'rua vinte','06', '104', '330.000', 'oft6', 'disponivel', '12/11/2022'),
('imv24''v5','esperanca', 'ilheus','BA', 'rua vinte','06', '104', '330.000', 'oft6', 'disponivel', '12/11/2022'),
('imv25''v5','iguape', 'ilheus','BA', 'rua vinte','06', '104', '330.000', 'oft6', 'disponivel', '12/11/2022'),
('imv26''v5','coreia', 'juazeiro','BA', 'rua vinte','06', '104', '330.000', 'oft6', 'disponivel', '12/11/2022'),
('imv27''v5','agemiro', 'salvador','BA', 'rua vinte','06', '104', '330.000', 'oft6', 'disponivel', '12/11/2022'),
('imv28''v1','jardim', 'fortaleza','CE', 'rua quinze','06', '104', '500.000', 'oft6', 'disponivel', '22/08/2022'),
('imv28''v1','iracema', 'fortaleza','CE', 'rua quinze','06', '104', '500.000', 'oft6', 'disponivel', '22/08/2022'),
('imv29''v1','alto', 'sobral','CE', 'rua quinze','06', '104', '500.000', 'oft6', 'disponivel', '22/08/2022'),
('imv30''v1','betania', 'sobral','CE', 'rua quinze','06', '104', '500.000', 'oft6', 'disponivel', '22/08/2022'),
('imv31''v1','socorro', 'juazeiro do norte','CE', 'rua quinze','06', '104', '500.000', 'oft6', 'disponivel', '22/08/2022'),
('imv32''v1','salgadinho', 'juazeiro do norte','CE' ,'rua quinze','06', '104', '500.000', 'oft6', 'disponivel', '22/08/2022'),
('imv33''v1','aeroporto', 'vitoria','ES', 'rua dezoito','06', '104', '670.000', 'oft6', 'disponivel', '30/03/2022'),
('imv34''v1','boa vista', 'vitoria','ES', 'rua dezoito','06', '104', '670.000', 'oft6', 'disponivel', '30/03/2022'),
('imv35''v1','alterosas', 'serra','ES', 'rua dezoito','06', '104', '670.000', 'oft6', 'disponivel', '30/03/2022'),
('imv36''v1','nossa senhora', 'vitoria','ES' ,'rua dezoito','06', '104', '670.000', 'oft6', 'disponivel', '30/03/2022'),
('imv37''v1','alecrim', 'vila velha','ES', 'rua dezoito','06', '104', '670.000', 'oft6', 'disponivel', '30/03/2022'),
('imv38','v1','argolas', 'vila velha','ES', 'rua dezoito','06', '104', '670.000', 'oft6', 'disponivel', '30/03/2022'),
 ('imv39','v2','setor oeste', 'goiana','GO', 'rua dez','06', '104', '230.000', 'oft6', 'disponivel', '05/05/2022'),
 ('imv40','v2','setor serrinha', 'goiana','GO', 'rua dez','06', '104', '230.000', 'oft6', 'disponivel', '05/05/2022'),
 ('imv41','v2','jardim never', 'rio verde','GO', 'rua dez','06', '104', '230.000', 'oft6', 'disponivel', '05/05/2022'),
 ('imv42','v2','vila olinda', 'rio verde','GO', 'rua dez','06', '104', '230.000', 'oft6', 'disponivel', '05/05/2022'),
 ('imv43','v2','bela', 'vista trindade','GO', 'rua dez','06', '104', '230.000', 'oft6', 'disponivel', '05/05/2022'),
('imv44','v2','maisa', 'trinda','GO', 'rua dez','06', '104', '230.000', 'oft6', 'disponivel', '05/05/2022'),
('imv45','v2','turu', 'sao luis','MA', 'rua um','06', '104', '300.000', 'oft6', 'disponivel', '10/06/2022'),
('imv46','v2','centro', 'sao luis','MA', 'rua um','06', '104', '300.000', 'oft6', 'disponivel', '10/06/2022'),
('imv47','v2','agua boa', 'imperatriz','MA', 'rua um','06', '104', '300.000', 'oft6', 'disponivel', '10/06/2022'),
('imv48','v2','asa norte', 'imperatriz','MA', 'rua um','06', '104', '300.000', 'oft6', 'disponivel', '10/06/2022'),
('imv49','v2','araci', 'sao jose de ribamar','MA', 'rua um','06', '104', '300.000', 'oft6', 'disponivel', '10/06/2022'),
('imv50','v2','janaia', 'sao jose de ribamar','MA', 'rua um','06', '104', '300.000', 'oft6', 'disponivel', '10/06/2022'),
('imv51','v2','coxipo da pote', 'cuiaba','MG', 'rua vigessimo','06', '104', '300.000', 'oft6', 'disponivel', '10/06/2022'),
('imv52','v2','chacara dos pinheiros', 'cuiaba','MG', 'rua vigessimo','06', '104', '300.000', 'oft6', 'disponivel', '10/06/2022'),
('imv53','v2','rodoviario', 'agua boa','MG', 'rua vigessimo','06', '104', '300.000', 'oft6', 'disponivel', '10/06/2022'),
('imv54','v2','aldeia', 'acorizal','MG', 'rua vigessimo','06', '104', '300.000', 'oft6', 'disponivel', '10/06/2022'),
('imv55','v2','america', 'campo grande','MG', 'rua vigessimo','06', '104', '300.000', 'oft6', 'disponivel', '10/06/2022'),
('imv56','v2','vila industrial', 'dourados','MG', 'rua vigessimo','06', '104', '300.000', 'oft6', 'disponivel', '10/06/2022'),
('imv57','v2','italia', 'dourados','MG', 'rua vigessimo','06', '104', '300.000', 'oft6', 'disponivel', '10/06/2022'),
('imv58','v2','alto da boa vista', 'tres lagoas','MG', 'rua vigessimo','06', '104', '300.000', 'oft6', 'disponivel', '10/06/2022'),
('imv59','v2','centro', 'tres lagoas','MG', 'rua vigessimo','06', '104', '300.000', 'oft6', 'disponivel', '10/06/2022'),
('imv60','v2','pampulha', 'belo horizonte','MG', 'rua vigessimo','06', '104', '520.000', 'oft6', 'disponivel', '10/06/2022'),
('imv61','v3','anchieta', 'belo horizonte','MG', 'rua vigessimo','06', '104', '520.000', 'oft6', 'disponivel', '10/06/2022'),
('imv62','v3','agua branca', 'contagem','MG', 'rua vigessimo','06', '104', '520.000', 'oft6', 'disponivel', '10/06/2022'),
('imv63','v3','bela vista', 'contagem','MG', 'rua vigessimo','06', '104', '520.000', 'oft6', 'disponivel', '10/06/2022'),
('imv64','v3','nossa senhora do carmom', ' betim','MG', 'rua vigessimo','06', '104', '520.000', 'oft6', 'disponivel', '10/06/2022'),
('imv65','v3','brasileia', ' betim','MG', 'rua vigessimo','06', '104', '520.000', 'oft6', 'disponivel', '10/06/2022'),
('imv65','v4','nazare', ' belem','PA', 'rua quinto','06', '104', '520.000', 'oft6', 'disponivel', '11/07/2022'),
('imv66','v4','umarizal', ' belem','PA', 'rua quinto','06', '104', '520.000', 'oft6', 'disponivel', '11/07/2022'),
('imv67','v4','aparecida', ' santarem','PA', 'rua quinto','06', '104', '520.000', 'oft6', 'disponivel', '11/07/2022'),
('imv68','v4','amparo', ' santarem','PA', 'rua quinto','06', '104', '520.000', 'oft6', 'disponivel', '11/07/2022'),
('imv70','v4','jardim uniao', ' maraba','PA', 'rua quinto','06', '104', '520.000', 'oft6', 'disponivel', '11/07/2022'),
('imv71','v4','mirante do vale', ' maraba','PA', 'rua quinto','06', '104', '520.000', 'oft6', 'disponivel', '11/07/2022'),
('imv72','v4','cabo branco', ' joao pessoa','PB', 'rua quatorze','06', '104', '300.000', 'oft6', 'disponivel', '31/08/2022'),
('imv73','v4','castelo branco', ' joao pessoa','PB', 'rua quatorze','06', '104', '300.000', 'oft6', 'disponivel', '31/08/2022'),
('imv74','v4','jose benon', ' agua branca','PB', 'rua quatorze','06', '104', '300.000', 'oft6', 'disponivel', '31/08/2022'),
('imv75','v4','centro', 'agua brana','PB', 'rua quatorze','06', '104', '300.000', 'oft6', 'disponivel', '31/08/2022'),
('imv76','v4','zumbi', 'alagoa grande','PB', 'rua quatorze','06', '104', '300.000', 'oft6', 'disponivel', '31/08/2022'),
('imv77','v4','vera cruz', 'alagoa grande','PB', 'rua quatorze','06', '104', '300.000', 'oft6', 'disponivel', '31/08/2022'),
('imv78','v5','bom retiro', 'curitiba','PR', 'rua central','06', '104', '846.000', 'oft6', 'disponivel', '16/06/2022'),
('imv79','v5','cabral', 'curitiba','PR', 'rua central','06', '104', '846.000', 'oft6', 'disponivel', '16/06/2022'),
('imv80','v5','vila nova', 'abatia','PR', 'rua central','06', '104', '846.000', 'oft6', 'disponivel', '16/06/2022'),
('imv81','v5','curvao', 'abatia','PR', 'rua central','06', '104', '846.000', 'oft6', 'disponivel', '16/06/2022'),
('imv82','v5','vila bela', 'adriapolis','PR', 'rua central','06', '104', '846.000', 'oft6', 'disponivel', '16/06/2022'),
('imv83','v5','vila mora', 'adrianopolis','PR', 'rua central','06', '104', '846.000', 'oft6', 'disponivel', '16/06/2022'),
('imv84','v5','areias', 'recife','PE', 'rua marechal','06', '104', '846.000', 'oft6', 'disponivel', '28/09/2022'),
('imv85','v5','agua fria', 'recife','PE', 'rua marechal','06', '104', '846.000', 'oft6', 'disponivel', '28/09/2022'),
('imv86','v5','pitanga', 'abreu e lima','PE', 'rua marechal','06', '104', '846.000', 'oft6', 'disponivel', '28/09/2022'),
('imv87','v5','inhama', 'abreu e lima','PE', 'rua marechal','06', '104', '846.000', 'oft6', 'disponivel', '28/09/2022'),
('imv88','v5','brotas', 'afogados da ingazeira','PE', 'rua marechal','06', '104', '846.000', 'oft6', 'disponivel', '28/09/2022'),
('imv89','v5','birges', 'afogados de ingazeira','PE', 'rua marechal','06', '104', '846.000', 'oft6', 'disponivel', '28/09/2022'),
('imv90','v1','cabral', 'teresina','PI', 'rua domingo tavares','03', '64', '150.000', 'oft3', 'disponivel', '07/12/2022'),
('imv91','v1','porenqunto', 'teresina','PI', 'rua domingo tavares','03', '64', '150.000', 'oft3', 'disponivel', '07/12/2022'),
('imv92','v1','Dner', 'picos','PI', 'rua domingo tavares','03', '64', '150.000', 'oft3', 'disponivel', '07/12/2022'),
('imv93','v1','pedrinas', 'picos','PI', 'rua domingo tavares','03', '64', '150.000', 'oft3', 'disponivel', '07/12/2022'),
('imv94','v1','boa vista', 'barras','Pi', 'rua domingo tavares','03', '64', '150.000', 'oft3', 'disponivel', '07/12/2022'),
('imv95','v1','palestina', 'barras','Pi', 'rua domingo tavares','03', '64', '150.000', 'oft3', 'disponivel', '07/12/2022'),
('imv96','v2','lebon', 'rio de janeiro','RJ', 'rua moraes','04', '34', '270.000', 'oft12', 'disponivel', '17/02/2022'),
('imv97','v2','opanema', 'rio de janeiro','RJ', 'rua moraes','04', '34', '270.000', 'oft12', 'disponivel', '17/02/2022'),
('imv98','v2','barreto', 'niteroi','RJ', 'rua moraes','04', '34', '270.000', 'oft12', 'disponivel', '17/02/2022'),
('imv99','v2','icarai', 'niteroi','RJ', 'rua moraes','04', '34', '270.000', 'oft12', 'disponivel', '17/02/2022'),
('imv100','v2','gramacho', 'duque de caxias','RJ', 'rua moraes','04', '34', '270.000', 'oft12', 'disponivel', '17/02/2022'),
('imv101','v2','parque lafaiete', 'duque de caixias','RJ', 'rua moraes','04', '34', '270.000', 'oft12', 'disponivel', '17/02/2022'),
('imv102','v2','alecrim', 'natal','RN', 'rua assis','02', '324', '300.000', 'oft12', 'disponivel', '13/04/2022'),
('imv103','v2','candelria', 'natal','RN', 'rua assis','02', '324', '300.000', 'oft12', 'disponivel', '13/04/2022'),
('imv104','v2','candelaria', 'mossoro','RN', 'rua assis','02', '324', '300.000', 'oft12', 'disponivel', '13/04/2022'),
('imv105','v2','independencia', 'mossoro','RN', 'rua assis','02', '324', '300.000', 'oft12', 'disponivel', '13/04/2022'),
('imv106','v2','cajupiranga', 'parnamirim','RN', 'rua assis','02', '324', '300.000', 'oft12', 'disponivel', '13/04/2022'),
('imv107','v2','cidade nova', 'parnamirim','RN', 'rua assis','02', '324', '300.000', 'oft12', 'disponivel', '13/04/2022'),
('imv108','v3','bela vista', 'porto velho','RO', 'rua miguel','05', '34', '700.000', 'oft2', 'disponivel', '23/07/2022'),
('imv109','v3','areal', 'porto velho','RO', 'rua miguel','05', '34', '700.000', 'oft2', 'disponivel', '23/07/2022'),
('imv110','v3','vila rica', 'alto paraido','RO', 'rua miguel','05', '34', '700.000', 'oft2', 'disponivel', '23/07/2022'),
('imv111','v3','industrial', 'alto paraido','RO', 'rua miguel','05', '34', '700.000', 'oft2', 'disponivel', '23/07/2022'),
('imv112','v3','alto alegre', 'alvorada d oeste','RO', 'rua miguel','05', '34', '700.000', 'oft2', 'disponivel', '23/07/2022'),
('imv113','v3','zona rural', 'alvorada d oeste','RO', 'rua miguel','05', '34', '700.000', 'oft2', 'disponivel', '23/07/2022'),
('imv114','v4','jurere', 'florianopolis','SC', 'rua candida','04', '334', '100.000', 'oft24', 'disponivel', '26/04/2022'),
('imv115','v4','saco grande', 'florianopolis','SC', 'rua candida','04', '334', '100.000', 'oft24', 'disponivel', '26/04/2022'),
('imv116','v4','progresso', 'blumenau','SC', 'rua candida','04', '334', '100.000', 'oft24', 'disponivel', '26/04/2022'),
('imv117','v4','passo manso', 'blumenau','SC', 'rua candida','04', '334', '100.000', 'oft24', 'disponivel', '26/04/2022'),
('imv118','v4','pitangueira', 'agrolandia','SC', 'rua candida','04', '334', '100.000', 'oft24', 'disponivel', '26/04/2022'),
('imv119','v4','barra', 'agrolandia','SC', 'rua candida','04', '334', '100.000', 'oft24', 'disponivel', '26/04/2022'),
('imv120','v4','tigre', 'agrolandia','SC', 'rua candida','04', '334', '100.000', 'oft24', 'disponivel', '26/04/2022'),
('imv121','v5','consolacao', 'sao paulo','SP', 'rua marques','44', '33', '900.000', 'oft24', 'disponivel', '31/09/2022'),
('imv122','v5','se', 'sao paulo','SP', 'rua marques','44', '33', '900.000', 'oft24', 'disponivel', '31/09/2022'),
('imv123','v5','jardins', 'sao paulo','SP', 'rua marques','44', '33', '900.000', 'oft24', 'disponivel', '31/09/2022'),
('imv124','v5','moema', 'sao paulo','SP', 'rua marques','44', '33', '900.000', 'oft24', 'disponivel', '31/09/2022'),
('imv125','v5','morumbi', 'sao paulo','SP', 'rua marques','44', '33', '900.000', 'oft24', 'disponivel', '31/09/2022'),
('imv126','v5','grajau', 'sao paulo','SP', 'rua marques','44', '33', '900.000', 'oft24', 'disponivel', '31/09/2022'),
('imv127','v5','socorro', 'sao paulo','SP', 'rua silva','44', '33', '900.000', 'oft24', 'disponivel', '31/09/2022'),
('imv128','v5','vila olimpia', 'sao paulo','SP', 'rua silva','44', '33', '900.000', 'oft24', 'disponivel', '31/09/2022'),
('imv129','v5','santa cruz', 'sao paulo','SP', 'rua silva','44', '33', '900.000', 'oft24', 'disponivel', '31/09/2022'),
('imv130','v5','jabaquara', 'sao paulo','SP', 'rua silva','44', '33', '900.000', 'oft24', 'disponivel', '31/09/2022'),
('imv131','v5','interlagos', 'sao paulo','SP', 'rua silva','44', '33', '900.000', 'oft24', 'disponivel', '31/09/2022'),
('imv132','v5','jurubatuba', 'sao paulo','SP', 'rua silva','44', '33', '900.000', 'oft24', 'disponivel', '31/09/2022'),
('imv133','v5','santo amaro', 'sao paulo','SP', 'rua silva','44', '33', '900.000', 'oft24', 'disponivel', '31/09/2022'),
('imv134','v5','pinheiros', 'sao paulo','SP', 'rua silva','44', '33', '900.000', 'oft24', 'disponivel', '31/09/2022'),
('imv135','v5','granja julieta', 'sao paulo','SP', 'rua silva','44', '33', '900.000', 'oft24', 'disponivel', '31/09/2022'),
('imv136','v5','perdizes', 'sao paulo','SP', 'rua silva','44', '33', '900.000', 'oft24', 'disponivel', '31/09/2022'),
('imv137','v5','santana', 'sao paulo','SP', 'rua silva','44', '33', '900.000', 'oft24', 'disponivel', '31/09/2022'),
('imv138','v5','tiete', 'sao paulo','SP', 'rua silva','44', '33', '900.000', 'oft24', 'disponivel', '31/09/2022'),
('imv139','v5','leopoldina', 'sao paulo','SP', 'rua silva','44', '33', '900.000', 'oft24', 'disponivel', '31/09/2022'), 
('imv140','v5','mooca', 'sao paulo','SP', 'rua silva','44', '33', '900.000', 'oft24', 'disponivel', '31/09/2022'),
('imv141','v5','bosque', 'campinas','SP', 'rua silva','44', '33', '900.000', 'oft24', 'disponivel', '31/09/2022'),
('imv142','v5','bota fogo', 'campinas','SP', 'rua silva','44', '33', '900.000', 'oft24', 'disponivel', '31/09/2022'),
('imv143','v3','getulio vargas' ,'acaraju','SE', 'rua silva','41', '20', '200.000', 'oft24', 'disponivel', '11/03/2022'),
('imv144','v3','centro' ,'acaraju','SE', 'rua silva','41', '20', '200.000', 'oft24', 'disponivel', '11/03/2022'),
('imv145','v3','centro' ,'itabaiana','SE', 'rua silva','41', '20', '200.000', 'oft24', 'disponivel', '11/03/2022'),
('imv146','v3','torres' ,'itabaiana','SE', 'rua silva','41', '20', '200.000', 'oft24', 'disponivel', '11/03/2022'),
('imv147','v3','rurral' ,'largato','SE', 'rua silva','41', '20', '200.000', 'oft24', 'disponivel', '11/03/2022'),
('imv148','v3','horta' ,' largato','SE', 'rua silva','41', '20', '200.000', 'oft24', 'disponivel', '11/03/2022'),
('imv149','v4','taquaralto' ,' palmas','TO', 'rua marexal','41', '20', '450.000', 'oft24', 'disponivel', '24/05/2022'),
('imv150','v4','morada do sol' ,' palmas','TO', 'rua marexal','41', '20', '450.000', 'oft24', 'disponivel', '24/05/2022'),
('imv151','v4','centro' ,' almas','TO', 'rua marexal','41', '20', '450.000', 'oft24', 'disponivel', '24/05/2022'),
('imv153','v4','distrito indusstrial' ,' almas','TO', 'rua marexal','41', '20', '450.000', 'oft24', 'disponivel', '24/05/2022'),
('imv154','v4','centro' ,' abreulandia','TO', 'rua marexal','41', '20', '450.000', 'oft24', 'disponivel', '24/05/2022'),
('imv155','v4','distrito industrial' ,' abreulandia','TO', 'rua marexal','41', '20', '450.000', 'oft24', 'disponivel', '24/05/2022'),
('imv156','v4','asa sul' ,' brasilia','DF', 'rua marques','11', '43', '504.000', 'oft43', 'disponivel', '08/12/2022'),
('imv157','v4','agua clara' ,' brasilia','DF', 'rua marques','11', '43', '504.000', 'oft43', 'disponivel', '08/12/2022'),
('imv158','v4','centro' ,' samabaia','DF', 'rua marques','11', '43', '504.000', 'oft43', 'disponivel', '08/12/2022'),
('imv159','v4','distrito industrial' ,' samabaia','DF', 'rua marques','11', '43', '504.000', 'oft43', 'disponivel', '08/12/2022'),
('imv160','v4','centro' ,' plano piloto','DF', 'rua marques','11', '43', '504.000', 'oft43', 'disponivel', '08/12/2022'),
('imv161','v4','parque nacional' ,' plano piloto','DF', 'rua marques','11', '43', '504.000', 'oft43', 'disponivel', '08/12/2022');

select *
from imovel;

insert into oferta
values ('oft1','imv1', 'c1','200.000,00','21/11/2021'),
('oft1','imv1', 'c2','230.000,00','21/11/2021'),
('oft1','imv1', 'c3','210.000,00','21/11/2021'),
('oft1','imv1', 'c4','205.000,00','21/11/2021'),
('oft1','imv1', 'c5','245.000,00','21/11/2021'),

('oft2','imv12', 'c1','350.000,00','23/11/2021'),
('oft2','imv12', 'c2','353.000,00','23/11/2021'),
('oft2','imv12', 'c3','359.000,00','23/11/2021'),
('oft2','imv12', 'c4','360.000,00','23/11/2021'),
('oft2','imv12', 'c5','378.000,00','23/11/2021'),

('oft3','imv13', 'c1','350.000,00','28/06/2021'),
('oft3','imv13', 'c2','360.000,00','28/06/2021'),
('oft3','imv13', 'c3','380.000,00','28/06/2021'),
('oft3','imv13', 'c4','370.000,00','28/06/2021'),
('oft3','imv13', 'c5','330.000,00','28/06/2021'),


('oft4','imv15', 'c1','350.000,00','16/04/2021'),
('oft4','imv15', 'c2','360.000,00','16/04/2021'),
('oft4','imv15', 'c3','250.000,00','16/04/2021'),
('oft4','imv15', 'c4','440.000,00','16/04/2021'),
('oft4','imv15', 'c5','550.000,00','16/04/2021');