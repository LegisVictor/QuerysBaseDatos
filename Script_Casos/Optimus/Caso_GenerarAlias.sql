--**********************************************************************************
--** CASO: CLONAR OBRA SEMESTRAL
--**********************************************************************************
/*
-- Listado de codigo transformador. 
4	Marcaje de Normas
2	Marcaje de Grupos
5	Construir Indices
1	Marcaje de Contextos SAUCE
6	Marcaje de Cuentas PUC
7	Marcaje de Vigencia
8	Marcaje Enlaces Externos
9	Marcaje de Normas Textos Base
20	Actualización de Plantillas de Ayuda
3	Reemplazo valores de Expresiones
21	Remplazar Textos
14	Transformador a NXT Colecciones
15	Transformador a NXT
10	Transformador Arancel
11	Identificación de Metadata
30	Transformador a LPP //LEGAL Y APP
31	Transformador a LPP Colecciones    // LEGAL Y APP
33	Transformador a Libro Electrónico
32	Transformador a Diccionario rtf
34	Transformador a Diccionario Web
35	Transformador a LPP Clonacion // LEGAL Y APP
60	Transformador a LPP              // xperta obras normales
61	Transformador a LPP Colecciones  // xperta revistas 
65	Transformador a LPP Clonacion    // xperta clonaciones

*/
--SOLUCION: PRIMERO SE DEBE CREAR EL ALIAS, CONTENIDOTRANSFORMADOR, CONTENIDO, HACER LO DEL CPANEL Y LO DEL RASPA Y RASPA, esto ultimo cuando el usuario lo pida. . 

SELECT * FROM aliasobra WHERE ALIAS LIKE '%doctri%' 
SELECT * FROM contenido WHERE idcontenido LIKE '%doctri%'
SELECT * FROM contenidotransformador WHERE codcontenido LIKE '%carlaboral2026%' 

--- codigo tener precaucion al elegir se debe elegir el que sea 65 como codigo transformador. 

DECLARE
    v_origen_alias   VARCHAR2(50) := 'civilbasicoest2026a';       -- alias origen
    v_destino_alias  VARCHAR2(50) := 'civilbasicoest2026b';       -- alias nuevo
    v_destino_titulo VARCHAR2(200) := 'CODIGO CIVIL - COLECCION UNIVERSITARIA 19A ED';
BEGIN
    -------------------------------------------------------------------
    -- 1. aliasobra
    -------------------------------------------------------------------
    INSERT INTO aliasobra (ALIAS, DESCRIPCION, DISPONIBLE)
    SELECT 
        v_destino_alias,
        v_destino_titulo,
        DISPONIBLE
    FROM aliasobra
    WHERE ALIAS = v_origen_alias;

    -------------------------------------------------------------------
    -- 2. contenidotransformador
    --   (se copia igual, NO se cambia el XML)
    -------------------------------------------------------------------
    INSERT INTO contenidotransformador (
        CODCONTENIDO, CODTRANSFORMADOR, EJECUTAR, FECHAULTIMAEJECUCION,
        CONFIGURACION, CODCONTEXTO, COUNTTRANSFORMACIONES, FECHAPROXIMAEJECUCION,
        PERIODICIDAD, PORSECCIONPOSIBLE, EJECUTAR_REINCORPORACION, SECCION)
    SELECT  
        v_destino_alias,       -- solo cambia ID del destino
        CODTRANSFORMADOR,
        EJECUTAR,
        SYSDATE,
        CONFIGURACION,         -- XML se copia igual
        CODCONTEXTO,
        COUNTTRANSFORMACIONES,
        FECHAPROXIMAEJECUCION,
        PERIODICIDAD,
        PORSECCIONPOSIBLE,
        EJECUTAR_REINCORPORACION,
        SECCION
    FROM contenidotransformador
    WHERE CODCONTENIDO = v_origen_alias;

    -------------------------------------------------------------------
    -- 3. contenido
    -------------------------------------------------------------------
    INSERT INTO contenido (
        IDCONTENIDO, NOMCONTENIDO, FECHACREACION, CODUSUARIO, CODTIPOCONTENIDO,
        FLAGBORRADO, FLAGCONTROLCAMBIOS, FLAGCODIGOSINTERNOS, FLAGBLOQUEOSISTEMA,
        FLAGRESINCORDINAL, CODFICHA, CODPARRAFOINICIAL, FECHACORTE, VERSION,
        FECHADISPONIBILIDAD, FLAGREINDEXAR, FLAGREAGRUPAR, FECHAACTUALIZACION,
        FLAGSOPORTAENVIO, IDTEMP, VIGENCIA, CANTIDADPARRAFOS, FLAGMARCAR,
        PRIORIDADMARCADO, TIPORESERVA)
    SELECT
        v_destino_alias,       -- ID nuevo
        v_destino_titulo,      -- t�tulo nuevo
        SYSDATE,
        CODUSUARIO,
        CODTIPOCONTENIDO,
        FLAGBORRADO,
        FLAGCONTROLCAMBIOS,
        FLAGCODIGOSINTERNOS,
        FLAGBLOQUEOSISTEMA,
        FLAGRESINCORDINAL,
        CODFICHA,
        CODPARRAFOINICIAL,
        SYSDATE,
        VERSION,
        SYSDATE - 1,
        FLAGREINDEXAR,
        FLAGREAGRUPAR,
        SYSDATE,
        FLAGSOPORTAENVIO,
        NULL,
        VIGENCIA,
        CANTIDADPARRAFOS,
        FLAGMARCAR,
        PRIORIDADMARCADO,
        TIPORESERVA
    FROM contenido
    WHERE IDCONTENIDO = v_origen_alias;

    COMMIT;
