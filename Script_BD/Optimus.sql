/****** Script for SelectTopNRows command from SSMS  ******/
SELECT TOP (1000) [IDHISTORICOCONTENIDONORMA]
      ,[CODCONTENIDONORMA]
      ,[CODPARRAFOARTICULO]
      ,[NOMBREARTICULO]
      ,[FECHACREACION]
      ,[CODUSUARIO]
      ,[FECHAINICIOVIGENCIA]
      ,[FECHAFINVIGENCIA]
      ,[CONTEXTOARBOL]
      ,[ACTUAL]
      ,[TIENECAMBIO]
  FROM [LPP_HISTORICO_NORMAS].[dbo].[HistoricoContenidoNorma] where CODCONTENIDONORMA in  (703)-- and NOMBREARTICULO = '600'
    and xml like '%<TABLE width="%[%]%<tr%<td%</td%<td%</td%<td%</td%<td%</td%</tr%'


ALTER SESSION SET CURRENT_SCHEMA = "SPCUSER";
-- ***********************************************************************************
-- ESTATUTO
-- ***********************************************************************************
/****** Script for SelectTopNRows command from SSMS  ******/
SELECT 
      REPLACE([RECURSOS_DATA], 'estatuto', 'estatuto2022')
      
      ,REPLACE([RECURSOS_CONTENT_OPTIMUS], 'estatuto', 'estatuto2022')
      ,REPLACE([RECURSOS_KEY_OPTIMUS], 'estatuto', 'estatuto2022')

  
  FROM [legisxperta].[dbo].[OBR_RECURSOS] 
  where RECURSOS_ID  IN ('D5F7E46B-7175-EC11-9111-005056B046FE','F1D36BB4-7175-EC11-9111-005056B046FE','8C93CD28-7275-EC11-9111-005056B046FE','3D9A5063-7275-EC11-9111-005056B046FE',
'4D9114DA-7275-EC11-9111-005056B046FE','A984622D-7375-EC11-9111-005056B046FE','DEF7B798-7375-EC11-9111-005056B046FE','25C8CB35-7475-EC11-9111-005056B046FE','9B920BFA-7575-EC11-9111-005056B046FE')


/****** Script for SelectTopNRows command from SSMS  ******/
UPDATE [legisxperta].[dbo].[OBR_RECURSOS]  SET  
     RECURSOS_DATA = REPLACE(RECURSOS_DATA, 'estatuto', 'estatuto2022'),
	 RECURSOS_CONTENT_OPTIMUS = REPLACE(RECURSOS_CONTENT_OPTIMUS, 'estatuto', 'estatuto2022'),
     RECURSOS_KEY_OPTIMUS = REPLACE(RECURSOS_KEY_OPTIMUS, 'estatuto', 'estatuto2022')
 where RECURSOS_CONTENT_OPTIMUS = 'estatuto' AND RECURSOS_ID = '4C788893-7575-EC11-9111-005056B046FE';

/****** Script for SelectTopNRows command from SSMS  ******/
SELECT TOP (1000) [RECURSOS_ID]
      ,[RECURSOS_DATA]
      ,[RECURSOS_TYPE]
      ,[RECURSOS_CONTENT_OPTIMUS]
      ,[RECURSOS_KEY_OPTIMUS]
      ,[RECURSOS_USER_OPTIMUS]
      ,[RECURSOS_FECHA]
  FROM [legisxperta].[dbo].[OBR_RECURSOS] where RECURSOS_CONTENT_OPTIMUS = 'estatuto' AND RECURSOS_ID = '4C788893-7575-EC11-9111-005056B046FE'



-- ***********************************************************************************
-- PRIMERO BUSCAR EL PROYECTO 
-- ***********************************************************************************
SELECT * FROM proyecto p where UPPER(p.nomproyecto) LIKE '%CIRCULAR REGLAMENTARIA EXTERNA 152 DE DICIEMBRE 14 DE 2018%' ORDER BY 1 desc;
SELECT * FROM proyecto p where p.CODEXTERNOTEXTO ='procivilbasicoest' order by p.ID_PROYECTO desc;
SELECT * FROM proyecto p WHERE id_proyecto IN (3255188,3255189)

SELECT * FROM contenido WHERE IDCONTENIDO = 'cgdisciplinario'

SELECT * FROM USUARIO WHERE ID_USUARIO IN   (9165,481); --natachaa

SELECT * FROM usuario WHERE nomusuario LIKE '%Helen%' 
--754
--749 -- elizabeth
--9125 -- Sebastian Herrera
--968 -- Alejandra Urrego


SELECT * FROM CONTENIDOUSUARIO WHERE CODPROYECTO  IN ('3082496') 

-- ***********************************************************************************
-- SEGUNDO BUSCAR LA ETAPA 
-- ***********************************************************************************

SELECT * FROM  etapa e where e.id_etapa IN (3695210,3695206) 
AND e.codproyecto=3237100  order by id_etapa desc;

SELECT * FROM  tarea t where t.CODUSUARIO = 754 ORDER BY ID_TAREA DESC --t.codetapa IN (3660323);

SELECT * FROM  TAREADELEGACION  t WHERE t.codetapa IN (3660643,3660608);


