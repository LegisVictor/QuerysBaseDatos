
SELECT Obra, Descripcion, Gratis, Publico, Activa, CodListaPaises, CodTema, OrderInfo, path, dominio, Vista, GrupoTema
FROM dbo.Infobases
WHERE CodListaPaises =6 ;


SELECT distinct  CodTema
FROM dbo.Infobases
WHERE CodListaPaises =6 ;

--sijprecapana RÉGIMEN SOBRE PREVENCIÓN DE BLANQUEO DE CAPITALES DE PANAMÁ


--sijbienesra RÉGIMEN DE BIENES Y RAÍCES DE PANAMÁ



-- ======================================
-- Néstor Fernández 2020-may-15
-- Configuración de nueva obra.
-- ======================================
BEGIN TRY

BEGIN TRAN T1;

-- Crear la configuracion para una obra nueva, asignandola a los usuarios por defecto.
USE [DBisapi];
DECLARE @ContarReg AS INT;
DECLARE @ConteoReg AS INT;
DECLARE @ContarObras AS INT;
DECLARE @ConteoObras AS INT;
DECLARE @ConExisteDat AS INT;
DECLARE @ObraNueva AS VARCHAR(255);
DECLARE @UserAsigna AS VARCHAR(255);
DECLARE @UserPatron AS VARCHAR(255);
DECLARE @ObraAsigna AS VARCHAR(100);
DECLARE @ObraFilial AS VARCHAR(24);
DECLARE @ObraOriginal AS VARCHAR(255);
DECLARE @ObraDescripcion AS VARCHAR(255);
DECLARE @ObraTemaPais AS VARCHAR(255);
DECLARE @ObraTemaTema AS VARCHAR(255);
DECLARE @ObraCodListaPais AS INT;
DECLARE @ObraSiglaListaPais AS VARCHAR(24);
DECLARE @CodMedioSel AS INT;
DECLARE @TipoMedioSel AS VARCHAR(24);
DECLARE @TablaUsuarios AS table (id_usuario INT IDENTITY(1,1), NomUsuario VARCHAR(255));
DECLARE @TablaObras AS table (id_obra INT IDENTITY(1,1), NomAlias VARCHAR(100), CodFilial VARCHAR(24));
SET @ObraOriginal = LOWER('sijmigracion');
SET @ObraNueva = LOWER('sijprecapana');
SET @ObraDescripcion = 'RÉGIMEN SOBRE PREVENCIÓN DE BLANQUEO DE CAPITALES DE PANAMÁ';
SET @ObraTemaPais = 'COLECCION UNIVERSITARIA';
SET @ObraTemaTema = 'TEMA_DERECHO CIVIL';
SET @ObraCodListaPais = 6;
SET @ObraSiglaListaPais = 'PA';
SET @CodMedioSel = 2;
SET @TipoMedioSel = 'Online';


	SELECT     @ObraNueva, @ObraDescripcion, Gratis, Publico, Activa, @ObraCodListaPais, 
					  @ObraTemaTema AS Tema,
					  OrderInfo, 					  
					  REPLACE(path, '/' + @ObraOriginal, '/' + @ObraNueva) AS ElPath, 
					  REPLACE(dominio, '(' + @ObraOriginal + ')', '(' + @ObraNueva + ')') AS ElDominio, 
					  'TEMA', NULL
	FROM Infobases
	WHERE Obra = @ObraOriginal AND Vista = 'PAIS'

COMMIT TRAN T1;

SELECT 'TERMINADO: OK';
	
END TRY
BEGIN CATCH

ROLLBACK TRAN T1;

SELECT  
	ERROR_NUMBER() AS ErrorNumber  
	,ERROR_SEVERITY() AS ErrorSeverity  
	,ERROR_STATE() AS ErrorState  
	,ERROR_PROCEDURE() AS ErrorProcedure  
	,ERROR_LINE() AS ErrorLine  
	,ERROR_MESSAGE() AS ErrorMessage;

END CATCH

