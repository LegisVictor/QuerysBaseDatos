select Usuario, s.Sil_CodSuscripcion as CodigoSuscripcion, p.Sil_CodProducto, p.NomProducto
from usuario
inner join UsuarioCreacion uc on Id_Usuario=uc.CodUsuario
inner join atencion a on a.CodUsuario =Id_Usuario
inner join Suscripcion s on s.CodAtencion=a.Id_Atencion
inner join Producto p on p.Id_Producto = s.CodProducto
inner join AccesoProducto ap on ap.CodProducto=p.Id_Producto
inner join Acceso ac on ac.Id_Acceso=ap.CodAcceso
where  Cliente='AmbitoJuridico' 
and s.Sil_CodSuscripcion is not null  and s.FechaFin>getdate() and ac.CodAplicacionWeb in (12)


select * from aplicacionweb