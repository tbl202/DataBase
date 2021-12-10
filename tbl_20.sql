CREATE TABLE if not exists jgd (
	nick VARCHAR(20),
	email VARCHAR(100),
	nome VARCHAR(100),
	telefone INT,
    psg_nome VARCHAR(45),
    PRIMARY KEY (nick),
    FOREIGN KEY (psg_nome) REFERENCES psg (nome)
);

/*Completo*/
CREATE TABLE if not exists psg( 
	nome VARCHAR(45),
    status_ TINYINT,
	vida INT,
    habilidade VARCHAR(100),
    PRIMARY KEY (nome)
);

CREATE TABLE if not exists ptd(
	id INT auto_increment,
    winner VARCHAR(45),
    jgd_1 VARCHAR(20) NOT NULL,
    jgd_2 VARCHAR(20) NOT NULL,
    PRIMARY KEY (id),
    FOREIGN KEY (jgd_1) REFERENCES jgd (nick),
	FOREIGN KEY (jgd_2) REFERENCES jgd (nick)
);

/*Completo*/
CREATE TABLE if not exists pgt(
	id INT auto_increment,
    pgt VARCHAR(200) NOT NULL,
    PRIMARY KEY (id)
);

/*Completo*/
CREATE TABLE if not exists rpt(
	opcao_ok VARCHAR(200),
    opcao_a VARCHAR(200) NOT NULL,
	opcao_b VARCHAR(200) NOT NULL,
    opcao_c VARCHAR(200) NOT NULL,
    opcao_d VARCHAR(200) NOT NULL,
    pgt_id INT,
    PRIMARY KEY (opcao_ok),
    FOREIGN KEY (pgt_id) REFERENCES pgt (id)
);


/*SELECT q retorna uma tabela que uni pgt e rpt*/
SELECT p.id, p.pgt, r.opcao_ok, r.opcao_a, r.opcao_b, r.opcao_c, r.opcao_d FROM pgt p JOIN rpt r ON (p.id = r.pgt_id) ORDER BY p.id DESC;

