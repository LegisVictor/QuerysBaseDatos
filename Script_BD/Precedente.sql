/****** Script for SelectTopNRows command from SSMS  ******/
SELECT *
  FROM [Precedente].[dbo].[AnalisisJuridico] WHERE CODSENTENCIA in (652,
800,
2356,
2165, 
2442)

  /****** Script for SelectTopNRows command from SSMS  ******/
SELECT *
  FROM [Precedente].[dbo].[Sentencia] where id in  (652,
800,
2356,
2165, 
2442)

  /****** Script for SelectTopNRows command from SSMS  ******/
SELECT *
  FROM [Precedente].[dbo].[AnalisisJuridico] WHERE titulo like '%sexo%'


  /****** Script for SelectTopNRows command from SSMS  ******/
SELECT *
  FROM [Precedente].[dbo].[LineaJurisprudencial] WHERE ID = 1050



  SENTENCIA T-128 DE MARZO 11 DE 2016
SENTENCIA C-336 DE ABRIL 16 DE 2008
SENTENCIA SL1366-2019/60491 DE MARZO 6 DE 2019
SENTENCIA T-357 DE JUNIO 20 DE 2013
SENTENCIA 2017-00168/6177-18 DE JUNIO 18 DE 2020


  /****** Script for SelectTopNRows command from SSMS  ******/
SELECT *
  FROM [Precedente].[dbo].[AreaDerecho] WHERE id = 1080


declare @codAnalisis int
set @codAnalisis = 710
	SELECT (
			SELECT analisis.id
				,analisis.titulo
				,analisis.qtyAmpliada
				,analisis.qtyApartada
				,analisis.qtyReducida
				,analisis.qtyReiterada
				,analisis.codLineaJurisprudencial
				,analisis.codHechosRelevantes
				,analisis.codProblemaJuridico
				,(
					SELECT MaestroTextos.texto problemajuridico
					FROM MaestroTextos
					WHERE analisis.codProblemaJuridico = MaestroTextos.id
					FOR XML RAW('problemajuridico')
						,TYPE
					) AS problemajuridico
				,(
					SELECT MaestroTextos.texto tesis
					FROM MaestroTextos
					WHERE analisis.codTesis = MaestroTextos.id
					FOR XML RAW('tesis')
						,TYPE
					) AS tesis
				,(
					SELECT lineaJurisprudencial.id
						,lineaJurisprudencial.nomLineaJurisprudencial
						,lineaJurisprudencial.codProductoSil
					FROM LineaJurisprudencial
					WHERE analisis.codLineaJurisprudencial = lineaJurisprudencial.id
					FOR XML RAW('linea')
						,TYPE
					) AS lineas
				,(
					SELECT patron.id
						,patron.Nombre
					FROM PatronFactico patron
					INNER JOIN aj_patronfactico aj_patron ON (patron.id = aj_patron.CodPatronFactico)
					WHERE aj_patron.CodAnalisisJuridico = analisis.id
					FOR XML RAW('patron')
						,TYPE
					) AS patrones
				,(
					SELECT tema.id
						,tema.Nombre
					FROM tema
					INNER JOIN aj_tema ON (tema.id = aj_tema.codTema)
					WHERE aj_tema.CodAnalisisJuridico = analisis.id
					FOR XML RAW('tema')
						,TYPE
					) AS temas
				,(
					SELECT sentencia.id
						,sentencia.titulo
						,sentencia.titulooriginal
						,sentencia.fecha
						,isnull(sentencia.sala, '') sala
						,isnull(sentencia.seccion, '') seccion
						,sentencia.alias
						,sentencia.contexto
						,sentencia.tipodocumento
						,entidad.id id_entidad
						,entidad.Nombre Nombre_entidad
						,(
							SELECT Ponente.id
								,Ponente.Nombre
								,Ponente.Cargo
							FROM Ponente
							JOIN Se_Ponente ON (Se_Ponente.CodPonente = Ponente.id)
							WHERE Se_Ponente.CodSentencia = Sentencia.id
							FOR XML RAW('ponente')
								,TYPE
							) AS ponentes
						,(
							SELECT 
								Nombre,
								Parrafo
							FROM Se_Seccion
							WHERE CodSentencia = Sentencia.id
							ORDER BY Id
							FOR XML RAW('seccion')
								,TYPE
						 ) AS secciones
						,(
							SELECT 
								Parrafo
							FROM Se_Consideraciones
							WHERE CodSentencia = Sentencia.id
							AND CodAnalisisJuridico = @codAnalisis
							ORDER BY Id
							FOR XML RAW('consideracion')
								,TYPE
						 ) AS consideraciones
					FROM sentencia
					INNER JOIN entidad ON (sentencia.codentidad = entidad.id)
					WHERE analisis.codSentencia = sentencia.id
					FOR XML RAW('documento')
						,TYPE
					) AS documentos
				,(
					SELECT normaFuente.id
						,normafuente.titulo
						,normaFuente.alias
						,NormaFuente.contexto
						,(
							select 
								mt.id, 
								nfa.numero artNumero, 
								nfa.codTextoArticulo, 
								nfa.modificado,
								isnull(nfa.tituloModificacion, '') tituloModificacion
							from aj_normafuentearticulo ajnfa
							inner join normafuentearticulo nfa on nfa.id = ajnfa.CodNormaFuenteArticulo
							inner join MaestroTextos mt on mt.id = nfa.CodTextoArticulo
							where ajnfa.codaj_normafuente = aj_normafuente.id

							FOR XML RAW('articulo')
								,TYPE
							) AS articulos
					FROM normaFuente
					INNER JOIN aj_NormaFuente ON aj_normafuente.codnormafuente = normafuente.id
					WHERE aj_NormaFuente.codAnalisisJuridico = analisis.id
					FOR XML RAW('norma')
						,TYPE
					) AS normas
				,(
					SELECT se_modulacion.fecha
					FROM se_modulacion
					INNER JOIN tipoModulacion ON (se_modulacion.codTipoModulacion = tipoModulacion.id)
					WHERE se_modulacion.codanalisisJuridico = analisis.id
					FOR XML RAW('modulacion')
						,TYPE
					) AS modulaciones
			FROM analisisjuridico analisis
			WHERE analisis.id = @codAnalisis
			FOR XML RAW('analisis')
				,ROOT('root')
			) AS 'AnalisisData'
		,@codAnalisis AS id
