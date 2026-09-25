**************************************************************
*** VERIFICAR QUE ESTE MARCADA PARA APPS (SALANXT)
**************************************************************									   

SELECT TOP 1 
  CASE WHEN ISNULL(OC1.Atributo, 0)='1'
  OR ISNULL(OC2.Atributo, 0)='1' THEN '1'
  ELSE '0' END
FROM Obra O 
LEFT OUTER JOIN ObraCampos OC1 ON 
OC1.Id_Obra = O.Alias
AND OC1.Id_Campo = 39 -- Disponible en Apps.
LEFT OUTER JOIN ObraCampos OC2 ON 
OC2.Id_Obra = O.Alias
AND OC2.Id_Campo = 40 -- eBook para Apps.
WHERE
  O.Alias = 'civilbasicoested13'






DBisapi
INSERT INTO Infobases 
SELECT 'cgpbasico2021b', 'CÓDIGO GENERAL DEL PROCESO  BÁSICO 11ª  ed', Gratis, Publico, Activa, CodListaPaises, 
REPLACE(CodTema,'2021', '2022'), OrderInfo+1,'CODIGOS BASICOS 2021/cgpbasico2021b', 'CODIGOS BASICOS 2021(cgpbasico2021b)', Vista, GrupoTema
, Infobases.* FROM Infobases 
WHERE Obra = 'cgpbasicoested11' and Vista = 'PAIS'


INSERT INTO Infobases
SELECT top 1 'cgpbasico2021b', 'CÓDIGO GENERAL DEL PROCESO  BÁSICO 11ª  ed', Gratis, Publico, Activa, CodListaPaises, 
'TEMA_DERECHO CIVIL', OrderInfo+1, 'Derecho Civil/cgpbasico2021b', 'Derecho Civil'+'('+'cgpbasico2021b'+')', 
Vista, GrupoTema FROM Infobases WHERE Obra = 'cgpbasico2021a' and Vista = 'TEMA';


INSERT INTO ObrasNXT SELECT 'cgpbasico2021b', 'cgpbasico2021b', 'CÓDIGO GENERAL DEL PROCESO  BÁSICO 11ª  ed', GETDATE(), estado FROM ObrasNXT WHERE Id = 'cgpbasico2021a';
INSERT INTO ObraFormulario SELECT 'cgpbasico2021b', CodFormulario FROM ObraFormulario WHERE CodObra='cgpbasico2021a';
INSERT INTO UserObra (dafuser, obra, tipo, vence, unidad, cupo, filial, multilegis, borrado, cantidadoriginal) SELECT 'nestor.fernandez@legis.com.co', 'cgpbasico2021b', 'B', (GETDATE() + 2000), 1, 1, 'CO', 0, 0, 1;
INSERT INTO UserObra (dafuser, obra, tipo, vence, unidad, cupo, filial, multilegis, borrado, cantidadoriginal) SELECT 'julio.villamil@legis.com.co', 'cgpbasico2021b', 'B', (GETDATE() + 2000), 1, 1, 'CO', 0, 0, 1;
INSERT INTO UserObraTipoMedio (codDafuser, codObra, codTipoMedioApps, descripcion, fechaCreacion) SELECT 'nestor.fernandez@legis.com.co', 'cgpbasico2021b', 2, 'Internet', GETDATE();
INSERT INTO UserObraTipoMedio (codDafuser, codObra, codTipoMedioApps, descripcion, fechaCreacion) SELECT 'nestor.fernandez@legis.com.co', 'cgpbasico2021b', 3, 'EBooks', GETDATE();
INSERT INTO UserObraTipoMedio (codDafuser, codObra, codTipoMedioApps, descripcion, fechaCreacion) SELECT 'julio.villamil@legis.com.co', 'cgpbasico2021b ', 2, 'Internet', GETDATE();
INSERT INTO UserObraTipoMedio (codDafuser, codObra, codTipoMedioApps, descripcion, fechaCreacion) SELECT 'julio.villamil@legis.com.co', 'cgpbasico2021b', 3, 'EBooks', GETDATE();


