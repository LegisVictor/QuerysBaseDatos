------------------------------------------------------------------------
-- CONSULTA PARA SECCIONES 
------------------------------------------------------------------------
use comunidadcontable

SELECT *
FROM MagazinSeccion, Seccion WHERE Id_Seccion=CodSeccion AND CodMagazin=107 AND Sigla IN ('Arriba') ORDER BY ORDEN

SELECT * FROM MAGAZINSECCION where codseccion in (304,299,280,281,264,263) and codmagazin in (106,108) order by fechafin desc

SELECT * FROM MAGAZINSECCION where codmagazin =127 order by fechafin desc
select * from magazin 
select * from magazincontenido
select * from grupomagazin 
select  * from posicionseccion

-- update para actualizar fechas de secciones 
UPDATE MagazinSeccion SET FechaFin = '2113-12-31 23:00:00.000' where codseccion in (304,299,280,281,264,263) and codmagazin in (106,108) 


------------------------------------------------------------------------
-- ESTADISTICAS 
------------------------------------------------------------------------
use comunidadcontable 

select  nomobjetose, plantilla, plantillafinal, fechacreacion, url--, * 
from objetose 
where -- plantilla = 'eventos'AND 
ISNULL(PLANTILLAFINAL, '') <> '' AND 
FECHACREACION >= '2022-01-01' ORDER BY 4 ASC 

------------------------------------------------------------------------
-- ACTUALIZAR TEXTOS 
------------------------------------------------------------------------
select * from texto where nomtexto = 'Plantillaeventosproximos'

UPDATE [ComunidadContable].[dbo].[Texto] SET TEXTO = 
'https://www.comunidadcontable.com/BancoMedios/Documentos%20PDF/datos%20laborales,%20financieros%20y%20tributarios%202023.pdf' 
where NomTexto  = 'txtLinkVerMas'


------------------------------------------------------------------------
-- HABEAS DATA 
------------------------------------------------------------------------
use habeasdata 

/****** Script for SelectTopNRows command from SSMS  ******/
SELECT *, tbl.nomusuario , tbl.email, ta.NombreTipoAutorizacion
  FROM [habeasdata].[dbo].[TblAutorizacion]  tbl inner join TipoAutorizacion ta 
  on   tbl.CodTipoAutorizacion = ta.Id_TipoAutorizacion
  where 

  sitio in ('ComunidadContable','Comunidad Contable')

-- habeas data  10.250.6.78 (habeasdata)
SELECT distinct  
	replace(replace(a.nomusuario,',',''),'"','')as nombre ,replace(replace(replace(a.email,',',''),'"',''),' ','') as email 
