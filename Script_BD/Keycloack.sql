SELECT REPLACE(USER_ID, 'f:bd03591f-be73-4be4-b7ed-a7c264d01cd9:', '') as Username
  FROM [Keycloak].[dbo].[FED_USER_ATTRIBUTE] 
      where
USER_ID like
'f:bd03591f-be73-4be4-b7ed-a7c264d01cd9:%tempora%@legis.com.co%' and name = 'ENABLED' AND convert(varchar(5000), VALUE) = 'false' 


SELECT  REPLACE(USER_ID, 'f:bd03591f-be73-4be4-b7ed-a7c264d01cd9:', '') as Username--, value
  FROM [Keycloak].[dbo].[FED_USER_ATTRIBUTE] 
      where
USER_ID like
'f:bd03591f-be73-4be4-b7ed-a7c264d01cd9:%@legis.com.co%' and USER_ID not like
'%tempora%@legis.com.co%'  and name = 'ENABLED' AND convert(varchar(5000), VALUE) <> 'false' 


  /****** Script for SelectTopNRows command from SSMS  ******/
SELECT TOP (1000) [GROUP_ID]
      ,[USER_ID]
      ,[STORAGE_PROVIDER_ID], kg.*
  FROM [Keycloak].[dbo].[FED_USER_GROUP_MEMBERSHIP] gm inner join 
  [Keycloak].[dbo].[KEYCLOAK_GROUP] kg on kg.ID = gm.GROUP_ID
    where
group_id in ('a1eac1b0-859d-4f6f-9373-848d2fcc073b', 
'c5f3dc21-4cfc-41e9-9e5b-99532b2df49c')

order by 1


SELECT top 10 *,
  FM.GROUP_ID
  FROM 
  [Keycloak].[dbo].[FED_USER_ATTRIBUTE] FA inner join 
  [Keycloak].[dbo].[FED_USER_GROUP_MEMBERSHIP] FM on FA.USER_ID = FM.USER_ID
  where GROUP_ID = '368408ef-5f0d-448d-8a49-7d53a85c6694'



  /****** Script for SelectTopNRows command from SSMS  ******/
SELECT TOP (1000) [ID]
      ,[NAME]
      ,[VALUE]
      ,[GROUP_ID]
  FROM [Keycloak].[dbo].[GROUP_ATTRIBUTE] where GROUP_ID = '368408ef-5f0d-448d-8a49-7d53a85c6694'


  /****** Script for SelectTopNRows command from SSMS  ******/
SELECT TOP (1000) [GROUP_ID]
      ,[USER_ID]
      ,[REALM_ID]
      ,[STORAGE_PROVIDER_ID]
  FROM [Keycloak].[dbo].[FED_USER_GROUP_MEMBERSHIP] where user_id like '%victor.garcia@%'



  /****** Script for SelectTopNRows command from SSMS  ******/
SELECT TOP (1000) [ID]
      ,[NAME]
      ,[PARENT_GROUP]
      ,[REALM_ID]
  FROM [Keycloak].[dbo].[KEYCLOAK_GROUP] where name like  '%usergroup_g860000846411000@urllegis.com%' or 
  name like  '%usergroup_g86052238111011000@urllegis.com%' 
  

  /****** Script for SelectTopNRows command from SSMS  ******/
SELECT count(*)
  FROM [Keycloak].[dbo].[FED_USER_ROLE_MAPPING] where user_id like '%victor.garcia%'



  /****** Script for SelectTopNRows command from SSMS  ******/
SELECT TOP (1000) [ROLE_ID]
      ,[USER_ID]
      ,[REALM_ID]
      ,[STORAGE_PROVIDER_ID]
  FROM [Keycloak].[dbo].[FED_USER_ROLE_MAPPING] where user_id like '%Temporal%@legis.com.co%'




/****** 
CONSULTA PARA OBTENER EL USUARIO Y EL GRUPO. 
******/

SELECT 
FM.USER_ID, REPLACE(FM.USER_ID, 'f:bd03591f-be73-4be4-b7ed-a7c264d01cd9:', '') as Username,
KG.NAME as UserGroup 
FROM
[Keycloak].[dbo].[FED_USER_GROUP_MEMBERSHIP] FM INNER JOIN 

[Keycloak].[dbo].[KEYCLOAK_GROUP] KG ON FM.GROUP_ID = KG.ID INNER JOIN 
[Keycloak].[dbo].[FED_USER_ATTRIBUTE] FA  on FA.USER_ID = FM.USER_ID 
---INNER JOIN [Keycloak].[dbo].[FED_USER_ROLE_MAPPING] RM ON RM.USER_ID = FA.USER_ID 
WHERE FM.user_id like '%Temporal%@legis.com.co%' --FA.NAME =  'Remote' and FA.realm_id = 'Legis'
--and FM.user_id like '%tESTUSER_05@%'



SELECT 
FM.USER_ID, REPLACE(FM.USER_ID, 'f:bd03591f-be73-4be4-b7ed-a7c264d01cd9:', '') as Username,
KG.NAME as UserGroup 
FROM
[Keycloak].[dbo].[FED_USER_GROUP_MEMBERSHIP] FM INNER JOIN 

