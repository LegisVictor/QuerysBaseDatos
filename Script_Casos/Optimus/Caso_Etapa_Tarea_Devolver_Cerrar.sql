 ALTER SESSION SET CURRENT_SCHEMA = "SPCUSER";

-- ***********************************************************************************
-- ETAPAS \\optimus\Plantillas
-- ***********************************************************************************

/***************************************************************
*** FLUJO DE OBRA POR ETAPAS 
**************************************************************
Modificar obra electronica es sin envio, solo publicaciones internet
modificar obrar version 2. 0 si genera envio. 


--  ACTUALIZAR OBRA
*** Comprende las tareas relacionadas a la actualización corrección y publicación de la obra en internet

1. Iniciar modificacion de obra -> Finalizado 
2. Modificar obra (Redactor) -> Finalizado
3. Asignar corrector (Jefe correción) -> Finalizado 
4. Realizar correción de la obra (Corrector) -> Finalizado
5. Reportar Inconsistencias? (Corrector) -> SI PUNTO 6
									    -> NO PUNTO 7
6. Revisar inconsistencias (Redactor) -> Finalizado 4
7. Aprobar correciones? (Redactor) -> SI 8
								   -> NO 4
8. Publicar en Internet (Redactor) -> Finalizado
9. Publicacion para medio? (Redactor) -> NO 1
						              -> SI 10
									  								
-- Publicar en medio impreso
*** Comprenden las tareas relacionadas a la publicación de la obra en medio impreso

10. Generar Envio (Redactor) -> Finalizado		
11. Realizar Correción Previa (Redactor) -> Finalizado	
12. Correcion previa aprobada? 	(Jefe correción / Coordinador de digitación y corrección )
    -> NO 10
	-> SI 13
	
-- Corrección Previa y Proceso Preprensa
*** Comprenden las tareas relacionadas a la corrección previa y el proceso de diagramación.

*** PARTE 1 ANEXOS 
13.1.1 Generar Corte (Redactor) - Finalizado 
13.1.2 Hay Anexos? (Redactor) -> NO -> FIN 
							  -> SI 13.1.3
13.1.3 Realizar Anexos (Redactor) - Finalizado 	
13.1.4 Delegar Corrector Anexo (Jefe Correción) -> Finalizado 
13.1.5 Corregir Anexo (Corrector) -> Finalizado
13.1.6 Aprobar Correciones Anexos? (Redactor) -> NO 13.1.5
                                              -> SI 
13.1.7 Publicar Anexo () -> Finalizado -> 10											  
							  
*** PARTE 2 PRENSA				  
							  
13.2.1 Proceso de Preprensa (Sub Procesos)
13.2.2 Delegar Preprensa () -> Finalizado 
13.2.3 Primera Revision Preprensa -> Finalizado 
13.2.4 Aprobado Preprensa? -> SI 13.2.8 
                           -> NO 13.2.5
13.2.5 Correcion Previa II -> Finalizado 
13.2.6 Reportar Inconsistencias -> NO 13.2.2
							-> SI 13.2.7
13.2.7 Revisar Inconsistencias Correcion Previa II -> Finalizado -> 13.2.6 							
13.2.8 Proceso Preprensa -> Finalizado 
13.2.9 Revisar y Enviar a Jefe U -> Finalizado 
*/

-- ***********************************************************************************
-- CASO EXISTE, EL PROYECTO LA ETAPA PERO NO LA TAREA  
-- ***********************************************************************************

SELECT T.NOMTAREA, T.FECHAFIN , T.FECHACERRADA , e.ID_ETAPA , 
'  -- -- TAREA   ' , T.*, 
'  -- -- ETAPA   ' ,E.*, '  -- -- PROYECTO   ', P.* 
FROM PROYECTO p 
INNER JOIN ETAPA e ON p.ID_PROYECTO = e.CODPROYECTO 
INNER JOIN TAREA t ON t.CODETAPA = e.ID_ETAPA 
WHERE UPPER(p.nomproyecto) LIKE  UPPER('%REGIMEN LEGAL DE LA FAMILIA Envío 117%')   
---codexternotexto = 'laboralba'
--t.CODUSUARIO  =764 AND t.FLAGCERRADA  = 0
--AND p.id_proyecto =3082490
ORDER BY e.ID_ETAPA  desc;


