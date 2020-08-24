CREATE FUNCTION "DBA"."getPath"()
returns long varchar
deterministic
BEGIN
 declare dbPath long varchar;
 declare dbName long varchar; 
 set dbPath = (select db_property ('file'));       
 set dbName = (select db_property('name')) + '.db'; 
 set dbPath = left(dbPath, length(dbPath)-length(dbName)); 
 return dbPath; // renvoyer path
END;

-----------------------------------------------------------------------------------------------------------------------------------------------------------------------
CREATE PROCEDURE "DBA"."http_getPage"(in url char(255))

BEGIN
    call sa_set_http_header('Content-Type', 'text/html; charset=utf-8'); 
    Call sa_set_http_header('Access-Control-Allow-Origin', '*'); 
	select xp_read_file(dba.getPath() || url || '.html');  
END;
CREATE SERVICE "page" TYPE 'RAW' AUTHORIZATION OFF USER "DBA" URL ON METHODS 'GET' AS call dba.http_getPage(:url);
----------------------------------------------------------------------------------------------------------------------------------------------------------------------
CREATE PROCEDURE "DBA"."http_getJS"(in url char(255))
BEGIN
  call sa_set_http_header('Content-Type', 'application/javascript'); // header http
    Call sa_set_http_header('Access-Control-Allow-Origin', '*'); // pas nécessaire si appels depuis le serveur - dangereux en production
	select xp_read_file(dba.getPath() || 'js\' || url); 
END;

CREATE SERVICE "js" TYPE 'RAW' AUTHORIZATION OFF USER "DBA" URL ON METHODS 'GET' AS call dba.http_getJS(:url);

----------------------------------------------------------------------------------------------------------------------------------------------------------------------

CREATE PROCEDURE "DBA"."http_getCSS"(in url char(255))
BEGIN
  call sa_set_http_header('Content-Type', 'text/css'); 
    Call sa_set_http_header('Access-Control-Allow-Origin', '*'); 
	select xp_read_file(dba.getPath() || 'CSS\' || url); 
END;
CREATE SERVICE "css" TYPE 'RAW' AUTHORIZATION OFF USER "DBA" URL ON METHODS 'GET' AS call dba.http_getCSS(:url);
---------------------------------------------------------------------------------------------------------------------------------------------------------------------

CREATE PROCEDURE "DBA"."http_getIMG"(in url char(255))
BEGIN
  call sa_set_http_header('Content-Type', 'image/png'); 
    Call sa_set_http_header('Access-Control-Allow-Origin', '*'); 
	select xp_read_file(dba.getPath() || 'IMG\' || url);
END;
CREATE SERVICE "img" TYPE 'RAW' AUTHORIZATION OFF USER "DBA" URL ON METHODS 'GET' AS call dba.http_getIMG(:url);
