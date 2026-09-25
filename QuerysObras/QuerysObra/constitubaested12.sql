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
SET @ObraOriginal = LOWER('constitubaested11');
SET @ObraNueva = LOWER('constitubaested12');
SET @ObraDescripcion = 'CONSTITUCIÓN POLÍTICA DE COLOMBIA 1991 - BÁSICO - COLECCIÓN UNIVERSITARIA 12a ed';
SET @ObraTemaPais = 'COLECCION UNIVERSITARIA';
SET @ObraTemaTema = 'TEMA_DERECHO CONSTITUCIONAL';
SET @ObraCodListaPais = 42;
SET @ObraSiglaListaPais = 'CO';
SET @CodMedioSel = 2;
SET @TipoMedioSel = 'Online';

-- Ingresar la nueva obra en Infobases, para la vista PAIS.
INSERT INTO Infobases
	SELECT     @ObraNueva, @ObraDescripcion, 0, 0, 1, @ObraCodListaPais, 
					  @ObraTemaPais AS Tema,
					  1, 					  
					  @ObraTemaPais + '/' + @ObraNueva AS ElPath, 
					  @ObraTemaPais + '(' + @ObraNueva + ')' AS ElDominio, 
					  'PAIS', NULL;
					  
-- Ingresar la nueva obra en Infobases, para la vista TEMA.
INSERT INTO Infobases
	SELECT     @ObraNueva, @ObraDescripcion, Gratis, Publico, Activa, @ObraCodListaPais, 
					  @ObraTemaTema AS Tema,
					  OrderInfo, 					  
					  REPLACE(path, '/' + @ObraOriginal, '/' + @ObraNueva) AS ElPath, 
					  REPLACE(dominio, '(' + @ObraOriginal + ')', '(' + @ObraNueva + ')') AS ElDominio, 
					  'TEMA', NULL
	FROM Infobases
	WHERE Obra = @ObraOriginal AND Vista = 'PAIS';

-- Incluir la obra recien configurada dentro de la tabla que carga las publicaciones dentro del dominio del usuario.
INSERT INTO ObrasNXT
					  (id, name, title, FECHA, estado)
VALUES     (@ObraNueva, @ObraNueva, @ObraDescripcion, GETDATE(), 1);

-- Incluir la obra recién configurada en la tabla de ObraCampos en SalaNXT:
-- Titulo
USE [SalaNXT];
SELECT @ConExisteDat = COUNT(Id_ObraCampos) FROM ObraCampos
  WHERE Id_Obra = @ObraNueva AND Id_Campo = 2;
IF @ConExisteDat < 1
  INSERT INTO ObraCampos
	VALUES (@ObraNueva, 2, @ObraDescripcion);
	
-- Titulo Alterno Vista Pais
SELECT @ConExisteDat = COUNT(Id_ObraCampos) FROM ObraCampos
  WHERE Id_Obra = @ObraNueva AND Id_Campo = 19;
IF @ConExisteDat < 1
  INSERT INTO ObraCampos
	VALUES (@ObraNueva, 19, @ObraDescripcion);
	
-- Clasificacion nuevo filtro agrupamiento resultados
SELECT @ConExisteDat = COUNT(Id_ObraCampos) FROM ObraCampos
  WHERE Id_Obra = @ObraNueva AND Id_Campo = 54;
IF @ConExisteDat < 1
  INSERT INTO ObraCampos
	VALUES (@ObraNueva, 54, 'Códigos y Compilaciones');
	
-- Configuración para dispositivos moviles / e-book:
-- Disponible en Apps
SELECT @ConExisteDat = COUNT(Id_ObraCampos) FROM ObraCampos
  WHERE Id_Obra = @ObraNueva AND Id_Campo = 39;
IF @ConExisteDat < 1
  INSERT INTO ObraCampos
	VALUES (@ObraNueva, 39, 1);
ELSE
  UPDATE ObraCampos
	SET Atributo = 1
	WHERE Id_Obra = @ObraNueva AND Id_Campo = 39;

-- Disponible como Ebook
SELECT @ConExisteDat = COUNT(Id_ObraCampos) FROM ObraCampos
  WHERE Id_Obra = @ObraNueva AND Id_Campo = 40;
IF @ConExisteDat < 1
  INSERT INTO ObraCampos
	VALUES (@ObraNueva, 40, 1);
ELSE
  UPDATE ObraCampos
	SET Atributo = 1
	WHERE Id_Obra = @ObraNueva AND Id_Campo = 40;

