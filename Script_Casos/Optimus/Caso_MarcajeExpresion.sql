-- CASO MARCAJE ACTIVAR. 
-- tener en cuenta el archivo LPP.XML de la exportacion debe estar activo para marcaje. 
-- ALTER TRIGGER customers_audit_trg DISABLE; por si se necesita hacer algun ajuste hay tigger 

SELECT * FROM CLASEEXPRESION
SELECT * FROM TIPOEXPRESION t 
SELECT * FROM ENTIDADORIGEN e 
SELECT * FROM ABREVIATURA BR WHERE nomabreviatura LIKE '%Res%' --OR nomabreviatura LIKE '%Comer%'
SELECT * FROM EXPRESIONDOCUMENTO e  WHERE upper(expresion) LIKE upper('%Ley%')
SELECT * FROM EXPRESIONMARCAJE e 


SELECT *
FROM ABREVIATURA
WHERE SIGLA LIKE '%Ley%';


--(?<CLASEDOCUMENTO>D\.?\s?L\.|Ley|D\.?\s?Leg\.|Decisi[óo]n|Ac\.?|Circ\.)(?<separador1>\s?)(?<NUMERO>\w*-?[\.\d]+[ªº°]?(\s?\(\d+\))?)?(-?\w*-?\d+)?(-[A-Za-z]+-?\w+)?
D. L. 19990
D. Leg. 1049
Ley 27444
Decisión 486

--  EJECUTAR == 1
SELECT * FROM IMPORTDATA i 

-- se crearon ENTIDADORIGEN, ABREVIATURA, 

SELECT * FROM IMPORTDATA i 

SELECT * FROM EXPRESIONMARCAJE
WHERE VALOR LIKE '%(?<NUMERO>\w*-?[\.\d]+[ªº°]?(\s?\(\d+\))?)%';



-- DEBE ESTAR ANTES DE OTRA EXPRESION EN CONTINUAR = TRUE, ORDEN = MENOR, TIPO =  1  
SELECT * FROM EXPRESIONMARCAJE WHERE id = 94 ;

SELECT * FROM EXPRESIONMARCAJE -- ORDER BY orden 
WHERE id IN (121,122) ;


-- MARCAJE CAMBIOS 

SELECT * FROM CONTENIDOPARRAFO c WHERE  id = 'xeppenal2009.658d65f8c20d0cad03eaf82e23de1850' 
AND REGEXP_LIKE(xml,
'^(?<nodos1>((<[^>]+>){0,4}\s?){0,4})(?<CLASEDOCUMENTO>D\.?\s?Leg\.)(?<separador1>\s?)(?<NUMERO>\w*-?[\.\d]+[ªº°]?(\s?\(\d+\))?)\.?');  
	   
	   
WITH CANDIDATOS AS (
    SELECT CP.ID,
           NAU.PRINCIPAL,
           CP.ORDINAL,
           'NAU' AS ORIGEN
    FROM CONTENIDOPARRAFO CP
    INNER JOIN NORMA_ARTICULOS_UBICACION NAU
        ON CP.ID = NAU.CODPARRAFOINI
    WHERE CP.IDCONTENIDO = 'eppenal2009'
      AND NAU.CODCONTENIDO = 'eppenal2009'
      AND CP.GRUPO IS NULL
)
SELECT C.ID AS ID_ORIGEN,
       C.ORDINAL AS ORDINAL_ORIGEN,
       C.PRINCIPAL,
       C.ORIGEN,
       R.ID AS ID_REFPAR,
       R.ORDINAL AS ORDINAL_REFPAR,
       R.ESTILO,
       R.GRUPO,
       R.N,
       R.XML_CORTO
FROM CANDIDATOS C
OUTER APPLY (
    SELECT ID,
           ORDINAL,
           ESTILO,
           GRUPO,
           LENGTH(XML) AS N,
           SUBSTR(XML, 1, 300) AS XML_CORTO
    FROM (
        SELECT CP2.ID,
               CP2.ORDINAL,
               CP2.ESTILO,
               CP2.GRUPO,
               CP2.XML,
               LEVEL AS NIVEL
        FROM CONTENIDOPARRAFO CP2
        WHERE CP2.IDCONTENIDO = 'eppenal2009'
        START WITH CP2.ID = C.ID
        CONNECT BY PRIOR CP2.ID = CP2.IDSIGUIENTE
           AND CP2.ESTILO IN (
                'nivel 1',
                'nivel 2',
                'nivel 3',
                'nivel 4',
                'nivel 5',
                'nivel 6',
                'nivel 7',
                'nueve-titulo',
                'cuerpo-titulo',
                'cuerpo-titulo-negra',
                'sintesis-negra',
                'codigo-9'
           )
           AND (
                CP2.GRUPO IS NULL
                OR CP2.GRUPO != 'FC443D4918A8B072E0430A010156B072'
           )
        ORDER BY LEVEL DESC
    )
    WHERE LENGTH(XML) > 0
      AND ROWNUM = 1
) R
ORDER BY C.ORDINAL;



