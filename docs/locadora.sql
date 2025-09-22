CREATE TABLE modelo (
  codigo int PRIMARY KEY,
  nome varchar(100) NOT NULL UNIQUE 
);

CREATE TABLE carro (
  placa char(7) PRIMARY KEY,
  codigo_modelo int NOT NULL REFERENCES modelo (codigo)
    ON DELETE CASCADE
    ON UPDATE CASCADE
);

CREATE TABLE pessoa (
  cpf char(11) PRIMARY KEY,
  nome varchar(100) NOT NULL
);

CREATE TABLE aluguel (
  cpf char(11) NOT NULL REFERENCES pessoa (cpf) 
    ON DELETE CASCADE
    ON UPDATE CASCADE,
  placa char(7) NOT NULL REFERENCES carro (placa),
  data_locacao date NOT NULL,
  km int NOT NULL DEFAULT 0,
  PRIMARY KEY (cpf, placa, data_locacao)
);