 -- MOVER PARRAFOS 
 
 SELECT IDCONTENIDO, ID, IDANTERIOR, IDSIGUIENTE, ORDINAL, XML  FROM CONTENIDOPARRAFO WHERE ID IN (
 'xeppenal2009.ed4a302706f178db9cb6c1513c201d54',
'xeppenal2009.0583cc73e5bf4e9d9948df674ce68c85', 
'xeppenal2009.047e2a31c92adcc129f80141c74a75cd',
'xeppenal2009.9d9dff9320e27082b15b4ed7a086ba83', 
'xeppenal2009.d8f505ad20db2539df5faa81ec9b5f7b', 
'xeppenal2009.ed4a413f0f1611d9056d9e2d08b29a54'

 ) ORDER BY ORDINAL ;



update contenidoparrafo set idsiguiente = 'xeppenal2009.9d9dff9320e27082b15b4ed7a086ba83' where IDCONTENIDO = 'eppenal2009' and  id = 'xeppenal2009.ed4a302706f178db9cb6c1513c201d54';
update contenidoparrafo set idanterior = 'xeppenal2009.ed4a302706f178db9cb6c1513c201d54', idsiguiente = 'xeppenal2009.155fbd9e78c2692365ba64ba277aa04c' where IDCONTENIDO = 'eppenal2009' and  id = 'xeppenal2009.9d9dff9320e27082b15b4ed7a086ba83';
update contenidoparrafo set idanterior = 'xeppenal2009.c09c10b5283c935010bb2f2065873d08', idsiguiente = 'xeppenal2009.0583cc73e5bf4e9d9948df674ce68c85' where IDCONTENIDO = 'eppenal2009' and  id = 'xeppenal2009.d8f505ad20db2539df5faa81ec9b5f7b';
update contenidoparrafo set idanterior = 'xeppenal2009.d8f505ad20db2539df5faa81ec9b5f7b', idsiguiente = 'xeppenal2009.ada8d6c0cb0c9f8e388bc2e625fb9fbc' where IDCONTENIDO = 'eppenal2009' and  id = 'xeppenal2009.0583cc73e5bf4e9d9948df674ce68c85';
update contenidoparrafo set idanterior = 'xeppenal2009.62de678d41abcf710df6d7ad164453b2', idsiguiente = 'xeppenal2009.ed4a413f0f1611d9056d9e2d08b29a54' where IDCONTENIDO = 'eppenal2009' and  id = 'xeppenal2009.047e2a31c92adcc129f80141c74a75cd';
update contenidoparrafo set idanterior = 'xeppenal2009.047e2a31c92adcc129f80141c74a75cd' where IDCONTENIDO = 'eppenal2009' and  id = 'xeppenal2009.ed4a413f0f1611d9056d9e2d08b29a54';




begin
SPResincordinaldiferidoex('eppenal2009');
end;

-- MOVER ARBOL 
 SELECT *  FROM CONTENIDOPARRAFOARBOL WHERE ID IN (
'xeppenal2009.ed4a302706f178db9cb6c1513c201d54',
'xeppenal2009.9d9dff9320e27082b15b4ed7a086ba83',
'xeppenal2009.89fb93ee04e82cec82d93f7b77151320', 'xeppenal2009.13387361a78fea125c34d341272773c9'
)


-- ademas se debe cambiar el id del parrafo qeu se esta moviendo 
