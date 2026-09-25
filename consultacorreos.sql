SELECT * FROM Cliente WHERE NID  in  ( '46899149')

Lesdy Susana Zabala Ruiz

CC 1090417192

Plan Digital Ámbito Total / Suc 1 – Atn 1

Correo nuevo: LesdySusanaZabalaRuiz@gmail.com

Correo anterior: Susanazabalaruiz@Gmail.Com

3107774256
			  
select * from atencion where nid in  ('46899149', '52564')


select *  from cliente c inner join atencion a 
on c.Nid = a.nid and c.CodTipoIdentificacion = a.CodTipoIdentificacion
where c.NID  in  ( '46899149') and c.CodTipoIdentificacion = '40'



SELECT * FROM Sucursal  WHERE CodCliente IN (643862)



exec [dbo].[Sil_ObtieneAtencion] 
	@SIL_CodFilialCliente=6,
	@SIL_CodTIDCliente = 'CC',
	@NidCliente='9300298', 
	@Sil_CodSucursal =1,
	@Sil_CodAtencion =1
	
	
	
			SELECT 1
			FROM Cliente C 
				LEFT JOIN TipoIdentificacion TIC ON C.CodTipoIdentificacion = TIC.Id_TipoIdentificacion
				LEFT JOIN Sucursal S ON C.Id_Cliente = S.CodCliente
				LEFT JOIN Ciudad CIU ON Ciu.Id_Ciudad = S.CodCiudad
				LEFT JOIN Departamento D ON CIU.CodDepartamento = D.Id_Departamento
				LEFT JOIN Pais P ON D.CodPais = P.Id_Pais
			WHERE P.CodFilial = 6 and P.SIL_CodPais='91'
			  AND C.Nid = @NidCliente AND TIC.SIL_CodTID = @SIL_CodTIDCliente
			  
----**************************************************************
----*
----**************************************************************
select * from Ciudad CIU
INNER JOIN Departamento D ON CIU.CodDepartamento = D.Id_Departamento
INNER JOIN Pais P ON D.CodPais = P.Id_Pais
where p.SIL_CodPais in ('91')
and Ciu.SIL_CodCiudad in  ('3')
and d.SIL_CodDepartamento in  ('15')



	SELECT  ciu.*		FROM 		Cliente c
		INNER JOIN Sucursal su ON su.CodCliente = c.Id_Cliente 
		INNER JOIN Atencion a ON a.CodSucursal = su.Id_Sucursal
		INNER JOIN ciudad ciu ON su.CodCiudad = ciu.Id_Ciudad
		INNER JOIN Departamento d ON ciu.CodDepartamento = d.Id_Departamento
		INNER JOIN Pais p ON d.CodPais = p.Id_Pais
		WHERE  a.nid='40864092'



		-- obtiene atencion 
			SELECT ciu.id_ciudad, *
			FROM Cliente C 
				left JOIN Sucursal S ON C.Id_Cliente = S.CodCliente
				left JOIN Ciudad CIU ON Ciu.Id_Ciudad = S.CodCiudad
				left JOIN Departamento D ON CIU.CodDepartamento = D.Id_Departamento
				left JOIN Pais P ON D.CodPais = P.Id_Pais
			WHERE C.Nid = '40864092' and p.codfilial = 6

			  
			SELECT ciu.id_ciudad, *
			FROM Cliente C 
				inner JOIN Sucursal S ON C.Id_Cliente = S.CodCliente
				inner JOIN Ciudad CIU ON Ciu.Id_Ciudad = S.CodCiudad
				inner JOIN Departamento D ON CIU.CodDepartamento = D.Id_Departamento
				inner JOIN Pais P ON D.CodPais = P.Id_Pais
			WHERE C.Nid = '46899149' and p.codfilial = 6
			 
			 
SELECT 	A.Id_Atencion,	A.NomAtencion,	A.PrimerApellido, 	A.SegundoApellido,	A.Nid,	A.Sil_CodAtencion, A.Correo,	A.TipoUsuario,
				A.SobreFlex,	A.UsuarioWeb,	A.Clave,	A.CodSucursal,		A.CodUsuario,A.EstadoAtencion,	A.TipoAtencion,	TIA.Id_TipoIdentificacion,	
				TIA.NomTipoIdentificacion,	TIA.Sil_CodTID, TIA.CodFilial AS TIACodFilial, CA.Id_Ciudad, CA.NomCiudad,	CA.Sil_CodCiudad,	CA.CodDepartamento,	OA.Id_OrigenAtencion,	OA.NomOrigenAtencion
			FROM Cliente C 
				LEFT JOIN Sucursal S ON C.Id_Cliente = S.CodCliente
				LEFT JOIN Atencion A ON S.Id_Sucursal = A.CodSucursal
				LEFT JOIN TipoIdentificacion TIC ON C.CodTipoIdentificacion = TIC.Id_TipoIdentificacion
				LEFT JOIN TipoIdentificacion TIA ON A.CodTipoIdentificacion = TIA.Id_TipoIdentificacion
				LEFT JOIN Ciudad CA ON A.CodCiudad = CA.Id_Ciudad
				LEFT JOIN OrigenAtencion OA ON A.CodOrigenAtencion = OA.Id_OrigenAtencion
			WHERE --CA.Id_Ciudad = 25589 			AND
			TIC.SIL_CodTID = 'P1'
			AND C.Nid = '46899149' --18167590
			AND S.Sil_CodSucursal = 1
			AND A.Sil_CodAtencion = '1'
			AND A.UsuarioWeb <> ''
			AND A.UsuarioWeb IS NOT NULL;














