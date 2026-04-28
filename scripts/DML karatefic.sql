INSERT INTO academia(federacaoid, nome, cnpj, endereco, telefone) 
VALUES  (1, "Academia Karateca", "65354424785887", "Rua Estrada Coronel Vieira, 104", "21998324562"),
(1, "Academia Regional de Karatê", "97852342458688", "Del Castilho, 700 ", "21991224452"),
(1, "Academia Brasileira de Karatê", "54351424725544", "Estrada Padre Rose, 121", "21996567476"), 
(1, 'Centro de Treinamento Wado Ryu', '88888888000188',
'Avenida Nossa Senhora de Copacabana, 1010 - Copacabana, Rio de Janeiro - RJ', '21944332211'),
(1, 'Dojô Kiai Forte', '99999999000199', 'Rua Conde de Bonfim, 900 - Tijuca, Rio de Janeiro - RJ', '21932109876'),
(1, 'Kyokushin Impacto', '41234574590100', 'Rua Visconde de Pirajá, 550 - Ipanema, Rio de Janeiro - RJ', '21910102020');

select * from academia;

INSERT INTO academia_atleta(academiaid, atletaid, idacademiafederacao, dthrinicio, dthrfim) 
VALUES (1, 1, 1, "2025-10-11 00:00:00", null),
(2, 2, 1, "2025-08-10 21:30:00", null),
(3, 3, 1, "2025-06-01 20:00:00", null), (1, 12, 1, '2022-10-21 18:00:00', null), (2, 13, 1, '2022-10-21 18:00:00', null), 
(3, 14, 1, '2022-10-21 18:00:00', null),
(6, 15, 1, '2022-10-21 18:00:00', null), (5, 16, 1, '2022-10-21 18:00:00', null), (4, 17, 1, '2022-10-21 18:00:00', null),
(5, 18, 1, '2022-10-21 18:00:00', null), (4, 19, 1, '2022-10-21 18:00:00', null), (3, 20, 1, '2022-10-21 18:00:00', null),
(2, 21, 1, '2022-10-21 18:00:00', null), (1, 22, 1, '2022-10-21 18:00:00', null), (2, 23, 1, '2022-10-21 18:00:00', null);


select * from academia_atleta;

INSERT INTO atleta (nome, dt_nasci, cpf)
VALUES ("Raniere Teles Leão", "2004-08-09" , "17720173708"),
("Eduardo da Costa de Carvalho", "2004-10-20" , "23304454709"),
("Luiz da Silva Costa", "2006-01-19" , "17423183708"),
("Fernando Soares Pinehiro", "2005-05-02" , "34728100716"),
("Gabriela Souza Dias", "2005-03-12" , "45910283748"),
("Rafael Gomes Batista", "2006-09-28" , "11122233345"),
("Beatriz Costa Silva", "2004-12-05" , "09876543210"),
("Matheus Lima Ferreira", "2004-06-30" , "55566677788"),
("Juliana Alves Pereira", "2005-09-14" , "78901234567"),
("Guilherme Rocha Santos", "2006-11-21" , "12312312345"),
("Carolina Mendes Gomes", "2004-02-08" , "98765432101"),
('Lorrane dos Santos Araujo Alves', '2005-04-19', '13002713715'),
('Lavinia Ferreia da Costa', '2005-01-21', '13122613702'),
('Bianca Fortinelli', '2005-01-21', '14005756770'),
('Leticia Raimundo de Carvalho', '2005-12-30', '21302743744'),
('Mariana Guerra Pinheiro', '2005-02-07', '13605434705'),
('Vanessa Rodrigues', '2005-03-24', '14652756715'),
('Isabela Binucci', '2005-11-12', '42045713765'),
('Alessandra Cardoso', '2005-06-23', '17523753743'), 
('Maria Eduarda', '2005-10-17', '33042753785'),
('Sofia Almeida', '2005-09-15', '13402313735'),
('Renata Pinto Leite', '2005-08-13', '01012713796'),
('Thaís dos Santos Araujo Alves', '2005-07-14', '95304313720');

select * from atleta;

INSERT INTO federacao(nome, cnpj, telefone, endereco) 
VALUES ("Federação Carioca de Karatê", "00394460005887", "21912345678", "Vicente de Carvalho, 349");

SELECT * from federacao;

INSERT INTO graduacao(graduacao) 
VALUES ("branca"), ("amarela"), ("laranja"), ("verde"), ("azul"), ("roxo"), 
("marrom"), ("preta"), ("preto com vermelho"), ("vermelha e branca");


