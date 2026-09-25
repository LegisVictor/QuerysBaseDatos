DECLARE @Cliente VARCHAR(100) = 'AmbitoJuridico'
DECLARE @PrefijoUsuario VARCHAR(100) = 'f:bd03591f-be73-4be4-b7ed-a7c264d01cd9:'
DECLARE @FechaInicio DATETIME = '2022-01-01 00:00'
DECLARE @FechaInicioSuscripcion DATETIME = '2020-01-01 00:00'
DECLARE @SitioHabeas VARCHAR(100) = '%ambitojuridico%'
DECLARE @AplicacionWeb INT = 12 


--drop table #TempUsuarios
SELECT DISTINCT 
       @PrefijoUsuario + Usuario AS Usuario,
       FechaCreacion
INTO #TempUsuarios
FROM usuario
INNER JOIN UsuarioCreacion uc 
       ON Id_Usuario = uc.CodUsuario
WHERE uc.FechaCreacion > @FechaInicio
AND Cliente = @Cliente
ORDER BY FechaCreacion ASC

-- eliminar usuarios con suscripción activa en silencio
DELETE FROM #TempUsuarios 
WHERE Usuario IN
(
    SELECT DISTINCT 
           @PrefijoUsuario + Usuario
    FROM usuario
    INNER JOIN UsuarioCreacion uc ON Id_Usuario = uc.CodUsuario
    INNER JOIN atencion a ON a.CodUsuario = Id_Usuario
    INNER JOIN Suscripcion s ON s.CodAtencion = a.Id_Atencion
    INNER JOIN AccesoProducto ap  ON ap.CodProducto = s.CodProducto
    INNER JOIN Acceso ac ON ac.Id_Acceso = ap.CodAcceso
    WHERE uc.FechaCreacion > @FechaInicioSuscripcion
    AND Cliente = @Cliente
    AND s.Sil_CodSuscripcion IS NOT NULL
    AND s.FechaFin > GETDATE()
    AND ac.CodAplicacionWeb IN (@AplicacionWeb)
)

select 
  usrs.*, 
  ISNULL(
    bl.IDENTITY_PROVIDER, 'Formulario'
  ) as MetodoRegistro, 
  CASE WHEN AA.CodtipoAutorizacion = 1 THEN 'true' ELSE 'false' END as AutorizacionHabeas 
from 
  (
    select 
      REPLACE(
        USER_ID, @PrefijoUsuario, 
        ''
      ) as Usuario, 
      FechaCreacion, 
      FIRST_NAME as Nombre, 
      LAST_NAME as Apellido, 
      EMAIL as Correo, 
      mobile as Telefono, 
      gender as Sexo, 
      address as Direccion, 
      birthdate as Nacimiento, 
      especializations as Especializaciones, 
      interests as Intereses, 
      occupation as Ocupacion, 
      companysize as Empresa, 
      sector as Sector, 
      region as Region, 
      habeas as HabeasSSO 
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
          especializations, FIRST_NAME, gender, 
          interests, LAST_NAME, mobile, occupation, 
          companysize, sector, region, habeas
        )
      ) as Pivote
  ) as usrs 
  Left Join [10.250.4.29].[keycloak].[dbo].BROKER_LINK BL on REPLACE(
    BL.USER_ID, @PrefijoUsuario, 
    ''
  ) = usrs.Usuario 
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
      ) sub 
    Where 
      rn = 1
  ) AA ON usrs.Usuario = AA.email collate Modern_Spanish_CI_AS 
ORDER BY 
  Usuario
  OPTION (RECOMPILE)