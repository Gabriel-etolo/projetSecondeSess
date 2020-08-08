CREATE PROCEDURE "DBA"."getBar"()
result(nom char(50), prix char(3))
BEGIN
call sa_set_http_header('Content-Type', 'application:json; charset=utf-8');	
select nom, prix
 FROM tbNom
 group by prix
END

CREATE SERVICE "bar" TYPE 'JSON' AUTHORIZATION OFF USER "DBA" URL ON METHODS 'GET' AS call getBar();
