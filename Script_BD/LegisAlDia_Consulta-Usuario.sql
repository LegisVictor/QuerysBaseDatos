use LegisAlDiaV2;
declare @email varchar(200) = 'juridica@procopal.com'

SELECT s1.Email
FROM SeleccionEnvioBoletin s1 WHERE 
s1.email in (@email);

select * 
from suscriptor 
where email in (@email);

select top 10 * 
from tramassuscriplegisaldia
where email in (@email)
order by id_tramaprocesada;

select * from habeasdata.dbo.tblautorizacion where email = @email;

SELECT *
from [10.250.4.79].scala.dbo.FuenteExterna_3
WHERE email = @email;

select *
from [NuevoLegisMovil].[dbo].[fuenteexterna_210] 
where email = @email;

