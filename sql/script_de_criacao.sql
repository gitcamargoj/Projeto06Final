/* DROPANDO as tabelas na ordem correta por causa dos relacionamentos */

DROP TABLE tb_consulta;
DROP TABLE tb_dentista;
DROP TABLE tb_cliente;
DROP TABLE tb_usuario;

/* Criando a tabela tb_usuario */

CREATE TABLE tb_usuario(
    id_usuario BIGINT not null primary key
        GENERATED ALWAYS AS IDENTITY
        (START WITH 1, INCREMENT BY 1)
    , papel varchar(20) not null
    , nome varchar(200) not null
    , telefone varchar(20) not null
    , login varchar(20) not null
    , hashSenha BIGINT not null
);

/* Criando a tabela tb_dentista */

CREATE TABLE tb_dentista(
    id_dentista BIGINT  primary key
        GENERATED ALWAYS AS IDENTITY
        (START WITH 1, INCREMENT BY 1)
    , cro varchar(8) not null
    , id_usuario  BIGINT not null
);

/* Criando a tabela tb_cliente */

CREATE TABLE tb_cliente(
    id_cliente BIGINT  primary key
        GENERATED ALWAYS AS IDENTITY
        (START WITH 1, INCREMENT BY 1)
    , id_usuario BIGINT not null
);

/* Criando a tabela tb_consulta */

CREATE TABLE tb_consulta(
    id_consulta BIGINT not null primary key
        GENERATED ALWAYS AS IDENTITY
        (START WITH 1, INCREMENT BY 1)
    , hr_inicio date
    , hr_fim date
    , status varchar(50) not null
    , preco DOUBLE PRECISION 
    , obs varchar(200)
    , id_dentista BIGINT not null
    , id_cliente BIGINT not null
);

/* Criando os relacionamentos */

ALTER TABLE tb_dentista ADD constraint fk_dentista_id_usuario Foreign Key (id_usuario) references tb_usuario(id_usuario);
ALTER TABLE tb_cliente ADD constraint fk_cliente_id_usuario Foreign Key (id_usuario) references tb_usuario(id_usuario);
ALTER TABLE tb_consulta ADD constraint fk_consulta_id_dentista Foreign Key (id_dentista) references tb_dentista (id_dentista);
ALTER TABLE tb_consulta ADD constraint fk_consulta_id_cliente Foreign Key (id_cliente) references tb_cliente (id_cliente);

/* Inserindo valores na tabela tb_usuario */

INSERT INTO tb_usuario VALUES
(default, 'ADMIN', 'Administrator','11-75646547', 'admin', 1509442);
INSERT INTO tb_usuario VALUES
(default, 'SECRETÁRIA', 'Dolores Abernathy','13-5467-1234', 'dolores', 1509442);

/* Junior: inserindo alguns papeis */

INSERT INTO tb_usuario VALUES
(default, 'DENTISTA', 'Lee Sizemore','13-98250-4048', 'lee', 1509442);

INSERT INTO tb_dentista VALUES
(default, '30229-SP', 3);

INSERT INTO tb_usuario VALUES
(default, 'DENTISTA', 'Theresa Cullen','12-99680-7078', 'theresa', 1509442);

INSERT INTO tb_dentista VALUES
(default, '15987-SP', 4);

INSERT INTO tb_usuario VALUES
(default, 'SECRETÁRIO', 'Peter Abernathy','13-99680-5058', 'peter', 1509442);

INSERT INTO tb_usuario VALUES
(default, 'CLIENTE', 'Logan Delos','13-3596-3890', 'logan', 1509442);

INSERT INTO tb_usuario VALUES
(default, 'CLIENTE', 'Hector Escaton','13-97504-6788', 'hector', 1509442);

INSERT INTO tb_usuario VALUES
(default, 'CLIENTE', 'Elsie Hughes','11-5555-7070', 'elsie', 1509442);

INSERT INTO tb_usuario VALUES
(default, 'CLIENTE', 'Maeve Millay','11-97888-5650', 'maeve', 1509442);

INSERT INTO tb_usuario VALUES
(default, 'CLIENTE', 'Teddy Flood','11-97888-3030', 'teddy', 1509442);