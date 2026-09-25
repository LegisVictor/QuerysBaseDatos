SELECT * FROM COLECCION c2 INNER JOIN contenido c ON c2.CODCONTENIDO = c.IDCONTENIDO 

SELECT * FROM COLECCION c2 WHERE CODCONTENIDO = 'rmercantil'
SELECT * FROM COLECCION c2  WHERE DEFINICION LIKE '%5127%' ; 


select c.idcontenido as ID  
, c.nomcontenido as CONTENIDO  
,c.idcontenido as GUID  
,VALOR  
,substr(valor,INSTR(valor,'/',1,1)+1,4) as ANYO  
,to_number(substr(valor,INSTR(valor,'/',1,1)+1,4)) as CODANYO  
, 'Revista No. ' || lower(substr(valor,0,INSTR(valor,'/',1,1)-1)) as REVISTA  
,to_number(substr(valor,0,INSTR(valor,',',1,1))) as CODREVISTA  
,c.nomcontenido as nombrenormalizado  
,nvl(c.fechadisponibilidad,sysdate-3000) as creacion  
from contenido c inner join clasificacioncontenido clc on c.codtipocontenido = clc.idclasificacioncontenido and c.codparrafoinicial is not null   
AND c.codparrafoinicial <> 3  
inner join contenidoadicionalvalor cav on c.codficha = cav.codficha and cav.codcontenidoadicional in (5109)   
order by ANYO asc, CODREVISTA asc
, case when Regexp_like(valor, ' (ene\.|enero)', 'i') then 1
  when Regexp_like(valor, ' (feb\.|ferbrero)', 'i') then 2
  when Regexp_like(valor, ' (mar\.|marzo)', 'i') then 3
  when Regexp_like(valor, ' (abr\.|abril)', 'i') then 4
  when Regexp_like(valor, ' (may\.|mayo)', 'i') then 5
  when Regexp_like(valor, ' (jun\.|junio)', 'i') then 6
  when Regexp_like(valor, ' (jul\.|julio)', 'i') then 7
  when Regexp_like(valor, ' (ago\.|agosto)', 'i') then 8
  when Regexp_like(valor, ' (sep\.|septiembre)', 'i') then 9
  when Regexp_like(valor, ' (oct\.|octubre)', 'i') then 10
  when Regexp_like(valor, ' (nov\.|noviembre)', 'i') then 11
  when Regexp_like(valor, ' (dic\.|diciembre)', 'i') then 12
  else 0 end
, nombrenormalizado asc










select c.idcontenido as ID  
, c.nomcontenido as CONTENIDO  
,c.idcontenido as GUID  
,VALOR  
,substr(valor,INSTR(valor,'/',1,1)+1,4) as ANYO  
,to_number(substr(valor,INSTR(valor,'/',1,1)+1,4)) as CODANYO  
, 'Revista No. ' || lower(substr(valor,0,INSTR(valor,'/',1,1)-1)) as REVISTA  
,to_number(substr(valor,0,INSTR(valor,',',1,1)-1)) as CODREVISTA  
,c.nomcontenido as nombrenormalizado  
,nvl(c.fechadisponibilidad,sysdate-3000) as creacion  
from contenido c inner join clasificacioncontenido clc on c.codtipocontenido = clc.idclasificacioncontenido and c.codparrafoinicial is not null   
AND c.codparrafoinicial <> 3  
inner join contenidoadicionalvalor cav on c.codficha = cav.codficha and cav.codcontenidoadicional in (5109)   
order by ANYO ASC, CODREVISTA asc
, case when Regexp_like(valor, ' (ene\.|enero)', 'i') then 1
  when Regexp_like(valor, ' (feb\.|ferbrero)', 'i') then 2
  when Regexp_like(valor, ' (mar\.|marzo)', 'i') then 3
  when Regexp_like(valor, ' (abr\.|abril)', 'i') then 4
  when Regexp_like(valor, ' (may\.|mayo)', 'i') then 5
  when Regexp_like(valor, ' (jun\.|junio)', 'i') then 6
  when Regexp_like(valor, ' (jul\.|julio)', 'i') then 7
  when Regexp_like(valor, ' (ago\.|agosto)', 'i') then 8
  when Regexp_like(valor, ' (sep\.|septiembre)', 'i') then 9
  when Regexp_like(valor, ' (oct\.|octubre)', 'i') then 10
  when Regexp_like(valor, ' (nov\.|noviembre)', 'i') then 11
  when Regexp_like(valor, ' (dic\.|diciembre)', 'i') then 12
  else 0 end
, nombrenormalizado ASC;
 
 
 

 SELECT * FROM CONTENIDOADICIONALVALOR c
