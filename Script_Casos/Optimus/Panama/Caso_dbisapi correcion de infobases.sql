select * from [dbisapi].[dbo].Infobases where --CODTEMA = 'TEMA_DERECHO COMERCIAL Y SOCIETARIO' AND CodListaPaises = 6 and 
CodListaPaises=6

select * from [dbisapi].[dbo].ListaPaises where Id_Pais =6





SELECT  PATH = REPLACE(PATH, '2021','2023'), DOMINIO =  REPLACE(DOMINIO, '2021','2023')  FROM [dbisapi].[dbo].Infobases WHERE OBRA = 'penalbasico2023b'; 

SELECT PATH = 'Derecho Comercial y Societario/sijbienesra', DOMINIO = 'Derecho Comercial y Societario(sijbienesra)'  FROM [dbisapi].[dbo].Infobases WHERE OBRA = 'sijbienesra' AND CODTEMA = 'TEMA_DERECHO COMERCIAL Y SOCIETARIO';

SELECT  PATH = 'Derecho Comercial y Societario/sijprecapana', DOMINIO = 'Derecho Comercial y Societario(sijprecapana)' FROM [dbisapi].[dbo].Infobases WHERE OBRA = 'sijprecapana' AND CODTEMA = 'TEMA_DERECHO COMERCIAL Y SOCIETARIO';

SELECT * FROM [dbisapi].[dbo].Infobases WHERE OBRA = 'penalbasico2023b'; 

SELECT * FROM [dbisapi].[dbo].Infobases WHERE OBRA = 'sijbienesra' AND CODTEMA = 'TEMA_DERECHO COMERCIAL Y SOCIETARIO';

SELECT *FROM [dbisapi].[dbo].Infobases WHERE OBRA = 'sijprecapana' AND CODTEMA = 'TEMA_DERECHO COMERCIAL Y SOCIETARIO';



/****** Script for SelectTopNRows command from SSMS  ******/
SELECT top 2 *
  FROM [dbisapi].[dbo].[UserObra] where dafuser like '%herrera_maria%' and obra ='sijprecapana'
SELECT *
  FROM [dbisapi].[dbo].[UserObra] where  obra ='sijbienesra'
  SELECT *
  FROM [dbisapi].[dbo].[UserObra] where dafuser like '%sistemfred@hotmail.com%' and obra ='sijprecapana'

  
-- verificamos el producto 
SELECT * FROM [scala].[dbo].PRODUCTO P INNER JOIN  [scala].[dbo].ProductoObraOnLine POO ON P.ID_PRODUCTO = POO.CODPRODUCTO
INNER JOIN [scala].[dbo].obraonline OO ON OO.Id_ObraOnLine = poo.codobraonline
WHERE p.CodFilial=99 and OO.activa = 1 and poo.activo = 1 and oo.alias = 'sijbienesra'

  select * from [dbisapi].[dbo].UserObraTipoMedio where codobra in  ('sijprecapana','sijbienesra')

 select * from [dbisapi].[dbo].obraformulario where codobra in  ('sijprecapana','sijbienesra', 'sijcodfiscal', 'sijmigracion','sijadministrativo')

 select * from [dbisapi].[dbo].formulario 


  select * from [SalaNxt].[dbo].obracampos where id_obra = 'sijmigracion'
    select * from [SalaNxt].[dbo].obracampos where id_obra = 'sijcodfiscal'
	  select * from [SalaNxt].[dbo].obracampos where id_obra = 'sijadministrativo'


 select * from [SalaNxt].[dbo].obracampos where id_obra in ('sijprecapana','sijbienesra', 'sijjudicial','sijadministrativo', 'sijcivil') and Id_Campo =43


 select * from [SalaNxt].[dbo].campos 
 
 sijcivil_a8ef55e54087445fa69d6f77d6e69723
 
 --exec [dbo].[SP_CrearObraCampoAB]	@Id_Obra = 'sijprecapana',    @Id_Campo = 43 ,	@Atributo='sijprecapana_73f25ed8ac3d494f94feea899a7cf6fd'

 --exec [dbo].[SP_CrearObraCampoAB]	@Id_Obra = 'sijbienesra',    @Id_Campo = 43 ,	@Atributo='sijbienesra_3e25d23f0c9d407a991f25d13da5e539'
 
 
 
 
 
 
   
 --- *********************************************************************
 --- actualizar nombre obra 
 --- *********************************************************************
 
select * from [dbisapi].[dbo].Infobases where obra in ('sijbienesra')

 -- 1. actualizamos el infobases 
 -- update [dbisapi].[dbo].Infobases set descripcion = 'RÉGIMEN BANCARIO DE SEGUROS Y VALORES DE PANAMÁ'   where obra in ('sijfinanciero');
  
 
SELECT TOP (1000) [id]
      ,[name]
      ,[title]
      ,[FECHA]
      ,[estado]
  FROM [dbisapi].[dbo].[ObrasNXT]  where id in ('sijbienesra');
  
