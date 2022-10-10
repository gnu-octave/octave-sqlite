PRAGMA foreign_keys = ON;
CREATE TABLE Authors (
	AuthorId INTEGER PRIMARY KEY AUTOINCREMENT,
	FirstName VATCHAR(100) NOT NULL,
	MiddleName VARCHAR(60) NULL,
	LastName VARCHAR(100) NULL
);
CREATE TABLE Books (
	ISBN VARCHAR(13) PRIMARY KEY,
	Title TEXT NOT NULL,
	Edition INTEGER NULL
);
CREATE TABLE AuthorBooks (
	ISBN VARCHAR(13) NOT NULL,
	AuthorId INTEGER NOT NULL,
	PRIMARY KEY(ISBN, AuthorId),
	FOREIGN KEY(ISBN) REFERENCES Books (ISBN),
	FOREIGN KEY(AuthorId) REFERENCES Authors (AuthorId)
);
	
/* some data */
INSERT INTO Authors (FirstName, MiddleName, LastName) VALUES 
('David', NULL, 'Eddings'),
('Robert', NULL, 'Jordan'),
('Raymond', 'E', 'Feist');

INSERT INTO Books (ISBN, Title) VALUES
("9780345500939", "The Elenium"),
("9780345500946", "The Tamuli"),
("9780812511819", "The Eye of the World"),
("9780312851408", "The Great Hunt"),
("9780312852481", "The Dragon Reborn"),
("9780312854317", "The Shadow Rising"),
("9780274900657", "The Fires of Heaven"),
("9780312854287", "Lord of Chaos"),
("9780312857677", "A Crown of Swords");

INSERT INTO AuthorBooks (ISBN, AuthorId) VALUES
('9780345500939', (SELECT AuthorId FROM Authors WHERE FirstName="David" AND LastName="Eddings")),
('9780345500946', (SELECT AuthorId FROM Authors WHERE FirstName="David" AND LastName="Eddings")),
('9780812511819', (SELECT AuthorId FROM Authors WHERE FirstName="Robert" AND LastName="Jordan")),
('9780312851408', (SELECT AuthorId FROM Authors WHERE FirstName="Robert" AND LastName="Jordan")),
('9780312852481', (SELECT AuthorId FROM Authors WHERE FirstName="Robert" AND LastName="Jordan")),
('9780312854317', (SELECT AuthorId FROM Authors WHERE FirstName="Robert" AND LastName="Jordan")),
('9780274900657', (SELECT AuthorId FROM Authors WHERE FirstName="Robert" AND LastName="Jordan")),
('9780312854287', (SELECT AuthorId FROM Authors WHERE FirstName="Robert" AND LastName="Jordan")),
('9780312857677', (SELECT AuthorId FROM Authors WHERE FirstName="Robert" AND LastName="Jordan"));

/* select b.*, a.* from AuthorBooks ab JOIN Authors a ON ab.AuthorId = a.AuthorId JOIN Books b ON ab.ISBN = b.ISBN; */

