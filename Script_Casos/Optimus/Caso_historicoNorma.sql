select   nombrearticulo,   nombrenorma

from HistoricoContenidoNorma hn
inner join ContenidoNorma cn  on cn.IDCONTENIDONORMA=hn.CODCONTENIDONORMA
where CODCONTENIDO ='ventas' and CODUSUARIO = 9585 -- and nombrenorma <> 'ESTATUTO TRIBUTARIO' 
and fechainiciovigencia = '2025-01-01 00:00:00.000' and fechafinvigencia = '2026-01-06 00:00:00.000'

order by 1 desc

