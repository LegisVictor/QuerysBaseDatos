use habeasdata
--newsAmbitoRegistrados
SELECT  *
FROM    
    tblautorizacion a
    where a.email like '%alejandro.salazar@doblamos.com'

-- ========================================================================
-- 10.250.6.78 (habeasdata)
-- ========================================================================
use habeasdata
--newsAmbitoRegistrados
SELECT distinct  a.email
FROM    
    tblautorizacion a
    INNER JOIN (
		 SELECT  MAX(fechaautorizacion) fecha_max,email
		 FROM    tblautorizacion
		 where   sitio like '%ambito%' and email like '%@%' 
		 GROUP BY email) b ON 
			a.email = b.email 
			AND a.fechaautorizacion = b.fecha_max 
			and a.codtipoautorizacion = 1
order by a.email;

-- ========================================================================
-- ========================================================================

use LegisAlDiaV2
--newsLAD
SELECT distinct replace(replace(replace(s1.Email,',',''),'"',''),' ','')
FROM SeleccionEnvioBoletin s1 
WHERE 
	s1.ListaDistribucion='LEGIS AL DIA V2 P00100' 
	and s1.Email 
	not in ('diegorueda@grupodelvalle.com', 'scliente@legis.com.co') 
	and s1.email COLLATE Modern_Spanish_CI_AS not in 
		(
		SELECT distinct usu.Usuario
		FROM [10.250.4.79].scala.dbo.Usuario usu
		inner join [10.250.4.79].scala.dbo.Atencion aten on aten.CodUsuario = usu.Id_Usuario 
		inner join [10.250.4.79].scala.dbo.Suscripcion susc on susc.CodAtencion = aten.Id_Atencion 
		inner join [10.250.4.79].scala.dbo.Producto prod on susc.CodProducto = prod.Id_Producto 
		where susc.FechaFin > getdate() and usu.Usuario not like 'temporal%@legis.com.co' and usu.Usuario not like 'usergroup%@urllegis.com' and usu.Usuario not like 'scliente%@legis.com.co' and usu.usuario not like '%@legis%' AND prod.Sil_CodProducto in (4457, 5138) AND prod.CodFilial=6

		UNION

		SELECT email
		from [10.250.4.79].scala.dbo.FuenteExterna_3 
		WHERE RecibirEmail=1 and email not like '%@legis%' and email not like 'usergroup%@urllegis.com' and fechafin>=getdate()
		)
union

select distinct replace(replace(replace(Email,',',''),'"',''),' ','')
from [NuevoLegisMovil].[dbo].[fuenteexterna_210] 
where RecibirEmail=1 
	and email COLLATE Modern_Spanish_CI_AS not in 
	(
		SELECT distinct usu.Usuario
				FROM [10.250.4.79].scala.dbo.Usuario usu
				inner join [10.250.4.79].scala.dbo.Atencion aten on aten.CodUsuario = usu.Id_Usuario 
				inner join [10.250.4.79].scala.dbo.Suscripcion susc on susc.CodAtencion = aten.Id_Atencion 
				inner join [10.250.4.79].scala.dbo.Producto prod on susc.CodProducto = prod.Id_Producto
				where susc.FechaFin > getdate() and usu.Usuario not like 'temporal%@legis.com.co' and usu.Usuario not like 'usergroup%@urllegis.com' and usu.Usuario not like 'scliente%@legis.com.co' and usu.usuario not like '%@legis%' AND prod.Sil_CodProducto in (4457, 5138) AND prod.CodFilial=6
		UNION
		SELECT email
				from [10.250.4.79].scala.dbo.FuenteExterna_3
				WHERE RecibirEmail=1 and email not like '%@legis%' and email not like 'usergroup%@urllegis.com' and fechafin>=getdate()
		
	)

-- ========================================================================
--10.250.6.19 (TODO scala)
-- ========================================================================

use scala
--newsAbogados
SELECT distinct replace(replace(replace(usu.Usuario,',',''),'"',''),' ','')
		FROM Usuario usu
		inner join Atencion aten on aten.CodUsuario = usu.Id_Usuario
		inner join Suscripcion susc on susc.CodAtencion = aten.Id_Atencion
		inner join Producto prod on susc.CodProducto = prod.Id_Producto
		where susc.FechaFin > getdate() and usu.Usuario not like 'temporal%@legis.com.co' and usu.Usuario not like 'usergroup%@urllegis.com' and usu.Usuario not like 'scliente%@legis.com.co'
		AND prod.Sil_CodProducto in (4457, 5138) AND prod.CodFilial=6
UNION
SELECT distinct replace(replace(replace(email,',',''),'"',''),' ','')
		from FuenteExterna_3
		WHERE RecibirEmail=1 and email not like 'temporal%@legis.com.co' and email not like 'usergroup%@urllegis.com' and fechafin>=getdate()

-- ========================================================================
-- ========================================================================

--newsContadores
SELECT distinct replace(replace(replace(usu.Usuario,',',''),'"',''),' ','')
		FROM Usuario usu
		inner join Atencion aten on aten.CodUsuario = usu.Id_Usuario
		inner join Suscripcion susc on susc.CodAtencion = aten.Id_Atencion
		inner join Producto prod on susc.CodProducto = prod.Id_Producto
		where susc.FechaFin > getdate() and usu.Usuario not like 'temporal%@legis.com.co' and usu.Usuario not like 'usergroup%@urllegis.com' and usu.Usuario not like 'scliente%@legis.com.co'
		AND prod.Sil_CodProducto in (4458, 5064) AND prod.CodFilial=6
UNION
select distinct	replace(replace(replace(usu.Usuario,',',''),'"',''),' ','')
		FROM usuario usu
		inner join atencion on id_usuario=codusuario
		inner join Suscripcion susc on id_atencion=codatencion
		inner join Producto prod on susc.CodProducto = prod.Id_Producto
		where susc.FechaFin > getdate() and usu.Usuario='rhoyos@pkfcabrera.com' and id_producto not in (5689,7101)

-- ========================================================================
-- ========================================================================

--newsProfesional		
SELECT distinct replace(replace(replace(usu.Usuario,',',''),'"',''),' ','')
		FROM Usuario usu
		inner join Atencion aten on aten.CodUsuario = usu.Id_Usuario
		inner join Suscripcion susc on susc.CodAtencion = aten.Id_Atencion
		inner join Producto prod on susc.CodProducto = prod.Id_Producto
		where susc.FechaFin > getdate() and usu.Usuario not like 'temporal%@legis.com.co' and usu.Usuario not like 'usergroup%@urllegis.com' and usu.Usuario not like 'scliente%@legis.com.co'
		AND prod.Sil_CodProducto in (4457, 4458, 4459, 5138, 5064) AND prod.CodFilial=6