update proyecto 
set 
nomproyecto= 'CÓDIGO DE PROCEDIMIENTO ADMINISTRATIVO Y DE LO CONTENCIOSO ADMINISTRATIVO BÁSICO - COLECCIÓN UNIVERSITARIA 1a ed Envío 23-3332791' 
--flagpendiente= 1
where ID_PROYECTO = '3332791';




-- Para buscar usuario por nombre. 

SELECT "SPCUSER"."USUARIO".*,ROWID "NAVICAT_ROWID" FROM "SPCUSER"."USUARIO" WHERE LOWER("NOMUSUARIO") LIKE '%she%' OFFSET 0 ROWS FETCH NEXT 200 ROWS ONLY
 
UPDATE  tarea SET codusuario=9585 WHERE id_tarea = 4107506; 

 -- Segundo identificar el proyecto 
 
 SELECT "SPCUSER"."PROYECTO".*,ROWID "NAVICAT_ROWID" FROM "SPCUSER"."PROYECTO"
 WHERE "NOMPROYECTO" LIKE '%DOCTRINA TRIBUTARIA - Electrónica%' 
 OFFSET 0 ROWS FETCH NEXT 200 ROWS ONLY

 -- tercero buscar la etapa 
 SELECT "SPCUSER"."ETAPA".*,ROWID "NAVICAT_ROWID" FROM "SPCUSER"."ETAPA" WHERE "CODPROYECTO" = 3082490 ORDER BY "FECHAFIN" DESC OFFSET 0 ROWS FETCH NEXT 200 ROWS ONLY

 -- Cuarto buscar la tarea. 
 SELECT * FROM  tarea t where t.codusuario IN (872) AND t.FLAGCERRADA = 0 ORDER BY ID_TAREA DESC --;


SELECT * FROM usuario

-- ***********************************************************************************
-- PRIMERO BUSCAR EL PROYECTO 
-- ***********************************************************************************
SELECT * FROM proyecto p where UPPER(p.nomproyecto) 
LIKE  UPPER('%ESTATUTO GENERAL DE CONTRATACIÓN DE LA ADMINISTRACIÓN PÚBLICA Envío 56%') 
--p.CODEXTERNOTEXTO ='doctri'
ORDER BY  p.ID_PROYECTO desc;

SELECT * FROM proyecto p where codexternotexto ='arancelven' 



SELECT * FROM FLUJODISPARABLE f  e
SELECT * FROM contenido WHERE IDCONTENIDO = '6d97fe0216e58002e0430a0101518002'
 

SELECT "SPCUSER"."USUARIO".*,ROWID "NAVICAT_ROWID" 
FROM "SPCUSER"."USUARIO" WHERE LOWER("NOMUSUARIO") LIKE lower('%diego%') 
OR  ID_USUARIO IN   (914) 
OFFSET 0 ROWS FETCH NEXT 200 ROWS ONLY

--754
--749 -- elizabeth
--9125 -- Sebastian Herrera
--968 -- Alejandra Urrego
--3449 -- Jaime
--764 -- natacha 
--8845-- carolina

SELECT * FROM CONTENIDOUSUARIO WHERE CODPROYECTO  IN ('3325275') 

SELECT * FROM tarea WHERE id_tarea = 4067683; 




-- ***********************************************************************************
-- SEGUNDO BUSCAR LA ETAPA 
-- ***********************************************************************************

SELECT * FROM  etapa e where --e.id_etapa IN (3903896) AND 
e.codproyecto IN (3328392 )  order by id_etapa desc;