-- 2. actualizamos obrasNxt 
--- update [dbisapi].[dbo].[ObrasNXT] set title='RÉGIMEN BANCARIO DE SEGUROS Y VALORES DE PANAMÁ'  where id in ('sijfinanciero');


  select * from [SalaNxt].[dbo].obracampos  where id_obra in ('sijfinanciero') and id_campo in (2,19);
-- 3. [SalaNxt].[dbo].obracampos 
  
--update  [SalaNxt].[dbo].obracampos set atributo='RÉGIMEN BANCARIO DE SEGUROS Y VALORES DE PANAMÁ'  where id_obra in ('sijfinanciero') and id_campo in (2,19);


























  
  
 --- *********************************************************************
 --- Para insertar obra a un usuario 
 --- *********************************************************************
 --RÉGIMEN SOBRE PREVENCIÓN DE BLANQUEO DE CAPITALES DE PANAMÁ	999999914
 --RÉGIMEN DE BIENES Y RAÍCES DE PANAMÁ	999999915

 /*

 SELECT distinct  
 u.usuario, a.correo, a.usuarioweb, 
'|| USUARIO ||' AS USUARIO,U.* ,
'|| ATENCION ||' AS USUARIO, a.*,
'|| CLIENTE ||' AS CLIENTE, c.*,
'|| SUSCRIPCION ||' AS SUSCRIPCION, s.*,
'|| PRODUCTO ||' AS PRODUCTO,   p.* 
FROM [scala].[dbo].Suscripcion s 
inner JOIN [scala].[dbo].Atencion a on a.Id_Atencion=s.CodAtencion
inner JOIN [scala].[dbo].Usuario u on a.CodUsuario=u.Id_Usuario
inner JOIN [scala].[dbo].Producto p on p.Id_Producto=s.CodProducto
LEFT JOIN [scala].[dbo].Sucursal suc on suc.Id_Sucursal=a.CodSucursal
LEFT join [scala].[dbo].Cliente c on c.Id_Cliente=suc.CodCliente
WHERE p.CodFilial=99 -- and OO.activa = 1 and poo.activo = 1 and   --oo.alias = @ObraAlias
 AND s.fechafin >= getdate() AND P.Sil_CodProducto='999999915'  order by 5 desc 


<SUSCRIPCIONWEB><ORDEN>1</ORDEN><FILIAL>PA</FILIAL><NUMSUSCRIP></NUMSUSCRIP>
<TIDCLI>RUC</TIDCLI><NIDCLI>23054-97-205329dv49</NIDCLI><SUCCLI></SUCCLI><NUMATE></NUMATE>
<ESTADOSUSC>1</ESTADOSUSC><VENCIMIENTO>30/07/2025</VENCIMIENTO><PRODUCTO>999999914</PRODUCTO>
<ALIASOBRA>sijprecapana</ALIASOBRA><CANTIDAD>1</CANTIDAD><EMAIL>sijusalex@sijusa.com</EMAIL>
<CONSECUTIVO></CONSECUTIVO><CLAVE>celsogael</CLAVE><USUARIO>sijusalex@sijusa.com</USUARIO>
<CODSUSCRIPCIONSCALA>2489063</CODSUSCRIPCIONSCALA><CODPRODUCTOSCALA>10637</CODPRODUCTOSCALA>
<USUARIOANTERIOR></USUARIOANTERIOR><CODATENCIONSCALA>659025</CODATENCIONSCALA>
<CODUSUARIOSCALA>376037</CODUSUARIOSCALA>
<ORIGENATENCION>ACTIVACION ENTRE FILIALES</ORIGENATENCION><FECHAHORA>19/07/2024</FECHAHORA><TIPOTRAMA>INS</TIPOTRAMA></SUSCRIPCIONWEB>
**/

 --

SELECT DISTINCT u.usuario, u.Id_Usuario, s.*, UOO.Cupo
  FROM 
  [scala].[dbo].Suscripcion s 
inner JOIN [scala].[dbo].Atencion a on a.Id_Atencion=s.CodAtencion
inner JOIN [scala].[dbo].Usuario u on a.CodUsuario=u.Id_Usuario
inner JOIN [scala].[dbo].Producto p on p.Id_Producto=s.CodProducto
left JOIN   [dbisapi].[dbo].[UserObra]  UOO ON UOO.DAFUser=U.USUARIO COLLATE Modern_Spanish_CI_AS
where vence >=getdate() and s.FechaFin >=getdate() and p.Sil_CodProducto ='999999915' and filial = 'PA'  AND UOO.OBRA = 'sijbienesra' 
--AND DAFUSER = 'becerraospina@gmail.com'
order by u.Id_Usuario desc




 DECLARE @ObraAlias as varchar(255)
 SET @ObraAlias = 'sijbienesra'

 DECLARE @usuario as varchar(255)
 SET @usuario = 'jhernandez@pramadexcorp.com'

 DECLARE @FILIAL as varchar(255)
 SET @FILIAL ='PA'

-- 1. Obtener datos productos. 

DECLARE @CodObraSilenio as varchar(255)
DECLARE @CODPRODUCTO_SCALA as varchar(255)

