create procedure "DBA"."ajIdBar"(nomBar char(50))
begin
Call sa_set_http_header('Access-Control-Allow-Origin', '*'); 
insert into tbAvis(idBar)
select nomId
from tbNom
where tbNom.nom = nomBar;
end;
CREATE SERVICE "Coordonnes" TYPE 'JSON' AUTHORIZATION OFF USER "DBA" URL ON METHODS 'GET' AS call getCoordonnes(:id);
	