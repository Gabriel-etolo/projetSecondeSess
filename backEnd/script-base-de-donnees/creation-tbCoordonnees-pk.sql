create table "DBA"."tbCoordonnes"(
"nomId" integer not null default autoincrement,
"numTel" char(50),
"mail" char(50),
"nomCommune" char(50),
"site" char(100),
"adresse" char(100),
constraint "pkCoordonnees" primary key ( "nomId" asc)
) in "system";

