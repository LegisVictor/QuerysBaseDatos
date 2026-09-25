---- 10.250.6.19
---- SCALA
select distinct usu.NomUsuario as NomUsuario, usu.Usuario As Usuario
	from usuario usu  
          inner join atencion aten on usu.Id_Usuario = aten.codUsuario  
          inner join suscripcion susc on susc.codatencion = aten.id_atencion
		  inner join Producto prod on prod.Id_Producto = susc.CodProducto
          inner join productoObraOnline poo on poo.codProducto = susc.codproducto  
          inner join ObraOnline oo on oo.id_ObraOnline = poo.codObraonline  
          inner join accesoProducto acsprod on acsprod.CodProducto = susc.CodProducto  
          inner join Acceso acs on acsprod.CodAcceso = acs.Id_Acceso  
          inner join AplicacionWeb apweb on apweb.Id_AplicacionWeb = acs.CodAplicacionWeb  
          where   
          --apweb.Id_AplicacionWeb = 16  
          and susc.FechaFin > GETDATE()  
		---and poo.codproducto = 10217
          and oo.Activa = 1   
          and Poo.Activo = 1                                                                                    
          ---and usu.Usuario = @username  
          --and oo.CodFilial in (91)  
          ---and oo.NomObraOnLine not in (select NombreObra from ObrasNoActivasForSSO)
		  order by usu.NomUsuario


select    usu.NomUsuario as NomUsuario, usu.Usuario As Usuario, susc.FechaInicio, susc.FechaFin, Cantidad, prod.NomProducto, Alias
	from usuario usu  
          inner join atencion aten on usu.Id_Usuario = aten.codUsuario  
          inner join suscripcion susc on susc.codatencion = aten.id_atencion
		  inner join Producto prod on prod.Id_Producto = susc.CodProducto
          inner join productoObraOnline poo on poo.codProducto = susc.codproducto  
          inner join ObraOnline oo on oo.id_ObraOnline = poo.codObraonline  
          inner join accesoProducto acsprod on acsprod.CodProducto = susc.CodProducto  
          inner join Acceso acs on acsprod.CodAcceso = acs.Id_Acceso  
          inner join AplicacionWeb apweb on apweb.Id_AplicacionWeb = acs.CodAplicacionWeb  
          where   
          apweb.Id_AplicacionWeb = 16  
          and susc.FechaFin > GETDATE()  
		---and poo.codproducto = 10217
          and oo.Activa = 1   
          and Poo.Activo = 1                                                                                    
          ---and usu.Usuario = @username  
          and oo.CodFilial in (91)  
          ---and oo.NomObraOnLine not in (select NombreObra from ObrasNoActivasForSSO)
		  order by usu.NomUsuario



		  

select    c.*, aten.*, susc.*, prod.*--, lu.*, rip.*
	from usuario usu  
          inner join atencion aten on usu.Id_Usuario = aten.codUsuario  
          inner join suscripcion susc on susc.codatencion = aten.id_atencion
		  inner join Producto prod on prod.Id_Producto = susc.CodProducto
          inner join productoObraOnline poo on poo.codProducto = susc.codproducto  
          inner join ObraOnline oo on oo.id_ObraOnline = poo.codObraonline  
          inner join accesoProducto acsprod on acsprod.CodProducto = susc.CodProducto  
          inner join Acceso acs on acsprod.CodAcceso = acs.Id_Acceso  
          inner join AplicacionWeb apweb on apweb.Id_AplicacionWeb = acs.CodAplicacionWeb  
		  LEFT JOIN Sucursal suc on suc.Id_Sucursal=aten.CodSucursal
          LEFT join Cliente c on c.Id_Cliente=suc.CodCliente
		--  left join ListaURL lu on lu.CodAtencion = aten.Id_Atencion
		--  left join RangoIp RIp on rip.CodAtencion = aten.Id_Atencion
          where   
          susc.FechaFin > GETDATE()  
		---and poo.codproducto = 10217
          and oo.Activa = 1   
          and Poo.Activo = 1                                                                                    
          and c.CodFilial = '91' 
		  order by usu.NomUsuario