END;



































-----------------carmagneticos-----------------

insert into aliasobra (ALIAS, DESCRIPCION, DISPONIBLE)
values ('carrenta2025', 'GU�A LEGIS PARA LA DECLARACI�N DE RENTA 2025', 1);

insert into contenidotransformador (CODCONTENIDO, CODTRANSFORMADOR, EJECUTAR, FECHAULTIMAEJECUCION, CONFIGURACION, CODCONTEXTO, COUNTTRANSFORMACIONES, FECHAPROXIMAEJECUCION, PERIODICIDAD, PORSECCIONPOSIBLE, EJECUTAR_REINCORPORACION, SECCION)
values ('carmagneticos2025', 65, 'N', SYSDATE, '<root><parametros> <entry name="ALIAS">carmagneticos</entry> <entry name="VISTA_APPMOVIL">S</entry> <entry name="INDICESINCLUIR">FALSE</entry> <entry name="TITULO"></entry><entry name="CLASIFICACION">PORACTIVACION</entry> </parametros></root>', 44, 1, null, null, 1, 'N', 0);


insert into contenido (IDCONTENIDO, NOMCONTENIDO, FECHACREACION, CODUSUARIO, CODTIPOCONTENIDO, FLAGBORRADO, FLAGCONTROLCAMBIOS, FLAGCODIGOSINTERNOS, FLAGBLOQUEOSISTEMA, FLAGRESINCORDINAL, CODFICHA, CODPARRAFOINICIAL, FECHACORTE, VERSION, FECHADISPONIBILIDAD, FLAGREINDEXAR, FLAGREAGRUPAR, FECHAACTUALIZACION, FLAGSOPORTAENVIO, IDTEMP, VIGENCIA, CANTIDADPARRAFOS, FLAGMARCAR, PRIORIDADMARCADO, TIPORESERVA)
values ('carmagneticos2025', 'CARTILLA MEDIOS MAGNETICOS 14A ED', SYSDATE, 1928, 1902, 0, 1, 0, 0, 0, 0, 0, SYSDATE, 0, SYSDATE - 1, 0, 1, SYSDATE, 1, null, 1, 0, null, null, null);

-----------------carrenta-----------------

insert into contenidotransformador (CODCONTENIDO, CODTRANSFORMADOR, EJECUTAR, FECHAULTIMAEJECUCION, CONFIGURACION, CODCONTEXTO, COUNTTRANSFORMACIONES, FECHAPROXIMAEJECUCION, PERIODICIDAD, PORSECCIONPOSIBLE, EJECUTAR_REINCORPORACION, SECCION)
values ('carrenta2025', 65, 'N', SYSDATE, 
'<root><parametros> <entry name="ALIAS">carrenta</entry> <entry name="VISTA_APPMOVIL">S</entry> <entry name="PARRAFO_INICIO">xcarrenta.99a197d19a78433ebedcaf285678e423</entry> <entry name="INDICESINCLUIR">FALSE</entry> <entry name="TITULO">GU�A LEGIS PARA LA DECLARACI�N DE RENTA 2025</entry><entry name="CLASIFICACION">ESPECIALIZADA</entry></parametros></root>', 44, 1, null, null, 1, 'N', 0);





-----------------ALIAS-----------------

