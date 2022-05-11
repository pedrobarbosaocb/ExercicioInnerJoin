CREATE DATABASE Livraria;

USE Livraria;

CREATE TABLE tbl_autores (
	ID_Autor SMALLINT,
	Nome_Autor VARCHAR(40) NOT NULL,
	Sobrenome_Autor VARCHAR(60)
	CONSTRAINT pk_ID_Autor PRIMARY KEY (ID_Autor)
);

CREATE TABLE tbl_editoras(
	ID_Editora SMALLINT PRIMARY KEY IDENTITY,
	Nome_Editora VARCHAR(50) NOT NULL
);

CREATE TABLE tbl_livros (
	ID_Livro SMALLINT IDENTITY(100,1),
	Nome_Livro VARCHAR (50) NOT NULL,
	ISBN VARCHAR(30) NOT NULL UNIQUE,
	ID_Autor SMALLINT NOT NULL,
	ID_Editora SMALLINT NOT NULL,
	Data_Pub DATE NOT NULL,
	Preco_Livro MONEY NOT NULL
	CONSTRAINT pk_id_livro PRIMARY KEY (ID_Livro)
	CONSTRAINT fk_ID_Autor FOREIGN KEY (ID_Autor)
	REFERENCES tbl_autores (ID_autor) ON DELETE CASCADE
);


SELECT * FROM tbl_livros;

INSERT INTO tbl_autores(ID_Autor,Nome_Autor, Sobrenome_Autor) 
VALUES (1,'Leonel','Caldela'),
	   (2,'Cecília','Meireles'),
	   (3,'Clarice', 'Lispector'),
	   (4,'Carolina', 'Maria de Jesus');

INSERT INTO tbl_editoras(Nome_Editora) 
VALUES ('DarkSide'),
	   ('Aleph'),
	   ('Companhia das Letras'),
	   ('Rocco'),
	   ('Suma'),
	   ('Intrínseca');

INSERT INTO tbl_livros(Nome_Livro, ISBN, ID_Autor, ID_Editora, Data_Pub, Preco_Livro) 
VALUES ('Livro Ozob Volume 1 – Protocolo Molotov', 8568295045, 1, 1,'02-10-2015', 35.90),
	   ('The Hour Of The Star',					   3567285146, 3, 2,'02-10-2015', 92.33),
	   ('Child Of The Dark',					   9667106148, 4, 3,'01-09-1963', 106.52),
	   ('O Inferno',							   8568295046, 1, 4,'02-10-2015', 35.90),
	   ('Poesia Completa: Cecília Meireles',	   8568295047, 2, 5,'02-10-2011', 124.69),
	   ('Livro Genérico Vol. 1',				   8568395045, 1, 6,'03-10-2015', 15.90),
	   ('Livro Genérico Vol. 2',				   8567295045, 1, 1,'04-10-2015', 35.60);


SELECT tbl_livros.Nome_Livro, tbl_livros.ISBN, tbl_autores.Nome_Autor
FROM tbl_livros
INNER JOIN tbl_autores
ON tbl_livros.ID_Autor = tbl_autores.ID_Autor;

SELECT * FROM tbl_livros;


SELECT tbl_livros.Nome_Livro, tbl_livros.ISBN, tbl_autores.Nome_Autor
FROM tbl_livros
INNER JOIN tbl_autores
ON tbl_livros.ID_Autor = tbl_autores.ID_Autor;


SELECT L.Nome_Livro AS Livros, E.Nome_editora AS Editoras
FROM tbl_livros AS L
INNER JOIN tbl_editoras AS E
ON L.ID_editora = E.ID_editora
WHERE E.Nome_Editora LIKE 'S%';

SELECT L.Nome_Livro AS Livro,
A.Nome_autor AS Autor,
E.Nome_Editora AS Editora,
L.Preco_Livro AS 'Preço do Livro'
FROM tbl_livros L
RIGHT JOIN tbl_autores AS A
ON L.ID_autor = A.ID_autor
RIGHT JOIN tbl_editoras AS E
ON L.ID_editora = E.ID_editora
WHERE E.Nome_Editora LIKE '[a-z]%'
ORDER BY L.Preco_Livro ASC;
