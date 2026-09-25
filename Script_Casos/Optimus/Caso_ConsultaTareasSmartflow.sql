
SELECT * FROM PROYECTO 
SELECT * FROM usuario WHERE id_usuario = 9425; 

--UPDATE  rol SET NOMROL ='Básicos' WHERE ID_ROL =767; --Todos

-- ********************************************************************************
-- CONSULTAR TAREAS FICHAS 
-- ********************************************************************************
SELECT DISTINCT
    c.idcontenido AS id,
    c.nomcontenido AS contenido,
    c.codficha,
    t.id_tarea,
    t.nomtarea,
    t.fechacreacion,
    t.fechafin AS fecha_fin_tarea,
    t.fechacerrada,
    u.nomusuario AS usuario_asignado,
    uc.nomusuario AS usuario_cerro_tarea,
    t.flagcerrada
FROM contenido c
INNER JOIN clasificacioncontenido clc
    ON c.codtipocontenido = clc.idclasificacioncontenido
   AND c.codparrafoinicial IS NOT NULL
INNER JOIN contenidoadicionalvalor cav
    ON c.codficha = cav.codficha
INNER JOIN contenidoadicional ca
    ON cav.codcontenidoadicional = ca.idcontenidoadicional
LEFT JOIN proyecto p
    ON p.codexternotexto = c.idcontenido
LEFT JOIN etapa etp
    ON etp.codproyecto = p.id_proyecto
LEFT JOIN tarea t
    ON t.codetapa = etp.id_etapa
LEFT JOIN usuario u
    ON u.id_usuario = t.codusuario
LEFT JOIN usuario uc
    ON uc.id_usuario = t.coduserclose
WHERE 
    u.flagborrado = 0 AND u.flagactivo = 1
AND uc.flagborrado = 0 AND uc.flagactivo = 1

AND t.fechacreacion BETWEEN TO_DATE('01-01-2025', 'DD-MM-YYYY')
                        AND TO_DATE('31-05-2026', 'DD-MM-YYYY')
ORDER BY c.idcontenido, t.fechacreacion DESC;




/*
SELECT DISTINCT 
    c.idcontenido AS id,
    c.nomcontenido AS contenido,
    c.codficha,
  /*  cav.valor,
    cav.codcontenidoadicional,
    ca.nomcontenidoadicional,
    p.codexternotexto,*//*
    t.id_tarea,
    t.nomtarea,
    t.fechacreacion,
    t.fechafin AS fecha_fin_tarea,
    t.fechacerrada,
  --  etp.fechafin AS fecha_fin_etapa,
    u.nomusuario,
    t.*, 
    t.flagcerrada
FROM contenido c
INNER JOIN clasificacioncontenido clc     ON c.codtipocontenido = clc.idclasificacioncontenido   AND c.codparrafoinicial IS NOT NULL
INNER JOIN contenidoadicionalvalor cav     ON c.codficha = cav.codficha
INNER JOIN contenidoadicional ca     ON cav.codcontenidoadicional = ca.idcontenidoadicional
LEFT JOIN proyecto p     ON p.codexternotexto = c.idcontenido
LEFT JOIN etapa etp     ON etp.codproyecto = p.id_proyecto
LEFT JOIN tarea t     ON t.codetapa = etp.id_etapa --  AND t.flagcerrada = 0
LEFT JOIN usuario u     ON u.id_usuario = t.codusuario
WHERE 1 = 1
-- AND u.flagborrado = 0 AND U.flagactivo = 1
-- AND cav.codcontenidoadicional IN (5111)
-- AND etp.alias = 'CTYAP'
AND t.fechacreacion BETWEEN TO_DATE('01-01-2025', 'DD-MM-YYYY')
                         AND TO_DATE('31-01-2025', 'DD-MM-YYYY')
ORDER BY c.idcontenido, t.fechacreacion DESC;
*/