SELECT T.*, '  -- -- ETAPA   ' ,E.*, '  -- -- PROYECTO   ', P.* 
FROM PROYECTO p 
INNER JOIN ETAPA e ON p.ID_PROYECTO = e.CODPROYECTO 
INNER JOIN TAREA t ON t.CODETAPA = e.ID_ETAPA 
--INNER JOIN DOCUMENTOTAREA d  ON t.ID_TAREA = d.CODTAREA 
--INNER JOIN DOCUMENTO d2 ON d2.ID_DOCUMENTO = d.CODDOCUMENTO 
--INNER JOIN USUARIO u ON u.ID_USUARIO = t.CODUSUARIO 
WHERE P.ID_PROYECTO =3217810 --AND
--E.ALIAS = 'MO' AND
--T.ID_TAREA IN (3774577) -- AND T.CODUSUARIO = 8863 
ORDER BY E.ID_ETAPA DESC;


SELECT * FROM PLANTILLAFLUJO p WHERE PLANTILLAXML = '\2464feac013c904bfd09dff00c50117d18b3.icn';


SELECT * FROM CONTENIDOFLUJO c 


SELECT rl.ID_ROL, rl.NOMROL, u.NOMUSUARIO, u.SAMACCOUNTNAME, rl.*
FROM usuario u  
INNER JOIN ROLUSUARIO r  ON r.CODUSUARIO = u.ID_USUARIO
INNER JOIN ROL rl ON rl.ID_ROL = r.CODROL 
---INNER JOIN ROLTAREA rt ON rt.CODROLDESTINO = rl.ID_ROL 
WHERE id_usuario IN (968,  764, 754, 1306)



SELECT p.ID_PLANTILLAFLUJO , p.NOMPLANTILLAFLUJO , rt.*
FROM PLANTILLAFLUJO p INNER JOIN ROLTAREA rt ON rt.CODPLANTILLAFLUJO = p.ID_PLANTILLAFLUJO 



-- ***********************************************************************************
-- ELIMINAR ETAPAS, TAREAS, TAREADELEGACION 
-- ***********************************************************************************

-- DELETE FROM  etapa e where e.id_etapa = 3661590 AND e.codproyecto=3237100;

-- DELETE FROM  tarea t WHERE t.codetapa = 3661590;

-- DELETE FROM TAREADELEGACION  t WHERE t.codetapa IN (3660643,3660608);

-- ***********************************************************************************
-- SELECT ACTIVAR LA TAREA. 
-- ***********************************************************************************

SELECT * FROM  etapa e where  e.codproyecto=3238303  order by id_etapa desc;

SELECT * FROM  etapa e where  e.ID_ETAPA=3660605  order by id_etapa desc;

SELECT * FROM  tarea t WHERE ID_TAREA IN (3799821, 3799826);

SELECT * FROM TAREAAVANCE t WHERE CODTAREA IN (3758370)

SELECT * FROM  TAREADELEGACION  t WHERE t.codetapa IN (3660605);

-- ***********************************************************************************
-- UPDATE PARA ACTIVAR LA TAREA. 
-- ***********************************************************************************

 --UPDATE TAREA SET FECHACERRADA = NULL, FLAGCERRADA = 0, CODUSERCLOSE = NULL, FLAGESCALADO = 0  WHERE ID_TAREA = 3758053;
 --UPDATE ETAPA SET FECHAFIN = NULL, SALIDA =  NULL, FLAGPENDIENTE = 0 WHERE ID_ETAPA = 3660323;


-- UPDATE TAREA SET CODUSUARIO = 481 WHERE ID_TAREA IN (3797001);

**************************************************************
*** CASO: CAMBIOS PENDIENTES EN UNA OBRA
**************************************************************

SELECT * FROM CONTENIDOCONTROLCAMBIOS WHERE IDcontenido = 'cgpbasicoested14';

SELECT * FROM CONTENIDOPARRAFOCAMBIO WHERE CODPROYECTO  = '3249678'

SELECT *
FROM CONTENIDOPARRAFO CP
WHERE (CP.FLAGNUEVO = 1 OR CP.FLAGMODIFICADO = 1)
AND CP.IDCONTENIDO = 'doctri'
AND CP.FLAGBORRADO = 0
AND REGEXP_LIKE(CP.XML,
'(<\?(xm-insertion_mark_start|xm-deletion_mark)(\s*|\s+[^>]+)\sauthor=\s*"(.*?)")',
'i')
; 

UPDATE CONTENIDOPARRAFO
SET XML = REGEXP_REPLACE(XML,
'(<\?xm-insertion_mark_start\s.*?\?>)|(<\?xm-insertion_mark_end\s*\?>)|(<\?xm-deletion_mark\s.*?\?>)',
'')
WHERE IDCONTENIDO = 'doctri'  AND  id = 'xdoctri.77699668ade247fe833d449be677510a';


UPDATE CONTENIDOCONTROLCAMBIOS
SET FLAGBORRADO = 1
WHERE IDCONTENIDO = 'doctri' AND  id = 'xdoctri.77699668ade247fe833d449be677510a';

UPDATE CONTENIDOPARRAFOCAMBIO SET USUARIOREVISION = 764, FECHAREVISION = sysdate WHERE CODPROYECTO = '3082490' AND  CODPARRAFO = 'xdoctri.77699668ade247fe833d449be677510a';

UPDATE CONTENIDOPARRAFO
SET XML = REGEXP_REPLACE(XML,
'(<\?xm-insertion_mark_start\s.*?\?>)|(<\?xm-insertion_mark_end\s*\?>)|(<\?xm-deletion_mark\s.*?\?>)',
'')
WHERE IDCONTENIDO = 'doctri' ;


