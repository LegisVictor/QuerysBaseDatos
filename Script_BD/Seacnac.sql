/****** Script for SelectTopNRows command from SSMS  ******/
SELEct top 10 *
  FROM [SEAC_NA].[dbo].[Tarea] where fechahora between '2024-01-01 00:00:00.000' and '2024-02-29 09:20:46.427'and fallas > 0 
  
---   and  nomtarea = 'AdicionProductosLegisComex'  and subject = 'Te damos la bienvenida a Legiscomex' 
   order by 1 desc


  select '''' + trim(email) + ''',', codtarea from colamensaje where CodTarea in (SELEct id_tarea
  FROM [SEAC_NA].[dbo].[Tarea] where fechahora between '2024-01-01 00:00:00.000' and '2024-02-29 09:20:46.427' and  nomtarea = 'AdicionProductosLegisComex'  
 -- AND EMAIL LIKE'%MILFORT%'
  and subject = 'Te damos la bienvenida a Legiscomex' and fallas > 0 and exitos =0
) ORDER BY 2 DESC



/****** Script for SelectTopNRows command from SSMS  ******/
SELECT *
  FROM [SEAC_NA].[dbo].[Tarea] where exitos =0 and  fallas <> 0
  and fechahora between '2024-01-30 00:01:36.877' and '2024-03-29 09:20:46.427' 

   select * from colamensaje where CodTarea in (SELECT id_tarea
  FROM [SEAC_NA].[dbo].[Tarea] where exitos =0 and  fallas <> 0
  and fechahora between '2024-01-30 00:01:36.877' and '2024-03-29 09:20:46.427' 
) ORDER BY 2 DESC

/***


update tarea set Exitos = 0, fallas = 0, estado =1, CodProveedor = 3 
 where exitos =0 and  fallas <> 0   and fechahora between '2024-01-30 00:01:36.877' and '2024-03-29 09:20:46.427'; 

 update ColaMensaje set estado = 1, guid = null, MensajeError = null 
 where CodTarea in (SELECT id_tarea FROM [SEAC_NA].[dbo].[Tarea] 
 where exitos =0 and  fallas <> 0 and fechahora between '2024-01-30 00:01:36.877' and '2024-03-29 09:20:46.427' 
) ; ***/

update tarea set Exitos = 0, fallas = 0, estado =1, CodProveedor = 3 
 where exitos =0 and  fallas =  0 and estado =10  and fechahora between '2024-01-30 00:01:36.877' and '2024-02-28 11:45:52.880'; 

 update ColaMensaje set estado = 1, guid = null, MensajeError = null where CodTarea in (SELECT id_tarea
  FROM [SEAC_NA].[dbo].[Tarea] where exitos =0 and  fallas = 0
  and fechahora between '2024-01-30 00:01:36.877' and '2024-02-28 11:45:52.880' 
) ;