insert into aliasobra (ALIAS, DESCRIPCION, DISPONIBLE)
values ('estatuto2025', 'ESTATUTO TRIBUTARIO 32A ED', 1);

insert into aliasobra (ALIAS, DESCRIPCION, DISPONIBLE)
values ('contebasico2019a', 'C�DIGO DE PROCEDIMIENTO ADMINISTRATIVO Y DE LO CONTENCIOSO ADMINISTRATIVO B�SICO - 15 Ed', 1);

insert into aliasobra (ALIAS, DESCRIPCION, DISPONIBLE)
values ('penalbasico2019a', 'C�DIGO PENAL Y DE PROCEDIMIENTO PENAL B�SICO - 22 Ed', 1);

insert into aliasobra (ALIAS, DESCRIPCION, DISPONIBLE)
values ('civilbasico2019a', 'C�DIGO CIVIL B�SICO - 42 Ed', 1);

insert into aliasobra (ALIAS, DESCRIPCION, DISPONIBLE)
values ('comerbasico2019a', 'C�DIGO DE COMERCIO B�SICO - 41 Ed', 1);

insert into aliasobra (ALIAS, DESCRIPCION, DISPONIBLE)
values ('constitubasico2019a', 'CONSTITUCI�N POL�TICA DE COLOMBIA 1991 B�SICO - 41 Ed', 1);

insert into aliasobra (ALIAS, DESCRIPCION, DISPONIBLE)
values ('laboralbasico2019a', 'C�DIGO LABORAL B�SICO - 43 Ed', 1);


-----------------CONTENIDO-----------------

insert into contenido (IDCONTENIDO, NOMCONTENIDO, FECHACREACION, CODUSUARIO, CODTIPOCONTENIDO, FLAGBORRADO, FLAGCONTROLCAMBIOS, FLAGCODIGOSINTERNOS, FLAGBLOQUEOSISTEMA, FLAGRESINCORDINAL, CODFICHA, CODPARRAFOINICIAL, FECHACORTE, VERSION, FECHADISPONIBILIDAD, FLAGREINDEXAR, FLAGREAGRUPAR, FECHAACTUALIZACION, FLAGSOPORTAENVIO, IDTEMP, VIGENCIA, CANTIDADPARRAFOS, FLAGMARCAR, PRIORIDADMARCADO, TIPORESERVA)
values ('estatuto2025', 'ESTATUTO TRIBUTARIO 32A ED', SYSDATE, 8963, 845, 0, 1, 0, 0, 0, 0, 0, SYSDATE, 0, SYSDATE - 1, 0, 1, SYSDATE, 1, 2528053, 1, 0, null, null, null);

insert into contenido (IDCONTENIDO, NOMCONTENIDO, FECHACREACION, CODUSUARIO, CODTIPOCONTENIDO, FLAGBORRADO, FLAGCONTROLCAMBIOS, FLAGCODIGOSINTERNOS, FLAGBLOQUEOSISTEMA, FLAGRESINCORDINAL, CODFICHA, CODPARRAFOINICIAL, FECHACORTE, VERSION, FECHADISPONIBILIDAD, FLAGREINDEXAR, FLAGREAGRUPAR, FECHAACTUALIZACION, FLAGSOPORTAENVIO, IDTEMP, VIGENCIA, CANTIDADPARRAFOS, FLAGMARCAR, PRIORIDADMARCADO, TIPORESERVA)
values ('comerbasico2019a', 'C�DIGO DE COMERCIO B�SICO - 41 Ed', SYSDATE, 3449, 1902, 0, 1, 0, 0, 0, 0, 0, SYSDATE, 1, SYSDATE - 1, 0, 1, SYSDATE, 1, 2270487, 1, 0, null, null, null);

insert into contenido (IDCONTENIDO, NOMCONTENIDO, FECHACREACION, CODUSUARIO, CODTIPOCONTENIDO, FLAGBORRADO, FLAGCONTROLCAMBIOS, FLAGCODIGOSINTERNOS, FLAGBLOQUEOSISTEMA, FLAGRESINCORDINAL, CODFICHA, CODPARRAFOINICIAL, FECHACORTE, VERSION, FECHADISPONIBILIDAD, FLAGREINDEXAR, FLAGREAGRUPAR, FECHAACTUALIZACION, FLAGSOPORTAENVIO, IDTEMP, VIGENCIA, CANTIDADPARRAFOS, FLAGMARCAR, PRIORIDADMARCADO, TIPORESERVA)
values ('civilbasico2019a', 'C�DIGO CIVIL B�SICO - 42 Ed', SYSDATE, 766, 1902, 0, 1, 0, 0, 0, 0, 0, SYSDATE, 1, SYSDATE - 1, 0, 1, SYSDATE, 1, 2270401, 1, 0, null, null, null);

