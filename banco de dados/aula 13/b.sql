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