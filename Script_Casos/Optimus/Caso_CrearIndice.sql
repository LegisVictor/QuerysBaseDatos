-- crear indice 
SELECT * FROM INDICEGENERACION i WHERE codcontenido ='HabeasData'


SELECT * FROM usuario WHERE upper(nomusuario) LIKE upper('%jaime%'); 



insert into indicegeneracion(codcontenido,codindice,ejecutar,fechaultimaejecucion,fechaproximaejecucion,periodicidad,cuentausuario,configuracion)
values('HabeasData',1,'N',null,null,null,'jaimea','');


insert into indicegeneracion(codcontenido,codindice,ejecutar,fechaultimaejecucion,fechaproximaejecucion,periodicidad,cuentausuario,configuracion)
values('HabeasData',2,'N',null,null,null,'jaimea','');