insert into contenido (IDCONTENIDO, NOMCONTENIDO, FECHACREACION, CODUSUARIO, CODTIPOCONTENIDO, FLAGBORRADO, FLAGCONTROLCAMBIOS, FLAGCODIGOSINTERNOS, FLAGBLOQUEOSISTEMA, FLAGRESINCORDINAL, CODFICHA, CODPARRAFOINICIAL, FECHACORTE, VERSION, FECHADISPONIBILIDAD, FLAGREINDEXAR, FLAGREAGRUPAR, FECHAACTUALIZACION, FLAGSOPORTAENVIO, IDTEMP, VIGENCIA, CANTIDADPARRAFOS, FLAGMARCAR, PRIORIDADMARCADO, TIPORESERVA)
values ('laboralbasico2019a', 'C�DIGO LABORAL B�SICO - 43 Ed', SYSDATE, 745, 1902, 0, 1, 0, 0, 0, 0, 0, SYSDATE, 1, SYSDATE - 1, 0, 1, SYSDATE, 1, 2521669, 1, 0, null, null, null);

insert into contenido (IDCONTENIDO, NOMCONTENIDO, FECHACREACION, CODUSUARIO, CODTIPOCONTENIDO, FLAGBORRADO, FLAGCONTROLCAMBIOS, FLAGCODIGOSINTERNOS, FLAGBLOQUEOSISTEMA, FLAGRESINCORDINAL, CODFICHA, CODPARRAFOINICIAL, FECHACORTE, VERSION, FECHADISPONIBILIDAD, FLAGREINDEXAR, FLAGREAGRUPAR, FECHAACTUALIZACION, FLAGSOPORTAENVIO, IDTEMP, VIGENCIA, CANTIDADPARRAFOS, FLAGMARCAR, PRIORIDADMARCADO, TIPORESERVA)
values ('penalbasico2019a', 'C�DIGO PENAL Y DE PROCEDIMIENTO PENAL B�SICO - 22 Ed', SYSDATE, 2769, 1902, 0, 1, 0, 0, 0, 0, 0, SYSDATE, 1, SYSDATE - 1, 0, 1, SYSDATE, 1, 2270502, 1, 0, null, null, null);

insert into contenido (IDCONTENIDO, NOMCONTENIDO, FECHACREACION, CODUSUARIO, CODTIPOCONTENIDO, FLAGBORRADO, FLAGCONTROLCAMBIOS, FLAGCODIGOSINTERNOS, FLAGBLOQUEOSISTEMA, FLAGRESINCORDINAL, CODFICHA, CODPARRAFOINICIAL, FECHACORTE, VERSION, FECHADISPONIBILIDAD, FLAGREINDEXAR, FLAGREAGRUPAR, FECHAACTUALIZACION, FLAGSOPORTAENVIO, IDTEMP, VIGENCIA, CANTIDADPARRAFOS, FLAGMARCAR, PRIORIDADMARCADO, TIPORESERVA)
values ('constitubasico2019a', 'CONSTITUCI�N POL�TICA DE COLOMBIA 1991 B�SICO - 41 Ed', SYSDATE, 758, 1902, 0, 1, 0, 0, 0, 0, 0, SYSDATE, 1, SYSDATE - 1, 0, 1, SYSDATE, 1, 2268718, 1, 0, null, null, null);

insert into contenido (IDCONTENIDO, NOMCONTENIDO, FECHACREACION, CODUSUARIO, CODTIPOCONTENIDO, FLAGBORRADO, FLAGCONTROLCAMBIOS, FLAGCODIGOSINTERNOS, FLAGBLOQUEOSISTEMA, FLAGRESINCORDINAL, CODFICHA, CODPARRAFOINICIAL, FECHACORTE, VERSION, FECHADISPONIBILIDAD, FLAGREINDEXAR, FLAGREAGRUPAR, FECHAACTUALIZACION, FLAGSOPORTAENVIO, IDTEMP, VIGENCIA, CANTIDADPARRAFOS, FLAGMARCAR, PRIORIDADMARCADO, TIPORESERVA)
values ('contebasico2019a', 'C�DIGO DE PROCEDIMIENTO ADMINISTRATIVO Y DE LO CONTENCIOSO ADMINISTRATIVO B�SICO - 15 Ed', SYSDATE, 759, 1902, 0, 1, 0, 0, 0, 0, 0, SYSDATE, 1, SYSDATE - 1, 0, 1, SYSDATE, 1, 2442815, 1, 0, null, null, null);


