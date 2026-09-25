--**************************************************************
--*** CASO: CORREGIR ENLACES 
--**************************************************************
SELECT * FROM CONTENIDOPARRAFO c WHERE c.IDCONTENIDO  = 'civilba'  
AND c.fechaactualizacion >= TO_TIMESTAMP('2025-04-06 14:07:44.000', 'YYYY-MM-DD HH24:MI:SS.FF3')
ORDER BY fechaactualizacion asc 
--**************************************************************
--*** CORREGIR ORDINAL 
--**************************************************************

begin
SPResincordinaldiferidoex('ventas');
end;


SELECT ordinal
FROM CONTENIDOPARRAFO
WHERE REGEXP_LIKE(ordinal, '[^0]{1}$')  -- termina en algo diferente de 0
AND TO_NUMBER(ordinal) IS NOT NULL
AND MOD(TO_NUMBER(ordinal), 100) <> 0
AND IDCONTENIDO  IN ('carlabor2011')
;



--**************************************************************
--*** CORREGIR ENLACES 
--**************************************************************

1. CONSULTAMOS LOS PARRAFOS QUE PRESENTAN PROBLEMA 

	  SELECT IDCONTENIDO, id, IDANTERIOR , IDSIGUIENTE , ordinal, XML  FROM CONTENIDOPARRAFO 
	  c WHERE c.IDCONTENIDO  = 'doctrinanai'
AND ID IN 
(
  'xdoctrinanai.da1645d3495e45df94d869a790664fde',
  'xdoctrinanai.f45714e0e7774de19b589ca91b20a553',
  'xdoctrinanai.2211b4b351c64619a47356a8e6de6620',
  'xdoctrinanai.0e6d271c910040c0b3075a102ac7bae9',
  'xdoctrinanai.3ca60e32df984a06a2be3075694a372c',
  'xdoctrinanai.c4e773aea10443acb10a6284e02ec63d'

)
ORDER BY ordinal desc 





  SELECT IDCONTENIDO, id, IDANTERIOR , IDSIGUIENTE ,  ordinal, XML  FROM CONTENIDOPARRAFO c 
	  WHERE c.IDCONTENIDO  = '6d97fe0216e58002e0430a0101518002'
AND ordinal BETWEEN 44486300 AND 44488400
ORDER BY ordinal desc 







2. REALIZAMOS UPDATE 

update contenidoparrafo set idanterior = 'xrexel.6a7f5255e26745b29fdfaeb02583f80b', idsiguiente = 'xrexel.f05ad8d509c14691b2f6bcd6f45ebf48' where IDCONTENIDO = 'rexel' and  id = 'xrexel.23e578af5d3c4e52aeced26b7fdfd404';
update contenidoparrafo set idanterior = 'xrexel.2b20a0dad3f74b9e9bbcf62adc47b8ad', idsiguiente = 'xrexel.23e578af5d3c4e52aeced26b7fdfd404' where IDCONTENIDO = 'rexel' and  id = 'xrexel.6a7f5255e26745b29fdfaeb02583f80b';
update contenidoparrafo set idanterior = 'xrexel.863dea5ac31c494f98b9cc46db8b1999', idsiguiente = 'xrexel.6a7f5255e26745b29fdfaeb02583f80b' where IDCONTENIDO = 'rexel' and  id = 'xrexel.2b20a0dad3f74b9e9bbcf62adc47b8ad';

update contenidoparrafo set idanterior = 'xdoctrinanai.3ca60e32df984a06a2be3075694a372c', idsiguiente = 'xdoctrinanai.f8d33b33464b4173be0f9ae2ae6606a5' where IDCONTENIDO = 'doctrinanai' and  id = 'xdoctrinanai.2211b4b351c64619a47356a8e6de6620';
update contenidoparrafo set idanterior = 'xdoctrinanai.9dfad123456b49b39dcdf14bb3d03ed7', idsiguiente = 'xdoctrinanai.da1645d3495e45df94d869a790664fde' where IDCONTENIDO = 'doctrinanai' and  id = 'xdoctrinanai.ddad99ec80d24c64a95b6f85b2e8b28a';
update contenidoparrafo set idanterior = 'xdoctrinanai.ddad99ec80d24c64a95b6f85b2e8b28a', idsiguiente = 'xdoctrinanai.c4e773aea10443acb10a6284e02ec63d' where IDCONTENIDO = 'doctrinanai' and  id = 'xdoctrinanai.da1645d3495e45df94d869a790664fde';

update contenidoparrafo set idanterior = 'xdoctrinanai.c5b8acbb3a47434caf8655e1328237c4', idsiguiente = 'xdoctrinanai.c4e773aea10443acb10a6284e02ec63d' where IDCONTENIDO = 'doctrinanai' and  id = 'xdoctrinanai.f45714e0e7774de19b589ca91b20a553';




update contenidoparrafo set idanterior = 'xventas.81450c3ed104441d81deed6f67c4e78f', idsiguiente = 'xventas.65fb94b87a584411a90d1ab25a2b9569' where IDCONTENIDO = 'ventas' and  id = 'xventas.519178486f3549a3a77a37d178a28840';