SELECT DISTINCT 
						CAST(usu.Id_Usuario AS VARCHAR(50)) AS Id_Usuario,
						usu.Usuario, 
						usu.NomUsuario, 
						c.NomCliente, 
						c.Nid             
					FROM Usuario usu
					INNER JOIN Atencion aten ON aten.CodUsuario = usu.Id_Usuario
					INNER JOIN Suscripcion susc ON susc.CodAtencion = aten.Id_Atencion
					INNER JOIN Producto prod ON susc.CodProducto = prod.Id_Producto
	                inner join productoObraOnline poo on poo.codProducto = prod.Id_Producto AND poo.Activo = 1
				    inner join ObraOnline oo on oo.id_ObraOnline = poo.codObraonline   AND oo.Activa = 1 
					inner join accesoProducto acsprod on acsprod.CodProducto = susc.CodProducto  
					inner join Acceso acs on acsprod.CodAcceso = acs.Id_Acceso  
					inner join AplicacionWeb apweb on apweb.Id_AplicacionWeb = acs.CodAplicacionWeb  					
					LEFT JOIN Sucursal s ON s.Id_Sucursal = aten.CodSucursal
					LEFT JOIN Cliente c ON c.Id_Cliente = s.CodCliente
					WHERE 
					    apweb.id_aplicacionweb in (12,201)
						AND susc.FechaFin > GETDATE() and prod.codfilial = 6
						AND usu.Usuario like '%usergroup%'





SELECT DISTINCT
					CAST(u.Id_Usuario AS VARCHAR(50)) AS Id_Usuario,
					REPLACE(FM.USER_ID, 'f:bd03591f-be73-4be4-b7ed-a7c264d01cd9:', '') AS Usuario,
					u.NomUsuario,
					T.NomCliente,
					T.Nid
				FROM ##Temporal T
				INNER JOIN [10.250.4.29].[keycloak].[dbo].[KEYCLOAK_GROUP] KG
					ON KG.NAME COLLATE Modern_Spanish_CI_AS = T.Usuario COLLATE Modern_Spanish_CI_AS
				INNER JOIN [10.250.4.29].[keycloak].[dbo].[FED_USER_GROUP_MEMBERSHIP] FM
					ON FM.GROUP_ID = KG.ID
				INNER JOIN Usuario u
					ON REPLACE(FM.USER_ID COLLATE Modern_Spanish_CI_AS,'f:bd03591f-be73-4be4-b7ed-a7c264d01cd9:', '')
					   = u.Usuario COLLATE Modern_Spanish_CI_AS
				WHERE T.Usuario LIKE 'usergroup%@%'
				AND u.Id_Usuario IS NOT NULL
				AND NOT EXISTS (
					SELECT 1 
					FROM ##Temporal X
					WHERE X.Usuario COLLATE Modern_Spanish_CI_AS =
						  REPLACE(FM.USER_ID COLLATE Modern_Spanish_CI_AS, 'f:bd03591f-be73-4be4-b7ed-a7c264d01cd9:', '')
				);
						  


SELECT 
    Id_TareaEnvioCorreo,
    91 AS CodFilial, -- Cambiamos la filial
    NomTareaEnvioCorreo,
    CodProveedor,
    Mensaje,
    Remitente,
    NomRemite,
    Subject,
    ContentType,
    SP_Consulta,
    DependeTramas,
    CodTareaSeac,
    GETDATE() AS UltimaFechaEnvio, -- o puedes usar el mismo valor si prefieres
    URLImagenes,
    Activo,
    PlantillaMail,
    MensajeRenovacion,
    SubjectRenovacion,
    MensajeBienvenidaDemo,
    SubjectBienvenidaDemo,
    MensajeFinalizacionDemo,
    SubjectFinalizacionDemo
FROM dbo.TareaEnvioCorreo t
WHERE t.CodFilial = 6
  AND ISNULL(t.PlantillaMail, '') <> ''
 AND NOT EXISTS (
        SELECT 1 
        FROM dbo.TareaEnvioCorreo x
        WHERE x.CodFilial = 91
          AND x.Id_TareaEnvioCorreo = t.Id_TareaEnvioCorreo
  ); 


			  
EXEC [dbo].[InsertaActualizaPais]
	@CodFilial	=91,
	@SIL_CodPais = '91',
	@NomPais = 'PERU'
	
	
EXEC [dbo].[InsertaActualizaDepartamento]
	@NomDepartamento = 'DEPTO PERU',
	@SIL_CodDepartamento = '91',
	@CodPais = 558
	
	
	2533
	
	


EXEC 	 [dbo].[InsertaActualizaCiudad]
	@NomCiudad ='LIMA PERU',
	@SIL_CodCiudad=1,
	@CodDepartamento =2533
	
	
	
	
	





