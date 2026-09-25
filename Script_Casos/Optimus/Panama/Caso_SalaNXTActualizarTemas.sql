use scala 
-- verificamos 
SELECT P.nomproducto, OO.Alias FROM PRODUCTO P INNER JOIN  ProductoObraOnLine POO ON P.ID_PRODUCTO = POO.CODPRODUCTO
INNER JOIN obraonline OO ON OO.Id_ObraOnLine = poo.codobraonline
WHERE p.CodFilial=99-- and OO.activa = 1 and poo.activo = 1
and P.NomProducto in (
'RÉGIMEN DE BIENES Y RAÍCES DE PANAMÁ'
,'RÉGIMEN ELECTORAL DE PANAMÁ'    
,'RÉGIMEN FAMILIAR DE PANAMÁ'  
,'RÉGIMEN FISCAL DE PANAMÁ'  
,'RÉGIMEN PROCESAL DE PANAMÁ'   
,'RÉGIMEN DE LA CONTRATACIÓN PÚBLICA DE PANAMÁ'
) or oo.alias in ( 'sijfamilia', 'sijelectoral', 'sijcodfiscal', 'sijjudicial')
order by oo.alias; 


select * from producto where codfilial = 99 

--and p.sil_codproducto = '999999912'
--and oo.Id_ObraOnLine in  (2444,2445) 

use SalaNxt



select * from ProveedorFiltroTipos where Obra in (
'sijelectoral'
,'sijjudicial'
,'sijfamilia'
,'sijcodfiscal'
,'sijbienesra'
,'sijcontrpublc') order by obra; 




INSERT INTO ProveedorFiltroTipos
	SELECT DISTINCT TipoFiltro, NomTema, @ObraNueva, Atributo
	FROM ProveedorFiltroTipos
	WHERE obra = @ObraOriginal;



update [SalaNxt].[dbo].[ProveedorFiltroTipos] set NomTema='ADMINISTRATIVO' where Obra ='sijcontrpublc' and nomtema = 'PENAL'; 



TRIBUTARIO	sijcodfiscal
PROCESAL PENAL	sijjudicial
PENAL	sijbienesra
ADMINISTRATIVO	sijcontrpublc
PROCESAL	sijcontrpublc
PROCESAL	sijjudicial
DE FAMILIA	sijfamilia
ELECTORAL	sijelectoral


select * from  [SalaNxt].[dbo].[ProveedorFiltroTipos] where Obra ='sijjudicial' and nomtema = 'PENAL';

-- RÉGIMEN DE BIENES Y RAÍCES DE PANAMÁ	sijbienesra
INSERT INTO ProveedorFiltroTipos (TipoFiltro, NomTema, Obra, Atributo) 
                          values (1, 'COMERCIAL Y SOCIETARIO' , 'sijbienesra', ''); 
-- Regímen Fiscal Panama	sijcodfiscal
INSERT INTO ProveedorFiltroTipos (TipoFiltro, NomTema, Obra, Atributo) 
                          values (1, 'FINANCIERO Y CAMBIARIO' , 'sijcodfiscal', ''); 
-- RÉGIMEN DE LA CONTRATACIÓN PÚBLICA DE PANAMÁ	sijcontrpublc
delete from  [SalaNxt].[dbo].[ProveedorFiltroTipos] where Obra ='sijcontrpublc' and nomtema = 'PROCESAL';

-- Régimen Electoral	sijelectoral
INSERT INTO ProveedorFiltroTipos (TipoFiltro, NomTema, Obra, Atributo) 
                          values (1, 'CONSTITUCIONAL' , 'sijelectoral', ''); 
-- Régimen de la Familia	sijfamilia
INSERT INTO ProveedorFiltroTipos (TipoFiltro, NomTema, Obra, Atributo) 
                          values (1, 'CIVIL' , 'sijfamilia', ''); 
-- RÉGIMEN PROCESAL DE PANAMÁ sijjudicial



RÉGIMEN DE BIENES Y RAÍCES DE PANAMÁ			**Inmobiliario,** | COMERCIAL Y SOCIETARIO | PENAL
RÉGIMEN FISCAL DE PANAMÁ						TRIBUTARIO | FINANCIERO Y CAMBIARIO
RÉGIMEN DE LA CONTRATACIÓN PÚBLICA DE PANAMÁ	ADMINISTRATIVO
RÉGIMEN ELECTORAL DE PANAMÁ						ELECTORAL	| CONSTITUCIONAL
RÉGIMEN FAMILIAR DE PANAMÁ   DE FAMILIA | CIVIL
RÉGIMEN PROCESAL DE PANAMÁ   PROCESAL |  PROCESAL PENAL | **PROCESAL CIVIL**


RÉGIMEN DE BIENES Y RAÍCES DE PANAMÁ	sijbienesra
Regímen Fiscal Panama	sijcodfiscal
RÉGIMEN DE LA CONTRATACIÓN PÚBLICA DE PANAMÁ	sijcontrpublc
Régimen Electoral	sijelectoral
Régimen de la Familia	sijfamilia
Régimen Procesal	sijjudicial