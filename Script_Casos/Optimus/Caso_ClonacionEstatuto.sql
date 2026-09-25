--**********************************************************************************
--** CASO: CLONACION ESTATUTO TRIBUTARIO 
--**********************************************************************************
--** PASO 1: ejecutar proceso en optimus. 

-- EJECUTAR CON EL USUARIO DE UNO 
SELECT * FROM usuario WHERE upper(nomusuario) LIKE upper('%VICTOR%')

--- PARA DEPURAR CON USUARIO ESPECIFICO. 
SELECT * FROM sesion WHERE maquina = 'FRIGG';

UPDATE sesion SET CODUSUARIO=9126
WHERE IDENTIFICADOR  ='fredygp' AND maquina = 'FRIGG'; 

-- HACER LA CLONACION DESDE OPTIMUS DEPURANDO Y APUNTANDO A PRODUCCION 

--** PASO 2: CREAR INDICEGENERACION

-- validar
SELECT 'estatuto2025', CODINDICE, ejecutar, fechaultimaejecucion,FECHAPROXIMAEJECUCION, periodicidad, cuentausuario, 
configuracion FROM INDICEGENERACION i  WHERE CODCONTENIDO = 'estatuto';

-- insert que se debe realizar ajustando alias. 
  INSERT INTO INDICEGENERACION (codcontenido, CODINDICE, ejecutar, fechaultimaejecucion,FECHAPROXIMAEJECUCION, periodicidad, cuentausuario, configuracion)
  SELECT 'estatuto2026', CODINDICE, ejecutar, fechaultimaejecucion,FECHAPROXIMAEJECUCION, periodicidad, cuentausuario, configuracion 
  FROM INDICEGENERACION i  WHERE CODCONTENIDO = 'estatuto'; 


/*
    INSERT INTO INDICEGENERACION (codcontenido, CODINDICE, ejecutar, fechaultimaejecucion,FECHAPROXIMAEJECUCION, periodicidad, cuentausuario, configuracion)
  VALUES ('estatuto', 1, 'N', SYSDATE, NULL, NULL, 'Carolinah', '');
  INSERT INTO INDICEGENERACION (codcontenido, CODINDICE, ejecutar, fechaultimaejecucion,FECHAPROXIMAEJECUCION, periodicidad, cuentausuario, configuracion)
  VALUES ('estatuto', 2, 'N', SYSDATE, NULL, NULL, 'Carolinah', '');*/

--** PASO 3:CREAR INDICECONTENIDO no es necesario lo dejo por si acaso. 
SELECT *
FROM INDICECONTENIDO i WHERE CODCONTENIDO = 'estatuto'; 

INSERT INTO INDICECONTENIDO (codcontenido, codindice, SECGENERACION, FECHAGENERACION , xml)
SELECT  'estatuto2025', codindice, SECGENERACION, FECHAGENERACION , xml
FROM INDICECONTENIDO i WHERE CODCONTENIDO = 'estatuto'; 


SELECT COUNT(*)
FROM INDICECONTENIDO i WHERE CODCONTENIDO = 'estatuto2025'; 



-- PASO 3 ADICIONAL: ELIMINAR LA PALABRA DOCTRINA SE REALIZA SI EL USUARIO LO SOLICITA, EN CASO DE QUE EL USUARIO NO LO INDIQUE NO SE DEBE REALIZAR. 

SELECT * FROM enlaces where cod_contenido = 'estatuto2025' AND  cod_parrafo in 
(select ID from contenidoparrafo where REGEXP_LIKE(xml,'<link.*>doctrina</Link>','i') and idcontenido = 'estatuto2025');

delete FROM enlaces where cod_contenido = 'estatuto2025' AND  cod_parrafo in 
(select ID from contenidoparrafo where REGEXP_LIKE(xml,'<link.*>doctrina</Link>','i') and idcontenido = 'estatuto2025');

update contenidoparrafo set xml = '&nbsp;' 
where id in (select ID from contenidoparrafo where REGEXP_LIKE(xml,'<link.*>doctrina</Link>','i') 
and idcontenido = 'estatuto2025');