abogadodetransporte@gmail.com


			SELECT @CantidadSesiones = count(ACSSesion.GUIDSesion) 
			FROM 
				dbo.ACSSesion 
				INNER JOIN dbo.ACSSesionAcceso  on ACSSesion.GUIDSesion = ACSSesionAcceso.GUIDSesion
				INNER JOIN dbo.[ACSSesionAplicacionWebTipoAcceso] ACSTK on (ACSTK.GUIDSesion = ACSSesion.GUIDSesion)
				INNER JOIN dbo.ACSSolicitud  on (ACSSolicitud.GUIDTicket = ACSTK.GUIDTicket)
				LEFT  JOIN dbo.DispositivoMovil on ACSSesionAcceso.CodDispositivoMovil = DispositivoMovil.ID_DispositivoMovil
			WHERE  
				ACSSesionAcceso.CodAtencion = @CodAtencion
				AND ACSSolicitud.CodAplicacionWeb = @CodAplicacionWeb
				-- Revisar las sesiones ya creadas para esa Atención o SubAtención.
				AND (CASE WHEN ACSSesionAcceso.CodUsuario IS NULL THEN @CodUsuario
						  ELSE  ACSSesionAcceso.CodUsuario END) = @CodUsuario
				--Validar que la sesion no este pendiente por ser eliminada
				and ACSSesion.GUIDSesion not in
				(
						select valor FROM ACOperaciones where valor = ACSSesion.GUIDSesion
						and operacion = 'cerrarSesion'
				)
				and (CASE WHEN DispositivoMovil.CodTipoDispositivo IS NULL THEN 0
				ELSE DispositivoMovil.CodTipoDispositivo END ) = @tipoDispositivo
			GROUP BY  ACSSolicitud.CodAplicacionWeb,DispositivoMovil.CodTipoDispositivo











exec [dbo].[ObtenerSuscripcionesByUserName]
       @username = 'compras.intenet@legis.com.co',
       @limit= 2000,
       @offset= 0,
       @tipoSuscripcionQuery =2,
       @fechaSince =null

exec [dbo].[ObtenerSuscripcionesByAplicacion]
       @clientessoid = 'ambitojuridico',
       @limit = 10000,
       @offset =0,
       @tipoSuscripcionQuery = 0, 
       @fechaSince = '2025-04-03 00:00:00'
	   


	   





-- INSERTA LOS RELACIONADOS A AMBITO JURIDICO QUE ESTAN POR VENCER. QUE NO SON SUSCRIPCION 14


SELECT DISTINCT p.CodTareaEnvioCorreo, p.codfilial, a.id_atencion, s.id_suscripcion, 'PlantillaMail='+t.plantillamail+'|Renovacion=0|Demostracion=0|FinalizacionDemo=1' 
, s.FechaFin, t.Id_TareaEnvioCorreo, t.NomTareaEnvioCorreo, p.NomProducto, oo.Alias

FROM Suscripcion s INNER JOIN Atencion a on a.Id_Atencion=s.CodAtencion
INNER JOIN Usuario u on a.CodUsuario=u.Id_Usuario
INNER JOIN Producto p on p.Id_Producto=s.CodProducto
inner JOIN ProductoObraOnLine poo on poo.CodProducto = p.Id_Producto AND poo.Activo=1
inner JOIN ObraOnLine oo on oo.Id_ObraOnLine= poo.CodObraOnLine AND oo.Activa=1
inner join AccesoProducto ap on ap.CodProducto = p.Id_Producto
inner join Acceso acc on ap.Codacceso= acc.Id_Acceso
INNER JOIN TareaEnvioCorreo t on p.CodTareaEnvioCorreo = t.id_tareaenviocorreo
LEFT JOIN Sucursal suc on suc.Id_Sucursal=a.CodSucursal
LEFT JOIN Cliente c on c.Id_Cliente=suc.CodCliente
inner join ClienteSSOAplicacion ca on ca.Fk_IdAplicacion=acc.CodAplicacionWeb
WHERE s.CodEstadoSuscripcion <> 14 AND ca.ClienteId =  'AmbitoJuridico' 
AND oo.alias in ('AJActualidad','AJCivilf','AJComercial','AJDerechoP','AJLaboral','AJPenal','AJTIC','AJTributario','EXPRENTA','LEGCOL','LMOVNOTICIAS')
AND s.FechaFin > '2025-02-01 08:00:00'
AND isnull(t.SubjectFinalizacionDemo,'') <> '' AND p.codfilial = 6				
AND u.Usuario not like 'temporal%@legis.com.co' AND u.Usuario not like 'usergroup%@urllegis.com'	






select top 100 * from atencion 


SELECT distinct CAST(usu.Id_Usuario AS VARCHAR(50)) as Id_Usuario, usu.Usuario, usu.NomUsuario, c.NomCliente, c.Nid, ROW_NUMBER() OVER (ORDER BY usu.Usuario asc) AS RowNum		     
      
                    FROM Usuario usu
                    inner join Atencion aten on aten.CodUsuario = usu.Id_Usuario
                    inner join Suscripcion susc on susc.CodAtencion = aten.Id_Atencion
                    inner join Producto prod on susc.CodProducto = prod.Id_Producto
					inner JOIN ProductoObraOnLine poo on poo.CodProducto = prod.Id_Producto and poo.Activo=1
					inner JOIN ObraOnLine oo on oo.Id_ObraOnLine= poo.CodObraOnLine and oo.Activa=1
					inner join AccesoProducto ap on ap.CodProducto = prod.Id_Producto
                    inner join Acceso a on ap.Codacceso= a.Id_Acceso
					LEFT JOIN Sucursal s on s.Id_Sucursal = aten.CodSucursal
					LEFT JOIN Cliente c on c.Id_Cliente = s.CodCliente
					inner join ClienteSSOAplicacion ca on ca.Fk_IdAplicacion=a.CodAplicacionWeb
                    where oo.Alias = 'AMJ' 
					     and   ca.ClienteId ='AmbitoJuridico'
	and susc.FechaFin > getdate() 
					and usu.Usuario not like ''temporal%@legis.com.co'' and usu.Usuario not like ''usergroup%@urllegis.com'' '	
















	
	
	
	'
	
	
	








