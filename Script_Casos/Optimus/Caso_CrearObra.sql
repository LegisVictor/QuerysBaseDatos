--**********************************************************************************
--** 1. Creamos el registro en la base de datos tabla aliasobra  
--**********************************************************************************

SELECT * FROM aliasobra WHERE ALIAS LIKE '%sijcontrpublc%' 
SELECT * FROM contenido WHERE idcontenido LIKE '%sijcontrpublc%' 



insert into aliasobra (ALIAS, DESCRIPCION, DISPONIBLE)
values ('COMPILACION', 'Compilación Normativa Simple', 0);

BEGIN
  SPCUSER.SPCREARCONTENIDO(
    'COMPILACION',
    'Compilación Normativa Simple',
    9126,
    845,
    0,
    1,
    0,
    1
  );
END;


-- PANAMA 
/**/
insert into aliasobra (ALIAS, DESCRIPCION, DISPONIBLE)
values ('sijcontrpublc', 'Régimen de la Contratación Pública de Panamá', 0);


-- REFIDCONTENIDO IN VARCHAR2, REFNOMCONTENIDO IN VARCHAR2, REFCODUSUARIO IN NUMBER, REFTIPO IN NUMBER, REFCONTROLCAMBIOS IN NUMBER, 
-- REFCODIGOSINTERNOS IN NUMBER, REFIDFICHA IN NUMBER, REFSOPORTAENVIO IN NUMBER

insert into aliasobra (ALIAS, DESCRIPCION, DISPONIBLE)
values ('sijcontrpublc', 'Régimen de la Contratación Pública de Panamá', 0);

BEGIN
  SIJUSA.SPCREARCONTENIDO(
    'sijcontrpublc',
    'Régimen de la Contratación Pública de Panamá',
    8220,
    1066,
    0,
    1,
    0,
    1
  );
END;