FROM    
    tblautorizacion a
        INNER JOIN (
                     SELECT  MAX(fechaautorizacion) fecha_max,email
                     FROM    tblautorizacion
                     where   sitio like '%ambito%' and email like '%@%'   and nomusuario <> ''
                     GROUP BY email) b ON a.email = b.email 
					 AND  a.fechaautorizacion = b.fecha_max and a.codtipoautorizacion=1
					
	



 --newsContadores
 SELECT distinct nombre, email from  (

SELECT distinct replace(replace(usu.NomUsuario,',',''),'"','') as nombre ,replace(replace(replace(usu.Usuario,',',''),'"',''),' ','') as email 
		FROM [10.250.4.79].[Scala].[dbo].Usuario usu
		inner join [10.250.4.79].[Scala].[dbo].Atencion aten on aten.CodUsuario = usu.Id_Usuario
		inner join [10.250.4.79].[Scala].[dbo].Suscripcion susc on susc.CodAtencion = aten.Id_Atencion
		inner join [10.250.4.79].[Scala].[dbo].Producto prod on susc.CodProducto = prod.Id_Producto
		where susc.FechaFin > getdate() and usu.Usuario not like 'temporal%@legis.com.co'
		and usu.Usuario not like 'usergroup%@urllegis.com' and usu.Usuario not like 'scliente%@legis.com.co'
		AND prod.Sil_CodProducto in (4458, 5064) AND prod.CodFilial=6
UNION
select distinct	replace(replace(usu.NomUsuario,',',''),'"','')as nombre ,replace(replace(replace(usu.Usuario,',',''),'"',''),' ','') as email 
		FROM [10.250.4.79].[Scala].[dbo].usuario usu
		inner join [10.250.4.79].[Scala].[dbo].atencion on id_usuario=codusuario
		inner join [10.250.4.79].[Scala].[dbo].Suscripcion susc on id_atencion=codatencion
		inner join [10.250.4.79].[Scala].[dbo].Producto prod on susc.CodProducto = prod.Id_Producto
		where susc.FechaFin > getdate() and usu.Usuario='rhoyos@pkfcabrera.com' and id_producto not in (5689,7101)

union 
-- habeas data  10.250.6.78 (habeasdata)
SELECT distinct  
	replace(replace(a.nomusuario,',',''),'"','')as nombre ,replace(replace(replace(a.email,',',''),'"',''),' ','') as email 
FROM    
    tblautorizacion a
        INNER JOIN (
                     SELECT  MAX(fechaautorizacion) fecha_max,email
                     FROM    tblautorizacion
                     where   sitio like '%ambito%' and email like '%@%'   and nomusuario <> ''
                     GROUP BY email) b ON a.email = b.email 
					 AND  a.fechaautorizacion = b.fecha_max and a.codtipoautorizacion=1
					
					
					)   tb1 

					----- Cannot resolve the collation conflict between "SQL_Latin1_General_CP1_CI_AS" and "Modern_Spanish_CI_AS" in the UNION operation.






					select * from producto where Sil_CodProducto in (4458, 5064) 
					

 --comunidad contable 
 SELECT distinct nombre, email from  (



SELECT distinct replace(replace(usu.NomUsuario,',',''),'"','') as nombre ,replace(replace(replace(usu.Usuario,',',''),'"',''),' ','') as email 
		FROM [10.250.4.79].[Scala].[dbo].Usuario usu
		inner join [10.250.4.79].[Scala].[dbo].Atencion aten on aten.CodUsuario = usu.Id_Usuario
		inner join [10.250.4.79].[Scala].[dbo].Suscripcion susc on susc.CodAtencion = aten.Id_Atencion
		inner join [10.250.4.79].[Scala].[dbo].Producto prod on susc.CodProducto = prod.Id_Producto
		where susc.FechaFin > getdate() and usu.Usuario not like 'temporal%@legis.com.co'
		and usu.Usuario not like 'usergroup%@urllegis.com' and usu.Usuario not like 'scliente%@legis.com.co'
		--AND prod.Sil_CodProducto in (4458, 5064) 
		AND prod.CodFilial=6
UNION
select distinct	replace(replace(usu.NomUsuario,',',''),'"','')as nombre ,replace(replace(replace(usu.Usuario,',',''),'"',''),' ','') as email 
		FROM [10.250.4.79].[Scala].[dbo].usuario usu
		inner join [10.250.4.79].[Scala].[dbo].atencion on id_usuario=codusuario
		inner join [10.250.4.79].[Scala].[dbo].Suscripcion susc on id_atencion=codatencion
		inner join [10.250.4.79].[Scala].[dbo].Producto prod on susc.CodProducto = prod.Id_Producto
		where susc.FechaFin > getdate() 
		and usu.Usuario='rhoyos@pkfcabrera.com' 
		--and id_producto not in (5689,7101)



union 


select nombre, email from ( 
-- habeas data  10.250.6.78 (habeasdata)
SELECT distinct  
	replace(replace(a.nomusuario,',',''),'"','')as nombre ,replace(replace(replace(a.email,',',''),'"',''),' ','') as email 
FROM    
    tblautorizacion a
        INNER JOIN (
                     SELECT  MAX(fechaautorizacion) fecha_max,email
                     FROM    tblautorizacion
                     where   sitio in ('ComunidadContable','Comunidad Contable') and email like '%@%' and nomusuario <> ''
                     GROUP BY email) b ON a.email = b.email 
					 AND  a.fechaautorizacion = b.fecha_max and a.codtipoautorizacion=1
					
					
					)   tb1 
					)tb2


--**************************************************************************************
-- consulta habeasdata, para ambito y comunidadcontable. 
--**************************************************************************************

-- CONTADORES


