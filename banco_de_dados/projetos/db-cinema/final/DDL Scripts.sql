/*
    UniProjeção - Departamento de Tecnologia da Informação
    Prof. Wanderson Santos

    Disciplina: Banco de Dados 1
    Equipe: André, Vinícius e Nádio
*/
-- criação do schema `cinema_completo`:
create database `cinema_completo`;
use `cinema_completo`;
-- criação das tabelas do schema:
create table `funcao` (
  `IDFUNCAO` int(11) not null,
  `DescFUNCAO` varchar(20) not null
);
create table `funcionario` (
  `IDFUNCIONARIO` int(11) not null,
  `FUNCAO_IDFUNCAO` int(11) not null,
  `NOMEFUNC` varchar(20) not null,
  `ENDFUNC` varchar(20) not null,
  `FONE` char(10) not null
);
create table `tipodesconto` (
  `IDTIPODESCONTO` int(11) not null,
  `descTD` varchar(30) not null,
  `PERCENTUAL` decimal(5, 2) not null
);
create table `pedido` (
  `IDPEDIDO` int(11) not null,
  `FUNCIONARIO_IDFUNCIONARIO` int(11) not null,
  `DATAHORA` datetime not null,
  `VALORTOTAL` decimal(5, 2) not null,
  `VALORDESC` decimal(5, 2) not null,
  `VALORPAGO` decimal(5, 2) not null
);
create table `ingresso` (
  `PEDIDO_IDPEDIDO` int(11) not null,
  `SESSAO_IDSESSAO` int(11) not null,
  `TIPODESCONTO_IDTIPODESCONTO` int(11) not null,
  `VALEESTACIONAMENTO` bit(1) not null
);
create table `sala` (
  `IDSALA` int(11) not null,
  `CAPACIDADE` int(11) not null
);
create table `diasemana` (
  `IDDIASEMANA` int(11) not null,
  `DescDS` varchar(20) not null
);
create table `estabelecimento` (
  `IDESTABELECIMENTO` int(11) not null,
  `NOMEESTAB` varchar(50) not null,
  `ENDESTAB` varchar(50) not null,
  `TELEESTAB` char(20) not null,
  `HORAABERTURA` char(5) not null,
  `HORAFECHAMENTO` char(5) not null
);
create table `classificacao` (
  `IDCLASSIFICACAO` int(11) not null,
  `DescCLASSIFICACAO` varchar(20)
);
create table `genero` (
  `IDGENERO` int(11) not null,
  `descGENERO` varchar(20) not null
);
create table `filme` (
  `IDFILME` int(11) not null,
  `GENERO_IDGENERO` int(11) not null,
  `CLASSIFICACAO_IDCLASSIFICACAO` int(11) not null,
  `NOMEFILME` varchar(50) not null,
  `SINOPSE` text not null,
  `TEMPODURACAO` int(11) not null
);
create table `horario` (
  `IDHORARIO` int(11) not null,
  `HORAINICIO` varchar(5)
);
create table `tipo` (
  `IDTIPO` int(11) not null,
  `DESCTIPO` varchar(20)
);
create table `sessao` (
  `IDSESSAO` int(11) not null,
  `TIPO_IDTIPO` int(11) not null,
  `SALA_IDSALA` int(11) not null,
  `FILME_IDFILME` int(11) not null,
  `HORARIO_IDHORARIO` int(11) not null,
  `DIASEMANA_IDDIASEMANA` int(11) not null,
  `ESTABELECIMENTO_IDESTABELECIMENTO` int(11) not null,
  `VALOR` decimal(5, 2) not null
);
-- alteração das tabelas para adição de chaves primárias e estrangeiras no schema:
alter table
  `funcao`
add
  constraint `pk_idfuncao` primary key (`IDFUNCAO`),
modify
  column `IDFUNCAO` int(11) auto_increment;
alter table
  `funcionario`
add
  constraint `pk_idfuncionario` primary key (`IDFUNCIONARIO`),
add
  constraint `fk_funcao_idfuncao_idfuncao` foreign key (`FUNCAO_IDFUNCAO`) references `funcao` (`IDFUNCAO`),
