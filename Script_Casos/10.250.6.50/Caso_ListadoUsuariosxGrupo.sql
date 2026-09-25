
--- *********************************************************************************************
-- usuario grupo. 
--- *********************************************************************************************
SELECT 
 REPLACE(FM.USER_ID, 'f:bd03591f-be73-4be4-b7ed-a7c264d01cd9:', '') as Username,
KG.NAME as UserGroup 
FROM
[Keycloak].[dbo].[FED_USER_GROUP_MEMBERSHIP] FM INNER JOIN 
[Keycloak].[dbo].[KEYCLOAK_GROUP] KG ON FM.GROUP_ID = KG.ID  
WHERE  REPLACE(FM.USER_ID, 'f:bd03591f-be73-4be4-b7ed-a7c264d01cd9:', '') = 'asativa@bancodebogota.com.co' 





SELECT 
 REPLACE(FM.USER_ID, 'f:bd03591f-be73-4be4-b7ed-a7c264d01cd9:', '') as Username,
KG.NAME as UserGroup 
FROM
[Keycloak].[dbo].[FED_USER_GROUP_MEMBERSHIP] FM INNER JOIN 
[Keycloak].[dbo].[KEYCLOAK_GROUP] KG ON FM.GROUP_ID = KG.ID  
WHERE KG.NAME = 'usergroup_g890211142211000@urllegis.com' 


SELECT 

KG.NAME as UserGroup , ga.value
FROM
[Keycloak].[dbo].[FED_USER_GROUP_MEMBERSHIP] FM INNER JOIN 
[Keycloak].[dbo].[KEYCLOAK_GROUP] KG ON FM.GROUP_ID = KG.ID  
inner join [Keycloak].[dbo].[GROUP_ATTRIBUTE] ga on ga.GROUP_ID= FM.GROUP_ID
where ga.name = 'Dominio'



usergroup_g890910961711000@urllegis.com