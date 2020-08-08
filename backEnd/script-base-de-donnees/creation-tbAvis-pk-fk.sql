creation table "DBA"."tbAvis"(
"avisId" integer not null default autoincrement,
"nomBar" char(50),
"nomPers" char(30),
"avis" char(150),
constraint "pkAvis" primary key ( "avisId" asc)
) in "system";

ALTER TABLE "DBA"."tbAvis" ADD CONSTRAINT "tbAvis_to_tbNom" FOREIGN KEY ( "nomBar" ASC ) REFERENCES "DBA"."tbNom" ( "nomBar" );