ALTER SESSION SET CURRENT_SCHEMA = "SPCUSER";

SELECT * FROM contenido WHERE idcontenido= 'cgproceso';
SELECT * FROM CONTENIDO WHERE NOMCONTENIDO LIKE UPPER('%Procedimiento tributario%');



UPDATE CONTENIDOCONTROLCAMBIOS
   SET FLAGBORRADO = 1
WHERE IDCONTENIDO = 'protribu' ;

UPDATE CONTENIDOPARRAFO
   SET FLAGBORRADO = 2
WHERE IDCONTENIDO = 'protribu'
AND FLAGBORRADO = 1 ;

UPDATE CONTENIDOPARRAFO
   SET XML = REGEXP_REPLACE(XML,
                            '(<\?xm-insertion_mark_start\s.*?\?>)|(<\?xm-insertion_mark_end\s*\?>)|(<\?xm-deletion_mark\s.*?\?>)',
                            '')
WHERE IDCONTENIDO = 'protribu';



SELECT ID FROM CONTENIDOCONTROLCAMBIOS
 WHERE  FLAGBORRADO=0  and IDCONTENIDO in 
 ('protribu'); 