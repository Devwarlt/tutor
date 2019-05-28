/*
	Banco: Cinema Completo
	Professor: Wanderson Santos
	Email: professor@wandersonsantos.com
*/
-- Selecionar o banco de dados
USE cinema_completo;

-- Inserindo dados na tabela Gênero
INSERT 
	INTO GENERO (IDGENERO, DESCGENERO)
	VALUES('20','DRAMA');
INSERT 
	INTO GENERO (IDGENERO, DESCGENERO)
	VALUES('21','TERROR');
INSERT 
	INTO GENERO (IDGENERO, DESCGENERO)
	VALUES('22','COMEDIA');    
INSERT 
	INTO GENERO (IDGENERO, DESCGENERO)
	VALUES('23','ACAO');

-- Inserindo dados na tabela DIASEMANA
INSERT 
	INTO DIASEMANA (IDDIASEMANA, DESCDS)
	VALUES (1,'DOMINGO');
INSERT 
	INTO DIASEMANA (IDDIASEMANA, DESCDS)
	VALUES(2,'SEGUNDA');
INSERT 
	INTO DIASEMANA (IDDIASEMANA, DESCDS)
	VALUES(3,'TERÇA');
INSERT 
	INTO DIASEMANA (IDDIASEMANA, DESCDS)
	VALUES(4,'QUARTA');
INSERT 
	INTO DIASEMANA (IDDIASEMANA, DESCDS)
	VALUES(5,'QUINTA');
INSERT 
	INTO DIASEMANA (IDDIASEMANA, DESCDS)
	VALUES(6,'SEXTA');
INSERT 
	INTO DIASEMANA (IDDIASEMANA, DESCDS)
	VALUES(7,'SABADO');

-- Inserindo dados na tabela TIPO
INSERT INTO TIPO
	VALUES (1,'Matiné');
INSERT INTO TIPO
	VALUES (2,'Normal');
INSERT INTO TIPO
	VALUES (3,'3D');
INSERT INTO TIPO
	VALUES (4,'Extra');

-- Inserindo dados na tabela CLASSIFICAÇÃO 
INSERT INTO classificacao VALUES (1, 10);
INSERT INTO classificacao VALUES (2, 12);
INSERT INTO classificacao VALUES (3, 14);
INSERT INTO classificacao VALUES (4, 16);
INSERT INTO classificacao VALUES (5, 18);

-- Inserindo dados na tabela FUNÇÃO 
INSERT INTO FUNCAO VALUES (1,'CAIXA');
INSERT INTO FUNCAO VALUES (2,'FAXINEIRO');
INSERT INTO FUNCAO VALUES (3,'LANTERNINHA');
INSERT INTO FUNCAO VALUES (4,'GERENTE');
INSERT INTO FUNCAO VALUES (5,'APOIO');

-- Inserindo dados na tabela ESTABELECIMENTO
INSERT INTO ESTABELECIMENTO 
	VALUES (1, 'Embracine Casa Park', 'SGCV Sul Lote, 22', '(0xx)61 3462-1143', '14:00', '22:00');
INSERT INTO estabelecimento 
	VALUES (2, 'Terraço Shopping', 'SHC Entrequadras, 2/8', ' (61) 34032992', '14:10', '21:10');
INSERT INTO estabelecimento 
	VALUES (3, 'Pátio Brasil', 'Setor Comercial Sul Quadra, 7', '(61) 3223-1617', '14:00', '21:40');
INSERT INTO estabelecimento 
	VALUES (4, 'Kinoplex Boulevard', 'STN , Brasília - DF', '(61) 3223-1617', '14:20', '21:30');
INSERT INTO estabelecimento 
	VALUES (5, 'Cinemark Pier 21', 'Setor de Clubes Esportivos Sul', '(0xx)61 3223-7506', '13:30', '22:05');
INSERT INTO estabelecimento 
	VALUES (6, 'Kinoplex Park Shopping', 'Saisudo, 6580, Brasília ', '(61) 3223-1617', '13:40', '21:40');
INSERT INTO estabelecimento 
	VALUES (7, 'Cinemark Iguatemi Brasília', 'ST SHI/NORTE QUADRA CA-04 LOTE A ', ' (61) 3577-5140', '13:10', '21:50');
INSERT INTO estabelecimento 
	VALUES (8, 'Cinemark Taguatinga', 'R. 210 QS, 01, Taguatinga ', '(61) 3352-4708', '13:10', '21:40');
    
-- Inserindo dados na tabela FUNCIONARIO
INSERT INTO funcionario(IDFUNCIONARIO,FUNCAO_IDFUNCAO,NOMEFUNC,ENDFUNC,FONE)
	 VALUES(8,2,'CARLOS','QWERT','7890-1234');
INSERT INTO funcionario (IDFUNCIONARIO,FUNCAO_IDFUNCAO,NOMEFUNC,ENDFUNC,FONE)
	VALUES(14,3,'FABIO','ZXCVBN','2345-5678');
