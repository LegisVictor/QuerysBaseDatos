SELECT distinct  u.id_usuario, a.id_atencion 
FROM Suscripcion s inner JOIN Atencion a on a.Id_Atencion=s.CodAtencion
inner JOIN Usuario u on a.CodUsuario=u.Id_Usuario
left join listaurl lu on lu.CodAtencion =a.Id_Atencion
LEFT JOIN Sucursal suc on suc.Id_Sucursal=a.CodSucursal
LEFT join Cliente c on c.Id_Cliente=suc.CodCliente
WHERE lu.URL like '%https://biblioteca.uandina.edu.pe/bvirtual.html%'

/*
exec crossLoginURL @codaplicacionweb = 16 , @urlvalidar = 'https://biblioteca.uandina.edu.pe/bvirtual.html' , @validarcantidadsuscripcion = 0

select dbo.fnACSSesionAccesoCantidad (807801, 1, 1,  3, default,0, null)


*/







			SELECT  count(ACSSesion.GUIDSesion) 
			FROM 
				dbo.ACSSesion 
				INNER JOIN dbo.ACSSesionAcceso  on ACSSesion.GUIDSesion = ACSSesionAcceso.GUIDSesion
				INNER JOIN dbo.[ACSSesionAplicacionWebTipoAcceso] ACSTK on (ACSTK.GUIDSesion = ACSSesion.GUIDSesion)
				INNER JOIN dbo.ACSSolicitud  on (ACSSolicitud.GUIDTicket = ACSTK.GUIDTicket)
				LEFT  JOIN dbo.DispositivoMovil on ACSSesionAcceso.CodDispositivoMovil = DispositivoMovil.ID_DispositivoMovil
			WHERE  
				ACSSesionAcceso.CodAtencion =807801
			--	AND ACSSolicitud.CodAplicacionWeb = 1
				-- Revisar las sesiones ya creadas para esa Atención o SubAtención.
				AND (CASE WHEN ACSSesionAcceso.CodUsuario IS NULL THEN 654206
						  ELSE  ACSSesionAcceso.CodUsuario END) = 654206
				--Validar que la sesion no este pendiente por ser eliminada
				and ACSSesion.GUIDSesion not in
				(
						select valor FROM ACOperaciones where valor = ACSSesion.GUIDSesion
						and operacion = 'cerrarSesion'
				)
				and (CASE WHEN DispositivoMovil.CodTipoDispositivo IS NULL THEN 0
				ELSE DispositivoMovil.CodTipoDispositivo END ) = 0
			GROUP BY  ACSSolicitud.CodAplicacionWeb,DispositivoMovil.CodTipoDispositivo
