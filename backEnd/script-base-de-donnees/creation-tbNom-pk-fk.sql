create table "DBA"."tbNom"(
"nomId" integer not null default AUTOINCREMENT ,
"nom" char(50),
"nCommune" char(60),
"prix" char(3),
constraint "pkNom" primary key ("nomId" asc)
) in "system";


ALTER TABLE tbNom
ADD FOREIGN KEY (nomId) REFERENCES tbcoordonnes(nomId);