use karatefic;

select * from atleta_sexo_graduacao;

select 
a.nome, a.id, s.sexo
from atleta a 
inner join sexo_atleta sa on sa.atletaid = a.id
inner join sexo s on s.id = sa.sexoid
where sa.id is not null and s.id = 2
group by a.id, a.nome, s.sexo;

insert into atleta (nome, dt_nasci, cpf) values 
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

desc sexo_atleta; 	

insert into sexo_atleta (atletaid, sexoid, dthrinicio, dthrfim) values 
(12, 2, '2005-04-19', null), (13, 2, '2005-01-21', null), (14, 2, '2005-01-21', null), (15, 2, '2005-12-30', null), 
(16, 2, '2005-02-07', null), (17, 2, '2005-03-24', null), (18, 2, '2005-11-12', null), (19, 2, '2005-06-23', null), 
(20, 2, '2005-10-17', null), (21, 2, '2005-09-15', null), (22, 2, '2005-08-13', null), (23, 2, '2005-07-14', null);

select * from atleta;

desc graduacao_atleta;
select * from graduacao_atleta;
select * from graduacao;

insert into graduacao_atleta (graduacaoid, atletaid, dthrinicio, dthrfim) values 
(6, 12, '2025-07-19 00:00:00', null), (6, 13, '2025-07-19 00:00:00', null), (6, 14, '2025-07-19 00:00:00', null), 
(6, 15, '2025-07-19 00:00:00', null), (6, 16, '2025-07-19 00:00:00', null), (6, 17, '2025-07-19 00:00:00', null), 
(6, 18, '2025-07-19 00:00:00', null), (6, 19, '2025-07-19 00:00:00', null), (6, 20, '2025-07-19 00:00:00', null),
(6, 21, '2025-07-19 00:00:00', null), (6, 22, '2025-07-19 00:00:00', null), (6, 23, '2025-07-19 00:00:00', null);

insert into academia_atleta (academiaid, atletaid, idacademiafederacao, dthrinicio, dthrfim) values 
(1, 12, 1, '2022-10-21 18:00:00', null), (2, 13, 1, '2022-10-21 18:00:00', null), (3, 14, 1, '2022-10-21 18:00:00', null),
(6, 15, 1, '2022-10-21 18:00:00', null), (5, 16, 1, '2022-10-21 18:00:00', null), (4, 17, 1, '2022-10-21 18:00:00', null),
(5, 18, 1, '2022-10-21 18:00:00', null), (4, 19, 1, '2022-10-21 18:00:00', null), (3, 20, 1, '2022-10-21 18:00:00', null),
(2, 21, 1, '2022-10-21 18:00:00', null), (1, 22, 1, '2022-10-21 18:00:00', null), (2, 23, 1, '2022-10-21 18:00:00', null);

insert into academia (federacaoid, nome, cnpj, endereco, telefone) values 
(1, 'Centro de Treinamento Wado Ryu', '88888888000188',
'Avenida Nossa Senhora de Copacabana, 1010 - Copacabana, Rio de Janeiro - RJ', '21944332211'),
(1, 'Dojô Kiai Forte', '99999999000199', 'Rua Conde de Bonfim, 900 - Tijuca, Rio de Janeiro - RJ', '21932109876'),
(1, 'Kyokushin Impacto', '41234574590100', 'Rua Visconde de Pirajá, 550 - Ipanema, Rio de Janeiro - RJ', '21910102020');

desc academia_atleta;
select * from academia;