INSERT INTO CONTENIDOTRANSFORMADOR
(CODCONTENIDO, CODTRANSFORMADOR, EJECUTAR, FECHAULTIMAEJECUCION, CONFIGURACION, CODCONTEXTO, COUNTTRANSFORMACIONES, FECHAPROXIMAEJECUCION, PERIODICIDAD, PORSECCIONPOSIBLE, EJECUTAR_REINCORPORACION, SECCION, SERVICIO, EJECUTAR_EXP)
VALUES('sijcontrpublc', 1, 'S', NULL, '<root>
  <parametros>
    <entry name="PARRAFO_INICIO">4C395AC8238F0164E0630A010182B2F5</entry>
  </parametros>
</root>', 3, 0, NULL, NULL, 1, 'S', 0, 2, 'S');

INSERT INTO CONTENIDOTRANSFORMADOR
(CODCONTENIDO, CODTRANSFORMADOR, EJECUTAR, FECHAULTIMAEJECUCION, CONFIGURACION, CODCONTEXTO, COUNTTRANSFORMACIONES, FECHAPROXIMAEJECUCION, PERIODICIDAD, PORSECCIONPOSIBLE, EJECUTAR_REINCORPORACION, SECCION, SERVICIO, EJECUTAR_EXP)
VALUES('sijcontrpublc', 2, 'S', NULL, NULL, 3, 0, NULL, NULL, 1, 'S', 0, 2, 'S');

INSERT INTO CONTENIDOTRANSFORMADOR
(CODCONTENIDO, CODTRANSFORMADOR, EJECUTAR, FECHAULTIMAEJECUCION, CONFIGURACION, CODCONTEXTO, COUNTTRANSFORMACIONES, FECHAPROXIMAEJECUCION, PERIODICIDAD, PORSECCIONPOSIBLE, EJECUTAR_REINCORPORACION, SECCION, SERVICIO, EJECUTAR_EXP)
VALUES('sijcontrpublc', 11, 'S', NULL, NULL, 3, 0, NULL, NULL, 1, 'S', 0, 2, 'S');


INSERT INTO CONTENIDOTRANSFORMADOR
(CODCONTENIDO, CODTRANSFORMADOR, EJECUTAR, FECHAULTIMAEJECUCION, CONFIGURACION, CODCONTEXTO, COUNTTRANSFORMACIONES, FECHAPROXIMAEJECUCION, PERIODICIDAD, PORSECCIONPOSIBLE, EJECUTAR_REINCORPORACION, SECCION, SERVICIO, EJECUTAR_EXP)
VALUES('sijcontrpublc', 4, 'S', NULL, '
<root>
  <parametros>
    <entry name="PARRAFO_INICIO">4C395AC8238F0164E0630A010182B2F5</entry>
  </parametros>
</root>
', 3, 0, NULL, NULL, 1, 'S', 0, 2, 'S');

INSERT INTO CONTENIDOTRANSFORMADOR
(CODCONTENIDO, CODTRANSFORMADOR, EJECUTAR, FECHAULTIMAEJECUCION, CONFIGURACION, CODCONTEXTO, COUNTTRANSFORMACIONES, FECHAPROXIMAEJECUCION, PERIODICIDAD, PORSECCIONPOSIBLE, EJECUTAR_REINCORPORACION, SECCION, SERVICIO, EJECUTAR_EXP)
VALUES('sijcontrpublc', 30, 'N', TIMESTAMP '2022-04-22 15:11:39.000000', '
<root>
  <parametros>
    <entry name="ALIAS">sijcontrpublc</entry>
    <entry name="VISTA_APPMOVIL">S</entry> 
    <entry name="INDICESINCLUIR">FALSE</entry>
	<entry name="PARRAFO_INICIO">4C395AC8238F0164E0630A010182B2F5</entry>
  </parametros>
</root>
', 3, 1, NULL, NULL, 1, 'N', NULL, 1, 'N');

INSERT INTO CONTENIDOTRANSFORMADOR
(CODCONTENIDO, CODTRANSFORMADOR, EJECUTAR, FECHAULTIMAEJECUCION, CONFIGURACION, CODCONTEXTO, COUNTTRANSFORMACIONES, FECHAPROXIMAEJECUCION, PERIODICIDAD, PORSECCIONPOSIBLE, EJECUTAR_REINCORPORACION, SECCION, SERVICIO, EJECUTAR_EXP)
VALUES('sijcontrpublc', 60, 'N', TIMESTAMP '2022-04-22 14:36:22.000000', '
<root>
  <parametros>
    <entry name="ALIAS">sijcontrpublc</entry>
    <entry name="VISTA_APPMOVIL">S</entry> 
    <entry name="INDICESINCLUIR">FALSE</entry>
	<entry name="PARRAFO_INICIO">4C395AC8238F0164E0630A010182B2F5</entry>
  </parametros>
</root>
', 3, 1, NULL, NULL, 1, 'N', NULL, 1, 'N');



--**********************************************************************************
--** 2. Vamos a optimus y generamos el flujo dependiendo si es fisica o no 
--**********************************************************************************

--**********************************************************************************
--** 3. Creamos el registro en la base de datos tabla contenidotransformador  
--**********************************************************************************

SELECT * FROM contenido WHERE IDCONTENIDO  =  'COMPILACION'; 
SELECT * FROM contenido WHERE IDCONTENIDO  =  'COMPILACION'; 

SELECT * FROM CONTENIDOPARRAFO WHERE IDCONTENIDO  LIKE '%COMPILACION%' 
SELECT * FROM contenidotransformador WHERE codcontenido LIKE '%COMPILACION%' 

insert into contenidotransformador (CODCONTENIDO, CODTRANSFORMADOR, EJECUTAR, FECHAULTIMAEJECUCION,
CONFIGURACION, CODCONTEXTO,
COUNTTRANSFORMACIONES, FECHAPROXIMAEJECUCION, PERIODICIDAD, 
PORSECCIONPOSIBLE, EJECUTAR_REINCORPORACION, SECCION)
values ('COMPILACION', 60, 'N', SYSDATE, 
'<root><parametros> 
<entry name="ALIAS">COMPILACION</entry> 
<entry name="VISTA_APPMOVIL">S</entry> 
<entry name="PARRAFO_INICIO">438F8B2AE9D60154E0630A0101824E4D</entry> 
<entry name="INDICESINCLUIR">FALSE</entry> 
<entry name="TITULO">Compilación Normativa Simple</entry>
<entry name="CLASIFICACION">ESPECIALIZADA</entry>
</parametros></root>', 3, 
1, null, null, 
1, 'N', 0);



update CONTENIDOTRANSFORMADOR 
set CONFIGURACION = replace(configuracion, '3AB024959DE601C8E0630A0101826DFF', 'xHabeasData.3ab024959de801c8e0630a0101826dff' ) 
WHERE CODCONTENIDO ='HabeasData'; 

-- error cuando esta mal el parrafo inicio 
Mensaje: Error al procesar el contenido [epsegsocia2009]
Desde: LEGIS.UID.Transformacion.Servicio.TransformationManager.DoWork()
Información Adicional: (null)
Excepción: System.Exception: [LEGIS.UID.Transformacion.Transformer]-LPP. [LEGIS.UID.Transformacion.Transformer]-Main. [LEGIS.UID.Transformacion.Servicio]-PipelineManager. libreria:G:\optimus\Servicios\Exportacion EPUB_Peru\LEGIS.UID.Transformacion.Pipeline.dll Clase:LEGIS.UID.Transformacion.Pipeline.ConstruirSEO
Object reference not set to an instance of an object.
   at LEGIS.UID.Transformacion.Transformer.LPP.Transform(IPipeline pipeline)
   at LEGIS.UID.Transformacion.Servicio.TransformationManager.DoWork(Object objTransformacion)

--**********************************************************************************
--** 4. Crear INDICES.
--**********************************************************************************

SELECT * FROM INDICEGENERACION i WHERE codcontenido ='COMPILACION'


SELECT * FROM usuario WHERE upper(nomusuario) LIKE upper('%IVAN%'); 



insert into indicegeneracion(codcontenido,codindice,ejecutar,fechaultimaejecucion,fechaproximaejecucion,periodicidad,cuentausuario,configuracion)
values('REFORMALABORAL',1,'N',null,null,null,'ivanaf','');


insert into indicegeneracion(codcontenido,codindice,ejecutar,fechaultimaejecucion,fechaproximaejecucion,periodicidad,cuentausuario,configuracion)
values('REFORMALABORAL',2,'N',null,null,null,'ivanaf','');




--**********************************************************************************
--** 5. Nota: Después de creada apagar el control de cambios (Validar con francisco como se hace)
--**********************************************************************************
--en el registro de la tabla contenido hay una columna para eso.. y apagar tambien que soporte envios
 
 
SELECT * FROM contenido WHERE IDCONTENIDO  =  'regaduanas'; 

update contenido set  FLAGCONTROLCAMBIOS = 0, FLAGSOPORTAENVIO = 0 WHERE IDCONTENIDO  =  'regaduanas'; 


-- CONTENIDOS ACTUALIZADOS: 
SELECT IDCONTENIDO, FLAGCONTROLCAMBIOS, FLAGSOPORTAENVIO, REFFLAGCONTROLCAMBIOS  
FROM contenido WHERE IDCONTENIDO  in (  'regaduanas', 'REFORMALABORAL', 'rie');  



SPGUARDARCAMBIOSEX