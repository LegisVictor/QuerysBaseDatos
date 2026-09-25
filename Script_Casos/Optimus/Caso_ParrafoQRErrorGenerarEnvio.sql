--**************************************************************
--*** CASO ERROR POR QR EN GENERACION DE ENVIO.  
--**************************************************************	


https://cpanel.xperta.legis.co/api/vimeo/datalist/protribu

https://xperta.legis.co/qr/86F245AB-6E22-F111-912D-005056A66C05
https://xperta.legis.co/qr/86F245AB-6E22-F111-912D-005056A66C05


/*
Envio: Se ha generado un error, el envío no pudo ser generado. Datos de la Solicitud: 
<Data codproyecto="3249678" codcontenido="laboralbaestudio"></Data>, Object reference not set to an instance of an object.  
  at SAUCE.Server.BLL.Processors.Envio.Main.CodigoQR(String buffer, JObject Data, Boolean putRoot, List`1 listaParrafosEliminados)
   at SAUCE.Server.BLL.Processors.Envio.Main.GenerarEnvio(XmlDocument doc)
   
Se validan las tablas de CONTENIDOPARRAFOQR y obr_recursos si existe o no, posiblemente toque igualar las tablas. 
hash debe quedar en ND para la tabla contenidoparrafo. 


Problema al generar corte: 
Inició el Corte para el contenido: renta codproyecto: 3331595
Se generó un error al intentar generar el corte, Datos de la Solicitud: <Data idtarea="4077639" idcontenido="renta">
</Data>, [LEGIS.UID.DataProviderEx.ExecuteStoredProcedure]-ORA-01422: la recuperación exacta devuelve un número mayor de filas que el solicitado
ORA-06512: en "SPCUSER.SPBORRARPARRAFO", línea 328
ORA-06512: en "SPCUSER.SPELIMINARPARRAFOSBORRADOS", línea 15
ORA-06512: en "SPCUSER.SP_CORTE_LIMPIARCAMBIOS", línea 94
ORA-06512: en línea 1    at LEGIS.UIT.DBMS.Provider.ExecuteStoredProcedureNonQuery(String spname, IDbConnection dbconnection, IDbTransaction trans, IDbDataParameter[] parameterlist)
   at SAUCE.Server.BLL.Processors.Corte.Main.limpiarCambiosContenidoByProyecto(String idcontenido, String codproyecto, String idusuario, Provider p, IDbConnection dbconnection, IDbTransaction dbtransaction)
   at SAUCE.Server.BLL.Processors.Corte.Main.GenenarCorte(XmlDocument doc)

*/
 /*
 Se generó un error al intentar generar el corte, Datos de la Solicitud: <Data idtarea="4078362" idcontenido="laboralba"></Data>, [LEGIS.UID.DataProviderEx.ExecuteStoredProcedure]-ORA-20101: Error al eliminar el parrafo: xlaboralba.9d5a70cef68648598ac12655713a89e8
ORA-06512: en "SPCUSER.SPBORRARPARRAFO", línea 369
ORA-06512: en "SPCUSER.SPELIMINARPARRAFOSBORRADOS", línea 15
ORA-06512: en "SPCUSER.SP_CORTE_LIMPIARCAMBIOS", línea 94
ORA-06512: en línea 1    at LEGIS.UIT.DBMS.Provider.ExecuteStoredProcedureNonQuery(String spname, IDbConnection dbconnection, IDbTransaction trans, IDbDataParameter[] parameterlist)
   at SAUCE.Server.BLL.Processors.Corte.Main.limpiarCambiosContenidoByProyecto(String idcontenido, String codproyecto, String idusuario, Provider p, IDbConnection dbconnection, IDbTransaction dbtransaction)
   at SAUCE.Server.BLL.Processors.Corte.Main.GenenarCorte(XmlDocument doc)
 */
 
 
 -- SOLUCION 
 /*
xrenta.f4598014947849658ee548c4ab3d202f
xrenta.5cdf687a09374bd79eccba3701848dc4
xrenta.ceedf49fdff94b2eb9eea07cf30e7e5d
 
 
a66d909e-33e4-eb11-910d-005056b046fe	xrenta.8856a4ceb3f34944b9b0274307edcd57	xrenta.ceedf49fdff94b2eb9eea07cf30e7e5d	renta	NORMAS DEL DUR. 1625 DE 2016 y RESOLUCIONES QUE REGLAMENTAN AL PROVEEDOR TECNOLÓGICOS, OBLIGACIONES Y SANCIONES
8487BCCA-88BC-EE11-9120-005056A60BFE	xrenta.3f5574b78b744b72b091bf064ebfe16d	xrenta.ceedf49fdff94b2eb9eea07cf30e7e5d	renta	NORMAS DEL DUR. 1625 DE 2016 Y RESOLUCIONES QUE REGLAMENTAN AL PROVEEDOR TECNOLÓGICO, OBLIGACIONES Y SANCIONES
 
 
El codrecurso: a66d909e-33e4-eb11-910d-005056b046fe no existe en la tabla CONTENIDOPARRAFO, se debe eliminar de la tabla CONTENIDOPARRAFOQR, se realiza backup del registro antes de eliminar.
 
INSERT INTO 
"SPCUSER"."CONTENIDOPARRAFOQR" 
("CODRECURSO", "CODPARRAFOINI", "CODPARRAFOFIN", "CODCONTENIDO", "DESCRIPCION", "FLAGENVIO") 
VALUES 
('a66d909e-33e4-eb11-910d-005056b046fe', 'xrenta.8856a4ceb3f34944b9b0274307edcd57', 
'xrenta.ceedf49fdff94b2eb9eea07cf30e7e5d', 'renta', 'NORMAS DEL DUR. 1625 DE 2016 y RESOLUCIONES QUE REGLAMENTAN AL PROVEEDOR TECNOLÓGICOS, OBLIGACIONES Y SANCIONES', '0');
 
*/

--**************************************************************
--*** PROBLEMA 1 - PARRAFOS DUPLICADOS   
--**************************************************************	

-- 1. buscamos los registros duplicados 

SELECT CODPARRAFOini, COUNT(CODPARRAFOini)
	   	FROM CONTENIDOPARRAFOQR WHERE CODCONTENIDO = 'laboralba'
      GROUP BY CODPARRAFOini
      ORDER BY 2 DESC;

SELECT CODPARRAFOFIN, COUNT(CODPARRAFOFIN)
	   	FROM CONTENIDOPARRAFOQR WHERE CODCONTENIDO = 'laboralba'
      GROUP BY CODPARRAFOFIN
      ORDER BY 2 DESC;
	  
-- 2. Luego buscamos los repetidos en la tabla de contenidoparrafo. 

SELECT * FROM CONTENIDOPARRAFO WHERE idcontenido = 'laboralba' AND hash = 'DC92AAFA-835B-EC11-9110-005056B046FE'

-- 3. los que no coincidan se eliminan, hacer un respaldo 

SELECT * FROM  CONTENIDOPARRAFOQR QR WHERE CODCONTENIDO = 'laboral' AND QR.CODRECURSO IN (
'xlaboral.e3090750d5cd44c69fad1bd8d93ebe68'

)

DELETE FROM  CONTENIDOPARRAFOQR QR WHERE CODCONTENIDO = 'empofici' AND QR.CODRECURSO IN (
'728473cc-299e-eb11-9109-005056b046fe'); 


https://xperta.legis.co/qr/86F245AB-6E22-F111-912D-005056A66C05