salanxt
INSERT INTO ObraCampos VALUES ('cgpbasico2021b', 2, 'CÓDIGO GENERAL DEL PROCESO  BÁSICO 11ª  ed')
INSERT INTO ObraCampos VALUES ('cgpbasico2021b', 19, 'CÓDIGO GENERAL DEL PROCESO  BÁSICO 11ª  ed')
INSERT INTO ObraCampos SELECT 'cgpbasico2021b', Id_Campo, Atributo FROM ObraCampos WHERE Id_Obra = 'cgpbasico2021a' AND Id_Campo = 54
INSERT INTO ObraCampos VALUES ('cgpbasico2021b', 40, 1)
INSERT INTO Obra VALUES ('cgpbasico2021b', 'cgpbasico2021b', GETDATE())
INSERT INTO ProveedorFiltroTipos SELECT DISTINCT TipoFiltro, NomTema, 'cgpbasico2021b', Atributo FROM ProveedorFiltroTipos WHERE obra = 'cgpbasico2021a'
INSERT INTO Comentarios_Obras VALUES ('cgpbasico2021b', 1)




use dbisapi
declare @alias varchar(50) = 'penalbasico2021b'
select top 10 * from Infobases where Obra =@alias
select top 10 * from ObrasNXT where id =@alias
select top 10 * from ObraFormulario where CodObra like '%'+@alias+'%'
select top 10 * from UserObra where Obra=@alias and DAFUser in('julio.villamil@legis.com.co','nestor.fernandez@legis.com.co')
select top 10 * from UserObraTipoMedio where codObra=@alias and codDafuser in('julio.villamil@legis.com.co','nestor.fernandez@legis.com.co')

use salanxt
declare @alias2 varchar(50) = 'penalbasico2021b'
select top 100 * from ObraCampos where Id_Obra =@alias2;
select top 10 * from Obra where Alias =@alias2;
select top 10 * from ProveedorFiltroTipos where Obra =@alias2;
select top 10 * from [SalaNxt].[dbo].Comentarios_Obras where IdObra = @alias2;


-- Data Source=GLAUCO\MODERN_SPANISH;Initial Catalog=SalaNxt;Persist Security Info=True;Connection Timeout=180;User ID=dbisapi;Password=dbisapi2016123*; 

-- DBisapi
-- insert into tema values ('DERECHO PRIVADO','PAIS','DERECHO PRIVADO',null, 4, 'AGRUPADO','CODIGOS2019',1,'DERECHO PRIVADO',0)

-- delete tema where Id_Tema='DERECHO PRIVADO' and TipoTema='TEMA'
--delete Infobases where obra='cgpbasico2021b' and Vista='TEMA'




cgpbasicoested13	             CÓDIGO GENERAL DEL PROCESO  - COLECCIÓN UNIVERSITARIA 13a ed
cgpbasico2022a	                 CÓDIGO GENERAL DEL PROCESO BÁSICO - 12 Ed
civilbasicoested13	             CÓDIGO CIVIL BÁSICO - COLECCIÓN UNIVERSITARIA 13a ed
civilbasico2022a	             CÓDIGO CIVIL BASICO 47A ED
comerbasicoested13	             CÓDIGO DE COMERCIO BÁSICO - COLECCIÓN UNIVERSITARIA 13a ed
comerbasico2022a	             CÓDIGO DE COMERCIO BASICO 46A ED
constitubaested12	             CONSTITUCIÓN POLÍTICA DE COLOMBIA 1991 - BÁSICO - COLECCIÓN UNIVERSITARIA 12a ed
constitubasico2022a	             CONSTITUCIÓN POLÍTICA BASICO 46A ED
laboralbaested13	             CÓDIGO LABORAL BÁSICO - COLECCIÓN UNIVERSITARIA 13a ed

laboralbasico2022a	             CÓDIGO SUSTANTIVO DEL TRABAJO BASICO 48A ED
penalbasicoested12	             CÓDIGO PENAL Y DE PROCEDIMIENTO PENAL BÁSICO - COLECCIÓN UNIVERSITARIA 12a ed
penalbasicoested13	             CÓDIGO PENAL Y DE PROCEDIMIENTO PENAL BÁSICO - COLECCIÓN UNIVERSITARIA 13a ed
penalbasico2022a	             CÓDIGO PENAL BASICO - 27A ED


SELECT Obra, Descripcion,CodTema, Vista, Gratis, Publico, Activa, CodListaPaises,  OrderInfo, path, dominio,  GrupoTema
FROM dbisapi.[dbo].Infobases
WHERE obra = 'penalbasico2021b'