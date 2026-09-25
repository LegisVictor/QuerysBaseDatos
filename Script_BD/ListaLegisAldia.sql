   declare @sql varchar(MAX)
 set @sql = 'SELECT distinct '''' as  Id_Usuario,  replace(replace(replace(s1.Email,'','',''''),''\"'',''''),'' '','''') as Usuario,
 case when s1.NomSuscriptor <> '''' then replace(replace(s1.NomSuscriptor,'','',''''),''\"'','''') else replace(replace(replace(s1.Email,'','',''''),''\"'',''''),'' '','''') end as NomUsuario, 
  '''' as  NomCliente, '''' as Nid  
 FROM [10.250.4.7].LegisAlDiaV2.[dbo].[SeleccionEnvioBoletin] s1 
 WHERE s1.ListaDistribucion=''LEGIS AL DIA V2 P00100'' and s1.Email not in (''diegorueda@grupodelvalle.com'', ''scliente@legis.com.co'') 
 and s1.email COLLATE Modern_Spanish_CI_AS not in ( 
	 SELECT  usu.Usuario FROM scala.dbo.Usuario usu 
	 inner join scala.dbo.Atencion aten on aten.CodUsuario = usu.Id_Usuario 
	 inner join scala.dbo.Suscripcion susc on susc.CodAtencion = aten.Id_Atencion 
	 inner join scala.dbo.Producto prod on susc.CodProducto = prod.Id_Producto  
	 where susc.FechaFin > getdate() and usu.Usuario not like ''temporal%@legis.com.co'' and usu.Usuario not like ''usergroup%@urllegis.com'' 
	 and usu.Usuario not like ''scliente%@legis.com.co'' and usu.usuario not like ''%@legis%'' AND prod.Sil_CodProducto in  (4457, 5138) AND prod.CodFilial=6 
	 UNION SELECT  email  from scala.dbo.FuenteExterna_3  WHERE RecibirEmail=1 and email not like ''%@legis%'' 
	 and email not like ''usergroup%@urllegis.com'' and fechafin>=getdate()
 ) 

 union select distinct '''' as  Id_Usuario,    
  replace(replace(replace(Email,'','',''''),''\"'',''''),'' '','''') as Usuario,
 case when NomFuenteExterna <> '''' then replace(replace(NomFuenteExterna,'','',''''),''\"'','''') else replace(replace(replace(Email,'','',''''),''\"'',''''),'' '','''') end as NomUsuario,
 '''' as  NomCliente, '''' as Nid  
 from [10.250.4.7].[NuevoLegisMovil].[dbo].[fuenteexterna_210] 
 where RecibirEmail=1 and email COLLATE Modern_Spanish_CI_AS not in ( 
	 SELECT distinct usu.Usuario FROM scala.dbo.Usuario usu 
	 inner join scala.dbo.Atencion aten on aten.CodUsuario = usu.Id_Usuario 
	 inner join scala.dbo.Suscripcion susc on susc.CodAtencion = aten.Id_Atencion 
	 inner join scala.dbo.Producto    prod on susc.CodProducto = prod.Id_Producto 
	 where susc.FechaFin > getdate() and usu.Usuario not like ''temporal%@legis.com.co'' and usu.Usuario not like ''usergroup%@urllegis.com'' and usu.Usuario not 
	 like ''scliente%@legis.com.co'' and usu.usuario not like ''%@legis%'' AND prod.Sil_CodProducto in (4457, 5138) AND prod.CodFilial=6 
	 UNION  SELECT email from scala.dbo.FuenteExterna_3
	 WHERE RecibirEmail=1 and email not like ''%@legis%'' and email not like ''usergroup%@urllegis.com'' and fechafin>=getdate()
 )
 
 '
 
 SELECT   @sql
 
 esmir@plye.net
 
 
 
 	SELECT distinct Id_Usuario, Usuario, NomUsuario, NomCliente, Nid
				FROM (
					SELECT distinct usu.Id_Usuario,
					case when usu.NomUsuario <> '' then replace(replace(usu.NomUsuario,',',''),'\"','') else replace(replace(replace(usu.Usuario,',',''),'\"',''),' ','') end as Usuario,
					replace(replace(replace(usu.Usuario,',',''),'\"',''),' ','') as NomUsuario, '' as  NomCliente, '' as Nid  
					FROM Usuario usu inner join Atencion aten on aten.CodUsuario = usu.Id_Usuario inner join Suscripcion susc on susc.CodAtencion = aten.Id_Atencion 
					inner join Producto prod on susc.CodProducto = prod.Id_Producto where susc.FechaFin > getdate() and usu.Usuario not like 'temporal%@legis.com.co' 
					and usu.Usuario not like 'usergroup%@urllegis.com' and usu.Usuario not like 'scliente%@legis.com.co' AND prod.Sil_CodProducto in (4457, 5138) AND prod.CodFilial=6 
					UNION SELECT distinct id_fuenteexterna as Id_Usuario, 
					case when nombre <> '' then replace(replace(nombre,',',''),'\"','') else replace(replace(replace(email,',',''),'\"',''),' ','') end as Usuario, 
					replace(replace(replace(email,',',''),'\"',''),' ','') as NomUsuario, '' as  NomCliente, '' as Nid  
					from FuenteExterna_3 
					WHERE RecibirEmail=1 and email not like 'temporal%@legis.com.co' and email not like 'usergroup%@urllegis.com' and fechafin>=getdate()





				) as Subquery
						 




				SELECT distinct Id_Usuario, Usuario, NomUsuario, NomCliente, Nid
				FROM (									
					SELECT distinct usu.Id_Usuario,
					case when usu.NomUsuario <> '' then replace(replace(usu.NomUsuario,',',''),'\"','') else replace(replace(replace(usu.Usuario,',',''),'\"',''),' ','') end as Usuario,
					replace(replace(replace(usu.Usuario,',',''),'\"',''),' ','') as NomUsuario, '' as  NomCliente, '' as Nid  
					FROM Usuario usu inner join Atencion aten on aten.CodUsuario = usu.Id_Usuario inner join Suscripcion susc 
					on susc.CodAtencion = aten.Id_Atencion inner join Producto prod on susc.CodProducto = prod.Id_Producto where susc.FechaFin > getdate() and usu.Usuario not like 
					'temporal%@legis.com.co' and usu.Usuario not like 'usergroup%@urllegis.com' and usu.Usuario not like 'scliente%@legis.com.co' AND prod.Sil_CodProducto in (4458, 5064) 
					AND prod.CodFilial=6 
					UNION select  distinct usu.Id_Usuario, 
					case when usu.NomUsuario <> '' then replace(replace(usu.NomUsuario,',',''),'\"','') else replace(replace(replace(usu.Usuario,',',''),'\"',''),' ','') end as Usuario,
					replace(replace(replace(usu.Usuario,',',''),'\"',''),' ','') as NomUsuario, '' as  NomCliente, '' as Nid   
					FROM usuario usu inner join atencion on id_usuario=codusuario inner join Suscripcion susc on id_atencion=codatencion inner join Producto prod on
					susc.CodProducto = prod.Id_Producto where susc.FechaFin > getdate() and usu.Usuario='rhoyos@pkfcabrera.com' and id_producto not in (5689,7101)
			
			
				) as Subquery
						 