INSERT INTO funcionario(IDFUNCIONARIO,FUNCAO_IDFUNCAO,NOMEFUNC,ENDFUNC,FONE) 
	VALUES(15,1,'FRANCISCO','XPTO','1234-5678');
INSERT INTO funcionario (IDFUNCIONARIO,FUNCAO_IDFUNCAO,NOMEFUNC,ENDFUNC,FONE)
	VALUES(16,4,'ANDRE','POIUY','7658-9403');
INSERT INTO funcionario(IDFUNCIONARIO,FUNCAO_IDFUNCAO,NOMEFUNC,ENDFUNC,FONE)
	 VALUES(20,3,'PAULO','ASDFGH','3456-7890');
INSERT INTO funcionario(IDFUNCIONARIO,FUNCAO_IDFUNCAO,NOMEFUNC,ENDFUNC,FONE) 
	VALUES(22,1,'AMANDA','ABCD','9876-5432');
INSERT INTO funcionario (IDFUNCIONARIO,FUNCAO_IDFUNCAO,NOMEFUNC,ENDFUNC,FONE)
	VALUES(45,2,'PAULO','AEIOU','5678-1234');
INSERT INTO funcionario (IDFUNCIONARIO,FUNCAO_IDFUNCAO,NOMEFUNC,ENDFUNC,FONE)
	VALUES (50,5,'CRISTINA','JHGFD','3456-8765');
INSERT INTO funcionario (IDFUNCIONARIO,FUNCAO_IDFUNCAO,NOMEFUNC,ENDFUNC,FONE)
	VALUES(61,4,'TAILA','ÇLKJH','8790-3412');
INSERT INTO funcionario (IDFUNCIONARIO,FUNCAO_IDFUNCAO,NOMEFUNC,ENDFUNC,FONE)
	VALUES(62,5,'THAIS','CVBNGF','6547-9201');

-- Inserindo dados na tabela TIPODESCONTO 
INSERT INTO TIPODESCONTO VALUES (1,'ESTUDANTE',50.00);
INSERT INTO TIPODESCONTO VALUES (2,'MILITARES',30.00);
INSERT INTO TIPODESCONTO VALUES (3,'PROFESSORES',40.00);
INSERT INTO TIPODESCONTO VALUES (4,'ESPECIAL',100.00);

-- Inserindo dados na tabela SALA
INSERT INTO SALA VALUES(102,70);
INSERT INTO SALA VALUES(103,80);
INSERT INTO SALA VALUES(111,80);
INSERT INTO SALA VALUES(112,80);
INSERT INTO SALA VALUES(113,80);
INSERT INTO SALA VALUES(121,90);
INSERT INTO SALA VALUES(122,100);
INSERT INTO SALA VALUES(131,150);
INSERT INTO SALA VALUES(132,150);
INSERT INTO SALA VALUES(145,100);
INSERT INTO SALA VALUES(146,100);
INSERT INTO SALA VALUES(147,100);
  
-- Inserindo dados na tabela HORARIO
INSERT INTO HORARIO VALUES(1,'11:00');
INSERT INTO HORARIO VALUES(2,'13:00');
INSERT INTO HORARIO VALUES(3,'15:00');
INSERT INTO HORARIO VALUES(4,'17:00');
INSERT INTO HORARIO VALUES(5,'19:00');
INSERT INTO HORARIO VALUES(6,'21:00');
INSERT INTO HORARIO VALUES(7,'23:00');
INSERT INTO HORARIO VALUES(8,'23:30');

-- Inserindo dados na tabela Pedido 
INSERT 
	INTO  PEDIDO 
	VALUES (10,15, '2010-10-03 15:16:12',20.00,5.00,15.00);
INSERT 
	INTO  PEDIDO 
	VALUES (11,22,'2010-10-04 17:26:42', 30.00,5.00,25.00);
INSERT 
	INTO  PEDIDO 
	VALUES (12,45,'2010-10-03 15:46:12', 40.00,10.00,30.00);
INSERT 
	INTO  PEDIDO 
	VALUES (13,45,'2010-10-03 20:16:12', 20.00,5.00,15.00);
INSERT 
	INTO  PEDIDO 
	VALUES (14,20,'2010-10-03 18:16:12', 45.00,5.00,40.00);
INSERT 
	INTO  PEDIDO 
	VALUES (15,14,'2010-10-03 19:16:12', 25.00,12.50,12.50);
INSERT 
	INTO  PEDIDO  
	VALUES (16,61,'2010-10-03 18:16:13', 50.00,5.00,45.00);
INSERT 
	INTO  PEDIDO 
	VALUES (17,50,'2010-10-03 17:16:12', 58.00,5.00,53.00);
INSERT 
	INTO  PEDIDO  
	VALUES (18,14,'2010-10-03 21:16:12', 20.00,5.00,15.00);

