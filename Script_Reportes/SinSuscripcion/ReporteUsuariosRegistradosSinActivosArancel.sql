--drop table #TempUsuarios
select distinct 'f:bd03591f-be73-4be4-b7ed-a7c264d01cd9:'+Usuario as Usuario, FechaCreacion
into #TempUsuarios
from usuario
inner join UsuarioCreacion uc on Id_Usuario=uc.CodUsuario
where  uc.FechaCreacion between '2025-12-05 00:00' and '2026-02-24 00:00'  and Cliente='Arancel'
order by FechaCreacion asc

--se eliminan los que tienen suscripcion activa en silenio y son de xperta
delete #TempUsuarios where Usuario in (
select distinct 'f:bd03591f-be73-4be4-b7ed-a7c264d01cd9:'+Usuario as Usuario
from usuario
inner join UsuarioCreacion uc on Id_Usuario=uc.CodUsuario
inner join atencion a on a.CodUsuario =Id_Usuario
inner join Suscripcion s on s.CodAtencion=a.Id_Atencion
inner join AccesoProducto ap on ap.CodProducto=s.CodProducto
inner join Acceso ac on ac.Id_Acceso=ap.CodAcceso
where  uc.FechaCreacion >'2020-01-01 00:00' and Cliente='Arancel' 
and s.Sil_CodSuscripcion is not null  and s.FechaFin>getdate() and ac.CodAplicacionWeb in (2))


select usrs.*, ISNULL(bl.IDENTITY_PROVIDER,'Formulario') as MetodoRegistro, CASE WHEN AA.CodtipoAutorizacion=1 THEN 'true' ELSE 'false' END as AutorizacionHabeas
from 

(
select REPLACE(USER_ID,'f:bd03591f-be73-4be4-b7ed-a7c264d01cd9:','') as Usuario, FechaCreacion, FIRST_NAME as Nombre, LAST_NAME as Apellido, EMAIL as Correo, mobile as Telefono, gender as Sexo,
		address as Direccion, birthdate as Nacimiento,especializations as Especializaciones, interests as Intereses, occupation as Ocupacion,companysize as Empresa, sector as Sector,region as Region, habeas as HabeasSSO
FROM(
select AT.USER_ID, FechaCreacion,  AT.NAME, CAST(AT.VALUE as varchar(8000)) as VALUE from [10.250.4.29].[keycloak].[dbo].FED_USER_ATTRIBUTE AT
INNER JOIN #TempUsuarios U on AT.USER_ID=u.Usuario
) as x
PIVOT (
max(x.VALUE)
FOR
x.NAME IN (address,birthdate,EMAIL,ENABLED,especializations,FIRST_NAME,gender,interests,LAST_NAME,mobile,occupation,companysize,sector,region, habeas)
) as Pivote
) as usrs
Left Join [10.250.4.29].[keycloak].[dbo].BROKER_LINK BL on REPLACE(BL.USER_ID,'f:bd03591f-be73-4be4-b7ed-a7c264d01cd9:','') = usrs.Usuario
Left join 
(
/*
select MAX(th.Id_TblAutorizacion), th.email
from [10.250.4.7].[habeasdata].[dbo].TblAutorizacion th 
where usrs.Usuario = th.email collate Modern_Spanish_CI_AS and (th.sitio = 'LEGIS_XPERTA' or th.sitio = 'LEGIS-XPERTA' or th.sitio = 'LPP')
group by th.email
*/

Select CodTipoAutorizacion, Email
From (
	select th.CodTipoAutorizacion,th.Email, row_number() OVER (PARTITION BY th.Email ORDER BY th.Id_TblAutorizacion DESC) AS rn
	from [10.250.4.7].[habeasdata].[dbo].TblAutorizacion th 
	where th.sitio like '%arancel%'
) sub
Where rn=1

) AA ON usrs.Usuario = AA.email collate Modern_Spanish_CI_AS
ORDER BY Usuario

