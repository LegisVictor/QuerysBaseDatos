------------------------------------------------------
-- Error en cargue de segmento del documento .. la configuracion esta en el paquete de la solucion del cliente 
-- Cliente optimus -> xmetal.dtd
-------------------------------------------------------
--Puede que existan caracteres tales como: 
--&amp...
--&
--Deberian ser &amp; 

--<link ...> </link> Deberian ser <Link ...> </Link>
--<negrita ...> </negrita> Deberian ser <Negrita ...> </Negrita>



SELECT IDCONTENIDO, id, IDANTERIOR, IDSIGUIENTE, ordinal, XML
FROM CONTENIDOPARRAFO c
WHERE c.IDCONTENIDO = 'eppenal2009'
 AND    XML    LIKE '%Negrita%' --  es &amp;
AND    XML  NOT  LIKE '%&amp;%' -- no es &amp;
AND   XML NOT LIKE '%&lt;%'  -- no es &lt;
AND   XML not LIKE '%&gt;%'  -- no es &gt;
 AND  XML not LIKE '%&quot;%'-- no es &quot;
 AND  XML not LIKE '%&apos;%'-- no es &apos;
 AND   XML not LIKE '%&nbsp;%'-- no es &apos;
ORDER BY ordinal DESC;



SELECT IDCONTENIDO, id, IDANTERIOR, IDSIGUIENTE, ordinal, XML
FROM CONTENIDOPARRAFO c
WHERE c.IDCONTENIDO = 'eppenal2009'
 AND    XML    LIKE '%<br>%'

UPDATE CONTENIDOPARRAFO SET xml = replace(xml,'conforme al  </Negrita>', 'conforme al') WHERE  IDCONTENIDO = 'eptributario2009' 
and id='xeptributario2009.cb4274799b3d8bc921b09f263ca280ce'; 




SELECT 
    IDCONTENIDO,
    id,
    IDANTERIOR,
    IDSIGUIENTE,
    ordinal,
    XML,
    (LENGTH(XML) - LENGTH(REPLACE(XML, '<Negrita>', ''))) / LENGTH('<Negrita>') AS AperturasNegrita,
    (LENGTH(XML) - LENGTH(REPLACE(XML, '</Negrita>', ''))) / LENGTH('</Negrita>') AS CierresNegrita
FROM CONTENIDOPARRAFO c
WHERE c.IDCONTENIDO = 'eptributario2009'
  AND (
        (LENGTH(XML) - LENGTH(REPLACE(XML, '<Negrita>', ''))) / LENGTH('<Negrita>')
        <>
        (LENGTH(XML) - LENGTH(REPLACE(XML, '</Negrita>', ''))) / LENGTH('</Negrita>')
      );