[Keycloak].[dbo].[KEYCLOAK_GROUP] KG ON FM.GROUP_ID = KG.ID INNER JOIN 
[Keycloak].[dbo].[FED_USER_ATTRIBUTE] FA  on FA.USER_ID = FM.USER_ID 
---INNER JOIN [Keycloak].[dbo].[FED_USER_ROLE_MAPPING] RM ON RM.USER_ID = FA.USER_ID 
WHERE FM.user_id like '%temporal%' --FA.NAME =  'Remote' and FA.realm_id = 'Legis'
--and FM.user_id like '%tESTUSER_05@%'






/****** Script for SelectTopNRows command from SSMS  ******/
SELECT DISTINCT REPLACE(FM.USER_ID, 'f:bd03591f-be73-4be4-b7ed-a7c264d01cd9:', '') as Username---, *kr.NAME, kr.REALM_ID, c.CLIENT_ID
FROM [Keycloak].[dbo].[FED_USER_ROLE_MAPPING] fm
WHERE   fm.user_id like '%Temporal%@legis.com.co%'
 



--select nomusuario, usuario  from usuario where usuario like '%Temporal%@legis.com.co%'



	SELECT REPLACE(fg.USER_ID, 'f:'+fg.STORAGE_PROVIDER_ID+':','') as username, ISNULL(ua.VALUE,'') as image, CASE WHEN  ug.VALUE IS NOT NULL  THEN 1 ELSE 0 END AS administrator,
	 CASE WHEN  ur.VALUE IS NOT NULL  THEN 1 ELSE 0 END AS remote
	FROM FED_USER_GROUP_MEMBERSHIP fg WITH (NOLOCK)
	LEFT JOIN FED_USER_ATTRIBUTE ua WITH (NOLOCK) on fg.USER_ID=ua.USER_ID and ua.NAME='picture'
	LEFT JOIN FED_USER_ATTRIBUTE ug WITH (NOLOCK) on fg.USER_ID=ug.USER_ID and ug.NAME='AdminGroups' and ug.VALUE LIKE '%'+@IdGrupo+'%'
	LEFT JOIN FED_USER_ATTRIBUTE ur WITH (NOLOCK) on fg.USER_ID=ur.USER_ID and ur.NAME='Remote' and ur.VALUE LIKE '%'+@IdGrupo+'%'
	WHERE fg.GROUP_ID=@IdGrupo
	ORDER BY 1
	
	

	
	
	
	USE [Keycloak]
GO
/****** Object:  StoredProcedure [dbo].[ObtenerMiembrosGrupo]    Script Date: 21/07/2023 4:18:58 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
ALTER PROCEDURE [dbo].[ObtenerMiembrosGrupo]
@IdGrupo VARCHAR(500) = NULL
AS
BEGIN	
	
	SELECT REPLACE(fg.USER_ID, 'f:'+fg.STORAGE_PROVIDER_ID+':','') as username, ISNULL(ua.VALUE,'') as image, CASE WHEN  ug.VALUE IS NOT NULL  THEN 1 ELSE 0 END AS administrator, CASE WHEN  ur.VALUE IS NOT NULL  THEN 1 ELSE 0 END AS remote
	FROM FED_USER_GROUP_MEMBERSHIP fg WITH (NOLOCK)
	LEFT JOIN FED_USER_ATTRIBUTE ua WITH (NOLOCK) on fg.USER_ID=ua.USER_ID and ua.NAME='picture'
	LEFT JOIN FED_USER_ATTRIBUTE ug WITH (NOLOCK) on fg.USER_ID=ug.USER_ID and ug.NAME='AdminGroups' and ug.VALUE LIKE '%'+@IdGrupo+'%'
	LEFT JOIN FED_USER_ATTRIBUTE ur WITH (NOLOCK) on fg.USER_ID=ur.USER_ID and ur.NAME='Remote' and ur.VALUE LIKE '%'+@IdGrupo+'%'
	WHERE fg.GROUP_ID=@IdGrupo
	ORDER BY 1
			
END





/****** Script for SelectTopNRows command from SSMS  ******/
SELECT kr.name , c.CLIENT_ID, kr.NAME, kr.REALM_ID, c.CLIENT_ID, FM.*
FROM [Keycloak].[dbo].[FED_USER_ROLE_MAPPING] fm
inner join [Keycloak].[dbo].[KEYCLOAK_ROLE] kr on kr.ID = fm.ROLE_ID 
inner join [Keycloak].[dbo].[CLIENT] c on c.id = kr.client
WHERE fm.USER_ID  like '%victor.garcia%'
ORDER BY  c.CLIENT_ID, kr.name 



-- USUARIO ROLES 
SELECT kr.name , c.CLIENT_ID, REPLACE(FM.USER_ID, 'f:bd03591f-be73-4be4-b7ed-a7c264d01cd9:', '') as Username
FROM [Keycloak].[dbo].[FED_USER_ROLE_MAPPING] fm
inner join [Keycloak].[dbo].[KEYCLOAK_ROLE] kr on kr.ID = fm.ROLE_ID 
inner join [Keycloak].[dbo].[CLIENT] c on c.id = kr.client
WHERE fm.USER_ID  like '%victor.garcia%'
ORDER BY  c.CLIENT_ID, kr.name 