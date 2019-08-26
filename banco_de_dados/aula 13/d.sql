-- modificação de chaves-primárias para atributo de autoincremento
alter table `Endereco` modify column `id_endereco` int(11) auto_increment;
alter table `Pessoa` modify column `id_pessoa` int(11) auto_increment;
alter table `Cliente` modify column `id_cliente` int(11) auto_increment;
alter table `Funcionario` modify column `id_funcionario` int(11) auto_increment;
alter table `Servidor` modify column `id_servidor` int(11) auto_increment;
alter table `Computador` modify column `id_computador` int(11) auto_increment;
alter table `Aluguel_horas` modify column `id_aluguel` int(11) auto_increment;