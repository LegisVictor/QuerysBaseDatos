Sitio: reader.legis.co (C3PO)
Servidores: 10.250.6.15 – 10.250.6.33
SERVIDOR DONDE ESTAN LOS ARCHIVOS HTML QUE LOS TOMA XPERTA. 

-- Revisar procesado en metis 
\\metis\InformacionEPUB\LoadUp\Procesado
Los archivos deben estar en .now actualizado al dia. 

-- SERVICIO DE DESCOMPRENSION 
EPub - descomprension 10.250.6.15 – 10.250.6.33

-- 
simback 

-- en la ruta de legisnetimput es de donde llegan los datos al simback



**************************************************************
***  PARA SABER QUE PLANTILLA DE FLUJO UTILICE
**************************************************************
SELECT * FROM proyecto WHERE CODEXTERNOTEXTO IN  ('HabeasData', 'REFORMALABORAL', 'carpeqempresa' )

SELECT * FROM PLANTILLAFLUJO p WHERE p.PLANTILLAXML  = '\29e9e64d03dda0463709992044971ece00b9.icn'



**************************************************************
***  INFORMACION GENERAL 
**************************************************************



-- Rutas metis 
METIS/informacion2 // LEGAL 
METIS/informacionPUB // XPERTA 



// PARA ACCEDER AL SERVIDOR DE LEGISNET PREPRODUCTIVO 
\\10.250.4.65\legisnet

// maquina de servicios de legisnet 
10.250.4.9
\\10.250.4.9\d$\servicios\Servicio - LCMServer

 LEGIS EDITORES SA
https://api.whatsapp.com/send?phone=+573202560891


// para buscar proyectos en el servidor. PRF_CODIGOPROYECTO

\\OPTIMUS\PROYECTOS\PRJ_3233232

// SERVICIOS DE SUNAPTICA SON DE OPTIMUS 

http://legal.synaptica.legis.com.co/Export
debe ser para exportar los tesauros de optimus


// Ambiente dionisio preproductivo servicios de optimus

https://dotnetfiddle.net/
https://docs.google.com/forms/d/12xZQluSPoXkKxyxExqaOFrFb47Jh-Q5uXCtuY3dlCvQ/edit


// eventos produccion servicios optimus 
servidor eventos METIS.LEGIS.COM 
METIS --- OPTIMUS 

**************************************************************
**************************************************************
*** PARA INSPESIONAR 
**************************************************************
C:\Users\victorg\AppData\Local\Apps\2.0\60LN3MOX.R2V\DH00OJK5.QZ8\legi..tion_0000000000000000_0001.0007_d3f2057d91cd938b\LEGIS.UIT.SAUCE.Client.Application.exe /SSID:dianaao

**************************************************************
*** PARA BUSCAR UN PARRAFO ESPECIFICO EN XPERTA. 
**************************************************************
Busquedad: id::exprenta_bf1fce542d51cf54af0a79303212cb5339fnf9
id::xcgdisciplinario.fe0049fab6f143c3bd0a35fc5ae17ec5
Base de datos: xexprenta.fce542d51cf54af0a79303212cb5339f


En el sistema optimus el cuadro que esta con el nombre de usuario tiene estos significados: 
El cuadro mas grande es conexión al servidor principal... y el mas pequeño es conexión al servidor de notificaciones
**************************************************************
*** URL IMPORTANTES. 
**************************************************************
https://regex101.com/

Ruta XMETAL: S:\Investigacion y Desarrollo\Usuarios\Francisco Gonzalez\Xmetal 10

Borrar la carpeta temporal del optimus. posiblemente este en la siguiente ruta. 
C:\Users\USUARIODERED\AppData\Roaming\Optimus  

Borrar la carpeta temporal del optimus cliente. posiblemente este en la siguiente ruta. 
C:\Users\USUARIODERED\AppData\Roaming\Optimus  

C:\Users\victorg\AppData\Roaming\Optimus   --carpeta de temporales. 

\\pruoptimus\Shared\Paquetes\Optimus 1.7.5 (Tesauros)

Para temas de aplicaciones como excel contactar a Diego Martinez.

-- listado tesauro por contenido 

SELECT
TE.IDTESAURO, TE.NOMTESAURO, CP.id
FROM 
TESAURORELACION t INNER JOIN TESAURO TE
ON t.CODTESAURO  = TE.IDTESAURO
INNER JOIN PARRAFOTESAURORELACION PT ON PT.CODTESAURORELACION = t.IDTESAURORELACION 
INNER JOIN contenidoparrafo CP ON CP.ID = PT.CODPARRAFO 
WHERE CP.IDCONTENIDO = 'laboral'


 

**************************************************************
*** CASO USUARIO NO VE OBRA EN XPERTA  
**************************************************************
1. Entrar al SSO (KEYCLOCK) y validar que el usuario en efecto no tiene la obra agregada se le agrega y ya queda listo. 

**************************************************************
*** CASO REAGRUPAR RESERVADOS.
**************************************************************
Menú de Herramientas -> primer boton 

**************************************************************
*** COMANDOS - NOTAS OPTIMUS 
**************************************************************
CTRL + R -> RESERVAR 
CTRL + G -> GUARDAR 
ENTER -> CREA UN NUEVO PARRAFO, ES AZUL 

VERDE EN EDICCION 

UN REDACTOR NO PUEDE CONFIRMAR CAMBIOS 
UN CORRECTOR ES EL QUE APRUEBA O RECHAZA LOS CAMBIOS. 

**************************************************************
*** DATOS CONEXION PRODUCCION 
**************************************************************
(DESCRIPTION = (ADDRESS = (PROTOCOL = TCP)(HOST = 10.1.1.130)(PORT = 1530)) (CONNECT_DATA = (SID = optimus) ) )
Usuario:              CONSULTABD
Clave:                L3g1spr3*

**************************************************************
*** PARA ELIMINAR UN USUARIO PARA QUE NO LE LLEGUEN MAS BOLETINES 
**************************************************************

A.   Base de Datos LegisAlDiaV2
1.        Ejecutar el siguiente Script:

update suscriptor set RecibirEmail = 0, RecibirEmailComercial = 0 where email = 'lesquivel@etek.com';

 
B.   Base de Datos HabeasData
1.        Ejecutar el siguiente Script:
 
