SELECT   distinct 
 'exec [dbo].[EliminarUsuariosPeruExtrano] @email= ''' + u.usuario + ''',	@Accion  = 1'
--, p.codfilial, P.Sil_CodProducto, P.NomProducto, S.*
FROM Suscripcion s 
inner JOIN Atencion a on a.Id_Atencion=s.CodAtencion
inner JOIN Usuario u on a.CodUsuario=u.Id_Usuario
inner JOIN Producto p on p.Id_Producto=s.CodProducto
LEFT JOIN Sucursal suc on suc.Id_Sucursal=a.CodSucursal
LEFT join Cliente c on c.Id_Cliente=suc.CodCliente
WHERE 
p.codfilial = 6 and s.FechaFin >=getdate() and s.FechaFin <='2030-05-02 23:59:59.000'
AND U.USUARIO not like '%legis.%'
AND P.Id_Producto <> 7101
and c.CodFilial = 6
and u.usuario COLLATE Modern_Spanish_CI_AS in 
(

select email from [10.250.4.7].[nuevolegismovilperu].[dbo].suscriptor sp
inner join [10.250.4.7].[nuevolegismovilperu].[dbo].suscriptorcontrato sc
on sp.id_suscriptor = sc.codsuscriptor
WHERE EMAIL COLLATE Modern_Spanish_CI_AS  = U.Usuario


); 










	select distinct 1 as UlRvalida--, Atencion.Id_Atencion
	from  ListaURL
	--  inner join Atencion on (Atencion.Id_Atencion = ListaURL.CodAtencion)
--	  INNER join Suscripcion on (Suscripcion.CodAtencion = Atencion.Id_Atencion and (CONVERT(DATETIME,CONVERT(char,Suscripcion.FechaFin,111),111)) >= (CONVERT(DATETIME,CONVERT(char,getdate(),111),111)))
	--  INNER JOIN AccesoProducto  ON (Suscripcion.CodProducto = AccesoProducto.CodProducto )
	  --INNER JOIN Acceso ON  (Acceso.Id_acceso = AccesoProducto.CodAcceso AND CodAplicacionWeb = @CodAplicacionWeb)
	WHERE 
	  URL =  'https://legal.legis.com.pe/interm/Intemedia_UAC.htm' 
	 -- GROUP BY Atencion.Id_Atencion