UPDATE CONTENIDOCONTROLCAMBIOS
SET FLAGBORRADO = 1
WHERE IDCONTENIDO = 'doctri' ;

UPDATE CONTENIDOPARRAFOCAMBIO SET USUARIOREVISION = 764, FECHAREVISION = sysdate WHERE CODPROYECTO = '3082490' ;




xdoctri.659a6e4787b64551a274a579b983d702


SELECT COUNT( *)  
FROM CONTENIDOPARRAFO CP
WHERE  CP.IDCONTENIDO = 'doctri'
AND CP.FLAGBORRADO = 2

; 


SELECT * FROM CONTENIDOPARRAFO c  WHERE ID = 'xdoctri.d7fc8a95a6dc4cd9aaa9bf555618b58d'


SELECT * FROM CONTENIDOPARRAFO c WHERE COD

**************************************************************
*** CASO: CREACION DE OBRAS EN CPANEL VALIDACION EN BASE DE DATOS QUERYS. 
**************************************************************

SELECT * FROM ALIASOBRA WHERE ALIAS = 'estatuto2022'

SELECT * FROM contenido  WHERE IDCONTENIDO = 'nifgrupo3'

SELECT * FROM CONTENIDOTRANSFORMADOR WHERE CODCONTENIDO = 'penalbasico2022a'



SELECT alias, DESCRIPCION  FROM ALIASOBRA WHERE ALIAS IN (

'cgpbasico2022a',     
'cgpbasicoested13',   
'civilbasico2022a',   
'civilbasicoested13', 
'constitubasico2022a',
'constitubaested12',  
'comerbasico2022a',   
'comerbasicoested13', 
'laboralbasico2022a',
'laboralbaested13',   
'penalbasico2022a',   
'penalbasicoested13', 'penalbasicoested12',
'constitubaested11'

) ORDER BY ALIAS 
















SELECT * FROM CONTENIDOPARRAFO c WHERE IDCONTENIDO = 'bde3ef5f678942f085abfd6998170c28' AND ORDINAL = 100
SELECT * FROM CONTENIDOPARRAFO c WHERE IDCONTENIDO = 'bde3ef5f678942f085abfd6998170c28' AND ORDINAL = 200



SELECT * FROM CONTENIDOPARRAFO c WHERE IDCONTENIDO = '50a7e518e07f4b4cb872eab68f968638' AND ID  = 'x50a7e518e07f4b4cb872eab68f968638.6a1374cfb1764a3db28e8da6c9f80b90' 
AND FLAGCODIGOINTERNO  = 1 AND GRUPO = '' 
AND ID NOT IN (SELECT ID FROM CONTENIDOCODIGOINTERNO c WHERE c.ID = ID AND IDCONTENIDO = 'uvresoluciones')








SELECT FLAGCODIGOINTERNO , FLAGSISTEMA ,c.* FROM CONTENIDOPARRAFO c WHERE ID IN ('xuvresoluciones.abdb2c347f5543b998614ebcbf5ee19a',
'xuvresoluciones.beb6905dbfeb487d84dbbe4506cf065b',
'xuvresoluciones.bb6b5021fd824a738694fc7dbcbda262',
'xuvresoluciones.fd0f2d908c6f4af48a144201615cae0d',
'xuvresoluciones.cf528bd3edcd40f5abae87adbb16e1f4',
'xuvresoluciones.665edbd32fad4515a30587e9c2b24ebb',
'xuvresoluciones.4b4395b7c30743e9ba4a34583e2780ca',
'xuvresoluciones.40a2e0dc120640fa97458e5f9c452feb',
'xuvresoluciones.ca1a502f89fb494894f8e777470bd01d',
'xuvresoluciones.dc0f483c177e4defaf3015cafcb9da1f',
'xuvresoluciones.b94383175f0446f38ed19f50bd90c878')

/*
 * 
 * 
 * 
 * RESOLUCIÓN 388 DE 2013
 * 
 UPDATE  CONTENIDOPARRAFO SET FLAGCODIGOINTERNO = 0 WHERE ID IN ('xuvresoluciones.abdb2c347f5543b998614ebcbf5ee19a',
'xuvresoluciones.beb6905dbfeb487d84dbbe4506cf065b',
'xuvresoluciones.bb6b5021fd824a738694fc7dbcbda262',
'xuvresoluciones.fd0f2d908c6f4af48a144201615cae0d',
'xuvresoluciones.cf528bd3edcd40f5abae87adbb16e1f4',
'xuvresoluciones.665edbd32fad4515a30587e9c2b24ebb',
'xuvresoluciones.4b4395b7c30743e9ba4a34583e2780ca',
'xuvresoluciones.40a2e0dc120640fa97458e5f9c452feb',
'xuvresoluciones.ca1a502f89fb494894f8e777470bd01d',
'xuvresoluciones.dc0f483c177e4defaf3015cafcb9da1f',
'xuvresoluciones.b94383175f0446f38ed19f50bd90c878');

 */

















**************************************************************
*** SELECT PARA VALIDAR CONTENIDOS EN CONTENIDOPARRAFO. 
**************************************************************

SELECT count(*) FROM CONTENIDOPARRAFO c 
WHERE IDCONTENIDO  = 'exprenta' AND id = ''
AND FLAGBORRADO  = 0
and rownum <= 1000;

