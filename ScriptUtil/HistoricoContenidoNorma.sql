select * from 
 HistoricoContenidoNorma hn
inner join ContenidoNorma cn  on cn.IDCONTENIDONORMA=hn.CODCONTENIDONORMA
where CODCONTENIDO ='protribu'-- and FECHAINICIOVIGENCIA='2019-11-23 00:00:00.000'  and FECHAFINVIGENCIA='2019-12-31 00:00:00.000' 
and NOMBREARTICULO = '555'
--and FECHACREACION between '2022-01-14 06:40:41.793' and '2022-01-14 08:08:34.657'
order by FECHAINICIOVIGENCIA desc



/*
update hn set hn.FECHAINICIOVIGENCIA='2021-09-15 00:00:00.000'
 HistoricoContenidoNorma hn
inner join ContenidoNorma cn  on cn.IDCONTENIDONORMA=hn.CODCONTENIDONORMA
where CODCONTENIDO ='renta' and FECHAINICIOVIGENCIA='2021-09-16 00:00:00.000'  and FECHAFINVIGENCIA='2021-12-31 00:00:00.000' 


update hn set hn.FECHAFINVIGENCIA='2021-12-31 00:00:00.000'
from HistoricoContenidoNorma hn
inner join ContenidoNorma cn  on cn.IDCONTENIDONORMA=hn.CODCONTENIDONORMA
where CODCONTENIDO ='protribu' and FECHAFINVIGENCIA='2022-12-31 00:00:00.000' 
and FECHACREACION between '2022-01-11 09:00:39.017' and '2022-01-11 10:01:39.017'*/





/****** Script for SelectTopNRows command from SSMS  ******/
SELECT  [IDHISTORICOCONTENIDONORMA]
      ,[CODCONTENIDONORMA]
      ,[CODPARRAFOARTICULO]
      ,[NOMBREARTICULO]
      ,[FECHACREACION]
      ,[CODUSUARIO]
      ,[FECHAINICIOVIGENCIA]
      ,[FECHAFINVIGENCIA]
    
  FROM [LPP_HISTORICO_NORMAS].[dbo].[HistoricoContenidoNorma] where CODCONTENIDONORMA in  (703)-- and NOMBREARTICULO = '600'
  and xml like '%<TABLE width="%[%]%<tr%<td%</td%<td%</td%<td%</td%<td%</td%</tr%'


  SELECT * FROM [HistoricoContenidoNorma] WHERE CODCONTENIDONORMA in  (703) and IDHISTORICOCONTENIDONORMA IN (2198791
,2198798)






SELECT IDHISTORICOCONTENIDONORMA
  FROM [LPP_HISTORICO_NORMAS].[dbo].[HistoricoContenidoNorma] where CODCONTENIDONORMA in  (703)
  --and NOMBREARTICULO = '600'
  and xml like 
  '%<TABLE width="40[%]%<tr%<td%</td%<td%</td%<td%</td%<td%</td%</tr%'

SELECT IDHISTORICOCONTENIDONORMA
  FROM [LPP_HISTORICO_NORMAS].[dbo].[HistoricoContenidoNorma] where CODCONTENIDONORMA in  (703)
  --and NOMBREARTICULO = '600'
  and xml like '%<table width="50[%]" cellpadding="0" cellspacing="0" border="1"%'

