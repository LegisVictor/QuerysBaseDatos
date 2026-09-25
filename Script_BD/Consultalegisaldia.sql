select * from AplicacionWeb where



select * from TareaEnvioCorreo




	SELECT	DISTINCT
				AP.CodProducto,
				AC.Id_Acceso, aw.*
	FROM	AplicacionWeb AW LEFT JOIN Acceso AC
			ON AW.Id_AplicacionWeb = AC.CodAplicacionWeb
			LEFT JOIN AccesoProducto AP
			ON AC.Id_Acceso = AP.CodAcceso
			LEFT JOIN Producto P
			ON AP.CodProducto = P.Id_Producto
	WHERE	AW.Id_AplicacionWeb = 35
			--AND AC.GUID = @Acceso_GUID
			AND AC.CodAplicacionWeb IS NOT NULL
			AND AP.CodAcceso IS NOT NULL
			AND P.Id_Producto IS NOT NULL
			AND P.Activo = 1


			
SELECT TOP 100 A.*, p.*,  p.NomProducto, u.usuario as email,  a.correo, a.UsuarioWeb, s.CodProducto,
s.CodEstadoSuscripcion, p.CodTareaEnvioCorreo,  s.sil_codsuscripcion, s.*
FROM [dbo].atencion a  LEFT JOIN  [dbo].suscripcion s
ON a.Id_Atencion = S.CodAtencion LEFT JOIN [dbo].Producto p ON p.Id_Producto = s.CodProducto
LEFT JOIN [dbo].Usuario u on u.id_usuario = A.CodUsuario
where 
s.fechafin > getdate() AND ID_PRODUCTO IN (8442,
8443,
8444,
8589,
8591)





			