-- ********************************************************************************
-- CONSULTAR TAREAS especificas 
-- ********************************************************************************
SELECT p.CODEXTERNOTEXTO, c.NOMCONTENIDO, t.FECHACREACION, t.FECHAFIN,
etp.FECHAFIN,  t.NOMTAREA, t.id_tarea ,  t.FECHACERRADA, U.NOMUSUARIO AS usuario_asignado,   
uc.nomusuario AS usuario_cerro_tarea
FROM ETAPA etp
INNER JOIN TAREA t ON t.CODETAPA = etp.ID_ETAPA
INNER JOIN PROYECTO p ON p.ID_PROYECTO = etp.CODPROYECTO
INNER JOIN CONTENIDO c ON c.IDCONTENIDO = p.CODEXTERNOTEXTO
INNER JOIN USUARIO U ON U.ID_USUARIO = T.CODUSUARIO 
LEFT JOIN usuario uc ON uc.id_usuario = T.coduserclose
WHERE 
--t.NOMTAREA LIKE '%Norma%' and
 t.fechacreacion BETWEEN TO_DATE('01-01-2025', 'DD-MM-YYYY') AND TO_DATE('31-05-2026', 'DD-MM-YYYY')

 

-- ********************************************************************************
-- CONSULTAR ULTIMA ACTUALIZACION DE OBRAS. 
-- ********************************************************************************

 SELECT c.CODCONTENIDO, CT.NOMCONTENIDO, c.FECHAULTIMAEJECUCION, t.IDTRANSFORMADOR, t.NOMTRANSFORMADOR 
FROM CONTENIDOTRANSFORMADOR c  
INNER JOIN TRANSFORMADOR t ON c.CODTRANSFORMADOR = t.IDTRANSFORMADOR 
INNER JOIN CONTENIDO CT ON CT.IDCONTENIDO = c.CODCONTENIDO 
WHERE CODTRANSFORMADOR IN (10,60,61,65);
        
 
-- ********************************************************************************
-- CONSULTAR TAREA ESPECIFICA
-- TAREA:  CORREGIR TEXTOS Y APLICAR PAUTAS
-- TIPO DE DOCUMENTO: JURISPRUDENCIA
-- ********************************************************************************

SELECT p.CODEXTERNOTEXTO, c.NOMCONTENIDO, t.FECHACREACION, t.FECHAFIN, t.FECHACERRADA, etp.FECHAFIN, U.NOMUSUARIO  , t.NOMTAREA 
FROM ETAPA etp
INNER JOIN TAREA t ON t.CODETAPA = etp.ID_ETAPA
INNER JOIN PROYECTO p ON p.ID_PROYECTO = etp.CODPROYECTO
INNER JOIN CONTENIDO c ON c.IDCONTENIDO = p.CODEXTERNOTEXTO
INNER JOIN USUARIO U ON U.ID_USUARIO = T.CODUSUARIO 
WHERE etp.ALIAS = 'CTYAP'
AND t.FECHACREACION BETWEEN TO_DATE('01-10-2025', 'DD-MM-YYYY') AND TO_DATE('31-01-2026', 'DD-MM-YYYY')
AND c.CODTIPOCONTENIDO IN (
SELECT IDCLASIFICACIONCONTENIDO FROM SPCUSER.CLASIFICACIONCONTENIDO
WHERE CODCLASIFICACIONCONTENIDO = 7);

-- ********************************************************************************
-- OBTENER_USUARIOS_ROLTAREA
-- ********************************************************************************
SELECT ID_USUARIO,SAMACCOUNTNAME,NOMUSUARIO 
FROM USUARIO U WHERE FLAGBORRADO=0 AND ID_USUARIO 
IN (SELECT CODUSUARIO FROM ROLUSUARIO WHERE CODROL 
IN (SELECT CODROLDESTINO FROM ROLTAREA WHERE ALIASORIGEN 
IN (SELECT ALIAS FROM ETAPA WHERE ID_ETAPA 
IN (SELECT CODETAPA FROM TAREA WHERE flagcerrada=0)) )) ORDER BY NOMUSUARIO

 
-- ********************************************************************************
-- CONSULTAR PLANTILLAS
-- ********************************************************************************
SELECT p.ID_PLANTILLAFLUJO , p.NOMPLANTILLAFLUJO , rt.*, R.NOMROL 
FROM PLANTILLAFLUJO p 
INNER JOIN ROLTAREA rt ON rt.CODPLANTILLAFLUJO = p.ID_PLANTILLAFLUJO 
INNER JOIN ROL R ON R.ID_ROL = RT.CODROLDESTINO  