SELECT distinct replace(replace(usu.NomUsuario,',',''),'"','') as nombre ,replace(replace(replace(usu.Usuario,',',''),'"',''),' ','') as email 
		FROM [10.250.4.79].[Scala].[dbo].Usuario usu
		inner join [10.250.4.79].[Scala].[dbo].Atencion aten on aten.CodUsuario = usu.Id_Usuario
		inner join [10.250.4.79].[Scala].[dbo].Suscripcion susc on susc.CodAtencion = aten.Id_Atencion
		inner join [10.250.4.79].[Scala].[dbo].Producto prod on susc.CodProducto = prod.Id_Producto
		inner join tblautorizacion a on a.email = usu.usuario collate Modern_Spanish_CI_AS
		where susc.FechaFin > getdate() and usu.Usuario not like 'temporal%@legis.com.co'
		and usu.Usuario not like 'usergroup%@urllegis.com' and usu.Usuario not like 'scliente%@legis.com.co'
		AND prod.Sil_CodProducto in (4458, 5064) AND prod.CodFilial=6
		and a.sitio like '%ambito%' and  a.email like '%@%'   --and  a.nomusuario <> '' 
		and a.codtipoautorizacion=1
UNION
select distinct	replace(replace(usu.NomUsuario,',',''),'"','')as nombre ,replace(replace(replace(usu.Usuario,',',''),'"',''),' ','') as email 
		FROM [10.250.4.79].[Scala].[dbo].usuario usu
		inner join [10.250.4.79].[Scala].[dbo].atencion on id_usuario=codusuario
		inner join [10.250.4.79].[Scala].[dbo].Suscripcion susc on id_atencion=codatencion
		inner join [10.250.4.79].[Scala].[dbo].Producto prod on susc.CodProducto = prod.Id_Producto
		inner join tblautorizacion a on a.email = usu.usuario  collate Modern_Spanish_CI_AS
			
			where susc.FechaFin > getdate() and usu.Usuario='rhoyos@pkfcabrera.com' and id_producto not in (5689,7101) and 
			 a.sitio like '%ambito%' and  a.email like '%@%'   --and  a.nomusuario <> '' 
			 and a.codtipoautorizacion=1

UNION
 -- COMUNIDADCONTABLE 
 --use habeasdata
 SELECT distinct replace(replace(usu.NomUsuario,',',''),'"','') as nombre ,replace(replace(replace(usu.Usuario,',',''),'"',''),' ','') as email 
		FROM [10.250.4.79].[Scala].[dbo].Usuario usu
		inner join [10.250.4.79].[Scala].[dbo].Atencion aten on aten.CodUsuario = usu.Id_Usuario
		inner join [10.250.4.79].[Scala].[dbo].Suscripcion susc on susc.CodAtencion = aten.Id_Atencion
		inner join [10.250.4.79].[Scala].[dbo].Producto prod on susc.CodProducto = prod.Id_Producto
		inner join tblautorizacion a on a.email = usu.usuario collate Modern_Spanish_CI_AS
		where susc.FechaFin > getdate() and usu.Usuario not like 'temporal%@legis.com.co'
		and usu.Usuario not like 'usergroup%@urllegis.com' and usu.Usuario not like 'scliente%@legis.com.co'
		--AND prod.Sil_CodProducto in (4458, 5064) AND prod.CodFilial=6
		and a.sitio in ('ComunidadContable','Comunidad Contable') and  a.email like '%@%'   --and  a.nomusuario <> '' 
		and a.codtipoautorizacion=1
UNION
select distinct	replace(replace(usu.NomUsuario,',',''),'"','')as nombre ,replace(replace(replace(usu.Usuario,',',''),'"',''),' ','') as email 
		FROM [10.250.4.79].[Scala].[dbo].usuario usu
		inner join [10.250.4.79].[Scala].[dbo].atencion on id_usuario=codusuario
		inner join [10.250.4.79].[Scala].[dbo].Suscripcion susc on id_atencion=codatencion
		inner join [10.250.4.79].[Scala].[dbo].Producto prod on susc.CodProducto = prod.Id_Producto
		inner join tblautorizacion a on a.email = usu.usuario  collate Modern_Spanish_CI_AS
			
			where susc.FechaFin > getdate() and usu.Usuario='rhoyos@pkfcabrera.com' 
			--and id_producto not in (5689,7101) 
			and a.sitio in ('ComunidadContable','Comunidad Contable')  and  a.email like '%@%'  -- and  a.nomusuario <> ''
			and a.codtipoautorizacion=1