INSERT INTO graduacao_atleta(graduacaoid, atletaid, dthrinicio, dthrfim) 
VALUES (8, 1, "2024-10-04", null),
(7, 2, "2025-12-24", null),
(6, 3, "2025-01-10", null),   
(5, 4, "2024-11-15", null),  
(4, 5, "2025-05-20", null),  
(3, 6, "2025-08-01", null),   
(2, 7, "2024-12-01", null), (6, 12, '2025-07-19 00:00:00', null), (6, 13, '2025-07-19 00:00:00', null), (6, 14, '2025-07-19 00:00:00', null), 
(6, 15, '2025-07-19 00:00:00', null), (6, 16, '2025-07-19 00:00:00', null), (6, 17, '2025-07-19 00:00:00', null), 
(6, 18, '2025-07-19 00:00:00', null), (6, 19, '2025-07-19 00:00:00', null), (6, 20, '2025-07-19 00:00:00', null),
(6, 21, '2025-07-19 00:00:00', null), (6, 22, '2025-07-19 00:00:00', null), (6, 23, '2025-07-19 00:00:00', null); 



INSERT INTO juiz(idatleta, dthrincio, dthrfim) 
VALUES (2, "2025-12-24 00:00:00", null);

INSERT INTO luta(dthrinicio, idatleta1, idatleta2, idfederacao, vencedor, dthrfim, localidade, descricao) 
VALUES ("2025-10-06 10:00:00", 1, 2, 1, null, "2025-10-06 10:30", "Vicente de Carvalho, 349", 
"O atleta Raniere venceu a luta com um Gyaku-zuki (soco invertido)."),
("2025-10-06 10:40:00", 3, 4, 1, 3, "2025-10-06 11:00:00", "Vicente de Carvalho, 349", null),
("2025-10-06 11:20:00", 5, 6, 1, 6, "2025-10-06 11:40:00", "Vicente de Carvalho, 349", null),
("2025-10-06 14:00:00", 7, 8, 1, null, "2025-10-06 14:20:00", "Vicente de Carvalho, 349", null);

INSERT INTO luta (dthrinicio, idatleta1, idatleta2, idfederacao, vencedor, dthrfim, localidade, descricao) 
VALUES ('2025-12-07 10:00:00', 5, 7, 1, 5, '2025-12-07 10:20:00', 'Estrada Coronel Vieira, 104, RJ - Rio de Janeiro.', null), 
('2025-12-07 10:30:00', 9, 11, 1, 11, '2025-12-07 10:50:00', 'Estrada Coronel Vieira, 104, RJ - Rio de Janeiro.', null),
('2025-12-07 11:00:00', 12, 13, 1, 12, '2025-12-07 11:20:00', 'Estrada Coronel Vieira, 104, RJ - Rio de Janeiro.', null), 
('2025-12-07 11:30:00', 14, 15, 1, 14, '2025-12-07 11:50:00', 'Estrada Coronel Vieira, 104, RJ - Rio de Janeiro.', null), 
('2025-12-07 13:30:00', 16, 17, 1, 16, '2025-12-07 13:50:00', 'Estrada Coronel Vieira, 104, RJ - Rio de Janeiro.', null), 
('2025-12-07 14:00:00', 18, 19, 1, 19, '2025-12-07 14:20:00', 'Estrada Coronel Vieira, 104, RJ - Rio de Janeiro.', null), 
('2025-12-07 14:30:00', 20, 21, 1, 21, '2025-12-07 14:50:00', 'Estrada Coronel Vieira, 104, RJ - Rio de Janeiro.', null), 
('2025-12-07 15:00:00', 22, 23, 1, 23, '2025-12-07 15:20:00', 'Estrada Coronel Vieira, 104, RJ - Rio de Janeiro.', null);

INSERT INTO mestre(idatleta, dthrincio, dthrfim) 
VALUES (1, "2024-10-04 00:00:00", null);

INSERT INTO sexo(sexo) 
VALUES ("masculino"), ("feminino");

INSERT INTO sexo_atleta(atletaid, sexoid, dthrinicio, dthrfim) 
VALUES (1, 1,"2004-08-09", null),
(2, 1, "2004-10-20", null),
(3, 1, "2006-01-19", null),
(4, 1, "2005-05-02", null),
(5, 2, "2005-03-12", null),
(6, 1, "2006-09-28", null),
(7, 2, "2004-12-05", null),
(8, 1, "2004-06-30", null),
(9, 2, "2005-09-14", null),
(10, 1, "2006-11-21", null),
(11, 2, "2004-02-08", null),
(12, 2, '2005-04-19', null), (13, 2, '2005-01-21', null), (14, 2, '2005-01-21', null), (15, 2, '2005-12-30', null), 
(16, 2, '2005-02-07', null), (17, 2, '2005-03-24', null), (18, 2, '2005-11-12', null), (19, 2, '2005-06-23', null), 
(20, 2, '2005-10-17', null), (21, 2, '2005-09-15', null), (22, 2, '2005-08-13', null), (23, 2, '2005-07-14', null);

insert into luta_campeonato (dthrinicio, idcampeonato, idluta, lutadthrinicio, lutaidatleta1, lutaidatleta2, 
lutaidfederacao, dthrfim, vencedor_camp) values ('2025-12-07 10:00:00', 1, );