SELECT REPLACE(xml, '<TD rowspan="1" colspan="1" align="center" valign="middle" bgcolor="Silver"><Negrita>DIVIDENDOS</Negrita></TD></TR><TR>', '<TD rowspan="2" colspan="1" align="center" valign="middle" bgcolor="Silver"><Negrita>DIVIDENDOS</Negrita></TD></TR><TR>'), * FROM CONTENIDOPARRAFO c 
WHERE IDCONTENIDO  = 'exprenta' AND ID = 'xexprenta.fce542d51cf54af0a79303212cb5339f'
AND FLAGBORRADO  = 0
and rownum <= 100;

SELECT REPLACE(xml, '<TD rowspan="1" colspan="1" align="center" valign="middle" bgcolor="Silver"><Negrita>DIVIDENDOS</Negrita></TD></TR><TR>', '<TD rowspan="2" colspan="1" align="center" valign="middle" bgcolor="Silver"><Negrita>DIVIDENDOS</Negrita></TD></TR><TR>')
 FROM CONTENIDOPARRAFO c 
WHERE IDCONTENIDO  = 'exprenta' AND ID = 'xexprenta.fce542d51cf54af0a79303212cb5339f'


SELECT XML FROM CONTENIDOPARRAFO c 
WHERE IDCONTENIDO  = 'exprenta' AND ID = 'xexprenta.fce542d51cf54af0a79303212cb5339f'
AND FLAGBORRADO  = 0
and rownum <= 100;


SELECT  replace(xml, '</Plantilla><Negrita>', '</Plantilla> <Negrita>') AS xml_modificado, xml,  '''' || c.id || ''',' AS id_p, 
c.* FROM CONTENIDOPARRAFO c 
WHERE IDCONTENIDO  = 'estatuto2022' AND xml LIKE  '%</Plantilla><Negrita>%' AND xml not LIKE '%TABLE%'
AND FLAGBORRADO  = 0
and rownum <= 100;


SELECT  xml,  '''' || c.id || ''',' AS id_p, 
c.* FROM CONTENIDOPARRAFO c 

WHERE ID IN ()




SELECT * FROM contenido WHERE IDCONTENIDO = '6d97fe0216e58002e0430a0101518002'

SELECT * FROM contenidoparrafo WHERE IDCONTENIDO = '6d97fe0216e58002e0430a0101518002'   AND ID 

IN 
(
'x6d97fe0216e58002e0430a0101518002.fba513436eea439ab1fc4eef0f610284'   ,
'x6d97fe0216e58002e0430a0101518002.f587824bedd046c58479c99d35ad0eaf'   ,
'x6d97fe0216e58002e0430a0101518002.fdb12cd302244b709bd97bee96b01660'    ,
'x6d97fe0216e58002e0430a0101518002.32b5207d0f5f4907b49ec15f5dcaa653'   );

UPDATE  contenidoparrafo SET FECHAACTUALIZACION  =  SYSDATE WHERE IDCONTENIDO = '6d97fe0216e58002e0430a0101518002'   AND ID 

IN 
(
'x6d97fe0216e58002e0430a0101518002.fba513436eea439ab1fc4eef0f610284'   ,
'x6d97fe0216e58002e0430a0101518002.f587824bedd046c58479c99d35ad0eaf'   ,
'x6d97fe0216e58002e0430a0101518002.fdb12cd302244b709bd97bee96b01660'    ,
'x6d97fe0216e58002e0430a0101518002.32b5207d0f5f4907b49ec15f5dcaa653'   );



select * from contenidotransformador WHERE --CODTRANSFORMADOR IN (10) and 
codcontenido IN ('civilbasico2022b');

 update CONTENIDOTRANSFORMADOR set ejecutar='S' , COUNTTRANSFORMACIONES=0, FECHAULTIMAEJECUCION = NULL
 WHERE CODTRANSFORMADOR IN (35,
65) and codcontenido IN ('cgpbasicoested14');

/*
 * 
 
 update CONTENIDOTRANSFORMADOR set ejecutar='S' , COUNTTRANSFORMACIONES=0, FECHAULTIMAEJECUCION = NULL
 WHERE CODTRANSFORMADOR IN (30, 60) and codcontenido IN ('carmagneticos');
 
*/
update CONTENIDOTRANSFORMADOR set ejecutar='S' WHERE CODTRANSFORMADOR IN (10) and codcontenido IN ('6d97fe0216e58002e0430a0101518002');

**************************************************************
*** caso atributo NO encontrado 
**************************************************************

      SELECT IDATRIBUTO, NOMATRIBUTO  FROM
        (
        SELECT DISTINCT ATR.IDATRIBUTO, ATR.NOMATRIBUTO
        FROM       ATRIBUTO ATR
        INNER JOIN ATRIBUTOCLASIFICACIONCONTENIDO ACC ON ACC.CODATRIBUTO = ATR.IDATRIBUTO
        WHERE ACC.IDCONTENIDO = 'cgprocesoba'
        AND 	ATR.FLAGBORRADO = 0
        OR    (ACC.IDCONTENIDO IS NULL AND ACC.CODCLASIFICACIONCONTENIDO IS NULL)
        OR    ACC.CODCLASIFICACIONCONTENIDO IN (
        SELECT IDCLASIFICACIONCONTENIDO
        FROM CLASIFICACIONCONTENIDO
        START WITH IDCLASIFICACIONCONTENIDO = (SELECT CODTIPOCONTENIDO FROM CONTENIDO WHERE IDCONTENIDO = 'estatuto')
        CONNECT BY PRIOR CODCLASIFICACIONCONTENIDO = IDCLASIFICACIONCONTENIDO)
        )ORDER BY NOMATRIBUTO






