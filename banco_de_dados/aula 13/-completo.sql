create database `lanhouse`;

use `lanhouse`;

-- tabela `Endereco`
create table `Endereco` (
    `id_endereco` int(11) not null,
    `logradouro` varchar(30),
    `complemento` varchar(30),
    `cep` varchar(8),
    `cidade` varchar(30),
    `uf` char(2)
);

-- tabela `Pessoa`
create table `Pessoa` (
    `id_pessoa` int(11) not null,
    `nome` varchar(50),
    `rg` varchar(10),
    `dt_nascimento` datetime,
    `id_endereco` int(11) not null
);

-- tabela `Cliente`
create table `Cliente` (
    `id_cliente` int(11) not null,
    `senha` varchar(3),
    `Pessoa_id_pessoa` int(11) not null
);

-- tabela `Funcionario`
create table `Funcionario` (
    `id_funcionario` int(11) not null,
    `data_admissao` date,
    `senha` varchar(8),
    `Pessoa_id_pessoa` int(11) not null
);

-- tabela `Servidor`
create table `Servidor` (
    `id_servidor` int not null,
    `nome_servidor` char(10),
    `processador` varchar(20),
    `memoria` char(3)
);

-- tabela `Computador`
create table `Computador` (
    `id_computador` int not null,
    `nome_computador` char(10),
    `tempo_utilizado` int,
    `Servidor_id_servidor` int not null
);

-- tabela `Aluguel_horas`
create table `Aluguel_horas` (
    `id_aluguel` int(11) not null,
    `valor_pa` float,
    `qtd_tempo` int(11),
    `cliente` int(11),
    `funcionario` int(11),
    `computador` int not null
);

-- tabela `Telefone`
create table `Telefone` (
    `ddd` char(2) not null,
    `numero_tel` char(9) not null,
    `id_pessoa` int(11) not null
);

-- tabela `Responsavel`
create table `Responsavel` (
    `Cliente_id_cliente` int(11) not null,
    `Pessoa_id_pessoa` int(11) not null
);

-- criação das chaves-primárias
alter table `Endereco` add primary key (`id_endereco`);
alter table `Pessoa` add primary key (`id_pessoa`);
alter table `Cliente` add primary key (`id_cliente`);
alter table `Funcionario` add primary key (`id_funcionario`);
alter table `Servidor` add primary key (`id_servidor`);
alter table `Computador` add primary key (`id_computador`);
alter table `Aluguel_horas` add primary key (`id_aluguel`);
alter table `Telefone` add primary key (`ddd`, `numero_tel`);

-- modificação de chaves-primárias para atributo de autoincremento
alter table `Endereco` modify column `id_endereco` int(11) auto_increment;
alter table `Pessoa` modify column `id_pessoa` int(11) auto_increment;
alter table `Cliente` modify column `id_cliente` int(11) auto_increment;
alter table `Funcionario` modify column `id_funcionario` int(11) auto_increment;
alter table `Servidor` modify column `id_servidor` int(11) auto_increment;
alter table `Computador` modify column `id_computador` int(11) auto_increment;
alter table `Aluguel_horas` modify column `id_aluguel` int(11) auto_increment;

-- criação das chaves-estrangeiras
alter table `Funcionario` add constraint `fk_Funcionario_Pessoa` foreign key (`Pessoa_id_pessoa`) references `Pessoa` (`id_pessoa`);
alter table `Computador` add constraint `fk_Computador_Servidor` foreign key (`Servidor_id_servidor`) references `Servidor` (`id_servidor`);
alter table `Aluguel_horas` add constraint `fk_Aluguel_horas_Cliente` foreign key (`cliente`) references `Cliente` (`id_cliente`);
alter table `Aluguel_horas` add constraint `fk_Aluguel_horas_Funcionario` foreign key (`funcionario`) references `Funcionario` (`id_funcionario`);
alter table `Aluguel_horas` add constraint `fk_Aluguel_horas_Computador` foreign key (`computador`) references `Computador` (`id_computador`);
alter table `Telefone` add constraint `fk_Telefone_Pessoa` foreign key (`id_pessoa`) references `Pessoa` (`id_pessoa`);
alter table `Responsavel` add constraint `fk_Responsavel_Cliente` foreign key (`Cliente_id_cliente`) references `Cliente` (`id_cliente`);
alter table `Responsavel` add constraint `fk_Responsavel_Pessoa` foreign key (`Pessoa_id_pessoa`) references `Pessoa` (`id_pessoa`);
alter table `Responsavel` add constraint `fk_Responsavel_Pessoa` foreign key (`Pessoa_id_pessoa`) references `Pessoa` (`id_pessoa`);

