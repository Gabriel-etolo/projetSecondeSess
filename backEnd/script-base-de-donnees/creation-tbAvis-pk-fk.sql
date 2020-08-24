creation table "DBA"."tbAvis"(
"avisId" integer not null default autoincrement,
"barId" integer,
"nomPers" char(30),
"avis" char(150),
constraint "pkAvis" primary key ( "avisId" asc)
) in "system";

ALTER TABLE "DBA"."tbAvis" ADD CONSTRAINT "tbAvis_to_tbNom" FOREIGN KEY ( "barId" ASC ) REFERENCES "DBA"."tbNom" ( "nomId" );