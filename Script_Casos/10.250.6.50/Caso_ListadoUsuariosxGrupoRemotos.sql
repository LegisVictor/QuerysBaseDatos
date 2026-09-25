-- 10.250.6.50


SELECT 
 REPLACE(FM.USER_ID, 'f:bd03591f-be73-4be4-b7ed-a7c264d01cd9:', '') as Username,
KG.NAME as UserGroup --, fa.NAME 
FROM
  [Keycloak].[dbo].[FED_USER_ATTRIBUTE] FA inner join 
  [Keycloak].[dbo].[FED_USER_GROUP_MEMBERSHIP] FM on FA.USER_ID = FM.USER_ID INNER JOIN 
[Keycloak].[dbo].[KEYCLOAK_GROUP] KG ON FM.GROUP_ID = KG.ID  
WHERE fa.name = 'remote' and ( KG.NAME = 'usergroup_g80009496891011000@urllegis.com') 



/*
Victor me ayudas por favor con la lista de usuarios activos del user de alianza
usergroup_g86053131531021000@urllegis.com



Victor, me ayudas por favor con la lista de usuarios remoto activos del user de la rama judicial 

usergroup_g800093816351000@urllegis.com
*/




