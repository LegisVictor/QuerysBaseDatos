--PROBLEMA: No es posible publicar. El contenido se encuentra abierto en modo edición por el usuario: 
--*********************************************************
--ERROR AL PUBLICAR. USUARIO TIENE ABIERTO EN MODO EDICION 
--*********************************************************


--1. CONSULTAR LA OBRA DEBE ESTAR CON FLAGBORRADO EN 1  se revisa en esa tabla que la obra no este en uso si esta en uso se hace el update a flagborrado para que el trigger se ejecute y ya puedan modificar
-- buscamos proyecto
SELECT * FROM proyecto p where UPPER(p.nomproyecto) LIKE upper('%%CARTILLA LABORAL LEGIS Envío 22%') ORDER BY 1 desc;


-- para buscar el usuario 
SELECT "SPCUSER"."USUARIO".*,ROWID "NAVICAT_ROWID" FROM "SPCUSER"."USUARIO" WHERE LOWER("NOMUSUARIO") LIKE '%mauricio%' OFFSET 0 ROWS FETCH NEXT 200 ROWS ONLY

-- buscamos el contenido. 
SELECT * FROM CONTENIDOUSUARIO  WHERE IDCONTENIDO = 'ventas' AND FLAGBORRADO = 0 AND CODPROYECTO IS NOT NULL; 

8642

--2. REALIZAR UPDATE 
 begin
SPResincordinaldiferidoex('laboralba');
end;
	
UPDATE CONTENIDOUSUARIO SET FLAGBORRADO = 1 WHERE IDCONTENIDO = 'civil' AND FLAGBORRADO = 0; 