update tblautorizacion set CodTipoAutorizacion = 3 where email = 'lesquivel@etek.com';

  
**************************************************************
*** PARA AGREGAR UN USUARIO A LEGIS AL DIA. BASE DE DATOS (LegisAlDiaV2)
**************************************************************
Buscar el correo 2022-05-23 Analitica Eliminar Análisis de Nestor


**************************************************************
*** PARA CONOCER EL ACCESO A UN PRODUCTO SEGUN UNA APLICACION 
**************************************************************

select ' ||Producto|| ' as Producto, p.id_producto, p.nomproducto, p.sil_codproducto, p.codfilial, p.codtareaenviocorreo,' ||acceso|| ' as acceso, ac.id_acceso, ac.NomAcceso, 
       ' ||AplicacionWeb|| ' as AplicacionWeb, aw.Id_AplicacionWeb, aw.NomAplicacionWeb, aw.URL 
from  Producto p  
 inner join AccesoProducto ap on p.Id_Producto = ap. CodProducto
 inner join acceso ac on ap.CodAcceso = Id_Acceso
 inner join AplicacionWeb aw on Id_AplicacionWeb = CodAplicacionWeb
 where aw.Id_AplicacionWeb = 40 

-- EJEMPLO 
select * from aplicacionweb
select * from acceso where CodAplicacionWeb = 40
select  * from AccesoProducto where CodAcceso = 504
select * from producto where id_producto in (8003,9919,9920)


**************************************************************
*** PARA AGREGAR UN USUARIO A LEGIS AL DIA. BASE DE DATOS (LegisAlDiaV2)
**************************************************************
INSERT INTO SeleccionEnvioBoletin
(NomSuscriptor, Email, CumpleHabeasData, ActivoLegisMovil, ActivoLegisAlDia, ActivoOtros, ElegibleBoletin, ListaDistribucion, CausaNoElegible)
VALUES ('Martha Vásquez', 'mvasquez@garantiascaribe.com', 0, 0, 1, 0, 1, 'LEGIS AL DIA V2 P00100', null);

 

UPDATE TramasSuscripLegisAlDia
SET TramaProcesada = REPLACE(TramaProcesada, 'mvasquez@garantiascaribe.com', 'nonvalidemail.mvasquez@garantiascaribe.com'),
email = 'nonvalidemail.mvasquez@garantiascaribe.com',
TipoTrama = '---'
WHERE id_TramaProcesada = 19443585;


**************************************************************
*** PARA Boletín Legis al Día agregar usuario .   Base de Datos NuevoLegisMovil
**************************************************************

1.        Ejecutar el siguiente Script:

 

INSERT [NuevoLegisMovil].[dbo].[fuenteexterna_210]

(NomFuenteExterna, Email, QueryString, RecibirEmail, FechaFin)

VALUES ('Martha Vásquez','mvasquez@garantiascaribe.com','Query','1', '01-01-2032');

 

INSERT [NuevoLegisMovil].[dbo].[fuenteexterna_210]

(NomFuenteExterna, Email, QueryString, RecibirEmail, FechaFin)

VALUES ('J.C. Gutiérrez Consultores','jgutierrez@jcgconsultores.com','Query','1', '01-01-2032');

 
**************************************************************
*** CASO: USUARIO NO PUEDE ELIMINAR UN PARRAFO  
**************************************************************
1. CONSULTAR LOS PARRAFOS Y VALIDAR QUE EL FLAGCODIGOINTERNO NO ESTE EN 1 

SELECT FLAGCODIGOINTERNO FROM CONTENIDOPARRAFO c WHERE ID ='xuvresoluciones.c02e666bb67c4e19ace5f23d5b131978'
SELECT FLAGCODIGOINTERNO FROM CONTENIDOPARRAFO c WHERE ID ='xuvresoluciones.db20892f99614b238e09e3a2a429d7c0'

2. VALIDAR QUE EL PARRAFO NO TENGA INFORMACION EN LA TABLA CONTENIDOCODIGOINTERNO

SELECT * FROM CONTENIDOCODIGOINTERNO c WHERE IDPARRAFO  ='xuvresoluciones.db20892f99614b238e09e3a2a429d7c0'

3. SI EL PARRAFO NO TIENE INFORMACION EN CONTENIDOCODIGOINTERNO REALIZAR UPDATE 

UPDATE  CONTENIDOPARRAFO SET FLAGCODIGOINTERNO = 0 WHERE ID ='xuvresoluciones.c02e666bb67c4e19ace5f23d5b131978'
UPDATE  CONTENIDOPARRAFO SET FLAGCODIGOINTERNO = 0 WHERE ID ='xuvresoluciones.db20892f99614b238e09e3a2a429d7c0'


-- EN OCACCIONES EL USUARIO NO PUEDE ELIMINAR VALIDAR TAMBIEN EL CAMPO 
UPDATE  CONTENIDOPARRAFO SET FLAGCODIGOINTERNO = 0, FLAGSISTEMA = 0 WHERE ID ='xestatuto.a84ef7ea6dff01d8e0530a010182046b'; 

**************************************************************
*** CASO: OBRA NO SE DEJA PUBLICAR PORQUE ESTA EN USO   
**************************************************************

1. CONSULTAR LA OBRA DEBE ESTAR CON FLAGBORRADO EN 1  se revisa en esa tabla que la obra no este en uso si esta en uso se hace el update a flagborrado para que el trigger se ejecute y ya puedan modificar

SELECT * FROM CONTENIDOUSUARIO  WHERE IDCONTENIDO = 'normativanai' AND FLAGBORRADO = 0 AND CODPROYECTO IS NOT NULL; 

2. REALIZAR UPDATE 
	
UPDATE CONTENIDOUSUARIO SET FLAGBORRADO = 1 WHERE IDCONTENIDO = 'normativanai' AND FLAGBORRADO = 0; 
	 

**************************************************************
*** CASO: CAMBIOS PENDIENTES EN UNA OBRA
**************************************************************
1. MIRAR LAS TABLAS DE CONTENIDOCONTROLCAMBIOS Y DE CONTENIDOPARRAFOCAMBIO
TENER EN CUENTA QUE LA SEGUNDA TABLA TIENE EL CODIGO DEL PROYECTO ASOCIADO. 
2. LAS ACCIONES DE LOS USUARIOS A NIVEL DE CAMBIO DEBEN TENER UN REGISTRO EN CONTENIDOUSUARIO EL CUAL TIENE EL CODUSUARIO Y EL CODPROYECTO ASOCIADO. 