-- Inserindo dados na tabela FILME 
INSERT INTO FILME VALUES(01,20,1,
'NOSSO LAR','Ao abrir os olhos André Luiz (Renato Prieto) sabe que não está mais vivo apesar de ainda sentir sede e fome. 
Ao seu redor ele apenas vê uma planície escura e desértica marcada por gritos e seres que vivem na sombra. 
Após passar pelo sofrimento no mais »purgatório André é levado para a cidade de Nosso Lar. Lá ele tem acesso a novas lições e conhecimentos 
enquanto aprende como é a vida em outra dimensão.brbrConsumo de drogas lícitas e presença de sangue.',null);

INSERT INTO FILME VALUES(02,22,2,'GENTE GRANDE','Eles se conhecem desde pequenos e passados trinta anos os cinco amigos 
(Adam Sandler Chris Rock Kevin James David Spade e Rob Schneider) se reencontram para curtir um fim de semana juntos com as respectivas 
famílias mas o feriado de 4 de Julho em uma mais »casa no lago promete muito mais diversão do que apenas lembranças dos bons momentos',null);

INSERT INTO FILME VALUES(03,20,2,'WALL STREET: O DINHEIRO NUNCA DORME','Jacob Jake Moore (Shia LaBeouf) é um novato corretor da 
Bolsa de Valores norte-americana que está namorando Winnie (Carey Mulligan) a filha de Gordon Gekko (Michael Douglas). 
Jake acredita que seu chefe Bretton James (Josh Brolin) teve alguma mais »ligação com a morte de seu mentor. Gekko decide então ajudar o 
jovem Jake em seus planos de vingança',null);

INSERT INTO FILME VALUES(04,21,3,'O ULTIMO EXOCISMO','Quando o reverendo Cotton Marcus chega à fazenda de 
Louis Sweetzer na Louisiana ele espera realizar mais um exorcismo de rotina. Fundamentalista Sweetzer entrou em contato com o 
pregador como um último recurso certo de que sua filha adolescente Nell mais »está possuída por um demônio que deve ser exorcizado
 antes que uma tragédia inimaginável aconteça. Cotton permite que seu último exorcismo seja filmado para a realização de um documentário.
 Mas ao chegar à fazenda da família ele se surpreende ao perceber que nada se compara ao verdadeiro mal que encontra lá. Agora tarde demais 
para voltar as crenças do reverendo Marcus ficam abaladas até o âmago quando ele e a equipe de filmagem precisam encontrar uma maneira de 
salvar Nell e salvarem-se também antes que seja tarde demais.',NULL);

INSERT INTO FILME VALUES(5,21,5,' RESIDENT EVIL 4:RECOMEÇO 3D','Em um mundo devastado por um vírus mortal Alice continua 
sua jornada para encontrar e proteger os poucos sobreviventes que restaram. Lutando contra a Umbrella a guerra se torna mais 
violenta e ela recebe ajuda inesperada de uma velha amiga.O único mais »lugar que ainda permace aparentemente seguro é Los Angeles 
até que a cidade é invadida por milhares de zumbis que trarão terror aos poucos vivos que ainda restam Alice está prestes a entrar 
em uma armadilha morta',NULL);

-- Inserindo dados na tabela SESSAO
INSERT INTO sessao VALUES (1, 1,102, 1, 1, 2, 1, 12.45);
INSERT INTO sessao VALUES (2, 2, 103, 2, 3, 3, 2, 45.98);
INSERT INTO sessao VALUES (3,2, 111, 3, 4, 4, 3, 35.56);
INSERT INTO sessao VALUES (4,3,112,5,5,5,4, 34.98);
INSERT INTO sessao VALUES (5, 2, 113, 4, 5, 6,5, 24.50);
INSERT INTO sessao VALUES (6,4,121,5,6,7,6, 39.00);
INSERT INTO sessao VALUES (7, 3, 122, 1, 7,1,7, 45.80);
INSERT INTO sessao VALUES (8, 4, 131, 2, 8, 2,8, 30.00);
INSERT INTO sessao VALUES (9, 2, 132, 3, 3, 4, 1, 12.45);
INSERT INTO sessao VALUES (10,2, 145, 4, 5, 3, 2, 45.67);
 
-- Inserindo dados na tabela INGRESSO
INSERT INTO INGRESSO VALUES(10,1,1,1);
INSERT INTO INGRESSO VALUES(11,2,1,0);
INSERT INTO INGRESSO VALUES(12,3,4,1);
INSERT INTO INGRESSO VALUES(13,4,3,0);
INSERT INTO INGRESSO VALUES(14,5,1,1);
INSERT INTO INGRESSO VALUES(15,6,1,0);
INSERT INTO INGRESSO VALUES(16,7,2,1);
INSERT INTO INGRESSO VALUES(17,8,1,1);
