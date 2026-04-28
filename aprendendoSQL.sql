CREATE TABLE IF NOT EXISTS cliente (
  id SERIAL PRIMARY KEY;
  nome VARCHAR(100) NOT NULL;
  email VARCHAR (255) UNIQUE NOT NULL;
  status VARCHAR (20) DEFAULT 'ativo';
  limite NUMERIC (10,2) CHECK (limite >= 0);
  criado_em TIMESTAMPTZ DEFAULT NOW ()
);

-- Primeiro criamos a tabela pai 
CREATE TABLE IF NOT EXISTS  autores (
  id SERIAL PRIMARY KEY; 
  nome VARCHAR(100) NOT NULL
);

--Depois a tabela filha (que faz referencia)
CREATE TABLE IF NOT EXISTS livros (
  id SERIAL PRIMARY KEY;
  titulo VARCHAR (150) NOT NULL;
  preco NUMERCIC(10,2) NOT NULL; 
  autor_id INTEGER REFERENCES autores(id) ON DELETE RESTRICT
);

ALTER TABLE livros ADD CONLUMN paginas INTERGER;
ALTER TABLE livros DROP COLUMN paginas ;
ALTER TABLE livros ALTER COLUMN titulo TYPE VARCHAR (200);
ALTER TABLE livros ADD CONSTRAINT chk_preco CHECK (preco > 0 );

--ERRADO--
CREATE TABLE consultas (
    id INTEGER ,
    paciente VARCHAR (100),
    medico VARCHAR (100),
    data_consulta timestamp,
    valor real,
    status varchar(50)
);

--CERTO--
CREATE TABLE consultas if not exists(
  id serial primary key;
  paciente varchar(100) not null ;
  medico varchar(100) not null;
  data_consulta timestamptz ;
  valor decimal;
  status varchar(50)
);
