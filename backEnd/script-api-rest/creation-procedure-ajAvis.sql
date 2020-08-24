CREATE PROCEDURE "DBA"."ajAvis"(in nomP char(30), in bId integer, in avi char(150))

BEGIN
Call sa_set_http_header('Access-Control-Allow-Origin', '*');

	
    INSERT INTO tbAvis (barId, nomPers, avis) VALUES (bId, nomP, avi);
END;

CREATE SERVICE "ajAvis" TYPE 'JSON' AUTHORIZATION OFF USER "DBA" URL ON METHODS 'GET' AS call ajAvis(:nomP,:bId,:avi);

create procedure "DBA"."getAvis"(in bId integer)
begin
call sa_set_http_header('Content-Type', 'application:json; charset=utf-8');
select nomPers, avis, barId
from tbAvis
where barId = bId
end;
CREATE SERVICE "Avis" TYPE 'JSON' AUTHORIZATION OFF USER "DBA" URL ON METHODS 'GET' AS call getAvis(:bId);