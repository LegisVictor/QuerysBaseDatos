-- AGREGAR EL CLIENTE NOS PERMITE QUE SE PUEDA HACER ACCESO POR URL O IP 
-- Base de datos: KeycloakIntermediate

INSERT INTO [dbo].[KeyCloakKeys]
           ([Pk_IdClient]
           ,[ClientSecret]
           ,[IsActive])
     VALUES
           ('SilvIA'
           ,'e3ffcbd1-147c-4fe7-85d6-695c0cfc1f59'
           ,1)
GO


