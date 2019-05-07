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