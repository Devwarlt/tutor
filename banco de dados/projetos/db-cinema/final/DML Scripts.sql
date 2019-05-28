/*
    UniProjeção - Departamento de Tecnologia da Informação
    Prof. Wanderson Santos

    Disciplina: Banco de Dados 1
    Equipe: André, Vinícius e Nádio
*/
-- query utilizada para listar todos os funcionários com informações importantes (função, funcionário, endereço e telefone):
select
  `funcao`.`DescFUNCAO` as "Função",
  `funcionario`.`NOMEFUNC` as "Funcionário",
  `funcionario`.`ENDFUNC` as "Endereço",
  `funcionario`.`FONE` as "Telefone"
from
  `funcionario`
  inner join `funcao` on `funcionario`.`FUNCAO_IDFUNCAO` = `funcao`.`IDFUNCAO`;
-- query utilizada para listar todos os pedidos com informações importantes (horário, total, pagamento e funcionário):
select
  `pedido`.`DATAHORA` as "Horário",
  `pedido`.`VALORPAGO` as "Total",
  `tipodesconto`.`descTD` as "Pagamento",
  `funcionario`.`NOMEFUNC` as "Funcionário"
from
  `pedido`
  inner join `tipodesconto`,
  `funcionario`
where
  `pedido`.`VALORDESC` = `tipodesconto`.`PERCENTUAL`
  and `pedido`.`FUNCIONARIO_IDFUNCIONARIO` = `funcionario`.`IDFUNCIONARIO`;
-- query utilizada para listar todas as sessões com informações importantes (preço, sala, capacidade, classificação, filme, duração, início, dia da semana e cinema):
select
  `sessao`.`VALOR` as "Preço",
  `tipo`.`DESCTIPO` as "Sala",
  `sala`.`CAPACIDADE` as "Capacidade",
  `classificacao`.`DescCLASSIFICACAO` as "Classificação",
  `filme`.`NOMEFILME` as "Filme",
  `filme`.`TEMPODURACAO` as "Duração",
  `horario`.`HORAINICIO` as "Início",
  `diasemana`.`DescDS` as "Dia da semana",
  `estabelecimento`.`NOMEESTAB` as "Cinema"
from
  `sessao`
  inner join `tipo`,
  `sala`,
  `classificacao`,
  `filme`,
  `horario`,
  `diasemana`,
  `estabelecimento`
where
  `sessao`.`TIPO_IDTIPO` = `tipo`.`IDTIPO`
  and `sessao`.`SALA_IDSALA` = `sala`.`IDSALA`
  and `filme`.`CLASSIFICACAO_IDCLASSIFICACAO` = `classificacao`.`IDCLASSIFICACAO`
  and `sessao`.`FILME_IDFILME` = `filme`.`IDFILME`
  and `sessao`.`HORARIO_IDHORARIO` = `horario`.`IDHORARIO`
  and `sessao`.`DIASEMANA_IDDIASEMANA` = `diasemana`.`IDDIASEMANA`
  and `sessao`.`ESTABELECIMENTO_IDESTABELECIMENTO` = `estabelecimento`.`IDESTABELECIMENTO`;
-- query utilizada para listar todos os filmes com informações importantes (filme, sinopse, duração, gênero e classificação):
select
  `filme`.`NOMEFILME` as "Filme",
  `filme`.`SINOPSE` as "Sinopse",
  `filme`.`TEMPODURACAO` as "Duração",
  `genero`.`descGENERO` as "Gênero",
  `classificacao`.`DescCLASSIFICACAO` as "Classificação"
from
  `filme`
  inner join `genero`,
  `classificacao`
where
  `filme`.`GENERO_IDGENERO` = `genero`.`IDGENERO`
  and `filme`.`CLASSIFICACAO_IDCLASSIFICACAO` = `classificacao`.`IDCLASSIFICACAO`;
-- inserindo novos registros no schema (populando o banco de dados):
insert into
  `funcionario` (`FUNCAO_IDFUNCAO`, `NOMEFUNC`, `ENDFUNC`, `FONE`)
values
  (
    1,
    "Carlos Henrique",
    "Ceilândia Quadra QNP 14 Conjunto U",
    "36233663"
  ),
  (
    2,
    "Silvana Mariane",
    "Samambaia Quadra QR 112",
    "36838072"
  ),
  (
    3,
    "Nelson Lucca",
    "Águas Claras Quadra 107 Rua A",
    "38466832"
  ),
  (
    4,
    "Nicole Natália",
    "Samambaia Quadra QN 417 Conjunto I",
    "36422200"
  ),
  (
    5,
    "Juan Yuri",
    "Park Way Quadra SMPW 13 Conjunto 5",
    "39883907"
  );
insert into
  `funcao` (`DescFUNCAO`)
values
  ("Caixa"),
  ("Segurança"),
  ("Atendente"),
  ("Limpeza"),
  ("Gerente");
insert into
  `tipodesconto` (`descTD`, `PERCENTUAL`)
values
  ("Dinheiro", 20.00),
  ("Cartão àvista", 5.00),
  ("Cartão crédito", 0.00);
insert into
  `pedido` (
    `FUNCIONARIO_IDFUNCIONARIO`,
    `DATAHORA`,
    `VALORTOTAL`,
    `VALORDESC`,
    `VALORPAGO`
  )
values
  (1, "2001-01-03 00:00:00", 100.00, 20.00, 80.00),
  (2, "2001-10-02 00:00:00", 100.00, 5.00, 95.00),
  (3, "2001-12-06 00:00:00", 100.00, 0.00, 100.00),
  (4, "2001-01-25 00:00:00", 100.00, 20.00, 80.00),
  (5, "2001-08-07 00:00:00", 100.00, 5.00, 95.00);
