DECLARE @OBRA_IDANTERIOR NVARCHAR(100);
DECLARE @OBRA_IDNUEVA NVARCHAR(100);
DECLARE @OBRA_DESCRIPCION NVARCHAR(2000);
DECLARE @ANIO_ANTERIOR NVARCHAR(4); 
DECLARE @ANIO_ACTUAL NVARCHAR(4); 

SET @OBRA_IDANTERIOR = 'laboralbasico2021b';
SET @OBRA_IDNUEVA = 'laboralbasico2022a'; 
SET @OBRA_DESCRIPCION = 'CÓDIGO SUSTANTIVO DEL TRABAJO BASICO 48A ED'; 
SET @ANIO_ANTERIOR = '2021';
SET @ANIO_ACTUAL   = '2022'; 

PRINT N'--- **********************************************************************************************************************************'
PRINT N'--- ' + @OBRA_IDNUEVA    + '  ||| '       +    @OBRA_DESCRIPCION + '										  '
PRINT N'--- **********************************************************************************************************************************'
PRINT N'--**************************************************************																	  '
PRINT N'--*** Base de datos DBisapi																											  '
PRINT N'--**************************************************************																	  '
PRINT N'-- TABLA Infobases'
PRINT N''
PRINT N'INSERT INTO [dbisapi].[dbo].Infobases SELECT ''' + @OBRA_IDNUEVA + ''',''' + @OBRA_DESCRIPCION +''', Gratis, Publico, Activa, CodListaPaises, '
PRINT N'REPLACE(CodTema,''' + @ANIO_ANTERIOR + ''',''' + @ANIO_ACTUAL + '''), OrderInfo+1, REPLACE(REPLACE(path, ''' + @OBRA_IDANTERIOR + ''',''' + @OBRA_IDNUEVA + '''),''' + @ANIO_ANTERIOR + ''',''' + @ANIO_ACTUAL + '''),'
PRINT N'REPLACE(REPLACE(dominio, ''' + @OBRA_IDANTERIOR + ''' , ''' + @OBRA_IDNUEVA + '''),''' + @ANIO_ANTERIOR + ''',''' + @ANIO_ACTUAL + '''), Vista, GrupoTema '
PRINT N'FROM [dbisapi].[dbo].Infobases WHERE Obra = ''' + @OBRA_IDANTERIOR + ''' and Vista = ''PAIS'';'
PRINT N''
PRINT N'INSERT INTO [dbisapi].[dbo].Infobases SELECT top 1 ''' + @OBRA_IDNUEVA + ''',''' + @OBRA_DESCRIPCION +''', Gratis, Publico, Activa, CodListaPaises, '
PRINT N'REPLACE(CodTema,''' + @ANIO_ANTERIOR + ''',''' + @ANIO_ACTUAL + '''), OrderInfo+1, REPLACE(REPLACE(path, ''' + @OBRA_IDANTERIOR + ''',''' + @OBRA_IDNUEVA + '''),''' + @ANIO_ANTERIOR + ''',''' + @ANIO_ACTUAL + '''),'
PRINT N'REPLACE(REPLACE(dominio, ''' + @OBRA_IDANTERIOR + ''' , ''' + @OBRA_IDNUEVA + '''),''' + @ANIO_ANTERIOR + ''',''' + @ANIO_ACTUAL + '''), Vista, GrupoTema '
PRINT N'FROM [dbisapi].[dbo].Infobases WHERE Obra = ''' + @OBRA_IDANTERIOR + ''' and Vista = ''TEMA'';'
PRINT N''
PRINT N'-- TABLA ObrasNXT'
PRINT N'INSERT INTO [dbisapi].[dbo].ObrasNXT SELECT ''' + @OBRA_IDNUEVA + ''', ''' + @OBRA_IDNUEVA + ''', ''' + @OBRA_DESCRIPCION +''', GETDATE(), estado FROM [dbisapi].[dbo].ObrasNXT WHERE Id = ''' + @OBRA_IDANTERIOR + ''';'
PRINT N''
PRINT N'-- TABLA ObraFormulario'
PRINT N'INSERT INTO [dbisapi].[dbo].ObraFormulario SELECT ''' + @OBRA_IDNUEVA + ''', CodFormulario FROM [dbisapi].[dbo].ObraFormulario WHERE CodObra=''' + @OBRA_IDANTERIOR + ''';'
PRINT N''
PRINT N'-- TABLA UserObra'
PRINT N'INSERT INTO [dbisapi].[dbo].UserObra (dafuser, obra, tipo, vence, unidad, cupo, filial, multilegis, borrado, cantidadoriginal) SELECT ''nestor.fernandez@legis.com.co'', ''' + @OBRA_IDNUEVA + ''', ''B'', (GETDATE() + 2000), 1, 1, ''CO'', 0, 0, 1;'
PRINT N'INSERT INTO [dbisapi].[dbo].UserObra (dafuser, obra, tipo, vence, unidad, cupo, filial, multilegis, borrado, cantidadoriginal) SELECT ''julio.villamil@legis.com.co'',   ''' + @OBRA_IDNUEVA + ''', ''B'', (GETDATE() + 2000), 1, 1, ''CO'', 0, 0, 1;'
PRINT N''
PRINT N'-- TABLA UserObraTipoMedio'
PRINT N'INSERT INTO [dbisapi].[dbo].UserObraTipoMedio (codDafuser, codObra, codTipoMedioApps, descripcion, fechaCreacion) SELECT ''nestor.fernandez@legis.com.co'', ''' + @OBRA_IDNUEVA + ''', 2, ''Internet'', GETDATE();'
PRINT N'INSERT INTO [dbisapi].[dbo].UserObraTipoMedio (codDafuser, codObra, codTipoMedioApps, descripcion, fechaCreacion) SELECT ''nestor.fernandez@legis.com.co'', ''' + @OBRA_IDNUEVA + ''', 3, ''EBooks'',   GETDATE();'
PRINT N'INSERT INTO [dbisapi].[dbo].UserObraTipoMedio (codDafuser, codObra, codTipoMedioApps, descripcion, fechaCreacion) SELECT ''julio.villamil@legis.com.co'',   ''' + @OBRA_IDNUEVA + ''', 2, ''Internet'', GETDATE();'
PRINT N'INSERT INTO [dbisapi].[dbo].UserObraTipoMedio (codDafuser, codObra, codTipoMedioApps, descripcion, fechaCreacion) SELECT ''julio.villamil@legis.com.co'',   ''' + @OBRA_IDNUEVA + ''', 3, ''EBooks'',   GETDATE();'
PRINT N''
PRINT N'--**************************************************************'
PRINT N'--*** BASE DATOS salanxt'
PRINT N'--**************************************************************'	
PRINT N''
PRINT N'-- TABLA ObraCampos'
PRINT N'INSERT INTO [SalaNxt].[dbo].ObraCampos VALUES (''' + @OBRA_IDNUEVA + ''', 2, ''' + @OBRA_DESCRIPCION +''');'
PRINT N'INSERT INTO [SalaNxt].[dbo].ObraCampos VALUES (''' + @OBRA_IDNUEVA + ''', 19, ''' + @OBRA_DESCRIPCION +''');'
PRINT N'INSERT INTO [SalaNxt].[dbo].ObraCampos SELECT ''' + @OBRA_IDNUEVA + ''', Id_Campo, Atributo FROM [SalaNxt].[dbo].ObraCampos WHERE Id_Obra = ''' + @OBRA_IDANTERIOR + ''' AND Id_Campo = 54;'
PRINT N'INSERT INTO [SalaNxt].[dbo].ObraCampos VALUES (''' + @OBRA_IDNUEVA + ''', 40, 1);'
PRINT N''
PRINT N'-- TABLA Obra'
PRINT N'INSERT INTO [SalaNxt].[dbo].Obra VALUES (''' + @OBRA_IDNUEVA + ''', ''' + @OBRA_IDNUEVA + ''', GETDATE());'
PRINT N''
PRINT N'-- TABLA ProveedorFiltroTipos (1)'
PRINT N'INSERT INTO [SalaNxt].[dbo].ProveedorFiltroTipos SELECT DISTINCT TipoFiltro, NomTema, ''' + @OBRA_IDNUEVA + ''', Atributo FROM [SalaNxt].[dbo].ProveedorFiltroTipos WHERE obra = ''' + @OBRA_IDANTERIOR + ''';'
PRINT N''
PRINT N'-- TABLA COMENTARIOS_OBRAS (1)'
PRINT N'INSERT INTO [SalaNxt].[dbo].Comentarios_Obras VALUES (''' + @OBRA_IDNUEVA + ''', 1);'