--**************************************************************
--*** CONSULTAS A TABLAS BASICAS 
--**************************************************************
-- consultar usuario 
select top 10 * from usuario where usuario like '%saracubillosg13@gmail%'--- usuario like '%victor.garcia%'

-- consultar atencion  
select top 10 * from atencion where-- id_atencion = 789234 --CodSucursal = 362227--CodUsuario =481994 ----Sil_CodAtencion ='2362457'
correo like '%carlosandres%china%' and 
nid='9003327497'; 

-- consultar suscripcion 
select * from Suscripcion where CodAtencion IN (789234) order by Sil_CodSuscripcion desc

-- consultar producto 
select * from producto where Sil_CodProducto between 5160 and 5169

-- consultar cliente 
SELECT *  FROM [Cliente] WHERE NID = '311653031'

-- consultar sucursal 
SELECT TOP 10 * FROM Sucursal WHERE CodCliente =376047 -- id_sucursal = 445989

-- consultar rango ip 
SELECT distinct CodAtencion FROM RangoIP where CodAtencion = 472630

-- Consulta de suscripciones y atencion por usuario. 
SELECT distinct  
'|| USUARIO ||' AS USUARIO,U.id_usuario, u.usuario,
'|| ATENCION ||' AS ATENCION,a.Sil_CodAtencion,  a.ID_ATENCION, a.NID, a.NomAtencion, a.correo, a.usuarioweb, a.CodSucursal,
'|| CLIENTE ||' AS CLIENTE, c.*,
'|| SUSCRIPCION ||' AS SUSCRIPCION, s.*,
'|| PRODUCTO ||' AS PRODUCTO,   p.id_producto, p.NomProducto, p.Sil_CodProducto, p.codfilial, p.CodTareaEnvioCorreo
FROM Suscripcion s 
inner JOIN Atencion a on a.Id_Atencion=s.CodAtencion
inner JOIN Usuario u on a.CodUsuario=u.Id_Usuario
inner JOIN Producto p on p.Id_Producto=s.CodProducto
LEFT JOIN Sucursal suc on suc.Id_Sucursal=a.CodSucursal
LEFT join Cliente c on c.Id_Cliente=suc.CodCliente
WHERE 
a.nid in ('1143439225')
--and c.CodFilial = 6 
and s.FechaFin >= getdate()

 
-- Consulta de cliente 
SELECT	TOP 1 
' ---- USUARIO ----- ', u.*,
' ---- cliente ----- ', c.* ,
' ---- ATENCION ----- ', A.*
FROM	Cliente C 
LEFT JOIN Sucursal S ON C.Id_Cliente = S.CodCliente
LEFT JOIN Atencion A ON S.Id_Sucursal = A.CodSucursal
LEFT JOIN Usuario U ON A.CodUsuario = U.Id_Usuario
WHERE	
--A.Id_Atencion = 8600075382
a.nid in ( '8907043821')
AND S.CodCliente IS NOT NULL
AND A.CodSucursal IS NOT NULL

-- Update para actualizar fecha fin de la suscripcion 
/*update Suscripcion set fechafin = '2023-08-31 23:55:59.000'
FROM Suscripcion s inner JOIN Atencion a on a.Id_Atencion=s.CodAtencion
inner JOIN Usuario u on a.CodUsuario=u.Id_Usuario
inner JOIN Producto p on p.Id_Producto=s.CodProducto
WHERE a.CORREO LIKE '%tempo%@legis.com.co%'
and s.FechaFin = '2023-06-30 23:55:59.000'; */

-- consultar url de una suscripcion 
SELECT top 10  lu.*
FROM Suscripcion s inner JOIN Atencion a on a.Id_Atencion=s.CodAtencion
inner JOIN Usuario u on a.CodUsuario=u.Id_Usuario
left join listaurl lu on lu.CodAtencion =a.Id_Atencion
LEFT JOIN Sucursal suc on suc.Id_Sucursal=a.CodSucursal
LEFT join Cliente c on c.Id_Cliente=suc.CodCliente
WHERE lu.URL <> ''









--**************************************************************
--*** ListaURL
--**************************************************************

	select distinct 1 as UlRvalida, Atencion.Id_Atencion
	from  ListaURL
	  inner join Atencion on (Atencion.Id_Atencion = ListaURL.CodAtencion)
	  INNER join Suscripcion on (Suscripcion.CodAtencion = Atencion.Id_Atencion and (CONVERT(DATETIME,CONVERT(char,Suscripcion.FechaFin,111),111)) >= (CONVERT(DATETIME,CONVERT(char,getdate(),111),111)))
	  INNER JOIN AccesoProducto  ON (Suscripcion.CodProducto = AccesoProducto.CodProducto )
	  INNER JOIN Acceso ON  (Acceso.Id_acceso = AccesoProducto.CodAcceso AND CodAplicacionWeb = 1)
	WHERE 
	  URL =  'https://legal.legis.com.pe/interm/Intemedia_UAC.htm'
	  GROUP BY Atencion.Id_Atencion


--**************************************************************
--*** CONSULTA DE CIUDADES
--**************************************************************
	
select * from ciudad c inner join Departamento d on c.CodDepartamento = d.Id_Departamento 
inner join Pais p on d.CodPais = p.Id_Pais 
where p.CodFilial = 86 AND  SIL_CodCiudad = 1 AND D.SIL_CodDepartamento =86


