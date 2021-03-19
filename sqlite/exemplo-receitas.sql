
PRAGMA foreign_keys = ON; -- tem que ligar as chaves estrangeiras
			  -- SQLite caga e anda pra essas parada no default

PRAGMA case_sensitive_like = false; -- ignorar se é maiúscula ou minúscula


--
-- criando as tabelas
--

CREATE TABLE receita(
	id INTEGER PRIMARY KEY AUTOINCREMENT,
	titulo    TEXT NOT NULL
);

CREATE TABLE ingrediente(
	id INTEGER PRIMARY KEY AUTOINCREMENT,
	nome TEXT NOT NULL
);

--
-- tabela de ligação muitos-pra-muitos 
--
CREATE TABLE ingrediente_receita(
	receita_id INTEGER REFERENCES receita(id),
	ingrediente_id INTEGER REFERENCES ingrediente(id),
	PRIMARY KEY (receita_id, ingrediente_id)			
);


-- 
-- meter umas receita qualquer lá
--
INSERT INTO receita (titulo)
VALUES
	("Pastel de Frango"),
	("Pastel de Carne"),
	("Pastel de Queijo"),
	("Pastel de Vidro"),
	("Pastel de Tudo");


-- 
-- meter uns ingredientes
--
INSERT INTO ingrediente (nome)
VALUES
	("Frango"),
	("Carne"), 
	("Queijo"),
	("Vidro"),
	("Massa da Pastel");


--
-- agora tem que associar as caralhas das receita com 
-- os ingredientes. atenção especial pra "pastel de tudo"
--
INSERT INTO ingrediente_receita(receita_id, ingrediente_id) 
VALUES
	(1, 1), -- pastel de frango leva frango.
	(2, 2), -- pastel de carne leva carne...
	(3, 3), -- pastel de queijo etc e tal.
	(4, 4), -- vidro.

	(5, 1), -- pastel de tudo leva frango
	(5, 2), -- e carne
	(5, 3), -- e queijo
	(5, 4), -- e vidro.

	(1, 5), -- todos os pasteis levam massa de pastel.
	(2, 5),
	(3, 5),
	(4, 5),
	(5, 5);
	
-------------------------------------------------------

.print "\nListando todas as receitas: "
SELECT * FROM receita;


.print "\nListando todos os ingredientes: "
SELECT * FROM ingrediente;


.print "\nAchando um ingredientes pelo nome/texto: "
SELECT * FROM ingrediente WHERE nome LIKE '%pastel%';

.print "\nAchando todas as receitas que tem esse ingrediente: "

--
-- explicação abaixo.
--
SELECT receita.id, receita.titulo
FROM   receita

INNER JOIN ingrediente_receita 
ON ingrediente_receita.receita_id = receita.id

INNER JOIN ingrediente         
ON ingrediente.id = ingrediente_receita.ingrediente_id

WHERE ingrediente.id = 5

; -- PONTO E VÍRGULA É O FIM DA QUERY.

/*

É mais fácil entender um JOIN com uma explicação visual.

-> https://www.sqlitetutorial.net/sqlite-inner-join/

*/