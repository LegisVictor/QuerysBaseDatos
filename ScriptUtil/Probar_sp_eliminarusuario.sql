           
		   DECLARE @Username AS varchar(500)


		   DECLARE @CodUsuario AS INT
		   DECLARE @CodUsuarioSuscripcion AS INT
		   DECLARE @CodUsuarioAtencionSil AS INT
		   DECLARE @Resp AS INT
		   set @Username= 'temporal_8000235518@legis.com.co'
		   SET @CodUsuario = 0
		   SET @CodUsuarioSuscripcion = 0
		   SET @CodUsuarioAtencionSil = 0
		   SET @Resp = 0 -- SI SE RETORNA EN CERO ES PORQUE NO EXISTE EN SCALA

		   -- Buscar username en la tabla usuario. 
		   SELECT  @CodUsuario =   isnull(Id_Usuario, 0) FROM Usuario WITH (NOLOCK) WHERE usuario = @Username

		   IF (@CodUsuario <> 0 )  
		   BEGIN
		   
				-- Validar que el usuario no exista en suscripciones. 
				SELECT @CodUsuarioSuscripcion = isnull(usuario_id, 0) FROM suscripciones  WITH (NOLOCK) WHERE usuario_id = @CodUsuario

				-- Validar que el usuario no viene se silenio. 
				SELECT @CodUsuarioAtencionSil = isnull(CodUsuario, 0) FROM atencion a WITH (NOLOCK) INNER JOIN suscripcion s WITH (NOLOCK) ON a.Id_Atencion = s.CodAtencion 
				WHERE a.CodUsuario = @CodUsuario and isnull(a.Sil_CodAtencion, 0) <> 0 and isnull(s.Sil_CodSuscripcion, 0) <> 0

				IF (@CodUsuarioSuscripcion = 0 AND @CodUsuarioAtencionSil = 0)
				BEGIN 
		        /*    DELETE FROM suscripcion WHERE codatencion IN ( SELECT CodAtencion FROM Suscripcion s INNER JOIN atencion a ON a.Id_Atencion = s.CodAtencion WHERE a.CodUsuario = @CodUsuario);
					DELETE FROM subatencion WHERE CodUsuario = @CodUsuario;
					DELETE FROM atencion  WHERE CodUsuario = @CodUsuario;
			   	    DELETE FROM UsuarioCreacion WHERE codusuario = @CodUsuario;
				    DELETE FROM Usuario WHERE usuario = @Username;*/

					SET @Resp = 1 -- USUARIO ELIMINADO
				END
				ELSE 
				BEGIN
				    SET @Resp = 2 -- NO SE PUEDE ELIMINAR PORQUE EL USUARIO TIENE REGISTRO EN SUSCRIPCIONES O VIENE DE SELENIO. 
				END 
		   END

		   print @resp