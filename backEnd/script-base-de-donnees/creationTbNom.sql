CREATE TABLE tbNom ( 
id INTEGER  not null DEFAULT  AUTOINCREMENT ,
nom VARCHAR(50) not null,
prix VARCHAR (3) not null,
CONSTRAINT pk__tbNom PRIMARY KEY (id)); 