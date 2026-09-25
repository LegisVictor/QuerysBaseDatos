-- CASO NOTIFICACIONES NO APARECEN      

-- PASO 0 OBTENER USUARIO 

SELECT * FROM usuario WHERE upper(nomusuario) LIKE upper('%diego montoya%')


-- PASO 1 VERIFICAR QUE EL USUARIO CUMPLE CON ESTA CONSULTA. 
-- GRUPO_BASE_REDACTORES
-- ROLES PERMITIDOS -> <entry name="GRUPO_BASE_REDACTORES" value="1162,773,902,764,748,778,751,784,1042,752,770"/>
 
SELECT MAX(CODROL) as CODROL,CODUSUARIO FROM ROLUSUARIO 

                     JOIN USUARIO U ON (U.ID_USUARIO= CODUSUARIO) 

                     WHERE CODROL IN ({0}) AND U.FLAGACTIVO=1 AND U.FLAGBORRADO=0

                     GROUP BY CODUSUARIO ORDER BY CODUSUARIO


-- REALIZAR UPDATE         
UPDATE   usuario SET flagactivo = 1 WHERE id_usuario in (2769); 


-- EN ALGUNOS CASOS SE DEBE INSERTAR LA NOTIFICACION DE MANERA MANUAL.            
                     

SELECT * FROM NOTIFICACION n WHERE  FECHAINICIO > TO_DATE('2025-10-24 00:12:57', 'YYYY-MM-DD HH24:MI:SS');


SELECT * FROM NOTIFICACIONUSUARIO n WHERE CODUSUARIO  = 2769; 



SELECT * FROM NOTIFICACION n 
LEFT JOIN NOTIFICACIONUSUARIO nu ON n.IDNOTIFICACION = nu.CODNOTIFICACION  
WHERE nu.CODUSUARIO   = 2769; 


select * from  CONTENIDOADICIONALVALOR where VALOR like '%%1090%' order by CODFICHA desc;




INSERT INTO NOTIFICACIONUSUARIO (CODNOTIFICACION, CODUSUARIO, ESTADO, FECHAREVISADO) values ('b2b8bf5005e2497598c7c06cd93c88e1', 2769,0,null); 





-- BUSCAR LA COLECCION 
SELECT * FROM COLECCION c2

-- REVISTA RLABORAL 
select c.idcontenido as ID  
, c.nomcontenido as CONTENIDO  
,c.idcontenido as GUID  
,VALOR  , CAV.CODFICHA 
--,substr(valor,INSTR(valor,'/',1,1)+1,4) as ANYO  
,to_number(substr(valor,INSTR(valor,'/',1,1)+1,4)) as CODANYO  
, 'Revista No. ' || lower(substr(valor,0,INSTR(valor,'/',1,1)-1)) as REVISTA  
--,to_number(substr(valor,0,INSTR(valor,',',1,1))) as CODREVISTA  
,c.nomcontenido as nombrenormalizado  
--,nvl(c.fechadisponibilidad,sysdate-3000) as creacion  
from contenido c inner join clasificacioncontenido clc on c.codtipocontenido = clc.idclasificacioncontenido and c.codparrafoinicial is not null   
--AND c.codparrafoinicial <> 3  
inner join contenidoadicionalvalor cav on c.codficha = cav.codficha and cav.codcontenidoadicional in (5111)   
WHERE c.nomcontenido like '%EL ACOSO LABORAL SEXUAL NO CESA CON LA TERMINACIÓN DEL CONTRATO DE TRABAJO%'
order by nombrenormalizado asc