SELECT * 
FROM CONTENIDOPARRAFO CP2
        WHERE CP2.IDCONTENIDO = 'eppenal2009'
      
           AND CP2.ESTILO IN (
                'nivel 1',
                'nivel 2',
                'nivel 3',
                'nivel 4',
                'nivel 5',
                'nivel 6',
                'nivel 7',
                'nueve-titulo',
                'cuerpo-titulo',
                'cuerpo-titulo-negra',
                'sintesis-negra',
                'codigo-9'
           ) AND id='xeppenal2009.658d65f8c20d0cad03eaf82e23de1850'
           AND (
                CP2.GRUPO IS NULL
                OR CP2.GRUPO != 'FC443D4918A8B072E0430A010156B072'
           )
           
           
  select distinct to_char(REGEXP_REPLACE(REGEXP_REPLACE(xml,'<.*?>',''),'.*((ART|ARTS)\.\s*.+?)\.*—.*','\1')) as texto,
  C.NOMCONTENIDO,cp.ESTILO, cp.id, cp.ordinal, cp.idanterior, cp.idcontenido 
  from contenido c inner join  contenidoparrafo cp
            on c.idcontenido=cp.idcontenido inner join atributoparrafo ap
            on ap.CODPARRAFO= cp.id 
            where c.CODTIPOCONTENIDO in (11,842,843,1063) 
            and (ap.codatributo in (11,15,877,1) or estilo='nivel 1') AND estilo <> 'concordancia'
            and c.idcontenido='eppenal2009'
            and ordinal < (select ordinal from contenidoparrafo cp inner join atributoparrafo ap 
            on ap.CODPARRAFO= cp.id where codatributo=877 and cp.idcontenido='eppenal2009')
            and cp.flagborrado=0 
            order by ordinal asc;
            
           
           
           
SELECT cp.ID,
       cp.IDCONTENIDO,
       em.NUEVOVALOR,
       em.VALOR AS EXPRESION,
       SUBSTR(cp.XML,1,300) AS XML_CORTO
FROM CONTENIDOPARRAFO cp
INNER JOIN EXPRESIONMARCAJE em
   ON REGEXP_LIKE(
        cp.XML,
        REGEXP_REPLACE(em.VALOR, '\(\?<\S+?>', '(')
      )
WHERE em.TIPOEXPRESION = 3 and
cp.id='xeppenal2009.658d65f8c20d0cad03eaf82e23de1850';





SELECT A.SIGLA
FROM ABREVIATURA A
WHERE NOT EXISTS (
    SELECT 1
    FROM EXPRESIONDOCUMENTO E
    WHERE UPPER(E.EXPRESION) LIKE '%' || REPLACE(UPPER(A.SIGLA),'.','\.') || '%'
);



SELECT 
    c.IDCONTENIDO,
    c.ID,
    c.IDANTERIOR,
    c.IDSIGUIENTE,
    c.ORDINAL,
    REGEXP_COUNT(c.XML, '<[Nn]egrita(\s|>)') AS APERTURAS_NEGRITA,
    REGEXP_COUNT(c.XML, '</[Nn]egrita>') AS CIERRES_NEGRITA,
    DBMS_LOB.SUBSTR(c.XML, 3000, 90000) AS XML_REVISION
FROM CONTENIDOPARRAFO c
WHERE c.IDCONTENIDO = 'eptributario2009'
  AND REGEXP_COUNT(c.XML, '<[Nn]egrita(\s|>)') 
      <> REGEXP_COUNT(c.XML, '</[Nn]egrita>');
      
     
     
     SELECT 
    c.ID,
    c.ORDINAL,
    DBMS_LOB.INSTR(c.XML, '<negrita') AS POS_APERTURA_MINUSCULA,
    DBMS_LOB.INSTR(c.XML, '</negrita>') AS POS_CIERRE_MINUSCULA, XML
FROM CONTENIDOPARRAFO c
WHERE c.IDCONTENIDO = 'eptributario2009'
  AND (
      DBMS_LOB.INSTR(c.XML, '<Negrita') > 0
     -- OR DBMS_LOB.INSTR(c.XML, '</negrita>') > 0
  );
  