/*
EXEC[dbo].[InsertaActualizaDepartamento]
	@NomDepartamento = 'DEPTO VENEZUELA',
	@SIL_CodDepartamento = 86,
	@CodPais =408


EXEC [dbo].[InsertaActualizaCiudad]
	@NomCiudad = 'LOS TEQUES VENEZUELA',
	@SIL_CodCiudad = 74,
	@CodDepartamento = 2532

EXEC [dbo].[InsertaActualizaCiudad]
	@NomCiudad = 'CARACAS VENEZUELA',
	@SIL_CodCiudad = 1,
	@CodDepartamento = 2531
	

exec [dbo].[Sil_InsertaActualizaSucursal]
	@CodCliente	AS INT,
	@SIL_CodSucursal AS INT,
	@NomSucursal AS VARCHAR(10),
	@Direccion AS VARCHAR(200),
	@CodCiudad AS INT	
	*/



---****************************************************************************
--- USUARIOS SUSCRIPCIONES CON ALIAS
---****************************************************************************
SELECT distinct 
' ---- USUARIO ----- ', usu.Usuario,
' ---- ATENCION ----- ', aten.Id_Atencion, aten.NomAtencion, aten.PrimerApellido, aten.nid, aten.Sil_CodAtencion,
'---- SUSCRIPCIONES ----- ', SUSC.Sil_CodSuscripcion, susc.Cantidad, susc.FechaInicio, susc.FechaFin,
' ---- PRODUCTO ----- ', p.NomProducto,
' ---- ALIAS ----- ', oo.ALIAS

		   from usuario usu  
           inner join atencion aten on usu.Id_Usuario = aten.codUsuario  
           inner join suscripcion susc on susc.codatencion = aten.id_atencion  
		   inner join producto p on susc.codproducto = p.Id_Producto

           inner join productoObraOnline poo on poo.codProducto = p.Id_Producto
           inner join ObraOnline oo on oo.id_ObraOnline = poo.codObraonline  
           where   
           susc.FechaFin > GETDATE()  
            and  oo.Activa = 1   
         and  Poo.Activo = 1   
           and oo.CodFilial  in (6)   
		   and oo.Alias IN ('SilvIA_PREMIUMBONO', 'SilvIA_PREMIUM')
		   and aten.CORREO = 'Eduarr951@gmail.com'


SELECT distinct 
' ---- USUARIO ----- ', usu.Usuario,
' ---- ATENCION ----- ', aten.Id_Atencion, aten.NomAtencion, aten.PrimerApellido, aten.nid, aten.Sil_CodAtencion,
'---- SUSCRIPCIONES ----- ', SUSC.Sil_CodSuscripcion, susc.Cantidad, susc.FechaInicio, susc.FechaFin,
' ---- PRODUCTO ----- ', p.NomProducto,
' ---- ALIAS ----- ', oo.ALIAS

		   from usuario usu  
           inner join atencion aten on usu.Id_Usuario = aten.codUsuario  
           inner join suscripcion susc on susc.codatencion = aten.id_atencion  
		   inner join producto p on susc.codproducto = p.Id_Producto
           inner join productoObraOnline poo on poo.codProducto = p.Id_Producto
           inner join ObraOnline oo on oo.id_ObraOnline = poo.codObraonline  
           inner join accesoProducto acsprod on acsprod.CodProducto = susc.CodProducto  
         inner join Acceso acs on acsprod.CodAcceso = acs.Id_Acceso  
         inner join AplicacionWeb apweb on apweb.Id_AplicacionWeb = acs.CodAplicacionWeb  
         inner JOIN ObraOnLineAplicacionWeb ooapweb on ooapweb.Alias=oo.Alias and ooapweb.CodAplicacionWeb=1  
           where   
           susc.FechaFin > GETDATE()  
            and  oo.Activa = 1   
         and  Poo.Activo = 1   
           and oo.CodFilial  in (6)   
		   and oo.Alias IN ('SilvIA_PREMIUMBONO', 'SilvIA_PREMIUM')

select distinct Usuario, Id_Atencion CodAtencion, Id_Sucursal CodSucursal, replace(NomSucursal,'"','') Sucursal,
CodCliente, replace(NomCliente,'"','') Cliente, NomTipoIdentificacion TID, c.NID, oo.alias 
from 
Usuario u with (nolock)
inner join Atencion a with (nolock) on u.Id_Usuario = a.CodUsuario
inner join suscripcion susc on susc.codatencion = a.id_atencion  
inner join producto p on susc.codproducto = p.Id_Producto
inner join productoObraOnline poo on poo.codProducto = p.Id_Producto
inner join ObraOnline oo on oo.id_ObraOnline = poo.codObraonline  
inner join Sucursal s with (nolock) on a.CodSucursal = s.Id_Sucursal
inner join Cliente c with (nolock) on s.CodCliente = c.Id_Cliente
left join TipoIdentificacion with (nolock) on c.CodTipoIdentificacion = Id_TipoIdentificacion
where oo.Alias IN ('SilvIA_PREMIUMBONO', 'SilvIA_PREMIUM') and susc.FechaFin > GETDATE()  

--**************************************************************************
--*** CONSULTA DE USUARIOS PARA EL TEMA DE USUARIOS REMOTO POR GRUPOS 
--**************************************************************************
SELECT [Id_Usuario]
      ,[NomUsuario]
      ,LOWER([Usuario]) AS Usuario
      ,dbo.fn_Decrypt([Clave]) Clave
      ,[boolNotificacion]
      ,[CambioClavePrimerLogin]
  FROM [dbo].[Usuario] with (NOLOCK)
	WHERE Usuario in (SELECT Usuario FROM usuario where usuario in (
'Luis.Londono@colsubsidio.com'))
ORDER BY Usuario

