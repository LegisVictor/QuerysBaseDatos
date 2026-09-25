SELECT * FROM contenido WHERE IDCONTENIDO  =  'carmagneticos2025'; 
SELECT * FROM ALIASOBRA a WHERE alias  =  'carmagneticos2025'; 

UPDATE contenido SET NOMCONTENIDO ='Cartilla ley de hábeas data y protección de datos personales'  WHERE IDCONTENIDO  =  'HabeasData'; 
UPDATE ALIASOBRA SET descripcion ='Cartilla ley de hábeas data y protección de datos personales' WHERE alias  =  'HabeasData'; 

UPDATE contenidotransformador SET configuracion =
'<root>
<parametros> 
<entry name="ALIAS">HabeasData</entry> 
<entry name="VISTA_APPMOVIL">S</entry> 
<entry name="PARRAFO_INICIO">3AB024959DE601C8E0630A0101826DFF</entry> 
<entry name="INDICESINCLUIR">FALSE</entry> 
<entry name="TITULO">Cartilla ley de hábeas data y protección de datos personales</entry>
<entry name="CLASIFICACION">ESPECIALIZADA</entry>
</parametros>
</root>'
WHERE codcontenido = 'HabeasData'AND CODTRANSFORMADOR IN (60); 



update proyecto set nomproyecto='Cartilla ley de hábeas data y protección de datos personales'  where p.id_proyecto = 3327501;