SELECT * FROM ATRIBUTO a WHERE idatributo IN ( 17,
816,
824)

SELECT * FROM ATRIBUTOPARRAFO a  WHERE CODPARRAFO  = 'xcgprocesoba.0d33fdec4538461db1605f8a96fbd3d2'
SELECT * FROM ATR

SELECT * FROM ATRIBUTOCLASIFICACIONCONTENIDO a WHERE IDCONTENIDO = 'estatuto'  --955



INSERT INTO ATRIBUTOCLASIFICACIONCONTENIDO (codatributo, CODCLASIFICACIONCONTENIDO, IDCONTENIDO) VALUES (955, NULL, 'estatuto')




**************************************************************
*** caso arboles 
**************************************************************

SELECT "ID", IDANTERIOR, IDSIGUIENTE, ORDINAL--,XML
FROM CONTENIDOPARRAFO
WHERE IDCONTENIDO = 'doctrinanai'
START WITH -- ID = 'x0a440bbc4a8c013ce0530a010151013c.0f0651d68201464da62430cca9b955c8'
ID = (SELECT ID FROM CONTENIDOPARRAFO WHERE IDCONTENIDO = 'doctri' AND IDANTERIOR = 'NULL' )
CONNECT BY PRIOR ID = IDANTERIOR
AND ID = PRIOR IDSIGUIENTE;

SELECT "ID", IDANTERIOR, IDSIGUIENTE, DESCRIPCION 
FROM CONTENIDOPARRAFOARBOL
WHERE IDCONTENIDO = 'doctrinanai'
START WITH  ID = 'xdoctrinanai.0ea82d73852b43f590649289cb9bf716'
--ID = (SELECT ID FROM CONTENIDOPARRAFOARBOL WHERE IDCONTENIDO = 'doctrinanai' AND IDANTERIOR = 'NULL' )
CONNECT BY PRIOR ID = IDANTERIOR
AND ID = PRIOR IDSIGUIENTE;

SELECT * FROM CONTENIDO WHERE IDCONTENIDO IN ( 'comerbasicoested12','comerbasicoested13')



select  cpa.id, CPA.IDANTERIOR idarbolanterior,   CPA.IDSIGUIENTE idarbolsiguiente,   CPA.IDPADRE idarbolpadre, 
     case when cpa.id is not null then NVL(CPA.DESCRIPCION,SUBSTR(RTRIM(LTRIM(REGEXP_REPLACE(CP.XML,'<[^>]*>', ''))), 0, 1000)) else null end Descripcion
from CONTENIDOPARRAFO cp 
  left outer join CONTENIDOPARRAFOARBOL cpa on cp.id = cpa.id  
where CP.IDCONTENIDO = 'doctrinanai' --AND cp.id   IN ( 'xdoctrinanai.a7db61ec50a949c5af2b89b590dac43e', 'xdoctrinanai.a7db61ec50a949c5af2b89b590dac43e')
AND cpa.IDPADRE IN ('xdoctrinanai.3669f96ee6824cc3b867a55f5262d7d9')
order by CP.ORDINAL



UPDATE CONTENIDOPARRAFOARBOL SET IDSIGUIENTE = 'xdoctrinanai.1255e672e287436b9a7cb1fbaf42ee27'  WHERE id = 'xdoctrinanai.9222773054c84fb6a84e543699279a44' ; 
UPDATE CONTENIDOPARRAFOARBOL SET IDANTERIOR  = 'xdoctrinanai.9222773054c84fb6a84e543699279a44'  WHERE id = 'xdoctrinanai.1255e672e287436b9a7cb1fbaf42ee27' ; 


UPDATE CONTENIDOPARRAFOARBOL SET IDANTERIOR  = NULL, idsiguiente = NULL, idpadre = 'xdoctrinanai.bc22161e8aa245adb3d9d302d0ab426a' WHERE id ='xdoctrinanai.a7db61ec50a949c5af2b89b590dac43e' ;


UPDATE CONTENIDOPARRAFOARBOL SET IDPADRE  = 'xdoctrinanai.9222773054c84fb6a84e543699279a44'  WHERE id = 'xdoctrinanai.006289f00e7e4e0d878418be6b893034' ;


UPDATE CONTENIDOPARRAFOARBOL SET idsiguiente = 'xdoctrinanai.eda504016d284def9b0f41207b3ac935' , idpadre = 'xdoctrinanai.006289f00e7e4e0d878418be6b893034'  WHERE id = 'xdoctrinanai.eda504016d284def9b0f41207b3ac935';
UPDATE CONTENIDOPARRAFOARBOL SET idpadre = 'xdoctrinanai.006289f00e7e4e0d878418be6b893034'  WHERE id = 'xdoctrinanai.7b7f7284d7e647c38c0879091988f1c2';
UPDATE CONTENIDOPARRAFOARBOL SET idpadre = 'xdoctrinanai.006289f00e7e4e0d878418be6b893034'  WHERE id = 'xdoctrinanai.8fc5f7c1b699461f82f0e7d1f73db3b9';
UPDATE CONTENIDOPARRAFOARBOL SET idsiguiente = NULL, idpadre = 'xdoctrinanai.006289f00e7e4e0d878418be6b893034' WHERE id = 'xdoctrinanai.3bbb99767f2247089a247966da4d87e2';