--************************************************************************************
--*** CONSULTAR CLAVE USUARIO
--************************************************************************************
SELECT *, DBO.fn_Decrypt(CLAVE) FROM USUARIO 
WHERE usuario in ('jcmv777999@gmail.com')


--**************************************************************************
--*** CONSULTA PARA OPTENER LA FILIAL DE UNA ATENCION  
--**************************************************************************
DECLARE @Id_Atencion INT 
SET @Id_Atencion = 341179
SELECT * FROM FILIAL WHERE Id_Filial = (SELECT	dbo.fnObtieneFilialAtencion(@Id_Atencion)); 

--**************************************************************
--*** CONSULTA PRINCIPAL PROCESO DE REGISTRO AGENTE DE CORREOS. 
--**************************************************************
with tmp1 (Id_ColaConsultaCorreo, CodTareaEnvioCorreo,CodFilial,CodAtencion,CodSuscripcion,ParametrosAdicionales)
as(SELECT	Id_ColaConsultaCorreo,
CodTareaEnvioCorreo,CodFilial,CodAtencion,CodSuscripcion,ParametrosAdicionales 
FROM	ColaConsultaCorreo)
SELECT	Ccc.Id_ColaConsultaCorreo,Ccc.CodTareaEnvioCorreo,Ccc.CodFilial,Ccc.CodAtencion, Ccc.CodSuscripcion,Ccc.ParametrosAdicionales 
FROM	ColaConsultaCorreo Ccc where Ccc.CodAtencion  not in ( select codatencion from tmp1) and ParametrosAdicionales NOT LIKE 'UsuarioSubatencion%'
union all
SELECT	Id_ColaConsultaCorreo,CodTareaEnvioCorreo,CodFilial,CodAtencion, CodSuscripcion,ParametrosAdicionales
FROM	tmp1

--**************************************************************
--*** CONSULTAS COLA DE CORREOS 
--**************************************************************
-- Consulta tarea envio 
select * from TareaEnvioCorreo where NomTareaEnvioCorreo like  '%CPlan%' AND CodFilial = 6

-- Consulta para cola consulta correo 
SELECT top 100 * FROM [dbo].[ColaConsultaCorreo] ORDER BY 1 DESC 
SELECT top 100 * FROM [dbo].[ColaCorreos] ORDER BY 1 DESC 

SELECT top 10 *  FROM [dbo].[LogColaConsultaCorreo]  where codsuscripcion in (2437868,2437885,2437871,2437876) and 
--CodAtencion in (785704) and 
--ParametrosAdicionales  like 'UsuarioSubatencion%'  and 
fechaproceso >= '2022-05-03 00:00:00.000' 
order by FechaProceso desc 

					  
SELECT top 10  * FROM [dbo].[LogColaCorreos]
where FechaModificacion >= '2022-10-03 00:21:25.600' 
and email =  'jcmv777999@gmail.com' 
order by  FechaModificacion desc	

  -- CONSULTA DE COLA DE CORREOS PENDIENTES
SELECT TOP 100 cc.*, u.usuario as email,  a.correo, a.UsuarioWeb, s.CodProducto, s.CodEstadoSuscripcion,
p.CodTareaEnvioCorreo,  s.sil_codsuscripcion
FROM [dbo].[ColaConsultaCorreo] cc INNER JOIN [dbo].atencion a 
ON cc.CodAtencion = A.Id_Atencion LEFT JOIN  [dbo].suscripcion s
ON cc.CodSuscripcion = s.Id_Suscripcion LEFT JOIN [dbo].Producto p ON p.Id_Producto = s.CodProducto
LEFT JOIN [dbo].Usuario u on u.id_usuario = A.CodUsuario
 
SELECT TOP 100 cc.*,p.NomProducto, u.usuario as email,  a.correo, a.UsuarioWeb, s.CodProducto,
s.CodEstadoSuscripcion, p.CodTareaEnvioCorreo,  s.sil_codsuscripcion, a.Sil_CodAtencion
FROM [dbo].[LogColaConsultaCorreo] cc 
INNER JOIN [dbo].atencion a ON cc.CodAtencion = A.Id_Atencion      
LEFT JOIN  [dbo].suscripcion s ON cc.CodSuscripcion = s.Id_Suscripcion 
LEFT JOIN [dbo].Producto p ON p.Id_Producto = s.CodProducto
LEFT JOIN [dbo].Usuario u on u.id_usuario = A.CodUsuario
where 
---a.Id_Atencion = 789234 
--a.correo = 'tatianaosorio@gmail.com'
a.Nid = '9008963312'
--a.Sil_CodAtencion = '2362457'
ORDER BY CC.FechaProceso DESC 

-- validar 
select  count (*), CodTareaEnvioCorreo,CodFilial	,Email, convert(varchar(5000), QueryString) 
from LogColaCorreos 
where CodFilial = 6 and FechaModificacion between '2022-05-04 00:00:00' and '2022-05-05 00:00:00'  
group by CodTareaEnvioCorreo,CodFilial	,Email,convert(varchar(5000), QueryString) having count(*) > 1

-- correos pendientes 
exec  [dbo].[ObtieneColaCorreo]
	@CodTareaEnvioCorreo = 21,
	@CodFilial  = 6,
	@lstColaCorreo = '',
	@tipoCorreo  = 1

----**************************************************************
----*** CONSULTA PARA CONOCER EL ACCESO A UN PRODUCTO SEGUN UNA APLICACION 
----**************************************************************

