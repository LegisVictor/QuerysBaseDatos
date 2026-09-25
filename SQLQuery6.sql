/****** Script for SelectTopNRows command from SSMS  ******/
SELECT name, name = 'epcomercio2008_Role', * FROM [Keycloak].[dbo].[KEYCLOAK_ROLE] where REALM_ID = 'Legis' and name = 'EPcomercio2008_Role'; 
SELECT name, name = 'eplaboral2009', * FROM [Keycloak].[dbo].[KEYCLOAK_ROLE] where REALM_ID = 'Legis' and name = 'EPLABORAL2009_Role'; 
SELECT name, name = 'epsegsocia2009', * FROM [Keycloak].[dbo].[KEYCLOAK_ROLE] where REALM_ID = 'Legis' and name = 'EPSEGSOCIA2009_Role'; 
SELECT name, name = 'eppenal2009', * FROM [Keycloak].[dbo].[KEYCLOAK_ROLE] where REALM_ID = 'Legis' and name = 'EPPenal2009_Role'; 
SELECT name, name = 'epcivil2009', * FROM [Keycloak].[dbo].[KEYCLOAK_ROLE] where REALM_ID = 'Legis' and name = 'EPCIVIL2009_Role'; 
SELECT name, name = 'eptributario2009', * FROM [Keycloak].[dbo].[KEYCLOAK_ROLE] where REALM_ID = 'Legis' and name = 'EPTributario2009_Role'; 
SELECT name, name = 'pcontable', * FROM [Keycloak].[dbo].[KEYCLOAK_ROLE] where REALM_ID = 'Legis' and name = 'PCONTABLE_Role'; 
SELECT name, name = 'pconstitucional', * FROM [Keycloak].[dbo].[KEYCLOAK_ROLE] where REALM_ID = 'Legis' and name = 'PConstitucional_Role'; 

UPDATE [Keycloak].[dbo].[KEYCLOAK_ROLE]  SET name = 'epcomercio2008_Role'   where REALM_ID = 'Legis' and name = 'EPcomercio2008_Role'; 
UPDATE [Keycloak].[dbo].[KEYCLOAK_ROLE]  SET name = 'eplaboral2009'         where REALM_ID = 'Legis' and name = 'EPLABORAL2009_Role'; 
UPDATE [Keycloak].[dbo].[KEYCLOAK_ROLE]  SET name = 'epsegsocia2009'        where REALM_ID = 'Legis' and name = 'EPSEGSOCIA2009_Role'; 
UPDATE [Keycloak].[dbo].[KEYCLOAK_ROLE]  SET name = 'eppenal2009'           where REALM_ID = 'Legis' and name = 'EPPenal2009_Role'; 
UPDATE [Keycloak].[dbo].[KEYCLOAK_ROLE]  SET name = 'epcivil2009'           where REALM_ID = 'Legis' and name = 'EPCIVIL2009_Role'; 
UPDATE [Keycloak].[dbo].[KEYCLOAK_ROLE]  SET name = 'eptributario2009'      where REALM_ID = 'Legis' and name = 'EPTributario2009_Role'; 
UPDATE [Keycloak].[dbo].[KEYCLOAK_ROLE]  SET name = 'pcontable'             where REALM_ID = 'Legis' and name = 'PCONTABLE_Role'; 
UPDATE [Keycloak].[dbo].[KEYCLOAK_ROLE]  SET name = 'pconstitucional'       where REALM_ID = 'Legis' and name = 'PConstitucional_Role'; 



carolina.sarmiento@transmilenio.gov.co


	select th.CodTipoAutorizacion,th.Email, row_number() OVER (PARTITION BY th.Email ORDER BY th.Id_TblAutorizacion DESC) AS rn
	
	from [10.250.4.7].[habeasdata].[dbo].TblAutorizacion th 
	where th.sitio like '%ambitojuridico%'