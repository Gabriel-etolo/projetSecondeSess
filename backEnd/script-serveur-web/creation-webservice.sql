CREATE FUNCTION "DBA"."getPathCREATE PROCEDURE "DBA"."http_getCSS"(in url char(255))
BEGIN
call sa_set_http_header('Content-Type', 'text/css');
Call sa_set_http_header('Access-Control-Allow-Origin', '*');
select xp_read_file(dba.getPath() || 'CSS\' || url);
END;
COMMENT ON PROCEDURE "DBA"."http_getCSS" IS 'fournisseur de fichier .css (sous-répertoire CSS du site)';
CREATE SERVICE "css" TYPE 'RAW' AUTHORIZATION OFF USER "DBA" URL ON METHODS 'GET' AS call dba.http_getCSS(:url);
COMMENT ON SERVICE "css" IS 'service fournisseur de css';
returns long varchar
deterministic
BEGIN
 declare dbPath long varchar;
 declare dbName long varchar;
 set dbPath = (select db_property ('file'));
 set dbName = (select db_property('name')) + '.db';
 set dbPath = left(dbPath, length(dbPath)-length(dbName));
 return dbPath;
 end;
 
 
 
 CREATE PROCEDURE "DBA"."http_getPage"(in url char(255))
 BEGIN
 call sa_set_http_header('Content-Type', 'text/html; charset=utf-8');
 Call sa_set_http_header('Access-Control-Allow-Origin', '*');
 select xp_read_file(dba.getPath() || url || '.html');
 END;
COMMENT ON PROCEDURE "DBA"."http_getPage" IS 'fournisseur de fichier .html (racine du site)';

CREATE PROCEDURE "DBA"."http_getJS"(in url char(255))
BEGIN
call sa_set_http_header('Content-Type', 'application/javascript');
 Call sa_set_http_header('Access-Control-Allow-Origin', '*');
 select xp_read_file(dba.getPath() || 'js\' || url);
 END;
COMMENT ON PROCEDURE "DBA"."http_getJS" IS 'fournisseur de fichier .js (sous répertoire JS du site)';
CREATE SERVICE "js" TYPE 'RAW' AUTHORIZATION OFF USER "DBA" URL ON METHODS 'GET' AS call dba.http_getJS(:url);

CREATE PROCEDURE "DBA"."http_getCSS"(in url char(255))
BEGIN
call sa_set_http_header('Content-Type', 'text/css');
Call sa_set_http_header('Access-Control-Allow-Origin', '*');
select xp_read_file(dba.getPath() || 'CSS\' || url);
END;
COMMENT ON PROCEDURE "DBA"."http_getCSS" IS 'fournisseur de fichier .css (sous-répertoire CSS du site)';
CREATE SERVICE "css" TYPE 'RAW' AUTHORIZATION OFF USER "DBA" URL ON METHODS 'GET' AS call dba.http_getCSS(:url);
COMMENT ON SERVICE "css" IS 'service fournisseur de css';


CREATE PROCEDURE "DBA"."http_getIMG"(in url char(255))
BEGIN
call sa_set_http_header('Content-Type', 'image/png');
Call sa_set_http_header('Access-Control-Allow-Origin', '*');
select xp_read_file(dba.getPath() || 'IMG\' || url);
END;
COMMENT ON PROCEDURE "DBA"."http_getIMG" IS 'fournisseur de fichier graphique (sous-répertoire IMG du site)';
CREATE SERVICE "img" TYPE 'RAW' AUTHORIZATION OFF USER "DBA" URL ON METHODS 'GET' AS call dba.http_getIMG(:url);