SELECT IDHISTORICOCONTENIDONORMA
  FROM [LPP_HISTORICO_NORMAS].[dbo].[HistoricoContenidoNorma] where CODCONTENIDONORMA in  (703)
  and IDHISTORICOCONTENIDONORMA in (
  and xml like '%<table width="80[%]" cellpadding="0" cellspacing="0" border="1"%'
     










select [IDHISTORICOCONTENIDONORMA],[CODCONTENIDONORMA],[CODPARRAFOARTICULO],[NOMBREARTICULO]
                                     ,[FECHACREACION], '' as XML,[CODUSUARIO],[FECHAINICIOVIGENCIA],[FECHAFINVIGENCIA],[CONTEXTOARBOL]
                                     ,[ACTUAL],[TIENECAMBIO]
                                  from ContenidoNorma cn
                                  inner  join HistoricoContenidoNorma hcn on cn.IDCONTENIDONORMA = hcn.CODCONTENIDONORMA                                  
                                  where CODCONTENIDO = 'renta' AND NOMBRENORMA='RESOLUCIÓN 71 DE 2019' AND NOMBREARTICULO='894' AND hcn.ACTUAL = 0 AND ISNULL(hcn.FECHAFINVIGENCIA, '') <> ''
                                  union all 
                                  select [IDHISTORICOCONTENIDONORMA],[CODCONTENIDONORMA],[CODPARRAFOARTICULO],[NOMBREARTICULO]
                                     ,[FECHACREACION], '' as XML,[CODUSUARIO],[FECHAINICIOVIGENCIA],[FECHAFINVIGENCIA],[CONTEXTOARBOL]
                                     ,[ACTUAL],[TIENECAMBIO]
                                  from ContenidoNorma cn
                                  inner  join HistoricoContenidoNorma hcn on cn.IDCONTENIDONORMA = hcn.CODCONTENIDONORMA                                  
                                  where CODCONTENIDO = 'renta' AND NOMBRENORMA='RESOLUCIÓN 71 DE 2019' AND NOMBREARTICULO='894' AND hcn.actual = 1;


								  select [IDHISTORICOCONTENIDONORMA],[CODCONTENIDONORMA],[CODPARRAFOARTICULO],[NOMBREARTICULO]
                                     ,[FECHACREACION], '' as XML,[CODUSUARIO],[FECHAINICIOVIGENCIA],[FECHAFINVIGENCIA],[CONTEXTOARBOL]
                                     ,[ACTUAL],[TIENECAMBIO]
                                  from ContenidoNorma cn
                                  inner  join HistoricoContenidoNorma hcn on cn.IDCONTENIDONORMA = hcn.CODCONTENIDONORMA                                  
                                  where CODCONTENIDO = 'renta' AND NOMBRENORMA='ESTATUTO TRIBUTARIO'
								  AND NOMBREARTICULO='594' AND hcn.ACTUAL = 0 AND ISNULL(hcn.FECHAFINVIGENCIA, '') <> ''
                                  union all 
                                  select [IDHISTORICOCONTENIDONORMA],[CODCONTENIDONORMA],[CODPARRAFOARTICULO],[NOMBREARTICULO]
                                     ,[FECHACREACION], '' as XML,[CODUSUARIO],[FECHAINICIOVIGENCIA],[FECHAFINVIGENCIA],[CONTEXTOARBOL]
                                     ,[ACTUAL],[TIENECAMBIO]
                                  from ContenidoNorma cn
                                  inner  join HistoricoContenidoNorma hcn on cn.IDCONTENIDONORMA = hcn.CODCONTENIDONORMA                                  
                                  where CODCONTENIDO = 'renta' AND NOMBRENORMA='ESTATUTO TRIBUTARIO' AND NOMBREARTICULO='594' AND hcn.actual = 1


--- malos
-- 11
  SELECT 
     CONCAT ('|| update [HistoricoContenidoNorma] set xml = ''', xml, 
	   ''' where CODCONTENIDONORMA in  (703) and IDHISTORICOCONTENIDONORMA = ' , 
	   IDHISTORICOCONTENIDONORMA, ';||') as upd 
  FROM [HistoricoContenidoNorma] WHERE CODCONTENIDONORMA in  (703) and IDHISTORICOCONTENIDONORMA IN (
8386392,8386404,8386434,8386443,114327,3637121,3637136,3637159,3637181,3637190,3637191)

-- 31
  SELECT	      CONCAT ('|| update [HistoricoContenidoNorma] set xml = ''', xml, 
	   ''' where CODCONTENIDONORMA in  (703) and IDHISTORICOCONTENIDONORMA = ' , 
	   IDHISTORICOCONTENIDONORMA, ';||') as upd 
	   FROM [HistoricoContenidoNorma] WHERE CODCONTENIDONORMA in  (703) and IDHISTORICOCONTENIDONORMA IN (
3637701,3637702,3637703,3637704,3637705,3638626,7349076,7349077,7349127,7349144
,7349172,7349201,7349233,7349267,7349269,7349282,7349285,2197578,2197875,2197891,5735397
,5735403,5735450,5735472,5735473,5735474,5735546,8386141,8386164,8386220,8386241)

-- 10
SELECT 	      CONCAT ('|| update [HistoricoContenidoNorma] set xml = ''', xml, 
	   ''' where CODCONTENIDONORMA in  (703) and IDHISTORICOCONTENIDONORMA = ' , 
	   IDHISTORICOCONTENIDONORMA, ';||') as upd 
	   FROM [HistoricoContenidoNorma] WHERE CODCONTENIDONORMA in  (703) and IDHISTORICOCONTENIDONORMA IN (
114441,114447,3637076,3637089,3637093,3637097,3637098,3637099,3637107,17934)


--14
SELECT 	      CONCAT ('|| update [HistoricoContenidoNorma] set xml = ''', xml, 
	   ''' where CODCONTENIDONORMA in  (703) and IDHISTORICOCONTENIDONORMA = ' , 
	   IDHISTORICOCONTENIDONORMA, ';||') as upd 
	   FROM [HistoricoContenidoNorma] WHERE CODCONTENIDONORMA in  (703) and IDHISTORICOCONTENIDONORMA IN (
8385894,8385925,8385945,8385961,8385989,8386018,8386050,8386068,8386084,8386086,8386099
,8386102,8386107,8386110)






-- todos

	 -- 33
	   SELECT 
	   CONCAT ('|| update [HistoricoContenidoNorma] set xml = ''', xml, 
	   ''' where CODCONTENIDONORMA in  (703) and IDHISTORICOCONTENIDONORMA = ' , 
	   IDHISTORICOCONTENIDONORMA, ';||') as upd 
	   FROM [HistoricoContenidoNorma] WHERE CODCONTENIDONORMA in  (703) and IDHISTORICOCONTENIDONORMA IN (
  2198791,2198798,2349260,5735804,5735985,5736015,5736020,5736025,7349290,7349293,7349347
,7349403,7349424,2349506,2349512,3637532,3637577,3637621,6909467,7349000,7349006,7349053
,8385818,8385824,8385830,2193261,3637345,3637351,3637366,3637387,7349587,7349617,7349627)

--12
SELECT 	      CONCAT ('|| update [HistoricoContenidoNorma] set xml = ''', xml, 
	   ''' where CODCONTENIDONORMA in  (703) and IDHISTORICOCONTENIDONORMA = ' , 
	   IDHISTORICOCONTENIDONORMA, ';||') as upd 
	   FROM [HistoricoContenidoNorma] WHERE CODCONTENIDONORMA in  (703) and IDHISTORICOCONTENIDONORMA IN (
2349330
,2349392,5735635,5735669,5735675,5735684,5735687,5735691,5735694,5735748,8385871,8385893)


-- 21
SELECT 	      CONCAT ('|| update [HistoricoContenidoNorma] set xml = ''', xml, 
	   ''' where CODCONTENIDONORMA in  (703) and IDHISTORICOCONTENIDONORMA = ' , 
	   IDHISTORICOCONTENIDONORMA, ';||') as upd 
  FROM [HistoricoContenidoNorma] WHERE CODCONTENIDONORMA in  (703) and IDHISTORICOCONTENIDONORMA IN (
3637197,3637198,3637202,3637203,3637204,3637214,3637221,3637228,3637301,3637302,3637307
,3637311,3637316,2349851,2349854,2349855,3637687,3637690,3637695,3637699,3637700)


-- 11
  SELECT 
     CONCAT ('|| update [HistoricoContenidoNorma] set xml = ''', xml, 
	   ''' where CODCONTENIDONORMA in  (703) and IDHISTORICOCONTENIDONORMA = ' , 
	   IDHISTORICOCONTENIDONORMA, ';||') as upd 
  FROM [HistoricoContenidoNorma] WHERE CODCONTENIDONORMA in  (703) and IDHISTORICOCONTENIDONORMA IN (
8386392,8386404,8386434,8386443,114327,3637136,3637159,3637181,3637190,3637191)

-- 31
  SELECT	      CONCAT ('|| update [HistoricoContenidoNorma] set xml = ''', xml, 
	   ''' where CODCONTENIDONORMA in  (703) and IDHISTORICOCONTENIDONORMA = ' , 
	   IDHISTORICOCONTENIDONORMA, ';||') as upd 
	   FROM [HistoricoContenidoNorma] WHERE CODCONTENIDONORMA in  (703) and IDHISTORICOCONTENIDONORMA IN (
3637701,3637702,3637703,3637704,3637705,3638626,7349076,7349077,7349144
,7349172,7349201,7349233,7349267,7349269,7349282,7349285,2197578,2197875,2197891,5735397
,5735403,5735450,5735472,5735473,5735474,5735546,8386141,8386164,8386220,8386241)

-- 10
SELECT 	      CONCAT ('|| update [HistoricoContenidoNorma] set xml = ''', xml, 
	   ''' where CODCONTENIDONORMA in  (703) and IDHISTORICOCONTENIDONORMA = ' , 
	   IDHISTORICOCONTENIDONORMA, ';||') as upd 
	   FROM [HistoricoContenidoNorma] WHERE CODCONTENIDONORMA in  (703) and IDHISTORICOCONTENIDONORMA IN (
114441,114447,3637089,17934)


--14
SELECT 	      CONCAT ('|| update [HistoricoContenidoNorma] set xml = ''', xml, 
	   ''' where CODCONTENIDONORMA in  (703) and IDHISTORICOCONTENIDONORMA = ' , 
	   IDHISTORICOCONTENIDONORMA, ';||') as upd 
	   FROM [HistoricoContenidoNorma] WHERE CODCONTENIDONORMA in  (703) and IDHISTORICOCONTENIDONORMA IN (
8385894,8385961,8386018,8386050,8386068,8386084,8386086,8386099
,8386102,8386107,8386110)







-- 20 -80%
SELECT 
     CONCAT ('|| update [HistoricoContenidoNorma] set xml = ''', xml, 
	   ''' where CODCONTENIDONORMA in  (703) and IDHISTORICOCONTENIDONORMA = ' , 
	   IDHISTORICOCONTENIDONORMA, ';||') as upd 
  FROM [LPP_HISTORICO_NORMAS].[dbo].[HistoricoContenidoNorma] where CODCONTENIDONORMA in  (703)
  and IDHISTORICOCONTENIDONORMA in (2198791
,2349851,2349854,2198798,5735684,5735687,5735691,5735694,5735748,5736025
,7349172,6909467,7349201,7349233,7349269,7349282,7349285,8387241,8387808
)


  and xml like '%<table width="80[%]" cellpadding="0" cellspacing="0" border="1"%'


 -- 13 80%
  SELECT 
     CONCAT ('|| update [HistoricoContenidoNorma] set xml = ''', xml, 
	   ''' where CODCONTENIDONORMA in  (703) and IDHISTORICOCONTENIDONORMA = ' , 
	   IDHISTORICOCONTENIDONORMA, ';||') as upd 
  FROM [LPP_HISTORICO_NORMAS].[dbo].[HistoricoContenidoNorma] where CODCONTENIDONORMA in  (703)
  and IDHISTORICOCONTENIDONORMA in (  8387859,2349512,7349290,7349293,7349347,
7349424,114447 ,114441 ,8387557,8387580,8387657,2197891,7349627) and xml like '%<table width="80[%]" cellpadding="0" cellspacing="0" border="1"%'

-- 6 80%
  SELECT 
     CONCAT ('|| update [HistoricoContenidoNorma] set xml = ''', xml, 
	   ''' where CODCONTENIDONORMA in  (703) and IDHISTORICOCONTENIDONORMA = ' , 
	   IDHISTORICOCONTENIDONORMA, ';||') as upd 
  FROM [LPP_HISTORICO_NORMAS].[dbo].[HistoricoContenidoNorma] where CODCONTENIDONORMA in  (703)
  and IDHISTORICOCONTENIDONORMA in (  
8387310,8387434,8387466) and xml like '%<table width="80[%]" cellpadding="0" cellspacing="0" border="1"%'
-- 6
  SELECT 
     CONCAT ('|| update [HistoricoContenidoNorma] set xml = ''', xml, 
	   ''' where CODCONTENIDONORMA in  (703) and IDHISTORICOCONTENIDONORMA = ' , 
	   IDHISTORICOCONTENIDONORMA, ';||') as upd 
  FROM [LPP_HISTORICO_NORMAS].[dbo].[HistoricoContenidoNorma] where CODCONTENIDONORMA in  (703)
  and IDHISTORICOCONTENIDONORMA in (  
8387484,8387502,8387515,8387518,8387523,8387526) and xml like '%<table width="80[%]" cellpadding="0" cellspacing="0" border="1"%'