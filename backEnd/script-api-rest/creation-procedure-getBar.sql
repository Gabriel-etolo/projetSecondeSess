create PROCEDURE "DBA"."getBarS"()
result(nom char(50), prix char(3), commune char(60))
BEGIN
call sa_set_http_header('Content-Type', 'application:json; charset=utf-8');	
select nom, prix, nCommune
 FROM tbNom
 group by prix
END

CREATE SERVICE "bar" TYPE 'JSON' AUTHORIZATION OFF USER "DBA" URL ON METHODS 'GET' AS call getBar();




create PROCEDURE "DBA"."getBarC"(in nomC char(60))
result(nom char(50), prix char(3), commune char(60))
BEGIN
call sa_set_http_header('Content-Type', 'application:json; charset=utf-8');	
select nom, prix, nCommune
 FROM tbNom
 where nCommune = nomC
END