INSERT INTO luta (dthrinicio, idatleta1, idatleta2, idfederacao, vencedor, dthrfim, localidade, descricao) 
VALUES ('2025-12-07 10:00:00', 5, 7, 1, 5, '2025-12-07 10:20:00', 'Estrada Coronel Vieira, 104, RJ - Rio de Janeiro.', null), 
('2025-12-07 10:30:00', 9, 11, 1, 11, '2025-12-07 10:50:00', 'Estrada Coronel Vieira, 104, RJ - Rio de Janeiro.', null),
('2025-12-07 11:00:00', 12, 13, 1, 12, '2025-12-07 11:20:00', 'Estrada Coronel Vieira, 104, RJ - Rio de Janeiro.', null), 
('2025-12-07 11:30:00', 14, 15, 1, 14, '2025-12-07 11:50:00', 'Estrada Coronel Vieira, 104, RJ - Rio de Janeiro.', null), 
('2025-12-07 13:30:00', 16, 17, 1, 16, '2025-12-07 13:50:00', 'Estrada Coronel Vieira, 104, RJ - Rio de Janeiro.', null), 
('2025-12-07 14:00:00', 18, 19, 1, 19, '2025-12-07 14:20:00', 'Estrada Coronel Vieira, 104, RJ - Rio de Janeiro.', null), 
('2025-12-07 14:30:00', 20, 21, 1, 21, '2025-12-07 14:50:00', 'Estrada Coronel Vieira, 104, RJ - Rio de Janeiro.', null), 
('2025-12-07 15:00:00', 22, 23, 1, 23, '2025-12-07 15:20:00', 'Estrada Coronel Vieira, 104, RJ - Rio de Janeiro.', null);

select * from luta;


insert into luta_campeonato (dthrinicio, idcampeonato, idluta, lutadthrinicio, lutaidatleta1, lutaidatleta2, 
lutaidfederacao, dthrfim, vencedor_camp) values ('2025-12-07 09:00:00', 1, 5, '2025-12-07 10:00:00', 5, 7, 1, null, null),
('2025-12-07 09:00:00', 1, 6, '2025-12-07 10:30:00', 9, 11, 1, null, null),
('2025-12-07 09:00:00', 1, 7, '2025-12-07 11:00:00', 12, 13, 1, null, null),
('2025-12-07 09:00:00', 1, 8, '2025-12-07 11:30:00', 14, 15, 1, null, null),
('2025-12-07 09:00:00', 1, 9, '2025-12-07 13:30:00', 16, 17, 1, null, null),
('2025-12-07 09:00:00', 1, 10, '2025-12-07 14:00:00', 18, 19, 1, null, null),
('2025-12-07 09:00:00', 1, 11, '2025-12-07 14:30:00', 20, 21, 1, null, null),
('2025-12-07 09:00:00', 1, 12, '2025-12-07 15:00:00', 22, 23, 1, null, null);



 create view luta_camp_feminino as 
select a1.nome as Nome_Atleta1, s1.sexo as Sexo_Atleta1, a1.dt_nasci 'Data Nasc1',  (YEAR(CURDATE()) - YEAR(a1.dt_nasci)) - 
(DATE_FORMAT(CURDATE(), '%m%d') < DATE_FORMAT(a1.dt_nasci, '%m%d')) AS Idade_Atleta1, 
a2.nome as Nome_Atleta2, s2.sexo as Sexo_Atleta2, 
a2.dt_nasci 'Data Nasc2', (YEAR(CURDATE()) - YEAR(a2.dt_nasci)) - 
(DATE_FORMAT(CURDATE(), '%m%d') < DATE_FORMAT(a2.dt_nasci, '%m%d')) AS Idade_Atleta2, c.tipo_campeonato, a3.nome 'Vencedor(a)',
lc.vencedor_camp

from luta l 

join atleta a1 on a1.id = l.idatleta1
join atleta a2 on a2.id = l.idatleta2
join sexo_atleta sa1 on sa1.atletaid = a1.id 
join sexo s1 on s1.id = sa1.sexoid
join sexo_atleta sa2 on sa2.atletaid = a2.id 
join sexo s2 on s2.id = sa2.sexoid
join luta_campeonato lc on lc.idluta = l.id
join campeonato c on c.id = lc.idcampeonato
left join atleta a3 on a3.id = l.vencedor
where s1.id = 2 and s2.id = 2;

select * from karatefic.luta_camp_feminino;

select * from luta_campeonato;

