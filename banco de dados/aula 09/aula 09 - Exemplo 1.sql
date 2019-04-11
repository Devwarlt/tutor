-- crio o banco de dados
create database `endereco`;

-- utilizo o banco de dados
use `endereco`;

-- crio a tabela "logradouro"
create table `logradouro` (
    `id_logradouro` int(11) not null,
    `cd_bairro` int(11) not null,
    `cd_cidade` int(11) not null,
    `no_logradouro` varchar(75),
    `ds_complemento` varchar(45),
    `cd_cep` char(8),
    `tp_logradouro` varchar(45)
);

create table `bairro` (
    `id_bairro` int(11) not null,
    `cd_cidade` int(11) not null,
    `no_bairro` varchar(100),
    `no_abreviado` varchar(25)
);

create table `cidade` (
    `id_localidade` int(11) not null,
    `sg_uf` char(2) not null,
    `no_localidade` varchar(100)
);

create table `uf` (
    `sg_uf` char(2) not null,
    `cd_regiao` int(11) not null,
    `no_estado` varchar(20)
);

create table `regiao` (
    `id_regiao` int(11) not null,
    `no_regiao` varchar(15)
);

-- crio uma restrição para "id_logradouro" e designo a chave primária
alter table `logradouro` add constraint `PK_id_logradouro` primary key (`id_logradouro`);

-- crio uma restrição para "cd_bairro" e designo a chave candidata
alter table `logradouro` add constraint `AK_cd_bairro` unique (`cd_bairro`);

-- crio uma restrição para "cd_bairro" e designo a chave estrangeira com a tabela "bairro" e campo "id_bairro"
alter table `logradouro` add constraint `FK_cd_bairro` foreign key (`cd_bairro`) references `bairro` (`id_bairro`);

alter table `logradouro` add constraint `AK_cd_cidade` unique (`cd_cidade`);
alter table `logradouro` add constraint `FK_cd_cidade` foreign key (`cd_cidade`) references `cidade` (`id_localidade`);

alter table `bairro` add constraint `PK_id_bairro` primary key (`id_bairro`);
alter table `bairro` add constraint `AK_cd_cidade` unique (`cd_cidade`);
alter table `bairro` add constraint `FK_cd_cidade` foreign key (`cd_cidade`) references `cidade` (`id_localidade`);

alter table `cidade` add constraint `PK_id_localidade` primary key (`id_localidade`);
alter table `cidade` add constraint `AK_sg_uf` unique (`sg_uf`);
alter table `cidade` add constraint `FK_sg_uf` foreign key (`sg_uf`) references `uf` (`sg_uf`);

alter table `uf` add constraint `PK_sg_uf` primary key (`sg_uf`);
alter table `uf` add constraint `AK_cd_regiao` unique (`cd_regiao`);
alter table `uf` add constraint `FK_cd_regiao` foreign key (`cd_regiao`) references `regiao` (`id_regiao`);

alter table `regiao` add constraint `PK_id_regiao` primary key (`id_regiao`);