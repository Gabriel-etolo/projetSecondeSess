create PROCEDURE "DBA"."getCoordonnees" (in nId interger)
    result ( nTel char(50), bEmail char(50), bsite char(100), badresse char(100))
	BEGIN
   call sa_set_http_header('Content-Type', 'application:json; charset=utf-8');	
	select numTel, mail, site, adresse, nomId 
	From tbCoordonnes
	WHERE nomId = nId
	END
CREATE SERVICE "coordonnes" TYPE 'JSON' AUTHORIZATION OFF USER "DBA" URL ON METHODS 'GET' AS call getCoordonnees(:nId);