--** PASO 4: crear los contenido transformador. 
/*
-- no se utiliza 
insert into aliasobra (ALIAS, DESCRIPCION, DISPONIBLE)
values ('estatuto2025', 'ESTATUTO TRIBUTARIO 32A ED', 1);

insert into contenido (IDCONTENIDO, NOMCONTENIDO, FECHACREACION, CODUSUARIO, CODTIPOCONTENIDO, FLAGBORRADO, FLAGCONTROLCAMBIOS, FLAGCODIGOSINTERNOS, FLAGBLOQUEOSISTEMA, FLAGRESINCORDINAL, CODFICHA, CODPARRAFOINICIAL, FECHACORTE, VERSION, FECHADISPONIBILIDAD, FLAGREINDEXAR, FLAGREAGRUPAR, FECHAACTUALIZACION, FLAGSOPORTAENVIO, IDTEMP, VIGENCIA, CANTIDADPARRAFOS, FLAGMARCAR, PRIORIDADMARCADO, TIPORESERVA)
values ('estatuto2025', 'ESTATUTO TRIBUTARIO 32A ED', SYSDATE, 8963, 845, 0, 1, 0, 0, 0, 0, 0, SYSDATE, 0, SYSDATE - 1, 0, 1, SYSDATE, 1, 2528053, 1, 0, null, null, null);
*/

SELECT * FROM  contenido WHERE idcontenido = 'estatuto2025'; 
SELECT * FROM  aliasobra WHERE ALIAS = 'estatuto2025'; 


UPDATE contenido SET NOMCONTENIDO ='ESTATUTO TRIBUTARIO 32A ED' WHERE idcontenido = 'estatuto2025'; 
UPDATE aliasobra SET descripcion ='ESTATUTO TRIBUTARIO 32A ED'  WHERE ALIAS = 'estatuto2025'; 




/* -- esto ya no se usa 
INSERT INTO CONTENIDOTRANSFORMADOR
(CODCONTENIDO, CODTRANSFORMADOR, EJECUTAR, FECHAULTIMAEJECUCION, CONFIGURACION, CODCONTEXTO, COUNTTRANSFORMACIONES, FECHAPROXIMAEJECUCION, PERIODICIDAD, PORSECCIONPOSIBLE, EJECUTAR_REINCORPORACION, SECCION, SERVICIO, EJECUTAR_EXP)
VALUES('estatuto2025', 1, 'S', NULL, '<root>
  <parametros>
    <entry name="PARRAFO_INICIO">xestatuto2025.912e0b1649cb45cca222087abb93d05e</entry>
  </parametros>
</root>', 3, 0, NULL, NULL, 1, 'S', 0, 2, 'S');

INSERT INTO CONTENIDOTRANSFORMADOR
(CODCONTENIDO, CODTRANSFORMADOR, EJECUTAR, FECHAULTIMAEJECUCION, CONFIGURACION, CODCONTEXTO, COUNTTRANSFORMACIONES, FECHAPROXIMAEJECUCION, PERIODICIDAD, PORSECCIONPOSIBLE, EJECUTAR_REINCORPORACION, SECCION, SERVICIO, EJECUTAR_EXP)
VALUES('estatuto2025', 2, 'S', NULL, '<root>
  <parametros>
    <entry name="PARRAFO_INICIO">xestatuto2025.912e0b1649cb45cca222087abb93d05e</entry>
  </parametros>
</root>', 3, 0, NULL, NULL, 1, 'S', 0, 2, 'S');

INSERT INTO CONTENIDOTRANSFORMADOR
(CODCONTENIDO, CODTRANSFORMADOR, EJECUTAR, FECHAULTIMAEJECUCION, CONFIGURACION, CODCONTEXTO, COUNTTRANSFORMACIONES, FECHAPROXIMAEJECUCION, PERIODICIDAD, PORSECCIONPOSIBLE, EJECUTAR_REINCORPORACION, SECCION, SERVICIO, EJECUTAR_EXP)
VALUES('estatuto2025', 11, 'S', NULL, '<root>
  <parametros>
    <entry name="PARRAFO_INICIO">xestatuto2025.912e0b1649cb45cca222087abb93d05e</entry>
  </parametros>
</root>', 3, 0, NULL, NULL, 1, 'S', 0, 2, 'S');


INSERT INTO CONTENIDOTRANSFORMADOR
(CODCONTENIDO, CODTRANSFORMADOR, EJECUTAR, FECHAULTIMAEJECUCION, CONFIGURACION, CODCONTEXTO, COUNTTRANSFORMACIONES, FECHAPROXIMAEJECUCION, PERIODICIDAD, PORSECCIONPOSIBLE, EJECUTAR_REINCORPORACION, SECCION, SERVICIO, EJECUTAR_EXP)
VALUES('estatuto2025', 30, 'N', TIMESTAMP '2022-04-22 15:11:39.000000', '<root>
  <parametros>
    <entry name="VISTA_APPMOVIL">S</entry> 
    <entry name="INDICESINCLUIR">FALSE</entry>
  </parametros>
</root>', 3, 6, NULL, NULL, 1, 'N', NULL, 1, 'N');*/

-- para la clonacion solo el 4 y 60
-- SELECT PARRAFO INICIO 

SELECT * FROM CONTENIDOTRANSFORMADOR WHERE CODCONTENIDO = 'estatuto2025'; 