SELECT COUNT(CP.ID) CAMBIOS FROM CONTENIDOPARRAFO CP
WHERE IDCONTENIDO='legfinan' AND FLAGBORRADO=0 AND (FLAGNUEVO=1 OR FLAGMODIFICADO=1) AND REGEXP_LIKE(CP.XML, '<\?(xm-insertion_mark_start|xm-deletion_mark)')

SELECT COUNT(CP.ID) CAMBIOS FROM CONTENIDOPARRAFO CP WHERE IDCONTENIDO='legfinan' AND FLAGBORRADO=1;

SELECT * FROM CONTENIDOCONTROLCAMBIOS WHERE IDCONTENIDO IN ('legfinan');

SELECT * FROM CONTENIDOPARRAFOCAMBIO WHERE CODPROYECTO IN ('3216872') ;

**************************************************************
*** CASO: MODIFICAR TAREA EN OBRA. REACTIVAR TAREA 
**************************************************************
 Nota: en caso que no funcione ir a la carpeta del proyecto y eliminar los archivos de log. \\optimus\proyectos\prj_3215899 con el id del proyecto.

  -- BUSCAR USUARIO   
SELECT * FROM USUARIO u WHERE NOMUSUARIO LIKE '%Martha%'
-- BUSCAR PROYECTO 
SELECT * FROM PROYECTO p WHERE ID_PROYECTO = 3215899 
-- BUSCAR TAREA 
SELECT * FROM TAREA t WHERE CODUSUARIO =759 AND NOMTAREA  LIKE '%Modificar obra%' --AND  CODETAPA = 824265 
ORDER BY FECHACREACION desc
-- BUSCAR ETAPAS 
SELECT * FROM ETAPA e WHERE e.ID_ETAPA = 3658112
-- CONSULTA 

SELECT T.*, '  -- -- ETAPA   ' ,E.*, '  -- -- PROYECTO   ', P.* FROM PROYECTO p 
INNER JOIN ETAPA e ON p.ID_PROYECTO = e.CODPROYECTO 
INNER JOIN TAREA t ON t.CODETAPA = e.ID_ETAPA 
--INNER JOIN DOCUMENTOTAREA d  ON t.ID_TAREA = d.CODTAREA 
--INNER JOIN DOCUMENTO d2 ON d2.ID_DOCUMENTO = d.CODDOCUMENTO 
--INNER JOIN USUARIO u ON u.ID_USUARIO = t.CODUSUARIO 
WHERE --P.ID_PROYECTO =3238254 AND
E.ALIAS = 'MO' AND T.ID_TAREA IN (3755400, 3755075, 3756704) -- AND T.CODUSUARIO = 8863 ORDER BY E.ID_ETAPA

SELECT * FROM TAREA WHERE CODETAPA IN (3658112, 3659192);
SELECT * FROM ETAPA e WHERE e.ID_ETAPA IN (3658112, 3659192);

SELECT * FROM CONTENIDOFLUJO c WHERE CODPROYECTO IN (3215489,
3215899,
3238303)

SELECT * FROM PLANTILLAFLUJO p WHERE PLANTILLAXML = '\7d78dd4d0c7ba04154080d60443cc507e05a.icn'

SELECT * FROM FLUJODISPARABLE f WHERE CODPLANTILLAFLUJO  = '4231'




-- UPDATE 

 --UPDATE TAREA SET FECHACERRADA = NULL, FLAGCERRADA = 0 WHERE ID_TAREA = 3755400;
 --UPDATE ETAPA SET FECHAFIN = NULL, SALIDA =  NULL, FLAGPENDIENTE = 1 WHERE ID_ETAPA = 3658112;


 --UPDATE TAREA SET FECHACERRADA = NULL, FLAGCERRADA = 0, CODUSERCLOSE = NULL, FLAGESCALADO = 0  WHERE ID_TAREA = 3755400;
 --UPDATE ETAPA SET FECHAFIN = NULL, SALIDA =  NULL, FLAGPENDIENTE = 0 WHERE ID_ETAPA = 3658112;

SELECT  T.FECHACERRADA, T.FLAGCERRADA FROM TAREA T WHERE ID_TAREA = 3755400
SELECT  T.SALIDA, T.FECHAFIN FROM ETAPA T  WHERE ID_ETAPA = 3658112


 SELECT NOMDOCUMENTO, RUTA, FECHA, TRANSITIVO AS PUBLICO,E.CODPROYECTO, U.NOMUSUARIO NOMUSUARIO, D.ID_DOCUMENTO IDANEXO, PF.NOMPLANTILLAFLUJO
		  FROM CONTENIDO C INNER JOIN PROYECTO P ON C.IDCONTENIDO=P.CODEXTERNOTEXTO INNER JOIN ETAPA E ON P.ID_PROYECTO=E.CODPROYECTO
		  INNER JOIN TAREA T ON E.ID_ETAPA=T.CODETAPA INNER JOIN DOCUMENTOTAREA DT ON T.ID_TAREA=DT.CODTAREA INNER JOIN DOCUMENTO D
		  ON DT.CODDOCUMENTO=D.ID_DOCUMENTO INNER JOIN USUARIO U ON D.CODUSUARIO = U.ID_USUARIO INNER JOIN PLANTILLAFLUJO PF
		  ON REPLACE(P.PLANTILLAXML, '_mtdt','') = PF.PLANTILLAXML WHERE IDCONTENIDO IN('legfinan')  ORDER BY D.ID_DOCUMENTO DESC










**************************************************************
*** CASO: UVT CAMBIO DE AÑO 
**************************************************************

1. CAMBIAR LOS VALORES GENERAL EN EL SISTEMA. 
2. IR A LA OBRA Y EN LA LLAVE DE HERRAMIENTAS SE SELECCIONAN EL VALOR PARA AJUSTARLO A LA VIGENCIA DESEADA. 
3. SE REALIZA EL PANTALLAZO PARA EL HISTORICO DE LA OBRA SEGUN LAS FECHAS INDICADAS POR EL USUARIO. 
4. ESPERAR A QUE LA FOTOGRAFIA SE HAYA TOMADO. 
5. CAMBIAR NUEVAMENTE LOS VALORES GENERALES. 
6. CAMBIAR NUEVAMENTE LOS VALORES EN LA OBRA 

