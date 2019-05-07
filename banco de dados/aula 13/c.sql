-- criação das chaves-primárias
alter table `Endereco` add primary key (`id_endereco`);
alter table `Pessoa` add primary key (`id_pessoa`);
alter table `Cliente` add primary key (`id_cliente`);
alter table `Funcionario` add primary key (`id_funcionario`);
alter table `Servidor` add primary key (`id_servidor`);
alter table `Computador` add primary key (`id_computador`);
alter table `Aluguel_horas` add primary key (`id_aluguel`);
alter table `Telefone` add primary key (`ddd`, `numero_tel`);