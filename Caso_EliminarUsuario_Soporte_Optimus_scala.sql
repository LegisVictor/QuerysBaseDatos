-- ********************************************************************************************
-- SCALA 
-- ********************************************************************************************

-- Consulta de suscripciones y atencion por usuario. 
SELECT distinct  
s.Id_Suscripcion,
'|| USUARIO ||' AS USUARIO,U.id_usuario, u.usuario,
'|| SUSCRIPCION ||' AS SUSCRIPCION, s.*, p.*
FROM Suscripcion s 
inner JOIN Atencion a on a.Id_Atencion=s.CodAtencion
inner JOIN Usuario u on a.CodUsuario=u.Id_Usuario
inner JOIN Producto p on p.Id_Producto=s.CodProducto
LEFT JOIN Sucursal suc on suc.Id_Sucursal=a.CodSucursal
LEFT join Cliente c on c.Id_Cliente=suc.CodCliente
WHERE 
u.usuario in ('123456@hotmail.com')
and s.FechaFin >= getdate() 
and s.Sil_CodSuscripcion is null ; 

-- ACTUALIZAMOS LAS SUSCRIPCIONES 
-- UPDATE Suscripcion SET fechafin = getdate()-1 WHERE id_suscripcion IN (1515869); 

-- ********************************************************************************************
-- OPTIMUS 
-- ********************************************************************************************

-- Para buscar usuario por nombre. 

SELECT "SPCUSER"."USUARIO".*,ROWID "NAVICAT_ROWID" FROM "SPCUSER"."USUARIO" WHERE LOWER("NOMUSUARIO") LIKE '%she%' OFFSET 0 ROWS FETCH NEXT 200 ROWS ONLY



-- UPDATE TAREA SET CODUSUARIO = 9585 WHERE ID_TAREA IN (4088111); -- VACACIONES , O SE FUE DE LEGIS.

-- UPDATE PROYECTO SET CODUSUARIO = 9585, CODRESPONSABLE = 9585 WHERE ID_PROYECTO IN (3338575); -- VACACIONES , O SE FUE DE LEGIS.