select  cp.id,   cp.idanterior,   cp.idsiguiente,  CPA.IDANTERIOR idarbolanterior,   CPA.IDSIGUIENTE idarbolsigueinte,   CPA.IDPADRE idarbolpadre, 
  cpa.flagexportar,   cp.ordinal,
  CASE WHEN CP.FLAGMODIFICADO = 1 THEN 1 ELSE CASE WHEN CP.FLAGNUEVO=1 THEN 1 ELSE CASE WHEN CP.FLAGBORRADO=2 THEN 1 ELSE 0 END END END FLAGMODIFICADO,
  CP.FECHAACTUALIZACION,    case when cpa.id is not null then NVL(CPA.DESCRIPCION,SUBSTR(RTRIM(LTRIM(REGEXP_REPLACE(CP.XML,'<[^>]*>', ''))), 0, 1000)) else null end Descripcion
from CONTENIDOPARRAFO cp 
  left outer join CONTENIDOPARRAFOARBOL cpa on cp.id = cpa.id  
where CP.IDCONTENIDO = 'doctrinanif' AND cp.id   IN ( 'xdoctrinanif.c13b360b7b5d46a9a2f3079ff2372d20','xdoctrinanif.c13b360b7b5d46a9a2f3079ff2372d20', 'xdoctrinanif.2f4c699593274840a4deb44ff21b80c1','xdoctrinanif.6eab5f4d14ae4bc8ae2ea19edfdbfc84')
order by CP.ORDINAL





SELECT ID, XML, ESTILO, REFID, FLAGNUEVO, FLAGDISPONIBLE, FLAGBORRADO, FLAGTESAURO, FLAGTABLA, ORDINAL, IDANTERIOR, GRUPO FROM CONTENIDOPARRAFO START 
WITH ID = 'xdoctrinanif.c13b360b7b5d46a9a2f3079ff2372d20Aab5f4d14ae4bc8ae2ea19edfdbfc84';










**************************************************************
*** caso qr
**************************************************************


SELECT * FROM CONTENIDOPARRAFO c WHERE ID IN ( 'xlaboralbaestudio.0bfba749f69942c08a985a73e210b890')

SELECT * FROM CONTENIDOPARRAFOMEDIO c WHERE ID_CONTENIDOPARRAFO = 'xexprenta.587b4ecfd3e845e5b87ca9120db50b22'

SELECT  upper(GUID_MEDIO) AS mayu_nombre , m.* FROM MEDIO m WHERE ID_MEDIO IN (194512,194513, 196510, 196511)

SELECT*FROM CONTENIDOPARRAFOQR c WHERE  CODCONTENIDO IN ('laboralbaestudio') 


AND codrecurso IN (
'16cca546-c0e1-ec11-9117-005056b046fe'
)

SELECT cp.HASH , cp.ID , c.* FROM CONTENIDOPARRAFOQR c INNER JOIN CONTENIDOPARRAFO cp ON 
c.CODPARRAFOINI = cp.ID 
WHERE  CODCONTENIDO IN ('laboralbaestudio') 



--**************************************************************
--*** CASO CAMBIO QR DE UN PARRAFO A OTRO 
--**************************************************************

-- PASO 1 CAMBIAR CONTENIDOPARRAFO 
--1

-- VIEJO 
xcgdisciplinario.fe0049fab6f143c3bd0a35fc5ae17ec5
-- NUEVO 
xcgdisciplinario.3e59bf3b46994d3395d80d6b53a3b7db

SELECT ID, HASH FROM contenidoparrafo WHERE ID  IN  ('xcgdisciplinario.fe0049fab6f143c3bd0a35fc5ae17ec5', 'xcgdisciplinario.3e59bf3b46994d3395d80d6b53a3b7db')
UPDATE contenidoparrafo SET HASH = 'ND' WHERE ID  = 'xcgdisciplinario.fe0049fab6f143c3bd0a35fc5ae17ec5'
UPDATE contenidoparrafo SET HASH = '2f9658f3-72c6-ec11-9116-005056b046fe' WHERE ID  = 'xcgdisciplinario.3e59bf3b46994d3395d80d6b53a3b7db'
--2 

-- VIEJO 
xcgdisciplinario.7b371dd531af4b5fae254b3abc6fcd05
-- NUEVO 
xcgdisciplinario.07396f1c56354cddad644830e2d1d765

SELECT ID, HASH FROM contenidoparrafo WHERE ID  IN  ('xcgdisciplinario.7b371dd531af4b5fae254b3abc6fcd05', 'xcgdisciplinario.07396f1c56354cddad644830e2d1d765')
UPDATE contenidoparrafo SET HASH = 'ND' WHERE ID  = 'xcgdisciplinario.7b371dd531af4b5fae254b3abc6fcd05'
UPDATE contenidoparrafo SET HASH = '8abb0020-7ac6-ec11-9116-005056b046fe' WHERE ID  = 'xcgdisciplinario.07396f1c56354cddad644830e2d1d765'
--3
 -- VIEJO 
xcgdisciplinario.c46c09e1c6774b3db82304b62f5e6666
 -- NUEVO 