-----------------CONTENIDOTRANSFORMADOR-----------------

insert into contenidotransformador (CODCONTENIDO, CODTRANSFORMADOR, EJECUTAR, FECHAULTIMAEJECUCION, CONFIGURACION, CODCONTEXTO, COUNTTRANSFORMACIONES, FECHAPROXIMAEJECUCION, PERIODICIDAD, PORSECCIONPOSIBLE, EJECUTAR_REINCORPORACION, SECCION)
values ('estatuto2025', 60, 'N', SYSDATE, '<root><parametros> <entry name="ALIAS">estatuto2024</entry> <entry name="VISTA_APPMOVIL">S</entry> <entry name="INDICESINCLUIR">FALSE</entry> <entry name="TITULO"></entry> <entry name="CLASIFICACION">ESPECIALIZADA</entry><entry name="NORMAS_ARTICULOS">CRONOLOGICO</entry> </parametros></root>', 44, 10, null, null, 1, 'N', 0);

insert into contenidotransformador (CODCONTENIDO, CODTRANSFORMADOR, EJECUTAR, FECHAULTIMAEJECUCION, CONFIGURACION, CODCONTEXTO, COUNTTRANSFORMACIONES, FECHAPROXIMAEJECUCION, PERIODICIDAD, PORSECCIONPOSIBLE, EJECUTAR_REINCORPORACION, SECCION)
values ('laboralbasico2019a', 35, 'N', SYSDATE, '<root><parametros> <entry name="ALIAS">laboralba</entry> <entry name="VISTA_APPMOVIL">S</entry> <entry name="INDICESINCLUIR">FALSE</entry> <entry name="TITULO"></entry> </parametros></root>', 44, 0, null, null, 1, 'N', 0);

insert into contenidotransformador (CODCONTENIDO, CODTRANSFORMADOR, EJECUTAR, FECHAULTIMAEJECUCION, CONFIGURACION, CODCONTEXTO, COUNTTRANSFORMACIONES, FECHAPROXIMAEJECUCION, PERIODICIDAD, PORSECCIONPOSIBLE, EJECUTAR_REINCORPORACION, SECCION)
values ('civilbasico2019a', 35, 'N', SYSDATE, '<root><parametros> <entry name="ALIAS">civilba</entry> <entry name="VISTA_APPMOVIL">S</entry> <entry name="INDICESINCLUIR">FALSE</entry> <entry name="TITULO"></entry> </parametros></root>', 44, 0, null, null, 1, 'N', 0);

insert into contenidotransformador (CODCONTENIDO, CODTRANSFORMADOR, EJECUTAR, FECHAULTIMAEJECUCION, CONFIGURACION, CODCONTEXTO, COUNTTRANSFORMACIONES, FECHAPROXIMAEJECUCION, PERIODICIDAD, PORSECCIONPOSIBLE, EJECUTAR_REINCORPORACION, SECCION)
values ('cgpbasico2019a', 35, 'N', SYSDATE, '<root><parametros> <entry name="ALIAS">cgprocesoba</entry> <entry name="VISTA_APPMOVIL">S</entry> <entry name="INDICESINCLUIR">FALSE</entry> <entry name="TITULO"></entry> </parametros></root>', 44, 0, null, null, 1, 'N', 0);

insert into contenidotransformador (CODCONTENIDO, CODTRANSFORMADOR, EJECUTAR, FECHAULTIMAEJECUCION, CONFIGURACION, CODCONTEXTO, COUNTTRANSFORMACIONES, FECHAPROXIMAEJECUCION, PERIODICIDAD, PORSECCIONPOSIBLE, EJECUTAR_REINCORPORACION, SECCION)
values ('contebasico2019a', 35, 'N', SYSDATE, '<root><parametros> <entry name="ALIAS">contebasico</entry> <entry name="VISTA_APPMOVIL">S</entry> <entry name="INDICESINCLUIR">FALSE</entry> <entry name="TITULO"></entry> </parametros></root>', 44, 0, null, null, 1, 'N', 0);