-- *******************************************************************************************************
-- JURISPRUDENCIA Y DOCTRINA SE HACEN EN LA EXPORTACION PERO SI USAN LAS EXPRESIONES DE EXPRESIONMARCAJE
-- *******************************************************************************************************

SELECT * FROM contenidoparrafo WHERE xml LIKE '%DOCTRINA%'
SELECT * FROM contenidoparrafo WHERE xml LIKE '%jurisprudencia%'


-- PROBAR
SELECT CASE
         WHEN REGEXP_LIKE(XML,
        '^([[:space:]]*<CodigoInterno[[:space:]]+id[[:space:]]*=[[:space:]]*"[^"]+">[^<]+</CodigoInterno>)?[[:space:]]*(\[(§|Â§|&#167;|&sect;)([[:space:]]|&nbsp;|&#160;)*[0-9]+(-[0-9]+)*\]([[:space:]]|&nbsp;|&#160;)*)?((<[^>]+>)([[:space:]]|&nbsp;|&#160;)*){0,10}J([[:space:]]|&nbsp;|&#160;)?URISPRUDENCIA([[:space:]]|&nbsp;|&#160;)*(\.?([[:space:]]|&nbsp;|&#160;)*(—|–|-|â€”|&#8212;|&#x2014;)|\.)'
           )
         THEN 'MATCH'
         ELSE 'NO MATCH'
       END AS resultado, ordinal, 
       XML
FROM CONTENIDOPARRAFO
         WHERE IDCONTENIDO = 'epcivil2009'
		 AND id ='xepcivil2009.819d4c881946268265fe9de5f1a61973'

-- ASI LO HACE SPMARCARGRUPO 
SELECT * FROM CONTENIDOPARRAFO
         WHERE IDCONTENIDO = 'epcivil2009'
          -- AND (ENDINGORDINAL IS NULL OR ORDINAL < ENDINGORDINAL)
           AND GRUPO IS NULL
           AND REGEXP_LIKE(XML,     
           '^([[:space:]]*<CodigoInterno[[:space:]]+id[[:space:]]*=[[:space:]]*"[^"]+">[^<]+</CodigoInterno>)?[[:space:]]*(\[(§|Â§|&#167;|&sect;)([[:space:]]|&nbsp;|&#160;)*[0-9]+(-[0-9]+)*\]([[:space:]]|&nbsp;|&#160;)*)?((<[^>]+>)([[:space:]]|&nbsp;|&#160;)*){0,10}J([[:space:]]|&nbsp;|&#160;)?URISPRUDENCIA([[:space:]]|&nbsp;|&#160;)*(\.?([[:space:]]|&nbsp;|&#160;)*(—|–|-|â€”|&#8212;|&#x2014;)|\.)'
         );
		 
		 
-- EJECUTAR MARCAJE DE GRUPO PARA MIRAR QUE QUEDE EN EL GRUPO  
BEGIN 
SPMARCARGRUPOS('eplaboral2009'); 
END; 



--------- XML DAÑADOS CON NEGRITA 

SELECT
    REGEXP_REPLACE(
        XML,
        '<Negrita>\[</Negrita>([[:space:]]|&nbsp;|&#160;)*§([[:space:]]|&nbsp;|&#160;)*<Negrita>([0-9]+(-[0-9]+)*\]([[:space:]]|&nbsp;|&#160;)*)</Negrita>',
        '[§  \3'
 ) AS XML_CORREGIDO, XML, IDCONTENIDO, GRUPO
FROM CONTENIDOPARRAFO
WHERE idcontenido = 'eptributario2009'
  AND REGEXP_LIKE(
        XML,
        '<Negrita>\[</Negrita>([[:space:]]|&nbsp;|&#160;)*§([[:space:]]|&nbsp;|&#160;)*<Negrita>[0-9]+'
      );
	  