-- Incluir en tabla Obra.
INSERT INTO Obra
	VALUES (@ObraNueva, @ObraNueva, GETDATE());
			
-- Incluir la obra nueva, dentro de un tema especifico.
INSERT INTO ProveedorFiltroTipos
	SELECT DISTINCT TipoFiltro, NomTema, @ObraNueva, Atributo
	FROM ProveedorFiltroTipos
	WHERE obra = @ObraOriginal;
			
-- Habilitar la obra para incluir Notas/Comentarios.
INSERT INTO Comentarios_Obras
	VALUES (@ObraNueva, 1);
			
-- Incluir la obra nueva, en listado para consultarla despues.
INSERT INTO @TablaObras (NomAlias, CodFilial) VALUES (@ObraNueva, @ObraSiglaListaPais);
			
-- Ordenar las Infobases, de acuerdo a los nuevos textos y alias.
USE [DBisapi];
DECLARE @LasObrasDOS TABLE (Id int IDENTITY(1,1), Obra VARCHAR(255), OrderInfo INT);
DECLARE @LasObrasTRES TABLE (Id int IDENTITY(1,1), Obra VARCHAR(255), OrderInfo INT);

-- Por Pais:
INSERT INTO @LasObrasDOS
SELECT Obra, OrderInfo FROM infobases
WHERE codtema = @ObraTemaPais AND vista = 'PAIS'
ORDER BY descripcion;
UPDATE Inf
SET Inf.OrderInfo = New.Id
FROM @LasObrasDOS AS New INNER JOIN
infobases AS Inf ON New.Obra = Inf.Obra
WHERE Inf.vista = 'PAIS';

-- Por Tema:
INSERT INTO @LasObrasTRES
SELECT Obra, OrderInfo FROM infobases
WHERE codtema = @ObraTemaTema AND vista = 'TEMA'
ORDER BY descripcion;
UPDATE Inf
SET Inf.OrderInfo = New.Id
FROM @LasObrasTRES AS New INNER JOIN
infobases AS Inf ON New.Obra = Inf.Obra
WHERE Inf.vista = 'TEMA';
	
-- ## EN EL MODELO ANTERIOR DE USUARIOS POR DBISAPI ## --
-- Asignar la obra recien creada a los usuarios.
SET @ConteoReg = 0;
SET @ConteoObras = 0;
INSERT INTO @TablaUsuarios (NomUsuario) VALUES ('freddy.castellanos@legis.com.co');
INSERT INTO @TablaUsuarios (NomUsuario) VALUES ('nestor.fernandez@legis.com.co');
INSERT INTO @TablaUsuarios (NomUsuario) VALUES ('julian.sanchez@legis.com.co');
INSERT INTO @TablaUsuarios (NomUsuario) VALUES ('claudia.trivino@legis.com.co');
INSERT INTO @TablaUsuarios (NomUsuario) VALUES ('alexandra.avila@legis.com.co');

SELECT @ContarReg = COUNT(*) FROM @TablaUsuarios;
SELECT @ContarObras = COUNT(*) FROM @TablaObras;
IF ((@ContarReg > 0) AND (@ContarObras > 0))
	BEGIN		
		WHILE (@ConteoReg < @ContarReg)
			BEGIN
				SET @ConteoObras = 0;

				SELECT @UserAsigna = NomUsuario FROM @TablaUsuarios WHERE id_usuario = (@ConteoReg + 1);
				
				WHILE (@ConteoObras < @ContarObras)
					BEGIN																
						SELECT @ObraAsigna = NomAlias, @ObraFilial = CodFilial FROM @TablaObras WHERE id_obra = (@ConteoObras + 1);
						
						SET @UserPatron = @UserAsigna;
						INSERT INTO UserObra (dafuser, obra, tipo, vence, unidad, cupo, filial, multilegis, borrado, cantidadoriginal)
							SELECT @UserAsigna, @ObraAsigna, 'B', (GETDATE() + 365), 1, 1, @ObraFilial, 0, 0, 1;
						INSERT INTO UserObraTipoMedio (codDafuser, codObra, codTipoMedioApps, descripcion, fechaCreacion)
							SELECT @UserAsigna, @ObraAsigna, @CodMedioSel, @TipoMedioSel, GETDATE();
						SET @ConteoObras = @ConteoObras + 1;
					END;		
				
				SET @ConteoReg = @ConteoReg + 1;
			END;
	END;

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