xcgdisciplinario.42a780130d334c0da880b7c77002ba65
SELECT ID, HASH FROM contenidoparrafo WHERE ID  IN  ('xcgdisciplinario.c46c09e1c6774b3db82304b62f5e6666', 'xcgdisciplinario.42a780130d334c0da880b7c77002ba65')
UPDATE contenidoparrafo SET HASH = 'ND' WHERE ID  = 'xcgdisciplinario.c46c09e1c6774b3db82304b62f5e6666'
UPDATE contenidoparrafo SET HASH = 'b8e46ccc-77c6-ec11-9116-005056b046fe' WHERE ID  = 'xcgdisciplinario.42a780130d334c0da880b7c77002ba65'
--4
-- VIEJO 
xcgdisciplinario.56ed98c212e44a79aaf8d02129da94d3
-- NUEVO 
xcgdisciplinario.1b8baff2ad56421f8bc016f2b5c0fba4
SELECT ID, HASH FROM contenidoparrafo WHERE ID  IN  ('xcgdisciplinario.56ed98c212e44a79aaf8d02129da94d3', 'xcgdisciplinario.1b8baff2ad56421f8bc016f2b5c0fba4')
UPDATE contenidoparrafo SET HASH = 'ND' WHERE ID  = 'xcgdisciplinario.56ed98c212e44a79aaf8d02129da94d3'
UPDATE contenidoparrafo SET HASH = '7c648726-72c6-ec11-9116-005056b046fe' WHERE ID  = 'xcgdisciplinario.1b8baff2ad56421f8bc016f2b5c0fba4'
--5
-- VIEJO 
xcgdisciplinario.4d66114ecaad414587daa4575344bbc0
-- NUEVO 
xcgdisciplinario.93875d8330d84816bb67fa42d5dfaa9c
SELECT ID, HASH FROM contenidoparrafo WHERE ID  IN  ('xcgdisciplinario.4d66114ecaad414587daa4575344bbc0', 'xcgdisciplinario.93875d8330d84816bb67fa42d5dfaa9c')
UPDATE contenidoparrafo SET HASH = 'ND' WHERE ID  = 'xcgdisciplinario.4d66114ecaad414587daa4575344bbc0'
UPDATE contenidoparrafo SET HASH = 'e9ee91f3-70c6-ec11-9116-005056b046fe' WHERE ID  = 'xcgdisciplinario.93875d8330d84816bb67fa42d5dfaa9c'




-- PASO 2 CONTENIDOPARRAFOQR 
SELECT * FROM CONTENIDOPARRAFOQR c WHERE CODCONTENIDO  IN ('cgdisciplinario') AND CODRECURSO  = '2f9658f3-72c6-ec11-9116-005056b046fe'

UPDATE CONTENIDOPARRAFOQR c SET CODPARRAFOINI  = 'xcgdisciplinario.07396f1c56354cddad644830e2d1d765' WHERE CODCONTENIDO  IN ('cgdisciplinario') AND CODRECURSO  = '8abb0020-7ac6-ec11-9116-005056b046fe'
UPDATE CONTENIDOPARRAFOQR c SET CODPARRAFOINI  = 'xcgdisciplinario.93875d8330d84816bb67fa42d5dfaa9c' WHERE CODCONTENIDO  IN ('cgdisciplinario') AND CODRECURSO  = 'e9ee91f3-70c6-ec11-9116-005056b046fe'
UPDATE CONTENIDOPARRAFOQR c SET CODPARRAFOINI  = 'xcgdisciplinario.42a780130d334c0da880b7c77002ba65' WHERE CODCONTENIDO  IN ('cgdisciplinario') AND CODRECURSO  = 'b8e46ccc-77c6-ec11-9116-005056b046fe'
UPDATE CONTENIDOPARRAFOQR c SET CODPARRAFOINI  = 'xcgdisciplinario.3e59bf3b46994d3395d80d6b53a3b7db' WHERE CODCONTENIDO  IN ('cgdisciplinario') AND CODRECURSO  = '2f9658f3-72c6-ec11-9116-005056b046fe'
UPDATE CONTENIDOPARRAFOQR c SET CODPARRAFOINI  = 'xcgdisciplinario.1b8baff2ad56421f8bc016f2b5c0fba4' WHERE CODCONTENIDO  IN ('cgdisciplinario') AND CODRECURSO  = '7c648726-72c6-ec11-9116-005056b046fe'


-- PASO 3 CAMBIAR EN CPANEL 

























**************************************************************
*** CASO: CORREGIR ENLACES 
**************************************************************

1. CONSULTAMOS LOS PARRAFOS QUE PRESENTAN PROBLEMA 

SELECT id, IDANTERIOR , IDSIGUIENTE , IDCONTENIDO, ordinal, XML  FROM CONTENIDOPARRAFO c WHERE c.IDCONTENIDO  = '827ae54fa7db40f0aac6dc4ca2f7abc8'  
/*AND ID IN ('x827ae54fa7db40f0aac6dc4ca2f7abc8.a4b3a881cb5e440288a1632eb189ad4c'
,'x827ae54fa7db40f0aac6dc4ca2f7abc8.56fc6f960f014352b8bf961c7e696ca7'
,'x827ae54fa7db40f0aac6dc4ca2f7abc8.1fe3d10fb51e45b4911f753fc5f70aad' 
,'x827ae54fa7db40f0aac6dc4ca2f7abc8.9036bebb7b8c4f1b9a79b87fa3211b54'
,'x827ae54fa7db40f0aac6dc4ca2f7abc8.b475e26270164ae1a27e7df2f5be5f6f' 




)*/

AND ordinal BETWEEN 398 AND 410
ORDER BY ordinal desc 

2. REALIZAMOS UPDATE 

update contenidoparrafo set idsiguiente = 'x827ae54fa7db40f0aac6dc4ca2f7abc8.a4b3a881cb5e440288a1632eb189ad4c' where id = 'x827ae54fa7db40f0aac6dc4ca2f7abc8.b78c277a8ac64b05bccd0a0cdbb09e32';

