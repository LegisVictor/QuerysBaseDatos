---****************************************************************************
---** CASO: ERROR AL GUARDAR DOCUMENTOS. SUCEDE O SE DA POR CARACTERES ESPECIALES, 
---****************************************************************************


SELECT c.*,  REPLACE(xml, 
'valign="&apos;"', 
'valign=""') 
FROM contenidoparrafo C

WHERE idcontenido = 'nifgrupo3' AND id IN 
('xnifgrupo3.ddfc92bbaaf643338ba8098552de5d22')




-- update 

UPDATE  contenidoparrafo 
SET XML=REPLACE(xml, 
'valign="&"', 
'valign="&amp;"') 
WHERE idcontenido = 'nifgrupo3' AND id IN 
('xnifgrupo3.ddfc92bbaaf643338ba8098552de5d22'); 
