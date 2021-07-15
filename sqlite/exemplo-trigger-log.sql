pragma foreign_keys = ON;

CREATE TABLE lojas (
	id integer PRIMARY KEY autoincrement,
	nome varchar(45),
	endereco varchar(45)
);


CREATE TABLE produtos (
	id integer PRIMARY KEY autoincrement,
	nome varchar(45),
	valor decimal(10, 2),
	descricao varchar(150),

	loja_id int,
	FOREIGN key(loja_id) REFERENCES lojas(id)
);


CREATE TABLE log (
	id integer PRIMARY KEY autoincrement,
	descricao varchar(200)
);


INSERT INTO lojas (nome, endereco)
VALUES ("Matriz", 	"Rua Não Sei, Numero 6502"),
       ("Filial 1", 	"Rua Blips Blops, Número i386");


INSERT INTO produtos (nome, 	valor, 	descricao, 		loja_id)
VALUES ("Pão de Batata", 	7.50, 	"hehehe pão de batata", 1),
       ("Pastel de queijo", 	7.50, 	"hmmm cheese", 		1),
       ("AK-47", 		171.75, "pew pew pew taoquei", 	1),
       ("Xanax", 		17.50, 	"[[mumble rap]]", 	1),
       ("Pó Mágico", 		77.77, 	"aecinho batch", 	1),
       ("Pão de Batata", 	7.50, 	"hehehe pão de batata", 2),
       ("Pastel de queijo", 	7.50, 	"hmmm cheese", 		2),
       ("AK-47", 		171.75, "pew pew pew taoquei", 	2),
       ("Xanax", 		17.50, 	"[[mumble rap]]", 	2),
       ("Pó Mágico", 		77.77, 	"aecinho batch", 	2);


CREATE TRIGGER atualizando_o_endereco 
	AFTER UPDATE ON lojas 
	WHEN old.endereco <> new.endereco 
BEGIN 
	-- salva no log que o endereço mudou no log
	INSERT INTO log (descricao)
	VALUES 
		("loja id ("	|| old.id || 
		") mudou de (" 	|| old.endereco || 
		") para para (" || new.endereco || 
		")"); 

	-- multiplica o preço de tudo na loja
	UPDATE produtos
	SET valor = valor * 2
	WHERE produtos.loja_id = 1; 
END;

-- atualizando o endereço algumas vezes para ativar a TRIGGER

UPDATE lojas SET endereco = "Rua Zero" 	WHERE lojas.id = 1;
UPDATE lojas SET endereco = "Qualquer Rua aí" 	WHERE lojas.id = 1;
UPDATE lojas SET endereco = "Outra rua só de zoa"  WHERE lojas.id = 1;


.print "O endereço da primeira loja mudou três vezes" 
.print "A cada mudança o valor dos preços foi multiplicado por 2\n"

SELECT nome, valor FROM produtos WHERE loja_id = 1;

.print "\n-----------------------------------------\n" 


.print "A loja 2 não mudou de endereço, então os preços não foram multiplicados\n"

SELECT nome, valor FROM produtos WHERE loja_id = 2;


.print "\n-----------------------------------------\n" 
.print "E as mudanças de endereço estão salvas na tabela 'log'\n"

SELECT * FROM log;
