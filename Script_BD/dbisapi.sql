select * from [dbisapi].[dbo].Infobases where obra LIKE '%sijprecapana%'

select * from [dbisapi].[dbo].ObrasNXT where name LIKE '%sijprecapana%'

select * from  [dbisapi].[dbo].UserObraTipoMedio  where codobra LIKE '%SIJMIGRA%'

RÉGIMEN SOBRE MIGRACIÓN Y NATURALIZACIÓN DE PANAMÁ

exec spObraUser @user='sijusalex@sijusa.com'

-- Consulta para obtener obras spObraUser

select Max(sq1.Suscripcion) AS Suscripcion, sq1.Obra, Max(sq1.Vence)+2 As Vence, Max(sq1.cupo) As Cupo, sq1.VistaPes, sq1.EstadoVistaPes, sq1.ORDER_TEMA_PADRE, sq1.nivel, sq1.ORDER_TEMA, sq1.OrderTema, sq1.orderinfo, sq1.CodTema, sq1.nomTema 
from 
(
SELECT  CASE WHEN USER_OBRA.Suscripcion is null  THEN 0 ELSE USER_OBRA.Suscripcion END AS Suscripcion,		
		INFO_BASES.Obra, INFO_BASES.VISTA, 
		USER_OBRA.Vence,		
		CASE WHEN USER_OBRA.cupo <= 0 THEN 9999 ELSE USER_OBRA.cupo END AS cupo,
		dbo.funGetObraConVista(USER_OBRA.Obra, '') AS VistaPes,
		dbo.funGetObraConVista(USER_OBRA.Obra, USER_OBRA.DAFUser) AS EstadoVistaPes	,
		
		(CASE 
			WHEN TABLA_TEMA.nivel = 1 THEN TABLA_TEMA.OrderTema 
			ELSE 
			(CASE 
				WHEN TABLA_TEMA.nivel = 2 THEN (SELECT ORDERTEMA FROM TEMA WHERE ID_TEMA = TABLA_TEMA.codTema)
				ELSE 
				(dbo.funGetOrderTemaPadre(TABLA_TEMA.codTema)) 
				END)
			END) AS ORDER_TEMA_PADRE,
		
		TABLA_TEMA.nivel,		

		(CASE 
			WHEN TABLA_TEMA.nivel <= 2 THEN TABLA_TEMA.OrderTema 
			ELSE 
			(SELECT ORDERTEMA FROM TEMA WHERE ID_TEMA = TABLA_TEMA.codTema)
			END) AS ORDER_TEMA,

		TABLA_TEMA.OrderTema,
		INFO_BASES.orderinfo,
		TABLA_TEMA.codTema,
		TABLA_TEMA.nomTema
	FROM UserObra AS USER_OBRA
		INNER JOIN Infobases AS INFO_BASES ON UPPER(USER_OBRA.Obra) = UPPER(INFO_BASES.Obra) AND USER_OBRA.Vence >= GETDATE() 
		AND INFO_BASES.VISTA = 'PAIS' 
		AND (USER_OBRA.CodMedio <>352 or USER_OBRA.CodMedio is null)
		INNER JOIN ObrasNXT AS OBRAS_NXT ON USER_OBRA.Obra = OBRAS_NXT.id
		INNER JOIN Tema TABLA_TEMA ON INFO_BASES.CodTema = TABLA_TEMA.Id_Tema AND INFO_BASES.VISTA = TABLA_TEMA.TipoTema
		LEFT OUTER JOIN SalaNXT.dbo.AliasExcluye AS OBRASEXCLUIDAS_NXT ON OBRASEXCLUIDAS_NXT.UsuarioExcluye = USER_OBRA.DAFUser
			AND OBRASEXCLUIDAS_NXT.NomAliasExcluye = USER_OBRA.Obra
	WHERE (USER_OBRA.DAFUser = 'sijusalex@sijusa.com') AND (OBRASEXCLUIDAS_NXT.FechaExcluye IS NULL) AND USER_OBRA.Borrado = 0
) sq1
group by sq1.Obra, sq1.VistaPes, sq1.EstadoVistaPes, sq1.ORDER_TEMA_PADRE, sq1.nivel, sq1.ORDER_TEMA, sq1.OrderTema, sq1.orderinfo, sq1.CodTema, sq1.nomTema 
order by sq1.ORDER_TEMA_PADRE, sq1.ORDER_TEMA,ORDERTEMA, sq1.orderinfo   