insert into contenidotransformador (CODCONTENIDO, CODTRANSFORMADOR, EJECUTAR, FECHAULTIMAEJECUCION, CONFIGURACION, CODCONTEXTO, COUNTTRANSFORMACIONES, FECHAPROXIMAEJECUCION, PERIODICIDAD, PORSECCIONPOSIBLE, EJECUTAR_REINCORPORACION, SECCION)
values ('penalbasico2019a', 35, 'N', SYSDATE, '<root><parametros> <entry name="ALIAS">penalpro</entry> <entry name="VISTA_APPMOVIL">S</entry> <entry name="INDICESINCLUIR">FALSE</entry> <entry name="TITULO"></entry> </parametros></root>', 44, 0, null, null, 1, 'N', 0);

insert into contenidotransformador (CODCONTENIDO, CODTRANSFORMADOR, EJECUTAR, FECHAULTIMAEJECUCION, CONFIGURACION, CODCONTEXTO, COUNTTRANSFORMACIONES, FECHAPROXIMAEJECUCION, PERIODICIDAD, PORSECCIONPOSIBLE, EJECUTAR_REINCORPORACION, SECCION)
values ('constitubasico2019a', 35, 'N', SYSDATE, '<root><parametros> <entry name="ALIAS">constituba</entry> <entry name="VISTA_APPMOVIL">S</entry> <entry name="INDICESINCLUIR">FALSE</entry> <entry name="TITULO"></entry> </parametros></root>', 44, 0, null, null, 1, 'N', 0);







-----------------ESTATUTO---------------------------------------------------------------------------------------------------------------------------------------------------

SELECT * FROM ALIASOBRA WHERE ALIAS = 'estatuto2022b'; 
SELECT * FROM CONTENIDO WHERE IDCONTENIDO   = 'estatuto2022b'
SELECT * FROM CONTENIDOTRANSFORMADOR c WHERE CODCONTENIDO  = 'estatuto2022b'


INSERT INTO ALIASOBRA
(ALIAS, DESCRIPCION, DISPONIBLE)
VALUES('estatuto2022b', 'ESTATUTO TRIBUTARIO ANTES DE LA LEY 2277 DEL 2022', 1);



INSERT INTO CONTENIDO
(IDCONTENIDO, NOMCONTENIDO, FECHACREACION, CODUSUARIO, CODTIPOCONTENIDO, FLAGBORRADO, FLAGCONTROLCAMBIOS, FLAGCODIGOSINTERNOS, FLAGBLOQUEOSISTEMA, FLAGRESINCORDINAL, CODFICHA, CODPARRAFOINICIAL, FECHACORTE, VERSION, FECHADISPONIBILIDAD, FLAGREINDEXAR, FLAGREAGRUPAR, FECHAACTUALIZACION, FLAGSOPORTAENVIO, IDTEMP, VIGENCIA, CANTIDADPARRAFOS, FLAGMARCAR, PRIORIDADMARCADO, TIPORESERVA)
VALUES('estatuto2022b', 'ESTATUTO TRIBUTARIO ANTES DE LA LEY 2277 DEL 2022', sysdate, 8963, 845, 0, 1, 1, 0, 0, 0, 3, TIMESTAMP '2022-04-22 10:12:51.000000', 1, TIMESTAMP '2015-12-31 00:00:00.000000', 1, 1, TIMESTAMP '2021-07-19 17:11:57.000000', 1, 2528053, 1, 36549, NULL, NULL, NULL);











-----------------estatuto2025-----------------











 UPDATE contenidotransformador SET configuracion =
 '<root>
  <parametros>
    <entry name="ALIAS">estatuto2025</entry>
    <entry name="VISTA_APPMOVIL">S</entry> 
    <entry name="INDICESINCLUIR">FALSE</entry>
    <entry name="RESUMEN_CODIGOS_INTERNOS">False</entry>
    <entry name="TITULO">ESTATUTO TRIBUTARIO 32A ED</entry>
	<entry name="FILTRA_PARRAFO">\s*&lt;Link[^&gt;]*&gt;\s*(?:doctrina|Doctrina|DOCTRINA|jurisprudencia|Jurisprudencia|JURISPRUDENCIA)\s*&lt;/Link&gt;\s*&lt;/Parrafo&gt;</entry>
	<entry name="REDIRIGIR_ENLACES">normativashd|normativashd2,doctrishd|doctrishd2,doctri|doctri2</entry>
	<entry name="CLASIFICACION">ESPECIALIZADA</entry><entry name="NORMAS_ARTICULOS">CRONOLOGICO</entry>
</parametros>
</root>'




WHERE codcontenido = 'estatuto2025'AND CODTRANSFORMADOR IN (60); 