-- ********************************************************************************
-- ROLES ACTIVOS CON TAREAS Y USUARIOS. 
-- ********************************************************************************
SELECT DISTINCT
    R.NOMROL, U.NOMUSUARIO
FROM USUARIO U
INNER JOIN ROLUSUARIO RU
    ON RU.CODUSUARIO = U.ID_USUARIO
INNER JOIN ROL R
    ON R.ID_ROL = RU.CODROL
WHERE u.FLAGACTIVO =1 AND u.FLAGBORRADO =0 
ORDER BY     R.NOMROL, U.NOMUSUARIO


-- ********************************************************************************
-- CONSULTAR DOCUMENTOS POR PROYECTOS
-- ********************************************************************************

SELECT d.* , d2.*
FROM PROYECTO p 
INNER JOIN ETAPA e ON p.ID_PROYECTO = e.CODPROYECTO 
INNER JOIN TAREA t ON t.CODETAPA = e.ID_ETAPA 
INNER JOIN DOCUMENTOTAREA d  ON t.ID_TAREA = d.CODTAREA 
iNNER JOIN DOCUMENTO d2 ON d2.ID_DOCUMENTO = d.CODDOCUMENTO 
INNER JOIN USUARIO u ON u.ID_USUARIO = t.CODUSUARIO 
where UPPER(p.nomproyecto) LIKE  UPPER('%norma%') 
ORDER BY E.ID_ETAPA DESC;












SELECT DISTINCT
    R.NOMROL
FROM USUARIO U
INNER JOIN ROLUSUARIO RU
    ON RU.CODUSUARIO = U.ID_USUARIO
INNER JOIN ROL R
    ON R.ID_ROL = RU.CODROL
INNER JOIN ROLTAREA RT
    ON RT.CODROLDESTINO = RU.CODROL
INNER JOIN ETAPA E
    ON E.ALIAS = RT.ALIASORIGEN
INNER JOIN TAREA T
    ON T.CODETAPA = E.ID_ETAPA
WHERE 
    U.FLAGBORRADO = 0 AND U.FLAGACTIVO = 1
    AND T.FLAGCERRADA = 0
ORDER BY 
   R.NOMROL;
   
   

-- ROLES ACTIVOS CON TAREAS Y USUARIOS. 
SELECT 
  DISTINCT 
    R.NOMROL, TA.NOMTAREA, ET.DESCRIPCION 
FROM PLANTILLAFLUJO PF
INNER JOIN PROYECTO PR 
    ON PF.PLANTILLAXML = REPLACE(PR.PLANTILLAXML, '_mtdt')
INNER JOIN ETAPA ET 
    ON PR.ID_PROYECTO = ET.CODPROYECTO
INNER JOIN TAREA TA 
    ON ET.ID_ETAPA = TA.CODETAPA
INNER JOIN CONTENIDO CO 
    ON PR.CODEXTERNOTEXTO = CO.IDCONTENIDO
INNER JOIN USUARIO U 
    ON U.ID_USUARIO = TA.CODUSERCLOSE
INNER JOIN ROLUSUARIO RU 
    ON RU.CODUSUARIO = U.ID_USUARIO
INNER JOIN ROL R 
    ON R.ID_ROL = RU.CODROL
WHERE 
    TA.FLAGCERRADA = 0    AND U.FLAGACTIVO=1 AND U.FLAGBORRADO=0

ORDER BY 
        R.NOMROL;
		
		
	
		
		
		
		
		
		








  