SELECT @CodObraSilenio=P.Sil_CodProducto, @CODPRODUCTO_SCALA=P.Id_Producto  FROM [scala].[dbo].PRODUCTO P 
INNER JOIN  [scala].[dbo].ProductoObraOnLine POO ON P.ID_PRODUCTO = POO.CODPRODUCTO
INNER JOIN [scala].[dbo].obraonline OO ON OO.Id_ObraOnLine = poo.codobraonline
WHERE p.CodFilial=99 and OO.activa = 1 and poo.activo = 1 and oo.alias = @ObraAlias; 

SELECT @CodObraSilenio as paso_1_codobrasilenio
SELECT @CODPRODUCTO_SCALA as paso_2_codproducto_scala

-- 3. Datos de la suscripcion 
DECLARE @CodSuscripcionScala as varchar(255)
DECLARE @Vence as varchar(255)
DECLARE @Cantidad as varchar(255)
DECLARE @Tipo as varchar(255)
DECLARE @CodEstadoSuscripcion as varchar(255)


 SELECT @CodSuscripcionScala = s.Id_Suscripcion, 
 @vence = s.FechaFin, 
 @Cantidad = s.Cantidad, 
 @CodEstadoSuscripcion = S.CodEstadoSuscripcion
FROM [scala].[dbo].Suscripcion s 
inner JOIN [scala].[dbo].Atencion a on a.Id_Atencion=s.CodAtencion
inner JOIN [scala].[dbo].Usuario u on a.CodUsuario=u.Id_Usuario
inner JOIN [scala].[dbo].Producto p on p.Id_Producto=s.CodProducto
LEFT JOIN [scala].[dbo].Sucursal suc on suc.Id_Sucursal=a.CodSucursal
LEFT join [scala].[dbo].Cliente c on c.Id_Cliente=suc.CodCliente
WHERE u.usuario = @usuario and fechafin >= getdate() and p.Id_Producto = @CODPRODUCTO_SCALA

 SET @Tipo = 'B'
 IF @Cantidad = '-1'
 BEGIN
  SET @Tipo = 'A'
 END

SELECT @CodSuscripcionScala,  @vence,
 @Cantidad , @CodEstadoSuscripcion, @Tipo



 -- verificamos el ' producto 



-- 2. Consulta de suscripciones y atencion por usuario. 
/*SELECT distinct  
'|| USUARIO ||' AS USUARIO,U.* ,
'|| ATENCION ||' AS USUARIO, a.*,
'|| CLIENTE ||' AS CLIENTE, c.*,
'|| SUSCRIPCION ||' AS SUSCRIPCION, s.*,
'|| PRODUCTO ||' AS PRODUCTO,   p.* 
FROM [scala].[dbo].Suscripcion s 
inner JOIN [scala].[dbo].Atencion a on a.Id_Atencion=s.CodAtencion
inner JOIN [scala].[dbo].Usuario u on a.CodUsuario=u.Id_Usuario
inner JOIN [scala].[dbo].Producto p on p.Id_Producto=s.CodProducto
LEFT JOIN [scala].[dbo].Sucursal suc on suc.Id_Sucursal=a.CodSucursal
LEFT join [scala].[dbo].Cliente c on c.Id_Cliente=suc.CodCliente
WHERE p.sil_codproducto in (
@sil_codproducto
) and fechafin >= getdate()

-- 2. Consulta de suscripciones y atencion por usuario. 

 SELECT top 1  s.*, u.*, P.*
FROM [scala].[dbo].Suscripcion s 
inner JOIN [scala].[dbo].Atencion a on a.Id_Atencion=s.CodAtencion
inner JOIN [scala].[dbo].Usuario u on a.CodUsuario=u.Id_Usuario
INNER JOIN [scala].[dbo].PRODUCTO P on s.CodProducto = P.Id_Producto
INNER JOIN  [scala].[dbo].ProductoObraOnLine POO ON P.ID_PRODUCTO = POO.CODPRODUCTO
INNER JOIN [scala].[dbo].obraonline OO ON OO.Id_ObraOnLine = poo.codobraonline
WHERE p.CodFilial=99 and OO.activa = 1 and poo.activo = 1 and   --oo.alias = @ObraAlias
 s.fechafin >= getdate()
*/


exec [dbo].[InsertaActualizaUserObra] 

 @Suscripcion = null,
 @DAFUser  = @usuario,
 @Obra  = @ObraAlias,
 @Tipo =  @Tipo,
 @Vence  = @vence, -- suscripcion scala 
 @Cantidad  =@Cantidad,
 @CodObra = @CodObraSilenio,
 @CodSuscripcionScala = @CodSuscripcionScala,-- suscripcion scala 
 @CODPRODUCTOSCALA = @CODPRODUCTO_SCALA,
 @FILIAL  = @FILIAL,
 @SUCCLI  = null,
 @NUMATE   = null,
 @ESTADOSUSC  = @CodEstadoSuscripcion, --SI
 @CONSECUTIVO  = null,
 @CodPerfilUsuario  = 196871, -- [dbisapi].perfilusuario
 @FechaBorrado = null ,
 @Borrado = 0
 

