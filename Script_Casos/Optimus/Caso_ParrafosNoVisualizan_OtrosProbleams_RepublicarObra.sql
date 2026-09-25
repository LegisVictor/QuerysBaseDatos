--**********************************************************************************
--** CASO: PARRAFOS NO PUBLICADOS
--**********************************************************************************
--**********************************************************************************
--*** CASO: TEMA EXPORTACION - OBRA NO PUEDE TENER CAMBIOS NI ESTAR MARCADA PARA MARCAJE 
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
--SOLUCION: Validar que la fecha de los parrafos sea menor a la de contenido transformador. Realizar update a la fecha de contenido transformador,  menor a la fecha de los parrafos. 

-- paso 1 select 

-- Consulta 
select  * from contenidotransformador WHERE-- CODTRANSFORMADOR IN (60) and ---ejecutar='S'
codcontenido in ('laboralbasicoest2024b','laboralbasico2025a', 'doctri', 'estatuto2025','protribu');

-- paso 2 update 
update CONTENIDOTRANSFORMADOR set ejecutar='S' , COUNTTRANSFORMACIONES=0, FECHAULTIMAEJECUCION = NULL 
WHERE CODTRANSFORMADOR IN (65) and 
codcontenido in ('laboralbasico2025a', 'laboralbasicoest2024b');










-- A VECES DA ESTE ERROR Y ES PORQUE LA OBRA NO TIENE UN ARBOL SE DEBE CREAR AL MENOS UNO. 
-- HACER CLICK DERECHO EN LA OBRA EN CUALQUIER PARTE DEL DOCUMENTO EN ALGUN TEXTO QUE SEA IMPORTANTE (TITULO), 
-- OPCION: OPERACIONES DE PARRAFO -> AGREGAR EL ARBOL DE CONTENIDO. 

/*
[ERROR]
2026-01-07 10:40:58,936
Mensaje: Error al procesar el contenido [COMPILACION]
Desde: LEGIS.UID.Transformacion.Servicio.TransformationManager.DoWork()
Información Adicional: (null)
Excepción: System.Exception: [LEGIS.UID.Transformacion.Contexto]-FiltroContexto. Object reference not set to an instance of an object. -    at LEGIS.UID.Transformacion.DAL.ContenidoArbol.ObtenerListaContextosCompleto(String idContenido, String idContenidoAlterno, String tempFolder)
   at LEGIS.UID.Transformacion.Contexto.FiltroContexto.CrearContextos(String urlschema, String urlschemaalterno)
   at LEGIS.UID.Transformacion.Contexto.FiltroContexto.ProcessContext()
   at LEGIS.UID.Transformacion.Contexto.FiltroContexto.ProcessContext()
   at LEGIS.UID.Transformacion.Servicio.TransformationManager.DoWork(Object objTransformacion)

*/