modify
  column `IDFUNCIONARIO` int(11) auto_increment;
alter table
  `tipodesconto`
add
  constraint `pk_idtipodesconto` primary key (`IDTIPODESCONTO`),
modify
  column `IDTIPODESCONTO` int(11) auto_increment;
alter table
  `pedido`
add
  constraint `pk_idpedido` primary key (`IDPEDIDO`),
add
  constraint `fk_funcionario_idfuncionario_idfuncionario` foreign key (`FUNCIONARIO_IDFUNCIONARIO`) references `funcionario` (`IDFUNCIONARIO`),
modify
  column `IDPEDIDO` int(11) auto_increment;
alter table
  `ingresso`
add
  constraint `fk_pedido_idpedido_idpedido` foreign key (`PEDIDO_IDPEDIDO`) references `pedido` (`IDPEDIDO`),
add
  constraint `fk_sessao_idsessao` foreign key (`SESSAO_IDSESSAO`) references `sessao` (`IDSESSAO`),
add
  constraint `fk_tipodesconto_idtipodesconto_idtipodesconto` foreign key (`TIPODESCONTO_IDTIPODESCONTO`) references `tipodesconto` (`IDTIPODESCONTO`);
alter table
  `sala`
add
  constraint `pk_idsala` primary key (`IDSALA`),
modify
  column `IDSALA` int(11) auto_increment;
alter table
  `diasemana`
add
  constraint `pk_iddiasemana` primary key (`IDDIASEMANA`),
modify
  column `IDDIASEMANA` int(11) auto_increment;
alter table
  `estabelecimento`
add
  constraint `pk_idestabelecimento` primary key (`IDESTABELECIMENTO`),
modify
  column `IDESTABELECIMENTO` int(11) auto_increment;
alter table
  `classificacao`
add
  constraint `pk_idclassificacao` primary key (`IDCLASSIFICACAO`),
modify
  column `IDCLASSIFICACAO` int(11) auto_increment;
alter table
  `genero`
add
  constraint `pk_idgenero` primary key (`IDGENERO`),
modify
  column `IDGENERO` int(11) auto_increment;
alter table
  `filme`
add
  constraint `pk_idfilme` primary key (`IDFILME`),
add
  constraint `fk_genero_idgenero_idgenero` foreign key (`GENERO_IDGENERO`) references `genero` (`IDGENERO`),
add
  constraint `fk_classificacao_idclassificacao_idclassificacao` foreign key (`CLASSIFICACAO_IDCLASSIFICACAO`) references `classificacao` (`IDCLASSIFICACAO`),
modify
  column `IDFILME` int(11) auto_increment;
alter table
  `horario`
add
  constraint `pk_idhorario` primary key (`IDHORARIO`),
modify
  column `IDHORARIO` int(11) auto_increment;
alter table
  `tipo`
add
  constraint `pk_idtipo` primary key (`IDTIPO`),
modify
  column `IDTIPO` int(11) auto_increment;
alter table
  `sessao`
add
  constraint `pk_idsessao` primary key (`IDSESSAO`),
add
  constraint `fk_tipo_idtipo_idtipo` foreign key (`TIPO_IDTIPO`) references `tipo` (`IDTIPO`),
add
  constraint `fk_sala_idsala_idsala` foreign key (`SALA_IDSALA`) references `sala` (`IDSALA`),
add
  constraint `fk_filme_idfilme_idfilme` foreign key (`FILME_IDFILME`) references `filme` (`IDFILME`),
add
  constraint `fk_horario_idhorario_idhorario` foreign key (`HORARIO_IDHORARIO`) references `horario` (`IDHORARIO`),
add
  constraint `fk_diasemana_iddiasemana_iddiasemana` foreign key (`DIASEMANA_IDDIASEMANA`) references `diasemana` (`IDDIASEMANA`),
add
  constraint `fk_estabelecimento_idestabelecimento_idestabelecimento` foreign key (`ESTABELECIMENTO_IDESTABELECIMENTO`) references `estabelecimento` (`IDESTABELECIMENTO`),
modify
  column `IDSESSAO` int(11) auto_increment;