SELECT * FROM contenidoparrafo WHERE idcontenido = 'estatuto2025' AND IDANTERIOR = 'NULL'; 

INSERT INTO CONTENIDOTRANSFORMADOR
(CODCONTENIDO, CODTRANSFORMADOR, EJECUTAR, FECHAULTIMAEJECUCION, CONFIGURACION, CODCONTEXTO, COUNTTRANSFORMACIONES, FECHAPROXIMAEJECUCION, PERIODICIDAD, PORSECCIONPOSIBLE, EJECUTAR_REINCORPORACION, SECCION, SERVICIO, EJECUTAR_EXP)
VALUES('estatuto2026', 4, 'S', NULL, '<root>
  <parametros>
    <entry name="PARRAFO_INICIO">xestatuto2026.912e0b1649cb45cca222087abb93d05e</entry>
  </parametros>
</root>', 3, 0, NULL, NULL, 1, 'S', 0, 2, 'S');


INSERT INTO CONTENIDOTRANSFORMADOR
(CODCONTENIDO, CODTRANSFORMADOR, EJECUTAR, FECHAULTIMAEJECUCION, CONFIGURACION, CODCONTEXTO, COUNTTRANSFORMACIONES, FECHAPROXIMAEJECUCION, PERIODICIDAD, PORSECCIONPOSIBLE, EJECUTAR_REINCORPORACION, SECCION, SERVICIO, EJECUTAR_EXP)
VALUES('estatuto2026', 60, 'N', TIMESTAMP '2022-04-22 14:36:22.000000', '
<root>
  <parametros>
    <entry name="ALIAS">estatuto2026</entry>
    <entry name="VISTA_APPMOVIL">S</entry> 
    <entry name="INDICESINCLUIR">FALSE</entry>
    <entry name="RESUMEN_CODIGOS_INTERNOS">False</entry>
    <entry name="TITULO">ESTATUTO TRIBUTARIO 33A ED</entry>
	<entry name="FILTRA_PARRAFO">\s*&lt;Link[^&gt;]*&gt;\s*(?:doctrina|Doctrina|DOCTRINA|jurisprudencia|Jurisprudencia|JURISPRUDENCIA)\s*&lt;/Link&gt;\s*&lt;/Parrafo&gt;</entry>
	<entry name="REDIRIGIR_ENLACES">normativashd|normativashd2,doctrishd|doctrishd2,doctri|doctri2</entry>
	<entry name="CLASIFICACION">ESPECIALIZADA</entry><entry name="NORMAS_ARTICULOS">CRONOLOGICO</entry>
</parametros>
</root>
', 3, 3, NULL, NULL, 1, 'N', NULL, 1, 'N');

-- UPDATE POR SI DEBE ACTUALIZAR ALGO. 
UPDATE  CONTENIDOTRANSFORMADOR SET
CONFIGURACION = '<root><parametros> <entry name="ALIAS">estatuto2026</entry> <entry name="VISTA_APPMOVIL">S</entry> <entry name="INDICESINCLUIR">FALSE</entry> <entry name="TITULO"><entry name="PARRAFO_INICIO">xestatuto2026.912e0b1649cb45cca222087abb93d05e</entry></entry> <entry name="CLASIFICACION">ESPECIALIZADA</entry><entry name="NORMAS_ARTICULOS">CRONOLOGICO</entry> </parametros></root>'
WHERE CODCONTENIDO  = 'estatuto2026' AND CODTRANSFORMADOR = 60; 

--** PASO 5:GENERAR EL MARCAJE 

-- IR A OPTIMUS Y EJECUTAR MARCAJE EL BOTON ES UN CHULITO (pestaña revision ) Y DICE EL PROCESO. 

--** PASO 6: PREGUNTAR AL USUARIO SI DECEA QUE SE LE CREE EL FLUJO. PREGUNTAR SI ES FISICA O ELECTRONICA O AMBOS. 

--** PASO 7:  CREAR registro para la clonacion de qr. Esto tambien permite reenviar los QR  a la obra clonada. 
--Para cuando vayan a publicar, bien sea el usuario o si el usuario lo solicita.   
--**  base de datos 10.250.6.50 legisexperta

SELECT [CLONACION_CODCONTENIDO_CLON] FROM [legisxperta].[dbo].[OBR_CLONACION_REL] where [CLONACION_CODCONTENIDO_ORG] = 'estatuto';

-- se manda caso con este update 

-- update  [legisxperta].[dbo].[OBR_CLONACION_REL] set CLONACION_CODCONTENIDO_CLON = 'estatuto2025' where [CLONACION_CODCONTENIDO_ORG] = 'estatuto'; 
