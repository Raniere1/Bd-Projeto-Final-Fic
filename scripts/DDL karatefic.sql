create database karatefic;
use karatefic;

CREATE TABLE academia (
id int(10) NOT NULL AUTO_INCREMENT, 
federacaoid int(10) NOT NULL, 
nome varchar(80) NOT NULL, 
cnpj varchar(14) NOT NULL UNIQUE, 
endereco varchar(100) NOT NULL, 
telefone varchar(11) NOT NULL, 
CONSTRAINT pkacademia PRIMARY KEY (id, federacaoid));

CREATE TABLE academia_atleta (
id int(10) not null AUTO_INCREMENT,
academiaid int(10) NOT NULL, 
atletaid int(10) NOT NULL, 
idacademiafederacao int(10) NOT NULL, 
dthrinicio timestamp NOT NULL, 
dthrfim timestamp NULL, 
CONSTRAINT pkacademiaatleta PRIMARY KEY (id, academiaid, atletaid, idacademiafederacao, dthrinicio));

CREATE TABLE atleta (
id int(10) NOT NULL AUTO_INCREMENT, 
nome varchar(80) NOT NULL, 
dt_nasci date NOT NULL, 
cpf varchar(11) NOT NULL UNIQUE, 
CONSTRAINT pkatleta PRIMARY KEY (id));

CREATE TABLE campeonato (
  id         int(10) NOT NULL AUTO_INCREMENT, 
  tipo_campeonato varchar(25) NOT NULL, 
  CONSTRAINT pkcampeonato PRIMARY KEY (id));

CREATE TABLE federacao (
id int(10) NOT NULL AUTO_INCREMENT, 
nome varchar(80) NOT NULL, 
cnpj varchar(14) NOT NULL UNIQUE, 
telefone varchar(11), 
endereco varchar(100), 
CONSTRAINT pkfederacao PRIMARY KEY (id));

CREATE TABLE graduacao (
id int(10) NOT NULL AUTO_INCREMENT, 
graduacao varchar(20) NOT NULL, 
CONSTRAINT pkgraduacao PRIMARY KEY (id));

CREATE TABLE graduacao_atleta (
id int(10) not null AUTO_INCREMENT,
graduacaoid int(10) NOT NULL, 
atletaid int(10) NOT NULL, 
dthrinicio timestamp NOT NULL, 
dthrfim timestamp NULL, 
CONSTRAINT pkgraduacaoatleta PRIMARY KEY (id, graduacaoid, atletaid, dthrinicio));

CREATE TABLE juiz (
codigo int(10) NOT NULL AUTO_INCREMENT, 
idatleta int(10) NOT NULL, 
dthrincio timestamp NOT NULL, 
dthrfim timestamp NULL, 
CONSTRAINT pkjuiz PRIMARY KEY (codigo, idatleta, dthrincio));

CREATE TABLE luta (
id int(10) NOT NULL AUTO_INCREMENT,
dthrinicio timestamp NOT NULL, 
idatleta1 int(10) NOT NULL, 
idatleta2 int(10) NOT NULL, 
idfederacao int(10) NOT NULL,
vencedor int(10) null, 
dthrfim timestamp NULL, 
localidade varchar(100),
descricao text, 
CONSTRAINT pkluta PRIMARY KEY (id, dthrinicio, idatleta1, idatleta2, idfederacao));

CREATE TABLE luta_campeonato (
  id              int(10) NOT NULL AUTO_INCREMENT,
  dthrincio timestamp not null,
  idcampeonato    int(10) NOT NULL, 
  idluta          int(10) NOT NULL, 
  lutadthrinicio  timestamp NOT NULL, 
  lutaidatleta1   int(10) NOT NULL, 
  lutaidatleta2   int(10) NOT NULL, 
  lutaidfederacao int(10) NOT NULL,
  dthrfim timestamp null,
  vencedor_camp int null,
  constraint pkluta_campeonato
  PRIMARY KEY (id, dthrincio, 
  idcampeonato, 
  idluta, 
  lutadthrinicio, 
  lutaidatleta1, 
  lutaidatleta2, 
  lutaidfederacao));

CREATE TABLE mestre (
matricula int(10) NOT NULL AUTO_INCREMENT, 
idatleta int(10) NOT NULL, 
dthrincio timestamp NOT NULL, 
dthrfim timestamp NULL, 
CONSTRAINT pkmestre PRIMARY KEY (matricula, idatleta, dthrincio));

CREATE TABLE sexo (
id int(10) NOT NULL AUTO_INCREMENT, 
sexo varchar(20), CONSTRAINT 
pksexo PRIMARY KEY (id));

CREATE TABLE sexo_atleta (
id int(10) not null AUTO_INCREMENT,
atletaid int(10) NOT NULL, 
sexoid int(10) NOT NULL, 
dthrinicio timestamp NOT NULL,
dthrfim timestamp NULL, 
CONSTRAINT pkatletasexo PRIMARY KEY (id, atletaid, sexoid, dthrinicio));

ALTER TABLE luta 
ADD CONSTRAINT fk01 FOREIGN KEY (idatleta1) REFERENCES atleta (id);

ALTER TABLE academia 
ADD CONSTRAINT fk012 FOREIGN KEY (federacaoid) REFERENCES federacao (id);

ALTER TABLE luta 
ADD CONSTRAINT fk02 FOREIGN KEY (idatleta2) REFERENCES atleta (id);

ALTER TABLE luta 
ADD CONSTRAINT fk03 FOREIGN KEY (idfederacao) REFERENCES federacao (id);

ALTER TABLE academia_atleta 
ADD CONSTRAINT fk04 FOREIGN KEY (atletaid) REFERENCES atleta (id);

ALTER TABLE academia_atleta 
ADD CONSTRAINT fk05 FOREIGN KEY (academiaid, idacademiafederacao) REFERENCES academia (id, federacaoid);

ALTER TABLE graduacao_atleta 
ADD CONSTRAINT fk06 FOREIGN KEY (atletaid) REFERENCES atleta (id);

ALTER TABLE graduacao_atleta 
ADD CONSTRAINT fk07 FOREIGN KEY (graduacaoid) REFERENCES graduacao (id);

ALTER TABLE sexo_atleta 
ADD CONSTRAINT fk08 FOREIGN KEY (atletaid) REFERENCES atleta (id);

ALTER TABLE sexo_atleta 
ADD CONSTRAINT fk09 FOREIGN KEY (sexoid) REFERENCES sexo (id);

ALTER TABLE mestre 
ADD CONSTRAINT fk10 FOREIGN KEY (idatleta) REFERENCES atleta (id);

ALTER TABLE juiz 
ADD CONSTRAINT fk11 FOREIGN KEY (idatleta) REFERENCES atleta (id);

ALTER TABLE luta_campeonato ADD CONSTRAINT fk13 FOREIGN KEY (idluta, lutadthrinicio, lutaidatleta1, lutaidatleta2, lutaidfederacao) 
REFERENCES luta (id, dthrinicio, idatleta1, idatleta2, idfederacao);

ALTER TABLE luta_campeonato ADD CONSTRAINT fk14 FOREIGN KEY (idcampeonato) REFERENCES campeonato (id);