SELECT * FROM CONTENIDOPARRAFOCAMBIO WHERE CODPROYECTO IN (
3323693) -- VIEJO 
AND CODPARRAFO ='xlaboralba.72b26ca3decd4978b5dc1ecfeac6501a'



SELECT T.NOMTAREA, T.FECHAFIN , T.FECHACERRADA , '  -- -- ETAPA   ' ,E.*, '  -- -- PROYECTO   ', P.* 
FROM PROYECTO p 
INNER JOIN ETAPA e ON p.ID_PROYECTO = e.CODPROYECTO 
INNER JOIN TAREA t ON t.CODETAPA = e.ID_ETAPA 
--INNER JOIN DOCUMENTOTAREA d  ON t.ID_TAREA = d.CODTAREA 
--INNER JOIN DOCUMENTO d2 ON d2.ID_DOCUMENTO = d.CODDOCUMENTO 
INNER JOIN USUARIO u ON u.ID_USUARIO = t.CODUSUARIO 
WHERE P.ID_PROYECTO IN (3325275)
ORDER BY E.ID_ETAPA DESC  
--E.ALIAS = 'MO' AND
--T.ID_TAREA IN (3774577) -- AND
--T.CODUSUARIO = 9145 

\29e9e64d03dda0463709992044971ece00b9_mtdt.icn

-- PARA CONOCER EL FLUJO 
SELECT * FROM PLANTILLAFLUJO p WHERE PLANTILLAXML = '\29e9e64d03dda0463709992044971ece00b9.icn';

SELECT * FROM CONTENIDOFLUJO c  WHERE CODPROYECTO  IN (3325275)

SELECT * FROM DOCUMENTOTAREA d 

SELECT * FROM FLUJODISPARABLE f 




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

 DELETE FROM TAREADELEGACION  t WHERE t.codetapa IN (3966152) ;

 DELETE FROM  tarea t WHERE t.codetapa IN (3966152);

 DELETE FROM  etapa e where e.id_etapa IN (3966152)   AND e.codproyecto=3340242;


-- ***********************************************************************************
-- SELECT ACTIVAR LA TAREA. 
-- ***********************************************************************************

SELECT * FROM  etapa e where  e.codproyecto=3082992  order by id_etapa desc;

SELECT * FROM  etapa e where  e.ID_ETAPA=3879612  order by id_etapa desc;

SELECT * FROM  tarea t WHERE ID_TAREA IN (3799821, 3799826);

SELECT * FROM TAREAAVANCE t WHERE CODTAREA IN (3758370)

SELECT * FROM  TAREADELEGACION  t WHERE t.codetapa IN (3660605);

-- ***********************************************************************************
-- UPDATE PARA ACTIVAR LA TAREA. 
-- ***********************************************************************************


 UPDATE TAREA SET FECHACERRADA = NULL, FLAGCERRADA = 0, CODUSERCLOSE = NULL, 
  FLAGESCALADO = 0, FECHACREACION  = SYSDATE , FECHAFIN  = SYSDATE 
, FECHANOTIFICACION  = SYSDATE , FECHAESCALAMIENTO  = SYSDATE WHERE codetapa in (3966151); 
 UPDATE ETAPA SET FECHAFIN = NULL, SALIDA =  NULL, FLAGPENDIENTE = 0 WHERE ID_ETAPA = 3966151 AND codproyecto=3340242;




-- CERRAR 

 UPDATE TAREA SET FECHACERRADA = SYSDATE , FLAGCERRADA = 1, CODUSERCLOSE = 754, FLAGESCALADO = 0  WHERE codetapa in (3959256); 
 UPDATE ETAPA SET SALIDA =  'Finalizado', FLAGPENDIENTE = 0, CONTADORRECURSIVIDAD =0 where ID_ETAPA = 3959256 AND codproyecto=3338709;




-- UPDATE TAREA SET CODUSUARIO = 9585 WHERE ID_TAREA IN (4093986); -- VACACIONES , O SE FUE DE LEGIS.







