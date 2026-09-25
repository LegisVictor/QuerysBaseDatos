-- 10.250.6.50
usergroup_g890910961711000@urllegis.com


-- ROLES POR USUARIO 
SELECT kr.name , c.CLIENT_ID
FROM [Keycloak].[dbo].[FED_USER_ROLE_MAPPING] fm
inner join [Keycloak].[dbo].[KEYCLOAK_ROLE] kr on kr.ID = fm.ROLE_ID 
inner join [Keycloak].[dbo].[CLIENT] c on c.id = kr.client
WHERE fm.user_id like '%usergroup_g890910961711000@urllegis.com%'
ORDER BY c.CLIENT_ID, kr.name 

-- USUARIOS GRUPO REMOTE. 

SELECT REPLACE(FM.USER_ID, 'f:bd03591f-be73-4be4-b7ed-a7c264d01cd9:', '') as Username, KG.NAME as UserGroup
FROM
  [Keycloak].[dbo].[FED_USER_ATTRIBUTE] FA inner join 
  [Keycloak].[dbo].[FED_USER_GROUP_MEMBERSHIP] FM on FA.USER_ID = FM.USER_ID INNER JOIN 
[Keycloak].[dbo].[KEYCLOAK_GROUP] KG ON FM.GROUP_ID = KG.ID  
WHERE fa.name = 'remote' and ( KG.NAME = 'usergroup_g890910961711000@urllegis.com') 



-- Consulta con Pivot

SELECT Usuario, [LAST_NAME], [NombreCliente], [EMAIL], [registrationdate], [Nit], [FIRST_NAME], [mobile], [occupation], [nucleo], [remote]
FROM 
    (SELECT REPLACE(FA.USER_ID, 'f:bd03591f-be73-4be4-b7ed-a7c264d01cd9:', '') AS Usuario, FA.NAME AS Field_Name, CAST(FA.value AS NVARCHAR(MAX)) AS Field_Value
	 FROM 
		  [Keycloak].[dbo].[FED_USER_ATTRIBUTE] FA inner join 
		  [Keycloak].[dbo].[FED_USER_GROUP_MEMBERSHIP] FM on FA.USER_ID = FM.USER_ID INNER JOIN 
		  [Keycloak].[dbo].[KEYCLOAK_GROUP] KG ON FM.GROUP_ID = KG.ID  
     WHERE 
          KG.NAME = 'usergroup_g890910961711000@urllegis.com' 
         AND FA.NAME IN ('LAST_NAME', 'NombreCliente', 'EMAIL', 'registrationdate', 'Nit', 'FIRST_NAME', 'mobile', 'occupation', 'nucleo', 'remote')
    ) AS SourceTable
PIVOT 
    (MAX(Field_Value) FOR Field_Name IN ([LAST_NAME], [NombreCliente], [EMAIL], [registrationdate], [Nit], [FIRST_NAME], [mobile], [occupation], [nucleo], [remote])) AS PivotTable
ORDER BY
    Usuario;
 
 -- Consulta con Pivot

SELECT Usuario, [LAST_NAME], [NombreCliente], [EMAIL], [registrationdate], [Nit], [FIRST_NAME], [mobile], [occupation], [nucleo], [remote]
FROM 
    (SELECT REPLACE(FA.USER_ID, 'f:bd03591f-be73-4be4-b7ed-a7c264d01cd9:', '') AS Usuario, FA.NAME AS Field_Name, CAST(FA.value AS NVARCHAR(MAX)) AS Field_Value
	 FROM 
		  [Keycloak].[dbo].[FED_USER_ATTRIBUTE] FA 
     WHERE 
         FA.NAME IN ('LAST_NAME', 'NombreCliente', 'EMAIL', 'registrationdate', 'Nit', 'FIRST_NAME', 'mobile', 'occupation', 'nucleo', 'remote')
		 and value like '%ceipa%'
    ) AS SourceTable
PIVOT 
    (MAX(Field_Value) FOR Field_Name IN ([LAST_NAME], [NombreCliente], [EMAIL], [registrationdate], [Nit], [FIRST_NAME], [mobile], [occupation], [nucleo], [remote])) AS PivotTable
ORDER BY
    Usuario;
 

 -- Consulta con Pivot grupos 

 SELECT Grupo, IpAddress, NombreGrupo
FROM 
    (SELECT KG.NAME AS GRUPO, FA.NAME AS Field_Name, CAST(FA.value AS NVARCHAR(MAX)) 
	AS Field_Value
	 FROM 
		  [Keycloak].[dbo].[GROUP_ATTRIBUTE] FA 
		  INNER JOIN [Keycloak].[dbo].[KEYCLOAK_GROUP] KG ON FA.GROUP_ID = KG.ID
     WHERE 
         FA.NAME IN ('IpAddress', 'NombreGrupo')
	--	 and value like '%ceipa%'
    ) AS SourceTable
PIVOT 
    (MAX(Field_Value) FOR Field_Name IN (IpAddress, NombreGrupo)) AS PivotTable
ORDER BY
    Grupo;



 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 WITH UsuariosPivot AS (
    SELECT Usuario, [LAST_NAME], [NombreCliente], [EMAIL], [registrationdate], [Nit], [FIRST_NAME], [mobile], [occupation], [nucleo], [remote]
    FROM 
        (SELECT 
             REPLACE(FA.USER_ID, 'f:bd03591f-be73-4be4-b7ed-a7c264d01cd9:', '') AS Usuario,
             FA.NAME AS Field_Name,
             CAST(FA.value AS NVARCHAR(MAX)) AS Field_Value
         FROM 
             [Keycloak].[dbo].[FED_USER_ATTRIBUTE] FA
             INNER JOIN [Keycloak].[dbo].[FED_USER_GROUP_MEMBERSHIP] FM ON FA.USER_ID = FM.USER_ID
             INNER JOIN [Keycloak].[dbo].[KEYCLOAK_GROUP] KG ON FM.GROUP_ID = KG.ID  
         WHERE 
             KG.NAME = 'usergroup_g890910961711000@urllegis.com' 
             AND FA.NAME IN ('LAST_NAME', 'NombreCliente', 'EMAIL', 'registrationdate', 'Nit', 'FIRST_NAME', 'mobile', 'occupation', 'nucleo', 'remote')
        ) AS SourceTable
    PIVOT 
        (MAX(Field_Value) FOR Field_Name IN ([LAST_NAME], [NombreCliente], [EMAIL], [registrationdate], [Nit], [FIRST_NAME], [mobile], [occupation], [nucleo], [remote])) AS PivotTable
)
SELECT 
    U.*,
    CASE WHEN R.Usuario IS NOT NULL THEN 'Sí' ELSE 'No' END AS TieneRolPremium
FROM 
    UsuariosPivot U
    LEFT JOIN (
        SELECT DISTINCT 
            REPLACE(fm.USER_ID, 'f:bd03591f-be73-4be4-b7ed-a7c264d01cd9:', '') AS Usuario
        FROM 
            [Keycloak].[dbo].[FED_USER_ROLE_MAPPING] fm
            INNER JOIN [Keycloak].[dbo].[KEYCLOAK_ROLE] kr ON kr.ID = fm.ROLE_ID
            INNER JOIN [Keycloak].[dbo].[CLIENT] c ON c.ID = kr.CLIENT
        WHERE 
            kr.NAME = 'SILVIA_PREMIUM_Role'
    ) R ON U.Usuario = R.Usuario
ORDER BY 
    U.Usuario;
