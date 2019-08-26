-- inserção de registros nas tabelas
insert into `Endereco`
	(`logradouro`, `complemento`, `cep`, `cidade`, `uf`)
values
	("Ceilândia Sul (Ceilândia)", "Quadra QNP 14 Conjunto U", "72231421", "Brasília", "DF"),
    ("Samambaia Sul (Samambaia)", "Quadra QR 112", "72302400", "Brasília", "DF"),
    ("Norte (Águas Claras)", "Quadra 107 Rua A", "71920710", "Brasília", "DF"),
    ("Samambaia Norte (Samambaia)", "Quadra QN 417 Conjunto I", "72323549", "Brasília", "DF"),
    ("Setor de Mansões Park Way", "Quadra SMPW 13 Conjunto 5", "71740016", "Brasília", "DF");
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