-- ***********************************************************************************
-- SALTAR TAREA
-- ***********************************************************************************

begin
update tarea set flagcerrada=1, fechacerrada=SYSDATE, CODUSERCLOSE = 481  where codetapa in (3866794);
update etapa set fechafin=SYSDATE,salida='SI', flagpendiente=1 where id_etapa in (3866794);
end;







-- ***********************************************************************************
-- ***********************************************************************************
-- CERRAR VARIAS TAREAS
-- ***********************************************************************************
-- ***********************************************************************************
ALTER SESSION SET CURRENT_SCHEMA = "SPCUSER"


---------------------------------------------------------------------------------------
-- USUARIO 
---------------------------------------------------------------------------------------


SELECT "USUARIO".*,ROWID "NAVICAT_ROWID" 
FROM "USUARIO" WHERE LOWER("NOMUSUARIO") LIKE lower('%CRISTI%') 
OR  ID_USUARIO IN   (914) 
OFFSET 0 ROWS FETCH NEXT 200 ROWS ONLY


SELECT * FROM HORARIOUSUARIO h 

---------------------------------------------------------------------------------------
-- CONSULTAR PARA VALIDAR 
---------------------------------------------------------------------------------------
SELECT e.ID_ETAPA, t.*, p.NOMPROYECTO 
,'  -- -- ETAPA   ' ,E.*, '  -- -- PROYECTO   ', P.* 
FROM PROYECTO p 
INNER JOIN ETAPA e ON p.ID_PROYECTO = e.CODPROYECTO 
INNER JOIN TAREA t ON t.CODETAPA = e.ID_ETAPA 
--INNER JOIN DOCUMENTOTAREA d  ON t.ID_TAREA = d.CODTAREA 
--INNER JOIN DOCUMENTO d2 ON d2.ID_DOCUMENTO = d.CODDOCUMENTO 
INNER JOIN USUARIO u ON u.ID_USUARIO = t.CODUSUARIO 
WHERE 
T.CODUSUARIO = 764 
AND t.flagcerrada=0 
--AND nomproyecto LIKE '%CONCEPTO%%'
AND t.nomtarea = 'Publicar en Internet'

ORDER BY E.ID_ETAPA DESC;



---------------------------------------------------------------------------------------
-- Cerrar las tareas del usuario  relacionadas con proyectos. 
---------------------------------------------------------------------------------------
DECLARE
    v_codusuario   NUMBER := 764;
    v_flagcerrada  NUMBER := 0;
    v_nomproyecto  VARCHAR2(100) := '%CONCEPTO%';
    v_nomtarea     VARCHAR2(200) := '¿Documento de interes Juridico?';
BEGIN

    UPDATE tarea 
    SET flagcerrada = 1,
        fechacerrada = SYSDATE,
        coduserclose = v_codusuario
    WHERE codetapa IN (
        SELECT e.id_etapa
        FROM proyecto p
        INNER JOIN etapa e ON p.id_proyecto = e.codproyecto
        INNER JOIN tarea t ON t.codetapa = e.id_etapa
        WHERE t.codusuario = v_codusuario
          AND t.flagcerrada = v_flagcerrada
       --   AND p.nomproyecto LIKE v_nomproyecto
          AND t.nomtarea = v_nomtarea
    );

    UPDATE etapa 
    SET fechafin = SYSDATE,
        salida = 'SI',
        flagpendiente = 0
    WHERE id_etapa IN (
        SELECT e.id_etapa
        FROM proyecto p
        INNER JOIN etapa e ON p.id_proyecto = e.codproyecto
        INNER JOIN tarea t ON t.codetapa = e.id_etapa
        WHERE t.codusuario = v_codusuario
          AND t.flagcerrada = v_flagcerrada
         -- AND p.nomproyecto LIKE v_nomproyecto
          AND t.nomtarea = v_nomtarea
    );

    COMMIT;
END;