select ' ||Producto|| ' as Producto, p.id_producto, p.nomproducto, p.sil_codproducto, p.codfilial, p.codtareaenviocorreo,
	   ' ||acceso|| ' as acceso, ac.id_acceso, ac.NomAcceso, 
       ' ||AplicacionWeb|| ' as AplicacionWeb, aw.Id_AplicacionWeb, aw.NomAplicacionWeb, aw.URL 
from  Producto p  
 inner join AccesoProducto ap on p.Id_Producto = ap. CodProducto
 inner join acceso ac on ap.CodAcceso = Id_Acceso
 inner join AplicacionWeb aw on Id_AplicacionWeb = CodAplicacionWeb
 where aw.NomAplicacionWeb like '%CONSTRUDATA%'--aw.Id_AplicacionWeb = 40 

-- EJEMPLO 
select * from aplicacionweb
select * from acceso where CodAplicacionWeb = 40
select * from AccesoProducto where CodAcceso = 504
select * from producto where id_producto in (8003,9919,9920)

--**************************************************************
--*** CONSULTA PARA COMUNIDAD CONTABLE
--**************************************************************		
/*select  s.Id_Suscriptor as CodSuscriptor, s.NomSuscriptor, s.Email, 
		ISNULL(emp.Id_empresa, 0) as idEmpresa, '' as NomEmpresa, '' as Nid,
		e.Titulo + isnull(' - ' + fa.FechaDescripcion,'') as Titulo, de.FechaInicial, 
		de.FechaFinal, de.Id_DetalleEventoCT as CodEvento,
			tf.CodTipo as TipoEvento, de.Aviso as HoraNotificacion
		--into #EventosPropiosSuscriptor
		from Suscriptor s
		inner join eventoct e on s.Id_Suscriptor = e.CodSuscriptor
		left join fechaautomatica fa on fa.Id_FechaAutomatica = e.CodFechaAutomatica
		inner join detalleeventoct de on e.id_eventoct = de.CodEventoCT
		inner join TipoFecha tf on e.CodTipoFechaObligacion = tf.Id_TipoFecha
		inner join TipoAviso ta on de.Aviso = ta.id_tipoAviso
		left join EmpresaCT emp on e.CodEmpresaCT = emp.Id_Empresa
		where de.FechaInicial between (@FechaInicial) and (@FechaFinal)
		and de.Activo = 1
		and de.NotificacionCorreoEnviada = 0
		and de.enviadocorreo = 0
		and tf.CodTipo in('P','C','T')
		and tf.Activo = 1
		and e.NotificacionCorreo = 1		
		order by de.fechafinal 		*/	
				
--************************************************************************************
--*** CONSULTA producto - acceso 
--************************************************************************************			
	SELECT	DISTINCT
				AP.CodProducto,
				AC.Id_Acceso
	FROM	AplicacionWeb AW LEFT JOIN Acceso AC
			ON AW.Id_AplicacionWeb = AC.CodAplicacionWeb
			LEFT JOIN AccesoProducto AP
			ON AC.Id_Acceso = AP.CodAcceso
			LEFT JOIN Producto P
			ON AP.CodProducto = P.Id_Producto
	WHERE	AW.Id_AplicacionWeb = 12
		--	AND AC.GUID = @Acceso_GUID
			AND AC.CodAplicacionWeb IS NOT NULL
			AND AP.CodAcceso IS NOT NULL
			AND P.Id_Producto IS NOT NULL
			AND P.Activo = 1

  

























