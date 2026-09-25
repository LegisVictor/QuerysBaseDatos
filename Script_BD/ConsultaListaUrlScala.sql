/****** Script for SelectTopNRows command from SSMS  ******/
SELECT [Id_ListaURL],[CodAtencion],[URL],[DesdeHoraNormal],[HastaHoraNormal],[DesdeHoraFestivo],[HastaHoraFestivo],
	  'INSERT INTO [dbo].[ListaURL] ([CodAtencion],[URL],[DesdeHoraNormal],[HastaHoraNormal],[DesdeHoraFestivo],[HastaHoraFestivo]) VALUES
      (' + Convert(varchar , [CodAtencion]) + ',''' + replace([URL],'http://legal.legis.com.ve','https://legal.legis.com.ve') + ''', ''' + DesdeHoraNormal + ''', ''' + HastaHoraNormal + ''', ''' + DesdeHoraFestivo + ''', ''' + HastaHoraFestivo + ''') GO ' 
  FROM [ListaURL] where upper(url) like '%legal.legis.com.ve%' order by codatencion 


  /****** Script for SelectTopNRows command from SSMS  ******/
SELECT [Id_ListaURL],[CodAtencion],[URL],[DesdeHoraNormal],[HastaHoraNormal],[DesdeHoraFestivo],[HastaHoraFestivo],	  
	  'INSERT INTO [dbo].[ListaURL] ([CodAtencion],[URL],[DesdeHoraNormal],[HastaHoraNormal],[DesdeHoraFestivo],[HastaHoraFestivo]) VALUES
           (' + Convert(varchar , [CodAtencion]) + ',''' + replace([URL],'http://legal.legis.com.pe','https://legal.legis.com.pe') + ''', ''' + DesdeHoraNormal + ''', ''' + HastaHoraNormal + ''', ''' + DesdeHoraFestivo + ''', ''' + HastaHoraFestivo + ''') GO ' 
FROM [ListaURL] where upper(url) like '%//legal.legis.com.pe%' and url not like '%https://legal.legis.com.pe%'  order by codatencion 

  /****** Script for SelectTopNRows command from SSMS  ******/
SELECT [Id_ListaURL],[CodAtencion],[URL],[DesdeHoraNormal],[HastaHoraNormal],[DesdeHoraFestivo],[HastaHoraFestivo],	  
	  'INSERT INTO [dbo].[ListaURL] ([CodAtencion],[URL],[DesdeHoraNormal],[HastaHoraNormal],[DesdeHoraFestivo],[HastaHoraFestivo]) VALUES
           (' + Convert(varchar , [CodAtencion]) + ',''' + replace([URL],'http:','https:') + ''', ''' + DesdeHoraNormal + ''', ''' + HastaHoraNormal + ''', ''' + DesdeHoraFestivo + ''', ''' + HastaHoraFestivo + ''') GO ' 
FROM [ListaURL] where upper(url) like '%sijusalex%' order by codatencion 


    /****** Script for SelectTopNRows command from SSMS  ******/
SELECT [Id_ListaURL],[CodAtencion],[URL],[DesdeHoraNormal],[HastaHoraNormal],[DesdeHoraFestivo],[HastaHoraFestivo],
	  'INSERT INTO [dbo].[ListaURL] ([CodAtencion],[URL],[DesdeHoraNormal],[HastaHoraNormal],[DesdeHoraFestivo],[HastaHoraFestivo]) VALUES
           (' + Convert(varchar , [CodAtencion]) + ',''' + replace([URL],'http://legal.legis.com.co','https://legal.legis.com.co') + ''', ''' + DesdeHoraNormal + ''', ''' + HastaHoraNormal + ''', ''' + DesdeHoraFestivo + ''', ''' + HastaHoraFestivo + ''') GO ' 
  FROM [ListaURL] where upper(url) like '%//legal.legis.com.co%' and url not like '%https://legal.legis.com.co%' 
  order by codatencion 



INSERT INTO [dbo].[ListaURL] ([CodAtencion],[URL],[DesdeHoraNormal],[HastaHoraNormal],[DesdeHoraFestivo],[HastaHoraFestivo]) VALUES
           (388320,'https://legal.legis.com.pe/Interm/Intermedia_UCV.htm', '00:00', '23:45', '00:00', '23:45') GO 

/****** Script for SelectTopNRows command from SSMS  ******/
SELECT TOP (1000) [Id_Cliente] ,[NomCliente],
       [CodFilial], [NomFilial], [SIL_CodFilial], S.Id_Sucursal, S.NomSucursal, S.CodCiudad
  FROM [Cliente] C inner join filial F ON c.codfilial = F.Id_Filial  inner join sucursal S ON  S.CodCliente = C.id_cliente
  WHERE F.Id_Filial = 86


  /****** Script for SelectTopNRows command from SSMS  ******/
SELECT TOP (1000) [Id_Suscripcion] ,[CodProducto],S.[CodAtencion],[FechaInicio]
      ,[FechaFin]      ,[Cantidad],[Sil_CodSuscripcion] ,[CodEstadoSuscripcion]      ,[UltEnvio]      ,[CodTipoSuscripcion]      ,[CodTipoAcceso]	  , P.*	   , A.*, R.*
  FROM [Suscripcion] S inner join Producto P ON S.CODPRODUCTO = P.ID_PRODUCTO
  INNER JOIN  [Atencion] A ON A.Id_Atencion = S.CodAtencion INNER JOIN  [RangoIP] R ON A.ID_ATENCION = R.CODATENCION 

/****** Script for SelectTopNRows command from SSMS  ******/
SELECT TOP (1000) [Id_ListaURL]
      ,[CodAtencion]
      ,[URL]
      ,[DesdeHoraNormal]
      ,[HastaHoraNormal]
      ,[DesdeHoraFestivo]
      ,[HastaHoraFestivo]
  FROM [Scala].[dbo].[ListaURL] where url like '%copnia%'