**************************************************************
*** CASO: CORREGIR ORDINALES. 
**************************************************************

begin
SPResincordinaldiferidoex('50a7e518e07f4b4cb872eab68f968638');
end;

**************************************************************
*** CASO: PUBLICAR O EXPORTAR OBRA 
**************************************************************






select * from contenidotransformador WHERE CODTRANSFORMADOR IN (30, 60) and codcontenido = 'legfinan' ;

update CONTENIDOTRANSFORMADOR set ejecutar='S' , COUNTTRANSFORMACIONES=0, FECHAULTIMAEJECUCION = NULL WHERE CODTRANSFORMADOR IN (30, 60) and codcontenido IN ('legfinan');


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


METIS/informacion2 // LEGAL 
METIS/informacionPUB // XPERTA 


**************************************************************
*** CASO: CAMBIAR FECHA EN HISTORICO DE NORMAS 
**************************************************************

Se debe enviar correo a qa 

SERVIDORES DE BASE DE DATOS LPP_HISTORICO_NORMAS  (10.250.4.79)

1.	En la base de datos LPP_HISTORICO_NORMAS  ejecutar los  scripts.

update hn set hn.FECHAFINVIGENCIA='2021-12-31 00:00:00.000'
from HistoricoContenidoNorma hn
inner join ContenidoNorma cn  on cn.IDCONTENIDONORMA=hn.CODCONTENIDONORMA
where CODCONTENIDO ='protribu' and FECHAFINVIGENCIA='2022-12-31 00:00:00.000' 
and FECHACREACION between '2022-01-11 09:00:39.017' and '2022-01-11 10:01:39.017'


**************************************************************
*** CASO: CORREGIR ENLACES 
**************************************************************

1. CONSULTAMOS LOS PARRAFOS QUE PRESENTAN PROBLEMA 

SELECT id, IDANTERIOR , IDSIGUIENTE , IDCONTENIDO, ordinal  FROM CONTENIDOPARRAFO c WHERE c.IDCONTENIDO  = 'comercio'  
--AND ID IN ('xcomercio.8d82b742bd1946028980baf5381c0284', 'IdAnterior: xcomercio.81c97457948b409bbca36c6a63fae183', 'xcomercio.b7a904dffbcb4087a54ccc96e1a5fcde')
AND ordinal BETWEEN 650100  AND 652100  ORDER BY ordinal desc 

EJEMPLO 

 Error de enlazamiento "IDSIGUIENTE" duplicado...
      ID parrafo erroneo: xfinancie.fae2215dd70542d1a961d5be4aa4da88  /  IdSiguiente: xfinancie.5bff9f6c9c1e491ebae43ef066199b46
      ID parrafo erroneo: xfinancie.ce0547e665e94cf2800ac2ce6981fb56  /  IdSiguiente: xfinancie.5bff9f6c9c1e491ebae43ef066199b46 -- es el bueno 

  Error de enlazamiento "IDANTERIOR" duplicado...
      ID parrafo erroneo: xfinancie.5bff9f6c9c1e491ebae43ef066199b46  /  IdAnterior: xfinancie.ce0547e665e94cf2800ac2ce6981fb56 -- es el bueno 
      ID parrafo erroneo: xfinancie.267a4a166aaa4e049abef7e7399a682e  /  IdAnterior: xfinancie.ce0547e665e94cf2800ac2ce6981fb56 -- xfinancie.e4ad712968634f34838b292265a367c4 

2. REALIZAMOS UPDATE 

update contenidoparrafo set idsiguiente = '' where id = '';
update contenidoparrafo set idanterior = '' where id = '';
SPResincordinaldiferidoex('doctri');


**************************************************************
*** CASO: CALCULAR PESO DE LA OBRA
**************************************************************

En \\metis busca la carpeta del epub de la obra y mira cuanto pesa
\\metis\InformacionEPUB\WorkSpace\LPP

**************************************************************
*** CASO: ELIMINACION DE NORMA COMPLEMENTARIA 
**************************************************************



caso de eliminacion 
SELECT nu.IDNORMAUBICACION FROM NORMA_UBICACION nu WHERE CODPARRAFO = 'xnormativashd.1cc578b97f78467b8db9ca74298118ba';



SELECT * FROM NORMA_ARTICULOS_RELACION nar WHERE IDNORMAUBICACION = 300394;



SELECT * FROM NORMA_ARTICULOS_UBICACION nau WHERE IDARTICULOUBICACION = 1195070; -- xnormativashd.c4a1fa23c8ce4f8480a7d27906bf48c8



SELECT * FROM NORMACOMPLEMENTARIA n WHERE CODARTICULOUBICACIONPADRE = 1195070;
SELECT * FROM NORMACOMPLEMENTARIA n WHERE CODARTICULOUBICACIONCOMP = 1195070;



DELETE FROM NORMACOMPLEMENTARIA n WHERE CODARTICULOUBICACIONCOMP = 1195070;


**************************************************************
*** CASO CAMBIO QR DE UN PARRAFO A OTRO 
**************************************************************

-- PASO 1 CAMBIAR CONTENIDPARRAFO 
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
*** CASO: a veces si se publica y no se actualiza pasar correo a soportehosting ya que las tareas se traban 
**************************************************************

Por favor, me colaboran validando el servicio de synback de xperta que se encarga de sincronizar la máquina 10.250.6.9 con los servidores de Xperta 10.250.6.15 y 10.250.6.33, donde la carpeta destino es E:\readium-js-viewer\epub_content. 
Motivado a que en los últimos días, se ha presentado mucho inconveniente de actualización en las obras que se han publicado. 

**************************************************************
*** CASO: si se publica y se necesita eliminar algo se podria hacer esto
**************************************************************


pues me toco coger el control de cambios de estatuto
SELECT *
FROM CONTENIDOCONTROLCAMBIOS
WHERE FLAGBORRADO=0 and IDCONTENIDO in
('estatuto') ORDER BY ORDINAL

con esos parrafos

ir a metis y buscar los contextos que cambiaron

