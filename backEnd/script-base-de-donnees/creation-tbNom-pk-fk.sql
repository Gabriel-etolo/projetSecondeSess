create table "DBA"."tbNom"(
"nomId" integer not null default AUTOINCREMENT ,
"nom" char(50),
"nCommune" integer not null default 1000,
"prix" char(3),
constraint "pkNom" primary key ("nomId" asc)
) in "system";

CONSTRAINT pk__tbNom__tbCoordonnes FOREIGN KEY ( nomId ) REFERENCES tbCoodonnes ( nomId )

ALTER TABLE tbNom
ADD FOREIGN KEY (nomId) REFERENCES tbavis(idBar);