insert into
  `sala` (`CAPACIDADE`)
values
  (25),
  (50),
  (75),
  (100),
  (125);
insert into
  `diasemana` (`IDDIASEMANA`, `DescDS`)
values
  (1, "Domingo"),
  (2, "Segunda-feira"),
  (3, "Terça-feira"),
  (4, "Quarta-feira"),
  (5, "Quinta-feira"),
  (6, "Sexta-feira"),
  (7, "Sábado");
insert into
  `estabelecimento` (
    `NOMEESTAB`,
    `ENDESTAB`,
    `TELEESTAB`,
    `HORAABERTURA`,
    `HORAFECHAMENTO`
  )
values
  (
    "Cinema 1",
    "Ceilândia Sul",
    "33883201",
    "06:00",
    "24:00"
  ),
  (
    "Cinema 2",
    "Ceilândia Sul",
    "33883202",
    "07:00",
    "23:00"
  ),
  (
    "Cinema 3",
    "Samambaia Sul",
    "33883203",
    "08:00",
    "22:00"
  ),
  (
    "Cinema 4",
    "Samambaia Sul",
    "33883204",
    "09:00",
    "21:00"
  ),
  (
    "Cinema 5",
    "Samambaia Norte",
    "33883205",
    "10:00",
    "20:00"
  );
insert into
  `classificacao` (`DescCLASSIFICACAO`)
values
  ("Livre"),
  ("Maiores de 10 anos"),
  ("Maiores de 12 anos"),
  ("Maiores de 14 anos"),
  ("Maiores de 16 anos"),
  ("Maiores de 18 anos");
insert into
  `genero` (`descGENERO`)
values
  ("Ação"),
  ("Aventura"),
  ("Comédia"),
  ("Terror"),
  ("Suspense"),
  ("Drama"),
  ("Documentário"),
  ("Ficção");
insert into
  `horario` (`HORAINICIO`)
values
  ("06:00"),
  ("09:00"),
  ("12:00"),
  ("15:00"),
  ("18:00"),
  ("21:00");
insert into
  `tipo` (`DESCTIPO`)
values
  ("Normal"),
  ("3D");
insert into
  `filme` (
    `GENERO_IDGENERO`,
    `CLASSIFICACAO_IDCLASSIFICACAO`,
    `NOMEFILME`,
    `SINOPSE`,
    `TEMPODURACAO`
  )
values
  (
    8,
    3,
    "Alien, o Oitavo Passageiro",
    "Uma nave espacial, ao retornar para Terra, recebe estranhos sinais vindos de um asteróide. Ao investigarem o local, um dos tripulantes éatacado por um estranho ser. O que parecia ser um ataque isolado se transforma em um terror constante, pois o tripulante atacado levou para dentro da nave o embrião de um alienígena, que não para de crescer e tem como meta matar toda a tripulação.",
    1
  ),
  (
    2,
    2,
    "Aladdin",
    "Um jovem humilde descobre uma lâmpada mágica, com um gênio que pode lhe conceder desejos. Agora o rapaz quer conquistar a moça por quem se apaixonou, mas o que ele não sabe éque a jovem éuma princesa que estáprestes a se noivar. Agora, com a ajuda do Gênio (Will Smith), ele tenta se passar por um príncipe para conquistar o amor da moça e a confiança de seu pai. Classificação indicativa 10 anos, contém violência.",
    2
  ),
  (
    4,
    5,
    "FILHO DAS TREVAS Brightburn",
    "Quando uma criança alienígena cai no terreno de um casal da parte rural dos Estados Unidos, eles decidem criar o menino como seu filho. Porém, ao começar a descobrir seus poderes, ao invés de se tornar um herói para a humanidade, ele passa a aterrorizar a pequena cidade onde vive, se tornando uma força obscura na Terra.",
    1
  ),
  (
    1,
    5,
    "Hellboy",
    "Nova versão da série de filmes sobre Hellboy, um ser de visual diabólico resultado do relacionamento entre um demônio e uma temida feiticeira.",
    2
  ),
  (
    4,
    5,
    "Histórias Estranhas",
    "O horror, o bizarro e o inexplicável se encontram nesta coletânea de oito histórias dirigidas por alguns dos mais promissores diretores de cinema de gênero do Brasil.",
    2
  );
insert into
  `sessao` (
    `TIPO_IDTIPO`,
    `SALA_IDSALA`,
    `FILME_IDFILME`,
    `HORARIO_IDHORARIO`,
    `DIASEMANA_IDDIASEMANA`,
    `ESTABELECIMENTO_IDESTABELECIMENTO`,
    `VALOR`
  )
values
  (1, 1, 1, 1, 1, 1, 50.00),
  (2, 2, 2, 2, 2, 2, 25.00),
  (1, 3, 3, 3, 3, 3, 12.50),
  (2, 4, 4, 4, 4, 4, 37.50),
  (1, 5, 5, 5, 5, 5, 62.50);
insert into
  `ingresso` (
    `PEDIDO_IDPEDIDO`,
    `SESSAO_IDSESSAO`,
    `TIPODESCONTO_IDTIPODESCONTO`,
    `VALEESTACIONAMENTO`
  )
values
  (1, 1, 1, 1),
  (2, 2, 2, 0),
  (3, 3, 3, 1),
  (4, 4, 1, 0),
  (5, 5, 2, 1);