traerlos de estatuto normal que si se publicaron hasta cuando dijo Edwin

reemplazar los alias de estatuto a estatuto2

de doctri a doctri2
y enviar un paso al servidro de archivos

para que el synback lo replique espero que con eso funcione


**************************************************************
*** CASO: VIDEOS DE QR INACTIVOS  
**************************************************************
HABLAR CON: Edgar León
Reemplazo por: Edisson Ortiz Jimenez

**************************************************************
*** CASO: PARA AVANZAR TAREA 
**************************************************************
1. SE INGRESA COMO EL USUARIO 
2. APROBAR FLUJO: CLICK EN SI, Y CERRAR 
3. DEVOLVER FLUJO: CLICK EN NO, Y CERRAR 

**************************************************************
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

							  
**************************************************************
*** CASO texto subrayado por etiqueta  
**************************************************************	
	
	replanzar esta etiqueta por
	<Symbol class=""> espacio en blanco. 
	
**************************************************************
*** CASO ELIMINAR DOCTRINA  
**************************************************************						  
SELECT  xml,  '''' || c.id || ''',' AS id_p, c.* FROM CONTENIDOPARRAFO c 
WHERE IDCONTENIDO  = 'estatuto2022' AND xml LIKE  '%Link%idlink%Doctrina%Link%' --AND xml not LIKE '%broken%'
AND FLAGBORRADO  = 0 and rownum <= 20;


SELECT  xml,  '''' || c.id || ''',' AS id_p,c.* FROM CONTENIDOPARRAFO c WHERE ID IN ()

UPDATE CONTENIDOPARRAFO SET FLAGBORRADO = 2 WHERE ID IN ();  
									
**************************************************************
*** CASO INFORMACION DE FICHA 
**************************************************************	
1. BUSCAR EN LA TABLA CONTENIDO EL ID_FICHA RELACIONADO A LA FICHA O OBRA, 

SELECT * FROM contenido WHERE IDCONTENIDO IN ( 'rcontador')	

2. BUSCAR EL CONTENIDOADICIONALVALOR 
SELECT  v.* FROM CONTENIDOADICIONALVALOR v WHERE CODFICHA = 1098897 AND CODCONTENIDOADICIONAL =5108; 

3. PUBLICAR, TENER EN CUENTA QUE SI SON REVISTAS O SENTENCIAS A VECES EL CONTENIDO NO APARECE EN CONTENIDOTRANSFORMADOR, EN ESE CASO IR AL SERVIDOR DE BALDER Y BUSCAR EN LA TABLA DE OBR_MAESTRO_OBRAS DEL .50							
									
									
									
**************************************************************
*** ERROR LINK 
**************************************************************								

idlink="" esta vacio en el xml del parrafo por lo cual hay que volver a crear el link borrando primero las etiquetas del link y luego crearlio en el sistema. 
									
									
<Parrafo id="x2da431c0a6cc44288d739267db51c6cc.62ed72b9128244afb60ad569b5fd495f" refid="-1" grupo="ND" class="nueve" flagnuevo="1" flageditable="2" flagdirty="0" flagvista="0" flagsistema="0" flagborrado="0" flagnota="0" flagtesauro="0" flagestado="0" flagtabla="0" idsiguiente="x2da431c0a6cc44288d739267db51c6cc.58934b32e2954cee870de48a0609b143" idanterior="x2da431c0a6cc44288d739267db51c6cc.d8caaa5115ac40618ce148988e3cfdd4" ordinal="7349.0000" hash=""><Negrita>(Nota: Modificado por la <Link id="3714027" idlink="">Resolución 161 de 2022 artículo 1°</Link> de la Secretaría de Hacienda) </Negrita><Negrita></Negrita></Parrafo>



**************************************************************
*** CASO: ELIMINAR CONTENIDO. 
**************************************************************

paso 1 verificar que este vacio el documento 
paso 2 obtengo el contenidoid
paso 3 ir al icono de herramienta 
paso 4 caneca (papelera )
paso 5 coloco el identificado y eliminar. 


**************************************************************
*** CASO: PAGINA PARA LO DE LA CLONACION 
**************************************************************

https://cpanel.xperta.legis.co/
 
USUARIO:  
julio.villamil@legis.com.co
 
PASSWORD: 123456789

-- preproductivo 
http://10.250.4.234/home/dashboard


-- TOCA HACER LOS INSERT EN ESTAS TRES TABLAS UNA VEZ SE HAGA UNA CLONACION y PUBLICAR
SELECT * FROM ALIASOBRA WHERE ALIAS LIKE '%estatuto202%'

SELECT * FROM CONTENIDO WHERE IDCONTENIDO  like '%estatuto202%'

SELECT * FROM CONTENIDOTRANSFORMADOR c WHERE CODCONTENIDO like '%estatuto2021%'

PASOS: 
1. COPIAR UN REGISTRO EN EL CONTENT 
2. CREAR LA PORTADA CON EL EXCEL 

**************************************************************
*** PASOS PARA PUBLICAR OBRA EN APP (PUBLICACIONES LEGIS) legisnet
**************************************************************	
1. CREAR LOS ARCHIVOS DE c3po2, catalog, imgapp, imglnet.   (en este paso crear la portada con generaimagenpub.exe)
2. realizar insert con CrearObra_VersionNestor
3. validar con el query de VERIFICAR QUE ESTE MARCADA PARA APPS (SALANXT) debe dar 1
4. Exportar obra. 
5. validar en la APP


**************************************************************
*** VERIFICAR QUE ESTE MARCADA PARA APPS (SALANXT)
**************************************************************									   

SELECT TOP 1 
  CASE WHEN ISNULL(OC1.Atributo, 0)='1'
  OR ISNULL(OC2.Atributo, 0)='1' THEN '1'
  ELSE '0' END
FROM Obra O 
LEFT OUTER JOIN ObraCampos OC1 ON 
OC1.Id_Obra = O.Alias
AND OC1.Id_Campo = 39 -- Disponible en Apps.
LEFT OUTER JOIN ObraCampos OC2 ON 
OC2.Id_Obra = O.Alias
AND OC2.Id_Campo = 40 -- eBook para Apps.
WHERE
  O.Alias = 'civilbasicoested13'