SELECT DISTINCT   
					TOP 1   ISNULL(P.NomProducto,'') AS NomProducto, ' || Vence el: ' + LOWER(Convert(nvarchar(100), S.FechaFin,106)) AS fechavence,  
					  s.Id_Suscripcion,  FechaInicio,  FechaFin 
					FROM Atencion A   
					  Left JOIN Suscripcion S ON A.Id_Atencion = S.CodAtencion  
					  Left JOIN Producto P ON S.CodProducto = P.Id_Producto 
					  Left JOIN AccesoProducto AP ON P.Id_Producto = AP.CodProducto  
					  Left JOIN Acceso AC ON AP.CodAcceso = AC.Id_Acceso        
					--  Left JOIN ColaConsultaCorreo CCC ON S.Id_Suscripcion = CCC.CodSuscripcion  
					WHERE A.Id_Atencion = 789234        
					--  AND CCC.CodSuscripcion IS NOT NULL AND (  CCC.ParametrosAdicionales IS NULL OR CCC.ParametrosAdicionales NOT LIKE '%PlantillaMail%') --FILTRA LAS SUSCRIPCIONES CREADAS RECIENTEMENTE  
					  AND A.EstadoAtencion = 1  
					--  AND P.Activo = 1  
					  AND (S.FechaFin > GETDATE() OR 1 = 1)
					  AND S.CodAtencion IS NOT NULL  
					  AND P.Id_Producto IS NOT NULL  
					  AND AP.CodProducto IS NOT NULL  
					  AND AC.Id_Acceso IS NOT NULL  
				  --    AND CCC.ParametrosAdicionales Like '%Renovacion=1%'    




	SELECT     
	--TOP 1
	FOLA.Usuario AS EMAILDESTINO,  
                  CONVERT(VARCHAR(2),DAY(GETDATE())) + ' ' + DATENAME(MONTH,GETDATE()) + ' de ' + CONVERT(VARCHAR(4),YEAR(GETDATE())) AS FechaNotificacion,  
                  A.NomAtencion + ' ' + ISNULL(A.PrimerApellido,'') + ' ' + ISNULL(A.SegundoApellido,'') AS NombreCliente,  
                 FOLA.Usuario AS UsuarioAcceso,   FOLA.Clave AS ClaveAcceso, 
				  RIP.*
	
      FROM  Atencion A   
                 LEFT JOIN RangoIP RIP ON A.Id_Atencion = RIP.CodAtencion  
                  LEFT JOIN ListaURL LURL ON A.Id_Atencion = LURL.CodAtencion  
                 CROSS APPLY fnObtieneLoginAtencion(A.Id_Atencion) FOLA  
      WHERe  rip.LimSuperior like '%163.116.234%'

	  a.NomAtencion like '%camara de comercio del oriente%'

	  
	  Id_Atencion in ( 415719 )---415672,415719, 416021)  
                ---  AND @DescripcionFinal <> ''        --VALIDA QUE SE TENGA UNA DESCRIPCION DE PRODUCTOS  
                  AND EstadoAtencion = 1  
                 AND   (RIP.CodAtencion IS NULL or (  a.correo like '%@urllegis.com%' and RIP.CodAtencion IS NOT NULL))      --VALIDA QUE LA ATENCION NO POSEA IP RELACIONADAS  
                  AND LURL.CodAtencion IS NULL --VALIDA QUE LA ATENCION NO POSEA URL RELACIONADAS  
             


   	  SELECT  *
			  FROM (  

				SELECT    '<div class="divTableRow" style="text-align:center;     display: table-row;">
							 <div class="divTableCell" style="text-align:center; border: 2px solid #2B00F4; display: table-cell;    padding: 3px 10px; text-decoration: none;">
								<a style="text-decoration: none;" href="' + q1.UrlSitio+ '">	 ' + q1.Sitio+ '</a>
							 </div>
						   </div><br>
							' AS TablaSitios
				FROM(                   
					SELECT   DISTINCT 
					  ISNULL(AW.NomAplicacionWeb,'') AS Sitio,
					  ISNULL(AW.URL,'')   As UrlSitio, 
					  CSA.*, p.*, ap.*
					FROM Atencion A   
					  LEFT JOIN Suscripcion S ON A.Id_Atencion = S.CodAtencion  
					  LEFT JOIN Producto P ON S.CodProducto = P.Id_Producto 
					  LEFT JOIN AccesoProducto AP ON P.Id_Producto = AP.CodProducto  
					  LEFT JOIN Acceso AC ON AP.CodAcceso = AC.Id_Acceso        
					  LEFT JOIN AplicacionWeb AW ON AC.CodAplicacionWeb = AW.Id_AplicacionWeb
					  LEFT JOIN ClienteSSOAplicacion CSA ON CSA.Fk_IdAplicacion = AW.Id_AplicacionWeb
					  LEFT JOIN logColaConsultaCorreo CCC ON S.CodAtencion = CCC.CodAtencion  
					WHERE A.Id_Atencion = 415811         
					  AND ccc.CodFilial=06 and ccc.CodTareaEnvioCorreo=41 
					  AND A.EstadoAtencion = 1  AND P.Activo = 1  
					--  AND (S.FechaFin > GETDATE())
				      AND S.CodAtencion IS NOT NULL  AND P.Id_Producto IS NOT NULL  
					  AND AP.CodProducto IS NOT NULL AND AC.Id_Acceso IS NOT NULL    
					--  AND ISNULL(AW.URL,'') <> '' AND CSA.UrlRemotoActiva = 1
					  AND CCC.ParametrosAdicionales Like '%Renovacion=1%'
					)q1  
				)t1   

				select * from 	 ClienteSSOAplicacion CSA ON CSA.Fk_IdAplicacion = AW.Id_AplicacionWeb
								
								
								
								
								
								
								
								
								
								
								
								
								
								
								
								SELECT DISTINCT   
				  ISNULL(P.NomProducto,'') AS NomProducto, ' || Vence el: ' + LOWER(Convert(nvarchar(100), S.FechaFin,106)) AS fechavence,  
				  CONVERT(VARCHAR(10), FechaInicio, 23) AS FechaInicio, CONVERT(VARCHAR(10),  FechaFin, 23) AS FechaFin 
				FROM Atencion A   
				  Left JOIN Suscripcion S ON A.Id_Atencion = S.CodAtencion  
				  Left JOIN Producto P ON S.CodProducto = P.Id_Producto 
				  Left JOIN AccesoProducto AP ON P.Id_Producto = AP.CodProducto  
				  Left JOIN Acceso AC ON AP.CodAcceso = AC.Id_Acceso        
				  Left JOIN ColaConsultaCorreo CCC ON S.Id_Suscripcion = CCC.CodSuscripcion  
				WHERE A.Id_Atencion = @Id_Atencion        
				  AND CCC.CodSuscripcion IS NOT NULL AND (  CCC.ParametrosAdicionales IS NULL OR CCC.ParametrosAdicionales NOT LIKE '%PlantillaMail%') --FILTRA LAS SUSCRIPCIONES CREADAS RECIENTEMENTE  
                  AND A.EstadoAtencion = 1  
				  AND P.Activo = 1  
				  AND (S.FechaFin > GETDATE() OR @FinalizacionDemo = 1)
				  AND S.CodAtencion IS NOT NULL  
				  AND P.Id_Producto IS NOT NULL  
				  AND AP.CodProducto IS NOT NULL  
				  AND AC.Id_Acceso IS NOT NULL
				  AND CCC.ParametrosAdicionales NOT Like '%Renovacion=1%'    
				  AND CCC.ParametrosAdicionales NOT LIKE '%Renovacion=0|Demostracion=1%'   
				  AND CCC.ParametrosAdicionales NOT LIKE '%|FinalizacionDemo=1%'      