INNER JOIN CONTENIDOADICIONAL c2  ON c.CODCONTENIDOADICIONAL =c2.IDCONTENIDOADICIONAL 
 WHERE valor  LIKE '%CONCEPTO 322%'

 
 
 
 
 
 -- BUSCAR FICHA  
 
SELECT
	c.idcontenido AS ID,
	c.nomcontenido AS CONTENIDO,
	c.idcontenido AS GUID,
	VALOR ,
	CAV.CODFICHA ,
	cav.codcontenidoadicional ,
	ca.NOMCONTENIDOADICIONAL, 
	clc.*
FROM
	contenido c
INNER JOIN clasificacioncontenido clc ON
	c.codtipocontenido = clc.idclasificacioncontenido
	AND c.codparrafoinicial IS NOT NULL
INNER JOIN contenidoadicionalvalor cav ON
	c.codficha = cav.codficha
	--and cav.codcontenidoadicional in (5111) -- revista laboral 
INNER JOIN contenidoadicional ca ON
	cav.CODCONTENIDOADICIONAL = ca.IDCONTENIDOADICIONAL
WHERE
	UPPER(nomcontenido) LIKE UPPER('%PAUTA LEGAL 1 DE ENERO 5 DE 2026%')


-- LEGCOL 
	SELECT  
   C.IDCONTENIDO AS ID,  
   
   C.NOMCONTENIDO AS CONTENIDO, 
   NVL(C.FECHADISPONIBILIDAD, SYSDATE-3000) AS CREACION, 
   F.FECHAEXPEDICION AS FECHAEXPEDICION, 
   NVL(TO_CHAR(F.FECHAEXPEDICION,'YYYY'),'SIN FECHA') AS ANYO, 
   NVL(EO.NOMENTIDADORIGEN, 'SIN ENTIDAD') AS ENTIDAD, 
   CC1.NOMCLASIFICACIONCONTENIDO AS TIPO, 
   CC2.NOMCLASIFICACIONCONTENIDO AS CLASE , cc2.*
FROM            CONTENIDO C  
     INNER JOIN FICHA F                    ON F.ID_FICHA                   = C.CODFICHA 
     INNER JOIN CLASIFICACIONCONTENIDO CC1 ON CC1.IDCLASIFICACIONCONTENIDO = C.CODTIPOCONTENIDO 
     INNER JOIN CLASIFICACIONCONTENIDO CC2 ON CC2.IDCLASIFICACIONCONTENIDO = CC1.CODCLASIFICACIONCONTENIDO 
     LEFT JOIN  CONTENIDOENTIDADORIGEN CEO ON CEO.CODFICHA                 = C.CODFICHA 
     LEFT JOIN  ENTIDADORIGEN EO           ON EO.IDENTIDADORIGEN           = CEO.CODENTIDADORIGEN 
WHERE     C.CODPARRAFOINICIAL            IS NOT NULL 
	 AND UPPER(nomcontenido) LIKE UPPER('%PAUTA LEGAL%')
      AND C.VERSION                       = 1 
      AND C.CODPARRAFOINICIAL            <> 3 
	  AND C.CODFICHA                      > 0 
      AND CC2.IDCLASIFICACIONCONTENIDO    = 6  /* Norma */ 
      AND CC1.IDCLASIFICACIONCONTENIDO  NOT IN ( 444 /*PROYECTO DE CIRCULAR EXTERNA*/, 562 /*PROYECTO DE LEY*/, 563 /*PROYECTO DE DECRETO*/, 564 /*PROYECTO DE RESOLUCIÓN*/, 1052 /*PROYECTO DE ACTO LEGISLATIVO*/, 1053 /*PROYECTO DE ACUERDO*/, 1054 /*PROYECTO DE DECRETO*/, 1055 /*PROYECTO DE LEY*/, 1056 /*PROYECTO DE LEY ESTATUTARIA*/, 1057 /*PROYECTO DE RESOLUCIÓN*/ ) 
ORDER BY CLASE ASC, TIPO ASC, ENTIDAD ASC, FECHAEXPEDICION DESC, CONTENIDO DESC;





1. BUSCAR EN LA TABLA CONTENIDO EL ID_FICHA RELACIONADO A LA FICHA O OBRA, 

SELECT * FROM contenido WHERE IDCONTENIDO IN ( '70962d8837d646f583f5c2cbe4c3b9b3')	


SELECT * FROM FICHA WHERE ID_FICHA IN (1139232,1139259)

2. BUSCAR EL CONTENIDOADICIONALVALOR 
SELECT  v.* FROM CONTENIDOADICIONALVALOR v WHERE CODFICHA = 1109455 AND CODCONTENIDOADICIONAL =5108; 