-- inserção de registros nas tabelas
insert into `Endereco`
	(`logradouro`, `complemento`, `cep`, `cidade`, `uf`)
values
	("Ceilândia Sul (Ceilândia)", "Quadra QNP 14 Conjunto U", "72231421", "Brasília", "DF"),
    ("Samambaia Sul (Samambaia)", "Quadra QR 112", "72302400", "Brasília", "DF"),
    ("Norte (Águas Claras)", "Quadra Quadra 107 Rua A", "71920710", "Brasília", "DF"),
    ("Samambaia Norte (Samambaia)", "Quadra QN 417 Conjunto I", "72323549", "Brasília", "DF"),
    ("Setor de Mansões Park Way", "Quadra SMPW Quadra 13 Conjunto 5", "71740016", "Brasília", "DF");
insert into `Pessoa`
	(`nome`, `rg`, `dt_nascimento`, `id_endereco`)
values
	("Carlos Henrique Rafael Moraes", "400044456", "2001-01-03 00:00:00", 1),
	("Silvana Mariane Fabiana Drumond", "393412441", "2001-10-02 00:00:00", 2),
	("Nelson Lucca Ruan Assis", "469103772", "2001-12-06 00:00:00", 3),
	("Nicole Natália Campos", "227466196", "2001-01-25 00:00:00", 4),
	("Juan Yuri Ramos", "490104502", "2001-08-07 00:00:00", 5);
insert into `Cliente`
	(`senha`, `Pessoa_id_pessoa`)
values
	("R45", 1),
    ("56f", 2),
    ("r36", 3),
    ("Y6d", 4),
    ("Lai", 5);
insert into `Funcionario`
	(`data_admissao`, `senha`, `Pessoa_id_pessoa`)
values
	("2015-01-01", "Wuysiwil", 1),
    ("2016-01-01", "Kekuafuo", 2),
    ("2017-01-01", "Latuelus", 3),
    ("2018-01-01", "Zaxoenia", 4),
    ("2019-01-01", "Zipletei", 5);
insert into `Servidor`
	(`nome_servidor`, `processador`, `memoria`)
values
	("Servidor 1", "Quad Xeon E5-4640v2", "256"),
	("Servidor 2", "Quad Xeon E7-4860", "256"),
	("Servidor 3", "Dual Xeon E5-2670v2", "128"),
	("Servidor 4", "Dual Xeon E5-2670", "128"),
	("Servidor 5", "Dual Xeon E5-2670v2", "128");
insert into `Computador`
	(`nome_computador`, `tempo_utilizado`, `Servidor_id_servidor`)
values
	("PC 1", 100, 1),
	("PC 2", 200, 2),
	("PC 3", 300, 3),
	("PC 4", 400, 4),
	("PC 5", 500, 5);
insert into `Aluguel_horas`
	(`valor_pa`, `qtd_tempo`, `cliente`, `funcionario`, `computador`)
values
	(12.34, 11, 1, 5, 1),
	(23.45, 22, 2, 4, 2),
	(34.56, 33, 3, 3, 3),
	(45.56, 44, 4, 2, 4),
	(56.67, 55, 5, 1, 5);
insert into `Telefone`
	(`ddd`, `numero_tel`, `id_pessoa`)
values
	("98" , "36233663", 1),
	("11" , "36838072", 2),
	("81" , "38466832", 3),
	("91" , "36422200", 4),
	("96" , "39883907", 5);
insert into `Responsavel`
	(`Cliente_id_cliente`, `Pessoa_id_pessoa`)
values
	(1, 5),
	(2, 4),
	(3, 3),
	(4, 2),
	(5, 1);