select top 1 REPLACE( REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(cast(Mensaje AS Varchar(max)),'http://www.legisaldia.com/redirectorNL.asp?Id_Tarea=_IDTAREA_&Email={{EMAIL}}&Enlace=',''),'{{NOMBRE}}','{{contact.firstname}}'),'{{EMAIL}}','{{contact.email}}'),'"','\"'),CHAR(13),''),CHAR(10),''),CHAR(9),'') Mensaje 
, rtrim(ltrim(NomTarea)) + ' LAD' as Nombre, REPLACE(rtrim(ltrim(Subject)),'NOTICIAS','Noticias') as Asunto
from tarea order by id_Tarea desc








