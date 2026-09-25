-- ==============================================================================
-- GENERALES
-- ==============================================================================
DECLARE @PrefijoUsuario VARCHAR(100) = 'f:bd03591f-be73-4be4-b7ed-a7c264d01cd9:' 
DECLARE @FechaInicio DATETIME = '2022-01-01 00:00' 
DECLARE @FechaInicioSuscripcion DATETIME = '2020-01-01 00:00' 

-- AMBITOJURIDICO 
DECLARE @Cliente VARCHAR(100) = 'AmbitoJuridico' 
DECLARE @SitioHabeas VARCHAR(100) = '%AMBITO%' 
DECLARE @AplicacionWeb INT = 12 

-- ANALITICA 
DECLARE @Cliente VARCHAR(100) = 'Analitica' 
DECLARE @SitioHabeas VARCHAR(100) = '%Analitica%' 
DECLARE @AplicacionWeb INT = 15

-- ARANCEL 
DECLARE @Cliente VARCHAR(100) = 'Arancel' 
DECLARE @SitioHabeas VARCHAR(100) = '%Arancel%' 
DECLARE @AplicacionWeb INT = 2

-- COMUNIDADCONTABLE 
DECLARE @Cliente VARCHAR(100) = 'ComunidadContable' 
DECLARE @SitioHabeas VARCHAR(100) = '%contable%' 
DECLARE @AplicacionWeb INT = 15

-- CONSTRUDATA 
DECLARE @Cliente VARCHAR(100) = 'Construdata' 
DECLARE @SitioHabeas VARCHAR(100) = '%Construdata%' 
DECLARE @AplicacionWeb INT = 40

-- GESTION HUMANA
-- ojo con el sitiohabeas 
DECLARE @Cliente VARCHAR(100) = 'GestionHumana' 
DECLARE @SitioHabeas VARCHAR(100) = '%gestionhumana%' 
DECLARE @AplicacionWeb INT = 10

-- LEGISCOMEX
DECLARE @Cliente VARCHAR(100) = 'LegisComex' 
DECLARE @SitioHabeas VARCHAR(100) = '%LegisComex%' 
DECLARE @AplicacionWeb INT = 33

-- SILVIA 
DECLARE @Cliente VARCHAR(100) = 'SilvIA' 
DECLARE @SitioHabeas VARCHAR(100) = '%SilvIA%' 
DECLARE @AplicacionWeb INT = 41

-- XPERTA 
-- ojo con el sitiohabeas 
DECLARE @Cliente VARCHAR(100) = 'Publicaciones' 
DECLARE @SitioHabeas VARCHAR(100) = '%legis_XPERTA%' 
DECLARE @AplicacionWeb INT = 1


--drop table #TempUsuarios

-- Consultar registros 
SELECT 
  DISTINCT @PrefijoUsuario + Usuario AS Usuario, 
  FechaCreacion INTO #TempUsuarios
FROM 
  usuario 
  INNER JOIN UsuarioCreacion uc ON Id_Usuario = uc.CodUsuario 
WHERE 
  uc.FechaCreacion > @FechaInicio 
  AND Cliente = @Cliente 
ORDER BY 
  FechaCreacion ASC 
  
-- eliminar usuarios con suscripción activa en silencio
DELETE FROM 
  #TempUsuarios 
WHERE 
  Usuario IN (
    SELECT 
      DISTINCT @PrefijoUsuario + Usuario 
    FROM 
      usuario 
      INNER JOIN UsuarioCreacion uc ON Id_Usuario = uc.CodUsuario 
      INNER JOIN atencion a ON a.CodUsuario = Id_Usuario 
      INNER JOIN Suscripcion s ON s.CodAtencion = a.Id_Atencion 
      INNER JOIN AccesoProducto ap ON ap.CodProducto = s.CodProducto 
      INNER JOIN Acceso ac ON ac.Id_Acceso = ap.CodAcceso 
    WHERE 
      uc.FechaCreacion > @FechaInicioSuscripcion 
      AND Cliente = @Cliente 
      AND s.Sil_CodSuscripcion IS NOT NULL 
      AND s.FechaFin > GETDATE() 
      AND ac.CodAplicacionWeb IN (@AplicacionWeb)
  ) 
  
-- Traer datos del sso, y validar habeasdata. 
select 
  usrs.*, 
  ISNULL(
    bl.IDENTITY_PROVIDER, 'Formulario'
  ) as MetodoRegistro, 
  CASE WHEN AA.CodtipoAutorizacion = 1 THEN 'true' ELSE 'false' END as AutorizacionHabeas 
from 
  (
    select 
      REPLACE(USER_ID, @PrefijoUsuario, '') as Usuario, 
      FechaCreacion, 
	  modificationdate AS modificationdate, 
      FIRST_NAME as Nombre, 
      LAST_NAME as Apellido, 
	  mobile as Celular, 
      EMAIL as Email, 
      occupation as Ocupacion, 
	  personeria as Tipo_Personeria, 
      companysize as Tamaño_Empresa, 
	  birthdate as Fecha_Nacimiento, 
	  sector as Sector, 
	  segmento as segmento, 
	  especializations as Especializaciones, 
      interests as Intereses, 
	  habeas as HabeasSSO,
      gender as Sexo, 
      address as Direccion, 
	  region as Departamento, 
	  locality AS Ciudad
    FROM 
      (
        select 
          AT.USER_ID, 
          FechaCreacion, 
          AT.NAME, 
          CAST(
            AT.VALUE as varchar(8000)
          ) as VALUE 
        from 
          [10.250.4.29].[keycloak].[dbo].FED_USER_ATTRIBUTE AT 
          INNER JOIN #TempUsuarios U on AT.USER_ID=u.Usuario
          ) as x PIVOT (
        max(x.VALUE) FOR x.NAME IN (
          address, birthdate, EMAIL, ENABLED, 
          especializations, FIRST_NAME, gender, personeria, modificationdate,
          interests, LAST_NAME, mobile, occupation, 
          companysize, sector,segmento, locality, region, habeas
        )
      ) as Pivote
  ) as usrs 
  Left Join [10.250.4.29].[keycloak].[dbo].BROKER_LINK BL on REPLACE(BL.USER_ID, @PrefijoUsuario, '') = usrs.Usuario 
  Left join (
    Select 
      CodTipoAutorizacion, 
      Email 
    From 
      (
        select 
          th.CodTipoAutorizacion, 
          th.Email, 
          row_number() OVER (
            PARTITION BY th.Email 
            ORDER BY 
              th.Id_TblAutorizacion DESC
          ) AS rn 
        from 
          [10.250.4.7].[habeasdata].[dbo].TblAutorizacion th 
        where 
          th.sitio like @SitioHabeas
		 -- th.sitio IN ('legis_XPERTA','LPP','legis-XPERTA')
		 -- th.sitio like '%gestionhumana%' OR th.sitio = 'gh'
      ) sub 
    Where 
      rn = 1
  ) AA ON usrs.Usuario = AA.email collate Modern_Spanish_CI_AS 
ORDER BY 
  Usuario OPTION (RECOMPILE)









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