update contenidoparrafo set idanterior = 'x827ae54fa7db40f0aac6dc4ca2f7abc8.a4b3a881cb5e440288a1632eb189ad4c' where id = 'x827ae54fa7db40f0aac6dc4ca2f7abc8.eaaf7ecce44742ffa370190f9af507d4';


      
update contenidoparrafo set idsiguiente = 'x827ae54fa7db40f0aac6dc4ca2f7abc8.eaaf7ecce44742ffa370190f9af507d4' where id =  'x827ae54fa7db40f0aac6dc4ca2f7abc8.a4b3a881cb5e440288a1632eb189ad4c';



update contenidoparrafo set idanterior = 'x827ae54fa7db40f0aac6dc4ca2f7abc8.b78c277a8ac64b05bccd0a0cdbb09e32' where id =  'x827ae54fa7db40f0aac6dc4ca2f7abc8.a4b3a881cb5e440288a1632eb189ad4c';






**************************************************************
*** CASO: CORREGIR reservados 
**************************************************************

SELECT * FROM CONTENIDOCODIGOINTERNO WHERE IDCONTENIDO  = 'cgproceso' 
/*AND (IDANTERIOR  = '72900917cb180328e0530a0101510328'
OR IDSIGUIENTE = '72900917cb180328e0530a0101510328' OR id ='72900917cb180328e0530a0101510328')
*/  AND rownum <=  25 
ORDER BY VALOR0  desc 






SELECT VALOR0 , 20853 AS valor, VALOR1 , 0 AS valor2	, FLAGRANGORESERVADO, 0  FROM CONTENIDOCODIGOINTERNO WHERE id = 'e1f7fe0d896901aae0530a0101828d4c'UNION ALL  
SELECT VALOR0 , 20852, VALOR1 , 0	, FLAGRANGORESERVADO , 0 FROM CONTENIDOCODIGOINTERNO WHERE id =  'e1f83c6fd16a01e0e0530a0101820d0f'UNION ALL   
SELECT VALOR0 , 20851, VALOR1 , 0	, FLAGRANGORESERVADO , 0 FROM CONTENIDOCODIGOINTERNO WHERE id =  'e1f7f1a5f40e01cee0530a0101820c11'UNION ALL  
SELECT VALOR0 , 20850, VALOR1 , 0	, FLAGRANGORESERVADO , 0 FROM CONTENIDOCODIGOINTERNO WHERE id = 'e1f835c9eea101eae0530a010182efbc'UNION ALL  
SELECT VALOR0 , 20849, VALOR1 , 0	, FLAGRANGORESERVADO , 0 FROM CONTENIDOCODIGOINTERNO WHERE id = 'e1f835c9ee9e01eae0530a010182efbc'UNION ALL  
SELECT VALOR0 , 20823, VALOR1 , 20848, FLAGRANGORESERVADO , 1 FROM CONTENIDOCODIGOINTERNO WHERE id = '72901e5291280198e0530a0101510198';



SELECT VALOR0 , 20853 AS valor, VALOR1 , 0 AS valor2	, FLAGRANGORESERVADO, 0  FROM CONTENIDOCODIGOINTERNO WHERE id = 'e1f7fe0d896901aae0530a0101828d4c'UNION ALL  
SELECT VALOR0 , 20852, VALOR1 , 0	, FLAGRANGORESERVADO , 0 FROM CONTENIDOCODIGOINTERNO WHERE id =  'e1f83c6fd16a01e0e0530a0101820d0f'UNION ALL   
SELECT VALOR0 , 20851, VALOR1 , 0	, FLAGRANGORESERVADO , 0 FROM CONTENIDOCODIGOINTERNO WHERE id =  'e1f7f1a5f40e01cee0530a0101820c11'UNION ALL  
SELECT VALOR0 , 20850, VALOR1 , 0	, FLAGRANGORESERVADO , 0 FROM CONTENIDOCODIGOINTERNO WHERE id = 'e1f835c9eea101eae0530a010182efbc'UNION ALL  
SELECT VALOR0 , 20849, VALOR1 , 0	, FLAGRANGORESERVADO , 0 FROM CONTENIDOCODIGOINTERNO WHERE id = 'e1f835c9ee9e01eae0530a010182efbc'UNION ALL  
SELECT VALOR0 , 20823, VALOR1 , 20848, FLAGRANGORESERVADO , 1 FROM CONTENIDOCODIGOINTERNO WHERE id = '72901e5291280198e0530a0101510198';








SELECT 

xml, REPLACE(xml, '4820898' ,'')

 FROM contenidoparrafo   WHERE id IN ( 'xpruobrahn.c47444a35b2040a4a9e3b1bd44d759ca')
 
 


SELECT 

*--REPLACE(replace(xml, '<Symbol class="">', ''),'</Symbol>' ,'')

 FROM contenidoparrafo  WHERE id IN ( 'xpruobrahn.62664013ad8d459dbceab6ce93cacb80',
'xpruobrahn.c47444a35b2040a4a9e3b1bd44d759ca')
 


SELECT * FROM contenidoparrafo WHERE id IN ( 'x2da431c0a6cc44288d739267db51c6cc.62ed72b9128244afb60ad569b5fd495f', 'x2da431c0a6cc44288d739267db51c6cc.29371a9884d84f6d90ccd304c17bc47f')


SELECT * FROM CONTENIDODESTINOS c WHERE cod_contenido  = 'pruobrahn' -- Concepto 317-902027 del 2022 Marzo 15DT