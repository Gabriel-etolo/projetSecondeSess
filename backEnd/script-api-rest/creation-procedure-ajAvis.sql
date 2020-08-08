CREATE PROCEDURE "DBA"."ajAvis"(in nomP char(30), in nomB char(50), in avi char(150))

BEGIN
Call sa_set_http_header('Access-Control-Allow-Origin', '*');

	
    INSERT INTO tbAvis (nomBar, nomPers, avis) VALUES (nomB, nomP, avi);
END;