--- UPDATE CORREGIR. 
UPDATE CONTENIDOPARRAFO
SET XML = REGEXP_REPLACE(
    XML,
    '<Negrita>\[</Negrita>([[:space:]]|&nbsp;|&#160;)*§([[:space:]]|&nbsp;|&#160;)*<Negrita>([0-9]+(-[0-9]+)*\]([[:space:]]|&nbsp;|&#160;)*)</Negrita>',
    '[§  \3'
)
WHERE idcontenido = 'eplaboral2009'
  AND REGEXP_LIKE(
        XML,
        '<Negrita>\[</Negrita>([[:space:]]|&nbsp;|&#160;)*§([[:space:]]|&nbsp;|&#160;)*<Negrita>[0-9]+'
      );	  
	  
	  -- CASO ESPECIAL JURISPRUDENCIA 	  
	  
	  SELECT
    REGEXP_REPLACE(
        XML,
        '(<Negrita>\[</Negrita>([[:space:]]|&nbsp;|&#160;)*§([[:space:]]|&nbsp;|&#160;)*)(<Negrita>|</Negrita>)*([0-9]+)(<Negrita>|</Negrita>)*([0-9A-Z\-]*)(<Negrita>|</Negrita>)*(\])([[:space:]]|&nbsp;|&#160;)*(</Negrita>)?([[:space:]]|&nbsp;|&#160;)*JURISPRUDENCIA',
        '[§  \5\7] JURISPRUDENCIA'
    ) AS XML_CORREGIDO, XML, IDCONTENIDO, GRUPO
FROM CONTENIDOPARRAFO
WHERE IDCONTENIDO = 'eplaboral2009'
  AND REGEXP_LIKE(
        XML,
        '<Negrita>\[</Negrita>([[:space:]]|&nbsp;|&#160;)*§([[:space:]]|&nbsp;|&#160;)*<Negrita>[0-9]'
      ) AND xml LIKE '%JURIS%';
	  
     
     
UPDATE CONTENIDOPARRAFO
SET XML = REGEXP_REPLACE(
    XML,
    '(<Negrita>\[</Negrita>([[:space:]]|&nbsp;|&#160;)*§([[:space:]]|&nbsp;|&#160;)*)(<Negrita>|</Negrita>)*([0-9]+)(<Negrita>|</Negrita>)*([0-9A-Z\-]*)(<Negrita>|</Negrita>)*(\])([[:space:]]|&nbsp;|&#160;)*(</Negrita>)?([[:space:]]|&nbsp;|&#160;)*JURISPRUDENCIA',
    '[§  \5\7] JURISPRUDENCIA'
)
WHERE IDCONTENIDO = 'eplaboral2009'
  AND REGEXP_LIKE(
        XML,
        '<Negrita>\[</Negrita>([[:space:]]|&nbsp;|&#160;)*§([[:space:]]|&nbsp;|&#160;)*<Negrita>[0-9]'
      ) AND xml LIKE '%JURIS%';	  
	  
	  
	  	  -- CASO ESPECIAL DOCTRINA  	 
		  
		  SELECT
    REGEXP_REPLACE(
        XML,
        '<Negrita>\[</Negrita>([[:space:]]|&nbsp;|&#160;)*§([[:space:]]|&nbsp;|&#160;)*((<Negrita>|</Negrita>)*[0-9A-Z\-]+(<Negrita>|</Negrita>)*)+\]([[:space:]]|&nbsp;|&#160;)*(DOCTRINA)([[:space:]]|&nbsp;|&#160;)*\.?([[:space:]]|&nbsp;|&#160;)*(—|–|-|â€”|&#8212;|&#x2014;)(</Negrita>)?',
        '[§  \3] DOCTRINA.—'
    ) AS XML_CORREGIDO
FROM CONTENIDOPARRAFO
WHERE IDCONTENIDO = 'eplaboral2009'
  AND REGEXP_LIKE(
        XML,
        '<Negrita>\[</Negrita>([[:space:]]|&nbsp;|&#160;)*§'
      );
	  
	  
	  
	  
	  
	  UPDATE CONTENIDOPARRAFO
SET XML = REGEXP_REPLACE(
    XML,
    '<Negrita>\[</Negrita>([[:space:]]|&nbsp;|&#160;)*§([[:space:]]|&nbsp;|&#160;)*<Negrita>([0-9]+(-[0-9]+)*[A-Z]?)\]([[:space:]]|&nbsp;|&#160;)*DOCTRINA([[:space:]]|&nbsp;|&#160;)*\.?([[:space:]]|&nbsp;|&#160;)*(—|–|-|â€”|&#8212;|&#x2014;)</Negrita>',
    '[§  \3] DOCTRINA.—'
)
WHERE IDCONTENIDO = 'eplaboral2009'
  AND REGEXP_LIKE(
        XML,
        '<Negrita>\[</Negrita>([[:space:]]|&nbsp;|&#160;)*§([[:space:]]|&nbsp;|&#160;)*<Negrita>[0-9]+'
      );
	  
	  
	  
	  ---- COMENTARIO 