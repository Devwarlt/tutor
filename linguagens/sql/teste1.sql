create table `nome_da_tabela` (
    `coluna_1` int primary key,
    `coluna_2` varchar(12) not null,
    `coluna_3` bit
);

ALTER TABLE pedido ADD PRIMARY KEY (`COLUNA`);

ALTER TABLE TABELA_ATUAL ADD
    FOREIGN KEY (`COLUNA_TABELA_ATUAL`)
    REFERENCES `OUTRA_TABELA` (`COLUNA_OUTRA_TABELA`);

alter table
  `pedido`
add
  constraint `pk_idpedido` primary key (`IDPEDIDO`),
add
  constraint `fk_funcionario_idfuncionario_idfuncionario`
  foreign key (`FUNCIONARIO_IDFUNCIONARIO`)
  references `funcionario` (`IDFUNCIONARIO`),
modify
  column `IDPEDIDO` int(11) auto_increment;

  a(pk)     b      c        d
  1         2      3        4
  1         2      3        4