**************************************************************
*** CASO: OBRA EN SESSION MUESTRA MAS INFORMACION DE LO NORMAL 
**************************************************************	

EJECUTAR ORDENAMIENTO DE ORDINALES. 


**************************************************************
*** CASO: CODIGOS DE REGALOS CLAVES... 
**************************************************************
Mirar tablas: legisjoven y scala. 

SALANXT portal web 


**************************************************************
*** CASO: INACTIVAR A USUARIOS. 
**************************************************************

SELECT FLAGBORRADO, FLAGACTIVO FROM  USUARIO u WHERE NOMUSUARIO LIKE '%Felipe%' AND id_usuario = 9024; 

 
UPDATE  USUARIO SET FLAGBORRADO = 1, FLAGACTIVO = 0 WHERE NOMUSUARIO LIKE '%Felipe%' AND id_usuario = 9024; 

**************************************************************
*** CASO: AYUDAS PRACTICAS
**************************************************************	

SELECT * FROM CONTENIDOADICIONAL c2  WHERE NOMCONTENIDOADICIONAL LIKE '%DOCUMENTO%'

SELECT P.CODPARRAFO , P.VALOR, P.CODCONTENIDOADICIONAL ,c.IDCONTENIDOADICIONAL, c.NOMCONTENIDOADICIONAL, c.TIPODATO 
FROM PARRAFOADICIONALVALOR P INNER JOIN CONTENIDOADICIONAL c ON P.CODCONTENIDOADICIONAL = c.IDCONTENIDOADICIONAL WHERE CODCONTENIDO = 'carmagneticos'

UPDATE PARRAFOADICIONALVALOR  SET CODCONTENIDOADICIONAL ='5210' WHERE CODCONTENIDO = 'carmagneticos'; 

**************************************************************
*** CASO: USUARIO OBRA CON OTRA VERSION  
**************************************************************	

-- CONSULTAR USUARIO Y ATENCION
SELECT us.Id_Usuario, us.NomUsuario, us.Usuario, us.clave,  -- us.*  -- DATOS DE USUARIO
      ate.Id_Atencion, ate.CodCiudad, ate.EstadoAtencion, ate.TipoAtencion, ate.CodOrigenAtencion, ate.fechamodificacion, --ate.* -- DATOS DE ATENCION 
	  sus.Id_Suscripcion,  -- sus.* -- DATOS SUSCRIPCION 
	  pro.Id_Producto, pro.NomProducto, pro.Sil_CodProducto --pro.*
FROM [Scala].[dbo].[Usuario] us 
INNER JOIN [Scala].[dbo].[Atencion] ate 
ON us.Id_Usuario = CodUsuario INNER JOIN [Scala].[dbo].[Suscripcion] sus 
ON sus.CodAtencion = ate.Id_Atencion INNER JOIN [Scala].[dbo].[Producto] pro 
ON pro.Id_Producto = sus.CodProducto
WHERE us.usuario = 'anapueca@unisabana.edu.co'

-- CONSULTAR PRODUCTOS. 
SELECT * FROM [Scala].[dbo].[Producto] pro WHERE NomProducto like 'CÓDIGO DE COMERCIO - COLECCIÓN UNIVERSITARIA%%'
 -- 10185 -- 13a 
 -- 10063 -- 12a 


-- CONSULTAR SUSCRIPCION EN ESCALA 
SELECT obra='comerbasicoested13', obra, CodObra ='1000000068', CodObra, CODPRODUCTOSCALA = '10185' , CODPRODUCTOSCALA
FROM [dbisapi].[dbo].[UserObra] WHERE CodSuscripcionScala = 2350002
	
--UPDATE 	
	
update [dbisapi].[dbo].[UserObra] set obra='comerbasicoested13', CodObra ='1000000068', CODPRODUCTOSCALA = '10185' where CodSuscripcionScala = 2350002; 
update [Scala].[dbo].[Suscripcion] set CodProducto = '10185' where codatencion = '782656' and CodProducto = '10063';





**************************************************************
*** ANALISIS DE SENTENCIAS CONSULTA. 
**************************************************************	
select  
  F.FLAGEXPORTAR,  aj.id_analisis_juridico, 
  nvl(aj.NOMBRE_ANALISISJURIDICO, 'Análisis Jurídico') NOMBREANALISIS, ns.NOMBRE_SECCION TITULOSENTENCIA, 
  CAT.NOMCATEGORIA AREANOMBRE, CAT.CODCONTENIDO AREAALIAS, LJ.DESCRIPCION LINEANOMBRE, LJ.ALIAS LINEAALIAS 
from ANALISIS_JURIDICO aj  
  inner join NOMBRE_SECCION ns on ns.ID_NOMBRE_SECCION = aj.ID_NOMBRE_SECCION 
  INNER JOIN CONTENIDOENTIDADORIGEN CEO ON CEO.CODFICHA = aj.ID_FICHA 
  INNER JOIN ENTIDADORIGEN EO ON EO.IDENTIDADORIGEN = CEO.CODENTIDADORIGEN 
  INNER JOIN FICHA F ON f.id_ficha = aj.id_ficha 
  inner join CATEGORIA cat on cat.idcategoria = aj.codcategoria 
  INNER JOIN LINEAS_JURISPRUDENCIA LJ ON LJ.ID_LINEA = AJ.CODLINEA 
  LEFT OUTER JOIN SALA S ON S.IDSALA = CEO.CODSALA 
  LEFT OUTER JOIN SECCION SE ON SE.IDSECCION = CEO.CODSECCION 
  INNER JOIN CONTENIDO C ON SUBSTR(C.IDCONTENIDO, 1, 33) = SUBSTR(NS.ID_PARRAFO, 2, INSTR(NS.ID_PARRAFO, '.')-2) 
  INNER JOIN CLASIFICACIONCONTENIDO CC ON CC.IDCLASIFICACIONCONTENIDO = C.CODTIPOCONTENIDO 
order by   ns.NOMBRE_SECCION;  

**************************************************************
*** FLUJOS NO SE VEN O NO SE VISUALIZAN DE MANERA CORRECTA 
**************************************************************	
reiniciar el servicio SMARTFLOW en el servidor de OPTIMUS 

