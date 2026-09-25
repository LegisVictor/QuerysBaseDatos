--************************************************************************************
--*** CONSULTAR CLAVE USUARIO Base de datos SCALA 10.250.6.19
--************************************************************************************
-- SOLICITUD: CREAR UNA OBRA PARA OTRAS FILIALES

use scala


--Régimen de los Recursos Minerales de Panamá 

-- Consultas  
SELECT * FROM PRODUCTO WHERE CODFILIAL = 99
select * from ProductoObraOnLine where codproducto =8409
select * from ObraOnLine where  CODFILIAL = 99 and alias = 'sijcontrpublc'

SELECT *   FROM [dbo].[Medio] where codfilial = 99


/*
-- creamos el producto 
EXEC [dbo].[Sil_InsertaActualizaProducto]
	@NomProducto ='RÉGIMEN DE LA CONTRATACIÓN PÚBLICA DE PANAMÁ',
	@Descripcion ='RÉGIMEN DE LA CONTRATACIÓN PÚBLICA DE PANAMÁ',
	@Sil_CodProducto = 999999917,	-- preguntar a silenio que numero se podria usar. 
	@CodFilial =99,-- se copia de una que ya exista
	@CodMedio =365,-- se copia de una que ya exista
	@TipoClave=null,-- se copia de una que ya exista
	@UEN =4,-- se copia de una que ya exista
	@Activo =1,-- se copia de una que ya exista
	@VisibleFiliales =1,-- se copia de una que ya exista
    @CodTareaEnvioCorreo = NULL -- se copia de una que ya exista

-- Creamos ObraOnLine
exec [dbo].[Sil_InsertaActualizaObraOnLine]
	@NomObraOnLine='RÉGIMEN DE LA CONTRATACIÓN PÚBLICA DE PANAMÁ', -- minuscula
	@Alias = 'sijcontrpublc', -- el usuario del caso o se lo da galeano. 
	@Activa =1, -- para inactivar o activar enviar un cero o un uno
	@CodFilial =99
	
	
-- Creamos ProductoObraOnLine

exec [dbo].[Sil_InsertaActualizaProductoObraOnLine] 

	@CodProducto =10894, -- codigo del producto que se creo 
	@CodObraOnLine =2550,-- codigo de la obra online que se creo 
	@Activo=1 -- para inactivar o activar enviar un cero o un uno
*/


-- verificamos 
SELECT * FROM PRODUCTO P INNER JOIN  ProductoObraOnLine POO ON P.ID_PRODUCTO = POO.CODPRODUCTO
INNER JOIN obraonline OO ON OO.Id_ObraOnLine = poo.codobraonline
WHERE p.CodFilial=99 and OO.activa = 1 and poo.activo = 1
--and P.NomProducto ='RÉGIMEN BANCARIO DE SEGUROS Y VALORES DE PANAMÁ'
--and p.sil_codproducto = '999999912'

and oo.Id_ObraOnLine in  (2444,
2445) 


-- Nota se debe crear el acceso tambien del producto. 

-- exec InsertaActualizaAccesoProducto @codacceso = 486,     @CodProducto = 10894 