**************************************************************
*** 
**************************************************************	

      SELECT cci.*, cp.*,  cci."ID", cci.IDANTERIOR, cci.IDSIGUIENTE, cci.FLAGRANGORESERVADO, cci.IDPARRAFO
        FROM CONTENIDOCODIGOINTERNO cci
        inner join contenidoparrafo cp on cci.IDPARRAFO = cp.id         
       WHERE cci.IDCONTENIDO = 'pruebasv' AND cci.VALOR0 >=1 AND cci.VALOR0 BETWEEN 8037 AND 9000
       ORDER BY cci.valor0 desc;
       
      
          SELECT CP.ORDINAL, cci.*, cci."ID", cci.IDANTERIOR, cci.IDSIGUIENTE, cci.FLAGRANGORESERVADO, cci.IDPARRAFO
        FROM CONTENIDOCODIGOINTERNO cci
        inner join contenidoparrafo cp on cci.IDPARRAFO = cp.id         
       WHERE cci.IDCONTENIDO = 'pruebasv' AND cci.VALOR0 >=1 AND cci.VALOR0 BETWEEN 8036 AND 9000 
       ORDER BY cci.valor0 desc;
       
      
            SELECT CP.ORDINAL, cci.*, cci."ID", cci.IDANTERIOR, cci.IDSIGUIENTE, cci.FLAGRANGORESERVADO, cci.IDPARRAFO, cp.*
        FROM CONTENIDOCODIGOINTERNO cci
        inner join contenidoparrafo cp on cci.IDPARRAFO = cp.id         
       WHERE cci.IDCONTENIDO = 'pruebasv' AND cci.VALOR1 >=1 --AND cp.ORDINAL BETWEEN 2209000 AND 2220600 
       ORDER BY cci.valor0 desc;
      
      
             SELECT CP.ORDINAL, cci.*, cci."ID", cci.IDANTERIOR, cci.IDSIGUIENTE, cci.FLAGRANGORESERVADO, cci.IDPARRAFO, cp.*
        FROM CONTENIDOCODIGOINTERNO cci
        inner join contenidoparrafo cp on cci.IDPARRAFO = cp.id         
       WHERE cci.IDCONTENIDO = 'pruebasv' AND cp.ESTILO = 'nueve-titulo' --AND cp.ORDINAL BETWEEN 2209000 AND 2220600 
       ORDER BY cci.valor0 desc;
       
      2209000
      2220600
      
      
        SELECT CP.ORDINAL, cci.*, cci."ID", cci.IDANTERIOR, cci.IDSIGUIENTE, cci.FLAGRANGORESERVADO, cci.IDPARRAFO, cp.*
        FROM CONTENIDOCODIGOINTERNO cci
        inner join contenidoparrafo cp on cci.IDPARRAFO = cp.id         
       WHERE cci.IDCONTENIDO = 'pruebasv' AND cp.ESTILO = 'nueve-titulo' --AND cp.ORDINAL BETWEEN 2209000 AND 2220600 
       ORDER BY cci.valor0 desc;
       }
	   



SELECT cci."ID", cci.IDANTERIOR, cci.IDSIGUIENTE, cci.FLAGRANGORESERVADO, cci.IDPARRAFO, cp.ORDINAL, 1 AS ES_CODIGOINTERNO 
        FROM CONTENIDOCODIGOINTERNO cci
        inner join contenidoparrafo cp on cci.IDPARRAFO = cp.id         
       WHERE cci.IDCONTENIDO = 'pruebasv' AND cci.VALOR0 >=1 AND cp.ORDINAL BETWEEN 340700 AND 348800 
      UNION  
      SELECT cp."ID", cp.IDANTERIOR, cp.IDSIGUIENTE, 0, cp.id AS IDPARRAFO , cp.ORDINAL, 0 AS ES_CODIGOINTERNO 
        FROM  contenidoparrafo cp       
       WHERE cp.IDCONTENIDO = 'pruebasv' AND cp.ORDINAL IN (340800,343200)
       ORDER BY ordinal;
      
      
      340800
      
      
      SELECT CP.ORDINAL,CP.* FROM CONTENIDOPARRAFO CP WHERE cp.IDCONTENIDO = 'carmagneticos' AND ESTILO LIKE '%titulo%' -- ID = 'xpruebasv.daca1091798145d2bc91fdda0eeeba4c'
      
      
      
      SELECT cci."ID", cci.IDANTERIOR, cci.IDSIGUIENTE, cci.FLAGRANGORESERVADO, cci.IDPARRAFO, cp.ORDINAL, 1 AS ES_CODIGOINTERNO , CP.*
        FROM CONTENIDOCODIGOINTERNO cci
        inner join contenidoparrafo cp on cci.IDPARRAFO = cp.id         
       WHERE cci.IDCONTENIDO = 'carmagneticos' AND cci.VALOR0 >=1 AND cp.ORDINAL BETWEEN 340700 AND 348800 
      UNION  
      SELECT cp."ID", cp.IDANTERIOR, cp.IDSIGUIENTE, 0, cp.id AS IDPARRAFO , cp.ORDINAL, 0 AS ES_CODIGOINTERNO , CP.*
        FROM  contenidoparrafo cp       
       WHERE cp.IDCONTENIDO = 'carmagneticos' --AND cp.ORDINAL IN (340800,343200)
       ORDER BY ordinal;
       
      
            
      SELECT cci.*
        FROM CONTENIDOCODIGOINTERNO cci
        inner join contenidoparrafo cp on cci.IDPARRAFO = cp.id         
       WHERE cci.IDCONTENIDO = 'carmagneticos' AND cci.VALOR0 >=1 AND CCI.VALOR0 BETWEEN 826 AND 2000 
      UNION  
      SELECT cp."ID", cp.IDANTERIOR, cp.IDSIGUIENTE, 0, cp.id AS IDPARRAFO , cp.ORDINAL, 0 AS ES_CODIGOINTERNO , CP.*
        FROM  contenidoparrafo cp       
       WHERE cp.IDCONTENIDO = 'carmagneticos' --AND cp.ORDINAL IN (340800,343200)
       ORDER BY ordinal;
       
            SELECT CP.ORDINAL,CP.* FROM CONTENIDOPARRAFO CP WHERE cp.IDCONTENIDO = 'carmagneticos' AND ESTILO LIKE '%nueve-titulo%' -- ID = 'xpruebasv.daca1091798145d2bc91fdda0eeeba4c'
      
      ORDER BY cp.ordinal DESC 
	  
	  
	  
	  
https://cpanel.xperta.legis.co/api/vimeo/qrcode/D3CA6479-4489-EC11-9111-005056B046FE





   


SELECT * FROM TAREA t WHERE CODUSUARIO =870   AND NOMTAREA  = 'Asignar Corrector' AND  CODETAPA = 824265 ORDER BY FECHACREACION asc


SELECT * FROM ETAPA e WHERE ID_ETAPA =824265

SELECT * FROM PROYECTO p 
INNER JOIN ETAPA e ON p.ID_PROYECTO = e.CODPROYECTO 
INNER JOIN TAREA t ON t.CODETAPA = e.ID_ETAPA 
INNER JOIN DOCUMENTOTAREA d  ON t.ID_TAREA = d.CODTAREA 
INNER JOIN DOCUMENTO d2 ON d2.ID_DOCUMENTO = d.CODDOCUMENTO 
INNER JOIN USUARIO u ON u.ID_USUARIO = t.CODUSUARIO 
WHERE ID_PROYECTO =808819

SELECT * FROM DOCUMENTOTAREA d  WHERE CODTAREA =848542


 SELECT NOMDOCUMENTO, RUTA, FECHA, TRANSITIVO AS PUBLICO,E.CODPROYECTO, U.NOMUSUARIO NOMUSUARIO, D.ID_DOCUMENTO IDANEXO, PF.NOMPLANTILLAFLUJO
		  FROM CONTENIDO C INNER JOIN PROYECTO P ON C.IDCONTENIDO=P.CODEXTERNOTEXTO INNER JOIN ETAPA E ON P.ID_PROYECTO=E.CODPROYECTO
		  INNER JOIN TAREA T ON E.ID_ETAPA=T.CODETAPA INNER JOIN DOCUMENTOTAREA DT ON T.ID_TAREA=DT.CODTAREA INNER JOIN DOCUMENTO D
		  ON DT.CODDOCUMENTO=D.ID_DOCUMENTO INNER JOIN USUARIO U ON D.CODUSUARIO = U.ID_USUARIO INNER JOIN PLANTILLAFLUJO PF
		  ON REPLACE(P.PLANTILLAXML, '_mtdt','') = PF.PLANTILLAXML WHERE IDCONTENIDO IN('legfinan')  ORDER BY D.ID_DOCUMENTO DESC



update  contenidoparrafo set xml = '<?xm-insertion_mark_start author="Alejandrau" time="20220706T115126-0500"?><TABLE width="80%" cellspacing="1" cellpadding="1"><TBODY><TR id="d30709c133cf01cee0530a0101821eb3"><TD width="180" align="center" valign="middle">317-902027<BR/>(2022/03/15)</TD><TD width="667">Las compras de oro realizadas por comercializadoras internacionales están sujetas a la tarifa del 1% de retención en la fuente. Aquellas compras realizadas por sujetos diferentes a las CI, están sometidas a retención en la fuente a la tarifa general.</TD></TR></TBODY></TABLE><?xm-insertion_mark_end ?>' WHERE id IN ( 'xdoctri.67cb702e664e4776892fe5680c900661')






--********************************************************************
--*** CASO: NO SE GENERA ENVIO COMPLETO PERO SI HAY CAMBIOS 
--********************************************************************


-- LO PRIMERO ES BUSCAR EL CODIGO DE PROYECTO 
SELECT * FROM proyecto p WHERE id_proyecto IN (3317448)
SELECT * FROM proyecto p WHERE CODEXTERNOTEXTO = 'protribu' ORDER BY 1 desc
SELECT * FROM proyecto p WHERE UPPER(nomproyecto) LIKE '%RÉGIMEN DE LA PRO%'


-- SEGUNDO OBTENER EL ULTIMO PARRAFO Y CON LA INFORMACION PASARLO A LA CONSULTA. 
SELECT COUNT(*) FROM CONTENIDOPARRAFO c
WHERE id IN(SELECT CODPARRAFO FROM CONTENIDOPARRAFOCAMBIO c WHERE FLAGPARRAFOEXCLUIDO = 1 AND  CODPROYECTO = 3316172)
AND ORDINAL <= 3042700;



SELECT * FROM CONTENIDOPARRAFO c
WHERE id IN(SELECT CODPARRAFO FROM CONTENIDOPARRAFOCAMBIO c WHERE FLAGPARRAFOEXCLUIDO = 1 AND  CODPROYECTO = 3316172)
AND ORDINAL <= 2511900  AND hash <> 'FAKEDELETE' AND ( FLAGNUEVO=1 OR FLAGMODIFICADO=1 OR FLAGBORRADO IN (1,2)) ;


-- TERCERO HACER UPDATE 
update CONTENIDOPARRAFOCAMBIO set FLAGPARRAFOEXCLUIDO = 0 where codparrafo in (select id FROM CONTENIDOPARRAFO c 
WHERE id IN (SELECT CODPARRAFO FROM CONTENIDOPARRAFOCAMBIO c WHERE FLAGPARRAFOEXCLUIDO = 1 AND  CODPROYECTO = 3316172)
AND ORDINAL <= 3042700);


-- EN EL CASO DE QUE NO FUNCIONE VALIDAR LOS QR QUE ESTEN BIEN. y corregirlos 
 















SELECT *  FROM CONTENIDOPARRAFOQR c WHERE CODPARRAFOini IN (
'xprotribu.28ef41b58b7a4dd282a8cb1cf3e58e84'
);



DELETE  FROM CONTENIDOPARRAFOQR c WHERE CODPARRAFOini IN (
'xprotribu.28ef41b58b7a4dd282a8cb1cf3e58e84'
);





















        
        

--********************************************************************
--*** CASO: poner a la obra como disponible. PROCESO INCOMPLETO
--********************************************************************

        
SELECT * FROM contenido WHERE IDCONTENIDO IN ('COMPILACION'); 
UPDATE  contenido SET  CODPARRAFOINICIAL = 1  WHERE IDCONTENIDO IN ('COMPILACION'); 

               
        

--********************************************************************
--*** CASO: Conceptos no aparecen en la ficha.  
--******************************************************************** 
 -- cuando los conceptos no aparecen reiniciar los servicios del servidor de calipso 